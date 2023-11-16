Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6B7EE66B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3810E2AC;
	Thu, 16 Nov 2023 18:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F0610E2AE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700158080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abMypBf5ucI4kN1b2IUT7QxG30gkYzFxCp5z4V1rKYE=;
 b=Rl2lLLYibXgIW8TvXgv61D+4ZCc4iZMTTR64t+xBb80GEZASiTYQYVrKn67xiVKJRLR1cS
 eonUqKwauVjAH24Z6PTe+RfAzFL6YDmAzBEJXiJPaJ8vmFuMbg+w2x3vvrxR1dPK27yq2b
 GhtN5sbgwf1pXatpvHg9zPjE1PMcvTo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-9g9eZau4OSW-7zkjwWa4cg-1; Thu, 16 Nov 2023 13:07:59 -0500
X-MC-Unique: 9g9eZau4OSW-7zkjwWa4cg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2c53c85e482so10389201fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700158077; x=1700762877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abMypBf5ucI4kN1b2IUT7QxG30gkYzFxCp5z4V1rKYE=;
 b=awwYeOPPPh14WRFL5yJ9moBFqatdwU3HKXr6fJbQNaXg4tVS/FBpP+WCW3DexuiACm
 MjvXCYfeCTAmD2wd5yjXUPffZOtleK9jzUUtPQW1uW/Sn+N90K5r9ygOz4RbOZjkkR/N
 mJfJpmscGgiCtf/L7Y5EhLAIbcAv1GYhvyw9CyIkMXaTeGH6Y6qRB2QXzDsWDJoYFuUq
 WYQ5iUQLWszFI2XeUZ12mTzlkcsUL8z0BM7QzzAbx0byzWMws/kNwiwrE4VKM6++58d5
 ZkUm7SciANts6OOWTrep7NRoCEqPFh2D8WuoFj0D6O4/8ekAG2r4s9QNL//EsEodMjpq
 btXw==
X-Gm-Message-State: AOJu0Yzwu4yqQygbpCJmn4omQQiYS7SqzPG5tuIS3XsvvOg4/d6eGqx+
 GXj1jKCfE6S+AlwsX6WBPyf3681kUxZJWf10ccH6Js08wa07jjv+UBwpUt5LESNS8PTz7O5LdxW
 frWL4NcmImVwDEe8M9RLZ4qBr+8rd
X-Received: by 2002:a2e:9b13:0:b0:2c5:2813:5534 with SMTP id
 u19-20020a2e9b13000000b002c528135534mr7628254lji.51.1700158077696; 
 Thu, 16 Nov 2023 10:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKGl1y5xpKNFNEdGTKKeWQHa+nKfgkMEp5Q7PtqN7fzQrCOV0Z8V6aBoDs2btVWPzkwvYFHA==
X-Received: by 2002:a2e:9b13:0:b0:2c5:2813:5534 with SMTP id
 u19-20020a2e9b13000000b002c528135534mr7628244lji.51.1700158077374; 
 Thu, 16 Nov 2023 10:07:57 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600c330900b0040a3f9862e3sm3216257wmp.1.2023.11.16.10.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 10:07:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/ssd130x: Change "solomon,
 page-offset" property default value
Date: Thu, 16 Nov 2023 19:07:39 +0100
Message-ID: <20231116180743.2763021-3-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sahaj Sarup <sahaj.sarup@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
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
the emulated fbdev is attached to the framebuffer console.

Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index bef293922b98..8944129a8e0b 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1453,7 +1453,7 @@ static void ssd130x_parse_properties(struct ssd130x_device *ssd130x)
 		ssd130x->height = ssd130x->device_info->default_height;
 
 	if (device_property_read_u32(dev, "solomon,page-offset", &ssd130x->page_offset))
-		ssd130x->page_offset = 1;
+		ssd130x->page_offset = 0;
 
 	if (device_property_read_u32(dev, "solomon,col-offset", &ssd130x->col_offset))
 		ssd130x->col_offset = 0;
-- 
2.41.0

