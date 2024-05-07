Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A88BF03B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAC3112FB9;
	Tue,  7 May 2024 23:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VC51onZh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55DA112FB8;
 Tue,  7 May 2024 23:00:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D729619FA;
 Tue,  7 May 2024 23:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D6BC4AF17;
 Tue,  7 May 2024 23:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122850;
 bh=gT6vzBSmQvR8Ll0RTNNxv+i6F8qd6iJAI3Dt1+JjuTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VC51onZhbs2X7oeHCmfplte639WuEEZYS0gzp7+rYTMj5334oahDehQrtBSXQ/V9j
 7PRWt9n4zhQCHg1UzUfk90UNGSrakruH+EM1xnkoJN2CXDj2CbckxseshAeZBxBhy3
 49HYsZCLImdizwJK0EiZyOs+UnQ6fwfCC2j7UrHVq1ZlQxn7ZKr1/faxNwnfx5L9xn
 6mBXelc2knOkPo5eyaZc+r6ww9cFkX2GB0lI4ErhlpI0bNRt78vSiXAY49Lit+3SDa
 s/5tpKm3YTJezQ9SyXejBhA0bh0SI+yc2+27Tk+GPvNIKi1S09gJCZbrIp+bkAckCb
 0vUzni9aCEG0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Kuehling <felix.kuehling@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Philip.Yang@amd.com, Hongkun.Zhang@amd.com,
 Arunpravin.PaneerSelvam@amd.com, pierre-eric.pelloux-prayer@amd.com,
 Jun.Ma2@amd.com, Wang.Beyond@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 07/12] drm/amdgpu: Update BO eviction priorities
Date: Tue,  7 May 2024 19:00:09 -0400
Message-ID: <20240507230031.391436-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230031.391436-1-sashal@kernel.org>
References: <20240507230031.391436-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.90
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

From: Felix Kuehling <felix.kuehling@amd.com>

[ Upstream commit b0b13d532105e0e682d95214933bb8483a063184 ]

Make SVM BOs more likely to get evicted than other BOs. These BOs
opportunistically use available VRAM, but can fall back relatively
seamlessly to system memory. It also avoids SVM migrations evicting
other, more important BOs as they will evict other SVM allocations
first.

Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
Acked-by: Mukul Joshi <mukul.joshi@amd.com>
Tested-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index cde2fd2f71171..a5adae8b43d47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -585,6 +585,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	else
 		amdgpu_bo_placement_from_domain(bo, bp->domain);
 	if (bp->type == ttm_bo_type_kernel)
+		bo->tbo.priority = 2;
+	else if (!(bp->flags & AMDGPU_GEM_CREATE_DISCARDABLE))
 		bo->tbo.priority = 1;
 
 	if (!bp->destroy)
-- 
2.43.0

