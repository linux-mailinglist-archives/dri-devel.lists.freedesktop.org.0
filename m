Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81813758AFB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 03:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ED610E3E8;
	Wed, 19 Jul 2023 01:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786ED10E0BF;
 Wed, 19 Jul 2023 01:42:33 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1A6EB3262AC;
 Wed, 19 Jul 2023 02:42:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1689730952; bh=ou4v93o5IbhnDvyX59yaJIvEzzZ6ZSOJObGk4szmQsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SHnCm0crhjIAaCQkpBZUCJZN5FRehMLMeuMpkfkyny0Af5xQh5l0/t7RWIU9cezfu
 82+HrSTudkqTs2rZFcr5kneATZfllVWKqUxyPIztNrXourw+aL/Bk7kh0XBfFxw2wi
 Ml4X/tsDNXUBCmE+LTlW8NdP2mQd8noIx+x+EJK9c9qjByYHPVq/v4yJ3Dz5cL5s8k
 JhQDYlnXxXei09MbCoFJnicRkSVQfjDre4TqdAo/ocbPhnDR8C5TA6MoB6mrji2KQ7
 TmnBOJ0+aMtB28JVOIjW1CHy5jv6Wnu5w47vrPmRPhnDpiQ9abPKevVG1A5MDavTv6
 GmAvSwYiamMfA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/9] drm/qxl: Use the hotspot properties from cursor planes
Date: Tue, 18 Jul 2023 21:42:13 -0400
Message-Id: <20230719014218.1700057-5-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719014218.1700057-1-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: javierm@redhat.com, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, krastevm@vmware.com,
 ppaalanen@gmail.com, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, iforbes@vmware.com, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 6492a70e3c39..5d689e0d3586 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -485,7 +485,6 @@ static int qxl_primary_atomic_check(struct drm_plane *plane,
 static int qxl_primary_apply_cursor(struct qxl_device *qdev,
 				    struct drm_plane_state *plane_state)
 {
-	struct drm_framebuffer *fb = plane_state->fb;
 	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
 	struct qxl_cursor_cmd *cmd;
 	struct qxl_release *release;
@@ -510,8 +509,8 @@ static int qxl_primary_apply_cursor(struct qxl_device *qdev,
 
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_SET;
-	cmd->u.set.position.x = plane_state->crtc_x + fb->hot_x;
-	cmd->u.set.position.y = plane_state->crtc_y + fb->hot_y;
+	cmd->u.set.position.x = plane_state->crtc_x + plane_state->hotspot_x;
+	cmd->u.set.position.y = plane_state->crtc_y + plane_state->hotspot_y;
 
 	cmd->u.set.shape = qxl_bo_physical_address(qdev, qcrtc->cursor_bo, 0);
 
@@ -531,7 +530,6 @@ static int qxl_primary_apply_cursor(struct qxl_device *qdev,
 static int qxl_primary_move_cursor(struct qxl_device *qdev,
 				   struct drm_plane_state *plane_state)
 {
-	struct drm_framebuffer *fb = plane_state->fb;
 	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
 	struct qxl_cursor_cmd *cmd;
 	struct qxl_release *release;
@@ -554,8 +552,8 @@ static int qxl_primary_move_cursor(struct qxl_device *qdev,
 
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_MOVE;
-	cmd->u.position.x = plane_state->crtc_x + fb->hot_x;
-	cmd->u.position.y = plane_state->crtc_y + fb->hot_y;
+	cmd->u.position.x = plane_state->crtc_x + plane_state->hotspot_x;
+	cmd->u.position.y = plane_state->crtc_y + plane_state->hotspot_y;
 	qxl_release_unmap(qdev, release, &cmd->release_info);
 
 	qxl_release_fence_buffer_objects(release);
@@ -851,8 +849,8 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		struct qxl_bo *old_cursor_bo = qcrtc->cursor_bo;
 
 		qcrtc->cursor_bo = qxl_create_cursor(qdev, user_bo,
-						     new_state->fb->hot_x,
-						     new_state->fb->hot_y);
+						     new_state->hotspot_x,
+						     new_state->hotspot_y);
 		qxl_free_cursor(old_cursor_bo);
 	}
 
-- 
2.39.2

