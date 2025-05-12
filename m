Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E1AB428D
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AA710E481;
	Mon, 12 May 2025 18:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fOMtQb7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9348F10E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:24:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso30139465e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074242; x=1747679042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBldqOJbxPyk01FO14zb5LuQItiiBv1hPLg4G6aZDqY=;
 b=fOMtQb7mXXZaDlSXNG37y+G4x0wbZm12Fch1VNns2V8svId1IaTdXbdgcS/R5PVVnC
 OQE8Ko0IBqoJLIudAHPG4qFPTJ/rF6bPT2owQBT1ZxONM3lHw3ej6Ua/OjqRZDWmX/s0
 yhH3jYJO44wA7JovgwAbYlduGZ/1mesx0vJu2xj3wu2zo4C9DN6XjNj6V2shXLUdhGfA
 +oyfFNvwqf4YonwCiKwrl4L6oC8h515jD2sWCbyFZPqWhB2Iem4akzWL2ZbaUMm99ajE
 3BPkfPl/AEdT/vikxspj55wsPZOuQF5YHvBgZOQbFEs+1R71O6fXdU6Kozzh0yfZpwaU
 z+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074242; x=1747679042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBldqOJbxPyk01FO14zb5LuQItiiBv1hPLg4G6aZDqY=;
 b=AHdpNPZhZNXg8nzHuewv5taXzTA7fBjsY4qdPggRhihrEMuHsJrzxqkFGkU8JcXjC/
 wTtFoAt/+OgaPATNL3sjFsuVykefNaOj911ztjd/vyfKEoJYiYZ/ML3zX9AWCN8fGgHP
 /Ry3na7msrJQ/JdjAz+rH3p8FBNanlkEVNysFdRQs24C0zTthAT9eKlegHvmScRtH25N
 eFJ9olgO0Ze0eTj2GSUOTME4zmDT1izdSPekkvkXzz/1MCZdgWK/3k1CyYWDG4lP0ydY
 ETsnW7aGBAtiwutsu6k5nOBWwnioS7l2676l8IoA603Jh5ybgbLvY+0sfqbaYudg5R1w
 tmVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjP3mkcWvv5ozHG/5ryjLGfgwS8KVQxet4Aqhb3GF5l+hYoXvZmv7IdNQoHXrOys8EhD3rILqjSsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLiDJNbQxCA5ELVKwh09IIuzAqSj/7KShYjU/hQ/ngpCqAWKu2
 DEXXL/ulDGJVM00llQ3KZxJ1F0P4rL0j0JUYNrDji4gxCmjBE4pQ
X-Gm-Gg: ASbGnctpXTEzGMY+ptuWX+1TutjCtBl8rX14/74dXK73huAZKD1f+zxcOcIbDPfjJw1
 e3DMxdpvIofcVKWpOwiKjcvkTUXzPpCoI5OMS3kDDZ/XREbO8TGopT2akME1Koa0i0w4BgAKvcQ
 SkuznbQUFlN/2ban8WalY3eyBphtYofP/L0q1BrYPkZFJl1WIbaWEtuzamTDeTOgaA6zHiS1KZN
 lvZ9+wI1U/pdG+wP9ZYMFRBYdyTfmJziNaOpBRRwho42+c6a+cAOUM2ePwFNhMZdunQ8tZPU+3h
 hkVciJRGr519opfvqVWYxn1SWoIXXjNaE8B1KjtJ+kPUG3vhRMdj1hF5TxlWWhscfSBkQsyo+co
 Y
X-Google-Smtp-Source: AGHT+IGqeZRKNxhHRaoSDKnh7ZHow4KAV/QyIpjtHrUPVuyzvNsX0/u3WONT1r4ZQ2DR3fjmEAYQUA==
X-Received: by 2002:a5d:4c4a:0:b0:3a1:fa6c:4736 with SMTP id
 ffacd0b85a97d-3a1fa6c494emr9331963f8f.57.1747074241993; 
 Mon, 12 May 2025 11:24:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:24:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 12/12] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK
 clock handling
Date: Mon, 12 May 2025 19:23:30 +0100
Message-ID: <20250512182330.238259-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
DPHY configuration, whereas it is absent on others like RZ/G2L.

Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
during probe. This allows LPCLK-aware SoCs to pass the clock via device
tree without impacting existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Made use of devm_clk_get_optional() for lpclk
- Added Reviewed tag from Biju

v3->v4
- No changes

v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 35f0bceac055..98d2f30ae79d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -62,6 +62,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -790,6 +791,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.49.0

