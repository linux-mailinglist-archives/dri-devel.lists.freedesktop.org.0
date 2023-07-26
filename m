Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B087627F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 03:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDED10E400;
	Wed, 26 Jul 2023 01:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57D10E400;
 Wed, 26 Jul 2023 01:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690333357; x=1721869357;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tRIUDnMvGcObFqxBFVqWiSwJ9Iv+Da5oipyGZKbNDU0=;
 b=OzeGzm1NF7qMeHktraSmz2gyblelW6vfH37m0M0xquJ135J4XGuvDddN
 y1G9NtwLrkv2OxtzJviw+kI3oW8AKiIbiCMq+mEVQ4QnEJN6TgvUbuAO/
 eeYJM3FQ3HlCc1upE2hgM8rS34LZcwjPM8EigSEgKmPZZkvwZIu4SRuWc
 6cIUYmitzkdwv7R2Ksq5PQJazvl01+em6mtpsu8eBnpAqD12awNhczIuR
 /3uJNfanlnnqEsfuwQ3A+hQonGe4M7whrIFko90ZM4t7PR/PBoWIIz5JG
 xYjC6hU3hZOIuckf8o3iXwW0DsBPVCwx4MoWG2ehgAURERp8h90pGP+TU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="431686279"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="431686279"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 18:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900186575"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="900186575"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga005.jf.intel.com with ESMTP; 25 Jul 2023 18:02:36 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/guc/slpc: Restore efficient freq earlier
Date: Tue, 25 Jul 2023 18:00:44 -0700
Message-Id: <20230726010044.3280402-1-vinay.belgaumkar@intel.com>
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

v2: Bring the min freq down to RPn when we disable efficient freq (Rodrigo)
Also made the change to set the min softlimit to RPn at init. Otherwise, we
were storing RPe there.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8736
Fixes: 55f9720dbf23 ("drm/i915/guc/slpc: Provide sysfs for efficient freq")
Fixes: 95ccf312a1e4 ("drm/i915/guc/slpc: Allow SLPC to use efficient frequency")
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 22 +++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index ee9f83af7cf6..477df260ae3a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -470,12 +470,19 @@ int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val)
 	ret = slpc_set_param(slpc,
 			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
 			     val);
-	if (ret)
+	if (ret) {
 		guc_probe_error(slpc_to_guc(slpc), "Failed to set efficient freq(%d): %pe\n",
 				val, ERR_PTR(ret));
-	else
+	} else {
 		slpc->ignore_eff_freq = val;
 
+		/* Set min to RPn when we disable efficient freq */
+		if (val)
+			ret = slpc_set_param(slpc,
+					     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
+					     slpc->min_freq);
+	}
+
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 	mutex_unlock(&slpc->lock);
 	return ret;
@@ -602,9 +609,8 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 		return ret;
 
 	if (!slpc->min_freq_softlimit) {
-		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
-		if (unlikely(ret))
-			return ret;
+		/* Min softlimit is initialized to RPn */
+		slpc->min_freq_softlimit = slpc->min_freq;
 		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
 	} else {
 		return intel_guc_slpc_set_min_freq(slpc,
@@ -755,6 +761,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 		return ret;
 	}
 
+	/* Set cached value of ignore efficient freq */
+	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
+
 	/* Revert SLPC min/max to softlimits if necessary */
 	ret = slpc_set_softlimits(slpc);
 	if (unlikely(ret)) {
@@ -765,9 +774,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set cached media freq ratio mode */
 	intel_guc_slpc_set_media_ratio_mode(slpc, slpc->media_ratio_mode);
 
-	/* Set cached value of ignore efficient freq */
-	intel_guc_slpc_set_ignore_eff_freq(slpc, slpc->ignore_eff_freq);
-
 	return 0;
 }
 
-- 
2.38.1

