Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE9F64A71A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AD010E280;
	Mon, 12 Dec 2022 18:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF9C10E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 18:29:42 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso843643pjt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCpxaDaTA56dGN7NJsLyTmoxT4H5IRGMLzpnnHDD7q8=;
 b=JAKFVzLSt6JrfK8yqkhUbmYOpa1Y9+ZNYOuxyxXCaFrCIAUel9DmnllQ/4Hk5LAZ+u
 IlDRmlR+oSXuMh8zDRIVgTsNf/PhmxB9noJpyenzwoRA1AMhfwJzL5lqLriHzWYY4WM+
 CVvuyH0YIvntyN2LP+xQo/c44isBdvOb5mHBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCpxaDaTA56dGN7NJsLyTmoxT4H5IRGMLzpnnHDD7q8=;
 b=zXClhIboXfzNw2H9BMmSR9/2WCwBc9sP2Rsrkdk71uI7GTcT2Hhg9/C5FxotYqQljk
 fIkxorQX5rxbLITqAKmEImh1tLE8ijrfd9P2P9Fj9tWSo8yrfyAxbUourtGBl4Vw6vrj
 s9nJ/Cb+KWfTSo2RqjqTdx3M+jihCQTaSR1w/6lwXCSyxWRdV+7OGXAovfWZdlNEn+p4
 yMWcR074tOt36UJrPvAHcAMU4KjrSCVrsTvQ50mT2wDPoFmjBzKdI9/ulNMojXO/cNq8
 vYbaBVEzsLaDt/vDhCBQtadVMgEHeXheJKuIPfQvPJmgDgB5SdLjpKW0bp8yJW4nvzD4
 5wsA==
X-Gm-Message-State: ANoB5pnWmrLrzhdQ965UFyaUSMJP4lPgYdTPk6mXGRM2BkEQIkGJHWpU
 AQBOsFCywswtjFAHTUWpyVC3+Q==
X-Google-Smtp-Source: AA0mqf4vOfrYyokqDVGgCKowSzgdtJOiyIYxXHZ18VsSCqYqdWLFwhStg78i7SpL2dTrPHIglv3wVw==
X-Received: by 2002:a17:903:1d1:b0:189:c47b:af27 with SMTP id
 e17-20020a17090301d100b00189c47baf27mr23141709plh.10.1670869781961; 
 Mon, 12 Dec 2022 10:29:41 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 10:29:41 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v11 2/3] drm/bridge: tc358764: Enable pre_enable_prev_first
 flag
Date: Mon, 12 Dec 2022 23:59:22 +0530
Message-Id: <20221212182923.29155-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Enable the drm bridge pre_enable_prev_first flag so that the
previous bridge pre_enable should be called first before the
pre_enable for the tc358764 bridge is called.

This makes sure that the previous bridge should be initialized
properly before the tc358764 bridge is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10:
- none

 drivers/gpu/drm/bridge/tc358764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 53259c12d777..f85654f1b104 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -369,6 +369,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.25.1

