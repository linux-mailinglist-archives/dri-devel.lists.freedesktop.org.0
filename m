Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4FBC9F81
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142010EAA4;
	Thu,  9 Oct 2025 16:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z+Qz8mHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7A310EAA2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:07:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fadb4so1372696f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760026066; x=1760630866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2af5ZWbBC/9OLhW/nzoY8CDCHerUl/T+QhinKzjtT78=;
 b=Z+Qz8mHRs325xr16lNXSACRxlQasVD1qU/G1EB+XA9RggS+sML4lCVa5k2ynxb9HF6
 Gv09MLVl/Zhyxxaz+qDRthyD310rG+V7bZv1PUnZ6QLwd1Av1CgEfRhq+4ygCw1yMaFz
 fCvNW+81ao6EhCl/66HkiRO4X3j4QAXqkt+YHCgEJyq0iIHINW6iZhTeyS2MVq9UjDmu
 eklBEVjSAhUUkKgqG3qL/VmNyYJNuBz/hSQ4Dhx92Iz8/qvmK5MhUmc+VN3oBLL2Mi5X
 msObqwEKsPUMKxLMNOb74ANkII0Qv/kRzSlxEOrWNjXZ0VM4UrH2JOuuH6oAk2FeOTe3
 UFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760026066; x=1760630866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2af5ZWbBC/9OLhW/nzoY8CDCHerUl/T+QhinKzjtT78=;
 b=W/3gu6pPOEvCYJX/kdSFwv7VjgmMmi5BONUuCcER2XlTSoq+mMjMA1ERMH694o7qPf
 oO/oIP8r9wRUFuw/Z8zmaPZ0n3HezXa+8hgtwhSrMa4CfNeE988EGe8I2kXT5ZononuS
 zIH6LzlP7+ErRmHiw4g2PwCdBBku2E8+8w1l+HA7tlmXUXLmAmqLLbJae92QfTMMS7ER
 tw5vKNqQYJW9XmEZj2Gj4mAJFOt9VrA4I3LnkGb2JEYahMt1zThMv8kduHQZYjSvnJE8
 jYZS2xnizR0vD5p/78q+Dk5PEViZb5UlQCrK0rn/shpxIsI2iHO6i3kU2UT4vbGhchj9
 yWEQ==
X-Gm-Message-State: AOJu0YyV5iDnC12a/9B5FyNp97RUPNejqQqGtBKjO748ktiazLXggMMO
 8AIJlSTagSn2Nsu+nxDejn7YcI7qhnteJUD7+pgkxXYe3EaojWiJNfXv
X-Gm-Gg: ASbGncvC3zj8sri+5mvuQiU13wiz5LkmlMtT0xgfav9bmtWdndrL0E+5P000van3Yt5
 MfylaVArD1UiFSTzv9B2N+rYkzkinfdpk3ecijrSKFl5LXZSXCKSRviEKaTeQtS0q/KztbzggaU
 deZB72DKg8/kLBvLthxSpfXVcUGcQM5YSNkYLm+oniPu/6a49YPHkeaLpWajkY30Qwu9s0IONQP
 hhnmt7X5SrO6kZJpsUtHP4G4FwDCbs43JQadO49oeRWC5SLBDeU9cUsuhjnr2RBBAE9uALAtYbK
 LLXJtSvPtSUg7AZ+kw868zx7hV/k8HbVa5FPkwWoU/YYdmRQrkbON70JtsoEQ71+x3a50kcns0j
 trQAKlw/c9gx0DuuDfoiDsOb9NM/uAkesOUPbja6JpWOZaQRKnuw1UkyTDuorS3mc/yFC64o3CY
 VuVHht7Bkm4apk++w=
X-Google-Smtp-Source: AGHT+IE0KMq3ZsTbgVRvE9ZWmsGn0SaVRn1OTKWCKWyaqHw5jxmXzidd2ULsjc4Dgmp2DbpJwZm9eg==
X-Received: by 2002:a05:6000:24ca:b0:3f3:3c88:505e with SMTP id
 ffacd0b85a97d-4266e7dfcb8mr5595946f8f.29.1760026065423; 
 Thu, 09 Oct 2025 09:07:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:480c:edeb:2884:a92a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426cd93e45fsm94632f8f.4.2025.10.09.09.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 09:07:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Thu,  9 Oct 2025 17:07:31 +0100
Message-ID: <20251009160732.1623262-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v9->v10:
- No changes.

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

