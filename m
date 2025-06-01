Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22DACA139
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D830210E2A8;
	Sun,  1 Jun 2025 23:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MwTFAyVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FD910E2A3;
 Sun,  1 Jun 2025 23:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C55EC5C5564;
 Sun,  1 Jun 2025 23:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8152AC4CEE7;
 Sun,  1 Jun 2025 23:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820334;
 bh=thsoERmqAg5cj0LuHw7V1vJWhe3eo1RmAS4y75riqGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MwTFAyVU8V3AEhIqvsowKn5S5K/aazpLrGPhCZ47AwgbD13tcxNkRZM8ML0WtzDGN
 dBuZujAOWNCHuErm6alqsbcglHDOAQpxmDuhZNdAmEl6NfUFu7Pstgw8vhzSljGAyU
 OTCEPRFAuqg6VQFT+xc4w1oy3nt0YRaaQTCm4GpjaqD55OURdu4HLO9hD7ZtLrSyGU
 5+fgrL/1oMoK3vZuucII/dgIWg1o60uZvrKf/MPGbc56Xb0l/xTXQgQhN47WLOKn3c
 NnGrdopoiqxu/IT62EhJeaYDj6lcuWfQcpTR35bFbvVYiptFZOpyoa5NzvSxE76iCQ
 3m/4qWaW8EbEw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, vitaly.prosyak@amd.com, shashank.sharma@amd.com,
 srinivasan.shanmugam@amd.com, tim.huang@amd.com, Prike.Liang@amd.com,
 Jesse.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 021/110] drm/amdgpu/gfx11: fix CSIB handling
Date: Sun,  1 Jun 2025 19:23:03 -0400
Message-Id: <20250601232435.3507697-21-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

[ Upstream commit a9a8bccaa3ba64d509cf7df387cf0b5e1cd06499 ]

We shouldn't return after the last section.
We need to update the rest of the CSIB.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Analysis ### Code Change Analysis The commit fixes a **critical bug in
CSIB (Clear State Init Buffer) handling** in the GFX11 AMD GPU driver.
The problematic code in `gfx_v11_0_get_csb_buffer()` at line 861
contained: ```c } else { return; // This was the bug! } ``` This early
return statement prevented the function from completing the CSIB setup
when encountering non-SECT_CONTEXT sections. The fix removes this
premature return, allowing the function to continue and properly
complete the buffer initialization with: 1.
**PA_SC_TILE_STEERING_OVERRIDE register setup** (lines 866-870) 2.
**PACKET3_PREAMBLE_END_CLEAR_STATE** (lines 872-873) 3.
**PACKET3_CLEAR_STATE** (lines 875-876) ### Why This Qualifies for
Backporting 1. **Fixes Important Hardware Initialization Bug**: CSIB is
critical for GPU state management. Incomplete initialization can cause
GPU hangs, rendering artifacts, or system instability. 2. **Small,
Contained Fix**: The change removes only 2 lines (`} else { return; }`)
- minimal and low-risk. 3. **No Architectural Changes**: This is a pure
bugfix with no new features or major code restructuring. 4. **Critical
Subsystem**: Graphics drivers are essential for system functionality,
and GPU state corruption can cause severe user-visible issues. 5.
**Pattern Consistency**: Looking at similar sections across different
GFX versions (v10, v9, etc.), they all handle non-SECT_CONTEXT sections
by continuing rather than returning early, confirming this was indeed a
bug. ### Historical Context Support From examining the codebase, this
pattern is consistent across all GFX generations: - **gfx_v10_0.c:4227**
and **gfx_v10_0.c:4266**: Handle SECT_CONTEXT but continue for other
sections - **gfx_v9_0.c:1609** and **gfx_v9_0.c:1645**: Same pattern -
**gfx_v8_0.c**, **gfx_v7_0.c**, **gfx_v6_0.c**: All follow the same
approach The previous GFX10 CSIB fix (commit 4905880b4515) shows AMD's
commitment to ensuring proper CSIB initialization across GPU
generations, reinforcing the importance of this subsystem. ### Risk
Assessment - **Regression Risk**: Extremely low - only removes incorrect
early termination - **Testing Surface**: Affects GFX11 GPU
initialization, easily testable - **Side Effects**: None - only allows
completion of intended initialization sequence This is a textbook
example of a stable-worthy fix: important bug, minimal change, no
regression risk, and affects critical hardware functionality.

 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 2a5c2a1ae3c74..914c18f48e8e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -859,8 +859,6 @@ static void gfx_v11_0_get_csb_buffer(struct amdgpu_device *adev,
 						PACKET3_SET_CONTEXT_REG_START);
 				for (i = 0; i < ext->reg_count; i++)
 					buffer[count++] = cpu_to_le32(ext->extent[i]);
-			} else {
-				return;
 			}
 		}
 	}
-- 
2.39.5

