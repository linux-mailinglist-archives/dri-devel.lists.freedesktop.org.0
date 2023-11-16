Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF07EE670
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0CA10E2AE;
	Thu, 16 Nov 2023 18:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6CE10E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700158081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W54lS/jbyFmKQJpxN3dQRiCf/ft7R1Q+OyFPgBZkh2k=;
 b=arIlDxk1Ra+zfTrgBXtBnVTS7SC4/fsnLfEgTd1kQbZ0FlOz4vp8MVMlN91eHnonEfM+Go
 5nf8OVoHNQOVu+r9p+EUwuxO3L3iTiWRAlLOUHwtZogfysvGjKbLPF/rBamG8ZydEb8vlV
 puQLENIxCEl4+zO43TaMegAehzFKDbQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-mLc8WT5pN6uAAavifj4X4A-1; Thu, 16 Nov 2023 13:07:57 -0500
X-MC-Unique: mLc8WT5pN6uAAavifj4X4A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32db43129c6so544064f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700158076; x=1700762876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W54lS/jbyFmKQJpxN3dQRiCf/ft7R1Q+OyFPgBZkh2k=;
 b=SnnA+qv3qYvYIcBXsZK+iogy0ZqwF+RFVbpI+evkL0SA1FTkPcjRh74iIQ1LwZVuSw
 Xs641KqbP0mYi3McJ1JYyUAkQ/c1Ahkk1NZZ0F7MQLEUZHr2kRPiQLGFRKE9tMAuZMZz
 zGVPCvK/iASZw76SozFHeqPB7QppcaKQXf2NqpFn337lf9enCktZg1wiwk5Teydl51Sx
 fXueQGHySejuP8DS8/SP4mwArIXzWHUYOBCYKNJruq6Brdqif7pa6swlIRI5GBIeyFpW
 L9jQo5EChx4YKt0/J2fTZviuerZVPIU/HKHkrPJgYcKqeEa6/7/7H+DZdNoQpaPTHbAs
 0sQA==
X-Gm-Message-State: AOJu0Ywr5gavPqsyrVxe6QFEg42IF8hgsbAgalJdUwYiwag3aErLX2Yr
 eQBtMfXeIFU/UKsXLNgAyIGY5E19scvpOhcSCQ0+rKh/EdT3zCOJJhEW4BNPMciltXKykB1eu2b
 W5yfyoNygXlJgbOj+uXzhBB2062jM
X-Received: by 2002:a5d:4441:0:b0:32d:a688:8813 with SMTP id
 x1-20020a5d4441000000b0032da6888813mr11709923wrr.32.1700158075975; 
 Thu, 16 Nov 2023 10:07:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr2Uo2/zKtm0kyeqWnh34kZmrEKiHbZLy5vndsH3tPLeRv2OqMJqf+niFFID1bDqbG3zONhA==
X-Received: by 2002:a5d:4441:0:b0:32d:a688:8813 with SMTP id
 x1-20020a5d4441000000b0032da6888813mr11709913wrr.32.1700158075741; 
 Thu, 16 Nov 2023 10:07:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b0032db8cccd3asm32812wrs.114.2023.11.16.10.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 10:07:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] fbdev: ssd1307fb: Change "solomon,
 page-offset" property default value
Date: Thu, 16 Nov 2023 19:07:38 +0100
Message-ID: <20231116180743.2763021-2-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231116180743.2763021-1-javierm@redhat.com>
References: <20231116180743.2763021-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Sahaj Sarup <sahaj.sarup@linaro.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is used to specify the page start address offset of the display RAM.

The value is used as offset when setting the page start address with the
SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
1 if the property is not present in the Device Tree.

But the datasheet mentions that the value on reset for the page start is a
0, so it makes more sense to also have 0 as the default value for the page
offset if the property is not present.

In fact, using a default value of 1 leads to the display not working when
the fbdev is attached to the framebuffer console.

Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/ssd1307fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 5ae48e36fccb..34f014bf4994 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -637,7 +637,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
 		par->height = 16;
 
 	if (device_property_read_u32(dev, "solomon,page-offset", &par->page_offset))
-		par->page_offset = 1;
+		par->page_offset = 0;
 
 	if (device_property_read_u32(dev, "solomon,col-offset", &par->col_offset))
 		par->col_offset = 0;
-- 
2.41.0

