Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A69B4837
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 12:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132A110E630;
	Tue, 29 Oct 2024 11:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d8ANdNQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C4510E630
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 11:24:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 494725C5B59;
 Tue, 29 Oct 2024 11:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1AEC4CEE3;
 Tue, 29 Oct 2024 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730201094;
 bh=jIWGiu86I9tdXQhkhV8+srxBOHqcwMnyFOpLP5Qz8dw=;
 h=From:Date:Subject:To:Cc:From;
 b=d8ANdNQd6t/M1XAzOxB96oltciCJj94k6NWJ7cQi8FwGAEUpPDTPrvlZgG3wizdJL
 1X0OGykFgTLBEurvnlYw+P5gLydUvoHeRh1wC3IcDyJPx6O2m510/chrxrFau13pVx
 ultLHjcYUsy6XYR2A2Vfx4XRaiDYbqkrU3Qy/QqOWxrgTP+uFUZYEem4XBDsSlniCZ
 ZdozpNpsqKnH5+oumaRVdnmIExItPz5ptcSb5LPdDUSF6J0Jpdo7fsYP0U5rghXM+S
 6YWTa07Jg4YwiQ0GrGivE3E7ztPx1HWBzj+l/RBYvGHm3mTtGoQIQC0YHWunQXiKfZ
 z/z9N/Dt5DMlA==
From: matthias.bgg@kernel.org
Date: Tue, 29 Oct 2024 12:24:29 +0100
Subject: [PATCH v2] drm/v3d: Drop allocation of object without mountpoint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v3d-v2-1-c0d3dd328d1b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAO3FIGcC/1WMQQ6CMBBFr0JmbU07UBFX3oOwQGaASYSa1jQY0
 rtb2bl8P/+9HQJ74QC3YgfPUYK4NQOeChjmfp1YCWUG1FgZjVcVS1KG0FYXpgaphvx8eR5lOyp
 tl3mW8Hb+c0Sj+a3/fjTKqEbXD+bSWqbxPi29PM+DW6BLKX0BORLU45YAAAA=
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
Changes in v2:
- Fix indentation
- Link to v1: https://lore.kernel.org/r/20241028-v3d-v1-1-907bee355edf@gmail.com
---
 drivers/gpu/drm/v3d/v3d_bo.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 7055f7c7bcfe5700aee10b09ecc0005197323b01..73ab7dd31b17b249b7688dcc9833fd161211b6d9 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -157,13 +157,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	struct v3d_bo *bo;
 	int ret;
 
-	/* Let the user opt out of allocating the BOs with THP */
-	if (v3d->gemfs)
-		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
-							  v3d->gemfs);
-	else
-		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
-
+	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
+						  v3d->gemfs);
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);

---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241028-v3d-1d2546ed92d7

Best regards,
-- 
Matthias Brugger <matthias.bgg@gmail.com>

