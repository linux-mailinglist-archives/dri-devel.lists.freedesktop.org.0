Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF66CDA70
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F65810EAB9;
	Wed, 29 Mar 2023 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4087710EAB9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:33 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id ja10so14881037plb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oygreZW8DvOSbrfdutvOrgL5JnDv+HmvzMABB2AWGTU=;
 b=PP7u3tIVudtuhiv7qFOZesk675zC0V0fkdntB0jL9iNFdXswt5umwg2LIHdEfVOiMf
 SgO+s3lzSunEphaQfvxPRajR+A37yc3RjX4w8wsdfpCpN9Mb0dFYRS/j2D2PhblCX/Hd
 Hp+2hRKUZPeHcHj96OS+0nv+9aVyjszRGvqX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oygreZW8DvOSbrfdutvOrgL5JnDv+HmvzMABB2AWGTU=;
 b=VjXgz5ChZN6bjk301fpdq4G64d7sG2oDkmUvnIzF0FlXwmZdfE6XrRpqN+QtQzlZgw
 L0QQQqOWZrkAK+bgVlUEZ6KECiui85/MjvTVlxPl4TFB6mOKO0IwBFMJUGbtpNJdZH4/
 3e8/HzfLXY+BC22+eKBxZqPeL2eHqKaxXTELYqV/5bRWOK6dIRbXkkxryUUUwYJ9OvO9
 ZK6fGdourMNO0mK1wly8sIUsTEqYSLrPHPm7GoYLcWhU5FRaRVrix4YGBkpcm1JNTHAS
 8P6IJFwyHKf71iw8c4yFbtl2bz/sma4fsJ988doIVhjJMtqujx0gp6OiMpcgTJo4PY43
 bBig==
X-Gm-Message-State: AAQBX9cjo+rp9KNfNv6uTe7cU7f337YxOLRfi5LTjOoP7RQeliFc2x2D
 P1YQ1VKnXSO/koZQ/hC83cCzHw==
X-Google-Smtp-Source: AKy350YoFCLmv9UyFpcpczhcyZuQVDlALTndWJuxarm3WW0HnhzkLVyGld0li+h4fc7/eikeMMk/0A==
X-Received: by 2002:a17:90b:1d02:b0:23d:133a:62cc with SMTP id
 on2-20020a17090b1d0200b0023d133a62ccmr21046371pjb.17.1680095912864; 
 Wed, 29 Mar 2023 06:18:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:32 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 07/12] drm: panel: ilitek-ili9881c: Enable
 prepare_prev_first for k101_im2byl02
Date: Wed, 29 Mar 2023 18:46:13 +0530
Message-Id: <20230329131615.1328366-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag for k101_im2byl02 panel
so-that the previous controller should be prepared first before the
prepare for the panel is called.
                   
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Cc: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 1ec696adf9de..102a1df0cea0 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -42,6 +42,7 @@ struct ili9881c_desc {
 	const size_t init_length;
 	const struct drm_display_mode *mode;
 	const unsigned long mode_flags;
+	bool prepare_prev_first;
 };
 
 struct ili9881c {
@@ -891,6 +892,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, &dsi->dev, &ili9881c_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = ctx->desc->prepare_prev_first;
 
 	ctx->power = devm_regulator_get(&dsi->dev, "power");
 	if (IS_ERR(ctx->power))
@@ -942,6 +944,7 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
 	.init_length = ARRAY_SIZE(k101_im2byl02_init),
 	.mode = &k101_im2byl02_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.prepare_prev_first = true,
 };
 
 static const struct ili9881c_desc w552946aba_desc = {
-- 
2.25.1

