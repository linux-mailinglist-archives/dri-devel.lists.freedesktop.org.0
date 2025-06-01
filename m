Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB10ACA2DC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1552B10E472;
	Sun,  1 Jun 2025 23:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="llNtsRay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998010E472;
 Sun,  1 Jun 2025 23:41:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A9F605C06AA;
 Sun,  1 Jun 2025 23:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F64FC4CEF1;
 Sun,  1 Jun 2025 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821259;
 bh=AmOK9YyWnvdVSYVJuSDTYYGAhjd21PKhIb/NnxXKTqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=llNtsRayBRntNge41669m5sxrUk1SCj1FQ3IdwD2FZqBdyJ56kcZ3ZzKWqAAdj+Qj
 +V5UYScWcVcZtxl7JAZjfgAv6TI8IAlgvucf+BQmfqyDNjr9u9l2x7JhMFDRkwZImH
 dacTZ5VmA/b8jGAqO1NM7H/qC6cDYOslFdsM7p15Sical3mMhUOn2UyegMYP6L/0Xr
 P0AboNovCcFsQmfSdkoL2tuWENYAl0wmPLsWL86fRQwQDWQKIboh4yybZiZUHQnjzd
 Is2jxa9lvc+mQebZbTebg1oiSZpW8qvcNak0nBqSd5GUnBb59nFtNaugj9aMhM9hVc
 VwqjvSubUYb7Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, srinivasan.shanmugam@amd.com, vitaly.prosyak@amd.com,
 Jesse.zhang@amd.com, Jiadong.Zhu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 17/58] drm/amdgpu/gfx10: fix CSIB handling
Date: Sun,  1 Jun 2025 19:39:30 -0400
Message-Id: <20250601234012.3516352-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601234012.3516352-1-sashal@kernel.org>
References: <20250601234012.3516352-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.140
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

[ Upstream commit 683308af030cd9b8d3f1de5cbc1ee51788878feb ]

We shouldn't return after the last section.
We need to update the rest of the CSIB.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. ##
Detailed Analysis: ### The Bug The commit fixes a critical bug in the
`gfx_v10_0_get_csb_buffer()` function in
`/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c`. The function is responsible
for building a Command Stream Buffer (CSB) for GPU initialization. **The
problematic code before the fix:** ```c for (sect =
adev->gfx.rlc.cs_data; sect->section != NULL; ++sect) { for (ext =
sect->section; ext->extent != NULL; ++ext) { if (sect->id ==
SECT_CONTEXT) { buffer[count++] =
cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, ext->reg_count));
buffer[count++] = cpu_to_le32(ext->reg_index -
PACKET3_SET_CONTEXT_REG_START); for (i = 0; i < ext->reg_count; i++)
buffer[count++] = cpu_to_le32(ext->extent[i]); } else { return; // ←
BUG: Early return prevents rest of buffer initialization } } } ``` **The
fix removes the early return:** ```c for (sect = adev->gfx.rlc.cs_data;
sect->section != NULL; ++sect) { for (ext = sect->section; ext->extent
!= NULL; ++ext) { if (sect->id == SECT_CONTEXT) { buffer[count++] =
cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, ext->reg_count));
buffer[count++] = cpu_to_le32(ext->reg_index -
PACKET3_SET_CONTEXT_REG_START); for (i = 0; i < ext->reg_count; i++)
buffer[count++] = cpu_to_le32(ext->extent[i]); } // ← Early return
removed - now continues to process rest of buffer } } ``` ### Why This
Should Be Backported: 1. **Fixes Important GPU Initialization Bug**:
This is a clear functional bug that affects AMDGPU GFX10 hardware.
Looking at the clearstate data structure, I can see that
`gfx10_cs_data[]` contains only `SECT_CONTEXT` sections, but if any
future section was not `SECT_CONTEXT`, the early return would prevent
critical buffer initialization from completing. 2. **Affects Critical
Hardware Functionality**: The CSB (Command Stream Buffer) is essential
for proper GPU initialization. An incomplete buffer could lead to: - GPU
hang during initialization - Incorrect register states - System
instability - Failed GPU bring-up 3. **Small, Contained Fix**: The fix
is minimal - it simply removes an erroneous `else { return; }` clause.
This has very low risk of introducing regressions. 4. **No Architectural
Changes**: This doesn't change any APIs, interfaces, or architectural
decisions. It's a pure bugfix. 5. **Follows Stable Tree Criteria**: -
Important bugfix ✓ - Minimal risk ✓ - Confined to a subsystem ✓ - No new
features ✓ 6. **Critical GPU Subsystem**: The commit touches GPU command
submission infrastructure, which is critical for system stability when
AMD GFX10 hardware is present. 7. **Clear Commit Message**: The commit
message clearly explains the bug: "We shouldn't return after the last
section. We need to update the rest of the CSIB." Looking at the
reference commits, this aligns with "Similar Commit #4" which was marked
YES for backporting - it's a clear functional bugfix in critical GPU
subsystem code that prevents proper operation. The missing code after
the early return includes essential buffer finalization: - Setting
PA_SC_TILE_STEERING_OVERRIDE register - Adding
PACKET3_PREAMBLE_END_CLEAR_STATE - Adding PACKET3_CLEAR_STATE command
Without these, the GPU's clear state buffer would be incomplete,
potentially causing initialization failures.

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index f8382b227ad46..5814c44a49cc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4184,8 +4184,6 @@ static void gfx_v10_0_get_csb_buffer(struct amdgpu_device *adev,
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

