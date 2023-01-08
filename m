Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AC6619AF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFC010E242;
	Sun,  8 Jan 2023 21:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BCE10E242
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:06:03 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 44CC46602D58;
 Sun,  8 Jan 2023 21:05:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673211962;
 bh=GRt7VASNZp8eBXEdr3FBo1IkPFpurJqLk8d4YopbNTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KCU0U9TIDYDksCUdeKGD2RjXCxfT4aO7VItFgWTSMAgsEHlxmB5SWmzTeAhGxm6yL
 s/LZM0HHssGv+I6Gov3ZaU+f5PdS/fghtyXjHyZmvGT9tDEOh8hKSazUsMBYaRukCA
 tGCpPFNOH4N5Ot8Dr+B3AD6kEfpj6x0KSbnhjAXZ2ZgsNTSvej/xvSMHsaKQAMqh6Q
 H8MXF1U9VRv6glj2KireobtrzeP/3eTLSASrn5rdT3KuMN4TYCapz5lEFSvelvYYqy
 c3G1yuyc8uzykM5gDx/XaxuwJF6Q8ug6HvQqkwEi+isu48eRaxSu8yTiPw5uF+Xt/k
 wXSN+q47UY0KQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v10 09/11] drm/gem: Add drm_gem_pin_unlocked()
Date: Mon,  9 Jan 2023 00:04:43 +0300
Message-Id: <20230108210445.3948344-10-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
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

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index dbb48fc9dff3..0b8d3da985c7 100644
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
index 8e5c22f25691..6f6d96f79a67 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -493,4 +493,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 
 bool drm_gem_object_evict(struct drm_gem_object *obj);
 
+int drm_gem_pin_unlocked(struct drm_gem_object *obj);
+void drm_gem_unpin_unlocked(struct drm_gem_object *obj);
+
 #endif /* __DRM_GEM_H__ */
-- 
2.38.1

