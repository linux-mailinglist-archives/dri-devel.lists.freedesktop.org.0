Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D2B6A3B0E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 07:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF210E177;
	Mon, 27 Feb 2023 06:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19710E177
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 06:03:09 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DF9986602CEE;
 Mon, 27 Feb 2023 06:03:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677477788;
 bh=RC/OqRUY9IcjI/95DJDJLW/5aJlYWOkRZhNC1rLGKS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TRexFYfMG4ozQRYEkKuKKl4j2/SOF9MjJmwjYY/nKYIv2bwoUt5mNbFbXUBsXiDOU
 53oOY+6zaBM4wPHqfn81wHEjHndc2AjHuTaGOxJe7TE4kJaJ3CX/6TFrRw3cf4fvne
 sp/CZh9Abu+Jd/PBiQYPoq4bbh+36m04lVWlp1/B9JTaRL0iNdJFsgoRVaLziCl4af
 gmvtA0Yju0aAAxuOtbewTWfnJ0NWZfmPFWlZMelaq0JZK9TorFNHbEXqcOe7CGfZn6
 Jqe9zrV86YWXgM4sUjKaa4P/dsfk8EpQN48FWD1VaS4fVnxtjusK8Qf2azcHezB7K3
 r+vbvELY/0GYw==
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
Subject: [PATCH v11 03/10] drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap
 to use pin/unpin
Date: Mon, 27 Feb 2023 09:02:12 +0300
Message-Id: <20230227060219.904986-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227060219.904986-1-dmitry.osipenko@collabora.com>
References: <20230227060219.904986-1-dmitry.osipenko@collabora.com>
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
index 97b40676bdfa..2b1eef335bf6 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -357,7 +357,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages(shmem);
+		ret = drm_gem_shmem_pin(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -380,7 +380,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
@@ -417,7 +417,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages(shmem);
+		drm_gem_shmem_unpin(shmem);
 	}
 
 	shmem->vaddr = NULL;
-- 
2.39.2

