Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5FF9B337C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 15:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B81C89A5C;
	Mon, 28 Oct 2024 14:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZxXeHwfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C8F89A5C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 14:27:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 670D45C5B69;
 Mon, 28 Oct 2024 14:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3EDC4CEE7;
 Mon, 28 Oct 2024 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730125665;
 bh=vPRVwLhHIwRTOejlqCZqrFuY/KffhaL7NLIdYAyf3m4=;
 h=From:Date:Subject:To:Cc:From;
 b=ZxXeHwfpkEGot1NTvz1trp6my64HDIMQFFaqjCuVGji/g6tG6PmILdyd6HpB89UJc
 PnRbozbTtT64jypjblP+tbMYWZGM/mls4ceozq3uyXVDGSaKKNeB5w/ctsd3yJ62zu
 /0jzPvRw1qmUwXIcYpjtInHZdgtCKwlBuEaBTh+y0O7wN0uvhYdq5N6Jqy1zjXDkWe
 B7wrTeTwPvpCmgwjJZJqtOzTevqGPUZOjPfr8GUt5MdJjgZOA+Wvr00tH8aHrIP+zm
 NqMsR+TMmVCva9tyo6RJAOlYoc4NI16QTbim4NmdhQWKOAjU2biToMCc9mDybCC+tT
 l7yk5WEkXjORw==
From: matthias.bgg@kernel.org
Date: Mon, 28 Oct 2024 15:27:17 +0100
Subject: [PATCH] drm/v3d: Drop allocation of object without mountpoint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-v3d-v1-1-907bee355edf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAESfH2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyML3TLjFF3DFCNTE7PUFEujFHMloMqCotS0zAqwKdGxtbUAJ+CpslU
 AAAA=
X-Change-ID: 20241028-v3d-1d2546ed92d7
To: Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.14.2
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Function drm_gem_shmem_create_with_mnt() creates an object
without using the mountpoint if gemfs is NULL.

Drop the else branch calling drm_gem_shmem_create().

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 7055f7c7bcfe5700aee10b09ecc0005197323b01..f6df9e0947b6ee06043cdbb42c4f98a71bdeba4d 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -157,13 +157,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	struct v3d_bo *bo;
 	int ret;
 
-	/* Let the user opt out of allocating the BOs with THP */
-	if (v3d->gemfs)
-		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
+	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
 							  v3d->gemfs);
-	else
-		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
-
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);

---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241028-v3d-1d2546ed92d7

Best regards,
-- 
Matthias Brugger <matthias.bgg@gmail.com>

