Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9408A7182AC
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD5C10E4E4;
	Wed, 31 May 2023 13:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3549C10E4E4;
 Wed, 31 May 2023 13:45:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD32B62C18;
 Wed, 31 May 2023 13:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8573C4339B;
 Wed, 31 May 2023 13:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685540700;
 bh=tJs0BBXyyksiBCh7KXNkCxTBnrB5Hznrx5+VzKAsJPs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ah9atT6ug8gBVmXLAoD775SvgLWci2L78g8BAgw2XiU66BcvNEcTIcWob+xexkuGC
 c+NktpbO+ArDMMC8jXSw68z8J7z4DxxR53EZ21F0S1v8ag4z2UzeinrEM2usmE/rCj
 YNEteK+mRN4IrSXB8oh8LauZB6ESTuL7lo+923wjrUnR5l/nqu9jzEPN7NFQX9plrC
 2pAq4DE4/a+vYZtENCmWpfEIx1OFl7z+rDEAypX69pV9C6Ku9PoV3VfpViDGPIJjiW
 B4Isfwzdf6Bmy1il3TcCXYI8PO1Oq7Lrze7TbVj9Rwq0byZdYqVTfb6qHRDdmxtjoC
 sWUcXHxYtEwww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 21/21] drm:amd:amdgpu: Fix missing buffer object
 unlock in failure path
Date: Wed, 31 May 2023 09:44:14 -0400
Message-Id: <20230531134415.3384458-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134415.3384458-1-sashal@kernel.org>
References: <20230531134415.3384458-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Victor.Zhao@amd.com, Jack.Gui@amd.com,
 dri-devel@lists.freedesktop.org, Arunpravin.PaneerSelvam@amd.com,
 jesse.zhang@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 le.ma@amd.com, YiPeng.Chai@amd.com, mario.limonciello@amd.com,
 candice.li@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, Jiadong.Zhu@amd.com, christian.koenig@amd.com,
 Sukrut Bellary <sukrut.bellary@linux.com>, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sukrut Bellary <sukrut.bellary@linux.com>

[ Upstream commit 60ecaaf54886b0642d5c4744f7fbf1ff0d6b3e42 ]

smatch warning -
1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.

Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 0e3ff5c3766ed..72410a2d4e6bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -6702,8 +6702,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v10_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 629671f66b319..acef2227d992b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3800,8 +3800,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_device *adev)
 		return r;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
-	if (unlikely(r != 0))
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unreserve(ring->mqd_obj);
 		return r;
+	}
 
 	gfx_v9_0_kiq_init_queue(ring);
 	amdgpu_bo_kunmap(ring->mqd_obj);
-- 
2.39.2

