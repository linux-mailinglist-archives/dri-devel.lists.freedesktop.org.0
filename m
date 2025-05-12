Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92123AB4291
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E6010E488;
	Mon, 12 May 2025 18:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xz9GLNRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A98A10E485
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:24:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-442ea341570so2893845e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074239; x=1747679039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZ+vU1UoobYMIUNcnHOC7DBBxsyxbdR3mTKec7LYTd4=;
 b=Xz9GLNRv3NmqupX+siMs1K87wV0cOpUXVvcIkdltZF9i6Od1eGk5LKfvjGxkGFpxjd
 L6UrOSCWIi/lOoyuAZNbeKljHWwlybSFVQTUVVAf3M8mBkfBqvB/v48ZrwgMLiiCGCEq
 wIOVCooJKQ2nayixKF+fyUMfNey4rxyk7nYzVhJhrst/M1UQK0ZPoqwDAzvp9dUxqHwN
 5JVSt6kDaukqAyaYIhpHk7243rujgVKh8LZHmaAMtgXdtP+gd7p5r9lKQbCuYRDxApH3
 sgr4DNYE7Y4WDxCVOl5Pidq0Br8raQ9JU5kqwA2Tx4N1UAF75Z+RSTSBV6KLZ5qw462+
 cPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074239; x=1747679039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZ+vU1UoobYMIUNcnHOC7DBBxsyxbdR3mTKec7LYTd4=;
 b=U99nKHlpbcEx2FwyL8gMScp8f0MagjuzsG/DhWQZrzK9Kk+foT0na5YEDUVkBGZ496
 00yY7sC32n72SuyZDAFYbE594PEYPosonvQa8xrrxmNV1fJQjMNCSlsvsq9kX8Yp3zH1
 /pTheL+1NAJ+wrW/8IQyyh6EgNfuT1xqcFWzrJ/h1eCzfnd99uJeSH8PtKXzr/VeogUQ
 ARov1VRw4q0lz4xFPloVVHc+xNkJ0SuQ6X/5sGUDmin/tdv0XLba/iMFeAG8aut7gw5k
 JCxiliHwI5ZO2+kBHPFTVtbWVnB+qzEbbB4O0IrnXh+n4C2qYBIe6JhCjZ0wH/J9WnAb
 Vw0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMg3AT1zOA7MtLFH3BrpXhfIprzSq3tPhLe71qqr/EZ4qHjpLk3TOqujIjLYlecXLzLB8zn2IymEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOfGa4iSNUqOH5/5mf89WSb5r40Uu/2pB85KE5iZuEnaUaTAtx
 hKpfSVcHJS+mKDMZMpHdTHbhFVmhv60X/fGbzCF12zukLkHD3p+N
X-Gm-Gg: ASbGncswjKsx4uF6NRnlUBok3aF4cHpvDB+8zATnRmxce59NowBGntafM+AyVoLC2mK
 zrDz55DAm8rAz9Ru0E2nHWb3E06uuhDGJVFy1nXPJijdhf2HfsXq53XfIcARn8jsYhodtVbU6CG
 O8zBIn/F9BT3bdFP4P1/fTfmTNnIJm5D8ADWy6hh+QaNozNy5hl5azaoXid8oZKFcEsiCOIgUKC
 F3WC3l0cA6PRO5HuWQ3VEORWRLm9rX6Iw/g5lbdOhMa/peQ2bb9HB/VkSYPQ04USa5RJSloJoAq
 KEYi3bvVUGsLaUwGZcZzY8Y+4jBnyKoE9nkiJeL3LZclLLX6UGyHtp3YntV9uaRrFrz28o6QCae
 Q
X-Google-Smtp-Source: AGHT+IGavDLVMIPNMOKz9zNl0lm18Doe2+KmtMGHo9AttZImonrNlkjLDy7R/9fBkR7zQOUWmYdW+A==
X-Received: by 2002:a05:6000:2902:b0:3a0:7a7c:2648 with SMTP id
 ffacd0b85a97d-3a1f643cb8dmr12403626f8f.27.1747074238563; 
 Mon, 12 May 2025 11:23:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:57 -0700 (PDT)
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
Subject: [PATCH v5 09/12] drm: renesas: rz-du: mipi_dsi: Add feature flag for
 16BPP support
Date: Mon, 12 May 2025 19:23:27 +0100
Message-ID: <20250512182330.238259-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Updated RZ_MIPI_DSI_FEATURE_16BPP macro to use BIT(0)
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Renamed RZ_MIPI_DSI_FEATURE_16BPP
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f93519613662..55a1c1b043c8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,6 +28,8 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -37,6 +39,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long max_dclk;
 	unsigned long min_dclk;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -643,8 +646,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0

