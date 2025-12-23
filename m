Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80ECDA354
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89C10E1A7;
	Tue, 23 Dec 2025 18:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="kSN//B67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C33910E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512954; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=euCcqtJpfgm86+21LV9sc46ZqYyxaVf+7jnkrGIAQgjdtK2DZNIejLZpckblv9IHqbkMGw4QFhAf5YKU17JjLCZmrVr4WbXRXpdBkqiW18YadLiP515z/KQBc681lpV+avcNTLB1Xl36f6iQnZwc+qZ9ft9pxYmJFX3ZrerAYvw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512954;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q1J+cnXklS0GGt9yd+2S+ustp9tZDyTJ4kC+BJLuVY8=; 
 b=VWCJp7CC+KbN4ifG0l9/ffZ+2NBXZvUnHa73C/PzJEAD/N6avc22mJjLOpOMQJ7blOsevIO1oX4swHUcpfXMTXp4xAdHJac05ZO6nmRccmVEggCrZ0cExf6ORxksJ5v0aWt4ngb9k9MAE/5HEOT5Smnj0WLI7DqYEXsQk+GQsxs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512954; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Q1J+cnXklS0GGt9yd+2S+ustp9tZDyTJ4kC+BJLuVY8=;
 b=kSN//B67z30nSRhVdMJQEz/BTBDJoTswcGRZUfiyfAmtDxk0IPXeukzuBf0BzTWL
 uAPnp/N9ra3aFOzknDcNQ3tBLj5ELRwyqMTvhkQUb3xuSKc6v8sCf1UtJYW16XfKDd3
 NqsaV2NrED477QwxEjjAUY5OVr60PHZ8Tb8imL2M=
Received: by mx.zohomail.com with SMTPS id 1766512953114807.0800549115687;
 Tue, 23 Dec 2025 10:02:33 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:27 -0300
Subject: [PATCH v3 07/21] drm/atomic: Pass crtc_color_pipeline client cap
 to atomic check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-7-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=2040;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=OLvyPmMpO/hEIyRYpfk8eZuodCPCUqC8Rb0bsFvEm94=;
 b=4H6IhsCQfRqK8BX7iIXNdEj6w6+09CG+Er4dh+OOTA/3D9Vx3gJyGM8tr+Ih4Q9RGfT7+El2s
 kAX/rbW99AYApYrR/BQNk1yreWlLmyZzdrNsxonhr8wQjtANryXObPu
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Pass the state of the CRTC (post-blend) color pipeline client cap to the
atomic state so that drivers can rely on it to enable color pipeline
functionality and ignore the deprecated color management CRTC
properties.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d1bc78b2567a9..03f5a80448d10 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1668,6 +1668,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;
+	state->crtc_color_pipeline = file_priv->crtc_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 74ce26fa8838b..7eb21c0426105 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -560,6 +560,26 @@ struct drm_atomic_state {
 	 */
 	bool plane_color_pipeline : 1;
 
+	/**
+	 * @crtc_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - GAMMA_LUT
+	 *  - DEGAMMA_LUT
+	 *  - GAMMA_LUT_SIZE
+	 *  - CTM
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool crtc_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *

-- 
2.51.0

