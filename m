Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E04FE5CC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 18:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BF910E65D;
	Tue, 12 Apr 2022 16:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056E10E439
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 16:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649780873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mo5J49WlO6IQDZ+qlm/WdbORrfFgaHGgkwawEPzuzxE=;
 b=PITTrQINbsSLQGVViKL9SoZBh0KQkYcI6VP/nnaQjSshb/26ZXW3SrWfN4W1FYPVb84wJn
 NLO2/A74rj+CV3G/OxzEJeozfXK4ClwDINrKOMy3mQylR32pS7YM1DRztFRy3Do5nyN+gi
 b66UJ6t7eTqpXB7mH8SrZdgGwoHRBoU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-AsQ-Gw6UMoCelgWnXGSl0A-1; Tue, 12 Apr 2022 12:27:52 -0400
X-MC-Unique: AsQ-Gw6UMoCelgWnXGSl0A-1
Received: by mail-wm1-f72.google.com with SMTP id
 l41-20020a05600c1d2900b0038ec007ac7fso1475091wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mo5J49WlO6IQDZ+qlm/WdbORrfFgaHGgkwawEPzuzxE=;
 b=ZxHAc0u2MSAU5xuyggZsQRi5aI7bGf5PAkTL/1PjUUbtCL19OLdQPgmC5ifnGObku8
 d8ndRYUCJ7g1WV3YSc3eT8xUk3NaPHkCeLq56gBD7XMkZPyBh2vSeib7xolAxXDti3/j
 WrijJgFkQl2jxNEGrLnVYJfmlcKU9zEOvF2cabozRNYohNa/W2OHLoaIrKfV9iw+eBB0
 DEhk5WImKZEbn7OoRsipBZFQIEl5eK50YftUOwCUOm6RF6kV6TNGQUtiV4TXPSoh8yFy
 b+zvr+NpIS9mxoLs8SpeS79WgojD3xUzLKoWI0I6qczDuc98OvIkarDsF18z2KO157na
 wSgA==
X-Gm-Message-State: AOAM531e4ckvt0AHpxikivnUA4MCWMpk6PVtjsOPHkNsiD/IGVKHIeo9
 JiTIln6y7EMXNHy/dO284Dvad6NcIst3qZnppFVopVT04unk4l0yCLfyBVYAgvxJwnVKlrSIkLz
 um1xj+NttB/BngFPFs5k7j11PTyEP
X-Received: by 2002:a05:600c:4f15:b0:38c:b729:4838 with SMTP id
 l21-20020a05600c4f1500b0038cb7294838mr4905859wmq.132.1649780871520; 
 Tue, 12 Apr 2022 09:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxFwQJtMdTDB/u8o8piRC+wUS5qF5b+LUpWOn//PSBN3fYXg6a2kN8KjW30Vy8Ka6FUFNzvg==
X-Received: by 2002:a05:600c:4f15:b0:38c:b729:4838 with SMTP id
 l21-20020a05600c4f1500b0038cb7294838mr4905834wmq.132.1649780871306; 
 Tue, 12 Apr 2022 09:27:51 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm7700358wrq.81.2022.04.12.09.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 09:27:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] drm/solomon: Add ssd130x new compatible strings and
 deprecate old ones.
Date: Tue, 12 Apr 2022 18:27:27 +0200
Message-Id: <20220412162729.184783-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412162729.184783-1-javierm@redhat.com>
References: <20220412162729.184783-1-javierm@redhat.com>
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

