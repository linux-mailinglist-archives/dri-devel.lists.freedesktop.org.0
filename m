Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D46484FD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDE510E53F;
	Fri,  9 Dec 2022 15:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798D110E53F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:24:46 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id y17so5219249plp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTlIC0zI1Wi04nUSq7MlTOuX//tM1g/xJ2R4VB/eGys=;
 b=g1b6XAl8aH+YaD6otDmNaD3Bue22WRopExSEMZUBXh96YiL+lLM3JtmYqZwoFW7wcF
 3UgsImB2AnViVJD/2slwmg6c29rY7vpgsLm25JFYkMajOJ4RMtuczXdWw3fyiGNqVW7+
 7W4vDEYSB0L/iGmPCosUvm0TP8XGfs6rObHHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTlIC0zI1Wi04nUSq7MlTOuX//tM1g/xJ2R4VB/eGys=;
 b=0gdOVs8O3JrkGfiQ82i83xc/iLry/YIfrzxlLThaUXpvM7HWd75GNnZTsFfKsGS2R9
 Tm+JFXlywcmqJ0x8rKqTwBc3aEP+WCF4wQSX1UeiTF3ty3VMMae+4YSHNW6jg8n0yBoF
 ixInaoYjBFh3Fs0rDYhHqkmfqOcNUbJFfJ2xj6ARfPJhVB/4E1j1/+HJEkfQWAYrUlNa
 YhI5D87M3FwfD1OKrqRtp6Ayvxxc+dLdT8oMjk9Zpb9kGxOpdRFmGnkHJex7uvd+Ysfb
 qvOYrBQsbo5wqaG77si+paEoru7o641ZAm8f/vqKiWrHc6BFHtiiJMAPWscyCyJh5/2f
 ZzLA==
X-Gm-Message-State: ANoB5pkNvDmnStiXqm6a8jwSJj98cgjNJK0sjljp6SWzGHwsWwWhfFsf
 X/UjMpPIcSnIBn/3Ce8N6r6VPA==
X-Google-Smtp-Source: AA0mqf5cQQSzU9aFwm47EhabJSc6yk+HBn2AkQ718jULfiQnBSs+wvKclsDN7KSCgGIi5nUDX4SqeQ==
X-Received: by 2002:a17:902:a9c6:b0:189:e7e:7843 with SMTP id
 b6-20020a170902a9c600b001890e7e7843mr5805033plr.32.1670599486009; 
 Fri, 09 Dec 2022 07:24:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:24:45 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v9 01/18] drm: panel: Enable prepare_prev_first flag for
 samsung-s6e panels
Date: Fri,  9 Dec 2022 20:53:26 +0530
Message-Id: <20221209152343.180139-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the drm panel prepare_prev_first flag so-that the previous
controller should be prepared first before the prepare for the
panel is called.
   
samsung-s6e3ha2, samsung-s6e63j0x03 and samsung-s6e8aa0 are the
effected samsung-s6e panels for this change.
   
This makes sure that the previous controller, likely to be a DSI
host controller should be initialized to LP-11 before the panel
is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- new patch

 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 5c621b15e84c..1355b2c27932 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -731,6 +731,7 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index e06fd35de814..3223a9d06a50 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -462,6 +462,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e63j0x03_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ctx->bl_dev = backlight_device_register("s6e63j0x03", dev, ctx,
 						&s6e63j0x03_bl_ops, NULL);
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index 54213beafaf5..362eb10f10ce 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -1018,6 +1018,7 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e8aa0_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);
 
-- 
2.25.1

