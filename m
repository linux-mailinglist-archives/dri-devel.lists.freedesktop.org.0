Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1D3B27C9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0612B6EA0F;
	Thu, 24 Jun 2021 06:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CBA6E9F4;
 Thu, 24 Jun 2021 06:47:29 +0000 (UTC)
IronPort-SDR: 4lLl3m5OfAHoyWUhD2KOAyYL2q16ETLqeh+1RIG04g1l5Sz7XGpUH8tQAdHXhpRXiKsFzzjkN6
 FLgUjyKXGdWg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346748"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346748"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: V0vA7m+sdPZBY1L1r+WqrdCZHO560YxAZmRbBTn/q1EEPLX7uIwh7PLjXNejJ9dTLr27GHwhMu
 rZKB20Yc4tFQ==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390887"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/47] drm/i915/guc: Module load failure test for CT buffer
 creation
Date: Thu, 24 Jun 2021 00:04:36 -0700
Message-Id: <20210624070516.21893-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Add several module failure load inject points in the CT buffer creation
code path.

Signed-off-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 1fd5c69358ef..8e0ed7d8feb3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -175,6 +175,10 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
 {
 	int err;
 
+	err = i915_inject_probe_error(guc_to_gt(ct_to_guc(ct))->i915, -ENXIO);
+	if (unlikely(err))
+		return err;
+
 	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
 					    desc_addr, buff_addr, size);
 	if (unlikely(err))
@@ -226,6 +230,10 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 	u32 *cmds;
 	int err;
 
+	err = i915_inject_probe_error(guc_to_gt(guc)->i915, -ENXIO);
+	if (err)
+		return err;
+
 	GEM_BUG_ON(ct->vma);
 
 	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
-- 
2.28.0

