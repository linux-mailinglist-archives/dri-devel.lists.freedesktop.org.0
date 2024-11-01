Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C029B87A5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D638810E948;
	Fri,  1 Nov 2024 00:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dJZ8bcH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5492E10E948
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:23 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539fe76e802so1907777e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420721; x=1731025521; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=;
 b=dJZ8bcH0CZWQR46sAHiIXC41HuzQUDCd54gZaFNzpI9JyusFo0Ls71nCGWWYfO10mP
 33EL+0tWbdx03beI0v/PQ1mwj4EZuDsNeGmQ+q4PHNAUYdXQaS4NziOWer/4WmWo+xlg
 s7gXCl7X9T17rC7dGbZ30/y9fkSSPE0vjE1VQ80Q7fmmTJWt5p7ve7Uwhn7zrOTPZ7BH
 X+LYj2Xi/VY/Ugbg8GT1TzUa+eHSa1GJk1CKfCdoVtaXliE2UGEwEwMHxb5spaiZxQK0
 nYP9r9pAYkx6waLRqh8bckldq8hZbHU+v2+UeQd2yWLOgX3EdaLZE+7cVRw6pn3JgiKj
 GSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420721; x=1731025521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L5YSV0GHN6tODKa+I9kvPXfXQWz+eBBIeCxWrWSu71k=;
 b=UxuRO6aw1MMX8RuVU65Ahx9hjvvzSz564umoEwMOulsDO4jQCzuXZZ11N1UMVPQRKx
 l4JCxlIyFldQYxktuD6Qyihak9BtMa5BzcX7QMPSDetftq8/MbtX+i+zQjPDgWc7HpHH
 4KToLU/wu10rwGZaW8wvO89f+vuXgTL2+EWP/YKQkbAZFDQCnYpnPJ/UeYAGAjG+yB9I
 Qmsrp1B1CXL0MrS95XzJMNlOgDdZKT96yPvBfQuOcHFvIY9GGIuMB9aK8VXFRkKkbVQ7
 PSaIq/VMnLrhDHIKLXJLHBP64q9/ePZU1SX6WbJ8K7grKgtXGHAeCI/tJxTDf0MszDmi
 Cv8g==
X-Gm-Message-State: AOJu0YwHCRo4aq7uE83/erC1WHiHPGbUJcnAcQaIJL1ZjWeD8ec3j+7Z
 wCYJ31nGa+gIVSfbdVqLgTslLtJgTYaV4NL9+yukUCfPf8qY06k2oteDBYZ3PdcVuI2g7aXKlgW
 K
X-Google-Smtp-Source: AGHT+IH+Z352s483KbHjtU5VVJ6ZByUM9w51iqApUCzupb2q+5C0iuOE0kUGC7cK9WZXbJJqsjEwvg==
X-Received: by 2002:a05:6512:31cb:b0:539:e436:f1cd with SMTP id
 2adb3069b0e04-53d65de60eamr1039132e87.16.1730420721328; 
 Thu, 31 Oct 2024 17:25:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:08 +0200
Subject: [PATCH v2 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2cAY9yTx7ywPgJgHfm9Yb5s7i+clqrcNRhwPtafGQxY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/igzsmQyIppH1aHxewnBY4Uhlduz4k+yAau
 9lDSDvbvv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4gAKCRCLPIo+Aiko
 1RyvB/9WSZ4mNeqd6GCGzKzlegONFJkuLiNKth6QBGTxQ//vKPOg3+AtwZwoekG8i/XcF3v32K4
 65STYUOFY1I/FgP221HjXjV3D9ECFQLDGGeKhm7aLPml3ejppcxSFCoSMIczoSfyYm5k1G2xoKr
 fCCE4IU+aSG01lp6cHyXCQG6y9YHZs864O0vGh0SgHH1N6SeLGRb4NG2Fe3MKhnXwjYwEcYpOyU
 J2lEr7q8KPfcvWjBZZzLDqwPmQ9c8C5h1xKOssI4DO3MY56kui4eN8trJfFkVfWm0Fg46xuPxrQ
 6aBgbPv0pAwW/CBUvWVI6roTVlburpPQoWsR3WuP+sPFeVDU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164063e6f3972fdf8a5801ef4c35c4e..b8ccffdf515ade6e3bf863edbedc41e6f2030f29 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5

