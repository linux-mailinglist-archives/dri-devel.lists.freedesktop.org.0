Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154E78A0AA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028E510E1EC;
	Sun, 27 Aug 2023 17:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC4C10E1D8;
 Sun, 27 Aug 2023 17:56:12 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C9C3066072AA;
 Sun, 27 Aug 2023 18:56:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158971;
 bh=2p4cHgA5Rx3A3NQCkFX1jrZwlzZfozBw87OZzukNw+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jftUNFCa8Ei+fwTjpJd10zv1K/ITAyEDxBz4PtwU5RmQz1WqV5Zlmi7lL87/rxTYH
 ksaywQMhubqu3GmvBESOvFEsAOCvO9gsVSWycZm1F8BDV83hj7trHIncywLjrgL6gT
 uNZbQM/L/WwghJX3C2sPCJMjFRprEFHUShIfAjLB9laxhngaAShQVV4wt2Vp4nx0CF
 og+SGzxPDU1U93IsskKI/c4FDwWZ8PHjquX34Z0TTFQQWFWi+CeZKPagI5633k4inw
 3ZgJrpgPTMX3LN37qOfYRhdhuK5X0BKMG8EZExSRtCVibamcLTs73+99IYYPC9BJNp
 85c5OFX/JD7Cg==
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 12/23] drm/shmem-helper: Add and use pages_pin_count
Date: Sun, 27 Aug 2023 20:54:38 +0300
Message-ID: <20230827175449.1766701-13-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add separate pages_pin_count for tracking of whether drm-shmem pages are
moveable or not. With the addition of memory shrinker support to drm-shmem,
the pages_use_count will no longer determine whether pages are hard-pinned
in memory, but whether pages exit and are soft-pinned (and could be swapped
out). The pages_pin_count > 1 will hard-pin pages in memory.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 22 +++++++++++++++++-----
 include/drm/drm_gem_shmem_helper.h     | 10 ++++++++++
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d545d3d227d7..1a7e5c332fd8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -234,14 +234,22 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
+	if (kref_get_unless_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = drm_gem_shmem_get_pages_locked(shmem);
+	if (!ret)
+		kref_init(&shmem->pages_pin_count);
 
 	return ret;
 }
 
-static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_kref_unpin_pages(struct kref *kref)
 {
-	dma_resv_assert_held(shmem->base.resv);
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = container_of(kref, struct drm_gem_shmem_object,
+			     pages_pin_count);
 
 	drm_gem_shmem_put_pages_locked(shmem);
 }
@@ -263,6 +271,9 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (kref_get_unless_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
@@ -286,9 +297,10 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	dma_resv_lock(shmem->base.resv, NULL);
-	drm_gem_shmem_unpin_locked(shmem);
-	dma_resv_unlock(shmem->base.resv);
+	if (kref_put_dma_resv(&shmem->pages_pin_count,
+			      drm_gem_shmem_kref_unpin_pages,
+			      obj->resv, NULL))
+		dma_resv_unlock(obj->resv);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
 
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index ec2d8b24e3cf..afb7cd671e2a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -39,6 +39,16 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int pages_use_count;
 
+	/**
+	 * @pages_pin_count:
+	 *
+	 * Reference count on the pinned pages table.
+	 * The pages allowed to be evicted and purged by memory
+	 * shrinker only when the count is zero, otherwise pages
+	 * are hard-pinned in memory.
+	 */
+	struct kref pages_pin_count;
+
 	/**
 	 * @madv: State for madvise
 	 *
-- 
2.41.0

