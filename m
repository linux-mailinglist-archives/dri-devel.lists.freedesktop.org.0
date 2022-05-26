Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF25356A6
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4310FCF1;
	Thu, 26 May 2022 23:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D2910F5F3;
 Thu, 26 May 2022 23:55:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 52C691F459FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609310;
 bh=nPEuKswQlR9Y3lB1Q2WuSBCu+q4IQv1b2R4ojzwKwKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m8aIO9spexkXB7Y8oBGI0YPYaWs/o9KynNSMnYM+QCOBYGce+N6mI0toHIP/pevv4
 PlxmoM6raMVUbKMbZU4yqFIrwNzX1L2fR6z8pjpPqjpWVyI1qQHkbwl826zk1RkvCd
 B5p8s8la4i7uXnsYcU3b5rqVkgspWV12oarc04KFQ/srmesKgwe5Sq7hNvA1SrrU4w
 laM5D27QHrw8jeXLouHaAsmKIwEEmHZ5fbqrcQBamm8jCQT3HtFNnC2ZoX358vRF+o
 3PW+ug5rE3stsfRINXRuPTcGQtOQs2d7EniYZPtWRp8voclYkmCeOajhS9ARnK6w+9
 3tk/7Z0yybMwg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 18/22] drm/gem: Add drm_gem_pin_unlocked()
Date: Fri, 27 May 2022 02:50:36 +0300
Message-Id: <20220526235040.678984-19-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add unlocked variants of drm_gem_un/pin() functions and make them public.
These new helpers will take care of GEM dma-reservation locking for DRM
drivers.

We are going to add memory shrinking support to the VirtIO-GPU driver
that will need to pin framebuffers explicitly to prevent eviction of the
actively used buffers by the shrinker. VirtIO-GPU driver will use these
new generic helpers to pin shmem framebuffers.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c61674887582..c909c935cfda 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1179,6 +1179,35 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 		obj->funcs->unpin(obj);
 }
 
+int drm_gem_pin_unlocked(struct drm_gem_object *obj)
+{
+	int ret;
+
+	if (!obj->funcs->pin)
+		return 0;
+
+	ret = dma_resv_lock_interruptible(obj->resv, NULL);
+	if (ret)
+		return ret;
+
+	ret = obj->funcs->pin(obj);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_pin_unlocked);
+
+void drm_gem_unpin_unlocked(struct drm_gem_object *obj)
+{
+	if (!obj->funcs->unpin)
+		return;
+
+	dma_resv_lock(obj->resv, NULL);
+	obj->funcs->unpin(obj);
+	dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL(drm_gem_unpin_unlocked);
+
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0b427939f466..870d81e7a104 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -413,4 +413,7 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
 
+int drm_gem_pin_unlocked(struct drm_gem_object *obj);
+void drm_gem_unpin_unlocked(struct drm_gem_object *obj);
+
 #endif /* __DRM_GEM_H__ */
-- 
2.35.3

