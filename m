Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E848657BADE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535C78F2A6;
	Wed, 20 Jul 2022 15:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5AC8F41D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:34 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d7so3501200plr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1MmIYAi0CzqUnm8evBibi87aQyljaw+zPjXUhxloQug=;
 b=mHjHibFPl5AEVmv4OWOUiuBDmDNS7FS2T+uTCA/gFw+jukwGEGuz2FxyksmMwtzWzu
 EEhDwyUoBQ1OWmsm0JfEypDn38TGbfTGoLFtt7bLRl/f6Tpy3GKk4EFrt0zAVdkOngFn
 H8Pgx8ppIArgExgdy+urN+bD14dfOT4oMs/Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1MmIYAi0CzqUnm8evBibi87aQyljaw+zPjXUhxloQug=;
 b=R4qYUxCvde7Z90u2ID1vgYCLp+ydh8AJE5kIRMLyHiV3Eb7KdhPnfaFI7Diy6QcV0Z
 nvEx91z3G6R/viohPct83Z6mX+2XhqB81AInqBMDKz4KgZtMmQhU73bzJ+AHJJNtyKMs
 Rw3FH59TyZdDV/DEQH3KeiMxXvw77OWUmPwxP+i8Lxt83lRGAtxRFpshC0w5W6RTU+zb
 CikpWVEijHwVCjBYBqX4baO4u4WmNJcUhOfaSq6vMXgFA6zWSaBU2sspT5F5OSKgao5S
 OJwjs8B4kNdNTamQt86urvnj0In8R6D4H3S8Hyykxb8fwBi0mZPc4EKSxdbfh7oABvtq
 cpWA==
X-Gm-Message-State: AJIora8drnjOdy6e96QUpu6jEzVkyFo9hvv7TNUEWcDrhSPqu/qeAw7I
 EsOCgUTAMDyXK5s6Vle3ypgiwA==
X-Google-Smtp-Source: AGRyM1uummsEiwuhJYyAtQAkejNqA9QIK5AltZR34DfENCQr0Ig+awsEdKgwAgXdTKXg/S0OaiSdfw==
X-Received: by 2002:a17:90b:3b4b:b0:1ef:f5b0:ce60 with SMTP id
 ot11-20020a17090b3b4b00b001eff5b0ce60mr6311657pjb.71.1658332413996; 
 Wed, 20 Jul 2022 08:53:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:33 -0700 (PDT)
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
Subject: [PATCH v3 09/13] drm: bridge: samsung-dsim: Add atomic_check
Date: Wed, 20 Jul 2022 21:22:06 +0530
Message-Id: <20220720155210.365977-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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
index 5a0fea30e9e8..376e9682e130 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1339,6 +1339,23 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1361,6 +1378,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index c852d7b9981e..4eacaf18e00a 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -35,6 +35,7 @@ struct samsung_dsim_transfer {
 
 enum samsung_dsim_quirks {
 	DSIM_QUIRK_PLAT_DATA		= BIT(0),
+	DSIM_QUIRK_FIXUP_SYNC_POL	= BIT(1),
 };
 
 struct samsung_dsim_driver_data {
-- 
2.25.1

