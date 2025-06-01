Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA83ACA178
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4F10E3A4;
	Sun,  1 Jun 2025 23:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T7NhzxjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C910E3A7;
 Sun,  1 Jun 2025 23:27:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D86496135E;
 Sun,  1 Jun 2025 23:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFEAC4CEE7;
 Sun,  1 Jun 2025 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820450;
 bh=2S/5Y1Cy4cIkSIOXzV/q93MzukyXk0LgvguRxsVTT8A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T7NhzxjEwrgCWOamQ5Y3EyQEIRnlEs+gJSMFGL+aT6BrH5l1dKFO6jbF+/DYirZza
 5ZMu6dkAM09jQyHCJUaImVfvQbpt7AWowvshPYrZu18fVEEEuBDSWWOC8osbPUio1R
 +yErNA5cL3IRrY4tPSsX5ayLErcpV6pyFQusg1Y2n7nCM83MyEy1OyKShOmxlb6+zR
 0PJXE80KtHwmPlDPmLBC9cRukSfpWrOYnpmqVVGSI34494YNf69eYvULwyaMNaFbP8
 57qyTVJyizbVhn9F3haICAKytqxQb9UxsQvLjqU5OxTwBHAYwbsIOL8htug8PJIcVV
 ywsdAsfKXGMHQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, vitaly.prosyak@amd.com, srinivasan.shanmugam@amd.com,
 Jiadong.Zhu@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 061/110] drm/amdgpu/gfx9: fix CSIB handling
Date: Sun,  1 Jun 2025 19:23:43 -0400
Message-Id: <20250601232435.3507697-61-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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

[ Upstream commit a4a4c0ae6742ec7d6bf1548d2c6828de440814a0 ]

We shouldn't return after the last section.
We need to update the rest of the CSIB.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now I'll analyze the specific code changes and provide my backport
recommendation: **YES** This commit should be backported to stable
kernel trees. Here's my detailed analysis: ## Code Analysis The commit
fixes a logic bug in the `gfx_v9_0_get_csb_buffer()` function that
builds GPU command buffers for AMD GFX9 hardware. Looking at the code
change: **Before:** ```c if (sect->id == SECT_CONTEXT) { buffer[count++]
= cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, ext->reg_count));
buffer[count++] = cpu_to_le32(ext->reg_index -
PACKET3_SET_CONTEXT_REG_START); for (i = 0; i < ext->reg_count; i++)
buffer[count++] = cpu_to_le32(ext->extent[i]); } else { return; // ←
BUGGY early return } ``` **After:** ```c if (sect->id == SECT_CONTEXT) {
buffer[count++] = cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG,
ext->reg_count)); buffer[count++] = cpu_to_le32(ext->reg_index -
PACKET3_SET_CONTEXT_REG_START); for (i = 0; i < ext->reg_count; i++)
buffer[count++] = cpu_to_le32(ext->extent[i]); } // ← Early return
removed, execution continues ``` ## Why This Should Be Backported ### 1.
**Fixes a Clear Logic Bug** The early return prevents the function from
completing its work. After the loop, the function needs to write
critical termination packets: ```c buffer[count++] =
cpu_to_le32(PACKET3(PACKET3_PREAMBLE_CNTL, 0)); buffer[count++] =
cpu_to_le32(PACKET3_PREAMBLE_END_CLEAR_STATE); buffer[count++] =
cpu_to_le32(PACKET3(PACKET3_CLEAR_STATE, 0)); buffer[count++] =
cpu_to_le32(0); ``` ### 2. **Meets Stable Tree Criteria** - **Small and
contained**: Simple one-line removal with clear intent - **Low
regression risk**: Removing early return allows proper completion -
**Important bug fix**: Prevents GPU command buffer corruption - **No
architectural changes**: Pure bug fix without new features ### 3.
**Comparison with Historical Examples** Looking at the provided
historical commits, this fix is similar to commit #3 (marked YES) which
also fixed preamble handling. Both commits: - Fix logic bugs in AMD GPU
driver - Have minimal code changes - Address proper command/state
handling - Are critical for correct driver operation ### 4. **Stability
Impact** While currently masked because all existing clear state data
only uses `SECT_CONTEXT` sections, this bug creates: - **Buffer
corruption risk**: Incomplete command buffers sent to GPU - **Forward
compatibility issues**: Future hardware might use other section types -
**Inconsistent state**: Size calculation function has same bug pattern
### 5. **Hardware Criticality** This affects the GFX9 generation which
includes widely deployed GPUs like: - Vega series (RX Vega 56/64) -
Raven Ridge APUs (Ryzen 2000G/3000G series) - Renoir APUs (Ryzen 4000
series) ### 6. **Clear Commit Message** The commit message explicitly
states "We need to update the rest of the CSIB" - indicating this fixes
incomplete processing, exactly what stable backports target.
**Conclusion**: This is a textbook stable backport candidate - a small,
contained fix for a clear logic bug in a critical GPU initialization
path that could lead to hardware instability. The risk/reward ratio
strongly favors backporting.

 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index d7db4cb907ae5..d725e2e230a3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1649,8 +1649,6 @@ static void gfx_v9_0_get_csb_buffer(struct amdgpu_device *adev,
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

