Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F1507C1D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED9089DA5;
	Tue, 19 Apr 2022 21:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317BB89D7F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650404918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRH7/XsoiL6rwdT/9IqjyebTEGbdFQMOqcD3x5JmGak=;
 b=bNLji1jRWJXwpOnW9botTBXrgX6UsT6WGS3ImCYX9wisGCTdjmkn6HlPMiTIbnCJ8oKJ+w
 kBil9kh51TEh7C4z+scjhXjje2yw2KbECG+8oS8t4Xq5x92aoRwhBC27kE0kl8cbCJYc2j
 QJ5zOyZYNNzxGrVW7EoU1GFtj9aL5IE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-IGUY9uhyOEW9Yd179mpVkw-1; Tue, 19 Apr 2022 17:48:35 -0400
X-MC-Unique: IGUY9uhyOEW9Yd179mpVkw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh11-20020a05600c3d0b00b003928fe7ba07so11789wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRH7/XsoiL6rwdT/9IqjyebTEGbdFQMOqcD3x5JmGak=;
 b=xe2KmX2KVlPZsfzFfUQOQxjW67wQzHSXKbkjGlcnFHSkaZ7UgwO/hexx06mn5gcKfB
 S8zN9WLc+ETBNUkrFyg4WSgnUuDzDS8XfYxQXtJaWKghNXxmqa2UfnJmqtJbujPPSmgJ
 Z59yMxkLO1EtuGGvCmkIj7QVkODWfcdUrK6lIf3DxSU8EV2D2mH+UD4iSIj4iMwNuxkr
 Cr8TWYW7c7cw4vtQUAxQsJw8Od0BcIJF++QUw5r5RoJfi+vK8L0tEqfMey3pAkBjvw3j
 zdSMz7jnFhxi4fLpoyA4C+w7J3KzEBJ5A8uVGDLcyYpuo5eK5X8xQuyC+3ube7ah6P5l
 fB8Q==
X-Gm-Message-State: AOAM533Ja+cO4wyAJTO0fgRelM9K5j7jrEuXbaq9TATVsOUoKRVSXHEv
 BBx4LrfSC5Hkc9eJP1szbruxSf1JffkotSeLr3lhiHpaTZUV/WUVUutNFuRiAN+yB1+L9Q2FT4V
 w1iluPhwGwhkPUuBqBXSCqmlzvZ1q
X-Received: by 2002:a5d:50ce:0:b0:207:bb5e:ad27 with SMTP id
 f14-20020a5d50ce000000b00207bb5ead27mr13329520wrt.84.1650404913891; 
 Tue, 19 Apr 2022 14:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGiUWXSsU4DetoBt3ut0OT5Db3AG0bTsAxOWQgbdm53BhlvdW/DOLJi54rlv1isl8O0rnW9Q==
X-Received: by 2002:a5d:50ce:0:b0:207:bb5e:ad27 with SMTP id
 f14-20020a5d50ce000000b00207bb5ead27mr13329512wrt.84.1650404913690; 
 Tue, 19 Apr 2022 14:48:33 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm13333699wrv.19.2022.04.19.14.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 14:48:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] drm/solomon: Add ssd130x new compatible strings and
 deprecate old ones.
Date: Tue, 19 Apr 2022 23:48:21 +0200
Message-Id: <20220419214824.335075-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419214824.335075-1-javierm@redhat.com>
References: <20220419214824.335075-1-javierm@redhat.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
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

