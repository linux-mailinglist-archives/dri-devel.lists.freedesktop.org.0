Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1987DB027
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65B10E1E9;
	Sun, 29 Oct 2023 23:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9385810E1D5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:02:47 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1ACE4660739C;
 Sun, 29 Oct 2023 23:02:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620566;
 bh=0ZBUE0rLGCchFfVCmY9eX9kO1j9q0pZNyfBn0+Aeqt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nSliMwpu82AbnU5e+erzpzW60WYrd2iWlEbQtA2FCaagAKLdJD3YIHk/zisDs1vgJ
 0O2O2/RaQHJTtLvzNmPsarvVO/A9Yzxm+I3fda8P3iAOnXMkLjp0sHGxqaC1W16sZr
 e1aqdT0qI7jyhynFXkco2NGM+pm0hDW/taXH9aQGapSbjNYZ1KSruZzttU5ktUlYM+
 iGJwoQzfBG2bRbMUYvocEhtEu11qu65pTHYR+DC5jKFCJHNs4+EwKFFHeIj8U2L5XP
 /w86l90cXCAOj0u7Qq+eZrUhbIdPkfbIiqaqivGyLkByUh5oUay2uP6xTMvD0NZOlQ
 9fqz9i6ZUI4Ng==
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
Subject: [PATCH v18 13/26] drm/shmem-helper: Add drm_gem_shmem_put_pages()
Date: Mon, 30 Oct 2023 02:01:52 +0300
Message-ID: <20231029230205.93277-14-dmitry.osipenko@collabora.com>
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

We're going to move away from having implicit get_pages() done by
get_pages_sgt() to ease simplify refcnt handling. Drivers will manage
get/put_pages() by themselves. Add drm_gem_shmem_put_pages().

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 20 ++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index ca6f422c0dfc..f371ebc6f85c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -217,6 +217,7 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
  * @shmem: shmem GEM object
  *
  * This function decreases the use count and puts the backing pages when use drops to zero.
+ * Caller must hold GEM's reservation lock.
  */
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 {
@@ -227,6 +228,25 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
+/*
+ * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
+ * @shmem: shmem GEM object
+ *
+ * This function decreases the use count and puts the backing pages when use drops to zero.
+ * It's unlocked version of drm_gem_shmem_put_pages_locked(), caller must not hold
+ * GEM's reservation lock.
+ */
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+{
+	if (refcount_dec_not_one(&shmem->pages_use_count))
+		return;
+
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_put_pages_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
+
 /*
  * drm_gem_shmem_get_pages - Increase use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 45cd293e10a4..6aad3e27d7ee 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -111,6 +111,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
 int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
-- 
2.41.0

