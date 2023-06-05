Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD6722000
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 09:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519810E192;
	Mon,  5 Jun 2023 07:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C378310E190
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685951292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJ6LVDenz7leEoWEGqkNGYbuR5Ekaz6eOK5tZIJsJWA=;
 b=F6eg4RN7Qc4nBSLB0twUfe2JWx2Mdf7auB8/KGUNWNz1ClGctsr5BDXc1pu5akN4Bkj/VQ
 Fa30GguXTPco6Syu7seiPphBah4crIF5MPaKmnJ++BvvBSq4ndPFrSS8trUBJHXL2Ls8Zz
 e/IgZ72uuabycIhBB9tGkN8mudz02j0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-4MNR2TQDNkq_wI49ULJC4Q-1; Mon, 05 Jun 2023 03:48:09 -0400
X-MC-Unique: 4MNR2TQDNkq_wI49ULJC4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f6fa88a86bso24748905e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 00:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951288; x=1688543288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJ6LVDenz7leEoWEGqkNGYbuR5Ekaz6eOK5tZIJsJWA=;
 b=BOCUurYvKbs+WLYzucInxK05lGsvMcZ3PbXKtvDKYXO/mIEB8Xe4favTzcJlt+JjnD
 IqLyceDMePatQFUYZ3nVStiYDWl8Qx5Dne0pY0hYDo2e3AJCeHRSEwpsSbhbkevan1Dt
 05gzenEK4iBUJGOE7mhMSiKym/yDE3NdwhnTduEcRrV2ieYcU12ABKk4DU8KShqZs56+
 cQh7MI90A8Rb+3sgMj3FJI9fBqpU3XqK2CVRcdAcfxCzSe4ZIk36zRdik+PE23JDKQDv
 S3WlwrEnEVshJTrlc9osSuCJ36RvmDiLOCparnLbE1ppP1jRq34iRTffgNV2AxrlDIzy
 rNZg==
X-Gm-Message-State: AC+VfDxAYZ2USv7dccXUZRk3MHbmAtLD5nW5mCPOMyfgIyVRO5sXQJnA
 e+b8kBLv1wNv3o9HZDFzT6DISGI78ISzB/7onSdLNgugK05pc56HZz+WEkEX9ZA1TRznYoYu+eY
 mP2jdKDLjQQFuVqXqcrwlAJX/1NwQ
X-Received: by 2002:a05:600c:284a:b0:3f6:1377:8b15 with SMTP id
 r10-20020a05600c284a00b003f613778b15mr7656282wmb.21.1685951288531; 
 Mon, 05 Jun 2023 00:48:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Y3sEsxNIwZK3n9IEdro6U7y6EP48MP57T3BvOfN5LZhOYLajzhcd2K85ImHRDwpnr2Kb1WQ==
X-Received: by 2002:a05:600c:284a:b0:3f6:1377:8b15 with SMTP id
 r10-20020a05600c284a00b003f613778b15mr7656272wmb.21.1685951288313; 
 Mon, 05 Jun 2023 00:48:08 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1ce915000000b003f4fb5532a1sm9715192wmc.43.2023.06.05.00.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:48:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/ssd130x: Make default width and height to be
 controller dependent
Date: Mon,  5 Jun 2023 09:47:49 +0200
Message-Id: <20230605074753.562332-2-javierm@redhat.com>
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

Currently the driver hardcodes the default values to 96x16 pixels but this
default resolution depends on the controller. The datasheets for the chips
describes the following display controller resolutions:

 - SH1106:  132 x 64 Dot Matrix OLED/PLED
 - SSD1306: 128 x 64 Dot Matrix OLED/PLED
 - SSD1307: 128 x 39 Dot Matrix OLED/PLED
 - SSD1309: 128 x 64 Dot Matrix OLED/PLED

Add this information to the devices' info structures, and use it set as a
default if not defined in DT rather than hardcoding to an arbitrary value.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

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

