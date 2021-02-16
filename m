Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F283931C9CF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCFB6E05A;
	Tue, 16 Feb 2021 11:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA036E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8hgdABHiihi7b1TSdIb3dTzwFOZ3FXXWBxTS5RCCB4=;
 b=L3/GPsgkg8+jDAVBwm9+O/zb9e19piEifBQIYd9XS7V2U+buV45drhABL//WrzlXYKugSQ
 tGuOUxz+ZW07NhuYD+1CEkvw8U/rniAtNVOl1MWVpG61Z8ZrLeCjgFMSzvze2AoRpgQJjD
 9IfgLG1BOjo07Hmvn3EmJU89jWzu5d4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-UXBmoa8xN5ir7z2OuPg4fA-1; Tue, 16 Feb 2021 06:37:25 -0500
X-MC-Unique: UXBmoa8xN5ir7z2OuPg4fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96192107ACC7;
 Tue, 16 Feb 2021 11:37:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86CEA722C6;
 Tue, 16 Feb 2021 11:37:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ABF1A18003BB; Tue, 16 Feb 2021 12:37:17 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/qxl: fix lockdep issue in qxl_alloc_release_reserved
Date: Tue, 16 Feb 2021 12:37:10 +0100
Message-Id: <20210216113716.716996-5-kraxel@redhat.com>
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

Call qxl_bo_unpin (which does a reservation) without holding the
release_mutex lock.  Fixes lockdep (correctly) warning on a possible
deadlock.

Fixes: 65ffea3c6e73 ("drm/qxl: unpin release objects")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index a831184e014a..352a11a8485b 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -284,7 +284,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 				       int type, struct qxl_release **release,
 				       struct qxl_bo **rbo)
 {
-	struct qxl_bo *bo;
+	struct qxl_bo *bo, *free_bo = NULL;
 	int idr_ret;
 	int ret = 0;
 	union qxl_release_info *info;
@@ -317,8 +317,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 
 	mutex_lock(&qdev->release_mutex);
 	if (qdev->current_release_bo_offset[cur_idx] + 1 >= releases_per_bo[cur_idx]) {
-		qxl_bo_unpin(qdev->current_release_bo[cur_idx]);
-		qxl_bo_unref(&qdev->current_release_bo[cur_idx]);
+		free_bo = qdev->current_release_bo[cur_idx];
 		qdev->current_release_bo_offset[cur_idx] = 0;
 		qdev->current_release_bo[cur_idx] = NULL;
 	}
@@ -326,6 +325,10 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 		ret = qxl_release_bo_alloc(qdev, &qdev->current_release_bo[cur_idx], priority);
 		if (ret) {
 			mutex_unlock(&qdev->release_mutex);
+			if (free_bo) {
+				qxl_bo_unpin(free_bo);
+				qxl_bo_unref(&free_bo);
+			}
 			qxl_release_free(qdev, *release);
 			return ret;
 		}
@@ -341,6 +344,10 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 		*rbo = bo;
 
 	mutex_unlock(&qdev->release_mutex);
+	if (free_bo) {
+		qxl_bo_unpin(free_bo);
+		qxl_bo_unref(&free_bo);
+	}
 
 	ret = qxl_release_list_add(*release, bo);
 	qxl_bo_unref(&bo);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
