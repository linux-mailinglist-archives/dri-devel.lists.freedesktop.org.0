Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE38AFC23
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 00:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79955113737;
	Tue, 23 Apr 2024 22:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E+gmPWpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B783D113737;
 Tue, 23 Apr 2024 22:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713912421;
 bh=3CYseH+FU0vBKnt2WiMn8qQr3YasgNMroL1dksT8+ec=;
 h=From:To:Cc:Subject:Date:From;
 b=E+gmPWpkN8TEBota5F4adiG1zxgXpWkcuAt5RrETOOslgqXXQge/S11Rfvb7sT/ac
 NL755WrATlQ/T1M6xL37YKS2Eop0AVT4VkpSogy1yi0Le6IgLCHqZFRJrY962/LMN3
 26uojcImUl4pBPWvttouhjF3SzLNl9fZycmbxiaexlVZfhrfidhFX8+nSsh2iwUujt
 KwXCDRdVn7wgOnveA8ZjfkYmbQQT4rcsYvIzF1RWu06jxCet0J9bjk6IJzqdQr4ivZ
 D5D19giasvFoNVl+ssCQYvyzFwmRJhiNDC9f9dJ5KpYMByEsWXUhGTuNO4R1aKevOQ
 EaumuDIFvq49g==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DFE3F3781013;
 Tue, 23 Apr 2024 22:47:00 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2] drm/panfrost: Fix dma_resv deadlock at drm object pin time
Date: Tue, 23 Apr 2024 23:46:23 +0100
Message-ID: <20240423224651.138163-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When Panfrost must pin an object that is being prepared a dma-buf
attachment for on behalf of another driver, the core drm gem object pinning
code already takes a lock on the object's dma reservation.

However, Panfrost GEM object's pinning callback would eventually try taking
the lock on the same dma reservation when delegating pinning of the object
onto the shmem subsystem, which led to a deadlock.

This can be shown by enabling CONFIG_DEBUG_WW_MUTEX_SLOWPATH, which throws
the following recursive locking situation:

weston/3440 is trying to acquire lock:
ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_shmem_pin+0x34/0xb8 [drm_shmem_helper]
but task is already holding lock:
ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_pin+0x2c/0x80 [drm]

Fix it by assuming the object's reservation had already been locked by the
time we reach panfrost_gem_pin.

Do the same thing for the Lima driver, as it most likely suffers from the
same issue.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()")
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/lima/lima_gem.c         | 9 +++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c | 8 +++++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 7ea244d876ca..8a5bcf498ef6 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -184,8 +184,13 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 
 	if (bo->heap_size)
 		return -EINVAL;
-
-	return drm_gem_shmem_pin(&bo->base);
+	/*
+	 * Pinning can only happen in response to a prime attachment request
+	 * from another driver, but dma reservation locking is already being
+	 * handled by drm_gem_pin
+	 */
+	drm_WARN_ON(obj->dev, obj->import_attach);
+	return drm_gem_shmem_object_pin(obj);
 }
 
 static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index d47b40b82b0b..e3fbcb020617 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -192,7 +192,13 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	/*
+	 * Pinning can only happen in response to a prime attachment request
+	 * from another driver, but dma reservation locking is already being
+	 * handled by drm_gem_pin
+	 */
+	drm_WARN_ON(obj->dev, obj->import_attach);
+	return drm_gem_shmem_object_pin(obj);
 }
 
 static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
-- 
2.44.0

