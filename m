Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F44D1F23F8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB336E9B7;
	Mon,  8 Jun 2020 23:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0936E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 23:18:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E2532086A;
 Mon,  8 Jun 2020 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658302;
 bh=LpxpxJ35oFWhuM87IgD9IRxSyxS+069w7P+E9CDeK6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eAuYSR+uO5U0EiLS42w6u1n6RktmRfZa6o/JzhlkuQ9FjJ7+cDT9RXeoOTy8UxIyg
 fhw2J5G+jpbmyz1hsCEZmszVnUnAqCwPZcH2Zu9a2bciJ0uertQNVXPNHx3crmZbt0
 fkf5kGjFme78dUPLUsmnpsxjefUvLnN2MvtSyrp4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 305/606] gpu/drm: Ingenic: Fix opaque pointer
 casted to wrong type
Date: Mon,  8 Jun 2020 19:07:10 -0400
Message-Id: <20200608231211.3363633-305-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Paul Cercueil <paul@crapouillou.net>, Sasha Levin <sashal@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit abf56fadf0e208abfb13ad1ac0094416058da0ad ]

The opaque pointer passed to the IRQ handler is a pointer to the
drm_device, not a pointer to our ingenic_drm structure.

It still worked, because our ingenic_drm structure contains the
drm_device as its first field, so the pointer received had the same
value, but this was not semantically correct.

Cc: stable@vger.kernel.org # v5.3
Fixes: 90b86fcc47b4 ("DRM: Add KMS driver for the Ingenic JZ47xx SoCs")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20200516215057.392609-5-paul@crapouillou.net
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 8f5077370a52..e9900e078d51 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -474,7 +474,7 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
 
 static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 {
-	struct ingenic_drm *priv = arg;
+	struct ingenic_drm *priv = drm_device_get_priv(arg);
 	unsigned int state;
 
 	regmap_read(priv->map, JZ_REG_LCD_STATE, &state);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
