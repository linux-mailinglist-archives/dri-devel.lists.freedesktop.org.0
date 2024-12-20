Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF19F9A29
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A206310F042;
	Fri, 20 Dec 2024 19:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zuJQ65XK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F133F10F042
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:17:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso2430522e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734722247; x=1735327047; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
 b=zuJQ65XK/b7pBNS5MRjGfXsU7jn6cu5V4AUfpRPI7XpKqB8tevfOMtRemuPzlwI+w2
 6Zy/7J/S6IOgSRfHoE3yesQx5bCOQiGtSvoaAhl9+YV27oIGXrIwZgu4rFSpFyqVxQp7
 H5EcuNSVCMlGzXbWjg7s2AbG1NH7NzUE8FkOc5VbtU/YCKvfAQrjjXi7Gp8Tki0fM7Jp
 NbRB6/u03cRjKiUy3qvOrLU4iIyXgJ4h1Jvm8zln0qsrV9IW4/W8XtRYRA6hsIKkr0SM
 KTQmsLRT2dCp/mgWVeFbT2nkgBxAGQYUDrc2TIl//l4WGgtdfLhonQNwsYrdKxbMSNKS
 jiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734722247; x=1735327047;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
 b=dSalNHdrTSkedKYzfJVY7fd/UP4l/4rYolz0g63iD6fUpmN+tIBCNCiI7GuVJfqG9J
 vOCYfPJG/VjVwRgAAOLD0MGVv7Y+rJxBG+MC9Iey/2x7ywR0Tbs++h2cuWHacmlsU1Lq
 TV2nIcRYEAQ5FTq9/qMSE8o4PGwBFEd1Y+2PiXMl4CG5ZCCG5Anw2eC5bBNXJyieX/TP
 0FKlECFAQmQf9xtUrwzgwy9xFMNOZYix2PUikqaTWuy3JMxAG0fBlmsw2X2Irp/Ai+Jk
 xxpvYLSQtLym17pH4InM/mWG6fs2vIm8tDHSF1pF3wO8Zrn4G6Y/ToEBFJaZ+sr8E+L7
 F/ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGq/JarLHI/RkIyHQjvh8WRhHyLS2HTWkbzyYoM7mZ6sAhkV4AJB27+cBVQB+jh/I279nFfoOMPRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw4PR/EtgoUKw1xD5Wi0j/tdk5GI10Wu9+QGE9N0DcCPEYkp+7
 lVxNG4uc4BJbchqJ123GSiEJ7IYC7bxIEa+6U4wUVvXk2Gs82HMMRhJVXhvchAI=
X-Gm-Gg: ASbGnctPmpHCMX69UqMrXO0VVW5b5yWakjDHVncmJmk24K3+WTP7yAitKZ1vKUwBXnO
 vC+X4H5VwCBRLXjzF5IGez2PMeW+pvMLulKTCjmaJupLB0lHuSOXzj1bjkDKyaE6PD+1S+CR4xN
 IOjNYmAW/JDNY4Tg3hqbcixY3ZaS/G5QHg0QPJSmxmphO44KaAbVHDpFn4OA+ylyFdnQm1OxAmQ
 PFPUSsHsMYxMRj7ij5cg3hAsCU7XZtFNf2r9t6aCv+N3nfTDa2IBtMLdHV4umTh
X-Google-Smtp-Source: AGHT+IHe0mc2T0S/fidLlcXnIvV7arb5jH5l4ZSKmlo5D0G6qA4hbXh5msEHs+cmKpxC6EOLciu+6g==
X-Received: by 2002:a05:6512:4019:b0:540:202f:4955 with SMTP id
 2adb3069b0e04-542295603c8mr1276517e87.46.1734722247275; 
 Fri, 20 Dec 2024 11:17:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:17:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:07 +0200
Subject: [PATCH v8 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-10-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKve9DZuQ8ppU/Q/ZnyEt45kRCo+xjVXVr/0
 f2RRu93maOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1eW0B/93izm2Wfmdhsv3zy3rGU9m1u1l5dcOmfJb35f/JiJzpMofuBUPhBiSOWvd/xJyc4tPmAi
 V80XUFJHu877in1Juq8fESbqqMCPvLTEDfMXFnmUvu8oboli6HpOqnnb6g9JhbJvNtL6HsDxvZt
 KgZFkLtZeGCpHWBDeaWXihbv2a7VhnSpusAa0AcqSAdlvM9psDa1JF8yYo3tkqxTeRODSb+QDKu
 l9biQtscdPSlOgu/xKywBpVtaNFC0rbQj12YLxzL/BOf6Q60quSYWiwXp4pC/0A2NjFTe9Bby7o
 nutFS8MabwTox6OJ+b76xLxzmyaD1PeBBPIoGgP5pBsG2cop
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

