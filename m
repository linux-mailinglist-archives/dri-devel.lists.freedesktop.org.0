Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3497B30F5A2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 15:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03C6EDD9;
	Thu,  4 Feb 2021 14:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579D6EDBC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJTUhsF+O0Ysq2UCOUpL23Yn8/HwuxKQnXbRqkpKmRE=;
 b=EnSs4huMSoqO3SbIkF0pbAMJ7EnkEYz9DRQvDPYOjJ7Hw+21kd6z7R52PKJ8fMnuHl1q+n
 +LfkKt7FvSjQYiIBe4plk7DLj1RCqWXQ4pqs2dCZarUoFgQcaKKruiSCuGj3BXESAy0VCq
 cHLEynbTh7XgwvI0a5ExqXzwlt3Wrys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-SI1NogXCPSKteCRSmqwbkw-1; Thu, 04 Feb 2021 09:57:23 -0500
X-MC-Unique: SI1NogXCPSKteCRSmqwbkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1742C804022;
 Thu,  4 Feb 2021 14:57:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBA225DA2D;
 Thu,  4 Feb 2021 14:57:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C3721801024; Thu,  4 Feb 2021 15:57:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/10] drm/qxl: properly free qxl releases
Date: Thu,  4 Feb 2021 15:57:09 +0100
Message-Id: <20210204145712.1531203-9-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-1-kraxel@redhat.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorganize qxl_device_fini() a bit.
Add missing unpin() calls.

Count releases.  Add wait queue for releases.  That way
qxl_device_fini() can easily wait until everything is
ready for proper shutdown.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_drv.h     |  2 ++
 drivers/gpu/drm/qxl/qxl_cmd.c     |  1 +
 drivers/gpu/drm/qxl/qxl_irq.c     |  1 +
 drivers/gpu/drm/qxl/qxl_kms.c     | 28 ++++++++++++++++++++++++----
 drivers/gpu/drm/qxl/qxl_release.c |  2 ++
 5 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 01354b43c413..6dd57cfb2e7c 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -214,6 +214,8 @@ struct qxl_device {
 	spinlock_t	release_lock;
 	struct idr	release_idr;
 	uint32_t	release_seqno;
+	atomic_t	release_count;
+	wait_queue_head_t release_event;
 	spinlock_t release_idr_lock;
 	struct mutex	async_io_mutex;
 	unsigned int last_sent_io_cmd;
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 54e3c3a97440..7e22a81bfb36 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -254,6 +254,7 @@ int qxl_garbage_collect(struct qxl_device *qdev)
 		}
 	}
 
+	wake_up_all(&qdev->release_event);
 	DRM_DEBUG_DRIVER("%d\n", i);
 
 	return i;
diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
index ddf6588a2a38..d312322cacd1 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -87,6 +87,7 @@ int qxl_irq_init(struct qxl_device *qdev)
 	init_waitqueue_head(&qdev->display_event);
 	init_waitqueue_head(&qdev->cursor_event);
 	init_waitqueue_head(&qdev->io_cmd_event);
+	init_waitqueue_head(&qdev->release_event);
 	INIT_WORK(&qdev->client_monitors_config_work,
 		  qxl_client_monitors_config_work_func);
 	atomic_set(&qdev->irq_received, 0);
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 4a60a52ab62e..66d74aaaee06 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -286,11 +286,31 @@ int qxl_device_init(struct qxl_device *qdev,
 
 void qxl_device_fini(struct qxl_device *qdev)
 {
-	qxl_bo_unref(&qdev->current_release_bo[0]);
-	qxl_bo_unref(&qdev->current_release_bo[1]);
-	qxl_gem_fini(qdev);
-	qxl_bo_fini(qdev);
+	int cur_idx;
+
+	for (cur_idx = 0; cur_idx < 3; cur_idx++) {
+		if (!qdev->current_release_bo[cur_idx])
+			continue;
+		qxl_bo_unpin(qdev->current_release_bo[cur_idx]);
+		qxl_bo_unref(&qdev->current_release_bo[cur_idx]);
+		qdev->current_release_bo_offset[cur_idx] = 0;
+		qdev->current_release_bo[cur_idx] = NULL;
+	}
+
+	/*
+	 * Ask host to release resources (+fill release ring),
+	 * then wait for the release actually happening.
+	 */
+	qxl_io_notify_oom(qdev);
+	wait_event_timeout(qdev->release_event,
+			   atomic_read(&qdev->release_count) == 0,
+			   HZ);
 	flush_work(&qdev->gc_work);
+	qxl_surf_evict(qdev);
+	qxl_vram_evict(qdev);
+
+	qxl_gem_fini(qdev);
+	qxl_bo_fini(qdev);
 	qxl_ring_free(qdev->command_ring);
 	qxl_ring_free(qdev->cursor_ring);
 	qxl_ring_free(qdev->release_ring);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 28013fd1f8ea..43a5436853b7 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -196,6 +196,7 @@ qxl_release_free(struct qxl_device *qdev,
 		qxl_release_free_list(release);
 		kfree(release);
 	}
+	atomic_dec(&qdev->release_count);
 }
 
 static int qxl_release_bo_alloc(struct qxl_device *qdev,
@@ -344,6 +345,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 			*rbo = NULL;
 		return idr_ret;
 	}
+	atomic_inc(&qdev->release_count);
 
 	mutex_lock(&qdev->release_mutex);
 	if (qdev->current_release_bo_offset[cur_idx] + 1 >= releases_per_bo[cur_idx]) {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
