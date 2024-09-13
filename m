Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB7977911
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D1110EC89;
	Fri, 13 Sep 2024 07:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eg/fk5DH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB6610EC83
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:12:03 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cba0dc922so12371935e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 17:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726186321; x=1726791121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6T+0eaJ0+QZO0CeXbfyrLWwnYfT3dS09dqDCJalwF5E=;
 b=Eg/fk5DHeVNqpQgy8viyzwiVtA28kx4ONDMg+YZO/rrKqSXsKQvBIXo3xfGsADauq8
 FozY4DpXbKMISiOQLMPZrUE+tpZ67UanNHpIkoXolZ87E3N3mbmRWjuTP0oWuCNtzciM
 z48G/3Ouu6x/z1raueMp8lqXIRQtvuR/xYOr0liYdtq5RUwlUu/86x/HK66j39C3zAXm
 VZMESHCuUP/71O8YhpLtcL3GEgt22xYT3i+fjVT8Fwk0olKk2YmPwQij73R0MWBesbXX
 Md4Fcw2cb/puNXw8A1mVymyEYVkVrhe6xRvDfaWEtCte1x+g+FSmbMizu0cRtEXyxEzI
 wyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726186321; x=1726791121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6T+0eaJ0+QZO0CeXbfyrLWwnYfT3dS09dqDCJalwF5E=;
 b=JHGsFp/PYqRcnL6aZ/CXQ87Ke+Yze1d4YqwR06Z4ujWp6YGDBNTE9kMg2OTk25Ofk4
 HCPPVy89U0qSyPzq/BZaZu7QroOEx3tnmvca18nP6wyzOi48eEsOK1JRS3/Edk0+B6BL
 hVoult7S5GByyH0rPdispQs8NOt9H250/GPtMOemjAXyifoWke8pXjJrBe7jVBP/s1QK
 znRJHUMDEZhF2Mv4lQiFSb1eu1cbMUS59d0Jo9w8RgNHnOp41T0O0pMpwz/8zaWREelV
 l1ugWcqJIYhKgtVtiRGxrtZvw7vDcRHC+d0MRpHxjLA6yoCaXDSnM2pX2LOAvq8fhVuo
 DcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVeMG31brZk6cflj/VjVg3pdabOTh3NaGeLTOdDC30KDZdEzrE/GVXtdAr553ZYkQFpsP1qKrlBCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD1ILdaaHpRyS85h5kT6EFBfUdi2Geclhbdwu8nO/f3hLGtiIi
 a4h1vW4dtgZIUJBQvB78uGqejOvKfjXlOvIkDjrvVRNRKV2gOzPq
X-Google-Smtp-Source: AGHT+IGMzxr+56gg6zPXGQJ2O6ilxKturjM+t2Z4vXloB1d4rAN+9SK2jOPXDXS1PNchMW2TBuikaw==
X-Received: by 2002:a05:600c:1547:b0:425:7c5f:1bac with SMTP id
 5b1f17b1804b1-42cdb547d32mr35158755e9.21.1726186321385; 
 Thu, 12 Sep 2024 17:12:01 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:85e4:cf41:16db:65d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b002a9asm6433075e9.0.2024.09.12.17.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 17:12:00 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com,
 Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: [PATCH v2 1/1] drm/i2c: tda998x: Make use of irq_get_trigger_type()
Date: Fri, 13 Sep 2024 02:11:56 +0200
Message-Id: <20240913001156.56634-2-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913001156.56634-1-vassilisamir@gmail.com>
References: <20240913001156.56634-1-vassilisamir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Sep 2024 07:03:15 +0000
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

Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
simple irq_get_trigger_type(irq).

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16..8dfcebec800e 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1911,8 +1911,7 @@ static int tda998x_create(struct device *dev)
 		/* init read EDID waitqueue and HDP work */
 		init_waitqueue_head(&priv->wq_edid);
 
-		irq_flags =
-			irqd_get_trigger_type(irq_get_irq_data(client->irq));
+		irq_flags = irq_get_trigger_type(client->irq);
 
 		priv->cec_glue.irq_flags = irq_flags;
 
-- 
2.25.1

