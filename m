Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD275623CA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5A010E89C;
	Thu, 30 Jun 2022 20:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDD910E752
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:04:44 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F3127660197A;
 Thu, 30 Jun 2022 21:04:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619483;
 bh=bF2vJby7Mhz2elgCtte5Q4NU6PyYt5P90frAlP4YkMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ya2yWbx3mpSHqfsRClOrTB1cjBbQlmWEdlZ1+F77cVbRhvYal8ege+Ix/9JG5vk79
 wktaxk+t+5bfKSuObVQnUWVLR7Q3IxFin64MxSbg2zCzzYl7gshaGOcbeivoV2o7Qn
 t4aq9c/2Pyz9enB3E1FU6vJ/oxWJ9hX49wEIp9P4uRVUwGWIZmJcfo9WbOmNQf/xph
 hXFTnMUQFATV1vkodo2BoLbcqP88jABhOdq0pIA+3lZUDcFT73teojSPbH551vf9Zp
 C53JOgXfyNi1L8J4bTshjqMR+pXT/SdjvQK2acDb+NitZXeKYKWzAohaixK8BKgpo6
 zKRnWduyRQreg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 2/2] drm/gem: Don't map imported GEMs
Date: Thu, 30 Jun 2022 23:04:05 +0300
Message-Id: <20220630200405.1883897-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
References: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
handle imported dma-bufs properly, which results in mapping of something
else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
userspace writes to the memory mapping of a dma-buf that was imported into
Tegra's DRM GEM.

Majority of DRM drivers prohibit mapping of the imported GEM objects.
Mapping of imported GEMs require special care from userspace since it
should sync dma-buf because mapping coherency of the exporter device may
not match the DRM device. Let's prohibit the mapping for all DRM drivers
for consistency.

Cc: stable@vger.kernel.org
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c              | 4 ++++
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 86d670c71286..fc9ec42fa0ab 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 {
 	int ret;
 
+	/* Don't allow imported objects to be mapped */
+	if (obj->import_attach)
+		return -EINVAL;
+
 	/* Check for valid size. */
 	if (obj_size < vma->vm_end - vma->vm_start)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..6190f5018986 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -609,17 +609,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
  */
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma)
 {
-	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	if (obj->import_attach) {
-		/* Drop the reference drm_gem_mmap_obj() acquired.*/
-		drm_gem_object_put(obj);
-		vma->vm_private_data = NULL;
-
-		return dma_buf_mmap(obj->dma_buf, vma, 0);
-	}
-
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret) {
 		drm_gem_vm_close(vma);
-- 
2.36.1

