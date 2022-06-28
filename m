Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19155BD85
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACA210F212;
	Tue, 28 Jun 2022 02:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E195310F1F0;
 Tue, 28 Jun 2022 02:25:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 571BE6170D;
 Tue, 28 Jun 2022 02:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCFDC34115;
 Tue, 28 Jun 2022 02:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383114;
 bh=fuSloeFz2lT+mUR13yFai2fyTADedPdYS+ySKdSNBlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mg6zpcl/YtuagmmzSBn/AtrIsJZev9fkL4seNgYnKKRQAD6kHD7wdyZGP+zpGNcU9
 25xm4jpoGfPamfdLNHizy7puxufVy0YRIht5/8nKyK7YPSh6rVV1WWjQyvvwo1/oon
 lNBnrpCx/LlUoK4qPtf2Qb9+i2SM/iXBkJHbj1Vi0cal1F3ki+8rv8omWDyRY+kebI
 VGjkwdbjZdek17TtnLWkVVOEHdDpaUkDpAHTe+6Fmi2qK+NREfWwDFFFvGt+YGdEIX
 VJ8/A3ST6wmLhM+SK0mN8Y3TnJVy9opO6ddji3YReoPdm2lSsFvn3dU1H0i9sGGLo2
 pvCgKpm0ksrNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 25/27] drm/amdgpu: Adjust logic around GTT size
 (v3)
Date: Mon, 27 Jun 2022 22:24:11 -0400
Message-Id: <20220628022413.596341-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022413.596341-1-sashal@kernel.org>
References: <20220628022413.596341-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, jonathan.kim@amd.com, kevin1.wang@amd.com,
 airlied@linux.ie, =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit f15345a377c6ea9c7cc74f079616af8856aff37f ]

Certain GL unit tests for large textures can cause problems
with the OOM killer since there is no way to link this memory
to a process.  This was originally mitigated (but not necessarily
eliminated) by limiting the GTT size.  The problem is this limit
is often too low for many modern games so just make the limit 1/2
of system memory. The OOM accounting needs to be addressed, but
we shouldn't prevent common 3D applications from being usable
just to potentially mitigate that corner case.

Set default GTT size to max(3G, 1/2 of system ram) by default.

v2: drop previous logic and default to 3/4 of ram
v3: default to half of ram to align with ttm
v4: fix spelling in comment (Kent)

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1942
Reviewed-by: Marek Olšák <marek.olsak@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 870dd78d5a21..e70b33f3f363 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1749,18 +1749,26 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
 		 (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));
 
-	/* Compute GTT size, either bsaed on 3/4th the size of RAM size
+	/* Compute GTT size, either based on 1/2 the size of RAM size
 	 * or whatever the user passed on module init */
 	if (amdgpu_gtt_size == -1) {
 		struct sysinfo si;
 
 		si_meminfo(&si);
-		gtt_size = min(max((AMDGPU_DEFAULT_GTT_SIZE_MB << 20),
-			       adev->gmc.mc_vram_size),
-			       ((uint64_t)si.totalram * si.mem_unit * 3/4));
-	}
-	else
+		/* Certain GL unit tests for large textures can cause problems
+		 * with the OOM killer since there is no way to link this memory
+		 * to a process.  This was originally mitigated (but not necessarily
+		 * eliminated) by limiting the GTT size.  The problem is this limit
+		 * is often too low for many modern games so just make the limit 1/2
+		 * of system memory which aligns with TTM. The OOM accounting needs
+		 * to be addressed, but we shouldn't prevent common 3D applications
+		 * from being usable just to potentially mitigate that corner case.
+		 */
+		gtt_size = max((AMDGPU_DEFAULT_GTT_SIZE_MB << 20),
+			       (u64)si.totalram * si.mem_unit / 2);
+	} else {
 		gtt_size = (uint64_t)amdgpu_gtt_size << 20;
+	}
 
 	/* Initialize GTT memory pool */
 	r = ttm_bo_init_mm(&adev->mman.bdev, TTM_PL_TT, gtt_size >> PAGE_SHIFT);
-- 
2.35.1

