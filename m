Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840C117FA07
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 14:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07E389DB4;
	Tue, 10 Mar 2020 13:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3D789DB4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:02:14 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03B1320409;
 Tue, 10 Mar 2020 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583845334;
 bh=AVzm+BISmI/wJXjIKEQkgYUROhyHeNW4UtDhWxsdGk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PFep8quAmuiL7YNiBfZDgAZFeQQsLkQS+IDx2w/pGFwFgaKnLY5zOlMDUUsW0QiPb
 47UfeFuBEARVaJgF+vHrqYj3YRlZvdas1MHR+cA8fbxFhfcchm5fG8rQNlYboVAzNG
 PJkKid2S0B3OajdGEfI4dMtiXSS+4f6RftACWqdE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.5 144/189] drm: kirin: Revert "Fix for hikey620 display
 offset problem"
Date: Tue, 10 Mar 2020 13:39:41 +0100
Message-Id: <20200310123654.404244877@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310123639.608886314@linuxfoundation.org>
References: <20200310123639.608886314@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
