Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEDF28DA28
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DE06E9F9;
	Wed, 14 Oct 2020 07:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33486E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 08:55:23 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 4D4B948295F;
 Tue, 13 Oct 2020 16:55:19 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: Optimize functions which do not need to return
Date: Tue, 13 Oct 2020 01:55:12 -0700
Message-Id: <20201013085512.12857-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTEwYTB9PS0tDGkxJVkpNS0lOTEJISkJOTE5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRQ6PBw5Lj8sSjhMGjMXEUIh
 LjkaChNVSlVKTUtJTkxCSElLS0lJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBT09LSjcG
X-HM-Tid: 0a75212bcacc93bakuws4d4b948295f
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function mtk_hdmi_aud_set_input always return 0, no need to
keep the return value. Functions mtk_hdmi_aud_enable_packet &
mtk_hdmi_aud_on_off_hw_ncts are the same, these two functions
just call next functions. Maybe it`s a bit better to just call
the inner function.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a97725680d4e..f1d987df0550 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -870,19 +870,8 @@ static void mtk_hdmi_video_set_display_mode(struct mtk_hdmi *hdmi,
 	mtk_hdmi_hw_msic_setting(hdmi, mode);
 }
 
-static int mtk_hdmi_aud_enable_packet(struct mtk_hdmi *hdmi, bool enable)
-{
-	mtk_hdmi_hw_send_aud_packet(hdmi, enable);
-	return 0;
-}
 
-static int mtk_hdmi_aud_on_off_hw_ncts(struct mtk_hdmi *hdmi, bool on)
-{
-	mtk_hdmi_hw_ncts_enable(hdmi, on);
-	return 0;
-}
-
-static int mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
+static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 {
 	enum hdmi_aud_channel_type chan_type;
 	u8 chan_count;
@@ -912,8 +901,6 @@ static int mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 	chan_count = mtk_hdmi_aud_get_chnl_count(chan_type);
 	mtk_hdmi_hw_aud_set_i2s_chan_num(hdmi, chan_type, chan_count);
 	mtk_hdmi_hw_aud_set_input_type(hdmi, hdmi->aud_param.aud_input_type);
-
-	return 0;
 }
 
 static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
@@ -921,7 +908,7 @@ static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
 {
 	unsigned int sample_rate = hdmi->aud_param.codec_params.sample_rate;
 
-	mtk_hdmi_aud_on_off_hw_ncts(hdmi, false);
+	mtk_hdmi_hw_ncts_enable(hdmi, false);
 	mtk_hdmi_hw_aud_src_disable(hdmi);
 	mtk_hdmi_clear_bits(hdmi, GRL_CFG2, CFG2_ACLK_INV);
 
@@ -959,7 +946,7 @@ static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 				      struct drm_display_mode *display_mode)
 {
 	mtk_hdmi_hw_aud_mute(hdmi);
-	mtk_hdmi_aud_enable_packet(hdmi, false);
+	mtk_hdmi_hw_send_aud_packet(hdmi, false);
 
 	mtk_hdmi_aud_set_input(hdmi);
 	mtk_hdmi_aud_set_src(hdmi, display_mode);
@@ -968,8 +955,8 @@ static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 
 	usleep_range(50, 100);
 
-	mtk_hdmi_aud_on_off_hw_ncts(hdmi, true);
-	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_ncts_enable(hdmi, true);
+	mtk_hdmi_hw_send_aud_packet(hdmi, true);
 	mtk_hdmi_hw_aud_unmute(hdmi);
 	return 0;
 }
@@ -1097,13 +1084,13 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
 
 static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_aud_enable_packet(hdmi, true);
+	mtk_hdmi_hw_send_aud_packet(hdmi, true);
 	hdmi->audio_enable = true;
 }
 
 static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
 {
-	mtk_hdmi_aud_enable_packet(hdmi, false);
+	mtk_hdmi_hw_send_aud_packet(hdmi, false);
 	hdmi->audio_enable = false;
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
