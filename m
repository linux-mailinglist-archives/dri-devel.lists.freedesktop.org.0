Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CBC496BBF
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 11:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A9890F9;
	Sat, 22 Jan 2022 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953E010EEC5;
 Fri, 21 Jan 2022 16:54:16 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 n22-20020a9d2016000000b0059bd79f7777so12083118ota.2; 
 Fri, 21 Jan 2022 08:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJAypc7GOb09YdvN33B2vpee2uXuBcVdkBylIc96AeA=;
 b=K5JwDApwVvttoj1FuEQWHcNMeEk9ffV26USk+IVo7z4R+E0TB6ZLbA+uyyhQbQIeIW
 7/HguzO/fxNh33d2a1NipgqeVvG2HGQkV2/EUEuAcyenIBmOSItP0HQtiTRTMSQCTB19
 Q8JRE466S0mqUGFHRMq6HnMj6W7VTJm84rdOAn/bB0D6pKxs4VHgQ12wQqE8s4vSm8ad
 pfC/q04FuRUVchCnEmBr9uvyn9AHV11GeeDBs4nU09hWmqoVn7DMtgVKdhjraXSGsd9L
 S0FyshtxeBr3TgNQJXcg1xT2BR2QOjvt6FqBAdNWocPYRpii+5V1Wc/NGPoJFEjoJ972
 JFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJAypc7GOb09YdvN33B2vpee2uXuBcVdkBylIc96AeA=;
 b=Ya+lRc6Z/0Mgt8wwb75xlPMYvFQFBdYkAb0WcPX6I421sjvcFZg+zqiL8qAJbGOijf
 OrEthvgfbY6jOM4eohljIY6FUn9DXQMDnosDJgkLMKIcwQF2j39poWorQvdzwUOVJ+Gj
 lVIeY98yZAWh6hwDQyBSlUw+5jQN3lYYOMI4/ZgPFP6HYHguCkTU/69ghw05OWZB6BT2
 4aLgH4a3JHHwyTAkpCsOVkGBiAFAO+211kUpo16yzDoNPP54bJafozI8dURFjfwxqfEp
 SxJinAH2Cc/cgiD99J0otIwtt2lKmeKN4lqJ/6EES7aUZvkL0bQgVzk51JIHJEo6GqEC
 4s/Q==
X-Gm-Message-State: AOAM533BpxPJQD/VWm05RO29MM+bD87iZd5XMZrT5VHDu1LThwsdaKgr
 Z/CCEBJIoYTJNVZ3WKEmVOo=
X-Google-Smtp-Source: ABdhPJxVTLluA8KZ26wu9YLuaAzbXLzAR+oweGtMG8xK7CPe3rWm/4vkcVKatam8xzsp4HJXvlwuhg==
X-Received: by 2002:a9d:650e:: with SMTP id i14mr3360247otl.350.1642784055795; 
 Fri, 21 Jan 2022 08:54:15 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:cf72:4317:3105:f6e5])
 by smtp.gmail.com with ESMTPSA id
 y8sm1089271oou.23.2022.01.21.08.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 08:54:15 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 01/31] gpu: nouveau: nouveau_led: changing LED_FULL to actual
 value
Date: Fri, 21 Jan 2022 13:54:06 -0300
Message-Id: <20220121165436.30956-2-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121165436.30956-1-sampaio.ime@gmail.com>
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:44:23 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luiz Sampaio <sampaio.ime@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The enum led_brightness, which contains the declaration of LED_OFF,
LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
max_brightness.
---
 drivers/gpu/drm/nouveau/nouveau_led.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_led.c b/drivers/gpu/drm/nouveau/nouveau_led.c
index 2c5e0628da12..df4a734510e1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_led.c
+++ b/drivers/gpu/drm/nouveau/nouveau_led.c
@@ -45,7 +45,7 @@ nouveau_led_get_brightness(struct led_classdev *led)
 	duty = nvif_rd32(device, 0x61c884) & 0x00ffffff;
 
 	if (div > 0)
-		return duty * LED_FULL / div;
+		return duty * 255 / div;
 	else
 		return 0;
 }
@@ -62,7 +62,7 @@ nouveau_led_set_brightness(struct led_classdev *led, enum led_brightness value)
 	u32 div, duty;
 
 	div = input_clk / freq;
-	duty = value * div / LED_FULL;
+	duty = value * div / 255;
 
 	/* for now, this is safe to directly poke those registers because:
 	 *  - A: nvidia never puts the logo led to any other PWM controler
-- 
2.34.1

