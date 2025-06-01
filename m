Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDA9ACA1C5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E6310E3D9;
	Sun,  1 Jun 2025 23:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NhYdY9Ot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2110E3D9;
 Sun,  1 Jun 2025 23:30:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2509549FE1;
 Sun,  1 Jun 2025 23:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85508C4CEE7;
 Sun,  1 Jun 2025 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820646;
 bh=1S2QoE++Gwa9Lja2VV0GW7oRjoVKN8B9c0zcnqqxJ9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NhYdY9OtAxlCLnLmsl9mlZWybrKepPdrVuyYWFsB/CwE/e65SbUh/M2ZJYTscj98Z
 Dny8X9XnwvnhD/EtoLtQxA3e7zu9gz6LtCuHBjBMKC6mr3nBnMr9wm7N4zaeD6g7UY
 ag7ijSFg706Fc7iM0JT/9UcMKi6ZR/MwDDHXpvWrqwkD2cbA2YoUp1pXoBTAeOXJ64
 H7zR0913K3pTM2BJbkWiW88y1FRuOoqzNgfFRWVXv1hNImjHPG7mQ75NX6/icd7poV
 xOaPELk3J5crq9m+R5IcEl/KOXg2e+oW7WBvWrVoudZWH4qPXipHbwCPvX3SEWoj+r
 mqqiuOcoZLaLA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Sasha Levin <sashal@kernel.org>,
 lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 zhiw@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 026/102] drm/nouveau/gsp: fix rm shutdown wait
 condition
Date: Sun,  1 Jun 2025 19:28:18 -0400
Message-Id: <20250601232937.3510379-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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

From: Ben Skeggs <bskeggs@nvidia.com>

[ Upstream commit 7904bcdcf6b56602a049ed2b47282db63671fa99 ]

Though the initial upstreamed GSP-RM version in nouveau was 535.113.01,
the code was developed against earlier versions.

535.42.02 modified the mailbox value used by GSP-RM to signal shutdown
has completed, which was missed at the time.

I'm not aware of any issues caused by this, but noticed the bug while
working on GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Analysis:** **1. Nature of the Bug Fix:** The commit fixes a bug in
the GSP-RM shutdown wait condition in the r535_gsp_fini() function at
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2612. The change is from:
```c if (nvkm_falcon_rd32(&gsp->falcon, 0x040) & 0x80000000) ``` to:
```c if (nvkm_falcon_rd32(&gsp->falcon, 0x040) == 0x80000000) ``` **2.
Technical Impact:** - The original code used a bitwise AND operation
(`&`) to check if bit 31 is set in the mailbox value - The fixed code
uses an equality comparison (`==`) to check if the mailbox value is
exactly 0x80000000 - This fixes a version compatibility issue where GSP-
RM 535.42.02 changed the shutdown completion signal value - The bug
could potentially cause incorrect shutdown behavior or timing issues
**3. Backport Criteria Assessment:** - **Fixes important bug**: YES -
This fixes a GSP-RM shutdown synchronization bug that could affect
system stability - **Small and contained**: YES - Single line change,
very minimal and focused - **No architectural changes**: YES - Simple
conditional logic fix - **Minimal regression risk**: YES - The change is
specific to GSP-RM shutdown sequence and well-understood - **Clear side
effects**: NO - The fix has no unexpected side effects, only corrects
the intended behavior **4. Critical Subsystem Impact:** The change
affects the Nouveau DRM GSP (Graphics System Processor) subsystem,
specifically the shutdown sequence. GSP is critical for modern NVIDIA
GPU operation, and incorrect shutdown behavior could lead to system
instability, resource leaks, or improper hardware state transitions.
**5. Historical Context:** Looking at the similar commits provided as
reference, all were marked "NO" for backporting because they were
architectural preparation changes for GSP-RM support (adding `if
(nvkm_gsp_rm(device->gsp)) return -ENODEV;` guards). This commit is
fundamentally different - it's a targeted bug fix rather than a feature
preparation change. **6. Stability Tree Rules Compliance:** - This is an
important bugfix that corrects faulty synchronization logic - It has
minimal risk of introducing regressions - The change is confined to a
specific subsystem (nouveau GSP) - No new features are introduced The
commit message explicitly states this was developed against earlier GSP-
RM versions and the bug was "missed at the time" when 535.42.02 modified
the mailbox behavior. While the author mentions being unaware of
specific issues, incorrect shutdown synchronization in GPU drivers can
lead to subtle but serious problems including system hangs, resource
leaks, or corrupted GPU state.

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index bb86b6d4ca49e..5b77cf24f4838 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2609,7 +2609,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		return ret;
 
 	nvkm_msec(gsp->subdev.device, 2000,
-		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) & 0x80000000)
+		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) == 0x80000000)
 			break;
 	);
 
-- 
2.39.5

