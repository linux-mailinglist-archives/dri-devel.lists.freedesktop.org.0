Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395BE9B2CCB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE010E469;
	Mon, 28 Oct 2024 10:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PQ+0u2/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B11510E460
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:21 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso559617666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111180; x=1730715980;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXDPpN57LGyZzaHcm0JxAGhhGbbwxVltmDt3enjDY8Q=;
 b=PQ+0u2/Ige7ylU5hOq5QL+t11C71JCmKQ1vWQZM/xkDWJT2CXp4I563c9T5sG+QmlZ
 FczO8Jz7eQaF9+u0AJW64CiS1aZKhr/bcz7JDm2hcSSZjo4H0ZuncDR03iE73S5kRQgu
 bpQZYmde46j768ZoFL88O2omUiecxeZJ0Dd9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111180; x=1730715980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OXDPpN57LGyZzaHcm0JxAGhhGbbwxVltmDt3enjDY8Q=;
 b=Qqicpj/w9Gd9ArfH46FRrzbi+q+Vwz6kJN9zLLctiVBmFv+NfZdq8bCRGfZDvW1nJv
 cTpYq0mGPSgA9xEpTIm++09gIi6fwv4OS7nSyFjRh5nUz+0NSpaysDf2xJrREA4OG6o/
 y0lGqn0LtdY80KErs8rPapUsGRKCSernrkh2O5ijOLDagn6M/QIGqH/PQXfUeQmiQa/T
 0uG9HkoaXAMrzqC8nhRiClnTPvbTTrizpsZgHA+ehN4Wl2dLE7TWptUBXb2pB8Yx0NXu
 Eh0uncQY8zS22h2sMKncibviKjx50dUwtiMhES6oGvWGZaWeF5VJuSOoO7IHBhYfiarv
 NByg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDVd86oR0UfSoEhy4tjoaGa497IoyuxvLvQVjmziJQrFKm5yRIXsCaiKPcx71xjYCTrcuEy0ViGx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDqh4kuO4wg7MNA/WdGqVw5zV0skRJ0+UW68Qme3r2/QC1E0NT
 MA2C7KZxkH4VOt3kYuiUvxwsCHIPtk5yxDe4ZKD4nFYXtThQIUNQKck9JY52UxA=
X-Google-Smtp-Source: AGHT+IGIIRLGq3ogNM31hjyoqOVoY34pnS1OMJQTrH1F7+5cPe+gR2UOhwfrIkMj1DdEZZ5m3Q3jug==
X-Received: by 2002:a17:907:72c2:b0:a99:f67c:2314 with SMTP id
 a640c23a62f3a-a9de5ee34d7mr848368866b.35.1730111178897; 
 Mon, 28 Oct 2024 03:26:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 06/10] drm/panel: synaptics-r63353: don't re-activate the
 panel if already setup
Date: Mon, 28 Oct 2024 11:25:29 +0100
Message-ID: <20241028102559.1451383-7-dario.binacchi@amarulasolutions.com>
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
procedure for the panel if it is already operational.
This feature is crucial when supporting the simple framebuffer, as the
controller has already been initialized by the bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 169c629746c7..93e3ed545b34 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -258,6 +258,8 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 	int ret = 0;
 	struct device *dev = &dsi->dev;
 	struct r63353_panel *panel;
+	bool initialized;
+	enum gpiod_flags rflags;
 
 	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
@@ -282,7 +284,9 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(panel->avdd))
 		return PTR_ERR(panel->avdd);
 
-	panel->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	initialized = of_property_read_bool(dev->of_node, "syna,boot-on");
+	rflags = initialized ? GPIOD_ASIS : GPIOD_OUT_LOW;
+	panel->reset_gpio = devm_gpiod_get(dev, "reset", rflags);
 	if (IS_ERR(panel->reset_gpio)) {
 		dev_err(dev, "failed to get RESET GPIO\n");
 		return PTR_ERR(panel->reset_gpio);
@@ -297,6 +301,10 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	drm_panel_add(&panel->base);
+	if (initialized) {
+		r63353_panel_power_on(panel);
+		panel->base.prepared = true;
+	}
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
-- 
2.43.0

