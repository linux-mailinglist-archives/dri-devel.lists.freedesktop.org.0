Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561D75DF61
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 01:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5812110E1A3;
	Sat, 22 Jul 2023 23:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0261B10E1A3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 23:53:22 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D0066607106;
 Sun, 23 Jul 2023 00:53:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690070000;
 bh=6qKB4njwK4pvtdiKlbD4ASfNH1pG62XLGXjGDD6zWg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nLPvKTRmVWjb8eP4yVT7yKp4jWsOfcORj+1bLwVZ/+JaFFkJWwxRN2dx2zgAZE2ps
 treJE9dWXzxEVgBHhbrcUSDHAfUb9IjMELvZToBHk+rIR53PEPQ1VgmJXefxuRBnix
 OMcwQ3na64zGD8uO+jVav9+ujVVDAurQcatusGTxKKbGnjNhhQHq1WnzP0y/XsWo/m
 6ceOfBM39yyCGFey0wBz/epn+F3D1/wYvxMZ9hUwrx6Z8xr8YaY9egLkw6r3n1C4a+
 WaPSfsoyD2Meiud8VvyFE+zOV7LhHHKfbXTE49KAmdyeenFCT954SKFv0ly1lraXh9
 gS4Cm0/5KW7BQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v14 12/12] drm/gem: Add _unlocked postfix to
 drm_gem_pin/unpin()
Date: Sun, 23 Jul 2023 02:47:46 +0300
Message-ID: <20230722234746.205949-13-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
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

Make clear that drm_gem_pin/unpin() functions take reservation lock by
adding _unlocked postfix to the function names.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c      | 4 ++--
 drivers/gpu/drm/drm_internal.h | 4 ++--
 drivers/gpu/drm/drm_prime.c    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c18686f434d4..805eb0d85297 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1146,7 +1146,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 		obj->funcs->print_info(p, indent, obj);
 }
 
-int drm_gem_pin(struct drm_gem_object *obj)
+int drm_gem_pin_unlocked(struct drm_gem_object *obj)
 {
 	if (obj->funcs->pin)
 		return obj->funcs->pin(obj);
@@ -1154,7 +1154,7 @@ int drm_gem_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-void drm_gem_unpin(struct drm_gem_object *obj)
+void drm_gem_unpin_unlocked(struct drm_gem_object *obj)
 {
 	if (obj->funcs->unpin)
 		obj->funcs->unpin(obj);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index d7e023bbb0d5..80f5bd1da8fd 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -173,8 +173,8 @@ void drm_gem_release(struct drm_device *dev, struct drm_file *file_private);
 void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			const struct drm_gem_object *obj);
 
-int drm_gem_pin(struct drm_gem_object *obj);
-void drm_gem_unpin(struct drm_gem_object *obj);
+int drm_gem_pin_unlocked(struct drm_gem_object *obj);
+void drm_gem_unpin_unlocked(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 63b709a67471..8145b49e95ff 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -583,7 +583,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 	if (!obj->funcs->get_sg_table)
 		return -ENOSYS;
 
-	return drm_gem_pin(obj);
+	return drm_gem_pin_unlocked(obj);
 }
 EXPORT_SYMBOL(drm_gem_map_attach);
 
@@ -601,7 +601,7 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_unpin(obj);
+	drm_gem_unpin_unlocked(obj);
 }
 EXPORT_SYMBOL(drm_gem_map_detach);
 
-- 
2.41.0

