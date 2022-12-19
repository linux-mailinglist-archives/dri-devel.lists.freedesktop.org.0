Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C103651F06
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0256410E385;
	Tue, 20 Dec 2022 10:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6173510E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:02:21 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A27AA1929;
 Mon, 19 Dec 2022 15:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671458540;
 bh=DAiaqqteulxMQppBVTvKj/yRCUUvoQjEEW8DJtn+JNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZOQDFCuzifEY7ogNOJwePZS3CTjaBQRbpBJOraCgthumBm+5ewDZ0cWhM9pqALFzr
 QgWdv2lYQVFT9CX6WrD0rPr9dxBSpOgvXvjy1rFjVKiVdby195qlqn0JBb3pm1wCff
 Xb6mEzgbd7iN+mHNWgI7z6O2Dhs0fpc3LTBTtWYY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 5/7] media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210)
Date: Mon, 19 Dec 2022 16:01:37 +0200
Message-Id: <20221219140139.294245-6-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new pixel formats: XBGR2101010, ABGR2101010, BGRA1010102 and Y210.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 15 ++++++
 .../media/platform/renesas/vsp1/vsp1_regs.h   | 22 +++++++++
 .../media/platform/renesas/vsp1/vsp1_rpf.c    | 49 +++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f72ac01c21ea..2867b3de06fa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -146,6 +146,18 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_XBGR2101010, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
+	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_ABGR2101010, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
+	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_BGRA1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
+	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
+	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
 	{ V4L2_PIX_FMT_UYVY, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
@@ -202,6 +214,9 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_Y_U_V_444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  3, { 8, 8, 8 }, false, true, 1, 1, false },
+	{ V4L2_PIX_FMT_Y210, MEDIA_BUS_FMT_AYUV8_1X32,
+	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
+	  1, { 32, 0, 0 }, false, false, 2, 1, false },
 };
 
 /**
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index c61e8dafeecf..8947ea05f95e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -228,6 +228,27 @@
 #define VI6_RPF_MULT_ALPHA_RATIO_MASK	(0xff << 0)
 #define VI6_RPF_MULT_ALPHA_RATIO_SHIFT	0
 
+#define VI6_RPF_EXT_INFMT0		0x0370
+#define VI6_RPF_EXT_INFMT0_F2B_LSB		(0 << 12)
+#define VI6_RPF_EXT_INFMT0_F2B_MSB		(1 << 12)
+#define VI6_RPF_EXT_INFMT0_IPBD_Y_8		(0 << 8)
+#define VI6_RPF_EXT_INFMT0_IPBD_Y_10		(1 << 8)
+#define VI6_RPF_EXT_INFMT0_IPBD_Y_12		(2 << 8)
+#define VI6_RPF_EXT_INFMT0_IPBD_C_8		(0 << 4)
+#define VI6_RPF_EXT_INFMT0_IPBD_C_10		(1 << 4)
+#define VI6_RPF_EXT_INFMT0_IPBD_C_12		(2 << 4)
+#define VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10	(3 << 0)
+#define VI6_RPF_EXT_INFMT0_BYPP_M1_N_RGB10	(0 << 0)
+
+#define VI6_RPF_EXT_INFMT1		0x0374
+#define VI6_RPF_EXT_INFMT2		0x0378
+
+#define VI6_RPF_BRDITH_CTRL		0x03e0
+#define VI6_RPF_BRDITH_CTRL_ODE_EN	(1 << 8)
+#define VI6_RPF_BRDITH_CTRL_ODE_DIS	(0 << 8)
+#define VI6_RPF_BRDITH_CTRL_CBRM_RO	(1 << 0)
+#define VI6_RPF_BRDITH_CTRL_CBRM_TR	(0 << 0)
+
 /* -----------------------------------------------------------------------------
  * WPF Control Registers
  */
@@ -846,6 +867,7 @@
 #define VI6_FMT_XBXGXR_262626		0x21
 #define VI6_FMT_ABGR_8888		0x22
 #define VI6_FMT_XXRGB_88565		0x23
+#define VI6_FMT_RGB10_RGB10A2_A2RGB10	0x30
 
 #define VI6_FMT_Y_UV_444		0x40
 #define VI6_FMT_Y_UV_422		0x41
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 045aa54f7998..60ba3c62e86c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -55,6 +55,11 @@ static const struct v4l2_subdev_ops rpf_ops = {
  * VSP1 Entity Operations
  */
 
+#define PACK_CPOS(a, b, c, d) \
+	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
+#define PACK_CLEN(a, b, c, d) \
+	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
+
 static void rpf_configure_stream(struct vsp1_entity *entity,
 				 struct vsp1_pipeline *pipe,
 				 struct vsp1_dl_list *dl,
@@ -109,6 +114,50 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
 
+	if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) == VI6_IP_VERSION_MODEL_VSPD_GEN4) {
+		u32 ext_infmt0;
+		u32 ext_infmt1;
+		u32 ext_infmt2;
+
+		switch (fmtinfo->fourcc) {
+		case V4L2_PIX_FMT_XBGR2101010:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
+			ext_infmt1 = PACK_CPOS(0, 10, 20, 0);
+			ext_infmt2 = PACK_CLEN(10, 10, 10, 0);
+			break;
+
+		case V4L2_PIX_FMT_ABGR2101010:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
+			ext_infmt1 = PACK_CPOS(0, 10, 20, 30);
+			ext_infmt2 = PACK_CLEN(10, 10, 10, 2);
+			break;
+
+		case V4L2_PIX_FMT_BGRA1010102:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
+			ext_infmt1 = PACK_CPOS(2, 12, 22, 0);
+			ext_infmt2 = PACK_CLEN(10, 10, 10, 2);
+			break;
+
+		case V4L2_PIX_FMT_Y210:
+			ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B_MSB |
+				     VI6_RPF_EXT_INFMT0_IPBD_Y_10 |
+				     VI6_RPF_EXT_INFMT0_IPBD_C_10;
+			ext_infmt1 = 0x0;
+			ext_infmt2 = 0x0;
+			break;
+
+		default:
+			ext_infmt0 = 0;
+			ext_infmt1 = 0;
+			ext_infmt2 = 0;
+			break;
+		}
+
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT0, ext_infmt0);
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT1, ext_infmt1);
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
+	}
+
 	/* Output location. */
 	if (pipe->brx) {
 		const struct v4l2_rect *compose;
-- 
2.34.1

