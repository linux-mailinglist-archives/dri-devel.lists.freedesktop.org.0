Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FC1951EA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 08:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992B86E997;
	Fri, 27 Mar 2020 07:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85C56E996;
 Fri, 27 Mar 2020 07:28:40 +0000 (UTC)
IronPort-SDR: P3EYMtF0AQkqd+dRM3Wj5xZ4YHrFfz4VRGKf/44M9jLtGLlxItoVj97YPBtvBn2+DnM6HnQQ15
 vYDkCv4kHhOA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 00:28:40 -0700
IronPort-SDR: WR2/YYtufDHP7QJ4C1MoWlUIRqrrT+hgjhTsYRUKt3D6gZcbSVR9MVC1+G6QoonHiiO+xSJl2f
 SO5JStEHN+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="394291981"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.26.111])
 by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:28:38 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 01/14] video/hdmi: Add Unpack function for CTA-861-G DRM
 infoframe DataBytes
Date: Fri, 27 Mar 2020 09:29:04 +0200
Message-Id: <20200327072917.3676391-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
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
Cc: jani.nikula@intel.com, linux-fbdev@vger.kernel.org, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It adds an unpack function for DRM infoframe for dynamic range and
mastering infoframe readout. It unpacks CTA-861-G DRM infoframe DataBytes
contained in the binary buffer into a structured frame of the HDMI Dynamic
Range and Mastering (DRM) infoframe.

CTA-861-G DRM infoframe spec is used for HDR Metadata representation of
HDMI and DisplayPort. Each of HDMI and DP have different header structure,
but they use same payload(DataBytes) structure of CTA-861-G DRM infoframe.

Therefore it only provides unpacking of DRM infoframe payload in order to
use on both HDMI and DP.

v8: Addressed review comments from Laurent Pinchart
   - Rename hdmi_drm_infoframe_unpack_only() to
     cta_drm_infoframe_unpack_databytes()
   - Add clear comments to cta_drm_infoframe_unpack_databytes()

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/video/hdmi.c | 74 ++++++++++++++++++++++++++++++--------------
 include/linux/hdmi.h |  2 ++
 2 files changed, 52 insertions(+), 24 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 856a8c4e84a2..88014c0bbe7c 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1768,20 +1768,21 @@ hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
 }
 
 /**
- * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
+ * cta_drm_infoframe_unpack_databytes() - unpack binary buffer of CTA-861-G
+ *                                        DRM infoframe DataBytes to a HDMI
+ *                                        DRM infoframe
  * @frame: HDMI DRM infoframe
  * @buffer: source buffer
  * @size: size of buffer
  *
- * Unpacks the information contained in binary @buffer into a structured
- * @frame of the HDMI Dynamic Range and Mastering (DRM) information frame.
- * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
- * specification.
+ * Unpacks CTA-861-G DRM infoframe DataBytes contained in the binary
+ * @buffer into a structured @frame of the HDMI Dynamic Range and Mastering
+ * (DRM) infoframe.
  *
  * Returns 0 on success or a negative error code on failure.
  */
-static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
-				     const void *buffer, size_t size)
+int cta_drm_infoframe_unpack_databytes(struct hdmi_drm_infoframe *frame,
+				       const void *buffer, size_t size)
 {
 	const u8 *ptr = buffer;
 	const u8 *temp;
@@ -1790,23 +1791,9 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 	int ret;
 	int i;
 
-	if (size < HDMI_INFOFRAME_SIZE(DRM))
+	if (size < HDMI_DRM_INFOFRAME_SIZE)
 		return -EINVAL;
 
-	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
-	    ptr[1] != 1 ||
-	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
-		return -EINVAL;
-
-	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
-		return -EINVAL;
-
-	ret = hdmi_drm_infoframe_init(frame);
-	if (ret)
-		return ret;
-
-	ptr += HDMI_INFOFRAME_HEADER_SIZE;
-
 	frame->eotf = ptr[0] & 0x7;
 	frame->metadata_type = ptr[1] & 0x7;
 
@@ -1814,7 +1801,7 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 	for (i = 0; i < 3; i++) {
 		x_lsb = *temp++;
 		x_msb = *temp++;
-		frame->display_primaries[i].x =  (x_msb << 8) | x_lsb;
+		frame->display_primaries[i].x = (x_msb << 8) | x_lsb;
 		y_lsb = *temp++;
 		y_msb = *temp++;
 		frame->display_primaries[i].y = (y_msb << 8) | y_lsb;
@@ -1822,7 +1809,6 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 
 	frame->white_point.x = (ptr[15] << 8) | ptr[14];
 	frame->white_point.y = (ptr[17] << 8) | ptr[16];
-
 	frame->max_display_mastering_luminance = (ptr[19] << 8) | ptr[18];
 	frame->min_display_mastering_luminance = (ptr[21] << 8) | ptr[20];
 	frame->max_cll = (ptr[23] << 8) | ptr[22];
@@ -1830,6 +1816,46 @@ static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
 
 	return 0;
 }
+EXPORT_SYMBOL(cta_drm_infoframe_unpack_databytes);
+
+/**
+ * hdmi_drm_infoframe_unpack() - unpack binary buffer to a HDMI DRM infoframe
+ * @frame: HDMI DRM infoframe
+ * @buffer: source buffer
+ * @size: size of buffer
+ *
+ * Unpacks the CTA-861-G DRM infoframe contained in the binary @buffer into
+ * a structured @frame of the HDMI Dynamic Range and Mastering (DRM)
+ * infoframe. It also verifies the checksum as required by section 5.3.5 of
+ * the HDMI 1.4 specification.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+static int hdmi_drm_infoframe_unpack(struct hdmi_drm_infoframe *frame,
+				     const void *buffer, size_t size)
+{
+	const u8 *ptr = buffer;
+	int ret;
+
+	if (size < HDMI_INFOFRAME_SIZE(DRM))
+		return -EINVAL;
+
+	if (ptr[0] != HDMI_INFOFRAME_TYPE_DRM ||
+	    ptr[1] != 1 ||
+	    ptr[2] != HDMI_DRM_INFOFRAME_SIZE)
+		return -EINVAL;
+
+	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(DRM)) != 0)
+		return -EINVAL;
+
+	ret = hdmi_drm_infoframe_init(frame);
+	if (ret)
+		return ret;
+
+	ret = cta_drm_infoframe_unpack_databytes(frame, ptr + HDMI_INFOFRAME_HEADER_SIZE,
+						 size - HDMI_INFOFRAME_HEADER_SIZE);
+	return ret;
+}
 
 /**
  * hdmi_infoframe_unpack() - unpack binary buffer to a HDMI infoframe
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 9613d796cfb1..43b3a1a0a35b 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -219,6 +219,8 @@ ssize_t hdmi_drm_infoframe_pack(struct hdmi_drm_infoframe *frame, void *buffer,
 ssize_t hdmi_drm_infoframe_pack_only(const struct hdmi_drm_infoframe *frame,
 				     void *buffer, size_t size);
 int hdmi_drm_infoframe_check(struct hdmi_drm_infoframe *frame);
+int cta_drm_infoframe_unpack_databytes(struct hdmi_drm_infoframe *frame,
+				       const void *buffer, size_t size);
 
 enum hdmi_spd_sdi {
 	HDMI_SPD_SDI_UNKNOWN,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
