Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDA32EEFE1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 10:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02BB6E808;
	Fri,  8 Jan 2021 09:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F15E6E7FE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB9D9AFAC;
 Fri,  8 Jan 2021 09:43:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 sam@ravnborg.org
Subject: [PATCH v4 06/13] drm/cirrus: Use drm_gem_shmem_vmap_local() in damage
 handling
Date: Fri,  8 Jan 2021 10:43:33 +0100
Message-Id: <20210108094340.15290-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108094340.15290-1-tzimmermann@suse.de>
References: <20210108094340.15290-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Damage handling in cirrus requires a short-term mapping of the source
BO. Use drm_gem_shmem_vmap_local().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index a043e602199e..21cd7056d45f 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
+	struct drm_gem_object *obj = fb->obj[0];
 	struct dma_buf_map map;
 	void *vmap;
 	int idx, ret;
@@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		goto out;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(obj->resv, NULL);
 	if (ret)
 		goto out_dev_exit;
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
+	if (ret)
+		goto out_dma_resv_unlock;
 	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (cirrus->cpp == fb->format->cpp[0])
@@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	else
 		WARN_ON_ONCE("cpp mismatch");
 
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
 	ret = 0;
 
+	drm_gem_shmem_vunmap_local(obj, &map);
+out_dma_resv_unlock:
+	dma_resv_unlock(obj->resv);
 out_dev_exit:
 	drm_dev_exit(idx);
 out:
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
