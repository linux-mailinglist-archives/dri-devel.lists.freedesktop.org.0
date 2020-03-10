Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B9F17F583
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 11:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BF76E87D;
	Tue, 10 Mar 2020 10:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C806E87D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 10:58:55 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FC612465A;
 Tue, 10 Mar 2020 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583837935;
 bh=Ba4qS50XY8/z+sjJC/em81EPbPRYQiG2I5vtxexSgQg=;
 h=Subject:To:Cc:From:Date:From;
 b=dyp3norIw5XHDRw0vOh6xjfnMCBKDfnwQ0vCNuO2TrhPNxEQFsnGLX+iy74yWdF1q
 zXPWAIwHjNHY2y6pE1Yb6d8QucNqdAdOezkdjrw/sP4IZnME3io+3rl5UYcsMlNDNO
 tNM/aPRMcIkH+JA05qkQdAlc/7UJ5fbi56GIdBQ8=
Subject: Patch "drm: kirin: Revert "Fix for hikey620 display offset problem""
 has been added to the 5.4-stable tree
To: 20200303163228.52741-1-john.stultz@linaro.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 john.stultz@linaro.org, kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 sam@ravnborg.org, xinliang.liu@linaro.org, zourongrong@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 10 Mar 2020 11:58:17 +0100
Message-ID: <1583837897238219@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm: kirin: Revert "Fix for hikey620 display offset problem"

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-kirin-revert-fix-for-hikey620-display-offset-problem.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 1b79cfd99ff5127e6a143767b51694a527b3ea38 Mon Sep 17 00:00:00 2001
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 3 Mar 2020 16:32:28 +0000
Subject: drm: kirin: Revert "Fix for hikey620 display offset problem"

From: John Stultz <john.stultz@linaro.org>

commit 1b79cfd99ff5127e6a143767b51694a527b3ea38 upstream.

This reverts commit ff57c6513820efe945b61863cf4a51b79f18b592.

With the commit ff57c6513820 ("drm: kirin: Fix for hikey620
display offset problem") we added support for handling LDI
overflows by resetting the hardware.

However, its been observed that when we do hit the LDI overflow
condition, the irq seems to be screaming, and we do nothing but
stream:
  [drm:ade_irq_handler [kirin_drm]] *ERROR* LDI underflow!
over and over to the screen

I've tried a few appraoches to avoid this, but none has yet
been successful and the cure here is worse then the original
disease, so revert this for now.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Fixes: ff57c6513820 ("drm: kirin: Fix for hikey620 display offset problem")
Signed-off-by: John Stultz <john.stultz@linaro.org>
Acked-by: Xinliang Liu <xinliang.liu@linaro.org>
Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200303163228.52741-1-john.stultz@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h |    1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |   20 --------------------
 2 files changed, 21 deletions(-)

--- a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
@@ -83,7 +83,6 @@
 #define VSIZE_OFST			20
 #define LDI_INT_EN			0x741C
 #define FRAME_END_INT_EN_OFST		1
-#define UNDERFLOW_INT_EN_OFST		2
 #define LDI_CTRL			0x7420
 #define BPP_OFST			3
 #define DATA_GATE_EN			BIT(2)
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -46,7 +46,6 @@ struct ade_hw_ctx {
 	struct clk *media_noc_clk;
 	struct clk *ade_pix_clk;
 	struct reset_control *reset;
-	struct work_struct display_reset_wq;
 	bool power_on;
 	int irq;
 
@@ -136,7 +135,6 @@ static void ade_init(struct ade_hw_ctx *
 	 */
 	ade_update_bits(base + ADE_CTRL, FRM_END_START_OFST,
 			FRM_END_START_MASK, REG_EFFECTIVE_IN_ADEEN_FRMEND);
-	ade_update_bits(base + LDI_INT_EN, UNDERFLOW_INT_EN_OFST, MASK(1), 1);
 }
 
 static bool ade_crtc_mode_fixup(struct drm_crtc *crtc,
@@ -304,17 +302,6 @@ static void ade_crtc_disable_vblank(stru
 			MASK(1), 0);
 }
 
-static void drm_underflow_wq(struct work_struct *work)
-{
-	struct ade_hw_ctx *ctx = container_of(work, struct ade_hw_ctx,
-					      display_reset_wq);
-	struct drm_device *drm_dev = ctx->crtc->dev;
-	struct drm_atomic_state *state;
-
-	state = drm_atomic_helper_suspend(drm_dev);
-	drm_atomic_helper_resume(drm_dev, state);
-}
-
 static irqreturn_t ade_irq_handler(int irq, void *data)
 {
 	struct ade_hw_ctx *ctx = data;
@@ -331,12 +318,6 @@ static irqreturn_t ade_irq_handler(int i
 				MASK(1), 1);
 		drm_crtc_handle_vblank(crtc);
 	}
-	if (status & BIT(UNDERFLOW_INT_EN_OFST)) {
-		ade_update_bits(base + LDI_INT_CLR, UNDERFLOW_INT_EN_OFST,
-				MASK(1), 1);
-		DRM_ERROR("LDI underflow!");
-		schedule_work(&ctx->display_reset_wq);
-	}
 
 	return IRQ_HANDLED;
 }
@@ -919,7 +900,6 @@ static void *ade_hw_ctx_alloc(struct pla
 	if (ret)
 		return ERR_PTR(-EIO);
 
-	INIT_WORK(&ctx->display_reset_wq, drm_underflow_wq);
 	ctx->crtc = crtc;
 
 	return ctx;


Patches currently in stable-queue which might be from john.stultz@linaro.org are

queue-5.4/usb-dwc3-gadget-update-chain-bit-correctly-when-using-sg-list.patch
queue-5.4/drm-msm-fix-return-type-of-dsi_mgr_connector_mode_va.patch
queue-5.4/drm-kirin-revert-fix-for-hikey620-display-offset-problem.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
