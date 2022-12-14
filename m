Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825B64C97F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 14:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6010F10E3E7;
	Wed, 14 Dec 2022 13:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149F910E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:59:52 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso7120792pjt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRA4g7zBULv9cktOq5gSiTnCBz1g3lpTo4+Og/fOWPw=;
 b=IJWEwMARelm/XIjJ5+SeCaVajYe4gPQ+R5qn3Ltc2FduFfJW8DzC69q/Q3IpY5s1vJ
 xe78nrVROxtHc6uQwZHKp5XkyaJyuIxXqZ8d9g49wju4JkLNaFD23gS2TQF0wARUc+/h
 RNh72kVsDRc5kJ2yGHYmnXliUkf0pzwGySfJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lRA4g7zBULv9cktOq5gSiTnCBz1g3lpTo4+Og/fOWPw=;
 b=gsJZLlMYK70LXnkkcFG/i24oTBknBdnlcayDdkp/En+pkye/SaMHdGXIa+e1jeSua5
 k2SYbbthg1NNWfzC8rHUyavLkgHlZhBGzv9vxqQ5g9wAKVguQislGulGYTegu/Kpgy5q
 PjBucm+Dob9azxCyzdt++Vp16FoVs9bFX57IC1lu/HyzfpGOkIhvQUvUvG1vztopN/D2
 7/7X7FxWbtj48agicG1tnytsW3wot8+XRlgGY19i5bu9jADvKIqV5yFutI+DSEYd5/bP
 gBMbC25fxR0JFXM0TXd3BCspyLBYnTaU/O0cmDDisRh8vlv4FZAh3HSxEScx9eSL/1wa
 1TxQ==
X-Gm-Message-State: ANoB5pk/klqf6M5MqaP7UFf+flJUYl3S+8IZrEjppGEmKEXh2HzQAQeZ
 LgXmsrHwLypfe5OVDwmpD4F8xg==
X-Google-Smtp-Source: AA0mqf5TP5GojEziXe46EJ41N9ynT+W157bgrsgiSgIN8wBFPPtT5IP1yuKAcrdnjMQNKK/h5hZ/4Q==
X-Received: by 2002:a17:903:2412:b0:188:f47f:ac06 with SMTP id
 e18-20020a170903241200b00188f47fac06mr22560240plo.19.1671022791593; 
 Wed, 14 Dec 2022 04:59:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
 by smtp.gmail.com with ESMTPSA id
 ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.04.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 04:59:51 -0800 (PST)
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
Subject: [PATCH v10 03/18] drm: exynos: dsi: Drop explicit call to bridge
 detach
Date: Wed, 14 Dec 2022 18:28:52 +0530
Message-Id: <20221214125907.376148-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..df15501b1075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->out_bridge->funcs->detach)
-		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
-- 
2.25.1

