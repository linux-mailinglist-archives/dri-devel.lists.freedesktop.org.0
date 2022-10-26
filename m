Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE260EBD1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 00:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CA310E5AC;
	Wed, 26 Oct 2022 22:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16B10E5AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 22:47:23 +0000 (UTC)
Received: from dimapc.. (109-252-112-196.nat.spd-mgts.ru [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B449C66028B1;
 Wed, 26 Oct 2022 23:47:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666824442;
 bh=1PIO06hn7jCRpnGP0u+Jtd9+O0JPNXdkS3SYQoY8CMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SqNESA2fcICoaDUbmdf5nDit5oNiPedlCm15j7wjtZAE/3+DUBjfnbL73vcx/eEU5
 eFj1ZJ/KvxMyF1SZsTcOPw0mo15AFs3pMncShRhhR/oJwsFn61AvPHHg3AxCZ8wiLX
 6QnMb1rz1B5nXO6GLajXChPmIZA2InFfx1zDeCigGMlI12c+IvqLpCaa4B4M944DYb
 Hoc6Ml+tXAnDOXOF20hDjKWzBPXAekYgqoD/c2Ct2uI6T5QaxuPsUzSCGIseNXoKJF
 dOIhgKd1zvMVMUUprVNhanMOfV2dbbaS7Q4jsbj00Md5VXmOMvNwVHEphZzH2AHUaZ
 Tot9HZllpEOUQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 noralf@tronnes.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v1 2/2] drm/gem: Check whether object is NULL in
 drm_gem_vunmap()
Date: Thu, 27 Oct 2022 01:46:40 +0300
Message-Id: <20221026224640.7542-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
References: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_vunmap() will crash with a NULL dereference if the passed
object pointer is NULL. It wasn't a problem before we added the locking
support to drm_gem_vunmap function because the mapping argument was always
NULL together with the object. Make drm_gem_vunmap() functions to handle
the NULL pointers better.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/dri-devel/Y1kFEGxT8MVlf32V@kili/
Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b8db675e7fb5..ee0a246ff4ac 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1175,11 +1175,11 @@ EXPORT_SYMBOL(drm_gem_vmap);
 
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
-	dma_resv_assert_held(obj->resv);
-
-	if (iosys_map_is_null(map))
+	if (!obj || iosys_map_is_null(map))
 		return;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (obj->funcs->vunmap)
 		obj->funcs->vunmap(obj, map);
 
@@ -1202,6 +1202,9 @@ EXPORT_SYMBOL(drm_gem_vmap_unlocked);
 
 void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
 {
+	if (!obj || iosys_map_is_null(map))
+		return;
+
 	dma_resv_lock(obj->resv, NULL);
 	drm_gem_vunmap(obj, map);
 	dma_resv_unlock(obj->resv);
-- 
2.37.3

