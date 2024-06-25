Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E4A9167EC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8802B10E648;
	Tue, 25 Jun 2024 12:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P8XGjuR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661A410E207
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:33:43 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50aso38694841fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 05:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719318821; x=1719923621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/cqf1zVU8T9PJtUZDZ8GI36DML+N/iS1fJepnMDzz0g=;
 b=P8XGjuR5p5ck2UgmrkS4a/G5EgrJ54jyFMQxz0rBWSEqe1jCPGalWv/beZC9TYfGe/
 2XVRQa8RpZI/ogBlYRhGzB+LKIgokCw7oeuPd3P7xEQ0BCEdGmy/3WY5SgcxsEiepZFw
 jb4xkt4g38tQ2mrKriFVK7IOvha4arLrHxzuPgCf5Z2GLP+u/kBAhze4HFICEdPuy/lL
 DgOCH0pbPe9vjw+Px8jm0mrEFtssTnmWYtoo6HFoPGMu5joK4ydTXJXmkJ6l/rk4sYYr
 1rne8PT9ySIuHwOxms5Vt+KIGUGicQGKpAnCShmAdXu/mGvvd1LtSrNqv6fi+3jXS2tX
 ktMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719318821; x=1719923621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/cqf1zVU8T9PJtUZDZ8GI36DML+N/iS1fJepnMDzz0g=;
 b=GUJBRgvDbAkQOf1d7hph5wb7D8SHTkC/NYGPtzulJd8lJXEm2SNBwepHe2yajNqFS0
 Pxm7VyHhWP7Eikv0Rc6GeEioQ8iy/QMLrbOqq3lGs8fbEZVPM8Tty4PQPyHtDmvXf39y
 ECe5OYT+CqZpXKN6oDuo+D/vmwL1OvaSBwqv1aH3YJLR8jcT5tBH1nBGzejF3o/0qtWj
 pwuOtuQ5iCB6TjG2iC1MPSIdpynV5X9Ofp0p9/VQeNmlGBIm4AfdfBkYpBlWKJiv5zMl
 j4/H/lrVUeyR3qqd2xeHHiMzxQ/+eu4+QB2EqlG8UqKAeFCjA4AuT4uH8Jq3dB1HAqe1
 UAQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5dULln7cMYzDGv760oVnPSjSMGtDLpEaAajS9mh8oQ+8+Whs8otm74jiAWH1CHmg0nbbyUJC2DE5nTLPV8+qcAfZuTG8rGUAUlc5S8Jc7
X-Gm-Message-State: AOJu0Yx6eFbVbEPAJwcQCbE61Se9HR5ni48UREr/kQlFu9v5sHbBqqOM
 5+Dkw+yhm8cCUwCkJRcgj2QgrPP83WPkSv9susy7ckZSq+on+kSb
X-Google-Smtp-Source: AGHT+IGzf5w6HLzjANOioi8j8FbeMtUVIjSCWhXUsPjbZQabhZlzSRfjXDiGuLHklpPZSuy0Ut33Vg==
X-Received: by 2002:a2e:86ca:0:b0:2ec:52aa:1155 with SMTP id
 38308e7fff4ca-2ec5b36c1fcmr59350491fa.52.1719318821025; 
 Tue, 25 Jun 2024 05:33:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be818sm210288485e9.15.2024.06.25.05.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 05:33:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Date: Tue, 25 Jun 2024 13:32:44 +0100
Message-Id: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
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

All the RZ/G2L DU specific components are located under the rz-du folder,
so it makes sense to move the RZ/G2L MIPI DSI driver there instead of
keeping it in the rcar-du folder. This change improves the organization
and modularity of the driver configuration by grouping related settings together.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rcar-du/Kconfig                   | 8 --------
 drivers/gpu/drm/renesas/rcar-du/Makefile                  | 2 --
 drivers/gpu/drm/renesas/rz-du/Kconfig                     | 8 ++++++++
 drivers/gpu/drm/renesas/rz-du/Makefile                    | 2 ++
 .../gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c   | 0
 .../drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h  | 0
 6 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/renesas/{rcar-du => rz-du}/rzg2l_mipi_dsi_regs.h (100%)

diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 53c356aed5d5..39af73cf2092 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -60,14 +60,6 @@ config DRM_RCAR_MIPI_DSI
 	select DRM_MIPI_DSI
 	select RESET_CONTROLLER
 
-config DRM_RZG2L_MIPI_DSI
-	tristate "RZ/G2L MIPI DSI Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
-	depends on ARCH_RENESAS || COMPILE_TEST
-	select DRM_MIPI_DSI
-	help
-	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
-
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
index b8f2c82651d9..6f132325c8b7 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Makefile
+++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
@@ -14,5 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
-
-obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 5f0db2c5fee6..8ec14271ebba 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -10,3 +10,11 @@ config DRM_RZG2L_DU
 	help
 	  Choose this option if you have an RZ/G2L alike chipset.
 	  If M is selected the module will be called rzg2l-du-drm.
+
+config DRM_RZG2L_MIPI_DSI
+	tristate "RZ/G2L MIPI DSI Encoder Support"
+	depends on DRM && DRM_BRIDGE && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select DRM_MIPI_DSI
+	help
+	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
index 663b82a2577f..2987900ea6b6 100644
--- a/drivers/gpu/drm/renesas/rz-du/Makefile
+++ b/drivers/gpu/drm/renesas/rz-du/Makefile
@@ -6,3 +6,5 @@ rzg2l-du-drm-y := rzg2l_du_crtc.o \
 
 rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
 obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
+
+obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
similarity index 100%
rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
similarity index 100%
rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
-- 
2.34.1

