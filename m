Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C54FFB24
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA9D10E568;
	Wed, 13 Apr 2022 16:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AF210E5EB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRH7/XsoiL6rwdT/9IqjyebTEGbdFQMOqcD3x5JmGak=;
 b=UbmOaLE2F1Xxkyys2JvOT7Jh50s6LxiE33uH4xX5m9M11NdUhAWK4RIitFsOgKa16dyZu9
 bbH1Lfn/mLjgmEtiyTW0nL6szm4vqp7rEeeGupiewp6oGKjgFbtv127mOOhihj8CAkWRv4
 PWgQNZabg4HoENhrRervY83gqEfgKQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-m8BbS9MnPwKdNhdXZ4IuEw-1; Wed, 13 Apr 2022 12:24:24 -0400
X-MC-Unique: m8BbS9MnPwKdNhdXZ4IuEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h10-20020a1c210a000000b0038ff033b654so373764wmh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRH7/XsoiL6rwdT/9IqjyebTEGbdFQMOqcD3x5JmGak=;
 b=aqJDMYj43Iv9upgiDl/GmMeD9CibJshQuE0o4TLu0R9tIQIBzGDsppzrSTORMJeVJN
 BKW5djxCCeJhH31CfLBGXccEquBygkYKYFDfFhvPB+GUR+BWacJK6bkY2BusyHA5+Ilf
 tttcSK5BEsyIprj98+1tM7EqoqIy3h43+39F4j1oMI75+1m+egSyIs1vEwnwehegk/zR
 qHzzqiAq3XoOL9c6mFdk0LyXcG0KyPCZR4Ej1jetu80sbV4OuOakJVfaFKwQVL50eY17
 FbE4QFbb83vQu9mpDSnIg4Yvl/1io8TizPgt/Saf1IOfwkrx7r6ak3aqwMw0Y7GJNJ08
 pC6g==
X-Gm-Message-State: AOAM530WW4PAjjynSDB7lkjiLDpzMz+uMRKK3wBO2oxAvDOBvjMqehPu
 e+/ExQyD0wxzVQ7MTICvD2xzPKZwyddPiRLH6AeI9xudKeRTdOKBpifxnfy8Q1xl0VTv5Ka7dv6
 vmAGVhmf5k4/rLiiRl6V0YFAExX8Y
X-Received: by 2002:a05:600c:5010:b0:38e:d68c:3ee9 with SMTP id
 n16-20020a05600c501000b0038ed68c3ee9mr3410407wmr.158.1649867063106; 
 Wed, 13 Apr 2022 09:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4kxMf3Cb6KxS8vVPDjgV7H72PDtBNHtSPxx4KJwLTukyhZMKu3eWr6UzlQdZRlAZKV6UnsA==
X-Received: by 2002:a05:600c:5010:b0:38e:d68c:3ee9 with SMTP id
 n16-20020a05600c501000b0038ed68c3ee9mr3410388wmr.158.1649867062911; 
 Wed, 13 Apr 2022 09:24:22 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfa2c9000000b002061561d4a7sm25446096wra.96.2022.04.13.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:24:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/solomon: Add ssd130x new compatible strings and
 deprecate old ones.
Date: Wed, 13 Apr 2022 18:23:56 +0200
Message-Id: <20220413162359.325021-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413162359.325021-1-javierm@redhat.com>
References: <20220413162359.325021-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current compatible strings for SSD130x I2C controllers contain an "fb"
and "-i2c" suffixes. These have been deprecated and more correct ones were
added, that don't encode a subsystem or bus used to interface the devices.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

(no changes since v3)

Changes in v3:
- Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)

Changes in v2:
- Use the compatible strings that don't have "fb-i2c" (Geert Uytterhoeven).

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index d099b241dd3f..45867ef2bc8b 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -88,9 +88,26 @@ static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
 
 static const struct of_device_id ssd130x_of_match[] = {
 	{
-		.compatible = "sinowealth,sh1106-i2c",
+		.compatible = "sinowealth,sh1106",
 		.data = &ssd130x_sh1106_deviceinfo,
 	},
+	{
+		.compatible = "solomon,ssd1305",
+		.data = &ssd130x_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306",
+		.data = &ssd130x_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307",
+		.data = &ssd130x_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309",
+		.data = &ssd130x_ssd1309_deviceinfo,
+	},
+	/* Deprecated but kept for backward compatibility */
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
 		.data = &ssd130x_ssd1305_deviceinfo,
-- 
2.35.1

