Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4BFCF158C
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 22:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7304810E292;
	Sun,  4 Jan 2026 21:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="aTO66Wca";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="J7f/WaJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9832F10E292
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 21:37:54 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dkrPs397pz9tQk;
 Sun,  4 Jan 2026 22:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767562673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yBAOLlPWvQKPDIs4oNpFowTmGYJ0Aw9K3RVBoc5XL58=;
 b=aTO66WcaO2ZLlVvq4JDA5p7yBXNrVyPdJrvbmt8f1NmePrda1TZXKMnUGiPwksOeCIN6Mg
 vRbjDw3fGufGRD0m0wamyD9P3iHs6hbqX6DFb42jNk5P+9vM/mgNz54av+PUiTMYDx45ql
 BaZOzUiwYm30b6TKtRmXYwskRo1PlK2aLNepYRnBsJIvwsUjIMSwjR1nGg9ZcGRlvTf4Q9
 jLi09rrT159NORZkYK0t7nYTYB8mk3K6ZdpYTZ6IKSdlwfZxScZMMyHdsyxlKo64ohQi9w
 3Emlc0Ons27WINVJ84jbP0Ggms9gI3qFKnLLbhl1cur2ML5lW7gtWObEmdjoOA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767562671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yBAOLlPWvQKPDIs4oNpFowTmGYJ0Aw9K3RVBoc5XL58=;
 b=J7f/WaJSMmCS7cVrcvcidcItnK33nQnmhVlAADhOZQqBIZRH0/eqO7D2YENp/nhze4d5pg
 psXihdu0bDo7yo+bFJ93PJ7p/8sSKeEEYDVI1gDBkPm49iU3R1CUIT1avj1MyHOMdqbznd
 S+TcPjTsEs7e3Sjr8YIC8AJxirB5mhus6nW6TtocPS/CiSpX8PfekDbsibRDXkm3cvUaft
 qB2zdqlICAmaLWSsZuTmL8oNq5CpuuwQvDhqhYcJ8Foj7ol/8/if5B8Wt48YNcSEjebkwC
 F8fTROEtStEI9AyCgUI+HOFTXJICLbQBjAiff+ng2N+lJriN4EBahKrEpCrG2w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v3] drm/imx: dc-plane: Add more RGB swizzling options
Date: Sun,  4 Jan 2026 22:37:29 +0100
Message-ID: <20260104213743.129012-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: iyjq8igyayzh8csskzzn8sx7t147bmuk
X-MBO-RS-ID: 8419a03abb6d8fa209e
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

Add additional buffer format swizzling options beyond XR24, the
hardware is capable of sampling other formats, fill them in.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: - Adjust commit subject
    - Drop the alpha formats for now, add RGB888/BGR888 to dc_plane_formats[]
V3: - Drop even more formats for now, because they do not work with
      prefetch engine, which seems currently unimplemented.
---
 drivers/gpu/drm/imx/dc/dc-fu.c    | 16 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 1d8f74babef8a..8a2c1c2a54d2c 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -65,6 +65,22 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
 		DRM_FORMAT_XRGB8888,
 		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
 		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_XBGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB565,
+		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
+		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
 	},
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index e40d5d66c5c1f..2f009a5a1fb3c 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -33,6 +33,10 @@ do {									\
 
 static const uint32_t dc_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
 };
 
 static const struct drm_plane_funcs dc_plane_funcs = {
-- 
2.51.0

