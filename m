Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8ADA72DFA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F5210E899;
	Thu, 27 Mar 2025 10:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PseHZtWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D1A10E899
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743072186;
 bh=G5NK8PCaXRHghqRMVq2tED3CStZWWwWShX3Zz+JnYFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PseHZtWNCeKScWrms4EtA3XuwAC1MRc356cLGeeV4bnM4dTOBHebg6gVrjiponVqB
 1zlJHnTLKnpqXjA/T4t7VKO9kUBj/zLhmpKrliat3MY6x1htLDhjecmOI8h+9cN1sb
 YbHcys2PqtQUfj90tIaugbR3abfQKF9IAgoEiMXarKFDBJBzKV5Lzkft2L4UIy5fvn
 snuPdL7zr/jcY9Msjo1/J6ThEAA4xb+Wikja4ZUGBO1b0j0Jp7KIlDVWa14OF7RTD3
 Lvk2kqSz5H904PtJWtqronl1vIZkqKt3mEk2M7oq9kTSRsvIjO5ewjKnrbvhYvUTB5
 8cj3jVAh9szVQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C906C17E0B9D;
 Thu, 27 Mar 2025 11:43:05 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 2/3] accel/ivpu:
 s/drm_gem_shmem_v[un]map/drm_gem_shmem_v[un]map_locked/
Date: Thu, 27 Mar 2025 11:42:59 +0100
Message-ID: <20250327104300.1982058-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250327104300.1982058-1-boris.brezillon@collabora.com>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked
functions") suffixed drm_gem_shmem_v[un]map with _locked to reflect
the fact these functions must be called with the GEM resv lock held,
but accel drivers were left behind.

Fixes: 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked functions")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/accel/ivpu/ivpu_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 09c9c5256af5..212d21ad2bbd 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -362,7 +362,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 
 	if (flags & DRM_IVPU_BO_MAPPABLE) {
 		dma_resv_lock(bo->base.base.resv, NULL);
-		ret = drm_gem_shmem_vmap(&bo->base, &map);
+		ret = drm_gem_shmem_vmap_locked(&bo->base, &map);
 		dma_resv_unlock(bo->base.base.resv);
 
 		if (ret)
@@ -387,7 +387,7 @@ void ivpu_bo_free(struct ivpu_bo *bo)
 
 	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
 		dma_resv_lock(bo->base.base.resv, NULL);
-		drm_gem_shmem_vunmap(&bo->base, &map);
+		drm_gem_shmem_vunmap_locked(&bo->base, &map);
 		dma_resv_unlock(bo->base.base.resv);
 	}
 
-- 
2.48.1

