Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60861A3D7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 23:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ED910E86F;
	Fri,  4 Nov 2022 22:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350A10E86F;
 Fri,  4 Nov 2022 22:04:38 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13b23e29e36so6962614fac.8; 
 Fri, 04 Nov 2022 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALGhbLG8IZq1W8PcaxhXQ3scDMznxgngbZP1/w11AsU=;
 b=VZ/Hk9G3u5pceeCziYhHioqASZpJNC6bwgM/0iajEfVr9GofRXC9QdOxQOsNTAeTuA
 vKJ+1aOvuGGQittItBjFIWEzo+I8JsQIgKlk6n5nseRgmLwHhJDpw5Zn0XDN1+bBxp/s
 M1EHxwSvHmwdaKe5uEnZq8mfZdQns8ummi3tqD8bLI/cuEPXjyMY883ONbQzuR5i4pU5
 2GNffofd6iUxbXL6YpzWzRMG+GKifesz2ZKm7wPPpdHGQTbc1E4NUvEMvmninn+X//GQ
 f+5Q21UJm0ue1HSLIkeGSpT53PKDO0J3Scn7d864m8qShBdfdIUmkVRfgkT8dMoMQt8C
 A3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALGhbLG8IZq1W8PcaxhXQ3scDMznxgngbZP1/w11AsU=;
 b=KevNsfDV7JKQyCHdu9GyBwkzGuWaOEw6/CB0ApA67WQMK9qp4G5xj0/DKKiEJK7Kbu
 ZKmVJDsQTnXL3XdeKQPBoUqevRD+d23+XYOIwWEgLV/k1iWcPeVFve15fMyuXM+1Hj3k
 GB/y/zirEM1V0N9zUNToKNZki9dt9+0k0oO3kpy5WR3K26NLMVr+TuMO2L7ZrHBZi0F3
 ITNLzwQcgFw0Yb6X9tuD9OwyjXQzQ3gG2WGOMPLNDd75mkQP5qakEdq2gl6Pzxl6sywU
 WAnGBXWqgU5S7gG5MrlivxYs1J5b+P3h6MVGz9+wcuPrwGyJhvOK8kBYxsts71evlhCT
 RGVg==
X-Gm-Message-State: ACrzQf01cdua/rXr37CLsfZ3m9HxrVxFX5lQpn4YaNw672P6LlN/pC8K
 G8qCVufqK78dQxuTalsbCPA/crL9JQtqvr+T
X-Google-Smtp-Source: AMsMyM5giw3BuJ8bmMJV4n8qLpGdhP4KGHdhrB1i5B+9G4KAWnj9wui4NDYnf6EwsDSuZzzqP0jiPg==
X-Received: by 2002:a05:6870:8319:b0:13b:1dbe:1943 with SMTP id
 p25-20020a056870831900b0013b1dbe1943mr22331595oae.243.1667599477799; 
 Fri, 04 Nov 2022 15:04:37 -0700 (PDT)
Received: from antonio-Lenovo-Legion-5-15IMH05H.multilaserwifi.com.br
 ([45.163.246.212]) by smtp.googlemail.com with ESMTPSA id
 n18-20020a056870a45200b00130e66a7644sm98623oal.25.2022.11.04.15.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 15:04:37 -0700 (PDT)
From: Antonio Gomes <antoniospg100@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/nouveau: Add support to control backlight using
 bl_power for nva3.
Date: Fri,  4 Nov 2022 19:04:23 -0300
Message-Id: <20221104220424.41164-1-antoniospg100@gmail.com>
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

