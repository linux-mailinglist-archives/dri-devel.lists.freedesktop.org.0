Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04137CDA64F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 20:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3023B10E133;
	Tue, 23 Dec 2025 19:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="keKOzdTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FE310E133
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766519191;
 bh=AspixI/Zehlvp8aaMQOtqUnGyuNV8eKlnuQrhHE2EB8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=keKOzdTCO3rnHak+ZHukTtXHNIjGooF9SNvH+vphysxH+cFAIRRgGFPDj2fMJ02xO
 nLxB3CI7hhElaV6KQmkDwcxmBr+o+/eGRW724DXvU6SQfYOkhcy8Y9yq1u3WKy+ZBH
 tfzE5zUq031jwhz3x6c5YvfeuXIBwXO4Xj+R6kFY6PrartjuHm73ZFQsk166iXPPbk
 Q2GUoZGRXTS2w5E35HokGmxxoZQX7ezLmmST/f66P5pKE/9U2aO/c/12+anZ2TozmK
 cLXmhJJivqqONZc4h48QVwd4oYk62pLwJyaZyapqUqIzZeAkySH/20728xc0yntoyf
 lCCIjXdDBaHcQ==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A304117E10DC;
 Tue, 23 Dec 2025 20:46:26 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:42 -0300
Subject: [PATCH 01/11] drm/mediatek: Introduce DDP plane_colorops_init() hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-1-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

Introduce a plane_colorops_init() hook to allow DDP components to define
how to initialize the color pipeline on their planes.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 99bf1e1015da..3a7393b7f4c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -13,6 +13,7 @@
 #include <linux/soc/mediatek/mtk-mutex.h>
 
 #include <drm/drm_modes.h>
+#include <drm/drm_plane.h>
 
 struct device;
 struct device_node;
@@ -86,6 +87,7 @@ struct mtk_ddp_comp_funcs {
 	const u32 *(*get_formats)(struct device *dev);
 	size_t (*get_num_formats)(struct device *dev);
 	bool (*is_afbc_supported)(struct device *dev);
+	int (*plane_colorops_init)(struct device *dev, struct drm_plane *plane);
 	void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);

-- 
2.51.0

