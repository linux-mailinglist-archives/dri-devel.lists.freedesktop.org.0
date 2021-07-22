Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576423D3075
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 01:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22B16F5AF;
	Thu, 22 Jul 2021 23:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BE36F5A2;
 Thu, 22 Jul 2021 23:36:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="208659271"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="208659271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="470860945"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:36:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/33] drm/i915/guc: Enable the timer expired interrupt for GuC
Date: Thu, 22 Jul 2021 16:54:07 -0700
Message-Id: <20210722235426.31831-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210722235426.31831-1-matthew.brost@intel.com>
References: <20210722235426.31831-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GuC can implement execution qunatums, detect hung contexts and
other such things but it requires the timer expired interrupt to do so.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 06e9a8ed4e03..0c8e7f2b06f0 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1877,6 +1877,10 @@ void intel_rps_init(struct intel_rps *rps)
 
 	if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) < 11)
 		rps->pm_intrmsk_mbz |= GEN8_PMINTR_DISABLE_REDIRECT_TO_GUC;
+
+	/* GuC needs ARAT expired interrupt unmasked */
+	if (intel_uc_uses_guc_submission(&rps_to_gt(rps)->uc))
+		rps->pm_intrmsk_mbz |= ARAT_EXPIRED_INTRMSK;
 }
 
 void intel_rps_sanitize(struct intel_rps *rps)
-- 
2.28.0

