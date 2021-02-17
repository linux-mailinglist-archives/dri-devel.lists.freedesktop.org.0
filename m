Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4731D97F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 13:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B616E507;
	Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1856E516
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSk/xL7EZthSpvhvNvoe+gAjFs1Au8uiuMqH4NPOkSU=;
 b=HSQVIl8DxmbTfY78lyRmSHGXdeXJRwo2M0yLDM7oeh0KpN3Ts7W9YkhIMx7omkSxuN1Ni6
 S1UjPJgdxO27wl/fsdNy4JFKo9R5iNoZb0yMGmaUDp1kD5I2Z9g3g12Hrp+WoISnEdI9YT
 1HkINMW5CAKLGEBdFMMj14dAU+hzohs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-RmAzezYNNQ6abkCcOMO3jw-1; Wed, 17 Feb 2021 07:32:21 -0500
X-MC-Unique: RmAzezYNNQ6abkCcOMO3jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71EB6874982;
 Wed, 17 Feb 2021 12:32:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 026135D746;
 Wed, 17 Feb 2021 12:32:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EAD818003BE; Wed, 17 Feb 2021 13:32:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/11] drm/qxl: rework cursor plane
Date: Wed, 17 Feb 2021 13:32:12 +0100
Message-Id: <20210217123213.2199186-11-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-1-kraxel@redhat.com>
References: <20210217123213.2199186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper functions to create and move the cursor.
Create the cursor_bo in prepare_fb callback, in the
atomic_commit callback we only send the update command
to the host.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 248 ++++++++++++++++--------------
 1 file changed, 133 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index b315d7484e21..4a3d272e8d6c 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -476,12 +476,11 @@ static int qxl_primary_atomic_check(struct drm_plane *plane,
 	return qxl_check_framebuffer(qdev, bo);
 }
 
-static int qxl_primary_apply_cursor(struct drm_plane *plane)
+static int qxl_primary_apply_cursor(struct qxl_device *qdev,
+				    struct drm_plane_state *plane_state)
 {
-	struct drm_device *dev = plane->dev;
-	struct qxl_device *qdev = to_qxl(dev);
-	struct drm_framebuffer *fb = plane->state->fb;
-	struct qxl_crtc *qcrtc = to_qxl_crtc(plane->state->crtc);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
 	struct qxl_cursor_cmd *cmd;
 	struct qxl_release *release;
 	int ret = 0;
@@ -505,8 +504,8 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_SET;
-	cmd->u.set.position.x = plane->state->crtc_x + fb->hot_x;
-	cmd->u.set.position.y = plane->state->crtc_y + fb->hot_y;
+	cmd->u.set.position.x = plane_state->crtc_x + fb->hot_x;
+	cmd->u.set.position.y = plane_state->crtc_y + fb->hot_y;
 
 	cmd->u.set.shape = qxl_bo_physical_address(qdev, qcrtc->cursor_bo, 0);
 
@@ -523,6 +522,113 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 	return ret;
 }
 
