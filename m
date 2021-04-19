Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6D363C92
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72592898BE;
	Mon, 19 Apr 2021 07:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7088E14
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:33:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so23808696wrt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=XkSOZwT/oa3mmMJht/SBoeMg2otJHicOZgzMpmC08FMiEwdqB0yn1q8KQZzzpNhaQo
 Ef7Myuk86h3cyP0dJSislHg6EhhfFefA9P3S2ErrnyqQhc9pbLy1jsHm6lKEpPqJ0SOR
 JuvPgdaVP9vS0tullk/0uT0ETPm7YmGbR4YnCfZDukTHal2rtqSbauJpv0FQu4/PdrHD
 oLRdZlZI9WTqm+7QLbTKRF3/m/KPCKoZ8pObnB+KJ2z1ZbOwVpdQSk3LTrk8Ncan/Sqs
 VdIXcx6KfdSiYoHEgooNeGOxo6EfXmZm+eExlzuI8w1OaOd3aiCSczk5XB6NS6qd55Lz
 T/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=uRdlOsQJw/RxmCP7EArgHVvBctMSEQIUamftiMjDO2eG7WbOXvRhUScs0lFA93TgUv
 fTneF4lv2bsisG0dxS7KZwWPqNC1lIuMU2RnDEhX/AzSqC5Je+0vo6/Ur/GvQ7cvFHvm
 4a67rBPAD3TqiYu0Zozu1gg2RwmLsxfytbnoV1/TUnOl2Az/izZkK4oxo4aIrUoE0oew
 5RsDtcYAQnidTbEbaEpzk6EWXob+sUoNV0UvszW7UdPvOAgZdrpGpC5Pf7cEoZqbLhXV
 OcnHIY+ErcSNlIwkGUC7kDZ075y3zCDRiNa+0dnuw3Dm2hQ4hHt3s4/61nUTIzoMRLU6
 Glvg==
X-Gm-Message-State: AOAM530N5XOmJVS6HPcP5d0lWgns6o2ndCxW4x3LADWSOJyhNM9B6WJ4
 nVLNV34j2A41woux3oLWXGjxMA==
X-Google-Smtp-Source: ABdhPJzqovubh4OIWgMpiHuIhqzqftX8pIo/o42SHQDoE+imJW2kEiaMLsGF7g8XzUNuo5obehrM7g==
X-Received: by 2002:adf:ba94:: with SMTP id p20mr12928692wrg.300.1618817584363; 
 Mon, 19 Apr 2021 00:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v3 4/5] gpu/drm: mediatek: hdmi: add optional limit on maximal
 HDMI mode clock
Date: Mon, 19 Apr 2021 09:32:43 +0200
Message-Id: <20210419073244.2678688-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=fmerdT5sHqIGuoUTZDrccRl/0zoMQFtVjUuTCnM2Nu4=;
 m=kS8rkVG4drN6qA/sYwEi96Os3BdhRRg85LscWfEOz9U=;
 p=XzRamrwQ2kdOF7GfyCvXP4CcM6GKIYyeek0NDT5Wv0U=;
 g=cc05bb87977587a07030f409f3d9b83309a9f1c7
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdGlFg//d/P
 CVZrkoJp/X4KUj/7Z+BhPfopOjq0Wiun0RiLoVicfOFVE23BrE2jif6szo9bLnddyzHnqRC/LOmDG
 sQEiX89TVIsnsasXsRPGFbHqMgpdzHdZeg0JVUEkacKc7WObdzdorYa7E1Sy85lkLQQFZERYRxIYs
 x7l8Rfn+fYO0g/2bM5Xo39BN+vjktqt2Z6+jf8PMaNHdWHbZ/Sibggehilqv1gvbNGzArviBVbogb
 CzbuFkm4caJlGpyuOh9lzqb5oX1dS1b4sJOKlV0vab8riyRDSWIrvSve6lIJKS5Zy2nnePFJDRIdo
 KXCX8tTjJ3oR9eFt0I6uDo1tPnQNUN+I+YPiwH1ADYzFZe/l6jgrmJ8vmD3sEPsqu8StxA2C97stl
 kPJjY6S3CSQAwoWUiXOY06ExKPKQdzJlilfy0bwmBllmpHeaV2AgOUw/SUVZQKFLQ8gy0dHTgCuhJ
 xtYcQKSob+AoJUPLuKlkJ5rWm7DvsLQ59ZkIVczynpm5b+fxtQtAwgFXqqcVrOe/BwQGzcTkG+w69
 g3JFk9Jgf3DMbQ9SL1gKIdDr+DqyBPjvgu2XxQk+4d8A8MV36AQpEUTrF5WKJnf6aM9l7TIUr8hOw
 vDn318ylmunNTWomQl7CBbWMUxB26/KBGzy/HJ/rlIaRskMmDaGmzSMMQQD2KUYs=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some SoCs like the MT8167 have a hard limit on the maximal supported HDMI TMDS
clock, so add a configuration value to filter out those modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0539262e69d3..bc50d97f2553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -149,6 +149,7 @@ struct hdmi_audio_param {
 struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
+	unsigned long max_mode_clock;
 };
 
 struct mtk_hdmi {
@@ -1226,6 +1227,10 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 		return MODE_BAD;
 
+	if (hdmi->conf->max_mode_clock &&
+	    mode->clock > hdmi->conf->max_mode_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
