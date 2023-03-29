Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7C6CDA6A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20A610EAB4;
	Wed, 29 Mar 2023 13:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEF710EAB4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:18:12 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id kq3so14844600plb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+PX9J3U7p5qZlBeWmtYaZVahtk7x+bKgv0zxDQ5NKg=;
 b=pNuu1Gkcpj7ou0/NxyX2OGB7HOgjlkfVVree1zpId6rRDygggKC/Odx+8t6UQxJCSH
 3K+nqLT4ETFZW5uFx2XJALuvcQQIRVGsHyk4MfHSsUCru8tigfcYVsv3aZkd0DLlIYg3
 n2HCEBT3mtN4hni20h9YKd5wzUcRPY5DNSsVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+PX9J3U7p5qZlBeWmtYaZVahtk7x+bKgv0zxDQ5NKg=;
 b=16OXAvdyB7tSEq/sZy4GbOvf6fdHHEsmCZjBxlTeQ29Ogy4Ji5KMFyNPdVbYbDpqZU
 zGmH4G7kClatKI/xDH8fDo+9msRWEQye5xjgvgrQKylXacxAoz/Uj50sEzaSC68gZMhy
 F+9eJefwFKWoXLt5shZdXVmEKQjboWCjyaTMy3lCtB9iO7gp1eDRTXxS8tA/A6yWT+0l
 MHj5FJc5CF3YeerkwMV5RLOn0EDW0ufdywqnpn5xUAxf1zXXA7McD+MGwSPbFoLBweWF
 tnMTkSdFUkAqSBlXctwQ95itUJ4bArGJxwd4zq3p2byhktqpsJoyu983I+MU62aFpL71
 aomQ==
X-Gm-Message-State: AAQBX9eYpwbxI114zurhpW36y7Hn/G7ZKKtksTCWmsTVHMMhzMwu/WN1
 La6cuyp+cruIXS36vjknT/NeCQ==
X-Google-Smtp-Source: AKy350bokE1By8nbjH4J86bI+d67CKIP38qBgLKevOIo/+cgjC0kVbu1W/gnjsNm0Xt8H7dXZUIQzg==
X-Received: by 2002:a17:90b:3b44:b0:23b:50ff:59ba with SMTP id
 ot4-20020a17090b3b4400b0023b50ff59bamr19952654pjb.21.1680095892216; 
 Wed, 29 Mar 2023 06:18:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:18:11 -0700 (PDT)
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
Subject: [PATCH v7 04/12] drm: panel: sitronix-st7701: Enable
 prepare_prev_first for ts8550b
Date: Wed, 29 Mar 2023 18:46:10 +0530
Message-Id: <20230329131615.1328366-5-jagan@amarulasolutions.com>
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
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag for ts8550b panel so-that
the previous controller should be prepared first before the prepare for
the panel is called.
           
This makes sure that the previous controller(sun6i-mipi-dsi), likely to
be a DSI host controller should be initialized to LP-11 before the panel
is powered up.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 7eae83aa0ea1..dc7677412023 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -105,6 +105,7 @@ struct st7701_panel_desc {
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	unsigned int panel_sleep_delay;
+	bool prepare_prev_first;
 
 	/* TFT matrix driver configuration, panel specific. */
 	const u8	pv_gamma[16];	/* Positive voltage gamma control */
@@ -564,6 +565,7 @@ static const struct st7701_panel_desc ts8550b_desc = {
 	.lanes = 2,
 	.format = MIPI_DSI_FMT_RGB888,
 	.panel_sleep_delay = 80, /* panel need extra 80ms for sleep out cmd */
+	.prepare_prev_first = true,
 
 	.pv_gamma = {
 		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
@@ -875,6 +877,7 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	st7701->panel.prepare_prev_first = desc->prepare_prev_first;
 
 	/**
 	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
-- 
2.25.1

