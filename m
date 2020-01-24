Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3A14773E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247906FEC9;
	Fri, 24 Jan 2020 03:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB4F6FA3A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:07 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 078EFA2A;
 Fri, 24 Jan 2020 04:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838106;
 bh=xcHeVznCFEVYqdCsKNogzZLW9PotyUvvue8+DqQCHVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FG89lnq5HkL4mkEpL7Q6Ve2lK60e8EePRAH5waDM4SSYIm5VXiHVGGeddBLiHf2ps
 fWK723ekGBPBKmtUGIC0s54ekvrWxOh4XaEr273OiPZLrBMHl+XhYuwK2/iIkgtq4t
 7XoQTnP24qoJ2yEO1OcyPSKHcFmLV1jCr4BqdiY4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/52] video: hdmi: Change return type of
 hdmi_avi_infoframe_init() to void
Date: Fri, 24 Jan 2020 05:53:54 +0200
Message-Id: <20200124035445.1830-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi_avi_infoframe_init() never needs to return an error, change its
return type to void.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v1:

- Removed documentation of the return value

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/gpu/drm/drm_edid.c |  5 +----
 drivers/video/hdmi.c       | 11 ++---------
 include/linux/hdmi.h       |  2 +-
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 99769d6c9f84..feb9ef0df860 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5396,14 +5396,11 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 {
 	enum hdmi_picture_aspect picture_aspect;
 	u8 vic, hdmi_vic;
-	int err;
 
 	if (!frame || !mode)
 		return -EINVAL;
 
-	err = hdmi_avi_infoframe_init(frame);
-	if (err < 0)
-		return err;
+	hdmi_avi_infoframe_init(frame);
 
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		frame->pixel_repeat = 1;
diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 9c82e2a0a411..856a8c4e84a2 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -53,18 +53,14 @@ static void hdmi_infoframe_set_checksum(void *buffer, size_t size)
 /**
  * hdmi_avi_infoframe_init() - initialize an HDMI AVI infoframe
  * @frame: HDMI AVI infoframe
- *
- * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_avi_infoframe_init(struct hdmi_avi_infoframe *frame)
+void hdmi_avi_infoframe_init(struct hdmi_avi_infoframe *frame)
 {
 	memset(frame, 0, sizeof(*frame));
 
 	frame->type = HDMI_INFOFRAME_TYPE_AVI;
 	frame->version = 2;
 	frame->length = HDMI_AVI_INFOFRAME_SIZE;
-
-	return 0;
 }
 EXPORT_SYMBOL(hdmi_avi_infoframe_init);
 
@@ -1553,7 +1549,6 @@ static int hdmi_avi_infoframe_unpack(struct hdmi_avi_infoframe *frame,
 				     const void *buffer, size_t size)
 {
 	const u8 *ptr = buffer;
-	int ret;
 
 	if (size < HDMI_INFOFRAME_SIZE(AVI))
 		return -EINVAL;
@@ -1566,9 +1561,7 @@ static int hdmi_avi_infoframe_unpack(struct hdmi_avi_infoframe *frame,
 	if (hdmi_infoframe_checksum(buffer, HDMI_INFOFRAME_SIZE(AVI)) != 0)
 		return -EINVAL;
 
-	ret = hdmi_avi_infoframe_init(frame);
-	if (ret)
-		return ret;
+	hdmi_avi_infoframe_init(frame);
 
 	ptr += HDMI_INFOFRAME_HEADER_SIZE;
 
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 9918a6c910c5..9613d796cfb1 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -207,7 +207,7 @@ struct hdmi_drm_infoframe {
 	u16 max_fall;
 };
 
-int hdmi_avi_infoframe_init(struct hdmi_avi_infoframe *frame);
+void hdmi_avi_infoframe_init(struct hdmi_avi_infoframe *frame);
 ssize_t hdmi_avi_infoframe_pack(struct hdmi_avi_infoframe *frame, void *buffer,
 				size_t size);
 ssize_t hdmi_avi_infoframe_pack_only(const struct hdmi_avi_infoframe *frame,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
