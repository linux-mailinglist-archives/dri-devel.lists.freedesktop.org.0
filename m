Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3655F180
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 00:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA89113816;
	Tue, 28 Jun 2022 22:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8522113816
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 22:43:02 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E10D366018E4;
 Tue, 28 Jun 2022 23:43:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656456181;
 bh=Dw7iC/q3nxSSq5L1MlLv+N8MHDogF5hlDDRhQ47A9vU=;
 h=From:To:Cc:Subject:Date:From;
 b=XWx3LKXlg188ffK//A1UH9I3eQqMODA9yaTZ1lU8lWBxLgFPL8JTEzvWQtn+duTWx
 qx+zjS6yxoTMAQtM+VkQcPzL9nrHabxOeQWMWSFMtJ+uWj09omOc2+Mk+09OqB/Jo7
 9vBShAE7tXkozhwj96yaTnCUl1T3Zrok8EAUIetn/483wq4KcmjfGGR3hnnqPWqvmM
 4B1jK/EGQmxPM4lN2i65P3FXHLNnF/WaLWPwcyIQROf3jPmO++5/gkmBLTYQEm3mYI
 7taSkRnvuQqV6rWYvoeJYBvYjwFxp3oohJgL+qnaAEsv/UGEn/JcAg6kDkJk3129pX
 ctH0Zw+IgngBQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1] drm/tegra: Fix vmapping of prime buffers
Date: Wed, 29 Jun 2022 01:42:39 +0300
Message-Id: <20220628224239.578324-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
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
Cc: linux-tegra@vger.kernel.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code assumes that Tegra GEM is permanently vmapped, which is not
true for the scattered buffers. After converting Tegra video decoder
driver to V4L API, we're now getting a BUG_ON from dma-buf core on playing
video using libvdpau-tegra on T30+ because tegra_gem_prime_vmap() sets
vaddr to NULL. Older pre-V4L video decoder driver wasn't vmapping dma-bufs.
Fix it by actually vmapping the exported GEMs.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/tegra/gem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 7c7dd84e6db8..81991090adcc 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -704,14 +704,23 @@ static int tegra_gem_prime_vmap(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct drm_gem_object *gem = buf->priv;
 	struct tegra_bo *bo = to_tegra_bo(gem);
+	void *vaddr;
 
-	iosys_map_set_vaddr(map, bo->vaddr);
+	vaddr = tegra_bo_mmap(&bo->base);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
+	iosys_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
 
 static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct iosys_map *map)
 {
+	struct drm_gem_object *gem = buf->priv;
+	struct tegra_bo *bo = to_tegra_bo(gem);
+
+	tegra_bo_munmap(&bo->base, map->vaddr);
 }
 
 static const struct dma_buf_ops tegra_gem_prime_dmabuf_ops = {
-- 
2.36.1

