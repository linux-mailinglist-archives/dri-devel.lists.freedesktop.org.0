Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571F73F314
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 05:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A307910E289;
	Tue, 27 Jun 2023 03:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1699610E283;
 Tue, 27 Jun 2023 03:58:51 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 53B50324993;
 Tue, 27 Jun 2023 04:58:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687838329; bh=wmTpj3WIOYtCyQHmLJ4VmvySAjaboBtb4VfkoxuVVq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rc8pGMF0p2wjIZnSOOAJwpd2wxPd0wMlYFtZIBfszWXfAX9IPkTPt0WEcWsosejZW
 oNr+j0Qyu6hwkVL9XqvHN3Vo4Hu+PF/jiO/OlR1ZtDfaAeSQuT8sHpC3jbypx45grH
 5VyO6vPeeQmAOauDMNbTyO/Xnmg+UIqd6/eoOGMHhr1OFgBqngDAJSGz/4/SgO9ODx
 uBCwgeYLaeTsbb+HB1GfhUsAdVCfmWRIxjCVPfE0dzKnvoUOsUvI5ZJf9jyLVyYntI
 eyE1Zw+kheEDaLGou6eu8Q0Txag6R56nTqBnoMboGxU3rcj+2Pr7TVAcK+UzENg153
 XL7c3UpqHkbCg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/8] drm/qxl: Use the hotspot properties from cursor planes
Date: Mon, 26 Jun 2023 23:58:35 -0400
Message-Id: <20230627035839.496399-5-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627035839.496399-1-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
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

