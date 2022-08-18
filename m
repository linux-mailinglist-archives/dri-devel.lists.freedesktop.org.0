Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA859915E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AE210EA01;
	Thu, 18 Aug 2022 23:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6308E10E5B5;
 Thu, 18 Aug 2022 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866152; x=1692402152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m1pad3LafAg6L1nBsH000gwE3m5ek3/dlfoDoEaomsY=;
 b=SB3PZWFb373PTUHvA+n0L4mBt9KCVih1cpHiPw+VMzfB3D7TxJFdpIoj
 X3O4gLNxquJXIlCOrGqADnvWTAp8nBVf0U1bQMELwaxtBo3erv9rpVvTC
 Jo5eYJ0j/glb8cCo6QggfRQWwEOmjuBeXqcqX0+PjiYf6YdN6qNSfkVZM
 t60ZYankZzE2+x8R8T285B5buuIfR2JhBHYlaeJmEbJAzZ6krGZnOYWgb
 7aJUEPoAYvVbzAmCQtFjdbZywHfcIOYFx4FBMR+DIVzNZkEe8BQARR+Av
 TNeVhXRm/rpb5O+RTujLUb8354pLVa4U7ii+jlq+uX9XlssiKmOK9cMkX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938526"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938526"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953301"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 16/21] drm/i915/mtl: Update memory bandwidth parameters
Date: Thu, 18 Aug 2022 16:41:57 -0700
Message-Id: <20220818234202.451742-17-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like ADL_P, Meteorlake has different memory characteristics from
past platforms. Update the values used by our memory bandwidth
calculations accordingly.

Bspec: 64631

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 40 +++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 46b63afd536a..0182f0948fb9 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -183,7 +183,32 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 	qi->num_points = dram_info->num_qgv_points;
 	qi->num_psf_points = dram_info->num_psf_gv_points;
 
-	if (DISPLAY_VER(dev_priv) >= 12)
+	if (DISPLAY_VER(dev_priv) >= 14) {
+		switch (dram_info->type) {
+		case INTEL_DRAM_DDR4:
+			qi->t_bl = 4;
+			qi->max_numchannels = 2;
+			qi->channel_width = 64;
+			qi->deinterleave = 2;
+			break;
+		case INTEL_DRAM_DDR5:
+			qi->t_bl = 8;
+			qi->max_numchannels = 4;
+			qi->channel_width = 32;
+			qi->deinterleave = 2;
+			break;
+		case INTEL_DRAM_LPDDR4:
+		case INTEL_DRAM_LPDDR5:
+			qi->t_bl = 16;
+			qi->max_numchannels = 8;
+			qi->channel_width = 16;
+			qi->deinterleave = 4;
+			break;
+		default:
+			MISSING_CASE(dram_info->type);
+			return -EINVAL;
+		}
+	} else if (DISPLAY_VER(dev_priv) >= 12) {
 		switch (dram_info->type) {
 		case INTEL_DRAM_DDR4:
 			qi->t_bl = is_y_tile ? 8 : 4;
@@ -217,7 +242,7 @@ static int icl_get_qgv_points(struct drm_i915_private *dev_priv,
 			qi->max_numchannels = 1;
 			break;
 		}
-	else if (DISPLAY_VER(dev_priv) == 11) {
+	} else if (DISPLAY_VER(dev_priv) == 11) {
 		qi->t_bl = dev_priv->dram_info.type == INTEL_DRAM_DDR4 ? 4 : 8;
 		qi->max_numchannels = 1;
 	}
@@ -316,6 +341,13 @@ static const struct intel_sa_info adlp_sa_info = {
 	.derating = 20,
 };
 
+static const struct intel_sa_info mtl_sa_info = {
+	.deburst = 32,
+	.deprogbwlimit = 38, /* GB/s */
+	.displayrtids = 256,
+	.derating = 20,
+};
+
 static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel_sa_info *sa)
 {
 	struct intel_qgv_info qi = {};
@@ -590,7 +622,9 @@ void intel_bw_init_hw(struct drm_i915_private *dev_priv)
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
-	if (IS_DG2(dev_priv))
+	if (DISPLAY_VER(dev_priv) >= 14)
+		tgl_get_bw_info(dev_priv, &mtl_sa_info);
+	else if (IS_DG2(dev_priv))
 		dg2_get_bw_info(dev_priv);
 	else if (IS_ALDERLAKE_P(dev_priv))
 		tgl_get_bw_info(dev_priv, &adlp_sa_info);
-- 
2.25.1

