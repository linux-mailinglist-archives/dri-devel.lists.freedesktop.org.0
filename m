Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924774FC737
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A54610E3C0;
	Mon, 11 Apr 2022 22:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C5210E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:00:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id EC8301F43C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649714441;
 bh=qFt9ZOB1/K3f6j95e83uUTQsFAU8GObxCwVCXrvjk/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LREqFUxnsMN90DJgwmRZ7u6JNL5myGlW9jIG6varDOlXyjxoaIFSYimM5MxRzygAs
 O5Ad1UoO1cqMO/unKfXTrk0zWOzrvi7HFGS6s9j7NcVoWJRsglcuvuR6VnXn72aTv0
 i3GQ9LjparoI7L4PfLG7Wr7/lDzzuNBKUQkT88gyQUKvIOVNoGX+ShAUb/as4Hjofr
 cqOagGFMIymj9mocJaqElqqKfJOfxJnRFRxEx4iZwdggA+c5OLZiXw9VmKlqwvtU+G
 Mfi/xgnauguU7GFoNm3sbg1XfVkaAwLnwwIrUiIfcYMWJRVTiz/GIZfJaXlZPIZA1w
 LitM6cQ0nyYgg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 15/15] drm/shmem-helper: Remove drm_gem_shmem_purge()
Date: Tue, 12 Apr 2022 00:59:37 +0300
Message-Id: <20220411215937.281655-16-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
References: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_shmem_purge() was added back in 2019 and never had a user
since then. GEM's purging is now managed by the generic shrinker and
only the "locked" variant of the function is wanted. Remove the obsoleted
function.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 11 -----------
 include/drm/drm_gem_shmem_helper.h     |  2 --
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8e31056575e3..89c64053247c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -992,17 +992,6 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
 
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
-{
-	if (!dma_resv_trylock(shmem->base.resv))
-		return false;
-	drm_gem_shmem_purge_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
-
-	return true;
-}
-EXPORT_SYMBOL(drm_gem_shmem_purge);
-
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 7284335ea2c9..197d08452974 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -179,8 +179,6 @@ int drm_gem_shmem_swap_in_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_swap_in_locked(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_evict_locked(struct drm_gem_shmem_object *shmem);
-
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
-- 
2.35.1

