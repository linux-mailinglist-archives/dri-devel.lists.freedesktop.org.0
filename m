Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0B158AA0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585196E466;
	Tue, 11 Feb 2020 07:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7D76E356;
 Tue, 11 Feb 2020 07:47:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 23:47:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="312993646"
Received: from helsinki.fi.intel.com ([10.237.66.159])
 by orsmga001.jf.intel.com with ESMTP; 10 Feb 2020 23:47:00 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 01/18] drm: Add DP1.4 VSC SDP Payload related Data
 Structures
Date: Tue, 11 Feb 2020 09:46:40 +0200
Message-Id: <20200211074657.231405-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It adds new enumeration definitions for VSC SDP Payload for Pixel
Encoding/Colorimetry Format.
And it adds a new drm data structure for DP VSC SDP.

enum dp_colorspace and enum dp_colorimetry correspond "Pixel Encoding and
Colorimetry Formats". enum dp_dynamic_range corresponds "Dynamic Range".
And enum dp_content_type corresponds "Content Type"
All of them are based on DP 1.4 spec [Table 2-117: VSC SDP Payload for
DB16 through DB18].

v3: Add a new drm data structure for DP VSC SDP
v5: Addressed review comments from Uma
    - Add kernel docs for added data structures
    - Rename enum dp_colorspace to dp_pixelformat
    - Polish commit message
    - Fix typos
    - Drop self-explanatory comments

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/drm/drm_dp_helper.h | 130 ++++++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 262faf9e5e94..e332f54013d7 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1209,6 +1209,136 @@ struct dp_sdp {
 #define EDP_VSC_PSR_UPDATE_RFB		(1<<1)
 #define EDP_VSC_PSR_CRC_VALUES_VALID	(1<<2)
 
+/**
+ * enum dp_pixelformat - drm DP Pixel encoding formats
+ *
+ * This enum is used to indicate DP VSC SDP Pixel encoding formats.
+ * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
+ * DB18]
+ *
+ * @DP_PIXELFORMAT_RGB: RGB pixel encoding format
+ * @DP_PIXELFORMAT_YUV444: YCbCr 4:4:4 pixel encoding format
+ * @DP_PIXELFORMAT_YUV422: YCbCr 4:2:2 pixel encoding format
+ * @DP_PIXELFORMAT_YUV420: YCbCr 4:2:0 pixel encoding format
+ * @DP_PIXELFORMAT_Y_ONLY: Y Only pixel encoding format
+ * @DP_PIXELFORMAT_RAW: RAW pixel encoding format
+ * @DP_PIXELFORMAT_RESERVED: Reserved pixel encoding format
+ */
+enum dp_pixelformat {
+	DP_PIXELFORMAT_RGB = 0,
+	DP_PIXELFORMAT_YUV444 = 0x1,
+	DP_PIXELFORMAT_YUV422 = 0x2,
+	DP_PIXELFORMAT_YUV420 = 0x3,
+	DP_PIXELFORMAT_Y_ONLY = 0x4,
+	DP_PIXELFORMAT_RAW = 0x5,
+	DP_PIXELFORMAT_RESERVED = 0x6,
+};
+
+/**
+ * enum dp_colorimetry - drm DP Colorimetry formats
+ *
+ * This enum is used to indicate DP VSC SDP Colorimetry formats.
+ * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
+ * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
+ *
+ * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
+ *                          ITU-R BT.601 colorimetry format
+ * @DP_COLORIMETRY_RGB_WIDE_FIXED: RGB wide gamut fixed point colorimetry format
+ * @DP_COLORIMETRY_BT709_YCC: ITU-R BT.709 colorimetry format
+ * @DP_COLORIMETRY_RGB_WIDE_FLOAT: RGB wide gamut floating point
+ *                                 (scRGB (IEC 61966-2-2)) colorimetry format
+ * @DP_COLORIMETRY_XVYCC_601: xvYCC601 colorimetry format
+ * @DP_COLORIMETRY_OPRGB: OpRGB colorimetry format
+ * @DP_COLORIMETRY_XVYCC_709: xvYCC709 colorimetry format
+ * @DP_COLORIMETRY_DCI_P3_RGB: DCI-P3 (SMPTE RP 431-2) colorimetry format
+ * @DP_COLORIMETRY_SYCC_601: sYCC601 colorimetry format
+ * @DP_COLORIMETRY_RGB_CUSTOM: RGB Custom Color Profile colorimetry format
+ * @DP_COLORIMETRY_OPYCC_601: opYCC601 colorimetry format
+ * @DP_COLORIMETRY_BT2020_RGB: ITU-R BT.2020 R' G' B' colorimetry format
+ * @DP_COLORIMETRY_BT2020_CYCC: ITU-R BT.2020 Y'c C'bc C'rc colorimetry format
+ * @DP_COLORIMETRY_BT2020_YCC: ITU-R BT.2020 Y' C'b C'r colorimetry format
+ */
+enum dp_colorimetry {
+	DP_COLORIMETRY_DEFAULT = 0,
+	DP_COLORIMETRY_RGB_WIDE_FIXED = 0x1,
+	DP_COLORIMETRY_BT709_YCC = 0x1,
+	DP_COLORIMETRY_RGB_WIDE_FLOAT = 0x2,
+	DP_COLORIMETRY_XVYCC_601 = 0x2,
+	DP_COLORIMETRY_OPRGB = 0x3,
+	DP_COLORIMETRY_XVYCC_709 = 0x3,
+	DP_COLORIMETRY_DCI_P3_RGB = 0x4,
+	DP_COLORIMETRY_SYCC_601 = 0x4,
+	DP_COLORIMETRY_RGB_CUSTOM = 0x5,
+	DP_COLORIMETRY_OPYCC_601 = 0x5,
+	DP_COLORIMETRY_BT2020_RGB = 0x6,
+	DP_COLORIMETRY_BT2020_CYCC = 0x6,
+	DP_COLORIMETRY_BT2020_YCC = 0x7,
+};
+
+/**
+ * enum dp_dynamic_range - drm DP Dynamic Range
+ *
+ * This enum is used to indicate DP VSC SDP Dynamic Range.
+ * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
+ * DB18]
+ *
+ * @DP_DYNAMIC_RANGE_VESA: VESA range
+ * @DP_DYNAMIC_RANGE_CTA: CTA range
+ */
+enum dp_dynamic_range {
+	DP_DYNAMIC_RANGE_VESA = 0,
+	DP_DYNAMIC_RANGE_CTA = 1,
+};
+
+/**
+ * enum dp_content_type - drm DP Content Type
+ *
+ * This enum is used to indicate DP VSC SDP Content Types.
+ * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
+ * DB18]
+ * CTA-861-G defines content types and expected processing by a sink device
+ *
+ * @DP_CONTENT_TYPE_NOT_DEFINED: Not defined type
+ * @DP_CONTENT_TYPE_GRAPHICS: Graphics type
+ * @DP_CONTENT_TYPE_PHOTO: Photo type
+ * @DP_CONTENT_TYPE_VIDEO: Video type
+ * @DP_CONTENT_TYPE_GAME: Game type
+ */
+enum dp_content_type {
+	DP_CONTENT_TYPE_NOT_DEFINED = 0x00,
+	DP_CONTENT_TYPE_GRAPHICS = 0x01,
+	DP_CONTENT_TYPE_PHOTO = 0x02,
+	DP_CONTENT_TYPE_VIDEO = 0x03,
+	DP_CONTENT_TYPE_GAME = 0x04,
+};
+
+/**
+ * struct drm_dp_vsc_sdp - drm DP VSC SDP
+ *
+ * This structure represents a DP VSC SDP of drm
+ * It is based on DP 1.4 spec [Table 2-116: VSC SDP Header Bytes] and
+ * [Table 2-117: VSC SDP Payload for DB16 through DB18]
+ *
+ * @sdp_type: secondary-data packet type
+ * @revision: revision number
+ * @length: number of valid data bytes
+ * @pixelformat: pixel encoding format
+ * @colorimetry: colorimetry format
+ * @bpc: bit per color
+ * @dynamic_range: dynamic range information
+ * @content_type: CTA-861-G defines content types and expected processing by a sink device
+ */
+struct drm_dp_vsc_sdp {
+	unsigned char sdp_type;
+	unsigned char revision;
+	unsigned char length;
+	enum dp_pixelformat pixelformat;
+	enum dp_colorimetry colorimetry;
+	int bpc;
+	enum dp_dynamic_range dynamic_range;
+	enum dp_content_type content_type;
+};
+
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
 static inline int
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
