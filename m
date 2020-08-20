Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52BF24AD7C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AF6E896;
	Thu, 20 Aug 2020 03:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3A26E896
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:56:25 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ds1so397377pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4LFTcC1aLlcyeO02My6c2qM77nYX84bs/G0eccqWdp8=;
 b=zKLxVFu4Dg3PQ1EfE/gMN6Q/9V3SUjEcpJci/s0ywSt5tlKuJsaiV58p4HFeN3/5TL
 51PwPoSUzkq+piYo6ZuUNZQMaKxlJnkKKDKUdmONgsBdTTES0jHonRkMIqVYFJp+TLh/
 2KL/xWSqUUjrTIn0y2tsgmuVreBtpvGInfY1p8MfClhqL2L+VN9D+H37sDAJx7BynlgT
 WxK6cZrKv3hTbdKSYdfJwrtWGLPNUo4aefePUbFWGl6GiOrOXQGsYtlSLiDSxPZr9Tbh
 8puli8qrbhX58+IJmOagiJgdfHOja1jqoNyL2htDUvoTa5skihArxs4N6gQ1ys3FFCuk
 xqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4LFTcC1aLlcyeO02My6c2qM77nYX84bs/G0eccqWdp8=;
 b=i1tYoaIqcM0CyQgK6t32EDdO1+SYrd5dBnUFH3fmOAbpRcfT0xkb+QrLcmYdY1kpSK
 /2YvhOhCafiabB+yhQbWSlpRRJEeo8Q5KTGEUKi3Gk6PdBFFF8jdoH2SDCDJ77WCF1XJ
 k1odM6as17Wd5VVvKIFIgdspVET4O59rrwMM1zGv7wTqJyWkwoYFYbl90+STUNUPyWWm
 GF2u9PK4uevALWjEf5/9l5pHO+BBy91wc9iw1QAhPJa7CFMtlhPWo0yRHEEC+kpaRB7b
 Srzzbc5jdcAt+zNx6b5We4Mkt6b3K/RjyEAc/P9jd21V9BoHgDydI9MMHvX+fE2dOkg6
 ig1w==
X-Gm-Message-State: AOAM5304RTDuHuIUI3dUissh2XaMRlbdIzAKHa3x2E6vDKV6UC5BMQEO
 /kNovdRspsOxBZmgQ+sON1F4QA==
X-Google-Smtp-Source: ABdhPJwzXXRtWo8gBWKqXwGsX+9ri1iFa4kPakvat1NHTNiDKd791H+hxLLpHH4BLHMLq5iZqXv0Jg==
X-Received: by 2002:a17:90a:4dca:: with SMTP id
 r10mr858796pjl.200.1597895784572; 
 Wed, 19 Aug 2020 20:56:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 o65sm759429pfg.176.2020.08.19.20.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 20:56:23 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/3] drm: hikey9xx: remove wait for VACTIVE IRQ
Date: Thu, 20 Aug 2020 03:56:17 +0000
Message-Id: <20200820035617.5836-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820034100.128062-2-john.stultz@linaro.org>
References: <20200820034100.128062-2-john.stultz@linaro.org>
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
Cc: Liwei Cai <cailiwei@hisilicon.com>,
 Vincent Donnefort <vincent.donnefort@arm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vincent Donnefort <vincent.donnefort@arm.com>

A quick add-on to my earlier fixup series as I realized what the
performance problem was.

This is against Mauro's tree here:
    https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master/

For each display cycle, the Kirin960 display IP will generate a VACTIVE
interrupt followed by a VBLANK. During a FBIOPAN ioctl, the driver will then
wait for the first one to then wait for the second one. This is an issue when
the CPU load is too low: the wait_event() function might trigger a transition
to a deep sleep state and then, waking up from that state will take too much
time to catch the VBLANK interrupt on time, the difference between those two
interrupts being only 60 us.

* Ideal case:                   ACT                VBL
				+                  +
				v                  v
		 ---> wait(ACT) +------> wait(VBL) +-->

* Our case:                     ACT VBL        ACT VBL
				+   +          +   +
				v   v          v   v
		 ---> wait(ACT) +------> wait(VBL) +-->

The wait for VACTIVE IRQ can safely be removed: there is no hardware access
performed between the VACTIVE and the VBLANK IRQs.

This behavior has been introduced from 4.11 with the following patch:
a3fbb53f4 drm/atomic: Wait for vblank whenever a plane is added to state.

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Liwei Cai <cailiwei@hisilicon.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Chen Feng <puck.chen@hisilicon.com>
Signed-off-by: Vincent Donnefort <vincent.donnefort@arm.com>
[jstultz: hand-ported to Mauro's patch set]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../hikey9xx/gpu/kirin9xx_drm_dpe_utils.c     |  2 +-
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   |  5 ---
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c | 36 -------------------
 3 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
index 82a0edb95953..cc80689d90c9 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
@@ -582,7 +582,7 @@ void dpe_interrupt_unmask(struct dss_crtc *acrtc)
 	writel(unmask, dss_base + GLB_CPU_PDP_INT_MSK);
 
 	unmask = ~0;
-	unmask &= ~(BIT_VSYNC | BIT_VACTIVE0_END | BIT_LDI_UNFLOW);
+	unmask &= ~(BIT_VSYNC | BIT_LDI_UNFLOW);
 
 	writel(unmask, dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index 7adbd924bec2..c99ce7c4d479 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -440,11 +440,6 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 	isr_s1 &= ~(readl(dss_base + GLB_CPU_PDP_INT_MSK));
 	isr_s2 &= ~(readl(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK));
 
-	if (isr_s2 & BIT_VACTIVE0_END) {
-		ctx->vactive0_end_flag++;
-		wake_up_interruptible_all(&ctx->vactive0_end_wq);
-	}
-
 	if (isr_s2 & BIT_VSYNC) {
 		ctx->vsync_timestamp = ktime_get();
 		drm_crtc_handle_vblank(crtc);
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 5ac7f4b31d99..932bad2f428e 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -822,40 +822,6 @@ void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
 	DRM_INFO("-.\n");
 }
 
-static int hisi_dss_wait_for_complete(struct dss_crtc *acrtc)
-{
-	int ret = 0;
-	u32 times = 0;
-	u32 prev_vactive0_end = 0;
-	struct dss_hw_ctx *ctx = acrtc->ctx;
-
-	prev_vactive0_end = ctx->vactive0_end_flag;
-
-REDO:
-	ret = wait_event_interruptible_timeout(ctx->vactive0_end_wq,
-					       (prev_vactive0_end != ctx->vactive0_end_flag),
-		msecs_to_jiffies(300));
-	if (ret == -ERESTARTSYS) {
-		if (times < 50) {
-			times++;
-			mdelay(10);
-			goto REDO;
-		}
-	}
-
-	if (ret <= 0) {
-		disable_ldi(acrtc);
-		hisifb_mctl_sw_clr(acrtc);
-		DRM_ERROR("wait_for vactive0_end_flag timeout! ret=%d.\n", ret);
-
-		ret = -ETIMEDOUT;
-	} else {
-		ret = 0;
-	}
-
-	return ret;
-}
-
 void hisi_fb_pan_display(struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
@@ -932,7 +898,6 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hisi_dss_unflow_handler(ctx, true);
 
 	enable_ldi(acrtc);
-	hisi_dss_wait_for_complete(acrtc);
 }
 
 void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane,
@@ -1001,5 +966,4 @@ void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane,
 	hisi_dss_unflow_handler(ctx, true);
 
 	enable_ldi(acrtc);
-	hisi_dss_wait_for_complete(acrtc);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
