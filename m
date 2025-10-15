Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD5BE060E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 21:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620BB10E8CB;
	Wed, 15 Oct 2025 19:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CN0pBTvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C5910E8CB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:27:23 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2681660d604so75469345ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760556443; x=1761161243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pom1z8x6b2wC6BQNMaEH7yl2novyBrsq9B9vL+Qq3dc=;
 b=CN0pBTvy84DN8OC2+sVDB5x9EcHnMFtobLUlnFodghQ352t3MZUqjTzHIFAF4wytcQ
 3EhG/LOHOLQsjQDxOxjNhSA2GiTi9rwl/4uSRuw8SVxBwIYR1epiD7Y403YbwZj0Cbx5
 1RuJdxn5RLZDP40TWSpOVh8RAI3wD8JkhyGiV35Ti4m3wKy0fT6ri9n8aBPPYk7knnPK
 q/ntZcrTCT/tsQXxyPzj0hXuL3pVbO/PUAZvHSx2toX92VMy15M8wfUpb969MCfEyTsR
 pzsU5UyaC01Gecc+mE6z/ZPBsGw29j8hv5JWbfEfAqoAUBHvM8KmpKGGuXnbrvwVxsdq
 SZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760556443; x=1761161243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pom1z8x6b2wC6BQNMaEH7yl2novyBrsq9B9vL+Qq3dc=;
 b=Ba7FAiyF2G2Pp4F6oGAeBCyDGZyn/0d8cK0kdvb4xRKQyjhDOVVz+9pwuN3IgoijPI
 MUk3n5Cviwc0Pr/24HQwhilaK1ykBwiE2P2jEV23kHbkk19fQHexuLn+RBp5P3YpqdGf
 NSqNEQMETvOE1vLGg5yp7tnLEYY1idUpsSC0uiwA9VZMP7DAYbgoMwAAtfIJnSXlb3l1
 4qX2OqekZhGro4V98fo59pktGfBdUgNcFqkQlIFf9B9Hd8AldIxO84oaaHPoE8PfX0te
 lT5auoUI8++b3QF7QU5YNQ46pxwNsLLVb4bxv/0sReHfhC+gWST8i0HVAhn7A5Bigd1c
 rXgg==
X-Gm-Message-State: AOJu0YyQfyjt3CT343TmocXGgeZmoEMK9JOoVu3geRrqQbewWXwM5YqR
 CpTgptdeAW7Imdg7S422IP0JeRiyLHjKarOZcnvRet1iKVN9pD9ncno2
X-Gm-Gg: ASbGnctsjLKEy7Yvq08P4ktvslay/CcOycem7r8g7wS9EITy9O3U/JzELGv9qNuUhZ5
 xKPvPcYCQR6peTP3OjOZiO/2dItmk1ysr1X9HLd8vWfHg7fi4OU4nk1eOuMYWP0heZX5TwUaKHI
 SFWoVta2nR2NDnHqFre6V6vvL+s4YnWUFqLeJ+oXzvTyOc9+ZBPcekT2/SlzpOFo34plQG9jA5J
 6U7K8NNKsuiiEuyr3URoGj52qpp4KUahwxdTbhBbVFfG54uREk1Zo6Agqi3rkPBS1dEzdt/4iVz
 IzAka81QRn9XbmuttgB6xu0fhJGkaKDdVzVWzknxARjlxsvMCq53ZNtNev8wa8mCvy/dPReamEW
 No9bOtS+oWbIVXXjYcE5eU6BpVzsS7s1n97HGUMVpDdwc5mNczhn1w7F3M3vRag2XbIQGsU5YIP
 o8gnB8hiT2WwkES/tHBFUC4MY3fmTtl4H6
X-Google-Smtp-Source: AGHT+IEUBZvmZ7j5CmyPSsiuBgYRCtqbKU9tc4v6VxZf7CqxDQDbwQYqkXWhISDpFwWeOwm+SJbo/w==
X-Received: by 2002:a17:902:ef10:b0:271:5bde:697e with SMTP id
 d9443c01a7336-29027213340mr393885805ad.3.1760556442627; 
 Wed, 15 Oct 2025 12:27:22 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:27:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v11 6/7] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Wed, 15 Oct 2025 20:26:10 +0100
Message-ID: <20251015192611.241920-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v10->v11:
- No changes.

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
2.43.0

