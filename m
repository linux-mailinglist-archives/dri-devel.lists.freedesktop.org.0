Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF92B826A5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1039F10E5C2;
	Thu, 18 Sep 2025 00:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mu48ew3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E614010E5C3;
 Thu, 18 Sep 2025 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156289;
 bh=wN/Y3+uhPOPTYnZ+MKX1igI1SlXFFgW5cU2DrgN+pT8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mu48ew3SbUxjspIiN/XBMmjzibf8zkbqhf/CEoTkObxJX2V66hVLBsTm1PqBVZ+ci
 mhEjiwMW6BLzmYJvpMJMDcjv+DjL46YX7B7O5s2zIcYYCyIzBzpoN8oyxZ/nmfQUas
 ODEZRMcr/oItClvW5VWnRMxJ896SxqfGTfgmEUMoTs2jVzwWEOIPAPyNxFGGDpsRo2
 ZHg1j0LvC43PEmGKmCRKdOk2vS5EHw6DetwCjrLHgDFGHPE3TBiSCLXh4fGvBIKdxd
 WxBH0peLuqgxHSo1VKmnm7QV2YHUVRKDMA0Ed4Fn9M2PXy80hQirsUiz3/DO9UZor7
 Eza66KRKx2VPQ==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D864C17E1067;
 Thu, 18 Sep 2025 02:44:41 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:21 -0400
Subject: [PATCH RFC v2 12/20] drm/crtc: Track post-blend color pipeline
 client cap in drm_crtc_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-12-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
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

Some drivers, like VKMS, only have access to the drm_crtc_state but not
the drm_atomic_state during composition of the output framebuffer. Store
the state of the post-blend color pipeline client cap in the
drm_crtc_state so those drivers can decide whether to look at the color
pipeline or the legacy properties for the color management settings to
apply.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 include/drm/drm_crtc.h       | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6982c978dc530b838353ace60f748660c3b4524d..bbfa35c800240722785a6db440eb3d47ef9c8ed6 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -386,6 +386,7 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	state->crtcs[index].new_state = crtc_state;
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
+	crtc_state->color_pipeline_enabled = state->post_blend_color_pipeline;
 
 	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
 		       crtc->base.id, crtc->name, crtc_state, state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index df03637ca25abd45e96b5944229297f776fd046d..cb9eda6335e0d6728d99d67cc6916ad2d0e1d94e 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -282,6 +282,14 @@ struct drm_crtc_state {
 	 */
 	struct drm_colorop *color_pipeline;
 
+	/**
+	 * @color_pipeline_enabled:
+	 *
+	 * Whether color management should be done based on the &color_pipeline
+	 * or the legacy color properties (&ctm, &gamma_lut and &degamma_lut).
+	 */
+	bool color_pipeline_enabled;
+
 	/**
 	 * @target_vblank:
 	 *

-- 
2.50.1

