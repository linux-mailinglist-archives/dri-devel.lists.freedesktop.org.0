Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25601630942
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53210E256;
	Sat, 19 Nov 2022 02:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9310E255;
 Sat, 19 Nov 2022 02:12:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DF2E62831;
 Sat, 19 Nov 2022 02:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04BAC433C1;
 Sat, 19 Nov 2022 02:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668823938;
 bh=COaiIcgt9EIbEcLlc1GttK4dQ8KxbQg4sPoMcQWhQJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RXV/OVLpHcpRb5kf1+OR28S8USUaKjDwmhnwCaV20no+fzM75v12gdumnNZWJpa+Q
 HIsbQ8/XDsazo6K3czTf/bTzJcCAxzinydHZFJFyiFzEBbitNaBK1xeMxtxdFXKDTN
 G1HlLXvQ7vRj7x5Sb0Spk/zROCed7AgZlQLZpeQ8MZFKicRIzSQ8qyaffwIFOYcOiJ
 Rw4bQSPcyaDeYzS++RrT6QxBgLRBxtvO/mTUSoaz9g1aCQfxR9B9Cs6hoo/WXugM/7
 pIVAZoC35/zMropwtR8PITz5W4YQCdbZp9rKwqOc+9npyp8ifaFk9F/xw9zN6UWTtr
 yr8RuHleHoChA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 27/44] drm/amdgpu: Fix the lpfn checking condition
 in drm buddy
Date: Fri, 18 Nov 2022 21:11:07 -0500
Message-Id: <20221119021124.1773699-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com,
 Arunpravin.PaneerSelvam@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Ma Jun <Jun.Ma2@amd.com>, nirmoy.das@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ma Jun <Jun.Ma2@amd.com>

[ Upstream commit e0b26b9482461e9528552f54fa662c2269f75b3f ]

Because the value of man->size is changed during suspend/resume process,
use mgr->mm.size instead of man->size here for lpfn checking.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220914125331.2467162-1-Jun.Ma2@amd.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 28ec5f8ac1c1..27159f1d112e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -435,7 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
-	if (fpfn || lpfn != man->size)
+	if (fpfn || lpfn != mgr->mm.size)
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-- 
2.35.1

