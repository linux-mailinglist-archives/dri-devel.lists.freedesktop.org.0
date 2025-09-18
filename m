Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26985B826C6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEE410E5CE;
	Thu, 18 Sep 2025 00:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gMnWRuD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFA710E5CE;
 Thu, 18 Sep 2025 00:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758156334;
 bh=63UDJCYYZKejAD7rK2QDvVeqxIbIk1HH1HrY2XmPNcY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gMnWRuD1d7y9DpYWtVcKimU7+BVJRWJcbw0dTD7po+g0dP72VKp94T1tb4BJsX0TO
 9lbZBqZKrFzfVK1g+nTfEw0l7aWzHtbFvViS6jYG1O1KCYyzKE11qp5MpOwSvMo3Gi
 1rwLkXcU4PJ4FdUFNf6CpJdxNKK0al9RiUciQe4J3r50qM6eJTXxVbE+jL3Sb7pGnl
 oCdMnWBVl3XsFgBDj1VssPOZjHYwhBI3VQ0TlX9bGtEx/ySw1og6NR/hN3oTcqSauY
 NPYeERo7HpawHISGmsgH0kosefSYvZiQyQK+pwqZEejdWN2gQWXCmQHdpzjzlX0nd+
 340M0jWplCqhw==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE29617E13B2;
 Thu, 18 Sep 2025 02:45:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:27 -0400
Subject: [PATCH RFC v2 18/20] drm/vkms: Prepare pre_blend_color_transform()
 for post-blend pipelines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-18-ac4471b44758@collabora.com>
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

As a preparatory step for supporting post-blend color pipelines in VKMS,
rename pre_blend_color_transform() to color_transform() and make it take
the first colorop instead of a plane state, so it can be shared by both
pre- and post-blend color pipeline code paths.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 31b1dd3cd115d930ec3ed498403a8f44208d76c3..05e1551d6330e4dc14563d3a399b3544d11c6576 100644
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
2.50.1

