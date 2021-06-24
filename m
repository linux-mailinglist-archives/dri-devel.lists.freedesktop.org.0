Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AF3B27B6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ABD6EA07;
	Thu, 24 Jun 2021 06:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409C96E9F5;
 Thu, 24 Jun 2021 06:47:29 +0000 (UTC)
IronPort-SDR: /JpwK9SzZSWbN6QqpuuF9JMsSKQ+xjVeJYTVcacMQx09Bp8kDV6dzsF1bxMrIDJKbZDwt4BDR1
 PISnyU/N7YRA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346740"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346740"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
IronPort-SDR: hKhHLC87/SJ25iW0Znc97ZgK6bw1XBtFEQkA1otWjz2zkiXCWj8wsens6VQJHYA4RYknfBg8Qj
 SCO4lr+k9DGQ==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390867"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/47] drm/i915/guc: Relax CTB response timeout
Date: Thu, 24 Jun 2021 00:04:30 -0700
Message-Id: <20210624070516.21893-2-matthew.brost@intel.com>
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

In upcoming patch we will allow more CTB requests to be sent in
parallel to the GuC for processing, so we shouldn't assume any more
that GuC will always reply without 10ms.

Use bigger value hardcoded value of 1s instead.

v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
v3:
 (Daniel Vetter)
  - Use hardcoded value of 1s rather than config option

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 43409044528e..a59e239497ee 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -474,14 +474,16 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	/*
 	 * Fast commands should complete in less than 10us, so sample quickly
 	 * up to that length of time, then switch to a slower sleep-wait loop.
-	 * No GuC command should ever take longer than 10ms.
+	 * No GuC command should ever take longer than 10ms but many GuC
+	 * commands can be inflight at time, so use a 1s timeout on the slower
+	 * sleep-wait loop.
 	 */
 #define done \
 	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
 	 GUC_HXG_ORIGIN_GUC)
 	err = wait_for_us(done, 10);
 	if (err)
-		err = wait_for(done, 10);
+		err = wait_for(done, 1000);
 #undef done
 
 	if (unlikely(err))
-- 
2.28.0

