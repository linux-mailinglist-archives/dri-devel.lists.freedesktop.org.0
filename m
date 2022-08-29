Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8675A5423
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B8E10F6E3;
	Mon, 29 Aug 2022 18:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4007410F6CE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:41:50 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y127so9063938pfy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=afY7o/rHKgz7bPVIsHlJqcMLg2zdE5JP0LSEIlSKELQ=;
 b=JthEQfkDp2ABcDuxrRsvwoddsnZLE0yPqwolJ+UPL8WSTwFSNNuUhMzVF0nS5eaeVE
 IeCrbBNw3R4IDD4K4RKYUK/QZEnA301uttbST6v+Z1N6WGWepxXzLC11DJi3KIhKcCe3
 PMzzLbTl96muRDCgU3470fzLXaZ7dZT9/zm3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=afY7o/rHKgz7bPVIsHlJqcMLg2zdE5JP0LSEIlSKELQ=;
 b=xRjP2rn2kgh/0mzlG6PwVlAnY5LxAIiaLQFBpWllxfIcrhZu96YwTqUfXpKgt0lFV9
 q0dfOfeyDNSE85Nx42I3G2itWQ7J0znTbNGRiIMrqSwpBPvEcEvVIMUopNlMlZqodtLJ
 XXVk+rihMnZu30f0AhwCSHS6eSDIOo8ka3/dVrei/ep6v0IOARMuU0bAUKe8d8lxM871
 UiE4f5molbzvBcfcpRUsIY3xnsTin6HY6Rsv0jFoFOK6gvijH1tCYRfYHmFL2BEDRLUK
 iv6Hx1i1f1xB30LyPFK2EAYyTHSCeez73LcR/hkr1o7t7MnnX15/xtxpDjwcyHmAlMaC
 1BOA==
X-Gm-Message-State: ACgBeo1YFxKPyNK+i9ojCm5S8m4+IlTERhpk+5KVtXJdnlnThDO1cjlb
 +DMJezoSAXF5IjHO4DBXAWGYow==
X-Google-Smtp-Source: AA6agR7vR8D0gPZzURPe+HswcUsv8K/EkuxcpFdoEdqxg/fBz2u8El8K1GZwkA3MHP+sElvn5rWtCQ==
X-Received: by 2002:a63:215a:0:b0:42c:7687:7315 with SMTP id
 s26-20020a63215a000000b0042c76877315mr1539387pgm.289.1661798509818; 
 Mon, 29 Aug 2022 11:41:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:41:49 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v4 08/12] drm: bridge: samsung-dsim: Add atomic_check
Date: Tue, 30 Aug 2022 00:10:27 +0530
Message-Id: <20220829184031.1863663-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explicit fixing up of mode_flags is required for DSIM present
in i.MX8M SoC.

At least the LCDIF + DSIM needs active low sync polarities in
order to correlate the correct sync flags of the surrounding
components in the chain to make sure the whole pipeline can
work properly.

So, add DSIM_QUIRK_FIXUP_SYNC_POL to handle this fixup via bridge
atomic_check.

v4:
* none

v3:
* add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b6d17c0c9e58..724fd76435c6 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1341,6 +1341,23 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (dsi->driver_data->quirks & DSIM_QUIRK_FIXUP_SYNC_POL) {
+		/* At least LCDIF + DSIM needs active low sync */
+		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	}
+
+	return 0;
+}
+
 static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
 				  const struct drm_display_mode *adjusted_mode)
@@ -1363,6 +1380,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 95d3f89aec4f..62e1078f43cc 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -36,6 +36,7 @@ struct samsung_dsim_transfer {
 
 enum samsung_dsim_quirks {
 	DSIM_QUIRK_PLAT_DATA		= BIT(0),
+	DSIM_QUIRK_FIXUP_SYNC_POL	= BIT(1),
 };
 
 struct samsung_dsim_driver_data {
-- 
2.25.1

