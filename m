Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E96B8893
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 03:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C358A10E166;
	Tue, 14 Mar 2023 02:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DDC10E6D7;
 Tue, 14 Mar 2023 02:28:21 +0000 (UTC)
Received: from workpc.. (109-252-120-116.nat.spd-mgts.ru [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 66DB0660308E;
 Tue, 14 Mar 2023 02:28:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678760900;
 bh=/0B/Gvt+XzcmXa2dz3mV2+2TZchur7pJD1BN8+9L7Ww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cpi3l88gdptoP9z5juaEOv+1FTJ7gU6LGZAHCOwCugrokhKjeMpXb9dOIcleQMSYV
 RuCOjdpo9uBHBizvCMijcCCS784Jzi7Mb7uwtx3p9lQUt5+Ar1Z3EV2uGcWX/8uvTy
 5XXn/AX1HU4Q5QX7u573aEmIKsuIpc05HM4vE7Lane6epewwDtkaA9G3JPrRzy10I4
 2qSHI0sLJAZB6J7S5dFe9TiwOn46zIJFE1UQxHvnWsZoxMdu305g2QYR4OCKT6jTZo
 T8JFtem3YNViRYMiPMfG7Cv32AdanwD/UoK7GwsLCBYXZUpAvzLJq74V7EfjUMrthV
 hKSNeZSelh6hQ==
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
Subject: [PATCH v13 07/10] drm/shmem-helper: Remove obsoleted is_iomem test
Date: Tue, 14 Mar 2023 05:26:56 +0300
Message-Id: <20230314022659.1816246-8-dmitry.osipenko@collabora.com>
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

Everything that uses the mapped buffer should by agnostic to is_iomem.
The only reason for the is_iomem test is is that we're setting shmem->vaddr
to the returned map->vaddr. Now that the shmem->vaddr code is gone, remove
the obsoleted is_iomem test to clean up the code.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a02377a5131b..9e94652a141c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -432,12 +432,6 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
-		if (!ret) {
-			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
-				dma_buf_vunmap(obj->import_attach->dmabuf, map);
-				return -EIO;
-			}
-		}
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
-- 
2.39.2

