Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB052613B56
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 17:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E141810E30F;
	Mon, 31 Oct 2022 16:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1710E30F;
 Mon, 31 Oct 2022 16:32:25 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id c129so1504380oia.0;
 Mon, 31 Oct 2022 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wt/WR1Gmjk2D9GnfY1ZcaSEw9Q+GFqctU1oYIXCvdkk=;
 b=QUWIYopeB0UZaW/Dv5KZ2rxinkrGWUERLDC9wEH1krFqq/rXZu+Kj+MAQPmS/sHcq9
 WDgyMC7MgQBzSlm10f8WQ3MtxpthmTHe0DwIlueWPM1HQbPCtuz+mou7XsDwyL2P0Mnz
 D0jx9ZgP/J+OjSijEVyG6du7VE4eI6Gr97Pu8eIKUxw0p+aPhfMLAaAhV+NTXPsHEG9W
 SDYp2Hi7K+Oa6TVJyTP+vWDJ0nNH91JSgUWSNBhwrUrdGc4P/0oNEKeEZGvBFrxuL9YH
 lpzxS7wT/StIJImvUJZ2rfylv0C/yrd7X2ir7umu1HtCMtgWP2Q0fLevcAqTfg6J81va
 di+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wt/WR1Gmjk2D9GnfY1ZcaSEw9Q+GFqctU1oYIXCvdkk=;
 b=XTN6xFC6ea/cYZjtcyqzNwQU+6NJ5XASuAo0NDhtrTNCvbpmGNnybbyhZdTjtuDwP1
 j+A3TbbQXZSIa9VkOTnakqvgeQK4nmsreHoKjryizK4sJKh0B0tj/zteQA1SFK8BMCdE
 UHLe7EEAI1VBg81kE0JULybNnhax5kciGal/QabZnK9OGM47n1DKerrrAH8SJpWBRGcB
 ZVG4gQtebxiyhOr/7lVj5stK3Aw/G3gvHSYFRVAC/gyLH7RN1Xzc13fVo5OoT8HHMaJk
 JEIb/1KAwOmpHVxyuPiz7Hz7zDkRZlAxwg96kCqpkocHO2ZEGe1DQy4qbQtrhplp6QNc
 Nhkw==
X-Gm-Message-State: ACrzQf0AW+6XUO3LyFLPlZrYB0ItaQQkemuYc9QdImKaZ4vNvuNK+JJJ
 auI/TBlHwgM008+dnrNWjUw=
X-Google-Smtp-Source: AMsMyM6vONEEf7VjwL5TUau766cjtN/1V1RvxWagUODwX7I/kWb2Ovz4ymQB4e25WrRPTws8zBMCpg==
X-Received: by 2002:a05:6808:171b:b0:34d:444a:fc1e with SMTP id
 bc27-20020a056808171b00b0034d444afc1emr15366187oib.85.1667233944276; 
 Mon, 31 Oct 2022 09:32:24 -0700 (PDT)
Received: from antonio-Lenovo-Legion-5-15IMH05H.multilaserwifi.com.br
 ([45.163.246.1]) by smtp.googlemail.com with ESMTPSA id
 x6-20020a05680801c600b00359ad661d3csm2477558oic.30.2022.10.31.09.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 09:32:23 -0700 (PDT)
From: antoniospg <antoniospg100@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Add support to control backlight using bl_power
 for nva3.
Date: Mon, 31 Oct 2022 13:32:11 -0300
Message-Id: <20221031163211.13228-1-antoniospg100@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029184851.25340-1-antoniospg100@gmail.com>
References: <20221029184851.25340-1-antoniospg100@gmail.com>
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
 Ben Skeggs <bskeggs@redhat.com>, bagasdotme@gmail.com,
 antoniospg <antoniospg100@gmail.com>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

