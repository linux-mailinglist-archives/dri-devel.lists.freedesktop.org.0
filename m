Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335233865EB
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77816EA7E;
	Mon, 17 May 2021 20:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE576E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:57 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id k15so5390865pgb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=psrH5M+NKV5li8bg6y5czsIFhDiniap4e0rpHCeiOC0=;
 b=Kj0juLGE90KylFNjeKIBQWJhYQnqQajv49nog8fBiWQ74nF3gqXNIRB2q8pFC4SIiz
 DXZp6M7cW/hT7FjNmU3uhgs7jsetbUyEz4gySKqYKXWJK+hJPbR3GoaFLQTIohJ+3UlH
 IgvlcHZJht/jiHEdYAOnSnqsdclztTOVExBWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psrH5M+NKV5li8bg6y5czsIFhDiniap4e0rpHCeiOC0=;
 b=bZfehj0iuLNo49pbvcAcVedzqkqntaEBwhNKjjrVVD4XkxXzVb0kuQ7X5Rk0LtPuIM
 8EPCsUEjkKwR2ZDPBpdu0BY0blL/JR7Xp8T+nwtrzROuGjjVmQ+9745AnsTNH70zF6yI
 +LheYqRP3p1hKsS0aSqcEpcJGSkk+YJvqttFqQ8gvUGi5rNx6h6aotI7HvmU31JY1NTr
 KOxCZtvPqqslXHcojtIrehqAXXwvtuGy/qmKSN9WKRZYzixkWNCN3+/MwwNdi+pXgV2u
 sH94s8efk+smRmnU7hpFNcuRdabhenYb/8RqY3+oqRsUKY8kFUIt6stt0BP20GRrZ6dP
 PQZQ==
X-Gm-Message-State: AOAM531zydmfOXS1OgV8lieutNhXESaAk/7hn/LxxxuhC/eiTtqXcrI8
 ZAxrzSmgkYLX647BIGYaegC5mg==
X-Google-Smtp-Source: ABdhPJzNbrqMJ/kDp4vIoU2Elz4dbseH3ovLFsuUJF7+OVsGm8tUuMb+B26vxpXZ9ruhoL0qtGmgow==
X-Received: by 2002:a63:185c:: with SMTP id 28mr1257849pgy.158.1621282197075; 
 Mon, 17 May 2021 13:09:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 08/10] drm/bridge: ti-sn65dsi86: Add support for the DP AUX
 bus
Date: Mon, 17 May 2021 13:09:05 -0700
Message-Id: <20210517130450.v7.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thierry Reding <treding@nvidia.com>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to provide our panel with access to the DP AUX channel. The
way to do this is to let our panel be a child of ours using the fancy
new DP AUX bus support.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v7:
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.

 drivers/gpu/drm/bridge/Kconfig        |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d25e900f07ef..294d0bdd4cbe 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -280,6 +280,7 @@ config DRM_TI_SN65DSI86
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
+	select DRM_DP_AUX_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 42a55d13864b..a59497f7e504 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -23,6 +23,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
@@ -1446,19 +1447,27 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_init(&pdata->aux);
 
+	ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
+	if (ret)
+		goto err;
+
 	/*
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
 	ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
 
+	if (ret)
+		goto err;
+
+	return 0;
+err:
 	/*
 	 * Clear of_node on any errors. Really this only matters if the error
 	 * is -EPROBE_DEFER to avoid (again) keep pinctrl from claiming when
 	 * it tries the probe again, but it shouldn't hurt on any error.
 	 */
-	if (ret)
-		adev->dev.of_node = NULL;
+	adev->dev.of_node = NULL;
 
 	return ret;
 }
-- 
2.31.1.751.gd2f1c929bd-goog

