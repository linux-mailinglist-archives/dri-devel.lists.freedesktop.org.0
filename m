Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA03952C6
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 21:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E874A6E3A0;
	Sun, 30 May 2021 19:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2276E3A0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 19:44:54 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id t17so2511560ljk.7
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qmoaNHWnrWPMeHd+/Ye+WmhjTNOaVcqlU6T2JKzPK9k=;
 b=Jt2MO9vy9ThiMePCacd0b2w7EZnQG+rLCwpnUY/7IoDiAStDMtZUTJ99tHyKcCGUuD
 ZF7FZpChJaNeuadyeicoIPtd4KgeHU/s67ImKcwoHOer+f9xVGsGUQSCwmVUUcK42tNb
 ysk+y50vtKyr1E3YyVV8JDB/gDyckDPPxzu60QgGngHcw71dK/MD2kQKYLzw0UrbRS4B
 zhd39nxXkiLFFpoWG/gXpuZ9nxqxTYVTEVd0Cr/+Fmo1/dfFqLc9yTPgfeZz4Buxi3NI
 MPTuuops7kl7HPzO6w65NQEVGdeaKb8Pv1/wcH5ddM3oGyVwbukgblujdV/mtwIIKiop
 Tzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qmoaNHWnrWPMeHd+/Ye+WmhjTNOaVcqlU6T2JKzPK9k=;
 b=j+pSMtI1naO3/pJGjgq6NjxKtjwQaoc7Bz/Rt8dJqjNntSTJtBgIX8s4Jh3Xaz1Xvu
 c6QiL4z7CIUBaJ/8xpm/zgvD9+6Qz1IuEYKk/HN/w6mYUHX1L4mh7/OKfOWYjNTqF0QC
 na1nK6v9Y7PoIW8WaOa+Yz4N0q0cLGq92r3Ke7cfOgtxNfQblorGn5B2XNRwQjqCN8ON
 bowRUKTh7i+AnQ9pTRGJ/6eplrykR0A9cvdPYT2vMpOiK7ETX5ghxuwt24y/JeeJDctV
 aGUtrIacdYBuXQ6KKw1fJiBPk1BjIt0OWr+Xo5TdnR+TMacf7Sl60uBe1iQoqnHS6fAE
 0r2g==
X-Gm-Message-State: AOAM531J84mPxskhSqBb72L2aKyBMAUo1goxLjloQvtoJJBfLxFN/om7
 89jdTV1HtuBCyDnLsCIViKEVqg==
X-Google-Smtp-Source: ABdhPJyyFu6Ar9RXpa1uzdQc6ZOARtHKvY4EZYWVfdUi86tJ7nk9A5NFSXEVffvIZh64K3qEh/+SEw==
X-Received: by 2002:a2e:8753:: with SMTP id q19mr13958022ljj.334.1622403892615; 
 Sun, 30 May 2021 12:44:52 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id u11sm1095394lff.33.2021.05.30.12.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 12:44:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: ktd253: Stabilize backlight
Date: Sun, 30 May 2021 21:42:38 +0200
Message-Id: <20210530194238.2172318-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: newbyte@disroot.org, Stephan Gerhold <stephan@gerhold.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove interrupt disablement during backlight setting. It is
way to dangerous and makes platforms instable by having it
miss vblank IRQs leading to the graphics derailing.

The code is using ndelay() which is not available on
platforms such as ARM and will result in 32 * udelay(1)
which is substantial.

Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
Cc: Stephan Gerhold <stephan@gerhold.net>
Reported-by: newbyte@disroot.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/ktd253-backlight.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index a7df5bcca9da..b79a47c2801f 100644
--- a/drivers/video/backlight/ktd253-backlight.c
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -40,7 +40,6 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
 	int brightness = backlight_get_brightness(bl);
 	u16 target_ratio;
 	u16 current_ratio = ktd253->ratio;
-	unsigned long flags;
 
 	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
 
@@ -69,13 +68,9 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
 	}
 
 	/*
-	 * WARNING:
-	 * The loop to set the correct current level is performed
-	 * with interrupts disabled as it is timing critical.
 	 * The maximum number of cycles of the loop is 32
 	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
 	 */
-	local_irq_save(flags);
 	while (current_ratio != target_ratio) {
 		/*
 		 * These GPIO operations absolutely can NOT sleep so no
@@ -92,7 +87,6 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
 		else
 			current_ratio--;
 	}
-	local_irq_restore(flags);
 	ktd253->ratio = current_ratio;
 
 	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
-- 
2.31.1

