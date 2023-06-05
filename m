Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA9722003
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 09:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1AA10E1AE;
	Mon,  5 Jun 2023 07:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CDA10E192
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685951297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkfyBiLVG0HjTgYBw5BL2+2f7LnDXq371QsA6cUQbfY=;
 b=hzJ3QXn/gjWqCMKo9vH0b2p4GfyXY5FjInM/Dw2E9+M+edtzK63ZCnnt+GhUrX6nwkq7lf
 v5LQ0gMuiCpwGMZzh0s4sdVuxXdozNZVJrKc2rtkTnhCXK6asflCb2kCHwmUb6bMFiLY0h
 0qzX46f8/g7VGQA+POUllIShrYK5cUY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-Z5QqDHzvMri-OhPPMi6a5Q-1; Mon, 05 Jun 2023 03:48:15 -0400
X-MC-Unique: Z5QqDHzvMri-OhPPMi6a5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so21889695e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 00:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951294; x=1688543294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JkfyBiLVG0HjTgYBw5BL2+2f7LnDXq371QsA6cUQbfY=;
 b=k5wmIScIgszzQuc78Zvcgpg4YwNXprjp/BE7MoVK2jxMF/PbiOfj5on+hRh9CXYAvT
 blZUk5l6g0gT9HwBi6I8gLPKjEoBmlGVLJTQROdBGW5BBev+KKNmqocdNf590cClxg93
 gQ+fozxcobgp0TSWEDoO9eArpYXhxOSZ/e4itI780jTz5c+uFHmEuui+5gbs4d6zWkBd
 wiSMla/07/3xlybad0HWyGSZPj616k6lCXNqVy7uk/U0gg3f1ONLfScE2dq+Q8pManJR
 /tOlulZOcHOh96/hWUyOgk5VblyoW0cjyg8xJdHzoFLrcLMB2RpVf9d0Wt2x7abw0YP3
 xV+Q==
X-Gm-Message-State: AC+VfDxKFNWgE2MqXanic0ADnNSsOOVx2mZ/qATLJ2aYiGMwpgTJPmvh
 S1k3XxzOjbW8zZyD8m14Be/Rwurqv7fZm13pPoJt6/7PsyWZPWxTparLYfT0NTYls2abiqEVBWu
 zEv4KkBi1uOQD/yeU5uKpdoKJWvLy
X-Received: by 2002:a1c:7705:0:b0:3f4:2897:4eb7 with SMTP id
 t5-20020a1c7705000000b003f428974eb7mr6150063wmi.38.1685951294651; 
 Mon, 05 Jun 2023 00:48:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lQbDXqEhzDQtCOm3eBqsPv8QaZ/hSWBzIQiuedzRf86vjl1o6k2bXEStnJY2w/EfQS4x/HQ==
X-Received: by 2002:a1c:7705:0:b0:3f4:2897:4eb7 with SMTP id
 t5-20020a1c7705000000b003f428974eb7mr6150051wmi.38.1685951294488; 
 Mon, 05 Jun 2023 00:48:14 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1ce915000000b003f4fb5532a1sm9715192wmc.43.2023.06.05.00.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:48:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/ssd130x: Remove hardcoded bits-per-pixel in
 ssd130x_buf_alloc()
Date: Mon,  5 Jun 2023 09:47:53 +0200
Message-Id: <20230605074753.562332-6-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605074753.562332-1-javierm@redhat.com>
References: <20230605074753.562332-1-javierm@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver only supports OLED controllers that have a native DRM_FORMAT_C1
pixel format and that is why it has harcoded a division of the width by 8.

But the driver might be extended to support devices that have a different
pixel format. So it's better to use the struct drm_format_info helpers to
compute the size of the buffer, used to store the pixels in native format.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0be3b476dc60..b3dc1ca9dc10 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -150,9 +150,16 @@ static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
 {
 	unsigned int page_height = ssd130x->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	const struct drm_format_info *fi;
+	unsigned int pitch;
 
-	ssd130x->buffer = kcalloc(DIV_ROUND_UP(ssd130x->width, 8),
-				  ssd130x->height, GFP_KERNEL);
+	fi = drm_format_info(DRM_FORMAT_C1);
+	if (!fi)
+		return -EINVAL;
+
+	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+	ssd130x->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x->buffer)
 		return -ENOMEM;
 
-- 
2.40.1

