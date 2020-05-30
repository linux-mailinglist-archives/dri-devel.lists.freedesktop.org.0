Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46A1E8D66
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A116E9A5;
	Sat, 30 May 2020 03:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303F26E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:49 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7629B2E59;
 Sat, 30 May 2020 05:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808247;
 bh=ysESZP46+pI7Egk+158z5jeEehIwFuG7+YFNAwSRNpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bEvfqaE4q1foyaYgCONh1xolYii5P63u7CAGS9vqScobwJ7XCnRjelbEbKYdS397a
 yzpftN1ejhruGoaHYFWwsy1TMPxpjoNFFb7x0QrWTGk26U469FzBYsDjv16TkQbIKr
 B+CMXGQaBRBO8bV0BDG9+8KlnjxzeNuOLMYf75BI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/22] drm: mxsfb: Enable vblank handling
Date: Sat, 30 May 2020 06:10:07 +0300
Message-Id: <20200530031015.15492-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
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
