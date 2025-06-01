Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A5ACA348
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48C310E4AA;
	Sun,  1 Jun 2025 23:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rbkm0B4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B215A10E4A6;
 Sun,  1 Jun 2025 23:44:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F2175C4C2B;
 Sun,  1 Jun 2025 23:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22320C4CEE7;
 Sun,  1 Jun 2025 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821483;
 bh=HLoUGQdCF9kAK6KeytTEKpyhmir28oFJA11T669WgSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rbkm0B4+NwXYtqS4pRlWIxVs04bqRNUrObzBkh9TSPxo6X6RTrpu+dj5wujxWQRky
 57WOzpNP1oYHfxJ1yTLDyNdT/HJG9sx/huRTuTmb/o5x9NF7aJ1PZmX2DFJs0UtDgi
 BEOFYeAFnbyteX0IfQPCaBUHIU2p2YghPyyKw26AbZpUOoeLqz38G3zLyYymk8UllB
 e0dPP0vgPEEaVlM2Cm4b7RpLynEn/lu3F73rhU8FVDcVsF4cvNBF31jS1H/rZ1L/iH
 HjS/chz3v4PQNU/aZIETUDwp3WABLLEzOxYVhe9mPympWKrbyLaNF56bZXNn63WUoR
 FD/l9qERSKrkA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, boyuan.zhang@amd.com, lijo.lazar@amd.com,
 Prike.Liang@amd.com, kevinyang.wang@amd.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 19/34] drm/amdgpu/gfx8: fix CSIB handling
Date: Sun,  1 Jun 2025 19:43:43 -0400
Message-Id: <20250601234359.3518595-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234359.3518595-1-sashal@kernel.org>
References: <20250601234359.3518595-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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

[ Upstream commit c8b8d7a4f1c5cdfbd61d75302fb3e3cdefb1a7ab ]

We shouldn't return after the last section.
We need to update the rest of the CSIB.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees.
**Extensive Analysis:** **1. Critical Bug Nature:** The code changes fix
a serious logic error in the CSIB (Clear State Indirect Buffer) handling
for AMD GFX8 hardware. The bug occurs in `gfx_v8_0_get_csb_buffer()`
where there's an early `return` statement in the `else` branch at line
1252: ```c if (sect->id == SECT_CONTEXT) { // Handle SECT_CONTEXT
sections... } else { return; // BUG: Early exit prevents rest of buffer
setup! } ``` **2. Impact and Severity:** This bug has significant
functional impact because: - The function is responsible for setting up
the Clear State Buffer, which is critical for GPU state initialization -
When encountering any section that isn't `SECT_CONTEXT` (such as
`SECT_CLEAR`, `SECT_CTRLCONST`, or `SECT_NONE` as defined in
`clearstate_defs.h`), the function exits early - This prevents the
essential final buffer setup steps from executing: - PA_SC_RASTER_CONFIG
register setup (lines 1257-1261) - PACKET3_PREAMBLE_END_CLEAR_STATE
packet (lines 1263-1264) - PACKET3_CLEAR_STATE packet (lines 1266-1267)
**3. Real-World Consequences:** An incomplete CSB buffer can lead to: -
GPU initialization failures - Rendering corruption - System instability
- Potential hangs during graphics operations **4. Code Quality
Assessment:** - **Small and contained:** The fix removes only 2 lines of
problematic code - **No architectural changes:** Pure bug fix with no
design modifications - **Clear intent:** The commit message explicitly
states the problem and solution - **Low regression risk:** Removing an
early return cannot introduce new failures **5. Comparison with
Historical Examples:** This commit aligns perfectly with the "Backport
Status: YES" example (#4) which also fixed a critical handling issue in
AMD GPU code. Like that commit, this: - Fixes a clear functional bug -
Has immediate user impact - Is small and low-risk - Affects critical GPU
subsystem functionality **6. Stable Tree Compliance:** ✓ Fixes important
user-affecting bug ✓ Small, contained change ✓ No new features
introduced ✓ Critical hardware subsystem affected ✓ Clear regression
prevention The fix ensures that all necessary GPU state initialization
packets are properly written to the buffer, which is essential for
correct hardware operation on GFX8 hardware generations.

 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index c36258d56b445..0459e7b71945c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -1268,8 +1268,6 @@ static void gfx_v8_0_get_csb_buffer(struct amdgpu_device *adev,
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

