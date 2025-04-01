Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762CA77B1F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9BA10E58E;
	Tue,  1 Apr 2025 12:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WGB4Tc30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0248E10E332
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 12:39:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743511153; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IF9rUeRgrX5eSUtvwiz5JxSnYfWUiVNN2I4vj8sbWAk07xu/v8vFhrhzsJnIbRWLeQseCsJnT35hu2mD1q5el5kOzUbVZYcaHseVI1bgXAmO2F9ImxvoiY5Q+QsczyXcNpsrigavR6ebzUOvIvy0Q3qaBMgjWG9EUqkrWY0knfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743511153;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y3el005xY3oGMc8cUqaR8dg1yT/0Pba1l5i18SJCzzQ=; 
 b=VwdvGm6DrkcD0EVqPinped/0Hazmqs02E4ihBaZ/siM0I5S27+ahzAgjgZ1/F+5iSk4UAG/NIbVbSe3s8nrW66y2XFzztkoRn6I7e2pP6Wb2sdMis/HsAc6YB5J+oTqBmpwtblYO8SVUoroZ3E/HMlqaix140KDpWx4nVSiM1rE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743511153; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=y3el005xY3oGMc8cUqaR8dg1yT/0Pba1l5i18SJCzzQ=;
 b=WGB4Tc307vnWrmiLDqgK4AtVuvluqr3Ag/ZP4xwho3xjn3ZNtIYR0+t0EMqX7HUj
 74Kpq7VSfCp/16ko/SkQbpxluEemA5Ig+7PBtYGqJcJAmLX4ouDknB3pdc8ozD9cdHO
 u0XdhuBPtPlcI1TTw3f0jBZOKO1zCd75ePF1iZs0=
Received: by mx.zohomail.com with SMTPS id 1743511151947972.5636952683552;
 Tue, 1 Apr 2025 05:39:11 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v2 2/2] drm/virtio: Fix missed dmabuf unpinning in error path
 of prepare_fb()
Date: Tue,  1 Apr 2025 15:38:42 +0300
Message-ID: <20250401123842.2232205-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
References: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
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

Correct error handling in prepare_fb() to fix leaking resources when
error happens.

Fixes: 4a696a2ee646 ("drm/virtio: Add prepare and cleanup routines for imported dmabuf obj")
Cc: <stable@vger.kernel.org> # v6.14+
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

v2: Change order of prep_obj/fence_alloc, add ack from Vivek

 drivers/gpu/drm/virtio/virtgpu_plane.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 42aa554eca9f..26abe3d1b122 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -322,12 +322,6 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 		return 0;
 
 	obj = new_state->fb->obj[0];
-	if (obj->import_attach) {
-		ret = virtio_gpu_prepare_imported_obj(plane, new_state, obj);
-		if (ret)
-			return ret;
-	}
-
 	if (bo->dumb || obj->import_attach) {
 		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
 						     vgdev->fence_drv.context,
@@ -336,7 +330,21 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 			return -ENOMEM;
 	}
 
+	if (obj->import_attach) {
+		ret = virtio_gpu_prepare_imported_obj(plane, new_state, obj);
+		if (ret)
+			goto err_fence;
+	}
+
 	return 0;
+
+err_fence:
+	if (vgplane_st->fence) {
+		dma_fence_put(&vgplane_st->fence->f);
+		vgplane_st->fence = NULL;
+	}
+
+	return ret;
 }
 
 static void virtio_gpu_cleanup_imported_obj(struct drm_gem_object *obj)
-- 
2.49.0

