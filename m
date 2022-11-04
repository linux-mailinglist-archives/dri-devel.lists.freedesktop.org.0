Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A261A3D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 23:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B4A10E864;
	Fri,  4 Nov 2022 22:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C419510E863;
 Fri,  4 Nov 2022 22:01:51 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id b124so6555015oia.4;
 Fri, 04 Nov 2022 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALGhbLG8IZq1W8PcaxhXQ3scDMznxgngbZP1/w11AsU=;
 b=WnGV3hmxxtBVfN8nZUkGESLKx+wSYEkqROLH9Z6vx0g3hbEglS/FURqo4NrcbD+K4q
 vQW0A8tZpN/3Vg2fAm9gemOhwfKc85zV26faEF6MC6HbXqUGqOvnvvh1X34QFzvy7Ynr
 KMa6vN3tImlan3nvT/sobFJdiwD2G81TKO6oyNeUFIyBKGkYG5l4K4qmDbMa0dhDCP0q
 EaSz4Y1Gbk6I29b20cXvkjLZ5NOLB/h2nJVOAWEiCF6UALPZaKJQ/7Yaca+LdEknbAAD
 E7lGljsKtxRi26yGkLDDiJ0/DJ66BieGeZRra0ShR2P7wwwPNK2HFV1tlxpHLM15KsEX
 R4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALGhbLG8IZq1W8PcaxhXQ3scDMznxgngbZP1/w11AsU=;
 b=alH+briAygxfVogdu9AaOdHGozKh1kCpkq0TGD4kexojrJrEul0w5yq6Ck7g0ndYVz
 IJaL84GzcoHRXGCzCZMLjB6b7P5sHVKGhIvPmYSKNnXx2QcZiOFJqFWdMxq3o30LX3qz
 31SZpjo+35hr/NvKRxe+GN4nBy82GBB1WN2qX+HC5bEI0SehC2hlR4FPCMpO9b3WXpCY
 LSmidkNruUTpNoh7d/WfGsVFPVZHCNdutdLm9sgy5q/LCYWFBoIwOuaCQ0iN0WfYsoHm
 yBvX8k7AO+VFCr/AyozaVa4ryKeXmC4o6sYRo6WissoP9qBjJIRnnpYNcOwApUBs2ea8
 za9A==
X-Gm-Message-State: ACrzQf1DxKOL9Sz10MTd50P7U+QK3JSf/W7ou2aCZ9y2W+G73W1kApKO
 WGJ+z1DjEQm/hN9I66ainAt60HJn728elSvd
X-Google-Smtp-Source: AMsMyM5WrFEmsHFyNFoYuKhenK2bjTP2pebM1NY6MW9nmza7DkOwA+acCKLmIXqe2f3hCYNlA3KpJQ==
X-Received: by 2002:a05:6808:30a9:b0:35a:6dc0:2104 with SMTP id
 bl41-20020a05680830a900b0035a6dc02104mr426141oib.142.1667599311010; 
 Fri, 04 Nov 2022 15:01:51 -0700 (PDT)
Received: from antonio-Lenovo-Legion-5-15IMH05H.multilaserwifi.com.br
 ([45.163.246.212]) by smtp.googlemail.com with ESMTPSA id
 o22-20020a9d5c16000000b0066756fdd916sm193893otk.68.2022.11.04.15.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 15:01:50 -0700 (PDT)
From: Antonio Gomes <antoniospg100@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/nouveau: Add support to control backlight using
 bl_power for nva3.
Date: Fri,  4 Nov 2022 19:01:21 -0300
Message-Id: <20221104220122.38622-1-antoniospg100@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031163211.13228-1-antoniospg100@gmail.com>
References: <20221031163211.13228-1-antoniospg100@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, antoniospg100@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: antoniospg <antoniospg100@gmail.com>

Summary:

* Add support to turn on/off backlight when changing values in bl_power
  file. This is achieved by using function backlight_get_brightness()
  in nva3_set_intensity to get current brightness.

Test plan:

* Turn off:
echo 1 > /sys/class/backlight/nv_backlight/bl_power

* Turn on:
echo 0 > /sys/class/backlight/nv_backlight/bl_power

Signed-off-by: antoniospg <antoniospg100@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index a2141d3d9b1d..5c82f5189b79 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -263,7 +263,11 @@ nva3_set_intensity(struct backlight_device *bd)
 	u32 div, val;
 
 	div = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
-	val = (bd->props.brightness * div) / 100;
+
+	val = backlight_get_brightness(bd);
+	if (val)
+		val = (val * div) / 100;
+
 	if (div) {
 		nvif_wr32(device, NV50_PDISP_SOR_PWM_CTL(or),
 			  val |
-- 
2.25.1

