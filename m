Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1EB825A82
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5868E10E67F;
	Fri,  5 Jan 2024 18:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557A10E68F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480444;
 bh=fLJxMhHQEYSpt8Bqc4/bJy7tBd8v7hDnk2PHVorE3qc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bC32xTjF4i+0BoGAcr5FknxLJTdvHfAZsGZ7CI25/elJxlKVuE3vR6OrI4/hvmfCa
 ThiwAnjeHHzZDCJRTuX2A8OwgkO2x+1+kcDl/KxfVobeazReMlnDhpm9QhLTtOfFdo
 R5RnbvFX6znHhPkHoEv7fDKAfzt7Psl7QnWxYeWNUbj/ZxJxmxwUNaL6hOMbZfK0jp
 hXiZblVuJ9mVWrTR4w/GzjJS1IAQ2qHE5F3R7ZxexU6Zsvz0qub7pSxo3zrJsxvCs7
 zVn+JG5PlHelFoc2HMTKOnOfQ1QldimrwoTjebvnpk/OtRQZK7lNR7tTn+X37ZbwTz
 dujX/5z5C4kCA==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 50EDA3782046;
 Fri,  5 Jan 2024 18:47:23 +0000 (UTC)
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
Subject: [PATCH v19 25/30] drm/shmem-helper: Don't free refcounted GEM
Date: Fri,  5 Jan 2024 21:46:19 +0300
Message-ID: <20240105184624.508603-26-dmitry.osipenko@collabora.com>
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

Don't free shmem object if it has pages that are in use at the time of
the GEM's freeing if DRM driver doesn't manage GEM/pages lifetime properly.
This prevents memory corruption due to the use-after-free bug in exchange
to leaking GEM.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e6e6e693ab95..0d95d723b90d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -205,9 +205,15 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	if (obj->import_attach)
 		drm_prime_gem_destroy(obj, shmem->sgt);
 
-	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
-	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
-	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
+	/*
+	 * Prevent memory corruption caused by the use-after-free bug in a
+	 * case where shmem user erroneously holds reference to pages while
+	 * GEM is freed by leaking the GEM.
+	 */
+	if (drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count)) ||
+	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count)) ||
+	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count)))
+		return;
 
 	drm_gem_object_release(obj);
 	kfree(shmem);
-- 
2.43.0

