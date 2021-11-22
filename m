Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A104589A1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 08:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3318789DE1;
	Mon, 22 Nov 2021 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D379E89DC2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 07:06:49 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id z6so15219953pfe.7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 23:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/cqfcIxXfPPStz8jh4GDehcd24IAIui/mi+x2MPB/aQ=;
 b=CmfVID/j2qfignUzhqUFqskANpjoqYy7H2AQhia/JwnbolgEZJguwSHIY4lBDkY4Bl
 iJgQKoDIfmFYQ/wLn9mYmI6hFrkXjkKgXq/FvJkD6trUJhA7onOsPcoEFrbDGWElVaI9
 avblkDCtumsQmzV3b6t+3SG2ZkYbsNpUUxTPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/cqfcIxXfPPStz8jh4GDehcd24IAIui/mi+x2MPB/aQ=;
 b=2pKEMQhSeNKqoSiXO9isuPA+qoW3bIMf+OardFw02EwlC/8xE89KPDH1Dk6Ugo9Kr6
 uGfPc9Y6qTy0JKM/oTcYT8xNC/DXrgHAIMzPG3/O3WStjTvK4pLfwaT0iWliZjff/ULe
 Scfqd5B63XJ+FaZSzV10RzbbIizinKci9uXkP0S226WNIYFPpapE3Ty338cHV9iQdZAO
 jvcxMuAK7fnj6ZuBUk40h41mesrUMXu3sWplKC/0xYyPKZxVSPwnyA5s71WsHDe2IBh9
 /orsHjYz/oX/uoeQCEzRMdPi88aEgttP/1TdgxxEX+yo8rIjNfLBpuPo+fDJcsOnfsIL
 qycA==
X-Gm-Message-State: AOAM5323vhQXHtg2Wm/OyPPBznWwS9jsFb3qd/m5jbhciydX5SH/MiYH
 A05FwJxmGV/ArcjG52sYYfojpQ==
X-Google-Smtp-Source: ABdhPJyDV+ZYxsjYtaBI2ARC/2atDBQ129oprH3uHrYKCGo3rJ52gbF+HTeSND2T+m90esKJnNNrlA==
X-Received: by 2002:a63:600c:: with SMTP id u12mr23978058pgb.16.1637564809393; 
 Sun, 21 Nov 2021 23:06:49 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id s38sm4513088pga.40.2021.11.21.23.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 23:06:49 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm: exynos: dsi: Add mode_set function
Date: Mon, 22 Nov 2021 12:36:33 +0530
Message-Id: <20211122070633.89219-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122070633.89219-1-jagan@amarulasolutions.com>
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the display mode settings via mode_set bridge function
instead of explicitly de-reference.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 174590f543c3..3d4713346949 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -260,6 +260,7 @@ struct exynos_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
 	struct device *dev;
+	struct drm_display_mode mode;
 
 	void __iomem *reg_base;
 	struct phy *phy;
@@ -883,7 +884,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 
 static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
 {
-	struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
+	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
 	u32 reg;
 
@@ -1526,6 +1527,15 @@ static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static void exynos_dsi_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+
+	drm_mode_copy(&dsi->mode, adjusted_mode);
+}
+
 static int exynos_dsi_attach(struct drm_bridge *bridge,
 			     enum drm_bridge_attach_flags flags)
 {
@@ -1540,6 +1550,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_enable		= exynos_dsi_atomic_enable,
 	.atomic_disable		= exynos_dsi_atomic_disable,
+	.mode_set		= exynos_dsi_mode_set,
 	.attach			= exynos_dsi_attach,
 };
 
-- 
2.25.1

