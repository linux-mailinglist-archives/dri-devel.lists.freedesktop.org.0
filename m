Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6C7DB021
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552010E1E1;
	Sun, 29 Oct 2023 23:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BB110E1D9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:03:00 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 546C36607396;
 Sun, 29 Oct 2023 23:02:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620579;
 bh=8rtXn19fvaBXhb48S1Y4vYdXdzNTfF4j95pl2pB4Jj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRGBZwF1NKhPQjB1XQlhRcOVPXHE84vqpNBhZrkK8krkrkiczEXKlHJqJFSt5Ww9A
 li5hV7sh/Zq/Gg8hOZjrbJ9jpEIg9QckJmNImb4IvRjWhWqpNpxAvikQCnNIelyYfe
 LBNNSlcea5YhZowelFyeGDaSya0NHk+bytBWQ1/1BxxYsUIgX7OHsQGKsMo+HFNH+s
 71KYOKFuX8jktieetnuG3bIEH/j5eJOHRWcuFXlSBi1nt+QhKLXN+XqfN3fV7kTL8d
 JIwe/KHanbZO0DjJ6j6zPyZTADs7al9+xga2M3r83xbeXc/8hUodG7MCY27isI+Edj
 xQFYRgY+PCaug==
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
Subject: [PATCH v18 22/26] drm/shmem-helper: Don't free refcounted GEM
Date: Mon, 30 Oct 2023 02:02:01 +0300
Message-ID: <20231029230205.93277-23-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
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

Don't free refcounted shmem object to prevent use-after-free bug that
is worse than a memory leak.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6dd087f19ea3..4253c367dc07 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -203,9 +203,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	if (obj->import_attach)
 		drm_prime_gem_destroy(obj, shmem->sgt);
 
-	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
-	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
-	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
+	if (drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count)) ||
+	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count)) ||
+	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count)))
+		return;
 
 	drm_gem_object_release(obj);
 	kfree(shmem);
-- 
2.41.0

