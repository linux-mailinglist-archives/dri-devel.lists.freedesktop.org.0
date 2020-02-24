Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6F16BC90
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280706EA48;
	Tue, 25 Feb 2020 08:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs62.siol.net [185.57.226.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DFF6E81A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id D633A5236FC;
 Mon, 24 Feb 2020 18:39:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id bQ31Av_L3CjJ; Mon, 24 Feb 2020 18:39:23 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 6F5505236BE;
 Mon, 24 Feb 2020 18:39:23 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 118EE52373C;
 Mon, 24 Feb 2020 18:39:21 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 6/7] drm/sun4i: de2: Don't return de2_fmt_info struct
Date: Mon, 24 Feb 2020 18:39:00 +0100
Message-Id: <20200224173901.174016-7-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224173901.174016-1-jernej.skrabec@siol.net>
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that de2_fmt_info contains only DRM <-> HW format mapping, it
doesn't make sense to return pointer to structure when searching by DRM
format. Rework that to return only HW format instead.

This doesn't make any functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  7 +------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 ++++++------
 4 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index e078ec96de2d..56cc037fd312 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -27,6 +27,11 @@
 #include "sun8i_vi_layer.h"
 #include "sunxi_engine.h"
 
+struct de2_fmt_info {
+	u32	drm_fmt;
+	u32	de2_fmt;
+};
+
 static const struct de2_fmt_info de2_formats[] = {
 	{
 		.drm_fmt = DRM_FORMAT_ARGB8888,
@@ -230,15 +235,17 @@ static const struct de2_fmt_info de2_formats[] = {
 	},
 };
 
-const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
+int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(de2_formats); ++i)
-		if (de2_formats[i].drm_fmt == format)
-			return &de2_formats[i];
+		if (de2_formats[i].drm_fmt == format) {
+			*hw_format = de2_formats[i].de2_fmt;
+			return 0;
+		}
 
-	return NULL;
+	return -EINVAL;
 }
 
 static void sun8i_mixer_commit(struct sunxi_engine *engine)
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index 0dd4a347fa06..7576b523fdbb 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -143,11 +143,6 @@
 #define SUN50I_MIXER_CDC0_EN			0xd0000
 #define SUN50I_MIXER_CDC1_EN			0xd8000
 
-struct de2_fmt_info {
-	u32	drm_fmt;
-	u32	de2_fmt;
-};
-
 /**
  * struct sun8i_mixer_cfg - mixer HW configuration
  * @vi_num: number of VI channels
@@ -207,5 +202,5 @@ sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
 }
 
-const struct de2_fmt_info *sun8i_mixer_format_info(u32 format);
+int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format);
 #endif /* _SUN8I_MIXER_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 99ee19a00415..a64aaea1ba74 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -174,20 +174,20 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	const struct de2_fmt_info *fmt_info;
 	const struct drm_format_info *fmt;
-	u32 val, ch_base;
+	u32 val, ch_base, hw_fmt;
+	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	fmt_info = sun8i_mixer_format_info(fmt->format);
-	if (!fmt_info || fmt->is_yuv) {
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret || fmt->is_yuv) {
 		DRM_DEBUG_DRIVER("Invalid format\n");
 		return -EINVAL;
 	}
 
-	val = fmt_info->de2_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
+	val = hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index d783c2bfc77e..b1e1ba2da663 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -231,20 +231,20 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	const struct de2_fmt_info *fmt_info;
+	u32 val, ch_base, csc_mode, hw_fmt;
 	const struct drm_format_info *fmt;
-	u32 val, ch_base, csc_mode;
+	int ret;
 
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	fmt = state->fb->format;
-	fmt_info = sun8i_mixer_format_info(fmt->format);
-	if (!fmt_info) {
+	ret = sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
+	if (ret) {
 		DRM_DEBUG_DRIVER("Invalid format\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	val = fmt_info->de2_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
+	val = hw_fmt << SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_OFFSET;
 	regmap_update_bits(mixer->engine.regs,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
