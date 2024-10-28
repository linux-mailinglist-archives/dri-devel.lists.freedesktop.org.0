Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057309B2CCD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E39910E46D;
	Mon, 28 Oct 2024 10:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gSGrYXuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7102B10E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a9a0cee600aso535993266b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111183; x=1730715983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0ceU2N4ZWu/FtoiewhZfxk5s76R6vPhrLuwGN01j9U=;
 b=gSGrYXuymmgJ+nYw2ZcI1XBkKcUwaMv+4CHkRlDhwV9ntgVKaahjBWpNmWkjyvDrWy
 pwGO9Jhw48Qdw2OJyOwFZ0jePRrijmclw+w/tvCAs5Qve+aGN55qvRyph1bftvOx11yV
 g5OyjQY/XFPNMxPvmCvM9QVvVHZKp1vHIRhXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111183; x=1730715983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0ceU2N4ZWu/FtoiewhZfxk5s76R6vPhrLuwGN01j9U=;
 b=AZ6HcVMlaEp3o9zm0gGmxoxW/d9uU2XlsGT+3TvXM/ImcCerPBJm0mVfigKAzt3+o6
 y/FGClxMF61cAfnpklsyq4oJMLJwzkVkMx9H74rVhJjTezCTUEH6vE6S3YglFZw9RWIx
 FVlllrfHeztlFafYhz8kRT6qP/aEO6cZRjxvXviy4m1MWZqeM/P9v8Mu1cbh/y8pzQAu
 ihQt9YhA4mH1AWM+Iy+AFQcxJXgKhehRfknKDqSCHdFj7nPpb5EdYrhtNSYvddgGUBg/
 2i808bfe7rKE6r9NkURSfkerVvEivrBYtzRcoJBJ8nhYqaLu2HYT2rvJdntMFbe2gO0c
 5G8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP6u76MpB0im185fWZvh22nWCJN/jPKOlkKWFWKENAFaVBVLTNXNwZsKa7XgHshlTIqGmDTtOEFQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPyMUIoXqhv/zUUXb42G7MN8UllRnxT1OOQZNinSypeIBj49jU
 wm8MH/r1mjpo1MuzncioPshfH50UqrkteH2B5ZSvUe8HOG8S6I8Gj70O1f8n/Q4=
X-Google-Smtp-Source: AGHT+IGk1NWuOLicniG16PKOif/FXsp+NvuIf9J+Hupxj0+7LKo6e8MDUzZowWTysAuCxxUypwbw8A==
X-Received: by 2002:a17:906:c105:b0:a9a:10c9:f4b8 with SMTP id
 a640c23a62f3a-a9de62eaf3dmr759573966b.61.1730111182612; 
 Mon, 28 Oct 2024 03:26:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 08/10] drm: bridge: samsung-dsim: don't re-activate the
 bridge if already setup
Date: Mon, 28 Oct 2024 11:25:31 +0100
Message-ID: <20241028102559.1451383-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch does not re-execute the hardware initialization/activation
procedure for the bridge if it is already operational.
This feature is crucial when supporting the simple framebuffer, as the
controller has already been initialized by the bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/bridge/samsung-dsim.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 430f8adebf9c..7c03215bb004 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1933,6 +1933,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct samsung_dsim *dsi;
+	bool initialized;
 	int ret, i;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -2010,6 +2011,13 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	initialized = of_property_read_bool(dev->of_node, "samsung,boot-on");
+	if (initialized) {
+		dsi->state = DSIM_STATE_INITIALIZED | DSIM_STATE_ENABLED;
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_disable_runtime;
+	}
 
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
@@ -2020,11 +2028,14 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host) {
 		ret = dsi->plat_data->host_ops->register_host(dsi);
 		if (ret)
-			goto err_disable_runtime;
+			goto err_put_runtime;
 	}
 
 	return 0;
 
+err_put_runtime:
+	if (initialized)
+		pm_runtime_put_sync(dev);
 err_disable_runtime:
 	pm_runtime_disable(dev);
 
-- 
2.43.0

