Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E8718275
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 15:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28610E4D9;
	Wed, 31 May 2023 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0B210E4D1;
 Wed, 31 May 2023 13:43:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E692636C2;
 Wed, 31 May 2023 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86D3C433EF;
 Wed, 31 May 2023 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685540595;
 bh=SbhS7xWumawf0IXidumAoQr5bvCJ0c1u2Ym7dhm+aq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rzs7fTUfrfsAAwlBUEGp0unEIo05m2g36AGgCtcm73aW2Z1A/+09dn1QrBD4xPDD+
 vZnvVnPL83QTjWPS+Vl2OEBfK6duUSw/fJvn7X1xnBT0OakJ/KKuvWE0ndxHqEmDTl
 cdxipccmLEmU4vU/oaqmFETTCIODYLq5XLkf70yoz8qQYVB9Q3VpyRwI+fi1oVTZah
 fPtaTp6Rg4A0K7/GrndUiIqr8+KIRZcHC5bOEUHc6vhATWkrzliKA2+0X3pVLYdQ79
 3aHqsVs+EsZ7JCJEsOPvWdaQHQ2gi8mDJndt77ZXn9IUN2ti57a+kSarzKgmhblGLZ
 DC7IUpkzFFoXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 31/33] drm:amd:amdgpu: Fix missing buffer object
 unlock in failure path
Date: Wed, 31 May 2023 09:41:57 -0400
Message-Id: <20230531134159.3383703-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134159.3383703-1-sashal@kernel.org>
References: <20230531134159.3383703-1-sashal@kernel.org>
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
 le.ma@amd.com, mario.limonciello@amd.com, candice.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 Jiadong.Zhu@amd.com, christian.koenig@amd.com,
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
index 2127aab74a68f..84a36b50ddd87 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -6969,8 +6969,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_device *adev)
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
index 1f3fdf6cb903e..fe371022e5104 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3650,8 +3650,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_device *adev)
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

