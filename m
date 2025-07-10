Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF4AFFF2C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 12:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CD310E371;
	Thu, 10 Jul 2025 10:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UeB1o0M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0703510E373
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752143157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3W2IgTdbFFaPJFOP6LjIBm0mn0cPrkAqV4qDvg19HRw=;
 b=UeB1o0M5Jnru9JVwVLVJuH/flgMwJqxkT/vzfXBBDe0WQ88JLimSSmcGSQKNVEAw8mXwEZ
 ls9AdS3uauj/XJxF1HnW8v8a2PjfZKAyhx326wHOQ5ctXIFJ27wLKKqVGE3peVFPg9JtyH
 ZbWsiPT3GeMAU3ZavuR8QUFLBwhM4v0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-2lQ2HTUAOMy462YL0hZj6w-1; Thu, 10 Jul 2025 06:25:53 -0400
X-MC-Unique: 2lQ2HTUAOMy462YL0hZj6w-1
X-Mimecast-MFC-AGG-ID: 2lQ2HTUAOMy462YL0hZj6w_1752143151
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f858bc5eso640916f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 03:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752143151; x=1752747951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3W2IgTdbFFaPJFOP6LjIBm0mn0cPrkAqV4qDvg19HRw=;
 b=qOZMYLNTL/0w37RLBERYYBY8zIDY0tUhlSz2rCjF+L+nWiIFcpxBCe0ltECmO/TLYL
 AeRKbgDsr7+BCy/CZ0vN0NOrF9lrYaWBdEz1/LLyYptkwQm710AQnjAOHmU4PMAe4b+e
 hEw8IkW0BTNcElRIubknwnVdj0ipGPuku3SlkR48SP4f0IgWSXycrdKOpn/9TxKD/z3W
 D9i/ZKG6wsPxdcMKufcwrHqjfADJX+qCY3y8h9QB27tKmBJ1rrU6SKQRWSbQGKN9rhs/
 DxAWQeWrWQopKJA+aaoDwt+7c0SH6lzZiN1voFvVxvB8NIvojYjZDVgifXNmw3PBWmuP
 X4MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiZ7M9Rds3YoUHALXYT44hSUGloBIy0dbCmQcB0djLgMYGzFU/LuO6YUUEr8q3Wq0j7NLm5+DB4fQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqbZ5HvH1hbgX84wPUfVIN3ucpaJa4lMkNyYrleDGT1XgZygYW
 5kQFcLdrp4uxSDe1aPkHBNJte2u4T6RjeFNj+zUkGY3BrnNWO8oyAxPGS6Y2/CuVu2mCoviNzvs
 QmgWb2DLIKuisfCKQpZSgDKKgZm0E9qET1HhTqsNI/8XBPIUPjPtiL8bJN1oKB5XyVwZLdw==
X-Gm-Gg: ASbGncvOob92T8awwLqnkv1I+HFChBjIhueyLJ0sjEKY87ItUhB1u3fywOfZyKvTSbD
 5B2PixdkrcCipne2Iu/5G1CykKeWw3DmdJQlnbr2yd0dciVAGviylwaL1J0MydzoOF5VBvlwJ9q
 fnVcAwXrcXkRoqZEvBfJSgGOBwhm7PcOOblboncdS8MSV2tLKI8c9CSjBQXdt9N4VD8nZfChTPj
 sHq+CT5zPB5D6MwSKUAYIIiUQjPjvC0FeLcUBnC7gWNN2Am2ro+VK6E+WrGlIj2mY2GIiKWnHN6
 9Ae71e6VICpIBug1EGA7jKEHRQ4x4ivBj0vYHhmwQj2HiH0=
X-Received: by 2002:a5d:6f12:0:b0:3a5:541c:b40f with SMTP id
 ffacd0b85a97d-3b5e866b02bmr2196991f8f.9.1752143151187; 
 Thu, 10 Jul 2025 03:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYyuh3RbSjbXJR2vaOyme03URqc7hkBzM8G+2mSRMCozNekrVnXy9u3oe2JBdtk2AzWjYxgg==
X-Received: by 2002:a5d:6f12:0:b0:3a5:541c:b40f with SMTP id
 ffacd0b85a97d-3b5e866b02bmr2196963f8f.9.1752143150719; 
 Thu, 10 Jul 2025 03:25:50 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032fc0sm52460025e9.2.2025.07.10.03.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 03:25:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
Date: Thu, 10 Jul 2025 12:24:34 +0200
Message-ID: <20250710102453.101078-3-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710102453.101078-1-javierm@redhat.com>
References: <20250710102453.101078-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b3C1OptfP8yRnyMdCQvsV12g8tmdwVPY9iFEjIl8qys_1752143151
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Some Sitronix LCD controllers (such as the ST7567) don't have a reset pin,
so lets relax this in the driver and make the reset GPIO to be optional.

The devm_gpiod_get_optional() helper is similar to devm_gpiod_get(), but
returns NULL when there isn't a reset-gpios property defined in a DT node.

The DT binding schema for "sitronix,st7571" that require a reset GPIO will
enforce the "reset-gpios" to be present, due being a required DT property.
But in the driver itself the property can be made optional if not defined.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index eec846892962..73e8db25f895 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -802,15 +802,19 @@ static int st7571_parse_dt(struct st7571_device *st7571)
 	st7571->nlines = dt.vactive.typ;
 	st7571->ncols = dt.hactive.typ;
 
-	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	st7571->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(st7571->reset))
-		return PTR_ERR(st7571->reset);
+		return dev_err_probe(dev, PTR_ERR(st7571->reset),
+				     "Failed to get reset gpio\n");
 
 	return 0;
 }
 
 static void st7571_reset(struct st7571_device *st7571)
 {
+	if (!st7571->reset)
+		return;
+
 	gpiod_set_value_cansleep(st7571->reset, 1);
 	fsleep(20);
 	gpiod_set_value_cansleep(st7571->reset, 0);
-- 
2.49.0

