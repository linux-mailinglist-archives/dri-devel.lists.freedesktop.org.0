Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB99A5762
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 00:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C831110E122;
	Sun, 20 Oct 2024 22:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ZnZ5Hu/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0186910E122
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 22:48:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729464530; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d2WFfHEHA0Xx31UrFydpEFfccdsBUKikdaczwif03n9Dflha03mJib4ob4W28sz7wiWKDOth5bw5Wrx+MwlHPfrWXpno0s53rq/KMiRshIBQ0Zy1WE1E9M5lTWVPm9b5NCL8Mot/3n0pL4ayUkCA6MkaiSG326JinAhJjN+xKh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729464530;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7LvLwytRtn5CBeDLReQUVN22EMuJFh+Y13/Wh+lWpKk=; 
 b=f2Is/tkUUD2NvABkJ7golLcVp/IVjMjeAYp/4o7jAmih9X8Z7Lgwl0RnzIvb1XdcFFp2qmlPozy2/7FWnUNEQ0XL+6z5HmoWDlco/mnNHzvFtmwjiIxVxLaceBBo184X3pZBVoJ8zCbOegJfvw4TECC7Wvjudu7afrGasbHf/kk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729464530; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7LvLwytRtn5CBeDLReQUVN22EMuJFh+Y13/Wh+lWpKk=;
 b=ZnZ5Hu/Hxunhx5lvJGNHTSOMPo0NRpl4rDkhI9V/emmGAQC9H2jKuzMqck05I+RZ
 dbvkxovMow+M77dVZJW9XYeY6fxaFRAaLqu3y5BEfWd8lSLHax/BCDe37tgNx1YgxNJ
 iLEwY4y+TQfFBEeSnWo5p2tAfZQib6RD53EyuKzU=
Received: by mx.zohomail.com with SMTPS id 1729464528968517.9489015511994;
 Sun, 20 Oct 2024 15:48:48 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v1] drm/virtio: Don't create a context with default param if
 context_init is supported
Date: Mon, 21 Oct 2024 01:47:25 +0300
Message-ID: <20241020224725.179937-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Xorg context creation fails for native contexts that use
VIRTGPU_CONTEXT_INIT because context is already initialized implicitly
when dumb buffer is created. Fix it by not creating default vrend context
if context_init is supported.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..67f557e058b4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -127,15 +127,17 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 	/* the context might still be missing when the first ioctl is
 	 * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIME_FD_TO_HANDLE
 	 */
-	virtio_gpu_create_context(obj->dev, file);
+	if (!vgdev->has_context_init)
+		virtio_gpu_create_context(obj->dev, file);
 
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
 		return -ENOMEM;
 	virtio_gpu_array_add_obj(objs, obj);
 
-	virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
-					       objs);
+	if (vfpriv->ctx_id)
+		virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id, objs);
+
 out_notify:
 	virtio_gpu_notify(vgdev);
 	return 0;
-- 
2.47.0

