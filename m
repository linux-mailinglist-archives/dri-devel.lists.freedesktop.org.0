Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AEC6B888B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 03:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE5C10E6D2;
	Tue, 14 Mar 2023 02:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A97110E6CB;
 Tue, 14 Mar 2023 02:28:13 +0000 (UTC)
Received: from workpc.. (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 513866603009;
 Tue, 14 Mar 2023 02:28:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678760892;
 bh=MV/O+8pOyXVa+dmpov2mAO88pJCXCdMvjM1OMaUHA+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KTuTyVxexWP2uC9Mtr6VxTzkBmKB8v2DQWKqDb57KRkNvR1E6TGcHekXMM5M+BiA5
 Q8sQYHgBtZHdsAK1pUN/cVjVADLA3BAw9dW4KS35K8sx3ruZzmDm/CqFJk8nLvl0uB
 6xYeUnUYxySBmoQGghpN2wkq3CW7mNALyRSqIpFNCjqHoGNgoHzrl6s7a3XtIBuR5B
 yV20Gro0At/9hn3NxbvgE9m8sDi6nWvLD/4oYFSekLfNKtVy7GgODsUb5lrnbZ3h/l
 uV3WQih/cFHabJeb5iZ+b6XJ1SdJEg6ddLQ0IUERnN2+LpeVHSXGu+2wexR3dzFrtp
 fwq+bpUGv04lw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v13 03/10] drm/shmem-helper: Add pages_pin_count field
Date: Tue, 14 Mar 2023 05:26:52 +0300
Message-Id: <20230314022659.1816246-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314022659.1816246-1-dmitry.osipenko@collabora.com>
References: <20230314022659.1816246-1-dmitry.osipenko@collabora.com>
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

And new pages_pin_count field to struct drm_gem_shmem_object that will
determine whether pages are evictable by memory shrinker. The pages will
be evictable only when pages_pin_count=0. This patch prepares code for
addition of the memory shrinker that will utilize the new field.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++++
 include/drm/drm_gem_shmem_helper.h     | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4da9c9c39b9a..81d61791f874 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -277,6 +277,8 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	ret = drm_gem_shmem_get_pages(shmem);
+	if (!ret)
+		shmem->pages_pin_count++;
 
 	return ret;
 }
@@ -289,7 +291,12 @@ static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_pin_count))
+		return;
+
 	drm_gem_shmem_put_pages(shmem);
+
+	shmem->pages_pin_count--;
 }
 
 /**
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 20ddcd799df9..7d823c9fc480 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -39,6 +39,15 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int pages_use_count;
 
+	/**
+	 * @pages_pin_count:
+	 *
+	 * Reference count on the pinned pages table.
+	 * The pages allowed to be evicted by memory shrinker
+	 * only when the count is zero.
+	 */
+	unsigned int pages_pin_count;
+
 	/**
 	 * @madv: State for madvise
 	 *
-- 
2.39.2

