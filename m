Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F486A3B1E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 07:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DA810E1A9;
	Mon, 27 Feb 2023 06:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C208410E1A9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 06:03:17 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C5226602CEE;
 Mon, 27 Feb 2023 06:03:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677477796;
 bh=zckXdlaLMbNl0/o5ZLcD7xzHUhB1lCzZWIIP5en5/Fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OwAWprx6b206YuDeM/zVCDA0N3eOvCUEM+EMH6JSsEnMjzjjSzF93e6x8NjRdIstQ
 TMXCOBQ3F04ftrfGPlkcEjyzYAUsTEX0svL6Pg2GP6NGtlNNzy3/s9ghJ+r9LpTrEa
 OcOhXgj3WImZP6+oX08jDO94UCz+2WBUxxODwVorg+SnbrS16L1sLa2axdfk4rmwws
 hX9fkK/moqYZPWraw61/w+3983JB6/hbo1ZkCZDro6KlW48+5Ceg9jLuhf4pXN0VtL
 t2ChYvKWt5xbHqOh+bznZ6FG0H3X0fdTwpv/1+dfjF7a/CLZG2onBcUuoFIUeWxi25
 /XrIHE7j55cDA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v11 08/10] drm/gem: Add drm_gem_pin_unlocked()
Date: Mon, 27 Feb 2023 09:02:17 +0300
Message-Id: <20230227060219.904986-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227060219.904986-1-dmitry.osipenko@collabora.com>
References: <20230227060219.904986-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add unlocked variants of drm_gem_un/pin() functions. These new helpers
will take care of GEM dma-reservation locking for DRM drivers.

VirtIO-GPU driver will use these helpers to pin shmem framebuffers,
preventing them from eviction during scanout.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e5b2c077b314..3b16026e47f8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1167,6 +1167,35 @@ void drm_gem_unpin(struct drm_gem_object *obj)
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
index 7bd8e2bbbb36..b0a03d2dac99 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -493,4 +493,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 int drm_gem_evict(struct drm_gem_object *obj);
 
+int drm_gem_pin_unlocked(struct drm_gem_object *obj);
+void drm_gem_unpin_unlocked(struct drm_gem_object *obj);
+
 #endif /* __DRM_GEM_H__ */
-- 
2.39.2

