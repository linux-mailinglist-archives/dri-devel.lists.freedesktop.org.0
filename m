Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD81ADCA0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 13:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A877D6EBAE;
	Fri, 17 Apr 2020 11:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02DD6EBAD;
 Fri, 17 Apr 2020 11:58:14 +0000 (UTC)
IronPort-SDR: kAi0b/vawVm8WPDVR7l+Z8WVBFDZs1yi6m58OSG6euDlC7+LMC3j/gVHLSW9+xt9D3xFq8cKPG
 QHAxS18CQQkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 04:58:14 -0700
IronPort-SDR: pEd4dZW6z5CrVVHoWDZIrpUromNdbV4cIbLNJR5Dn7Rsftxd1Ig8+/EwgL6+Pbc/8+jD+IGVIK
 NsO22vkOhgMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="279491952"
Received: from elewis-mobl.ger.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.251.94.8])
 by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 04:58:12 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 03/14] drm: Add logging function for DP VSC SDP
Date: Fri, 17 Apr 2020 15:00:29 +0300
Message-Id: <20200417120040.3432332-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
References: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When receiving video it is very useful to be able to log DP VSC SDP.
This greatly simplifies debugging.

v2: Minor style fix
v3: Move logging functions to drm core [Jani N]
v5: Rebased
v10: Rebased

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 174 ++++++++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h     |   3 +
 2 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 612a59ec8116..43e57632b00a 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1629,3 +1629,177 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_set_phy_test_pattern);
+
+static const char *dp_pixelformat_get_name(enum dp_pixelformat pixelformat)
+{
+	if (pixelformat < 0 || pixelformat > DP_PIXELFORMAT_RESERVED)
+		return "Invalid";
+
+	switch (pixelformat) {
+	case DP_PIXELFORMAT_RGB:
+		return "RGB";
+	case DP_PIXELFORMAT_YUV444:
+		return "YUV444";
+	case DP_PIXELFORMAT_YUV422:
+		return "YUV422";
+	case DP_PIXELFORMAT_YUV420:
+		return "YUV420";
+	case DP_PIXELFORMAT_Y_ONLY:
+		return "Y_ONLY";
+	case DP_PIXELFORMAT_RAW:
+		return "RAW";
+	default:
+		return "Reserved";
+	}
+}
+
+static const char *dp_colorimetry_get_name(enum dp_pixelformat pixelformat,
+					   enum dp_colorimetry colorimetry)
+{
+	if (pixelformat < 0 || pixelformat > DP_PIXELFORMAT_RESERVED)
+		return "Invalid";
+
+	switch (colorimetry) {
+	case DP_COLORIMETRY_DEFAULT:
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "sRGB";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.601";
+		case DP_PIXELFORMAT_Y_ONLY:
+			return "DICOM PS3.14";
+		case DP_PIXELFORMAT_RAW:
+			return "Custom Color Profile";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_RGB_WIDE_FIXED: /* and DP_COLORIMETRY_BT709_YCC */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "Wide Fixed";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.709";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_RGB_WIDE_FLOAT: /* and DP_COLORIMETRY_XVYCC_601 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "Wide Float";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "xvYCC 601";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_OPRGB: /* and DP_COLORIMETRY_XVYCC_709 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "OpRGB";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "xvYCC 709";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_DCI_P3_RGB: /* and DP_COLORIMETRY_SYCC_601 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "DCI-P3";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "sYCC 601";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_RGB_CUSTOM: /* and DP_COLORIMETRY_OPYCC_601 */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "Custom Profile";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "OpYCC 601";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_BT2020_RGB: /* and DP_COLORIMETRY_BT2020_CYCC */
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_RGB:
+			return "BT.2020 RGB";
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.2020 CYCC";
+		default:
+			return "Reserved";
+		}
+	case DP_COLORIMETRY_BT2020_YCC:
+		switch (pixelformat) {
+		case DP_PIXELFORMAT_YUV444:
+		case DP_PIXELFORMAT_YUV422:
+		case DP_PIXELFORMAT_YUV420:
+			return "BT.2020 YCC";
+		default:
+			return "Reserved";
+		}
+	default:
+		return "Invalid";
+	}
+}
+
+static const char *dp_dynamic_range_get_name(enum dp_dynamic_range dynamic_range)
+{
+	switch (dynamic_range) {
+	case DP_DYNAMIC_RANGE_VESA:
+		return "VESA range";
+	case DP_DYNAMIC_RANGE_CTA:
+		return "CTA range";
+	default:
+		return "Invalid";
+	}
+}
+
+static const char *dp_content_type_get_name(enum dp_content_type content_type)
+{
+	switch (content_type) {
+	case DP_CONTENT_TYPE_NOT_DEFINED:
+		return "Not defined";
+	case DP_CONTENT_TYPE_GRAPHICS:
+		return "Graphics";
+	case DP_CONTENT_TYPE_PHOTO:
+		return "Photo";
+	case DP_CONTENT_TYPE_VIDEO:
+		return "Video";
+	case DP_CONTENT_TYPE_GAME:
+		return "Game";
+	default:
+		return "Reserved";
+	}
+}
+
+void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
+			const struct drm_dp_vsc_sdp *vsc)
+{
+#define DP_SDP_LOG(fmt, ...) dev_printk(level, dev, fmt, ##__VA_ARGS__)
+	DP_SDP_LOG("DP SDP: %s, revision %u, length %u\n", "VSC",
+		   vsc->revision, vsc->length);
+	DP_SDP_LOG("    pixelformat: %s\n",
+		   dp_pixelformat_get_name(vsc->pixelformat));
+	DP_SDP_LOG("    colorimetry: %s\n",
+		   dp_colorimetry_get_name(vsc->pixelformat, vsc->colorimetry));
+	DP_SDP_LOG("    bpc: %u\n", vsc->bpc);
+	DP_SDP_LOG("    dynamic range: %s\n",
+		   dp_dynamic_range_get_name(vsc->dynamic_range));
+	DP_SDP_LOG("    content type: %s\n",
+		   dp_content_type_get_name(vsc->content_type));
+#undef DP_SDP_LOG
+}
+EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 3beb2aac8c4c..cd44509772cb 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1348,6 +1348,9 @@ struct drm_dp_vsc_sdp {
 	enum dp_content_type content_type;
 };
 
+void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
+			const struct drm_dp_vsc_sdp *vsc);
+
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
 static inline int
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
