Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7CACA314
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ECD10E490;
	Sun,  1 Jun 2025 23:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ua9iuZiC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A559510E48E;
 Sun,  1 Jun 2025 23:43:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0122A4FD04;
 Sun,  1 Jun 2025 23:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1646EC4CEE7;
 Sun,  1 Jun 2025 23:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821383;
 bh=oue5winOBIp6BKO7qyE6ye8Ns5Ga/RRRVUBmkjFQBhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ua9iuZiCLKCE9jXzpzHCnOnKTAS1winhrktRhsOk8wzJKNwe5bSZ0uzc1UumS1kUV
 OeS1mWcbo2a+ulk0KD4ddlq7iZkNRWhXUxlLZO/diuzkkmGAQScvgzP6MAJ34k6BVh
 cHzAjEiP+VtiUXj3bRdJv2F7apawBLZlcIT1BRQ/F2p4bx6XDoTbbEImyZYOwDcDI8
 AszbMcY2Lzjc4UpIyFGwRws/983dWXGgKOa9bIa81n8F/VGvAiLjkC6YWgNiT3xrBX
 CFkfuPkBdfPAILGerttL/LxRpBOlkYTk8JxNjYWc6xJ5NP8O0XnRdsJOaB6Fdo9cya
 h+hFKPjoDlDhw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, boyuan.zhang@amd.com, kevinyang.wang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 16/43] drm/amdgpu/gfx7: fix CSIB handling
Date: Sun,  1 Jun 2025 19:41:56 -0400
Message-Id: <20250601234224.3517599-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234224.3517599-1-sashal@kernel.org>
References: <20250601234224.3517599-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Type: text/plain; charset=UTF-8
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit be7652c23d833d1ab2c67b16e173b1a4e69d1ae6 ]

We shouldn't return after the last section.
We need to update the rest of the CSIB.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## Bug Analysis The commit fixes a critical bug in
the `gfx_v7_0_get_csb_buffer()` function in
`/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c`. The bug is on lines 3909-3911
where the function has: ```c } else { return; // BUG: Early return
prevents completion of CSB buffer } ``` The fix removes the early
`return` statement, changing it to: ```c } ``` ## What the Bug Does 1.
**CSB (Clear State Buffer)** is a critical GPU initialization buffer
that contains register programming sequences needed to properly
initialize the graphics hardware on GFX7 generation AMD GPUs (Bonaire,
Kaveri, Kabini, Mullins, Hawaii). 2. **The Bug**: When iterating through
clear state sections, if the function encounters any section that is NOT
`SECT_CONTEXT`, it immediately returns, **preventing the completion of
the CSB buffer initialization**. 3. **Missing Critical Code**: After the
early return, the function skips: - Setting `PA_SC_RASTER_CONFIG`
register (lines 3915-3939) - critical for rasterization configuration -
Adding `PACKET3_PREAMBLE_END_CLEAR_STATE` (lines 3941-3942) - proper
command stream termination - Adding `PACKET3_CLEAR_STATE` command (lines
3944-3945) - final clear state execution ## Impact Assessment This is a
**hardware initialization bug** that affects: - **Affected Hardware**:
All GFX7 AMD GPUs (Bonaire, Kaveri, Kabini, Mullins, Hawaii chips) -
**Scope**: Fundamental GPU initialization during driver load -
**Symptoms**: Incomplete GPU state initialization, potential rendering
issues, GPU hangs, or system instability ## Why This Should Be
Backported 1. **Fixes Important Hardware Bug**: This addresses a
fundamental hardware initialization issue that can cause GPU
malfunction. 2. **Small, Contained Fix**: The change is minimal
(removing 2 lines) with no architectural implications. 3. **Clear Bug
with Clear Fix**: The commit message explains exactly what's wrong ("We
shouldn't return after the last section. We need to update the rest of
the CSIB"). 4. **Critical Subsystem**: GPU initialization is a critical
path that must work correctly for stable system operation. 5. **Matches
Stable Criteria**: - Important bugfix ✓ - Minimal risk ✓ - Small change
✓ - No new features ✓ - Confined to one subsystem ✓ 6. **Historical
Pattern**: Looking at the provided similar commits, the fix pattern
matches "Similar Commit #4" which was marked as "Backport Status: YES" -
it fixes a functional bug in AMDGPU command submission handling. 7.
**User Impact**: Users with GFX7 AMD hardware could experience graphics
instability or initialization failures due to incomplete CSB
programming. The fix ensures that the CSB buffer is properly completed
with all necessary register programming and command stream termination,
which is essential for stable GPU operation.

 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 37b4a3db63602..b6e5599c8b3cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4005,8 +4005,6 @@ static void gfx_v7_0_get_csb_buffer(struct amdgpu_device *adev,
 				buffer[count++] = cpu_to_le32(ext->reg_index - PACKET3_SET_CONTEXT_REG_START);
 				for (i = 0; i < ext->reg_count; i++)
 					buffer[count++] = cpu_to_le32(ext->extent[i]);
-			} else {
-				return;
 			}
 		}
 	}
-- 
2.39.5

