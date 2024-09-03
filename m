Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA3969136
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 04:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B3310E16A;
	Tue,  3 Sep 2024 02:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="odSDSY+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C9B10E35B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 02:02:08 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f4f2868783so48503261fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 19:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725328926; x=1725933726; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=;
 b=odSDSY+sABky4oK/2g6jUbJmLOZYmImksvYGCFtJ8xElJtOsexQo8JmeyY8hN2zgk4
 lvUQayJzQLZaTw+WWHvhP0PyzOBYf6ozPhGkI39ZifjYEDfpscmejDRzVF1f+MpnLHvD
 7mLQRDe3R0fWJ6vXJ+z9u40MzBKRDZrxdgIH1x0uabKintBBzr0YeKFSjzxHszCkyxGF
 xm5oMsFT9h8KFoGVUqgZnmSbLeX9k9tulYjhXcKQQJ3rp+HQyePCrcS77s1IU9kFV0RR
 uFLmC7BbOmmp5cb3T989zZgHhnAQs927DExY+oSVRNBS93wZNxwNyNT6yfuk+0VktvEl
 IRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725328926; x=1725933726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpzQw9LNt+SDHOumdIx/cD2vW3Vk+Ggm6Q+ZCEu5Pho=;
 b=oKHJqcWNV/3CbU6TrbU4//LP1U3MJBpQBXyTJum3XZ8iyG3XgqfQY99iKnhNZXUdPE
 dsgFpkwkNGHsuvoKGUK7uglbVbaEytkW0Pf/8A38F4pkBQ4IFDKQPlo19Y4apbNGZ8HN
 vuUW6UIQ5UX35T36boN/oa3tjPDYNotXwVPGeDiXhW55Cd+X38nma7jHUJFfsSbkR6RD
 gfoY1stP9bqOmwouB8ZsMyyrk9Rap25ocgIkWDQXPMTPjJxRCXxG+CBKXnHfaj1FfuzU
 jRgKYYD3g+/F/LJdPdkqXFNTyPP3KAM89pxHqIua7MuuYcdbKQcCSpYMD9QMfWIOAqZc
 n26g==
X-Gm-Message-State: AOJu0YxT0s7rqQbkGl+llV+g7WX8leZ8I/piUAt+43OUNtQ7KE6EaG/6
 V1oy808oQ6rtL1VZKEP6PEtq15m25rRmmf24bptRXqBfCXpTyzKrufcLV13SXjc=
X-Google-Smtp-Source: AGHT+IF8v8eYKKb2eQMr0Hsc2qs48UsPP7HLkrE86Dm+WJr2IzV/yR9tjZDK7rnfHNsBM4q2M+EhlA==
X-Received: by 2002:a05:651c:19a9:b0:2ef:296d:1dda with SMTP id
 38308e7fff4ca-2f61e025871mr77730561fa.1.1725328925919; 
 Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 05:01:58 +0300
Subject: [PATCH v5 3/3] drm/bridge-connector: reset the HDMI connector
 state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-3-daebde6d9857@linaro.org>
References: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
In-Reply-To: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/mT5/AR35rbIDoBCMIT6yhd22qoLCIO/78RuGNtcQT0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1PMnqI1KVspetFZi3Gl8JEpLtUs6+nOiyV+WlRKv/7
 tQfLsWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIbif7PxXBmk0v/1w+d0WT
 71S6XpXL7jLtn4avhQsSLjYWFpWlNFyaLt3N/iGnatKcwkMCu7O/rjFqCDz8KJc5ufCiQ8KledW
 /uRseHIiy8MxMVvnEyeb7WHv1FZfUhPk9i/cUHg/6HX76mM8Wtf6ERceePG1tVaz5/H9DQNLcGZ
 y6Llcc8p0+KzalN0T9jE0QmaB78cCR07q69f850w4GJ+7JZ4t78CCmYvZnNaPsssesT1P7DzTWz
 mNsNlHTrT7mds9yCbu/axEfR516y5TjmctOSC///F7oMUO36NtU1kIT+YKzleddOzbMTjo2R/KQ
 K/f8d0nnXwQH3rwSL3mk4NsGjQcrfrHr8a45VH/B/RMXAA==
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

On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
IGT chokes on the max_bpc property in several kms_properties tests due
to the drm_bridge_connector failing to reset HDMI-related
properties.

Call __drm_atomic_helper_connector_hdmi_reset() if the
drm_bridge_connector has bridge_hdmi.

It is impossible to call this function from HDMI bridges, none of the
bridge callbacks correspond to the drm_connector_funcs::reset().

Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8c174ceb0c4d..3763649ba251 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -15,6 +15,7 @@ if DRM_DISPLAY_HELPER
 
 config DRM_BRIDGE_CONNECTOR
 	bool
+	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a4fbf1eb7ac5..3da5b8bf8259 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -216,8 +216,19 @@ static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 	}
 }
 
+static void drm_bridge_connector_reset(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_atomic_helper_connector_reset(connector);
+	if (bridge_connector->bridge_hdmi)
+		__drm_atomic_helper_connector_hdmi_reset(connector,
+							 connector->state);
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.2

