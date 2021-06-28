Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7CD3B6A3D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 23:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA1B6E595;
	Mon, 28 Jun 2021 21:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD3E6E598;
 Mon, 28 Jun 2021 21:21:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF52361D0B;
 Mon, 28 Jun 2021 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624915284;
 bh=cwwtqavFK7tU7JXzqiqwlEYlXq2bfP6ekDHIVIt8nIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EKkOWJ6dqG837vdtnS3J2t3k575q4aWV/DyPo0qug3DS8T8oU6kMyVuzXrc5IfzKx
 qzegfCLvGfFnS7dxRABc4r7FvIzt+CK4cKkocttmPnt33GOSf6AMUjvT0jkVJWNxIm
 Sdc7hW8MB7GTAHOnH+/qnJGT39uRRGiwNjjXAS+HCbaYXcZeAFlvY/Hw8k1V1J3j9E
 OcZb6xa/xKL38bdq1ksN3dv45RWfjeQMjdXEZ4W94W613wkwwgQAU8VTTIqs5S5LZW
 ViAuRc92WRjDpX4eqIjOv5S1qryRD3D0LicUVOKJzdygBQ7cH3Mp1ZWy+H8BGWvs9N
 mIgRu6thocDwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 2/2] drm/nouveau: fix dma_address check for
 CPU/GPU sync
Date: Mon, 28 Jun 2021 17:21:21 -0400
Message-Id: <20210628212121.43749-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628212121.43749-1-sashal@kernel.org>
References: <20210628212121.43749-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

[ Upstream commit d330099115597bbc238d6758a4930e72b49ea9ba ]

AGP for example doesn't have a dma_address array.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210614110517.1624-1-christian.koenig@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 78f520d05de9..58c310930bf2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -458,7 +458,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 	struct ttm_dma_tt *ttm_dma = (struct ttm_dma_tt *)nvbo->bo.ttm;
 	int i;
 
-	if (!ttm_dma)
+	if (!ttm_dma || !ttm_dma->dma_address)
 		return;
 
 	/* Don't waste time looping if the object is coherent */
@@ -478,7 +478,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 	struct ttm_dma_tt *ttm_dma = (struct ttm_dma_tt *)nvbo->bo.ttm;
 	int i;
 
-	if (!ttm_dma)
+	if (!ttm_dma || !ttm_dma->dma_address)
 		return;
 
 	/* Don't waste time looping if the object is coherent */
-- 
2.30.2

