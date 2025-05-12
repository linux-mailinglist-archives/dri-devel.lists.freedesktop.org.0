Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4DAB4288
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CAF10E483;
	Mon, 12 May 2025 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZVxaGTyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447A410E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a108684f90so2927425f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074232; x=1747679032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRiPYE4cajKFiVaaSWX6xevQKkWMu8hQmnI0vIhOWns=;
 b=ZVxaGTyFBA1wolx2GM1TyXgf3Q/sSbDydin8mD2S/l9gy0UUoEE1FVIATOzSBdqTsV
 H/bTwBh/Njj2frIPAtk9GvaAMHss9UGKvO4fghvYcRk0RM1aiCXshfLp3Ehyg1Yd9nV8
 KlQAdCkoM3q0pp2Qme/EvGB+njFheY5CYf1mealyMVyrqK9ceSTnLWeN0UVbMvNWnO4c
 VWERXbb08f1S4ws2ztFIfjOpyayRBr3NDo01aqZlOrZ1MUTUWelYzjnB5guRCM0gZprs
 v/tZlvX7d3zgRSvIxxahkgXCUdKJgo9bLHywPrCGhNAAiVmsGp9xUUBWCMFX7JIFWjv0
 QF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074232; x=1747679032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRiPYE4cajKFiVaaSWX6xevQKkWMu8hQmnI0vIhOWns=;
 b=kbxnPCxMS8swEKxBCF4ptad8yZ/OwGnSrprqSCVywJfIufWFe8wmIntHcJRqnESnBG
 U2eBpnUDljszGF37+TF05aJJcLYayfq05FjZHC3mgldBt8QX7UxxHIKhwIxUoDrP+410
 RsexoJxpRCQrsbnu8dqbnu7CrQUjVEDah/mPm38F7gg9+7bAfkchSyB/kpffWSXdU5BX
 1PZA8lP8BP6+r5hOWj9nCaA0RQ/dxgoW3+xDQrcSIdzvyTis7W9GXHH0Cl1x+TPGa+QA
 FeRK/CqoY1pnPo8XWDCE5kYg+I2CBaInqZO3CMk9LfqlHfmPVDsbnnbyMLivXQzc2fEJ
 Czlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHOl31nzfPx9Tm10gQuIMLd9sj/XKZ8e638RW96E+74lnP+Ct6S3wSQluqq/uG6Mgvoy0Vhgvp3d8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3rec29rxitKjnSs5lqXKTWYkMPdA7gsguU1FBSNjePaSbn0w5
 Wh9hTVnF4aSX0UDGBfFRFiknaNpPpecGVlbU3EVNmampqLq1QxD/
X-Gm-Gg: ASbGncuYV3Gm/Ow87maykmg1nraqaLapUV7ZscJGfnIEZUX7960uDkpG/nH7YbopmjG
 qQi6SLbTAFC0hU0gFOUc5BodwJEh6CL3pNiVjOsgD+Xqz1QzWYay3QfxsUTqNIHjJgObwfrdc0t
 q5ZNs3sV680zpbWxSi6UMbEDbkTBIoo8od0cTm3OscCpdDeYO7RvS9g4miiyhnk1Vr9gzcFuVo6
 2qBh6/ZEini7Ps+lyZbXq+MdLORsecLgu+9DO4q+CeOjs//0j79WVpT7Sbod001hKHQlWS4oy3n
 5u/ISt1XS1mj2j/jcKen/6sUCRtqSYcPP/A/ziWufbAsGkwQ/amyiG+TrIICyjl2NHEMkiEsbeM
 4X0zredGJbuo=
X-Google-Smtp-Source: AGHT+IFTz7S/GODM8ebO5jM+vzxvaYfeCC090Lxfk1Y/Zmr1vAfTxu/ojKiBqCGjlSPxDzu56yqJug==
X-Received: by 2002:a5d:584b:0:b0:3a0:9dc2:5e0e with SMTP id
 ffacd0b85a97d-3a1f6422323mr10602000f8f.11.1747074231666; 
 Mon, 12 May 2025 11:23:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:50 -0700 (PDT)
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
Subject: [PATCH v5 04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Date: Mon, 12 May 2025 19:23:22 +0100
Message-ID: <20250512182330.238259-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the high-speed clock frequency (HSFREQ) calculation by removing
the redundant multiplication and division by 8. The updated equation:

    hsfreq = (mode->clock * bpp) / (dsi->lanes);

produces the same result while improving readability and clarity.

Additionally, update the comment to clarify the relationship between HS
clock bit frequency, HS byte clock frequency, and HSFREQ.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added Reviewed-by tag from Biju
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ec8baecb9ba5..c5f698cd74f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 *       hsclk: DSI HS Byte clock frequency (Hz)
 	 *       lanes: number of data lanes
 	 *
-	 * hsclk(bit) = hsclk(byte) * 8
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
+	hsfreq = (mode->clock * bpp) / dsi->lanes;
 
 	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0)
-- 
2.49.0

