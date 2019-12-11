Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FB911A84E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B836EAEC;
	Wed, 11 Dec 2019 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 09:56:00 UTC
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37326EAEC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3636; q=dns/txt; s=iport;
 t=1576058160; x=1577267760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dKUbaAlauMbq5cq0WFciv5ch7/m6Hsd9g/r+e110p8Y=;
 b=l38FOg5QdYkX/vqA1JxIDr4foDjo3dLzZ5auKA2vyAzky5U0JW/S4IOn
 LvT0tD8t+dSZmNRdsTzwbDOZyprkW4cuPx1sIiu1xQjMcRseU89sVOdlZ
 cXxqVctfHFTLTrxyHE+hP0L9QiqZprXfzpGEIZtzI+nrPB88Y0ojFH4Xp g=;
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="20222029"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
 ([173.38.203.22])
 by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 11 Dec 2019 09:48:48 +0000
Received: from localhost.localdomain.rd.cisco.com ([10.47.76.148])
 by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id xBB9mm42004181;
 Wed, 11 Dec 2019 09:48:48 GMT
From: Johan Korsnes <jkorsnes@cisco.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] video: hdmi: indicate applicability in avi infoframe log
Date: Wed, 11 Dec 2019 10:48:42 +0100
Message-Id: <20191211094842.165087-1-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.47.76.148, [10.47.76.148]
X-Outbound-Node: aer-core-4.cisco.com
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
Cc: Hans Verkuil <hansverk@cisco.com>, Martin Bugge <marbugge@cisco.com>,
 Johan Korsnes <jkorsnes@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When logging the AVI InfoFrame, clearly indicate whether or not
attributes are active/"in effect". The specification is given in
CTA-861-G Section 6.4: Format of Version 2, 3 & 4 AVI InfoFrames.

Attribute         Bytes    Requirement
Ext. Colorimetry  EC0..EC2 Colorimetry (C0,C1) set to Extended.
IT Contents Type  CN0,CN1  IT Content (ITC) set to True.
RGB Quant. Range  Q0,Q1    Color Space (Y0..Y2) set to RGB.
YCC Quant. Range  YQ0,YQ1  Color space (Y0..Y2) set to YCbCr.

Example log output with patch applied:
HDMI infoframe: Auxiliary Video Information (AVI), version 2, length 13
    colorspace: RGB
    scan mode: No Data
    colorimetry: ITU709
    picture aspect: 16:9
    active aspect: Same as Picture
    itc: IT Content
    extended colorimetry: N/A (0x0)
    quantization range: Full
    nups: Unknown Non-uniform Scaling
    video code: 16
    ycc quantization range: N/A (0x0)
    hdmi content type: Graphics
    pixel repeat: 0
    bar top 0, bottom 0, left 0, right 0

Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
Cc: Hans Verkuil <hansverk@cisco.com>
Cc: Martin Bugge <marbugge@cisco.com>

---
v1 -> v2:
 * Indicate applicability not only for ext. colorimetry
---
 drivers/video/hdmi.c | 40 ++++++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 9c82e2a0a411..491a77b28a9b 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1209,16 +1209,40 @@ static void hdmi_avi_infoframe_log(const char *level,
 	hdmi_log("    active aspect: %s\n",
 			hdmi_active_aspect_get_name(frame->active_aspect));
 	hdmi_log("    itc: %s\n", frame->itc ? "IT Content" : "No Data");
-	hdmi_log("    extended colorimetry: %s\n",
-			hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
-	hdmi_log("    quantization range: %s\n",
-			hdmi_quantization_range_get_name(frame->quantization_range));
+
+	if (frame->colorimetry == HDMI_COLORIMETRY_EXTENDED)
+		hdmi_log("    extended colorimetry: %s\n",
+			 hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
+	else
+		hdmi_log("    extended colorimetry: N/A (0x%x)\n",
+			 frame->extended_colorimetry);
+
+	if (frame->colorspace == HDMI_COLORSPACE_RGB)
+		hdmi_log("    quantization range: %s\n",
+			 hdmi_quantization_range_get_name(frame->quantization_range));
+	else
+		hdmi_log("    quantization range: N/A (0x%x)\n",
+			 frame->quantization_range);
+
 	hdmi_log("    nups: %s\n", hdmi_nups_get_name(frame->nups));
 	hdmi_log("    video code: %u\n", frame->video_code);
-	hdmi_log("    ycc quantization range: %s\n",
-			hdmi_ycc_quantization_range_get_name(frame->ycc_quantization_range));
-	hdmi_log("    hdmi content type: %s\n",
-			hdmi_content_type_get_name(frame->content_type));
+
+	if (frame->colorspace == HDMI_COLORSPACE_YUV422 ||
+	    frame->colorspace == HDMI_COLORSPACE_YUV444 ||
+	    frame->colorspace == HDMI_COLORSPACE_YUV420)
+		hdmi_log("    ycc quantization range: %s\n",
+			 hdmi_ycc_quantization_range_get_name(frame->ycc_quantization_range));
+	else
+		hdmi_log("    ycc quantization range: N/A (0x%x)\n",
+			 frame->ycc_quantization_range);
+
+	if (frame->itc)
+		hdmi_log("    hdmi content type: %s\n",
+			 hdmi_content_type_get_name(frame->content_type));
+	else
+		hdmi_log("    hdmi content type: N/A (0x%x)\n",
+			 frame->content_type);
+
 	hdmi_log("    pixel repeat: %u\n", frame->pixel_repeat);
 	hdmi_log("    bar top %u, bottom %u, left %u, right %u\n",
 			frame->top_bar, frame->bottom_bar,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
