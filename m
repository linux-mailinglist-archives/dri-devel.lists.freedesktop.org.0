Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC65A8165D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741C610E746;
	Tue,  8 Apr 2025 20:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iTLGfhyc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A1410E740
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso44322885e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142985; x=1744747785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4kx0KJv/mNFQV/qssWHDi6l3S20q+ASuts02uZIeYw=;
 b=iTLGfhycktO1aLzV8wkUS98k5QTlzGF2kzblsgjXjmuVmq3wpHORTTaIWfm7jr6E6s
 9BWNQcQDVgt/GQNzyKZ33EumOnlHbB3pAsBORsmxf26Bu0XulT110fFH+vChkEiMJfuF
 BmmJXD0dod6jekHz5ch+hsjhwzU42uQALBC8GLEQMlAaqv+YnbiyHlBcqc9MLYC/GxGn
 RyPWgLxLBp7SaNgiBLq5emDRd0H64p1Phnx/xL33bo+Nq375fnbnK7KCsXKv18mAyC0X
 tYhg+UZ8v6i0iop4MWNGkniYTYmcz4KvlQRrHVEM46M3L5BLnY8IPtMYeA7JMYBkAi5+
 LdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142985; x=1744747785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4kx0KJv/mNFQV/qssWHDi6l3S20q+ASuts02uZIeYw=;
 b=Qdp+UxMIsAirfw82clfpfXq8E8v6dmlt5x32z68wQ9pksVgtaZ1i0PyX2Z2p2Nnkyr
 g7KeYp5L5/Q2lDeQQDA397IAe+wUPOIt7TWneUwGlghMoIJgMGEHbhWLEpQBAzg9ROH0
 +9S6Ns27q6+Zf6VQDo+VvlpJAhNF55DVBISUx5puItTlzsIee1Gr2BahI9JigepOmH/q
 zls+idGzB4x5zXtaMyBFqmb8wbXdiYmgM0x/F1CRg3mknGvsr3qXXFZFoe6RZo3/y/eP
 8MGtZ40hpRJS+/+ffXl9C3JvcCUhbdej17tPopjbj4kMvdnMNkrZqZ4lt8qXsHaf4mmM
 JomQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEdR3YL1aOPrPY/DKcuVIRHS4d345frLYvBXLCPUKNxpdL3KqegMhPhQHxI1nh2JLMOjoqqW5lq5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh2dU7Gcz3FiNZwX8Ozyd07eEwkwBcJhe4unULf3iLsymIDtto
 SodPz00ZNxz91eFPdtfJ2VCFqow2RjXhRX/q9LsnXxRSKJr87R1w
X-Gm-Gg: ASbGncuscQSj9FwAEmKcL4lHKl8tIH3yHySWb8ebk9nT7mJMuVjuR1Iy91wuHA4R9EV
 KzpPqPF6wjtM2JXO9UMczxwD2ugQIpd6cVF0yAOjh1w1bgojYJ5Jop4+2n+gyqzyO4BXt1oWpn0
 z7dJWc9obvOYnSpD8IEjF7aPXZTaY2vXWH0SpLgT3gT+pVxDkKTQUihVq+lUcYoi4M753JPywJ/
 x5ZbWUBvlxmT99/fdNcvVKHT/I0Lk2BppDA4FGzlAbEDCHd8oHm1IY3nsLBe/WRfIF7rJKpDpLO
 iBVKyhiSYwwt1q30ToW+TtNz1Pvyq34wJTMx5zykLxC8YUIcdj5/uFpfAYGWAYNAz33q
X-Google-Smtp-Source: AGHT+IFZahZNWoTCg6mIF0GtvlNhm5lNgf1ZpLF2uxtmpGMuQ/0lBxRY4tlRftHd9cOzGPqzQtpSkw==
X-Received: by 2002:a05:600c:3ca4:b0:43d:fa5d:9315 with SMTP id
 5b1f17b1804b1-43f1ff4729cmr197905e9.33.1744142984596; 
 Tue, 08 Apr 2025 13:09:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 14/15] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK
 handling
Date: Tue,  8 Apr 2025 21:09:11 +0100
Message-ID: <20250408200916.93793-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in
`rzg2l_mipi_dsi_hw_info` to indicate the need for LPCLK configuration.

On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required
DPHY register configuration, whereas on the RZ/G2L SoC, this clock
is not present. To accommodate this difference, add an `lpclk`
clock handle in `rzg2l_mipi_dsi` and update the probe function to
conditionally acquire LPCLK if the SoC supports it.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a9dad3b1974f..6c6bc59eabbc 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -30,6 +30,7 @@
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
+#define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
 struct rzg2l_mipi_dsi;
 
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -791,6 +793,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
+		dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+		if (IS_ERR(dsi->lpclk))
+			return PTR_ERR(dsi->lpclk);
+	}
+
 	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
 		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
 		if (IS_ERR(dsi->rstc))
-- 
2.49.0

