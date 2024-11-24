Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0229D71D3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876AD10E56C;
	Sun, 24 Nov 2024 13:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Stl4n8d9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC0310E56A;
 Sun, 24 Nov 2024 13:54:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B122C5C4A31;
 Sun, 24 Nov 2024 13:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F94BC4CECC;
 Sun, 24 Nov 2024 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732456486;
 bh=s1fiOOSdlP6cScEh9i9xkl3os/I1RKVixQ9iju5HVos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Stl4n8d97kzfsLR/OslQgmxatYy0zeXPdTs7uAwLgZe+/rceBgHToVr2+JGShTSbP
 jywU+DX/ow5AfOgJ1Wxf8ZdXXcJraBrUzOWpG3O5nZUALJD/6Wc+LauTn3/4VOnGOX
 Wu6F+Mh0jtfnaOInXM++UJIXHbpVe3+6y5Y0Wib3bVtcmJDe3u1L08yPnzz1nMGbA7
 Jrz+WaylkatrwKKkET0q142jH+b8B2wMFaDDflLigkzk3caghwU6WwBYFmXBAco5Rj
 kMJ+2VWsuU8i7tHOg/u5tIALqXnU44LHmrI5y7BCVx1OMec24G1BliHp2tV6rQFhAP
 DkJUf/wWrmO/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lang Yu <lang.yu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, Frank.Min@amd.com,
 pierre-eric.pelloux-prayer@amd.com, felix.kuehling@amd.com,
 Philip.Yang@amd.com, mdaenzer@redhat.com, Arunpravin.PaneerSelvam@amd.com,
 Amaranath.Somalapuram@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 18/33] drm/amdgpu: refine error handling in
 amdgpu_ttm_tt_pin_userptr
Date: Sun, 24 Nov 2024 08:53:30 -0500
Message-ID: <20241124135410.3349976-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124135410.3349976-1-sashal@kernel.org>
References: <20241124135410.3349976-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
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

From: Lang Yu <lang.yu@amd.com>

[ Upstream commit 46186667f98fb7158c98f4ff5da62c427761ffcd ]

Free sg table when dma_map_sgtable() failed to avoid memory leak.

Signed-off-by: Lang Yu <lang.yu@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0b162928a248b..8196a8e253266 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1006,7 +1006,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
 	/* Map SG to device */
 	r = dma_map_sgtable(adev->dev, ttm->sg, direction, 0);
 	if (r)
-		goto release_sg;
+		goto release_sg_table;
 
 	/* convert SG to linear array of pages and dma addresses */
 	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
@@ -1014,6 +1014,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
 
 	return 0;
 
+release_sg_table:
+	sg_free_table(ttm->sg);
 release_sg:
 	kfree(ttm->sg);
 	ttm->sg = NULL;
-- 
2.43.0

