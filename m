Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD6A6AB2D2
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 23:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87E810E06B;
	Sun,  5 Mar 2023 22:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8257910E062;
 Sun,  5 Mar 2023 22:11:35 +0000 (UTC)
Received: from workpc.. (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BDB686602154;
 Sun,  5 Mar 2023 22:11:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678054294;
 bh=A9/W4octTMJpwdtQTQZ+kGQ8wjAhQ4OpeboOYQ6R2gM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e9QH2DffeTGtg8nm6Stilf2msOQvAGXnBffuvVUWNnA2oR9e19ep9ixRFotz9eUPA
 kG7IRt7QNkUXQlKA9ZuNRqc0QjwrwaDkMEoxLdvGdhsxrVyqPh34sEDUbOoUw0oA0M
 nmfWi5b18hAxiOpDE2se7JxgCixXNUsrFS9NGawtCmqcKjiD+ZuJPabNBiq+UlDTkT
 JN88dGvpyDNYsqNlcF6WQU1a7gIHTcD3/AUZ6fA6vNQFSVjDX/vHQYuMRIsqiAlGCi
 JmxAlIIAl3PaJKfe69Khhl+YG+YApEBUjxTiePBLGSKKgEo9bk7Vm4Y/z//AMaBRHQ
 xPOyAuJkPF4VQ==
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
Subject: [PATCH v12 04/11] drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap
 to use pin/unpin
Date: Mon,  6 Mar 2023 01:10:04 +0300
Message-Id: <20230305221011.1404672-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
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

The vmapped pages shall be pinned in memory. Previously get/put pages were
implicitly pinning/unpinning the pages. This will no longer be the case
with addition of memory shrinker because pages_use_count>0 won't determine
whether pages are pinned anymore, while the new pages_pin_count will do
that. Switch the vmap/vunmap to use pin/unpin functions in a preparation
of addition of the memory shrinker support.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0c3abb0c2ea2..e2324e857847 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -380,7 +380,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_pin_locked(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -403,7 +403,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin_locked(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
@@ -440,7 +440,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin_locked(shmem);
 	}
 
 	shmem->vaddr = NULL;
-- 
2.39.2

