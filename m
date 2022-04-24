Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87450D479
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCC1112406;
	Sun, 24 Apr 2022 19:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6FC10FEB9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 423BF1F44DB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650827107;
 bh=v+jC0YBB4Q1BHtuN+QSR1N9z8+FgGIDkfR2SgOwOH1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dQZUF6UHZhc4aQV6I+8YCzzf0nwtfM6G8rjdEz0XemNXO4l75m8rPbvP1/IEK6R7u
 cizJD0xfpYI7U4Ifc+ExN+4gRqDGF7qUio413Ar1LLCsMfl13thRZs5Ml9FSqfAt9p
 Mtu13Nlart7C7CJj+ZNLnBSc5L6i79QRSAH9RZCtgfxRQ0N7nURFSRkW2iL81gMGqg
 x00/HmwsoMwKVcoHg93sBPHx55uRCpNhVsssGAorv6/CexZbF1/olfxB1DZmERhdOl
 +EQuMF0k9ACRM6Afw5eyMoFVkTyT38owkQwoXYwVQfMSudBjb1TiRovoPmJqnNf+AH
 ZzYkUTyZMl6BQ==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 16/17] drm/shmem-helper: Make drm_gem_shmem_is_purgeable()
 private
Date: Sun, 24 Apr 2022 22:04:23 +0300
Message-Id: <20220424190424.540501-17-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panfrost driver was the only user of the drm_gem_shmem_is_purgeable()
helper. Panfrost driver was converted to use new generic memory shrinker
and the helper doesn't have external users anymore, hence make it private
to the drm_gem_shmem_helper.c to keep the code clean.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++++-
 include/drm/drm_gem_shmem_helper.h     | 7 -------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 7ec5f8002f68..045921ad4795 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -169,6 +169,13 @@ static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
 		!shmem->base.import_attach && shmem->sgt && !shmem->evicted;
 }
 
+static bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
+{
+	return (shmem->madv > 0) && !shmem->purge_disable_count &&
+		!shmem->vmap_use_count && !shmem->base.dma_buf &&
+		!shmem->base.import_attach && shmem->sgt;
+}
+
 static void
 drm_gem_shmem_update_pages_state_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -182,7 +189,7 @@ drm_gem_shmem_update_pages_state_locked(struct drm_gem_shmem_object *shmem)
 
 	mutex_lock(&gem_shrinker->lock);
 
-	if (drm_gem_shmem_is_purgeable(shmem) && !shmem->purge_disable_count) {
+	if (drm_gem_shmem_is_purgeable(shmem)) {
 		drm_gem_shmem_add_pages_to_shrinker(shmem);
 		list_move_tail(&shmem->madv_list, &gem_shrinker->lru_purgeable);
 	} else if (drm_gem_shmem_is_evictable(shmem)) {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5b351933c293..972687bf9717 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -194,13 +194,6 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
 int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_set_purgeable_and_evictable(struct drm_gem_shmem_object *shmem);
 
-static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
-{
-	return (shmem->madv > 0) &&
-		!shmem->vmap_use_count && shmem->sgt &&
-		!shmem->base.dma_buf && !shmem->base.import_attach;
-}
-
 int drm_gem_shmem_swap_in_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
-- 
2.35.1

