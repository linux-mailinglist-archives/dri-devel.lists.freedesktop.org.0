Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E3674AF0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F16410EA1D;
	Fri, 20 Jan 2023 04:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E710EA1F;
 Fri, 20 Jan 2023 04:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189718; x=1705725718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2bJMximn5JRl9zzNLh0rMW3alpb+Ns4e1pkIiwDnu4=;
 b=dWaZuiWJzqjGnqlunubKwZPPA1EQONYT7rvNcU/LGeXNKFnmViz/jsay
 zSp0/YiI+6JewLezWkkvYfKEZA7ibaFhRP4qFjkEQoKz3EwasyDG52k6z
 Cau+YUWqcj6vJ4WvmN+Cvh9CEze+Wc7z7yNjhHgJhx9iqHdPOJi2oerFN
 i0FPumQzmMPNp4KlY094xNuJ4QtTV6SLxaQi6k2lzdd/t1uJ+QuI4bFWH
 HbcFVrzYnTBuz0HYfRZhQ2V+4lKNgxFGux6oGUn7nQp4PCiZbEnN1S6Bf
 C/ypmII/2m8J4PZg5zWSs2gQydS1+dLDYopGkBrZsR6HypmmESGLf0YtN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195460"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734913"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734913"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:56 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/16] drm/i915/dp: Avoid forcing DSC BPC for MST case
Date: Fri, 20 Jan 2023 10:08:30 +0530
Message-Id: <20230120043844.3761895-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MST the bpc is hardcoded to 8, and pipe bpp to 24.
So avoid forcing DSC bpc for MST case.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 11 +++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  8 ++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 93aebd3683a4..3d828ea0894d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1500,14 +1500,13 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
 		return -EINVAL;
 
-	if (compute_pipe_bpp)
+	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
+		pipe_bpp = intel_dp->force_dsc_bpc * 3;
+		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
+	} else if (compute_pipe_bpp) {
 		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	else
+	} else {
 		pipe_bpp = pipe_config->pipe_bpp;
-
-	if (intel_dp->force_dsc_bpc) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
 	}
 
 	/* Min Input BPC for ICL+ is 8 */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 8b0e4defa3f1..9be04c60cced 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -325,6 +325,14 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	/* enable compression if the mode doesn't fit available BW */
 	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
 	if (ret || intel_dp->force_dsc_en) {
+		if (intel_dp->force_dsc_bpc) {
+			/*
+			 * FIXME: As bpc is hardcoed to 8 bpc as mentioned above,
+			 * Avoid force BPC for now.
+			 */
+			drm_dbg_kms(&dev_priv->drm, "Cannot Force BPC for MST\n");
+			return -EINVAL;
+		}
 		/*
 		 * Try to get at least some timeslots and then see, if
 		 * we can fit there with DSC.
-- 
2.25.1

