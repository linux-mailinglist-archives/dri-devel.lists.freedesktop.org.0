Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB75758C7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E8B10EB50;
	Fri, 15 Jul 2022 00:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EBB10F34B;
 Fri, 15 Jul 2022 00:53:35 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D2B16601A58;
 Fri, 15 Jul 2022 01:53:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657846414;
 bh=dr1tdx4u+QvM7fiw6wlWFPP0AWqXDJCr42blBc4VyZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ro35pEWIBbDVr6SddC5oV5g2IzAdYCQ3y39D9s1jFkM7smnJyAgxodZSXxxyi3By8
 vMPfDkSHreXz6dIrXY8zBhAWBr1SM9hPDKzcb1APoGPjVGznW4DbygpAPhmM4v4iqy
 kNNVNMXe48miNTWrShOswaJRdmoyXxS+0Vc5FpskaDX7p6X/PMys3epI9Nmfk8p88w
 W05tRtqheMg9fof74rfgYjOepSdS637dIAmjASMEhKQqWj6B1RlfwPWmspDEMsVozQ
 9wRaNESK5yw9FLxoEgVom8kYmxVCD9KC6cScU7I+CCyZasFjtY2KBGQMWY6R6v6p3h
 1UaDnXFpv8SQQ==
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v1 6/6] dma-buf: Remove internal lock
Date: Fri, 15 Jul 2022 03:52:44 +0300
Message-Id: <20220715005244.42198-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The internal dma-buf lock isn't needed anymore because the updated
locking specification claims that dma-buf reservation must be locked
by importers, and thus, the internal data is already protected by the
reservation lock. Remove the obsoleted internal lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 5 -----
 include/linux/dma-buf.h   | 9 ---------
 2 files changed, 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 37545ecb845a..4cc739537ebd 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -656,7 +656,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	dmabuf->file = file;
 
-	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
 
 	mutex_lock(&db_list.lock);
@@ -1459,7 +1458,6 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 		return -EINVAL;
 
 	dma_resv_lock(dmabuf->resv, NULL);
-	mutex_lock(&dmabuf->lock);
 	if (dmabuf->vmapping_counter) {
 		dmabuf->vmapping_counter++;
 		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
@@ -1479,7 +1477,6 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	*map = dmabuf->vmap_ptr;
 
 out_unlock:
-	mutex_unlock(&dmabuf->lock);
 	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
@@ -1500,13 +1497,11 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
 
 	dma_resv_lock(dmabuf->resv, NULL);
-	mutex_lock(&dmabuf->lock);
 	if (--dmabuf->vmapping_counter == 0) {
 		if (dmabuf->ops->vunmap)
 			dmabuf->ops->vunmap(dmabuf, map);
 		iosys_map_clear(&dmabuf->vmap_ptr);
 	}
-	mutex_unlock(&dmabuf->lock);
 	dma_resv_unlock(dmabuf->resv);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index da924a56d58f..abdd99042c77 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -326,15 +326,6 @@ struct dma_buf {
 	/** @ops: dma_buf_ops associated with this buffer object. */
 	const struct dma_buf_ops *ops;
 
-	/**
-	 * @lock:
-	 *
-	 * Used internally to serialize list manipulation, attach/detach and
-	 * vmap/unmap. Note that in many cases this is superseeded by
-	 * dma_resv_lock() on @resv.
-	 */
-	struct mutex lock;
-
 	/**
 	 * @vmapping_counter:
 	 *
-- 
2.36.1