+static int qxl_primary_move_cursor(struct qxl_device *qdev,
+				   struct drm_plane_state *plane_state)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
+	struct qxl_cursor_cmd *cmd;
+	struct qxl_release *release;
+	int ret = 0;
+
+	if (!qcrtc->cursor_bo)
+		return 0;
+
+	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
+					 QXL_RELEASE_CURSOR_CMD,
+					 &release, NULL);
+	if (ret)
+		return ret;
+
+	ret = qxl_release_reserve_list(release, true);
+	if (ret) {
+		qxl_release_free(qdev, release);
+		return ret;
+	}
+
+	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
+	cmd->type = QXL_CURSOR_MOVE;
+	cmd->u.position.x = plane_state->crtc_x + fb->hot_x;
+	cmd->u.position.y = plane_state->crtc_y + fb->hot_y;
+	qxl_release_unmap(qdev, release, &cmd->release_info);
+
+	qxl_release_fence_buffer_objects(release);
+	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
+	return ret;
+}
+
+static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
+					struct qxl_bo *user_bo,
+					int hot_x, int hot_y)
+{
+	static const u32 size = 64 * 64 * 4;
+	struct qxl_bo *cursor_bo;
+	struct dma_buf_map cursor_map;
+	struct dma_buf_map user_map;
+	struct qxl_cursor cursor;
+	int ret;
+
+	if (!user_bo)
+		return NULL;
+
+	ret = qxl_bo_create(qdev, sizeof(struct qxl_cursor) + size,
+			    false, true, QXL_GEM_DOMAIN_VRAM, 1,
+			    NULL, &cursor_bo);
+	if (ret)
+		goto err;
+
+	ret = qxl_bo_vmap(cursor_bo, &cursor_map);
+	if (ret)
+		goto err_unref;
+
+	ret = qxl_bo_vmap(user_bo, &user_map);
+	if (ret)
+		goto err_unmap;
+
+	cursor.header.unique = 0;
+	cursor.header.type = SPICE_CURSOR_TYPE_ALPHA;
+	cursor.header.width = 64;
+	cursor.header.height = 64;
+	cursor.header.hot_spot_x = hot_x;
+	cursor.header.hot_spot_y = hot_y;
+	cursor.data_size = size;
+	cursor.chunk.next_chunk = 0;
+	cursor.chunk.prev_chunk = 0;
+	cursor.chunk.data_size = size;
+	if (cursor_map.is_iomem) {
+		memcpy_toio(cursor_map.vaddr_iomem,
+			    &cursor, sizeof(cursor));
+		memcpy_toio(cursor_map.vaddr_iomem + sizeof(cursor),
+			    user_map.vaddr, size);
+	} else {
+		memcpy(cursor_map.vaddr,
+		       &cursor, sizeof(cursor));
+		memcpy(cursor_map.vaddr + sizeof(cursor),
+		       user_map.vaddr, size);
+	}
+
+	qxl_bo_vunmap(user_bo);
+	qxl_bo_vunmap(cursor_bo);
+	return cursor_bo;
+
+err_unmap:
+	qxl_bo_vunmap(cursor_bo);
+err_unref:
+	qxl_bo_unpin(cursor_bo);
+	qxl_bo_unref(&cursor_bo);
+err:
+	return NULL;
+}
+
+static void qxl_free_cursor(struct qxl_bo *cursor_bo)
+{
+	if (!cursor_bo)
+		return;
+
+	qxl_bo_unpin(cursor_bo);
+	qxl_bo_unref(&cursor_bo);
+}
+
 static void qxl_primary_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
@@ -543,7 +649,7 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 		if (qdev->primary_bo)
 			qxl_io_destroy_primary(qdev);
 		qxl_io_create_primary(qdev, primary);
-		qxl_primary_apply_cursor(plane);
+		qxl_primary_apply_cursor(qdev, plane->state);
 	}
 
 	if (bo->is_dumb)
