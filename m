Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB931C9D7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FD26E5AE;
	Tue, 16 Feb 2021 11:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B016E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KPW0s8srkPK+oIjW73R/hOS007fqavsKuim9JgrbsM=;
 b=BR4R6AWjZee6ZvvNUJXoyLStLOLsQofGGGNKx+9p2ezkp6SNwtTU29njgHOiFcbxRvq3f0
 d6KpfetkVrQWIDFlJBa156fp6X4BP9BZuU+/sM77U6PcnHAfwNfw1esoSn2Pze86IXAoLb
 HpvCcPl1+Ezte/6rIi307gZdSKYkHNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ThBwyDJ3Oh2glP8w9lMyTg-1; Tue, 16 Feb 2021 06:37:26 -0500
X-MC-Unique: ThBwyDJ3Oh2glP8w9lMyTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7A0F80196C;
 Tue, 16 Feb 2021 11:37:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6F619C99;
 Tue, 16 Feb 2021 11:37:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2BBF218003BE; Tue, 16 Feb 2021 12:37:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] drm/qxl: add qxl_bo_kmap/qxl_bo_kunmap
Date: Tue, 16 Feb 2021 12:37:12 +0100
Message-Id: <20210216113716.716996-7-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-1-kraxel@redhat.com>
References: <20210216113716.716996-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Add kmap/kunmap variants which reserve (and pin) the bo.
They can be used in case the caller doesn't hold a reservation
for the bo.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_object.h |  2 ++
 drivers/gpu/drm/qxl/qxl_object.c | 36 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 5bd33650183f..360972ae4869 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -64,7 +64,9 @@ extern int qxl_bo_create(struct qxl_device *qdev,
 			 u32 priority,
 			 struct qxl_surface *surf,
 			 struct qxl_bo **bo_ptr);
+extern int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map);
 extern int qxl_bo_kmap_locked(struct qxl_bo *bo, struct dma_buf_map *map);
+extern int qxl_bo_kunmap(struct qxl_bo *bo);
 extern void qxl_bo_kunmap_locked(struct qxl_bo *bo);
 void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, int page_offset);
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev, struct qxl_bo *bo, void *map);
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index b56d4dfc28cb..22748b9566af 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -29,6 +29,9 @@
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
+static int __qxl_bo_pin(struct qxl_bo *bo);
+static void __qxl_bo_unpin(struct qxl_bo *bo);
+
 static void qxl_ttm_bo_destroy(struct ttm_buffer_object *tbo)
 {
 	struct qxl_bo *bo;
@@ -179,6 +182,25 @@ int qxl_bo_kmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
 	return 0;
 }
 
+int qxl_bo_kmap(struct qxl_bo *bo, struct dma_buf_map *map)
+{
+	int r;
+
+	r = qxl_bo_reserve(bo);
+	if (r)
+		return r;
+
+	r = __qxl_bo_pin(bo);
+	if (r) {
+		qxl_bo_unreserve(bo);
+		return r;
+	}
+
+	r = qxl_bo_kmap_locked(bo, map);
+	qxl_bo_unreserve(bo);
+	return r;
+}
+
 void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 			      struct qxl_bo *bo, int page_offset)
 {
@@ -223,6 +245,20 @@ void qxl_bo_kunmap_locked(struct qxl_bo *bo)
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
 }
 
+int qxl_bo_kunmap(struct qxl_bo *bo)
+{
+	int r;
+
+	r = qxl_bo_reserve(bo);
+	if (r)
+		return r;
+
+	qxl_bo_kunmap_locked(bo);
+	__qxl_bo_unpin(bo);
+	qxl_bo_unreserve(bo);
+	return 0;
+}
+
 void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev,
 			       struct qxl_bo *bo, void *pmap)
 {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
