Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A0CDA652
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 20:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E210E240;
	Tue, 23 Dec 2025 19:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CKwn8j98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE25E10E240
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766519197;
 bh=8FoqfaoY+0Hw91SrzejtYpeqb9eQRxsYLDoEUKDQmRg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CKwn8j98/eXjlM0Ifa8ou8K0lQ+DeRRMAJNQQnj6je8r9dTbq0u97I7W3mxqp3y+M
 zVK7oMG2LcmwDIKs/q3xadWc5f2FU53m5eilfZgdIQaHmKMgZdiYSPtuxoF2E2oBjG
 nbSGwJcsWlow9I/ycaxGanCQSOPMTWykXxEK/OvKr+74ZM5attCvrtm0sof8SiHCF/
 XIU0PeyjelILXKuTDxx9PPcl2H/7PZBqZ/rOJ3/5z1pBVmMHBtWBf1Dy1QGZ8Ujgbc
 N3osY6Tu5GlncJIENBAt736XKJyr6gdMTz355lSfHI0E9OoYaYGpSGK0rGfNmrZjMI
 PE11IV+cbA3+w==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AC1E17E12EB;
 Tue, 23 Dec 2025 20:46:32 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:43 -0300
Subject: [PATCH 02/11] drm/mediatek: Initialize colorops when creating
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-2-0cb99bd0ab33@collabora.com>
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

During initialization of a plane, if the DDP component supplying it
defines a plane_colorops_init() hook, call it to initialize the color
pipeline on the plane.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 22f255c3ddd3..f7db235d986f 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -985,8 +985,10 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 	int i, ret;
 
 	for (i = 0; i < num_planes; i++) {
+		struct drm_plane *plane = &mtk_crtc->planes[mtk_crtc->layer_nr];
+
 		ret = mtk_plane_init(drm_dev,
-				&mtk_crtc->planes[mtk_crtc->layer_nr],
+				plane,
 				BIT(pipe),
 				mtk_crtc_plane_type(mtk_crtc->layer_nr, num_planes),
 				mtk_ddp_comp_supported_rotations(comp),
@@ -997,6 +999,12 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 		if (ret)
 			return ret;
 
+		if (comp->funcs && comp->funcs->plane_colorops_init) {
+			ret = comp->funcs->plane_colorops_init(comp->dev, plane);
+			if (ret)
+				return ret;
+		}
+
 		mtk_crtc->layer_nr++;
 	}
 	return 0;

-- 
2.51.0

