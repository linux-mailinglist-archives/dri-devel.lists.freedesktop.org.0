Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AFACDA393
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEC910E296;
	Tue, 23 Dec 2025 18:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Qbk+23qM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5EE10E296
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:04:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766513031; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FGYMIv+8hZa7APrP0bOd0SusxTkYCHS7vEYFJHODba2MQPfJCdXmUY6YSoV07dUpkF0z34OG7B3t5peTZN6jeDjB6RqOz7A2ak3P9BotUrJDbwo5l0NVAMhP0YXWCSWV5dslcXCOgdeLUkO3GiIDiQsERt9tPuaCzKmSF7twHSc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766513031;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=k2RViIOf1NDXJJjjKL7ku9QH0OD3nAXqCQx4hTpQYPM=; 
 b=AWTaAZQd5wgV7q8i9oxzyPMA/NFxt48Z+JO9YAwF0zpTKA9lWdSZngFDkQntraLb5ThTFJGxsiaZfX4IgP8Ouizpih1/OOx7YPoFlpU+xXnufq1rx/VPqOoQdqzq4fsXrAugyqmgTxPN6Biqrw0nfqsT0qyvT8it1aA/ixEyTBg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513031; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=k2RViIOf1NDXJJjjKL7ku9QH0OD3nAXqCQx4hTpQYPM=;
 b=Qbk+23qMnfc9xSFlAdeTFcxkQO9fnfU6dtTHQhM8dJBDgj/1/BBPUXaqqNqZWl6L
 iJqokX5NoM+4MOv/POHPmSmxBrQ2MiojuCB8jAOzUy7l09MOFkv4iHaK2tc1qC77h/D
 cvPKO4kP9rfvuwPFBMiauyme8hDx8DUN2yc3De5M=
Received: by mx.zohomail.com with SMTPS id 1766513029906390.94658883584054;
 Tue, 23 Dec 2025 10:03:49 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:39 -0300
Subject: [PATCH v3 19/21] drm/vkms: Prepare pre_blend_color_transform() for
 CRTC color pipelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-19-7d969f9a37a0@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1957;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=wsJbatjTPlzhi3WptySwhme0VyzXx04ZS+jdYLuA3I8=;
 b=MY1vFPnWjOA/GH8i8igHj4gI1U4rI4Fhfinif6+7eYhNEFMIhvet9acPb/YojlKVZPVJLm4lT
 du4sY3O+g54AWvfoib+fj+3NLFIGUHdBOol2UXFyJq9UmKRZJXU4vL5
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

As a preparatory step for supporting CRTC (post-blend) color pipelines
in VKMS, rename pre_blend_color_transform() to color_transform() and
make it take the first colorop instead of a plane state, so it can be
shared by both plane (pre-blend) and CRTC (post-blend) color pipeline
code paths.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3cf3f26e0d8ea..d4f87a2aa3359 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -189,13 +189,13 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 	}
 }
 
-static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
-				      struct line_buffer *output_buffer)
+static void color_transform(struct drm_colorop *first_colorop,
+			    struct line_buffer *output_buffer)
 {
 	struct pixel_argb_s32 pixel;
 
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
-		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
+		struct drm_colorop *colorop = first_colorop;
 
 		/*
 		 * Some operations, such as applying a BT709 encoding matrix,
@@ -449,7 +449,7 @@ static void blend_line(struct vkms_plane_state *current_plane, int y,
 	 */
 	current_plane->pixel_read_line(current_plane, src_x_start, src_y_start, direction,
 				       pixel_count, &stage_buffer->pixels[dst_x_start]);
-	pre_blend_color_transform(current_plane, stage_buffer);
+	color_transform(current_plane->base.base.color_pipeline, stage_buffer);
 	pre_mul_alpha_blend(stage_buffer, output_buffer,
 			    dst_x_start, pixel_count);
 }

-- 
2.51.0

