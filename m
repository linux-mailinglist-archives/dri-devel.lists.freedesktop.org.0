Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFC550667
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 19:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A2A10EDA1;
	Sat, 18 Jun 2022 17:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F232D10EC24
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 17:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655574250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5hi5Y2P4AaoHxeRi+XOi4q2sXUxnWpwxAI+NUv1HLlI=;
 b=D1JI+xjWQRcNjPKgLtzFLtmCuGYkFWOsAi5LnjAgaZZ+fiVIGBFrqNgo2cvUvoySyMbwGQ
 EA0QAXCYBQenQvcoJ6mwgMGdJJPSeDRjExBV+Ce0HphgOUd5hm9o8dLTVBfQElOyN8nh9k
 YdxohaKMBsZphuqcNHH3qfk348SyBPA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-Z6KWvIwUO3-K4rNqTSuEvw-1; Sat, 18 Jun 2022 13:44:05 -0400
X-MC-Unique: Z6KWvIwUO3-K4rNqTSuEvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so4619812wmb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 10:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hi5Y2P4AaoHxeRi+XOi4q2sXUxnWpwxAI+NUv1HLlI=;
 b=nluMOpSVGvc2upsA4Ra5Hkhg6OWUS3u/aKuvTBSBrvr2PFaflDg5TUtfUASGH4IZR3
 hPCpN5VMCcSTiSqjGzLXqBOFMeOA0knHOVdgVBTMusr/x0oo94AgHBfXh6o2RuDITkud
 RN95XsEUuQ87GPPWjUmWrUgcnADtMWKYL69I45XuZEdtVF0oFnLq5/9l3z1IDSHL/w5g
 AljSrpO87ZRlzc/M5ouJmblDddF+6lJnxFKsFDshZPIqSopyVU/Fp8icPSc+U4Gt0yHO
 jZaX6VE0UKd7BlHG1QJ/YLrDw2fx1/1gLUyceC+vEcwLjEjv0j9hnpmX8rMXYJ4sYlRU
 opHA==
X-Gm-Message-State: AJIora8tI0rA710tcCVewPsdI9iIYpY6baHtGhKaGWuOiPm9F8miHzNW
 quf3Dy1/4sUDtPIBbJxW3BLRJmwtywNNwqoHOqz9eB1ftYG0fPBzxJinpiXzSzoofM0cJEQp/89
 eH8wRxKKNfngOBoByc1CubCMc/ShO
X-Received: by 2002:a05:6000:1d97:b0:210:25d6:e125 with SMTP id
 bk23-20020a0560001d9700b0021025d6e125mr14547054wrb.464.1655574243796; 
 Sat, 18 Jun 2022 10:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uY9IYbz2YfUSz6WUjcqKlLdvkCI/TbZjixWRpmwqANowJNbfNJDqbKBvqI4F3Ge4YezLzLxQ==
X-Received: by 2002:a05:6000:1d97:b0:210:25d6:e125 with SMTP id
 bk23-20020a0560001d9700b0021025d6e125mr14547040wrb.464.1655574243532; 
 Sat, 18 Jun 2022 10:44:03 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r184-20020a1c2bc1000000b0039749b01ea7sm11790681wmr.32.2022.06.18.10.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 10:44:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Use new regmap bulk write support to drop custom
 bus
Date: Sat, 18 Jun 2022 19:43:38 +0200
Message-Id: <20220618174338.2253021-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Data writes for the ssd130x 4-wire SPI protocol need special handling, due
the Data/Command control (D/C) pin having to be toggled prior to the write.

The regmap API only allowed drivers to provide .reg_{read,write} callbacks
to do per register read/write, but didn't provide a way for drivers to do
the same for bulk read/writes.

For this reason, a custom regmap bus was used by the driver just to define
a bulk write callback that implements the D/C pin toggling. But the regmap
API has been extended to support defining bulk read/write handlers, so the
custom regmap bus is not needed anymore and could just be dropped.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

This patch depends on the following regmap fixes:

https://lkml.org/lkml/2022/6/16/198


 drivers/gpu/drm/solomon/ssd130x-spi.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 43722adab1f8..72f066ccd2d9 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -18,11 +18,6 @@ struct ssd130x_spi_transport {
 	struct gpio_desc *dc;
 };
 
-static const struct regmap_config ssd130x_spi_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 /*
  * The regmap bus .write handler, it is just a wrapper around spi_write()
  * but toggling the Data/Command control pin (D/C#). Since for 4-wire SPI
@@ -56,17 +51,12 @@ static int ssd130x_spi_read(void *context, const void *reg, size_t reg_size,
 	return -EOPNOTSUPP;
 }
 
-/*
- * A custom bus is needed due the special write that toggles a D/C# pin,
- * another option could be to just have a .reg_write() callback but that
- * will prevent to do data writes in bulk.
- *
- * Once the regmap API is extended to support defining a bulk write handler
- * in the struct regmap_config, this can be simplified and the bus dropped.
- */
-static struct regmap_bus regmap_ssd130x_spi_bus = {
+static const struct regmap_config ssd130x_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
 	.write = ssd130x_spi_write,
 	.read = ssd130x_spi_read,
+	.can_multi_write = true,
 };
 
 static int ssd130x_spi_probe(struct spi_device *spi)
@@ -90,8 +80,7 @@ static int ssd130x_spi_probe(struct spi_device *spi)
 	t->spi = spi;
 	t->dc = dc;
 
-	regmap = devm_regmap_init(dev, &regmap_ssd130x_spi_bus, t,
-				  &ssd130x_spi_regmap_config);
+	regmap = devm_regmap_init(dev, NULL, t, &ssd130x_spi_regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.36.1

