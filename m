Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B11AEB50
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7D6EC79;
	Sat, 18 Apr 2020 09:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 510 seconds by postgrey-1.36 at gabe;
 Sat, 18 Apr 2020 06:48:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BC26E154
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 06:48:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.8])
 by lucky1.263xmail.com (Postfix) with ESMTP id 7F035AC422;
 Sat, 18 Apr 2020 14:39:23 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [61.183.83.60])
 by smtp.263.net (postfix) whith ESMTP id
 P7184T140143329433344S1587191962824534_; 
 Sat, 18 Apr 2020 14:39:23 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0c355390490829d06a03956be2b0c06f>
X-RL-SENDER: caizhaopeng@uniontech.com
X-SENDER: caizhaopeng@uniontech.com
X-LOGIN-NAME: caizhaopeng@uniontech.com
X-FST-TO: airlied@redhat.com
X-SENDER-IP: 61.183.83.60
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Caicai <caizhaopeng@uniontech.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH 1/1] drm/qxl: add mutex_lock/mutex_unlock to ensure the order
 in which resources are released.
Date: Sat, 18 Apr 2020 14:39:17 +0800
Message-Id: <20200418063917.26278-1-caizhaopeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Zhangshuang <zhangshuang@uniontech.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Zhangyueqian <zhangyueqian@uniontech.com>, Caicai <caizhaopeng@uniontech.com>,
 Zhangshiwen <zhangshiwen@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a qxl resource is released, the list that needs to be released is
fetched from the linked list ring and cleared. When you empty the list,
instead of trying to determine whether the ttm buffer object for each
qxl in the list is locked, you release the qxl object and remove the
element from the list until the list is empty. It was found that the
linked list was cleared first, and that the lock on the corresponding
ttm Bo for the QXL had not been released, so that the new qxl could not
be locked when it used the TTM. By adding an additional mutex to ensure
timing, qxl elements are not allowed to be removed from the list until
ttm Bo's lock is released

Signed-off-by: Caicai <caizhaopeng@uniontech.com>
---
 drivers/gpu/drm/qxl/qxl_cmd.c     | 12 +++++++++++-
 drivers/gpu/drm/qxl/qxl_display.c | 15 +++++++++++++++
 drivers/gpu/drm/qxl/qxl_draw.c    | 19 +++++++++++++++++++
 drivers/gpu/drm/qxl/qxl_drv.h     |  3 ++-
 drivers/gpu/drm/qxl/qxl_ioctl.c   |  3 +++
 drivers/gpu/drm/qxl/qxl_release.c |  2 ++
 6 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 208af9f37914..484405dae253 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -203,7 +203,9 @@ bool qxl_queue_garbage_collect(struct qxl_device *qdev, bool flush)
 	if (!qxl_check_idle(qdev->release_ring)) {
 		schedule_work(&qdev->gc_work);
 		if (flush)
-			flush_work(&qdev->gc_work);
+			//can't flush work, it may lead to deadlock
+			usleep_range(500, 1000);
+
 		return true;
 	}
 	return false;
@@ -241,7 +243,11 @@ int qxl_garbage_collect(struct qxl_device *qdev)
 			}
 			id = next_id;
 
+			mutex_lock(&release->async_release_mutex);
+
 			qxl_release_free(qdev, release);
+
+			mutex_unlock(&release->async_release_mutex);
 			++i;
 		}
 	}
