Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C628825A6F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E48F10E674;
	Fri,  5 Jan 2024 18:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFA210E674
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480419;
 bh=hwlCMWKCwWq+FTlAozKtV1c6NXEsmQgXkAKTAl4/P/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=3FX6C1Gf+urqihuAHe188P3CvAOPc3Kru2MKDUDKN4uTIEgbX3lMfS9y7FyoeG8B9
 Od2AE3+82Ow23PkbPb0rI9E8sEGsKmBlo0Rta6o7+qoFlficKQS7Od//ZdEIEYnbIz
 fkaSUhuJpTba3VPNM9Y+RVgZ2hc+SDTVd3n8HrWGqMpJIknqswaqzG4ny49Ylf/Oxa
 nu98Ylxpv2q+wUnZh7UVFWlzX3VrldN2MGRP1uCbBh/3ae9XsiqY1YX9FMx6V0yKjM
 5mqniy6HoKmSITyLbrfdwGuzsoZnLq9AshXLBCSonPtVuc+7cxoqYJY4t+JsV7lpCO
 DI4yKiNy9aRbw==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 934B33782047;
 Fri,  5 Jan 2024 18:46:57 +0000 (UTC)
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
Subject: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Date: Fri,  5 Jan 2024 21:46:03 +0300
Message-ID: <20240105184624.508603-10-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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

Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
lock if pages_use_count is non-zero, leveraging from atomicity of the
refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index cacf0f8c42e2..1c032513abf1 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
+static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	if (refcount_inc_not_zero(&shmem->pages_use_count))
+		return 0;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	ret = drm_gem_shmem_get_pages_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
+	return ret;
+}
+
 static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 {
 	int ret;
@@ -609,10 +623,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 		return ret;
 	}
 
-	dma_resv_lock(shmem->base.resv, NULL);
-	ret = drm_gem_shmem_get_pages_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-
+	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
 		return ret;
 
-- 
2.43.0

