Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F262B30441E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 17:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2444B6E4AA;
	Tue, 26 Jan 2021 16:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE756E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611680306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnwMFEA3dHK0CEi+ABtFVAQ2zD+3yrKrWdST5Jn7sBk=;
 b=gjhoJCSDN4mUkhV6DmxaKRGlclgA2YByhFzdMFxXS410pPjXus6RTwqkZf02st1feomeyg
 8GL6qRA50MjzUK4yh38vKgHA1/lSzhOBNmkMEy/eKYs5BLfJCl9bkyhJ8YUiT7S0OXh135
 gtA5GlLUEt7U2kNRVdicBMO89qLMnZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-SmgUeXkUNx6JyluNqkBOfw-1; Tue, 26 Jan 2021 11:58:22 -0500
X-MC-Unique: SmgUeXkUNx6JyluNqkBOfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D746E802B48;
 Tue, 26 Jan 2021 16:58:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EEDB10013BD;
 Tue, 26 Jan 2021 16:58:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9325F18003A3; Tue, 26 Jan 2021 17:58:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/5] drm/qxl: properly free qxl releases
Date: Tue, 26 Jan 2021 17:58:12 +0100
Message-Id: <20210126165812.1661512-6-kraxel@redhat.com>
In-Reply-To: <20210126165812.1661512-1-kraxel@redhat.com>
References: <20210126165812.1661512-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.h     |  1 +
 drivers/gpu/drm/qxl/qxl_kms.c     | 22 ++++++++++++++++++++--
 drivers/gpu/drm/qxl/qxl_release.c |  2 ++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 01354b43c413..1c57b587b6a7 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -214,6 +214,7 @@ struct qxl_device {
 	spinlock_t	release_lock;
 	struct idr	release_idr;
 	uint32_t	release_seqno;
+	atomic_t	release_count;
 	spinlock_t release_idr_lock;
 	struct mutex	async_io_mutex;
 	unsigned int last_sent_io_cmd;
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 4a60a52ab62e..f177f72bfc12 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -25,6 +25,7 @@
 
 #include <linux/io-mapping.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
@@ -286,8 +287,25 @@ int qxl_device_init(struct qxl_device *qdev,
 
 void qxl_device_fini(struct qxl_device *qdev)
 {
-	qxl_bo_unref(&qdev->current_release_bo[0]);
-	qxl_bo_unref(&qdev->current_release_bo[1]);
+	int cur_idx, try;
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
+	for (try = 0; try < 20 && atomic_read(&qdev->release_count) > 0; try++)
+		msleep(20);
+
 	qxl_gem_fini(qdev);
 	qxl_bo_fini(qdev);
 	flush_work(&qdev->gc_work);
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
