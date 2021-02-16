Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19231C9DE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9496E8D7;
	Tue, 16 Feb 2021 11:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9A66E883
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJtDJWsWvIUDA1UiErWRYJnwzEDYNRI1i739Wq82LqY=;
 b=cQ+IW2GwTbLFqMvrfQFDBB6b9gYzGEY8xclCQusM/Xxxmp+VK1h0ujdTV8CUNN+Vf5cMz3
 3NJfxe2YUieDnj7czYAEBsfQCqIndMkVlLd/ip7rbJ3BwDcQa52pleqKMf4Y/IUXkrYx2m
 kj0zWZyX+QeTm2dvJRkzglPbXkdIIj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-N4GnxuoqM1yB5NhOo0QVJA-1; Tue, 16 Feb 2021 06:37:33 -0500
X-MC-Unique: N4GnxuoqM1yB5NhOo0QVJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECE0B195D562;
 Tue, 16 Feb 2021 11:37:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD4B60C15;
 Tue, 16 Feb 2021 11:37:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 886BB180086F; Tue, 16 Feb 2021 12:37:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] drm/qxl: map/unmap framebuffers in
 prepare_fb+cleanup_fb callbacks.
Date: Tue, 16 Feb 2021 12:37:15 +0100
Message-Id: <20210216113716.716996-10-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-1-kraxel@redhat.com>
References: <20210216113716.716996-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

We don't have to map in atomic_update callback then,
making locking a bit less complicated.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 7500560db8e4..39b8c5116d34 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -584,7 +584,6 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 	struct drm_gem_object *obj;
 	struct qxl_bo *cursor_bo = NULL, *user_bo = NULL, *old_cursor_bo = NULL;
 	int ret;
-	struct dma_buf_map user_map;
 	struct dma_buf_map cursor_map;
 	void *user_ptr;
 	int size = 64*64*4;
@@ -599,11 +598,8 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		obj = fb->obj[0];
 		user_bo = gem_to_qxl_bo(obj);
 
-		/* pinning is done in the prepare/cleanup framevbuffer */
-		ret = qxl_bo_kmap_locked(user_bo, &user_map);
-		if (ret)
-			goto out_free_release;
-		user_ptr = user_map.vaddr; /* TODO: Use mapping abstraction properly */
+		/* mapping is done in the prepare/cleanup framevbuffer */
+		user_ptr = user_bo->map.vaddr; /* TODO: Use mapping abstraction properly */
 
 		ret = qxl_alloc_bo_reserved(qdev, release,
 					    sizeof(struct qxl_cursor) + size,
@@ -639,7 +635,6 @@ static void qxl_cursor_atomic_update(struct drm_plane *plane,
 		cursor->chunk.data_size = size;
 		memcpy(cursor->chunk.data, user_ptr, size);
 		qxl_bo_kunmap_locked(cursor_bo);
-		qxl_bo_kunmap_locked(user_bo);
 
 		cmd = (struct qxl_cursor_cmd *) qxl_release_map(qdev, release);
 		cmd->u.set.visible = 1;
@@ -778,6 +773,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_gem_object *obj;
 	struct qxl_bo *user_bo;
 	struct qxl_surface surf;
+	struct dma_buf_map unused;
 
 	if (!new_state->fb)
 		return 0;
@@ -815,7 +811,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		}
 	}
 
-	return qxl_bo_pin(user_bo);
+	return qxl_bo_kmap(user_bo, &unused);
 }
 
 static void qxl_plane_cleanup_fb(struct drm_plane *plane,
@@ -834,7 +830,7 @@ static void qxl_plane_cleanup_fb(struct drm_plane *plane,
 
 	obj = old_state->fb->obj[0];
 	user_bo = gem_to_qxl_bo(obj);
-	qxl_bo_unpin(user_bo);
+	qxl_bo_kunmap(user_bo);
 
 	if (old_state->fb != plane->state->fb && user_bo->shadow) {
 		qxl_bo_unpin(user_bo->shadow);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
