Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0B932884
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2210E74E;
	Tue, 16 Jul 2024 14:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L9fG/GSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344D10E73E;
 Tue, 16 Jul 2024 14:27:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22FE860DF7;
 Tue, 16 Jul 2024 14:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B746C4AF0F;
 Tue, 16 Jul 2024 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721140079;
 bh=hPiZBpPQPKfm8zysLlxT6NXhGRC5lcxwMo3vnGpL6WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L9fG/GSVKs49p+DnAVxPENOwYZF3xNfXSELB4f7HCVdbLiqI9vAoj7Us8WLLAQaf1
 XzIL/I38vVasnZqK2+/i3oPqAHJzX1whOxR7OVIo7RRAQfRBCUH+tp1gtSi2qSj4lP
 3+WFmHPzPeeEYhKbhsYIgmnY+1Qdt7zwR+TA9QHonMmBEws2m/kdfqf7wKKRh/lMCJ
 tHN5euwpTMIG8YUu8PlSYWZfoa2WhWEHBrKVFXjqYBQiHZhE7Y9rhE3y+s7te80/es
 haciGKcsIeKbfMRATp5gyGkVyf60+XpmPkvvtqPSi8oaFKy0FVY7H7rceIYKApgKDB
 tTgcHOdFcKy/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 14/18] drm/radeon: check bo_va->bo is non-NULL
 before using it
Date: Tue, 16 Jul 2024 10:26:49 -0400
Message-ID: <20240716142713.2712998-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142713.2712998-1-sashal@kernel.org>
References: <20240716142713.2712998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.40
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

From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

[ Upstream commit 6fb15dcbcf4f212930350eaee174bb60ed40a536 ]

The call to radeon_vm_clear_freed might clear bo_va->bo, so
we have to check it before dereferencing it.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 3fec3acdaf284..27225d1fe8d2e 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -641,7 +641,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 	if (r)
 		goto error_unlock;
 
-	if (bo_va->it.start)
+	if (bo_va->it.start && bo_va->bo)
 		r = radeon_vm_bo_update(rdev, bo_va, bo_va->bo->tbo.resource);
 
 error_unlock:
-- 
2.43.0

