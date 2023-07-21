Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637375D10A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 20:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B145410E6E1;
	Fri, 21 Jul 2023 18:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A8B10E6E1;
 Fri, 21 Jul 2023 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689962715; x=1721498715;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ZqF3U1eErgTFPFgJWh/6ybWGKI3dikgMvv1F5KCPHM=;
 b=d5dzjeQkG+4acGTwaM+Xr5d/nWUQ7iJic/IdGrDteFEz6KORIZ2cWcEl
 lfVlWZW5VGNUJZw/NkxlLeBprCFkFJN3WgOjZBT31/V/nR5omG13zG5ZH
 peJtcWC2k8ZrhvOWzuZxuBHRRgf6QCDz+lK+AOFsqK6PUZjmBRDQwhPA0
 mOSijLJ1jWsoNAUjz6Ki9eiyUJOYVJMlu78SyBLcfy64rsIlyGaYyxBWS
 iiU3YcnH9+uMxznWEh+T/ZDNYZ1mlH0JKPMgDMnH7mwTXtFfoplHHaIfo
 dkMeOiG1OnuRLss8AipDo0v3wO7FCEkxD0gCq4QgzUZZRxfqiIS6Zr0Cd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430875075"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="430875075"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838650970"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="838650970"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 11:05:14 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Restore efficient freq earlier
Date: Fri, 21 Jul 2023 11:03:49 -0700
Message-Id: <20230721180349.1737284-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This should be done before the soft min/max frequencies are restored.
When we disable the "Ignore efficient frequency" flag, GuC does not
actually bring the requested freq down to RPn.

Specifically, this scenario-

- ignore efficient freq set to true
- reduce min to RPn (from efficient)
- suspend
- resume (includes GuC load, restore soft min/max, restore efficient freq)
- validate min freq has been resored to RPn

This will fail if we didn't first restore(disable, in this case) efficient
freq flag before setting the soft min frequency.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index ee9f83af7cf6..f16dff7c3185 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -743,6 +743,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	intel_guc_pm_intrmsk_enable(slpc_to_gt(slpc));
 
+	/* Set cached value of ignore efficient freq */
+	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
+
 	slpc_get_rp_values(slpc);
 
 	/* Handle the case where min=max=RPmax */
@@ -765,9 +768,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set cached media freq ratio mode */
 	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
 
-	/* Set cached value of ignore efficient freq */
-	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
-
 	return 0;
 }
 
-- 
2.38.1

