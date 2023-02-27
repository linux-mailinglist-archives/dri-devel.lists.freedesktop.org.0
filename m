Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA9D6A40E0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F2710E3CA;
	Mon, 27 Feb 2023 11:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7D310E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:39:52 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id i5so4680547pla.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nuq+y+HWw18yw8Sob2qSkhl5lK1AxCLgf7u71EJPHEk=;
 b=XO8VVmB/hwLaztPZ/sAhrdZmaYrs5ncE0RsyQA1pmLm8kYaz7hyN3l4khaR8kfjtQO
 uXlyE9diL97ZBL9BZ3arnna8+YCYjkOUNWZyl4qsQfey8YWlS6tVP5An81GPTHorzkXj
 21qAB9IswB+/tmzLfT8QzVwkzkZBdgcWPKAIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuq+y+HWw18yw8Sob2qSkhl5lK1AxCLgf7u71EJPHEk=;
 b=IP3MqSspWJMDbLSOLUU1ZHcRjzJ6PV0ZuzDmnUcG+s9mOnpVIm+fqy/5AFRPO67NLW
 7Q4kfaIqyraspSd16Bl9ebFo17wTj6UtenAlngaOl4KPPCVQ4mWsW1ZiZ1/RWvKhz9Dw
 gL7eShNsI/MXZjZSvKMwc+jZllq8i7MPuUoOJZ6JFIdcI6IgMMDI9X1Cc5FJ6e4UxqiZ
 dHLc77l/5i/P/qzxkGZ4mIfrU/upke+RR2qcIB/7U13kR+NG0ZPkAM98D2u0A3FOd6GY
 g6SV3Fj11qyqy/gc53cv4KhPPb51Wk3VTz/zsts95HcJfr5epyaeaohqBt+Waobdnanx
 9eYQ==
X-Gm-Message-State: AO0yUKXkLox2haN7P/A4AU7xod4XkW0mlLUySPsTxiomrUFOgjHSKLnj
 OKjNRgXfQZGCLWwHzHs1iNCV3A==
X-Google-Smtp-Source: AK7set8jN2nFdydfvmMeL5O1CNTAU79kNAhBLbqh8lLl93e0qMxNPZl0daLwvp8M+WpPesVZAVK/sQ==
X-Received: by 2002:a17:903:42cd:b0:19c:d5c7:9401 with SMTP id
 jy13-20020a17090342cd00b0019cd5c79401mr9789215plb.52.1677497992292; 
 Mon, 27 Feb 2023 03:39:52 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:39:51 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for
 drmm_panel_bridge_add
Date: Mon, 27 Feb 2023 17:09:09 +0530
Message-Id: <20230227113925.875425-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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

drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
which automatically removes the bridge when drm pointer is cleaned.

Supporting the same on non-component bridges like host DSI bridge requires
a drm pointer which is indeed available only when a panel-bridge is found.

For these use cases, the caller would call the drmm_panel_bridge_add by
passing NULL to drm pointer.

So, assign the bridge->dev to drm pointer for those cases.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- new patch

Note: use case on 
"[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper"

 drivers/gpu/drm/bridge/panel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index d4b112911a99..45a0c6671000 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 	if (IS_ERR(bridge))
 		return bridge;
 
+	/*
+	 * For non-component bridges, like host DSI bridge the DRM pointer
+	 * can be available only when a panel-bridge is found.
+	 */
+	if (!drm)
+		drm = bridge->dev;
+
 	ret = drmm_add_action_or_reset(drm, drmm_drm_panel_bridge_release,
 				       bridge);
 	if (ret)
-- 
2.25.1

