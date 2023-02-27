Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B66696A3B14
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 07:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FF910E2B8;
	Mon, 27 Feb 2023 06:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6F10E1A6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 06:03:14 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D67176602E52;
 Mon, 27 Feb 2023 06:03:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677477793;
 bh=kSakoXUglyl/y87Gkd3ABWuXpWvJ9Z8kIhJnjOMedVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AwsZeqDin8Oo3gx+Qlpbw40+FTFZK+yD1pQmpfxYAmt8n1rpnUPvU2xatDZGBLhkM
 0Fj8jOdOmkHqE5CwwVrNUONXXOGLm/DLoa8QAFLZJB+jr/eOy1VH02B9WKX6gDjbGQ
 hiWivZTrUdMD/Qtxp/+7fESKwd3juw1YK1FEu89RBbvTUUFHg6smG6U2JGmlOMeSH8
 umntaAU/xGVCxZAYk8rJcHarn9Z2DZOFtMS10p9mSmSRaDjlsjFTf1Xf6hJu9U2y2r
 T4L85TyRjZDKIFZEtHeTXdiMu3HDrxsZpio6gDePBHWa3zF7RtnM3p1XQ0KQ3T+j3r
 hXpPPzH9ZcmXA==
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
Subject: [PATCH v11 06/10] drm/shmem-helper: Remove obsoleted is_iomem test
Date: Mon, 27 Feb 2023 09:02:15 +0300
Message-Id: <20230227060219.904986-7-dmitry.osipenko@collabora.com>
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
index 56de12bb28b1..ba1db7c5659c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -409,12 +409,6 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 
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

