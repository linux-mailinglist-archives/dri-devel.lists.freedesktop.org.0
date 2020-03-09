Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1017E963
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6C16E544;
	Mon,  9 Mar 2020 19:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AC56E542
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:15 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1B87428E;
 Mon,  9 Mar 2020 20:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783592;
 bh=ysESZP46+pI7Egk+158z5jeEehIwFuG7+YFNAwSRNpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HoZ0OtzmbqnSzFiOmFTp0MfQwsIjN7jNx/uNoRgDgj8CSOK4Zz7YDTpQm1Nv/OhiZ
 3v6QoNGXpMYo87wlDDSWDMgzJHeLZdSjYqok+wTBX8dhWyzUoIkWicEqnG+imjMgDc
 S/6IB22jZrTc/ANyGxj/QV2Nx1ayV3wm39mDdi0g=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/21] drm: mxsfb: Enable vblank handling
Date: Mon,  9 Mar 2020 21:52:09 +0200
Message-Id: <20200309195216.31042-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable vblank handling when the CRTC is turned on and disable it when it
is turned off. This requires moving vblank init after the KMS pipeline
initialisation, otherwise drm_vblank_init() gets called with 0 CRTCs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 15 +++++++++------
 drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++++-
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index e324bd2a63a5..72b4f6a947a4 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -160,12 +160,6 @@ static int mxsfb_load(struct drm_device *drm, unsigned long flags)
 
 	pm_runtime_enable(drm->dev);
 
-	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
-	if (ret < 0) {
-		dev_err(drm->dev, "Failed to initialise vblank\n");
-		goto err_vblank;
-	}
-
 	/* Modeset init */
 	drm_mode_config_init(drm);
 
@@ -175,6 +169,15 @@ static int mxsfb_load(struct drm_device *drm, unsigned long flags)
 		goto err_vblank;
 	}
 
+	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to initialise vblank\n");
+		goto err_vblank;
+	}
+
+	/* Start with vertical blanking interrupt reporting disabled. */
+	drm_crtc_vblank_off(&mxsfb->crtc);
+
 	ret = mxsfb_attach_bridge(mxsfb);
 	if (ret) {
 		dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index ac2696c8483d..640305fb1068 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -322,8 +322,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	dma_addr_t paddr;
 
 	pm_runtime_get_sync(drm->dev);
-
 	mxsfb_enable_axi_clk(mxsfb);
+
+	drm_crtc_vblank_on(crtc);
+
 	mxsfb_crtc_mode_set_nofb(mxsfb);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
@@ -353,6 +355,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	spin_unlock_irq(&drm->event_lock);
 
+	drm_crtc_vblank_off(crtc);
+
 	mxsfb_disable_axi_clk(mxsfb);
 	pm_runtime_put_sync(drm->dev);
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
