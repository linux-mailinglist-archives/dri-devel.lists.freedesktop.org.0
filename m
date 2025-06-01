Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF6ACA2C4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE0110E458;
	Sun,  1 Jun 2025 23:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mktuiSXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A72210E458;
 Sun,  1 Jun 2025 23:40:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEECB5C59C5;
 Sun,  1 Jun 2025 23:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C587EC4CEE7;
 Sun,  1 Jun 2025 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748821215;
 bh=OALBLlLWLL80XnYhYJHu1fr33EUA2ALC9d2lhTp52AA=;
 h=From:To:Cc:Subject:Date:From;
 b=mktuiSXwWkmBN8fYD/9HP2J6kAtSDcVe2XWXPy6Gn60ZbEYuSww9wSQkJPAVoUcM4
 isVAipadEHGigXHNi5wQRS6Ih3K2qvnxQA+E0aS5zIDGEKzwoajSVSwVgrNGVNxH2q
 1P+J0FXOt4UL+vPnT4pt5lwjjz05PDe8Ea/Gk/OyRM4+LPN23rDupKeDUntcdlI2u2
 yqVaCBivRSWlXoP4/iXI6fXtPeZHmB2y5YEdgKnQKjuZYNHD+maJs+8ZoJ+PasuIaV
 uH/T/iPkRt6XWK+d9DKq9fvd/J3BEjXQgfOCNt5xvBb7ugw8m0zN5yPdq0POppSUFh
 YJerJZ9VLscgQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, alexandre.f.demers@gmail.com, boyuan.zhang@amd.com,
 kevinyang.wang@amd.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/58] drm/amdgpu/gfx6: fix CSIB handling
Date: Sun,  1 Jun 2025 19:39:14 -0400
Message-Id: <20250601234012.3516352-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.140
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

[ Upstream commit 8307ebc15c1ea98a8a0b7837af1faa6c01514577 ]

We shouldn't return after the last section.
We need to update the rest of the CSIB.

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now let me understand what the bug is. Looking at the original code:
```c for (sect = adev->gfx.rlc.cs_data; sect->section != NULL; ++sect) {
for (ext = sect->section; ext->extent != NULL; ++ext) { if (sect->id ==
SECT_CONTEXT) { // process SECT_CONTEXT sections } else { return; //
BUG: This returns early, skipping remaining code } } } // Important code
that should always run: buffer[count++] =
cpu_to_le32(PACKET3(PACKET3_SET_CONTEXT_REG, 1)); buffer[count++] =
cpu_to_le32(mmPA_SC_RASTER_CONFIG - PACKET3_SET_CONTEXT_REG_START); //
... more important buffer initialization ``` The fix removes the early
return so that all sections are processed and the important buffer
initialization at the end always runs. **YES** This commit should be
backported to stable kernel trees for the following reasons: 1. **Clear
Bug Fix**: The commit fixes a clear logic error where an early return
statement prevents critical buffer initialization code from executing.
The original code would return immediately when encountering a non-
SECT_CONTEXT section, skipping the important packet commands that should
always be written to the buffer (PACKET3_SET_CONTEXT_REG,
PACKET3_PREAMBLE_END_CLEAR_STATE, PACKET3_CLEAR_STATE). 2. **Functional
Impact**: This bug affects the Clear State Indirect Buffer (CSIB)
handling in AMD GPU driver for GFX6 hardware. The incomplete buffer
initialization could lead to: - Incorrect GPU state during graphics
operations - Potential rendering issues or GPU hangs - Inconsistent
hardware behavior 3. **Small and Contained Fix**: The fix is minimal -
it simply removes two lines (the else block with return statement). This
is a low-risk change that doesn't introduce new functionality or alter
the architecture. 4. **Hardware-Specific Bug**: This affects real users
with GFX6 AMD GPUs. The bug prevents proper initialization of the GPU's
clear state buffer, which is essential for correct GPU operation. 5.
**Similar to Historical Backports**: Looking at commit 4 in the similar
commits (marked as YES for backporting), which also fixed preamble
handling issues in the AMD GPU driver, this follows a similar pattern of
fixing command buffer handling bugs. The commit message clearly
indicates this is a bug fix ("We shouldn't return after the last
section. We need to update the rest of the CSIB"), and the code change
confirms that critical buffer initialization was being skipped due to
the premature return.

 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 204b246f0e3f9..0219f1175c078 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -2873,8 +2873,6 @@ static void gfx_v6_0_get_csb_buffer(struct amdgpu_device *adev,
 				buffer[count++] = cpu_to_le32(ext->reg_index - 0xa000);
 				for (i = 0; i < ext->reg_count; i++)
 					buffer[count++] = cpu_to_le32(ext->extent[i]);
-			} else {
-				return;
 			}
 		}
 	}
-- 
2.39.5

