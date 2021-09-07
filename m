Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F740224E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 04:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CCE8994D;
	Tue,  7 Sep 2021 02:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F678994D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:49:17 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 757A082C2B;
 Tue,  7 Sep 2021 04:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1630982955;
 bh=q4i0mnG+dyIW4cD7ENtUsKtdOrMH3g2u1hVrAT+Rpx0=;
 h=From:To:Cc:Subject:Date:From;
 b=AX3eKsVaWcbYqGMiXphmsjVM+66DPl0tC6VNtMMwXRlREG5CCaCnfNtrusOlIWZsx
 LZlvcnvcjTDfo/VqCM+mfZaoLxQfn2HIIPNg8VYQYxc1N+ZN8TaF3EFLl7zSsYUtD1
 u4PdCbN8ifIxHvAphSm2tuQNX/cn6XlNuyRg9n2QKPJ8R9mAiLQ1oeiTlQ5KsRGUKk
 cKVKSOGHczSdQWOH1PDi7Ib9r1hPTIGvrR3kYE1kQTMl7dozmDTttgWU8UelXYdyo3
 oARvr0ZgFTCLQH6tsXF4uCZwuO65TvKcwxOEdls6fTddWtNxJWQ+5aaU9vmasao1wU
 +FS6huqFuDyCA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
Date: Tue,  7 Sep 2021 04:49:00 +0200
Message-Id: <20210907024900.873850-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mxsfb->crtc.funcs may already be NULL when unloading the driver,
in which case calling mxsfb_irq_disable() via drm_irq_uninstall() from
mxsfb_unload() leads to NULL pointer dereference.

Since all we care about is masking the IRQ and mxsfb->base is still
valid, just use that to clear and mask the IRQ.

Fixes: ae1ed00932819 ("drm: mxsfb: Stop using DRM simple display pipeline helper")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Abrecht <public@danielabrecht.ch>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index ec0432fe1bdf8..86d78634a9799 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -173,7 +173,11 @@ static void mxsfb_irq_disable(struct drm_device *drm)
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
 
 	mxsfb_enable_axi_clk(mxsfb);
-	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
+
+	/* Disable and clear VBLANK IRQ */
+	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+
 	mxsfb_disable_axi_clk(mxsfb);
 }
 
-- 
2.33.0

