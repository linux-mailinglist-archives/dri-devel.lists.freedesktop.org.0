Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2598677F06
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B452410E4B9;
	Mon, 23 Jan 2023 15:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E35A10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:13:35 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id k13so11740773plg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmqEZ1iXO1eGhLfnNAeBU9ZBQZ2NXFn8ddY5s0UykPQ=;
 b=ZQqEnbOCXgSdOjiz4P8n5qg7srJ5Vru7kGCAEUjQxldtIHaXXeu+VeRXHRoaSoxicc
 MNIb3UvN6tNIMu72QazdWbPMeHvys14QtM5kovDbqDryvYyoo+jiygykzIucxkj8rpRv
 9JlgfNGb2jtpYQeJyBl2BrkmOiFhKiEd/GqzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmqEZ1iXO1eGhLfnNAeBU9ZBQZ2NXFn8ddY5s0UykPQ=;
 b=gMhlrLA3eV4fetZwmRrSuwtRaT1dt6NXY+tuFvATQqghbYE59Nc+y2NCsh/oepYSVF
 wsDWjqGc40COegM6HrHH7A0MUTTLDFfHhFa8x8VfL5mtnDX/CoI9MgGxuTM13Wy7+r37
 WwrZotksSZquNJMVLOpbNW9whK9YF4RXDwEGeMT34P/FPTf7bIKEK0u4sQYGYBp3oTUF
 Ok+ap31yNqZ4MU9BliRRtnZtzR7f7T7nijwSTn48oORV2AEAiZnnNq8jxsPRBl9wDYf/
 WfhP36f4miT7Yf3cUhTO8EU3eQVvnfL2/1XRuy4wto/b2j+3+J/oJ4h4Hz+bdTOfAHPv
 Gg/g==
X-Gm-Message-State: AFqh2koaIpvY1C/zNK3J0cWf0dYOSIFDY2kHDXUfTnX49+v8P70E306Y
 cDyq17UGJuK3R3odYTSZe4QESQ==
X-Google-Smtp-Source: AMrXdXsd1Pk9kOmbLgOeqswgLrlquAXDjCx2t05Iwf5PI7tBUAr8Si2RFnaWO1RgRcFU38ADA4T7Uw==
X-Received: by 2002:a17:902:cecd:b0:192:816c:8c31 with SMTP id
 d13-20020a170902cecd00b00192816c8c31mr20532623plg.35.1674486814831; 
 Mon, 23 Jan 2023 07:13:34 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:34 -0800 (PST)
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
Subject: [RESEND PATCH v11 09/18] drm: exynos: dsi: Add atomic check
Date: Mon, 23 Jan 2023 20:42:03 +0530
Message-Id: <20230123151212.269082-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

Look like an explicit fixing up of mode_flags is required for DSIM IP
present in i.MX8M Mini/Nano SoCs.

At least the LCDIF + DSIM needs active low sync polarities in order
to correlate the correct sync flags of the surrounding components in
the chain to make sure the whole pipeline can work properly.

On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
Rev. 3, 11/2020 says.
"13.6.3.5.2 RGB interface
 Vsync, Hsync, and VDEN are active high signals."

i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
3.6.3.5.2 RGB interface
i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
13.6.2.7.2 RGB interface
both claim "Vsync, Hsync, and VDEN are active high signals.", the
LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.

No clear evidence about whether it can be documentation issues or
something, so added proper comments on the code.

Comments are suggested by Marek Vasut.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect RB from Frieder
- fix commit message
Changes for v10, v9:
- none
Changes for v8:
- update the comments about sync signals polarities
- added clear commit message by including i.MX8M Nano details
Changes for v7:
- fix the hw_type checking logic
Changes for v6:
- none
Changes for v5:
- rebase based new bridge changes [mszyprow]
- remove DSIM_QUIRK_FIXUP_SYNC_POL
- add hw_type check for sync polarities change.
Changes for v4:
- none
Changes for v3:
- add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup
Changes for v2:
- none
Changes for v1:
- fix mode flags in atomic_check instead of mode_fixup

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d4a976d86f08..d8958838ab7b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -263,6 +263,7 @@ enum exynos_dsi_type {
 	DSIM_TYPE_EXYNOS5410,
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
+	DSIM_TYPE_IMX8MM,
 	DSIM_TYPE_COUNT,
 };
 
@@ -1465,6 +1466,32 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int exynos_dsi_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	/*
+	 * The i.MX8M Mini/Nano glue logic between LCDIF and DSIM
+	 * inverts HS/VS/DE sync signals polarity, therefore, while
+	 * i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
+	 * 13.6.3.5.2 RGB interface
+	 * i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
+	 * 13.6.2.7.2 RGB interface
+	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
+	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 */
+	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM) {
+		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	}
+
+	return 0;
+}
+
 static void exynos_dsi_mode_set(struct drm_bridge *bridge,
 				const struct drm_display_mode *mode,
 				const struct drm_display_mode *adjusted_mode)
@@ -1487,6 +1514,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= exynos_dsi_atomic_check,
 	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
 	.atomic_enable			= exynos_dsi_atomic_enable,
 	.atomic_disable			= exynos_dsi_atomic_disable,
-- 
2.25.1

