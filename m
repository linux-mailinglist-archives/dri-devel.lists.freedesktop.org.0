Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43E273C8A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF1F6E82D;
	Tue, 22 Sep 2020 07:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB1989A5C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 18:18:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e11so522167wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wN1VQcr5gopN//+YP1c+kyMLVVksKqlHg3J3zrz7FOU=;
 b=k8ytlwjsFo4BX7JUh7CapBzDGKRouXqIq9lZRGGlkP3m84azSYvitonhDLI+f0lqEx
 hIUX1oEPHGxhWhptxVKAHTYTJ5ECdL4IZZ89GbFr+XImQxZBn2eedIMpr1Jk1BGSohAm
 zZnEj8y3JuJO8a4zR5HmoSEq2R9/ygi3Sz884uloe2ckSJEqy2UE6VE7ug8jOn2aVKIT
 cUYxsW8blV8BPFeIUUFBVG/eebmKS7TOCS4BdFhKdmxOUuhG9m+LpsgaXZXjZwG8yUhz
 aSzn1x4rbgQUMkTbauI0jscb4TDFn8r6q3xrshq9B+sc6vRZx6xzdkAmZXPUN7ujw/dB
 N33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wN1VQcr5gopN//+YP1c+kyMLVVksKqlHg3J3zrz7FOU=;
 b=r0mV4sHD/deLkSAgKnln4qit/Mffs9qeUB+oBvZe8i9px5HdGW3Z+D7UqYqb81Fyhf
 8i4gN+70T8iHgR8HJnhrtyo+XSCyWGSseag//LXh2wS1ekgVSPNloO7Ps0bE8zhnGfh2
 6jKg/n60U47RS2uldEutL3qp03PQsQy9flcy5xMtR8GDyFxRkKqbZTlZ0/Dnz432nImD
 EdAlSm+LfrrtAzDTYRX/ApkRNjgazHCmbDA1f8k/k7fxPQ8VH3CbcjTxkp9HTWPMTWEj
 /MPtUPu80QfJh90/4Ld0jbo4/9q352siCWz5ekDdmB1m24Bwm2/txlyASbu0jmZj9NIT
 0MDA==
X-Gm-Message-State: AOAM532uV9CvwGqqAQ9vAj2fiq6GJBpYYGdgfFA8UrG6BRBOmsmlrA4W
 wMHkw6VSvhnfOeJoyFBMFtE=
X-Google-Smtp-Source: ABdhPJwsqIQmUMoz2qqPyu7m3k2+6Iq+CcK5QecIPbZOLTffC9yTCP7aw529i0+eO1s8CZ8xoLOeDA==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr607808wmi.138.1600712308906; 
 Mon, 21 Sep 2020 11:18:28 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id h16sm23523249wre.87.2020.09.21.11.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:18:28 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 1/3] drm: rockchip: hdmi: remove vop_crtc_mode_fixup to fix
 clock handling
Date: Mon, 21 Sep 2020 20:18:01 +0200
Message-Id: <20200921181803.1160-2-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921181803.1160-1-vicencb@gmail.com>
References: <20200921181803.1160-1-vicencb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:37 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Under certain conditions vop_crtc_mode_fixup rounds the clock
148500000 to 148501000 which leads to the following error:
dwhdmi-rockchip ff940000.hdmi: PHY configuration failed (clock 148501000)

The issue was found on RK3399 booting with u-boot. U-boot configures the
display at 2560x1440 and then linux comes up with a black screen.
A workaround was to un-plug and re-plug the HDMI display.

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 45 ---------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c80f7d9fd13f..fe80da652994 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1142,50 +1142,6 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&vop->irq_lock, flags);
 }
 
-static bool vop_crtc_mode_fixup(struct drm_crtc *crtc,
-				const struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-	struct vop *vop = to_vop(crtc);
-	unsigned long rate;
-
-	/*
-	 * Clock craziness.
-	 *
-	 * Key points:
-	 *
-	 * - DRM works in in kHz.
-	 * - Clock framework works in Hz.
-	 * - Rockchip's clock driver picks the clock rate that is the
-	 *   same _OR LOWER_ than the one requested.
-	 *
-	 * Action plan:
-	 *
-	 * 1. When DRM gives us a mode, we should add 999 Hz to it.  That way
-	 *    if the clock we need is 60000001 Hz (~60 MHz) and DRM tells us to
-	 *    make 60000 kHz then the clock framework will actually give us
-	 *    the right clock.
-	 *
-	 *    NOTE: if the PLL (maybe through a divider) could actually make
-	 *    a clock rate 999 Hz higher instead of the one we want then this
-	 *    could be a problem.  Unfortunately there's not much we can do
-	 *    since it's baked into DRM to use kHz.  It shouldn't matter in
-	 *    practice since Rockchip PLLs are controlled by tables and
-	 *    even if there is a divider in the middle I wouldn't expect PLL
-	 *    rates in the table that are just a few kHz different.
-	 *
-	 * 2. Get the clock framework to round the rate for us to tell us
-	 *    what it will actually make.
-	 *
-	 * 3. Store the rounded up rate so that we don't need to worry about
-	 *    this in the actual clk_set_rate().
-	 */
-	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
-	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
-
-	return true;
-}
-
 static bool vop_dsp_lut_is_enabled(struct vop *vop)
 {
 	return vop_read_reg(vop, 0, &vop->data->common->dsp_lut_en);
@@ -1512,7 +1468,6 @@ static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
-	.mode_fixup = vop_crtc_mode_fixup,
 	.atomic_check = vop_crtc_atomic_check,
 	.atomic_begin = vop_crtc_atomic_begin,
 	.atomic_flush = vop_crtc_atomic_flush,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
