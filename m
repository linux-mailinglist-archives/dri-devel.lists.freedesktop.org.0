Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8156619A7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BB410E212;
	Sun,  8 Jan 2023 21:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FA510E212
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:05:33 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 910316602D53;
 Sun,  8 Jan 2023 21:05:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673211931;
 bh=yM5EklsLIeVBROoe840u6b3fWDQRZvJbUhCX8eobLRI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M7ndZjT3ePxUGP5TzZFQUodhYen26MBCIH+b2Sf5SYIkXVKUsbJngKFISUMTqoLxq
 fnNPqafIUpxQatwe1QTgvnwzgzk92Ns13EWOnjibLB9wH5h96wk+PQ1aBzn7QlK0t9
 /GQe+Yb57/5UtShNRixe+aQ2uR0HF7V6cva+ceygZwwgRX38+fjVNXEATenaq2Pu8Q
 vgGH/vEeV04lE7Xk9hv6kw6NaHKhgbsAR9/JgovLvhQRy7m05mtWZXyRkp6cbinU5+
 hlV16TqFdJXGnZNeQYHh0xchfFOLKTM3qzMSLGaH3fU3BsXnXHjyiix2io0ZE9cQa6
 iAahvSDX79akQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v10 04/11] drm/shmem: Put booleans in the end of struct
 drm_gem_shmem_object
Date: Mon,  9 Jan 2023 00:04:38 +0300
Message-Id: <20230108210445.3948344-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
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

Group all 1-bit boolean members of struct drm_gem_shmem_object in the end
of the structure, allowing compiler to pack data better and making code to
look more consistent.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/drm/drm_gem_shmem_helper.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index a2201b2488c5..5994fed5e327 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -60,20 +60,6 @@ struct drm_gem_shmem_object {
 	 */
 	struct list_head madv_list;
 
-	/**
-	 * @pages_mark_dirty_on_put:
-	 *
-	 * Mark pages as dirty when they are put.
-	 */
-	unsigned int pages_mark_dirty_on_put    : 1;
-
-	/**
-	 * @pages_mark_accessed_on_put:
-	 *
-	 * Mark pages as accessed when they are put.
-	 */
-	unsigned int pages_mark_accessed_on_put : 1;
-
 	/**
 	 * @sgt: Scatter/gather table for imported PRIME buffers
 	 */
@@ -97,10 +83,24 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int vmap_use_count;
 
+	/**
+	 * @pages_mark_dirty_on_put:
+	 *
+	 * Mark pages as dirty when they are put.
+	 */
+	bool pages_mark_dirty_on_put : 1;
+
+	/**
+	 * @pages_mark_accessed_on_put:
+	 *
+	 * Mark pages as accessed when they are put.
+	 */
+	bool pages_mark_accessed_on_put : 1;
+
 	/**
 	 * @map_wc: map object write-combined (instead of using shmem defaults).
 	 */
-	bool map_wc;
+	bool map_wc : 1;
 };
 
 #define to_drm_gem_shmem_obj(obj) \
-- 
2.38.1

