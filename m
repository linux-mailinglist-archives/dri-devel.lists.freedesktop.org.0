Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B320372A0EA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2115E10E15D;
	Fri,  9 Jun 2023 17:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F5210E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686330589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WyUw3HGVpJG+fchnm3dK6kO6DBjp5MZOwzGlWiysi+E=;
 b=ENMzY1fByYnB5TNJwJAqbK1eWBT/UK2ziF652cNSvwYoi+4lBNJGQ6S0fh3czouw3ZDkcI
 zH7jyWAUrL3AGbNRnpO9O2tEoyJZV/fF5JV3O+KO6mI6kyyhLnXxezSTj9Ckep376Aj8U8
 yB0vGQddr9p1csg419ecBrCx0sEDAKo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-OodplNsUO6iWvMQ5kC9AUA-1; Fri, 09 Jun 2023 13:09:47 -0400
X-MC-Unique: OodplNsUO6iWvMQ5kC9AUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so9497315e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 10:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330586; x=1688922586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WyUw3HGVpJG+fchnm3dK6kO6DBjp5MZOwzGlWiysi+E=;
 b=G7gxv0W6OsiR7geknT+lhfSb0TPSdx6fPq2yWC0yiaRPRFoQmTkhnd2yUBAaIJzkBQ
 +9nZShY67N+lU75NA00LAVC/tA0SPOEYh1QDN7BbveBj0vz0iu8q7h25D8JRWvjZH/M1
 aSqur17WwNBrmkDC5e7hLvGBzhPGH9UMFw5R/MYzi1osCcKweEvDOoAwnwE/jLlmSurT
 StP74ddhYGtowh/ov6hdCfAWMgEyGkRKuF/AySq+9atb7KXgNnLoasaaL3HREM88ZSrm
 XCf8lgkopvbkQ5qkV+2++RCI49rRhHnyFfjwLAHoLHhHB+SsAFAC9tbDw6BHy+7zZ3nv
 YccQ==
X-Gm-Message-State: AC+VfDzJ7siOOQNpnimsW20INoIOhAcNK3gU84QIQKjnT3wP51q7ueFf
 m/2DBFCIyzWq4lrDyoQhr+aYKCKI1YiH3AeTWFxRaoVvESUxeWwUu0hur5bKtx2MOwNpgBATii3
 eoX4lA5Axcss21/JxVnbHvs/tZJyN
X-Received: by 2002:a05:600c:290:b0:3f7:3991:e128 with SMTP id
 16-20020a05600c029000b003f73991e128mr1326610wmk.2.1686330586488; 
 Fri, 09 Jun 2023 10:09:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51Knv7YYXW5GlVPILA+9vWmLaHs5+7B5mf3yOpG4486+5qa9z2I++cts1m4DF0h0c19d7abA==
X-Received: by 2002:a05:600c:290:b0:3f7:3991:e128 with SMTP id
 16-20020a05600c029000b003f73991e128mr1326590wmk.2.1686330586233; 
 Fri, 09 Jun 2023 10:09:46 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm3265526wmr.2.2023.06.09.10.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:09:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm/ssd130x: Make default width and height to be
 controller dependent
Date: Fri,  9 Jun 2023 19:09:36 +0200
Message-Id: <20230609170941.1150941-2-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609170941.1150941-1-javierm@redhat.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
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

Currently the driver hardcodes the default values to 96x16 pixels but this
default resolution depends on the controller. The datasheets for the chips
describes the following display controller resolutions:

 - SH1106:  132 x 64 Dot Matrix OLED/PLED
 - SSD1305: 132 x 64 Dot Matrix OLED/PLED
 - SSD1306: 128 x 64 Dot Matrix OLED/PLED
 - SSD1307: 128 x 39 Dot Matrix OLED/PLED
 - SSD1309: 128 x 64 Dot Matrix OLED/PLED

Add this information to the devices' info structures, and use it set as a
default if not defined in DT rather than hardcoding to an arbitrary value.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x.c | 14 ++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h |  2 ++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 8cbf5aa66e19..a0e5e26c0bc9 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -99,29 +99,39 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_vcomh = 0x40,
 		.default_dclk_div = 1,
 		.default_dclk_frq = 5,
+		.default_width = 132,
+		.default_height = 64,
 		.page_mode_only = 1,
 	},
 	[SSD1305_ID] = {
 		.default_vcomh = 0x34,
 		.default_dclk_div = 1,
 		.default_dclk_frq = 7,
+		.default_width = 132,
+		.default_height = 64,
 	},
 	[SSD1306_ID] = {
 		.default_vcomh = 0x20,
 		.default_dclk_div = 1,
 		.default_dclk_frq = 8,
 		.need_chargepump = 1,
+		.default_width = 128,
+		.default_height = 64,
 	},
 	[SSD1307_ID] = {
 		.default_vcomh = 0x20,
 		.default_dclk_div = 2,
 		.default_dclk_frq = 12,
 		.need_pwm = 1,
+		.default_width = 128,
+		.default_height = 39,
 	},
 	[SSD1309_ID] = {
 		.default_vcomh = 0x34,
 		.default_dclk_div = 1,
 		.default_dclk_frq = 10,
+		.default_width = 128,
+		.default_height = 64,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
@@ -798,10 +808,10 @@ static void ssd130x_parse_properties(struct ssd130x_device *ssd130x)
 	struct device *dev = ssd130x->dev;
 
 	if (device_property_read_u32(dev, "solomon,width", &ssd130x->width))
-		ssd130x->width = 96;
+		ssd130x->width = ssd130x->device_info->default_width;
 
 	if (device_property_read_u32(dev, "solomon,height", &ssd130x->height))
-		ssd130x->height = 16;
+		ssd130x->height = ssd130x->device_info->default_height;
 
 	if (device_property_read_u32(dev, "solomon,page-offset", &ssd130x->page_offset))
 		ssd130x->page_offset = 1;
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index db03ee5db392..a2bc8d75078b 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -37,6 +37,8 @@ struct ssd130x_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
 	u32 default_dclk_frq;
+	u32 default_width;
+	u32 default_height;
 	int need_pwm;
 	int need_chargepump;
 	bool page_mode_only;
-- 
2.40.1

