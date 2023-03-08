Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E325C6B0EF2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EFE10E696;
	Wed,  8 Mar 2023 16:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4698D10E696
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:40:59 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id i3so18204264plg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOdTRCNR5Lf/ceaTUFSrm5IHZuRCLptqla9LZq74Fpo=;
 b=qvZ2QewJTwr/A5QBW0Yn8g/1hmoXtuyAz84eV8tWrr6+fvg2X566dWvxF16PqoGQOP
 jYb6SEu75EH4bnSeU881vmQqpMeExyKvPyg/NlD25MZInoypbXdepvD5Wk65fI7izkZd
 tIxI+o1zFr1WCTtcp79Q5XpivgPQSyDcZWhAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOdTRCNR5Lf/ceaTUFSrm5IHZuRCLptqla9LZq74Fpo=;
 b=xNgzxrM3jIdzy/H3VcYmixTlaKg0URBXI0lOYTrFG5rwzrCnXbje+BrjLtg9wLmMrV
 teAyf7bXvMPar2oZOI/yWZLdwNO0N1WNstYxJ/5JfUn/pHyytl7ytq1/bBK/t9Rwg6dF
 sCtdLcsw6B2ipKmXRC0Hcv3H5RH+a9g3hVRSEqHvQZIy+MFKMOFKMpH9X/fkFP0QZcFL
 Zuipi9BHk84u75sR4c0mUSjt5UkhV/PnIFFaFp8f3vjJB00KTI94u3UKjN+zadumkJ7d
 Yf8MoPWZ/fxrAd1bqimxV6SXiEZsvC7ubEsR/0KzYUYYzggpSccr7siu66lvGBE30M0D
 Kaaw==
X-Gm-Message-State: AO0yUKUSHsDsDyg2jih8KuBA6yCjB1Vqb/S0LLOPPeZ97IqyhiqXN8Mz
 vqY95MiLsCg91tTAuVeoQLfMjA==
X-Google-Smtp-Source: AK7set/Fyq6tAqN5LZIjS+fF1FtUtlH8VK6UcT1acrpu4+5YJ+rzOeW4n2vlmaDoegkzVK0GIYgU+g==
X-Received: by 2002:a17:902:778f:b0:19e:6760:305b with SMTP id
 o15-20020a170902778f00b0019e6760305bmr15440925pll.47.1678293659004; 
 Wed, 08 Mar 2023 08:40:59 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:40:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 07/16] drm: exynos: dsi: Add atomic check
Date: Wed,  8 Mar 2023 22:09:44 +0530
Message-Id: <20230308163953.28506-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
Changes for v15, v13:
- none
Changes for v12:
- collect RB from Marek
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
index eb33c2bcac16..df4d95ae8aad 100644
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