@@ -574,124 +680,21 @@ static void qxl_primary_atomic_disable(struct drm_plane *plane,
 static void qxl_cursor_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct drm_device *dev = plane->dev;
-	struct qxl_device *qdev = to_qxl(dev);
+	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct qxl_crtc *qcrtc = to_qxl_crtc(plane->state->crtc);
-	struct qxl_release *release;
-	struct qxl_cursor_cmd *cmd;
-	struct qxl_cursor *cursor;
-	struct drm_gem_object *obj;
-	struct qxl_bo *cursor_bo = NULL, *user_bo = NULL, *old_cursor_bo = NULL;
-	int ret;
-	struct dma_buf_map user_map;
-	struct dma_buf_map cursor_map;
-	void *user_ptr;
-	int size = 64*64*4;
-
-	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
-					 QXL_RELEASE_CURSOR_CMD,
-					 &release, NULL);
-	if (ret)
-		return;
 
 	if (fb != old_state->fb) {
-		obj = fb->obj[0];
-		user_bo = gem_to_qxl_bo(obj);
-
-		/* pinning is done in the prepare/cleanup framevbuffer */
-		ret = qxl_bo_vmap_locked(user_bo, &user_map);
-		if (ret)
-			goto out_free_release;
-		user_ptr = user_map.vaddr; /* TODO: Use mapping abstraction properly */
-
-		ret = qxl_alloc_bo_reserved(qdev, release,
-					    sizeof(struct qxl_cursor) + size,
-					    &cursor_bo);
-		if (ret)
-			goto out_kunmap;
-
-		ret = qxl_bo_pin(cursor_bo);
-		if (ret)
-			goto out_free_bo;
-
-		ret = qxl_release_reserve_list(release, true);
-		if (ret)
-			goto out_unpin;
-
-		ret = qxl_bo_vmap_locked(cursor_bo, &cursor_map);
-		if (ret)
-			goto out_backoff;
-		if (cursor_map.is_iomem) /* TODO: Use mapping abstraction properly */
-			cursor = (struct qxl_cursor __force *)cursor_map.vaddr_iomem;
-		else
-			cursor = (struct qxl_cursor *)cursor_map.vaddr;
-
-		cursor->header.unique = 0;
-		cursor->header.type = SPICE_CURSOR_TYPE_ALPHA;
-		cursor->header.width = 64;
-		cursor->header.height = 64;
-		cursor->header.hot_spot_x = fb->hot_x;
-		cursor->header.hot_spot_y = fb->hot_y;
-		cursor->data_size = size;
-		cursor->chunk.next_chunk = 0;
-		cursor->chunk.prev_chunk = 0;
-		cursor->chunk.data_size = size;
-		memcpy(cursor->chunk.data, user_ptr, size);
-		qxl_bo_vunmap_locked(cursor_bo);
-		qxl_bo_vunmap_locked(user_bo);
-
-		cmd = (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
-		cmd->u.set.visible = 1;
-		cmd->u.set.shape = qxl_bo_physical_address(qdev,
-							   cursor_bo, 0);
-		cmd->type = QXL_CURSOR_SET;
-
-		old_cursor_bo = qcrtc->cursor_bo;
-		qcrtc->cursor_bo = cursor_bo;
-		cursor_bo = NULL;
+		qxl_primary_apply_cursor(qdev, plane->state);
 	} else {
-
-		ret = qxl_release_reserve_list(release, true);
-		if (ret)
-			goto out_free_release;
-
-		cmd = (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
-		cmd->type = QXL_CURSOR_MOVE;
+		qxl_primary_move_cursor(qdev, plane->state);
 	}
-
-	cmd->u.position.x = plane->state->crtc_x + fb->hot_x;
-	cmd->u.position.y = plane->state->crtc_y + fb->hot_y;
-
-	qxl_release_unmap(qdev, release, &cmd->release_info);
-	qxl_release_fence_buffer_objects(release);
-	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
-
-	if (old_cursor_bo != NULL)
-		qxl_bo_unpin(old_cursor_bo);
-	qxl_bo_unref(&old_cursor_bo);
-	qxl_bo_unref(&cursor_bo);
-
-	return;
-
-out_backoff:
-	qxl_release_backoff_reserve_list(release);
-out_unpin:
-	qxl_bo_unpin(cursor_bo);
-out_free_bo:
-	qxl_bo_unref(&cursor_bo);
-out_kunmap:
-	qxl_bo_vunmap_locked(user_bo);
-out_free_release:
-	qxl_release_free(qdev, release);
-	return;
-
 }
 
 static void qxl_cursor_atomic_disable(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
 	struct qxl_device *qdev = to_qxl(plane->dev);
+	struct qxl_crtc *qcrtc;
 	struct qxl_release *release;
 	struct qxl_cursor_cmd *cmd;
 	int ret;
@@ -714,6 +717,10 @@ static void qxl_cursor_atomic_disable(struct drm_plane *plane,
 
 	qxl_release_fence_buffer_objects(release);
 	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
+
+	qcrtc = to_qxl_crtc(old_state->crtc);
+	qxl_free_cursor(qcrtc->cursor_bo);
+	qcrtc->cursor_bo = NULL;
 }
 
 static void qxl_update_dumb_head(struct qxl_device *qdev,
@@ -822,6 +829,17 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		qxl_prepare_shadow(qdev, user_bo, new_state->crtc->index);
 	}
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR &&
+	    plane->state->fb != new_state->fb) {
+		struct qxl_crtc *qcrtc = to_qxl_crtc(new_state->crtc);
+		struct qxl_bo *old_cursor_bo = qcrtc->cursor_bo;
+
+		qcrtc->cursor_bo = qxl_create_cursor(qdev, user_bo,
+						     new_state->fb->hot_x,
+						     new_state->fb->hot_y);
+		qxl_free_cursor(old_cursor_bo);
+	}
+
 	return qxl_bo_pin(user_bo);
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
