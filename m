Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD665623B9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A6412B03E;
	Thu, 30 Jun 2022 20:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118812B038
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:01:29 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 77BE46601970;
 Thu, 30 Jun 2022 21:01:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619288;
 bh=agNXiubhmlWUmhyiQk+T0pYhjXgAeStRlj8Az7MpTQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JuBi+bZrxnpFbtWnBwe1kxV/vDW7SljTqNoClO+PIyMibkOeIUNxMRB2m132KNaBP
 n3Knbr6COwq8PyG2Yq6gaN/76DBNUtQ2JdsUpYWoyjdZn9iemz1nzStqcMJGhigPfn
 SlEgCTCVJY4LqqHeDqnzaB1GbRKxej8WPMVpAGP8lU3ef2dqEBDln6kI/ehK/A3vip
 eroO3ZsJzzAVufygpD2ACtvqfkp5gMl8eqjShmBt/zrn64nirKyY8Oh3pSt8qNKKEW
 inHPvUNQvDUNc6WAFrr/l7G7B79aVQFud2oC+5ZV2llDA9ZDEPhFplptyeqb5gkkzs
 IZN42CPRz5gOQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 1/2] drm/shmem-helper: Add missing vunmap on error
Date: Thu, 30 Jun 2022 23:00:57 +0300
Message-Id: <20220630200058.1883506-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630200058.1883506-1-dmitry.osipenko@collabora.com>
References: <20220630200058.1883506-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vmapping of dma-buf may succeed, but DRM SHMEM rejects the IOMEM
mapping, and thus, drm_gem_shmem_vmap_locked() should unvmap the IOMEM
before erroring out.

Cc: stable@vger.kernel.org
Fixes: 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM backends")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e02991ca..904fc893c905 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -302,6 +302,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
 			if (WARN_ON(map->is_iomem)) {
+				dma_buf_vunmap(obj->import_attach->dmabuf, map);
 				ret = -EIO;
 				goto err_put_pages;
 			}
-- 
2.36.1

