Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA5BA086A6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 06:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08E510EFC2;
	Fri, 10 Jan 2025 05:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iisBkp/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064710EF9F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:39:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 893E0A41606;
 Fri, 10 Jan 2025 05:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46C31C4AF14;
 Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736487596;
 bh=lYfgcjnWVOh9r2jS7pg1xoSiuLI+3fr2N40FQHTJ5kw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=iisBkp/VqFpmIaAvYpfAIyJRV4lcFO1MDO/NYjenSJZ1F256eumL//D42lz1Agzrc
 Y0qnply6qboYXDt/JLMXZgBQ4c1N6fTJp4jwwvb3T7bnRzHJ7Q0ycWjv51QPVMk80s
 OV6SREHPUMs4b5ITcGvdAQXvlSMna062G0vriOomfsm9LZbxHq2PNi3i1baXAKGyBM
 PakvEFuYCQVrR7uokGP50M6X67/AM5PD18OWZuJSfhGhg3iW36+KrpfInLcz85vl6G
 RF6JIqBRVLu83OGvgkUtuSKmNPkKGOH2I2+PCj1CvsGiXgSzol0I9MXqtGvzA1RKtQ
 pJKO5b7Z6oxnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3C217E7719C;
 Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:40:00 +0800
Subject: [PATCH 10/11] drm: meson: add CVBS support for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-10-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=1984;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=ksJtH4UxnpEi7M4UkQGZERM6UKX2oS80vckfy1Q9IKE=;
 b=rmzddFL21GrVnJWT/GWsDudRTQRE6oO9H55qODD4VTAuFAr4RaVDt8+uZUOTfYRY7VK/OYwY3
 PrV0mS4uywOBSA/hF0LAwYxgqPPvR4uPeVjWkxv68lOF7sP4Wa38bCT
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
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
Reply-To: ao.xu@amlogic.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ao Xu <ao.xu@amlogic.com>

Add support for Composite Video Baseband Signal (CVBS)
in the Meson encoder driver for the Amlogic S4 SoC.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index d1191de855d910f9845bf2d5aef336e391982ba2..45ed800173c1754b23fdc8b53e9487530bcae5a3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -30,6 +30,10 @@
 #define HHI_VDAC_CNTL1		0x2F8 /* 0xbe offset in data sheet */
 #define HHI_VDAC_CNTL1_G12A	0x2F0 /* 0xbe offset in data sheet */
 
+/* ANA VDAC Registers */
+#define ANACTRL_VDAC_CTRL0	0x2c0 /* 0xb0 offset in data sheet */
+#define ANACTRL_VDAC_CTRL1	0x2c4 /* 0xb1 offset in data sheet */
+
 struct meson_encoder_cvbs {
 	struct drm_encoder	encoder;
 	struct drm_bridge	bridge;
@@ -187,6 +191,9 @@ static void meson_encoder_cvbs_atomic_enable(struct drm_bridge *bridge,
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0x906001);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL0, 0x406802);
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL1, 0xc4);
 	}
 }
 
@@ -201,6 +208,9 @@ static void meson_encoder_cvbs_atomic_disable(struct drm_bridge *bridge,
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0_G12A, 0);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1_G12A, 0);
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL0, 0);
+		regmap_write(priv->hhi, ANACTRL_VDAC_CTRL1, 0);
 	} else {
 		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 0);
 		regmap_write(priv->hhi, HHI_VDAC_CNTL1, 8);

-- 
2.43.0


