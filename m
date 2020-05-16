Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A71D64B2
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21926E288;
	Sat, 16 May 2020 23:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1F76E270
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589665872; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qffdGDv3DgtfzooGKPawMUzSJPFPf7ZHHFvRxoHINpg=;
 b=OHFD6DUXNlYjXNKC6RI3DWsZnTlbGbayGdsGH/IYtQw1ElthnULEcHPG33W5ll/6Apam1d
 Cu+6aOiPk6W5veB0eMplQAwtw45H3KkiSZm4GshlzIQXts9t75nEZxkBFWH3M9i7LLHcXz
 wYY6YEpmnpvdUpaQ4HjaG0biVnQr6Gs=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 05/12] gpu/drm: Ingenic: Fix opaque pointer casted to wrong
 type
Date: Sat, 16 May 2020 23:50:50 +0200
Message-Id: <20200516215057.392609-5-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:50 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The opaque pointer passed to the IRQ handler is a pointer to the
drm_device, not a pointer to our ingenic_drm structure.

It still worked, because our ingenic_drm structure contains the
drm_device as its first field, so the pointer received had the same
value, but this was not semantically correct.

Cc: stable@vger.kernel.org # v5.3
Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 0c472382a08b..97244462599b 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -476,7 +476,7 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
 
 static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 {
-	struct ingenic_drm *priv = arg;
+	struct ingenic_drm *priv = drm_device_get_priv(arg);
 	unsigned int state;
 
 	regmap_read(priv->map, JZ_REG_LCD_STATE, &state);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
