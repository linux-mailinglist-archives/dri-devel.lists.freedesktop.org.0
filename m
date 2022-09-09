Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4B5B2C2D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 04:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085B710E088;
	Fri,  9 Sep 2022 02:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DB410E088;
 Fri,  9 Sep 2022 02:35:30 +0000 (UTC)
X-UUID: 2a3fe2328cdd469ab8af3e1a811a87e4-20220909
X-UUID: 2a3fe2328cdd469ab8af3e1a811a87e4-20220909
X-User: zhouzongmin@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>) (Generic MTA)
 with ESMTP id 1395227217; Fri, 09 Sep 2022 10:35:55 +0800
From: Zongmin Zhou <zhouzongmin@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/qxl: drop set_prod_notify parameter from qxl_ring_create
Date: Fri,  9 Sep 2022 10:35:03 +0800
Message-Id: <20220909023503.1886148-1-zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, Ming Xie <xieming@kylinos.cn>,
 spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since qxl_io_reset(qdev) will be called immediately
after qxl_ring_create() been called,
and parameter like notify_on_prod will be set to default value.
So the call to qxl_ring_init_hdr() before becomes meaningless.

Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
Suggested-by: Ming Xie<xieming@kylinos.cn>
---
 drivers/gpu/drm/qxl/qxl_cmd.c | 8 --------
 drivers/gpu/drm/qxl/qxl_drv.h | 2 --
 drivers/gpu/drm/qxl/qxl_kms.c | 4 +---
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 7b00c955cd82..63aa96a69752 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -53,17 +53,11 @@ void qxl_ring_free(struct qxl_ring *ring)
 	kfree(ring);
 }
 
-void qxl_ring_init_hdr(struct qxl_ring *ring)
-{
-	ring->ring->header.notify_on_prod = ring->n_elements;
-}
-
 struct qxl_ring *
 qxl_ring_create(struct qxl_ring_header *header,
 		int element_size,
 		int n_elements,
 		int prod_notify,
-		bool set_prod_notify,
 		wait_queue_head_t *push_event)
 {
 	struct qxl_ring *ring;
@@ -77,8 +71,6 @@ qxl_ring_create(struct qxl_ring_header *header,
 	ring->n_elements = n_elements;
 	ring->prod_notify = prod_notify;
 	ring->push_event = push_event;
-	if (set_prod_notify)
-		qxl_ring_init_hdr(ring);
 	spin_lock_init(&ring->lock);
 	return ring;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 47c169673088..432758ad39a3 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -277,10 +277,8 @@ struct qxl_ring *qxl_ring_create(struct qxl_ring_header *header,
 				 int element_size,
 				 int n_elements,
 				 int prod_notify,
-				 bool set_prod_notify,
 				 wait_queue_head_t *push_event);
 void qxl_ring_free(struct qxl_ring *ring);
-void qxl_ring_init_hdr(struct qxl_ring *ring);
 int qxl_check_idle(struct qxl_ring *ring);
 
 static inline uint64_t
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 9bf6d4cc98d4..dc3828db1991 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -194,7 +194,6 @@ int qxl_device_init(struct qxl_device *qdev,
 					     sizeof(struct qxl_command),
 					     QXL_COMMAND_RING_SIZE,
 					     qdev->io_base + QXL_IO_NOTIFY_CMD,
-					     false,
 					     &qdev->display_event);
 	if (!qdev->command_ring) {
 		DRM_ERROR("Unable to create command ring\n");
@@ -207,7 +206,6 @@ int qxl_device_init(struct qxl_device *qdev,
 				sizeof(struct qxl_command),
 				QXL_CURSOR_RING_SIZE,
 				qdev->io_base + QXL_IO_NOTIFY_CURSOR,
-				false,
 				&qdev->cursor_event);
 
 	if (!qdev->cursor_ring) {
@@ -219,7 +217,7 @@ int qxl_device_init(struct qxl_device *qdev,
 	qdev->release_ring = qxl_ring_create(
 				&(qdev->ram_header->release_ring_hdr),
 				sizeof(uint64_t),
-				QXL_RELEASE_RING_SIZE, 0, true,
+				QXL_RELEASE_RING_SIZE, 0,
 				NULL);
 
 	if (!qdev->release_ring) {
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
