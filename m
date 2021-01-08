Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293A2EEFDB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 10:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDDA6E7F5;
	Fri,  8 Jan 2021 09:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7F6E802
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:43:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79F5BAFAE;
 Fri,  8 Jan 2021 09:43:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, airlied@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 sam@ravnborg.org
Subject: [PATCH v4 07/13] drm/gm12u320: Use drm_gem_shmem_vmap_local() in
 damage handling
Date: Fri,  8 Jan 2021 10:43:34 +0100
Message-Id: <20210108094340.15290-8-tzimmermann@suse.de>
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

Damage handling in gm12u320 requires a short-term mapping of the source
BO. Use drm_gem_shmem_vmap_local().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/gm12u320.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 33f65f4626e5..b0c6e350f2b3 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -265,11 +265,16 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	y1 = gm12u320->fb_update.rect.y1;
 	y2 = gm12u320->fb_update.rect.y2;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = dma_resv_lock(fb->obj[0]->resv, NULL);
 	if (ret) {
-		GM12U320_ERR("failed to vmap fb: %d\n", ret);
+		GM12U320_ERR("failed to reserve fb: %d\n", ret);
 		goto put_fb;
 	}
+	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
+	if (ret) {
+		GM12U320_ERR("failed to vmap fb: %d\n", ret);
+		goto unlock_resv;
+	}
 	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	if (fb->obj[0]->import_attach) {
@@ -321,8 +326,11 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 		if (ret)
 			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
 	}
+
+unlock_resv:
+	dma_resv_unlock(fb->obj[0]->resv);
 vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
+	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
