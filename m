Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F6430501
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 23:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011266E5A1;
	Sat, 16 Oct 2021 21:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9426E5A1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 21:05:05 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8CFD0831FD;
 Sat, 16 Oct 2021 23:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634418303;
 bh=wS1cuU96eC/58PjDgwWhPlFouLFeK7zreO1/Q0DhsEE=;
 h=From:To:Cc:Subject:Date:From;
 b=OPEIS08B6nlWQ87R5wt2W02Fs7iwWPJw49oj2leEQIoDieEu1tZTVOJcoFVs+rqW8
 bZcNHyVjdUHxcGd8ao/x54aPsAwnZS7nH5IAytWF5ibPJWbznDfdfYhgTeIx6lZMxj
 f+/W1mYcZJwUuB/Jy+ZhUtAitSQF8i59GD2qxSPMwsvqdgqrGjW7C0Bq6WoV0qhllC
 C00h0NGo2HY0V/r0FPdbCEARVQicsI5qaUN3ipTDbTHC4kL++Gpk+GvVe2xcNQJzVW
 xXS6kHXrb6l/omT0a84XjRy/wem8PyVQVgqLg/kNA6XZ9y+WrDw0jbhST0xCcg1CJu
 bXhHB/700fCNA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
Date: Sat, 16 Oct 2021 23:04:46 +0200
Message-Id: <20211016210446.171616-1-marex@denx.de>
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
index ec0432fe1bdf..86d78634a979 100644
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

