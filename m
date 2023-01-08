Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470C6619A6
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91D810E201;
	Sun,  8 Jan 2023 21:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8210E201
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:05:26 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F7216602D55;
 Sun,  8 Jan 2023 21:05:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673211925;
 bh=4h10hR175c/8QjxQaO3jcxXYg0x94Qq0uCuLNGtgonQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=attNsz6MrhLFYTdz3ETiWvxzQHu2FRqut+47r5QKraKPMZv2u9USyg0pjJY4MrEWM
 NksY58MTyWJRhxtaLAIBqyyaUwurZNmCJ8ODsGR7EBIT79InyKJeF54aGVWzkhwZSu
 /Z48WPKVcPnf1CuH0i1T0r9XBVFHMNY692LWgUSzp4GmaeSBAXjYD0QzWQ1FUGqCTb
 WcwkuL7Q2gdpy+ypdl6SWPsQ6Ika/MozaJVIo3Z4oKWamizzMU7Mx8IBtJgPeAfryL
 /8rsxn9OfyfU+sQKFFYkLhKQR6pAEUFiP+CZU1jWOo5QyJ34MNDwKSm0vTC3LuZJke
 L9PO7YVXYtf0Q==
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
Subject: [PATCH v10 03/11] drm/gem: Add evict() callback to
 drm_gem_object_funcs
Date: Mon,  9 Jan 2023 00:04:37 +0300
Message-Id: <20230108210445.3948344-4-dmitry.osipenko@collabora.com>
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

Add new common evict() callback to drm_gem_object_funcs and corresponding
drm_gem_object_evict() helper. This is a first step on a way to providing
common GEM-shrinker API for DRM drivers.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 16 ++++++++++++++++
 include/drm/drm_gem.h     | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6bca5ac6e0f..dbb48fc9dff3 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1471,3 +1471,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 	return freed;
 }
 EXPORT_SYMBOL(drm_gem_lru_scan);
+
+/**
+ * drm_gem_object_evict - helper to evict backing pages for a GEM object
+ * @obj: obj in question
+ */
+bool
+drm_gem_object_evict(struct drm_gem_object *obj)
+{
+	dma_resv_assert_held(obj->resv);
+
+	if (obj->funcs->evict)
+		return obj->funcs->evict(obj);
+
+	return false;
+}
+EXPORT_SYMBOL(drm_gem_object_evict);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index f1f00fc2dba6..8e5c22f25691 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -172,6 +172,16 @@ struct drm_gem_object_funcs {
 	 * This is optional but necessary for mmap support.
 	 */
 	const struct vm_operations_struct *vm_ops;
+
+	/**
+	 * @evict:
+	 *
+	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
+	 * helper. Returns true on success, false otherwise.
+	 *
+	 * This callback is optional.
+	 */
+	bool (*evict)(struct drm_gem_object *obj);
 };
 
 /**
@@ -481,4 +491,6 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 			       unsigned long *remaining,
 			       bool (*shrink)(struct drm_gem_object *obj));
 
+bool drm_gem_object_evict(struct drm_gem_object *obj);
+
 #endif /* __DRM_GEM_H__ */
-- 
2.38.1

