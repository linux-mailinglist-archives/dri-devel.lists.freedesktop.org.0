Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824DBB47A2
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 18:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1510E815;
	Thu,  2 Oct 2025 16:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kVPK1shN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270A410E80F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 16:17:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46e37d6c21eso8761285e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759421867; x=1760026667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mku9ehBZVYr9qxRYLkJ4uKrLVeypEMB5DxHQCDkGT7E=;
 b=kVPK1shNpzcqG2wByLUHopUHhpVuo+UHB8rheIsr5N/KHgnruWVUENvtBtdlzzdP8L
 BrwEzawgJOCT2J63DA9Ab2QmLDpE30SkPoPRarYy5zhCSyl1vOdlHiICAXj7M1bsa6PP
 HkE/KFH1Oh7G3Y+HOQKYwYgh9/5mQJSPXPoaz09PhSjpFlAmURY+0noL8um5UH9Hwz6c
 P+y1fFJ3S0kjx2Kj1NkYCHeLnF4ounG6bRd7rjmIoCEPCqEoRnKsJA16HnJvd6hSKELE
 SwIPZAkT7BgfqjNKmFOyMwXWo6Va6MnGvwTq47aCLhDNNmYtANx25bJVe+IWINql+PNW
 47Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759421867; x=1760026667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mku9ehBZVYr9qxRYLkJ4uKrLVeypEMB5DxHQCDkGT7E=;
 b=GnvkK4y9Fv8BhCHmVU3aX8gckZjyFG5Scd60Cjo+Dktq8Z46sNGCWv3EZ+Rmg5Po8Y
 v5hvRYr5uEhQvZSXgo7RtIRPJdQiYIlKroDM+nSgUjhMiyVIuh1c50SyYVeypueUf+7i
 ZV5IAOQu9KB6+Hou/c29SXVjlXaVVAjTa+Q23QDWTP6qc1WLNgjhVbN6cNAuXkfGqIV+
 lu17EJR0ozWIwaRrp1sVNb3MOeITfzervSuv1xgXXW0fpxUERFSnUjpPrRtCqY2RpSUZ
 9aSUZnKcSBLS2/reYvcKGRstj6xaPJpckijm7rckEB9BQD86Xnd8icWphnqo0KHP05l/
 9w6A==
X-Gm-Message-State: AOJu0Yy0gUX0RNbi9zXyoFhCPYlqNGoAb7nd5+jkd+W7JZ0JtMg+WyKB
 zEPEXEo8/98sJxzy15YEdC4hUiD0voCDZSOv5dTW5DawxhW8hEKoC9aq
X-Gm-Gg: ASbGncuA6L33z1blFRmC+9v0KOfC/h5nWy+3tXrB4kJE70hQ6gDDqHbr/GNxT/KTkY4
 n7KJpABI6LaEtMN9BNrzYzBWpv3+o9sj43BVHCLFJf+DCIAqXzFlxgNzBoIj1JrorPg/m36jH96
 SI/zD+ASOIlhxUhQ1mf15mIUK9lSCNtPnQZN8/Maow2P6WDYbzmn1Go1SfsrY6PX0CzmnwhTeJD
 HFTpYJBpelEEd9vdUDDkALxBoKnM3B1x06L/FS9hy9c8aL+oBIt9rJS7RrUjq17cENUsJDwrXGe
 zhg+xzaBIZJpSI5Sbx8F71HyZSSBHnN2agqrkz4BsbbZe7nNr/Jz3KZMs/wxx/KEUjCOUAP4+y2
 KHiv9rtB3ENBsDg9xRtvbXxrw8AFzvfxVCNvAG9sFoZj4fP1D/V8bBwQ1ayYQCKRO25+6zNml9e
 vbd4rH
X-Google-Smtp-Source: AGHT+IGeLiSiOTWvku0XOb7pjsu8OYgt/p6DzNcZOdgcfnQ7jJbiYwMNujXhPwp7rKsbuxI9FkchAg==
X-Received: by 2002:a05:600c:a08e:b0:46d:cfc9:1d20 with SMTP id
 5b1f17b1804b1-46e612bab6cmr53404705e9.22.1759421866515; 
 Thu, 02 Oct 2025 09:17:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 09:17:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Thu,  2 Oct 2025 17:17:27 +0100
Message-ID: <20251002161728.186024-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
rate to configure the DSI timing parameter ULPSEXIT.

Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
the "lpclk" clock during probe to enable lpclk rate-based timing
calculations on RZ/V2H while maintaining compatibility with RZ/G2L.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
v8->v9:
- Added reviewed-by tag from Tomi

v7->v8:
- Updated commit message
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.

v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..bb03b49b1e85 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.51.0

