Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D01B6EB8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 09:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432ED6EA7D;
	Fri, 24 Apr 2020 07:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65DD6E441
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 06:36:26 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id C0A69482514;
 Fri, 24 Apr 2020 14:36:12 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/arm: fixes pixel clock enabled with wrong format
Date: Thu, 23 Apr 2020 23:35:51 -0700
Message-Id: <20200424063551.14336-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZTlVOS01CQkJCTUJPQ0lPSVlXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxQ6Ijo*PTg*HlYTM0IQNSIQ
 HBQaCSJVSlVKTkNMTEpLSkxNS09IVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBSElPTTcG
X-HM-Tid: 0a71aae69f0d93bakuwsc0a69482514
X-Mailman-Approved-At: Fri, 24 Apr 2020 07:15:40 +0000
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

The pixel clock is still enabled when the format is wrong.
no error branch handle, and also some register is not set
in this case, e.g: HDLCD_REG_<color>_SELECT. Maybe we
should disable this clock and throw an warn message when
this happened.
With this change, the code maybe a bit more readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>

Changes since V1:
*add format error handle, if format is not correct, throw
an warning message and disable this clock.

Link for V1:
*https://lore.kernel.org/patchwork/patch/1228501/
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index af67fefed38d..f3945dee2b7d 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -96,7 +96,7 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
 	}
 
 	if (WARN_ON(!format))
-		return 0;
+		return -EINVAL;
 
 	/* HDLCD uses 'bytes per pixel', zero means 1 byte */
 	btpp = (format->bits_per_pixel + 7) / 8;
@@ -125,7 +125,7 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
 	return 0;
 }
 
-static void hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
+static int hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
 	struct drm_display_mode *m = &crtc->state->adjusted_mode;
@@ -162,9 +162,10 @@ static void hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 	err = hdlcd_set_pxl_fmt(crtc);
 	if (err)
-		return;
+		return err;
 
 	clk_set_rate(hdlcd->clk, m->crtc_clock * 1000);
+	return 0;
 }
 
 static void hdlcd_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -173,7 +174,11 @@ static void hdlcd_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
 
 	clk_prepare_enable(hdlcd->clk);
-	hdlcd_crtc_mode_set_nofb(crtc);
+	if (hdlcd_crtc_mode_set_nofb(crtc)) {
+		DRM_DEBUG_KMS("Invalid format, pixel clock enable failed!\n");
+		clk_disable_unprepare(hdlcd->clk);
+		return;
+	}
 	hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 1);
 	drm_crtc_vblank_on(crtc);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
