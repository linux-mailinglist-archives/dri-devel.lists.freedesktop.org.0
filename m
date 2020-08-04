Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AE23B2E4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CEB6E395;
	Tue,  4 Aug 2020 02:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8AF6E38A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:56:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-B_Q-GE8NOzOhnIpeyCm8pw-1; Mon, 03 Aug 2020 22:56:52 -0400
X-MC-Unique: B_Q-GE8NOzOhnIpeyCm8pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65F7891286;
 Tue,  4 Aug 2020 02:56:51 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD6B790E68;
 Tue,  4 Aug 2020 02:56:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/59] qxl/ttm: drop the unusued no wait flag to reserve
 function
Date: Tue,  4 Aug 2020 12:55:37 +1000
Message-Id: <20200804025632.3868079-5-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_cmd.c    | 2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c  | 2 +-
 drivers/gpu/drm/qxl/qxl_object.c | 4 ++--
 drivers/gpu/drm/qxl/qxl_object.h | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 798f9dd7ad75..54e3c3a97440 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -588,7 +588,7 @@ static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf, bool stal
 {
 	int ret;
 
-	ret = qxl_bo_reserve(surf, false);
+	ret = qxl_bo_reserve(surf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 8f605d5cc149..5cea6eea72ab 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -322,7 +322,7 @@ static int qxl_update_area_ioctl(struct drm_device *dev, void *data,
 
 	qobj = gem_to_qxl_bo(gobj);
 
-	ret = qxl_bo_reserve(qobj, false);
+	ret = qxl_bo_reserve(qobj);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 80e7a17aaddd..f838b6d689aa 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -284,7 +284,7 @@ int qxl_bo_pin(struct qxl_bo *bo)
 {
 	int r;
 
-	r = qxl_bo_reserve(bo, false);
+	r = qxl_bo_reserve(bo);
 	if (r)
 		return r;
 
@@ -302,7 +302,7 @@ int qxl_bo_unpin(struct qxl_bo *bo)
 {
 	int r;
 
-	r = qxl_bo_reserve(bo, false);
+	r = qxl_bo_reserve(bo);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.h b/drivers/gpu/drm/qxl/qxl_object.h
index 21fa81048f4f..6b434e5ef795 100644
--- a/drivers/gpu/drm/qxl/qxl_object.h
+++ b/drivers/gpu/drm/qxl/qxl_object.h
@@ -27,11 +27,11 @@
 
 #include "qxl_drv.h"
 
-static inline int qxl_bo_reserve(struct qxl_bo *bo, bool no_wait)
+static inline int qxl_bo_reserve(struct qxl_bo *bo)
 {
 	int r;
 
-	r = ttm_bo_reserve(&bo->tbo, true, no_wait, NULL);
+	r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
 	if (unlikely(r != 0)) {
 		if (r != -ERESTARTSYS) {
 			struct drm_device *ddev = bo->tbo.base.dev;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
