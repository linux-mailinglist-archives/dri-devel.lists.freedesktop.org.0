Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2948CDA369
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6D10E1BC;
	Tue, 23 Dec 2025 18:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="JRy2l6R5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6478410E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512981; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IspqoohT9QA0xwJTnqKfkEAyn9tUyson0B8roQJ8s+qjCgMnH0djbKuRtOKCzTpCFSSroE+eOd3Tpm84Fi9DUEn4OPtOiTDIFnIcdeljzuC6A5Xk6RqL71ByJrHxqDkqe9jtJx3etQKCdrYNaNunXmNP90Nc2qR8JnnXjpCd3W8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512981;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8Pk1bOdW4DywWabgxSmZe43EDBa8FOVNt1pDyMGplsA=; 
 b=BDY1RP7URYMSQe/9S4a3hW7wNY44DNikIXZzECUJadZTMUTCXaSRY59iCVvwiCalmzTu8/WrftKY93OuVeX+K2nEp+Sh6mdNG8nY3XlQvt1epVnIvNlWLVQMTeHsRUz37rOEh/QKDmyFK7h4LuJaXMoGK+4iAoUANh0AK1gcde0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512980; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=8Pk1bOdW4DywWabgxSmZe43EDBa8FOVNt1pDyMGplsA=;
 b=JRy2l6R5GGvx9HTc2uRjX2cFIaGCFAVbQo7R3n79V2pZjad7AVE8RwqpNKHUPGyi
 hrJJwmJzIEhKQafLjMrLG8q1pl2SFAsRvoG9rTxYgEvJUX0Phcyc5AHHyPoR3xm6FOm
 2SfZ4BOfGjXVSQC4JBLGrcD4hNA7pzmtAsw78cZ8=
Received: by mx.zohomail.com with SMTPS id 1766512978817141.00038080090178;
 Tue, 23 Dec 2025 10:02:58 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:31 -0300
Subject: [PATCH v3 11/21] drm/crtc: Track crtc color pipeline client cap in
 drm_crtc_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-11-7d969f9a37a0@collabora.com>
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
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1933;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=3y10C5Mwu/sdD+b5xMD3KEubR/Wzf/qSO2/9lBdGz3o=;
 b=piU06VW6Rl48awo5uv5SX1zI/5YEPFJ0cxQgVVOvlt363GPtteLDdhpnFWzhcfHHyT2tMBw/R
 Fdx9od8x/GCCd4jiMR2k26flrfj50B4XPqKt4UT8SfifTpfvA+OzH3d
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

Some drivers, like VKMS, only have access to the drm_crtc_state but not
the drm_atomic_state during composition of the output framebuffer. Store
the state of the CRTC (post-blend) color pipeline client cap in the
drm_crtc_state so those drivers can decide whether to look at the color
pipeline or the legacy properties for the color management settings to
apply.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 include/drm/drm_crtc.h       | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index aa4aa2f589b3d..f2028e6cdd62f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -389,6 +389,7 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	state->crtcs[index].new_state = crtc_state;
 	state->crtcs[index].ptr = crtc;
 	crtc_state->state = state;
+	crtc_state->color_pipeline_enabled = state->crtc_color_pipeline;
 
 	drm_dbg_atomic(state->dev, "Added [CRTC:%d:%s] %p state to %p\n",
 		       crtc->base.id, crtc->name, crtc_state, state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index b3c9818715851..888a3a5aa3a27 100644
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
2.51.0

