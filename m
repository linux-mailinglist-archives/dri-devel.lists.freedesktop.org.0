Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EA4AE9AB4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 12:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D829F10E895;
	Thu, 26 Jun 2025 10:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l2GmHgjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C50E10E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 10:05:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E46685C667D;
 Thu, 26 Jun 2025 10:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A81C4CEEF;
 Thu, 26 Jun 2025 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750932311;
 bh=3k4h3hHEk7NoxoOrxbmYWfStsX8RNDzQCxVAQ8vhmp4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=l2GmHgjnAsJeXxSAfGAU6kLeVg9VNE7t4zaaxjBpQh7L4YbnwXYPSCXXCtuhCPba6
 i7ys+XBB/zN4hpe+Q/4O47xHVsC0viNL2iPaVMOM4H76x5vFaKQnWUWKgxEaVWTEye
 dP0CdnIzCs4GJBROUdYqJAJkQPWJFZRfkdfTEcP2Lzc5KyJbKPigYqzys+wrhOcGog
 qAFDN0bSR+ryZ51U11qMrSoPdcqgNyLGhHswT8LO+vHq0E4DpyaCudc6nx9oTtJJnA
 xa68nMlIaJPZN0GUFPNdM3OLb4hP7KTQRpMBwW4gMs08SvPKG5jgdKjzJUyIOw7eS0
 xxHn3pX+U5AzQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 26 Jun 2025 12:04:59 +0200
Subject: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3k4h3hHEk7NoxoOrxbmYWfStsX8RNDzQCxVAQ8vhmp4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmx0gHZ6o8/Je6+fHa2yrtogwvnrhzKfL07aUf7iY9/z
 s5e+/vhj46pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkfIQxvqMTReXn9SQ8LAW
 3MhdWLXFVvT+WgbP5Adqlz/v/9tZ+vFSeIsLT+T3lCaHSmXLx0VruBgbOnb4f/KvznzL//gVz97
 2yRkvfh0LuiwqL8K57UKNg1azSVK4klSNurbwlycNUtz334QDAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

This will be especially useful for generic panels (like panel-simple)
which can take different code path depending on if they are MIPI-DSI
devices or platform devices.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 3 ++-
 include/drm/drm_mipi_dsi.h     | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index e5184a0c24651756ee0b1eb27d94083d63eb35a7..21fd647f8ce1a6a862e2f8fb5320e701f26f614f 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -89,16 +89,17 @@ static const struct dev_pm_ops mipi_dsi_device_pm_ops = {
 	.thaw = pm_generic_thaw,
 	.poweroff = pm_generic_poweroff,
 	.restore = pm_generic_restore,
 };
 
-static const struct bus_type mipi_dsi_bus_type = {
+const struct bus_type mipi_dsi_bus_type = {
 	.name = "mipi-dsi",
 	.match = mipi_dsi_device_match,
 	.uevent = mipi_dsi_uevent,
 	.pm = &mipi_dsi_device_pm_ops,
 };
+EXPORT_SYMBOL_GPL(mipi_dsi_bus_type);
 
 /**
  * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
  *    device tree node
  * @np: device tree node
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..6d2c08e8110151a97620389197f1ef79c058329d 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -221,10 +221,13 @@ struct mipi_dsi_multi_context {
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
 
 #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
 
+extern const struct bus_type mipi_dsi_bus_type;
+#define dev_is_mipi_dsi(dev)	((dev)->bus == &mipi_dsi_bus_type)
+
 /**
  * mipi_dsi_pixel_format_to_bpp - obtain the number of bits per pixel for any
  *                                given pixel format defined by the MIPI DSI
  *                                specification
  * @fmt: MIPI DSI pixel format

-- 
2.49.0

