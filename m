Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB753DB0F
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 11:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720E7112604;
	Sun,  5 Jun 2022 09:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8D3112604
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 09:41:02 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id me5so23204032ejb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DhfJ8Vbs3H5rmwl9R/OPOQbDlu4cgubnQOXlVvnJ8XM=;
 b=mOQkSwye820r1FKdsZutlM9eSUJKpNAnIeEW3h1hw3pJpNQkcIX7WmhcZ7L9p/yk1B
 G8OJN4NdgfFi1sixdvbKsmjP4yuJcurJFlpD3c1O8JNC7NHV8jWo337y7dm5+5p7NbAy
 xjjLdat36kRx29QbdBP7GfoRX0HyMy72rpam+ZNaVbBI0hdhdCTPTrm2YL2ZEcrKge8u
 fzQOpaL/JwnB59Sh+O5T6LMtd5hnptqEtG7fdJII0sfDioFtC7UUdBYgwvl2KwGbMe9l
 81HZ05saCykmbY7k0z29JnhVz4cf5xyxvxMJZLe3P0sdBYyW9T5micD6xgbQp4NXZmfM
 otQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DhfJ8Vbs3H5rmwl9R/OPOQbDlu4cgubnQOXlVvnJ8XM=;
 b=NYS/SLehPSWa4DiQ0q72i6eooihgCKOv02dG1FGUNgCkZrHiRanJPrtJ7kJijoeXWD
 hQddcdx72aPyMX38WF8hfsKEQUBr4I9FIeMORAOYsrt8frrECs61CyTJf2DaEN2GpsZy
 PSbWYoJSp749d7OarWHv7+CDO80gau+UCth/HtkA4Yyyl+vAphiuCvsFIEd6xDU6r7WM
 lXuxdDJX7E80wSQaMEztjvgq4x+d6PrD2NoeDM1SrK3kU5vUgB/K1F8IMVsOCF7oJDot
 hBnwSWBig/Y4O3PtuKw2MLFA2XBdIfU6q06Wcve0eVuYdjhQHqnVH2k1smY9PcvfpnI/
 o3eQ==
X-Gm-Message-State: AOAM5327XQQXqqOl6BTc3R9AvtCIE1o+Mwvuw5cJwUMqIZ7nMsYpT2xI
 Guttlg0Eb81JiggmNedN3x0=
X-Google-Smtp-Source: ABdhPJxndU5trzyMzutaIfO7WYpzqjFkxUDj+CyOBND1p38sWX2rvYJITyUyDqp31HpwKS/1znQpzQ==
X-Received: by 2002:a17:906:4fc4:b0:6da:b4c6:fadb with SMTP id
 i4-20020a1709064fc400b006dab4c6fadbmr17175123ejw.282.1654422060788; 
 Sun, 05 Jun 2022 02:41:00 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
 by smtp.gmail.com with ESMTPSA id
 kl10-20020a170907994a00b006fec69a3978sm4970837ejc.207.2022.06.05.02.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 02:41:00 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Subject: [PATCH v2] drm/sun4i: Enable output signal premultiplication for
 DE2/DE3
Date: Sun,  5 Jun 2022 09:40:18 +0000
Message-Id: <20220605094018.9782-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise alpha value is discarded, resulting incorrect pixel
apperance on the display.

This also fixes missing transparency for the most bottom layer.

Test applications and videos w/ w/o this patch are available at [1].

[1]: https://github.com/GloDroid/glodroid_tests/issues/1
Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>

---
Changelog:

V2: Added code hunk missing in v1
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 5 +++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 6b1711a9a71f..ba2932aaed08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -320,8 +320,9 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
-			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
+	val |= SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY;
+
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base), val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
 			 interlaced ? "on" : "off");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index ebfc276b2464..bc12c95af6f3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -65,6 +65,7 @@
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(n)	(0xf << ((n) << 2))
 #define SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(n)	((n) << 2)
 
+#define SUN8I_MIXER_BLEND_OUTCTL_PREMULTIPLY	BIT(0)
 #define SUN8I_MIXER_BLEND_OUTCTL_INTERLACED	BIT(1)
 
 #define SUN50I_MIXER_BLEND_CSC_CTL_EN(ch)	BIT(ch)
-- 
2.30.2

