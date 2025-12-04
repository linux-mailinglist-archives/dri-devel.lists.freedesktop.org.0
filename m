Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1EBCA27AC
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C778810E845;
	Thu,  4 Dec 2025 06:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hACmSrjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E58E10E843
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:14:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso81864766b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828887; x=1765433687; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
 b=hACmSrjronG1ftZMLh7pQo/+/wv6G5bmeYV5s3aWQ1Km0RCTUvwGadklvUhh6X2x76
 6LarnuSQDNA52z+2gD1bwrRiDYETc9Mxg7qk0gTeplPVSJoAJF1iuPKh9YBn+BnPImVN
 m6U/Qtnh6/rn+j7gkWJ7MzgZQegVyFv0DS58xSxnfgc7TCQNPCs+XYGwG2e64fLSwwCL
 cw3TOAwIKjvkdur4tfM06AM2tiybkXikKt/SeElOd7OYInHwPtJVlBBcH/fQXx8Ki/4f
 mCa+Gze3rFJoGrNLU9eFWP04hUL5+8CIuCquy+tZOwEYS0MvZJySbVgoaEZOPXq8Bd5D
 IwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828887; x=1765433687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DQrz/QPYOHYsP4Cfl9B2GTYZm08Xl/E70LbUu7rauuk=;
 b=l5f4PMH7Me9w5WYFoI+amu1/pkS5HYSPS+yRBcLoZv9/7/t37+QfO28qGaNsnAGSQ8
 jgCnydJAWNuYU1W1eNnZtAfSPED4lQ7q2CFreVdh51Jhsd8rma6c6ubamnTSgoDSuX9m
 +bKOztV5okDXNHlMHWrvvWbCPP1pBj+pVXYZovJxF8Wf+zwFY1h+PZlKXRBhXZADmBX3
 YVIaL6u2FV6vFGpjH+z8RqLBOUGvYuqhm2JtwAowpY+76AkbObq1bWumXZiYwaB87J7U
 Fiod9ISuzTvFnR/oSmAQ9obvM5nnzAedcGz398Zk8CxM5X1/I8Rqoeq6RXw32nVseXoX
 Kstw==
X-Gm-Message-State: AOJu0Yyb2GaVY80UiB91CYvS7sPgsOGOoKCZ0d/K5S2ZAtGOz4Ub24v4
 R+UXcW1C8w6BUkOyLCBS9VASdUXo+3kgT+IRG80BnIo2uWrM14yPSJao
X-Gm-Gg: ASbGncu+PlVZng/0nON50qB8Yr5qinUxRhsyGPtW9f3oIYUumbGFKZT5eZuILjmH4q+
 hdcfAwdYMLQaQsOPaAZvx2Obg460rcg4Z+N7WFlTkfgkGq1b050PXl1Ke6uueOWvzKofkSA+e7S
 pBf7hNbDRsc1X7QFY1mrBY0pOF/vh03hj8cvBZp4APK+YcTRoBaRZuCADjNDf0YB4J5SSjytao7
 Dax1r8wPfxIViZMgP9HrWS6FFBTRFu3ieQ7Ptg6AELhN0jiomMDeNUAgtT2DDtUiEMQ+YiVnK8a
 oxn11V7I/a1uQWqCW2NdfFB+eU3S9re+yEnaorPbd54F3+u2ipBFyxqdwzEcWUhmbZu2ZZhB3Cz
 Z2x2gzxsTEEjZtTcaVLSHfh50LeTUinDknrMmh8VeFO3GJExpAoFxyLE4D3GL7va7r9oczcsz+h
 M=
X-Google-Smtp-Source: AGHT+IH9Td1weLVNisf4to9lzLCPe3cNWf9eIXubukdh2R/fUUXMkNiI22zD2RgZqeyDpQfBYih7ig==
X-Received: by 2002:a17:907:7f92:b0:b77:1b03:66a1 with SMTP id
 a640c23a62f3a-b79dc758d94mr555102666b.41.1764828886847; 
 Wed, 03 Dec 2025 22:14:46 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f445968asm50607866b.3.2025.12.03.22.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:14:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2 RESEND] gpu/drm: tegra: dsi: make SOL delay calculation
 mode independent
Date: Thu,  4 Dec 2025 08:14:35 +0200
Message-ID: <20251204061436.5401-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061436.5401-1-clamor95@gmail.com>
References: <20251204061436.5401-1-clamor95@gmail.com>
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

Move SOL delay calculation outside of video mode conditions.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 41 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 924611061cfa..aab555a2eb68 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -560,11 +560,6 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		tegra_dsi_writel(dsi, hact << 16 | hbp, DSI_PKT_LEN_2_3);
 		tegra_dsi_writel(dsi, hfp, DSI_PKT_LEN_4_5);
 		tegra_dsi_writel(dsi, 0x0f0f << 16, DSI_PKT_LEN_6_7);
-
-		/* set SOL delay (for non-burst mode only) */
-		tegra_dsi_writel(dsi, 8 * mul / div, DSI_SOL_DELAY);
-
-		/* TODO: implement ganged mode */
 	} else {
 		u16 bytes;
 
@@ -586,28 +581,26 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		value = MIPI_DCS_WRITE_MEMORY_START << 8 |
 			MIPI_DCS_WRITE_MEMORY_CONTINUE;
 		tegra_dsi_writel(dsi, value, DSI_DCS_CMDS);
+	}
 
-		/* set SOL delay */
-		if (dsi->master || dsi->slave) {
-			unsigned long delay, bclk, bclk_ganged;
-			unsigned int lanes = state->lanes;
-
-			/* SOL to valid, valid to FIFO and FIFO write delay */
-			delay = 4 + 4 + 2;
-			delay = DIV_ROUND_UP(delay * mul, div * lanes);
-			/* FIFO read delay */
-			delay = delay + 6;
-
-			bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
-			bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
-			value = bclk - bclk_ganged + delay + 20;
-		} else {
-			/* TODO: revisit for non-ganged mode */
-			value = 8 * mul / div;
-		}
+	/* set SOL delay */
+	if (dsi->master || dsi->slave) {
+		unsigned long delay, bclk, bclk_ganged;
+		unsigned int lanes = state->lanes;
 
-		tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
+		/* SOL to valid, valid to FIFO and FIFO write delay */
+		delay = 4 + 4 + 2;
+		delay = DIV_ROUND_UP(delay * mul, div * lanes);
+		/* FIFO read delay */
+		delay = delay + 6;
+
+		bclk = DIV_ROUND_UP(mode->htotal * mul, div * lanes);
+		bclk_ganged = DIV_ROUND_UP(bclk * lanes / 2, lanes);
+		value = bclk - bclk_ganged + delay + 20;
+	} else {
+		value = 8 * mul / div;
 	}
+	tegra_dsi_writel(dsi, value, DSI_SOL_DELAY);
 
 	if (dsi->slave) {
 		tegra_dsi_configure(dsi->slave, pipe, mode);
-- 
2.48.1

