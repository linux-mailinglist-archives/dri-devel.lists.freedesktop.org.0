Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9B56C118
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 21:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C79E10E162;
	Fri,  8 Jul 2022 19:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1610E162
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 19:37:30 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 9tn4oHtmUEhCQ9tn4okZcQ; Fri, 08 Jul 2022 21:37:28 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 08 Jul 2022 21:37:28 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/vc4: Use the bitmap API to allocate bitmaps
Date: Fri,  8 Jul 2022 21:37:25 +0200
Message-Id: <fdc12cbbb573482ce5a4f344b3a31bc9b6ef2ec1.1657309035.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/vc4/vc4_validate_shaders.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index e315aeb5fef5..d074d2014be4 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -795,9 +795,8 @@ vc4_validate_shader(struct drm_gem_cma_object *shader_obj)
 
 	reset_validation_state(&validation_state);
 
-	validation_state.branch_targets =
-		kcalloc(BITS_TO_LONGS(validation_state.max_ip),
-			sizeof(unsigned long), GFP_KERNEL);
+	validation_state.branch_targets = bitmap_zalloc(validation_state.max_ip,
+							GFP_KERNEL);
 	if (!validation_state.branch_targets)
 		goto fail;
 
@@ -939,12 +938,12 @@ vc4_validate_shader(struct drm_gem_cma_object *shader_obj)
 		(validated_shader->uniforms_size +
 		 4 * validated_shader->num_texture_samples);
 
-	kfree(validation_state.branch_targets);
+	bitmap_free(validation_state.branch_targets);
 
 	return validated_shader;
 
 fail:
-	kfree(validation_state.branch_targets);
+	bitmap_free(validation_state.branch_targets);
 	if (validated_shader) {
 		kfree(validated_shader->uniform_addr_offsets);
 		kfree(validated_shader->texture_samples);
-- 
2.34.1