@@ -475,6 +481,8 @@ int qxl_hw_surface_alloc(struct qxl_device *qdev,
 	if (ret)
 		return ret;
 
+	mutex_lock(&release->async_release_mutex);
+
 	cmd = (struct qxl_surface_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_SURFACE_CMD_CREATE;
 	cmd->flags = QXL_SURF_FLAG_KEEP_DATA;
@@ -503,6 +511,8 @@ int qxl_hw_surface_alloc(struct qxl_device *qdev,
 	qxl_push_command_ring_release(qdev, release, QXL_CMD_SURFACE, false);
 	qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
+
 	surf->hw_surf_alloc = true;
 	spin_lock(&qdev->surf_id_idr_lock);
 	idr_replace(&qdev->surf_id_idr, surf, surf->surface_id);
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 0570c6826bff..04bfb181a402 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -522,6 +522,8 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 	if (ret)
 		goto out_free_release;
 
+	mutex_lock(&release->async_release_mutex);
+
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_SET;
 	cmd->u.set.position.x = plane->state->crtc_x + fb->hot_x;
@@ -535,6 +537,8 @@ static int qxl_primary_apply_cursor(struct drm_plane *plane)
 	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
 	qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
+
 	return ret;
 
 out_free_release:
@@ -653,6 +657,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		if (ret)
 			goto out_free_bo;
 
+		mutex_lock(&release->async_release_mutex);
+
 		ret = qxl_bo_kmap(cursor_bo, (void **)&cursor);
 		if (ret)
 			goto out_backoff;
@@ -686,6 +692,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		if (ret)
 			goto out_free_release;
 
+		mutex_lock(&release->async_release_mutex);
+
 		cmd = (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
 		cmd->type = QXL_CURSOR_MOVE;
 	}
@@ -697,6 +705,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
 	qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
+
 	if (old_cursor_bo)
 		qxl_bo_unref(&old_cursor_bo);
 
@@ -706,6 +716,7 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 
 out_backoff:
 	qxl_release_backoff_reserve_list(release);
+	mutex_unlock(&release->async_release_mutex);
 out_free_bo:
 	qxl_bo_unref(&cursor_bo);
 out_kunmap:
@@ -736,12 +747,16 @@ static void qxl_cursor_atomic_disable(struct drm_plane *plane,
 		return;
 	}
 
+	mutex_lock(&release->async_release_mutex);
+
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_HIDE;
 	qxl_release_unmap(qdev, release, &cmd->release_info);
 
 	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
 	qxl_release_fence_buffer_objects(release);
+
+	mutex_unlock(&release->async_release_mutex);
 }
 
 static int qxl_plane_prepare_fb(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
index 4d8681e84e68..4dc24739c79c 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -192,6 +192,8 @@ void qxl_draw_opaque_fb(const struct qxl_fb_image *qxl_fb_image,
 	if (ret)
 		goto out_free_palette;
 
+	mutex_lock(&release->async_release_mutex);
+
 	rect.left = x;
 	rect.right = x + width;
 	rect.top = y;
@@ -200,6 +202,7 @@ void qxl_draw_opaque_fb(const struct qxl_fb_image *qxl_fb_image,
 	ret = make_drawable(qdev, 0, QXL_DRAW_COPY, &rect, release);
 	if (ret) {
 		qxl_release_backoff_reserve_list(release);
+		mutex_unlock(&release->async_release_mutex);
 		goto out_free_palette;
 	}
 
@@ -208,6 +211,7 @@ void qxl_draw_opaque_fb(const struct qxl_fb_image *qxl_fb_image,
 			     width, height, depth, stride);
 	if (ret) {
 		qxl_release_backoff_reserve_list(release);
+		mutex_unlock(&release->async_release_mutex);
 		qxl_release_free(qdev, release);
 		return;
 	}
@@ -244,6 +248,8 @@ void qxl_draw_opaque_fb(const struct qxl_fb_image *qxl_fb_image,
 	qxl_push_command_ring_release(qdev, release, QXL_CMD_DRAW, false);
 	qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
+
 out_free_palette:
 	if (palette_bo)
 		qxl_bo_unref(&palette_bo);
@@ -326,6 +332,8 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 	if (ret)
 		goto out_free_image;
 
+	mutex_lock(&release->async_release_mutex);
+
 	drawable_rect.left = left;
 	drawable_rect.right = right;
 	drawable_rect.top = top;
@@ -387,6 +395,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
 out_release_backoff:
 	if (ret)
 		qxl_release_backoff_reserve_list(release);
+	mutex_unlock(&release->async_release_mutex);
 out_free_image:
 	qxl_image_free_objects(qdev, dimage);
 out_free_clips:
@@ -417,6 +426,8 @@ void qxl_draw_copyarea(struct qxl_device *qdev,
 	if (ret)
 		goto out_free_release;
 
+	mutex_lock(&release->async_release_mutex);
+
 	rect.left = dx;
 	rect.top = dy;
 	rect.right = dx + width;
@@ -424,6 +435,7 @@ void qxl_draw_copyarea(struct qxl_device *qdev,
 	ret = make_drawable(qdev, 0, QXL_COPY_BITS, &rect, release);
 	if (ret) {
 		qxl_release_backoff_reserve_list(release);
+		mutex_unlock(&release->async_release_mutex);
 		goto out_free_release;
 	}
 
@@ -435,6 +447,8 @@ void qxl_draw_copyarea(struct qxl_device *qdev,
 	qxl_push_command_ring_release(qdev, release, QXL_CMD_DRAW, false);
 	qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
+
 out_free_release:
 	if (ret)
 		free_drawable(qdev, release);
@@ -459,9 +473,12 @@ void qxl_draw_fill(struct qxl_draw_fill *qxl_draw_fill_rec)
 	if (ret)
 		goto out_free_release;
 
+	mutex_lock(&release->async_release_mutex);
+
 	ret = make_drawable(qdev, 0, QXL_DRAW_FILL, &rect, release);
 	if (ret) {
 		qxl_release_backoff_reserve_list(release);
+		mutex_unlock(&release->async_release_mutex);
 		goto out_free_release;
 	}
 
@@ -479,6 +496,8 @@ void qxl_draw_fill(struct qxl_draw_fill *qxl_draw_fill_rec)
 	qxl_push_command_ring_release(qdev, release, QXL_CMD_DRAW, false);
 	qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
+
 out_free_release:
 	if (ret)
 		free_drawable(qdev, release);
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 01220d386b0a..cbc7bdb5b8d3 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -54,7 +54,7 @@
 
 #define DRIVER_NAME		"qxl"
 #define DRIVER_DESC		"RH QXL"
-#define DRIVER_DATE		"20120117"
+#define DRIVER_DATE		"20200107"
 
 #define DRIVER_MAJOR 0
 #define DRIVER_MINOR 1
@@ -172,6 +172,7 @@ struct qxl_release {
 	uint32_t surface_release_id;
 	struct ww_acquire_ctx ticket;
 	struct list_head bos;
+	struct mutex	async_release_mutex;
 };
 
 struct qxl_drm_chunk {
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 6cc9f3367fa0..189d016b871b 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -250,6 +250,8 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	if (ret)
 		goto out_free_bos;
 
+	mutex_lock(&release->async_release_mutex);
+
 	for (i = 0; i < cmd->relocs_num; ++i) {
 		if (reloc_info[i].type == QXL_RELOC_TYPE_BO)
 			apply_reloc(qdev, &reloc_info[i]);
@@ -263,6 +265,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	else
 		qxl_release_fence_buffer_objects(release);
 
+	mutex_unlock(&release->async_release_mutex);
 out_free_bos:
 out_free_release:
 	if (ret)
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index e37f0097f744..f4c066dcabfe 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -133,6 +133,7 @@ qxl_release_alloc(struct qxl_device *qdev, int type,
 	release->type = type;
 	release->release_offset = 0;
 	release->surface_release_id = 0;
+	mutex_init(&release->async_release_mutex);
 	INIT_LIST_HEAD(&release->bos);
 
 	idr_preload(GFP_KERNEL);
@@ -343,6 +344,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 	}
 
 	mutex_lock(&qdev->release_mutex);
+
 	if (qdev->current_release_bo_offset[cur_idx] + 1 >= releases_per_bo[cur_idx]) {
 		qxl_bo_unref(&qdev->current_release_bo[cur_idx]);
 		qdev->current_release_bo_offset[cur_idx] = 0;
-- 
2.20.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
