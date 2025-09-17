Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88599B802F0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E165910E865;
	Wed, 17 Sep 2025 14:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ir0hhq5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FEC10E1CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ACE0E41AB7;
 Wed, 17 Sep 2025 14:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35431C4CEE7;
 Wed, 17 Sep 2025 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120388;
 bh=UiS9eGDzLJAdk4nBDkEEBCWb+nak6KQQAsDK1lE1TsA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ir0hhq5dRUO8Bi2Sdfh+t7eKKEyyj/y70oWHcgghE9Z7Fra67mdY9UL6TyzkHFt2G
 3yH2HnGRSUMJ+WG1vKTEJELBFQwJyfOrrp5E5zse87EojFrD9GE10GuTS3Lq/o5vo+
 t7glly4FfWAy33pI+7TbFU4zo/x6PjMo89oTc35mhPSnOF3jTLVw0syFllVOA9yjhv
 NZqgbH6ktg4SCTWGs+ZCEi19rutfHhfSJHxzjoAbLg0fim5ZiZvyPYg4UjgPZmOIds
 3/VePsbnnmTCgGmoWmFgrtijrTa7hnkOuaqEQ8G7IjDR+V3I+eDdHC/+tnEiplX/qy
 NfG8CNj3rQl5g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:47 +0200
Subject: [PATCH v4 06/39] drm/vkms: Convert vkms_crtc_atomic_check() to use
 new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-6-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UiS9eGDzLJAdk4nBDkEEBCWb+nak6KQQAsDK1lE1TsA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5q+Ghy9b2I18GXy7PeHAvIvZTY96C2KuJEQtCEa
 r5VuzeEdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJrLvI2HDz+J4j/6Zou5em
 adkqXP71bf2fGVl5jdNv39dvi2K73hu05rh10ePV3z/LOKQGCHhtjmWsr5FJSdbw0V40x1Xrl5O
 LG9uLlbubP62V8VzO4R1kHiN8n++daIaeprTWnH7OfY8F9zYBAA==
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

The vkms_crtc_atomic_check() function calls the deprecated
drm_atomic_get_existing_plane_state() helper for its internal mode
checking logic.

During atomic_check, the existing state is the new state and
drm_atomic_get_existing_plane_state() can thus be replaced by
drm_atomic_get_new_plane_state().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9510252e1f198b00e28bcc7987620..48237f32ac3b8f78b1495e8fbcc630be863ec7e4 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -183,11 +183,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	ret = drm_atomic_add_affected_planes(crtc_state->state, crtc);
 	if (ret < 0)
 		return ret;
 
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
 		if (!plane_state->visible)
 			continue;
 
@@ -199,11 +199,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
 	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
 		vkms_state->active_planes[i++] =

-- 
2.50.1

