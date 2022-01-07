Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A391487209
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AE91130E6;
	Fri,  7 Jan 2022 05:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D411130E6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 05:13:40 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 202so4882660qkg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 21:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4YlYdRUHGlLiiQ3VXQXTVfg4lQw9QYkhPvgea7FlC8=;
 b=N/y/y/EHxEci4XvpnpvpI6v8Xu2DGOUHAei2/EsJq+rFxmhm60oqo5oZeLoPfYgnPv
 /BPU20Kl5Odd+NQx6h/B17Zx0XHtdNmCI8A7NWBRs00VKy56dSneh94BAZSeN0N5xwqY
 ok2vaDOxPi8ynmIFNdp2YgzcxxkmhUBjchE/pzxa6HZKTUAnz2v+QVTF7eBkrObpPcS8
 T4Gi2WsW2z4eN+Q2MqM2xn1LJzBcq3Gq2o8mJEtyZvMe8U+Ku7fwjx7NcVHdSoE15TYr
 JSte3P1IY4nMkLRTdfhDsQDLblkZ7zC2QUC8SHQz4+iIkAaCtp1ArZGq67gobwVRhPI8
 mbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4YlYdRUHGlLiiQ3VXQXTVfg4lQw9QYkhPvgea7FlC8=;
 b=32thspL94hG0CrzxHtHcKngZrWA9K7hQET5uNJuDNDh6yt5FzhyyFC3PQ1QJaNwX7G
 6zwnhHjpCt4zS92xBQIAm6ECe+Wv2yMIF1B9hk0sxDdnxSB2UVPyaqzZ+VU2H3UPV5Hr
 IjRoPssdJJxUm44Yahih/7LawYihiN0JxJpSAbLRJkphpv67qqHJ17tkR5j88hQ3n57a
 OQxKSadSK+21SR82TI51xGHcWhQn9F0BpnK8mMMYImrGWgTjj8fW7OSXaRgW8fBDSS76
 GFf27qh/U/u/TMzv+K9+gFEmCKrihJ4eUe4HDSJWgWgZn8uNOxGiUH7LejIN/uDtavXl
 yLjg==
X-Gm-Message-State: AOAM533BYcNOeEJ8yS/CIW6ivpB4kwwjHCdHskSL6xw8JpwVIqt+nupo
 BDkCPhUzBwCvHpqrHDmz+L9++tCx52twcw==
X-Google-Smtp-Source: ABdhPJyvrG0dAS+i8966pG6Ryu2TFjEn2HRKyJzBrPj+Kb8AR4vH67Yu5haOKp5YOL38YMqTO+Jp2Q==
X-Received: by 2002:a05:620a:284d:: with SMTP id
 h13mr43231424qkp.330.1641532419604; 
 Thu, 06 Jan 2022 21:13:39 -0800 (PST)
Received: from master-x64.sparksnet (c-98-233-193-225.hsd1.dc.comcast.net.
 [98.233.193.225])
 by smtp.gmail.com with ESMTPSA id d15sm1651461qka.3.2022.01.06.21.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:13:39 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/4] drm/panel: feiyang-fy07024di26a30d: make reset gpio
 optional
Date: Fri,  7 Jan 2022 00:13:33 -0500
Message-Id: <20220107051335.3812535-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107051335.3812535-1-pgwipeout@gmail.com>
References: <20220107051335.3812535-1-pgwipeout@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some implementations do not use the reset signal, instead tying it to dvdd.
Make the reset gpio optional to permit this.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 581661b506f8..1c88d752b14e 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -65,7 +65,8 @@ static int feiyang_prepare(struct drm_panel *panel)
 	/* T3 (dvdd rise + avdd start + avdd rise) T3 >= 20ms */
 	msleep(20);
 
-	gpiod_set_value(ctx->reset, 0);
+	if (ctx->reset)
+		gpiod_set_value(ctx->reset, 0);
 
 	/*
 	 * T5 + T6 (avdd rise + video & logic signal rise)
@@ -73,7 +74,8 @@ static int feiyang_prepare(struct drm_panel *panel)
 	 */
 	msleep(20);
 
-	gpiod_set_value(ctx->reset, 1);
+	if (ctx->reset)
+		gpiod_set_value(ctx->reset, 1);
 
 	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
 	msleep(200);
@@ -126,7 +128,8 @@ static int feiyang_unprepare(struct drm_panel *panel)
 	/* T13 (backlight fall + video & logic signal fall) T13 >= 200ms */
 	msleep(200);
 
-	gpiod_set_value(ctx->reset, 0);
+	if (ctx->reset)
+		gpiod_set_value(ctx->reset, 0);
 
 	regulator_disable(ctx->avdd);
 
@@ -211,7 +214,7 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->avdd);
 	}
 
-	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset)) {
 		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
 		return PTR_ERR(ctx->reset);
-- 
2.32.0

