Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1F9D7092
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AB910E4DB;
	Sun, 24 Nov 2024 13:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f2ptSzIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B0510E4DB;
 Sun, 24 Nov 2024 13:36:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DCC7AA40A3C;
 Sun, 24 Nov 2024 13:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5161C4CECC;
 Sun, 24 Nov 2024 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455394;
 bh=29p98VLTN5Bj727QeUqUWm1VXUm/ynryNw263azBA5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f2ptSzIoGqbfdmVq1xNQwLsQipvtwfuhb9LZRKiRQPCy1HRpDfX8Te45RQOtAKn1Y
 bxLTStL8kT89WOR9MbJnqvbV+aJWAVMoqFyqFSrUWmw4TPXB249914dbg61LYr/e0V
 s/9RQiiaV4taZZQcDoPI4aC1/49pNL9hJKw62LsflGlGdU8M9HgzcNstK4iFEYZ8KH
 2L2V+pbwKVlOwjH8vfrxJWbcgAN5VNwfA7KogwXI+uFnHD6jQ92gpYRI3HUa33Cfpw
 ZVkwI76WahpgflWClKsBApSFq8v6wORlOMS0WouU0iSjTbHguaLa2o9UPBP1LlwTGl
 t+w8jPNCSqGdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, vitaly.prosyak@amd.com, Prike.Liang@amd.com,
 Jiadong.Zhu@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 060/107] drm/amdgpu/gfx9: Add cleaner shader for
 GFX9.4.2
Date: Sun, 24 Nov 2024 08:29:20 -0500
Message-ID: <20241124133301.3341829-60-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit 9343b904e7198e4804685133327dece7fe709bc1 ]

This commit adds the cleaner shader microcode for GFX9.4.2 GPUs. The
cleaner shader is a piece of GPU code that is used to clear or
initialize certain GPU resources, such as Local Data Share (LDS), Vector
General Purpose Registers (VGPRs), and Scalar General Purpose Registers
(SGPRs).

Clearing these resources is important for ensuring data isolation
between different workloads running on the GPU. Without the cleaner
shader, residual data from a previous workload could potentially be
accessed by a subsequent workload, leading to data leaks and incorrect
computation results.

The cleaner shader microcode is represented as an array of 32-bit words
(`gfx_9_4_2_cleaner_shader_hex`). This array is the binary
representation of the cleaner shader code, which is written in a
low-level GPU instruction set.

Also, this patch updates the `gfx_v9_0_sw_init` function to initialize
the cleaner shader if the MEC firmware version is 88 or higher. It sets
the `cleaner_shader_ptr` and `cleaner_shader_size` to the appropriate
values and attempts to initialize the cleaner shader.

When the cleaner shader feature is enabled, the AMDGPU driver loads this
array into a specific location in the GPU memory. The GPU then reads
this memory location to fetch and execute the cleaner shader
instructions.

The cleaner shader is executed automatically by the GPU at the end of
each workload, before the next workload starts. This ensures that all
GPU resources are in a clean state before the start of each workload.

This change ensures that the GPU memory is properly cleared between
different processes, preventing data leakage and enhancing security. It
also aligns with the serialization mechanism between KGD and KFD,
ensuring that the GPU state is consistent across different workloads.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |  12 ++
 .../drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h  |  44 ++++-
 .../amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm  | 153 ++++++++++++++++++
 3 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 23f0573ae47b3..68dcb3c0455fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2223,6 +2223,18 @@ static int gfx_v9_0_sw_init(void *handle)
 	}
 
 	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
+	case IP_VERSION(9, 4, 2):
+		adev->gfx.cleaner_shader_ptr = gfx_9_4_2_cleaner_shader_hex;
+		adev->gfx.cleaner_shader_size = sizeof(gfx_9_4_2_cleaner_shader_hex);
+		if (adev->gfx.mec_fw_version >= 88) {
+			adev->gfx.enable_cleaner_shader = true;
+			r = amdgpu_gfx_cleaner_shader_sw_init(adev, adev->gfx.cleaner_shader_size);
+			if (r) {
+				adev->gfx.enable_cleaner_shader = false;
+				dev_err(adev->dev, "Failed to initialize cleaner shader\n");
+			}
+		}
+		break;
 	default:
 		adev->gfx.enable_cleaner_shader = false;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h
index 36c0292b51106..0b6bd09b75299 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright 2018 Advanced Micro Devices, Inc.
+ * Copyright 2024 Advanced Micro Devices, Inc.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -24,3 +24,45 @@
 static const u32 __maybe_unused gfx_9_0_cleaner_shader_hex[] = {
 	/* Add the cleaner shader code here */
 };
+
+/* Define the cleaner shader gfx_9_4_2 */
+static const u32 gfx_9_4_2_cleaner_shader_hex[] = {
+	0xbf068100, 0xbf84003b,
+	0xbf8a0000, 0xb07c0000,
+	0xbe8200ff, 0x00000078,
+	0xbf110802, 0x7e000280,
+	0x7e020280, 0x7e040280,
+	0x7e060280, 0x7e080280,
+	0x7e0a0280, 0x7e0c0280,
+	0x7e0e0280, 0x80828802,
+	0xbe803202, 0xbf84fff5,
+	0xbf9c0000, 0xbe8200ff,
+	0x80000000, 0x86020102,
+	0xbf840011, 0xbefe00c1,
+	0xbeff00c1, 0xd28c0001,
+	0x0001007f, 0xd28d0001,
+	0x0002027e, 0x10020288,
+	0xbe8200bf, 0xbefc00c1,
+	0xd89c2000, 0x00020201,
+	0xd89c6040, 0x00040401,
+	0x320202ff, 0x00000400,
+	0x80828102, 0xbf84fff8,
+	0xbefc00ff, 0x0000005c,
+	0xbf800000, 0xbe802c80,
+	0xbe812c80, 0xbe822c80,
+	0xbe832c80, 0x80fc847c,
+	0xbf84fffa, 0xbee60080,
+	0xbee70080, 0xbeea0180,
+	0xbeec0180, 0xbeee0180,
+	0xbef00180, 0xbef20180,
+	0xbef40180, 0xbef60180,
+	0xbef80180, 0xbefa0180,
+	0xbf810000, 0xbf8d0001,
+	0xbefc00ff, 0x0000005c,
+	0xbf800000, 0xbe802c80,
+	0xbe812c80, 0xbe822c80,
+	0xbe832c80, 0x80fc847c,
+	0xbf84fffa, 0xbee60080,
+	0xbee70080, 0xbeea01ff,
+	0x000000ee, 0xbf810000,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm
new file mode 100644
index 0000000000000..35b8cf9070bd9
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2_cleaner_shader.asm
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+// This shader is to clean LDS, SGPRs and VGPRs. It is  first 64 Dwords or 256 bytes of 192 Dwords cleaner shader.
+//To turn this shader program on for complitaion change this to main and lower shader main to main_1
+
+// MI200 : Clear SGPRs, VGPRs and LDS
+//   Uses two kernels launched separately:
+//   1. Clean VGPRs, LDS, and lower SGPRs
+//        Launches one workgroup per CU, each workgroup with 4x wave64 per SIMD in the CU
+//        Waves are "wave64" and have 128 VGPRs each, which uses all 512 VGPRs per SIMD
+//        Waves in the workgroup share the 64KB of LDS
+//        Each wave clears SGPRs 0 - 95. Because there are 4 waves/SIMD, this is physical SGPRs 0-383
+//        Each wave clears 128 VGPRs, so all 512 in the SIMD
+//        The first wave of the workgroup clears its 64KB of LDS
+//        The shader starts with "S_BARRIER" to ensure SPI has launched all waves of the workgroup
+//          before any wave in the workgroup could end.  Without this, it is possible not all SGPRs get cleared.
+//    2. Clean remaining SGPRs
+//        Launches a workgroup with 24 waves per workgroup, yielding 6 waves per SIMD in each CU
+//        Waves are allocating 96 SGPRs
+//          CP sets up SPI_RESOURCE_RESERVE_* registers to prevent these waves from allocating SGPRs 0-223.
+//          As such, these 6 waves per SIMD are allocated physical SGPRs 224-799
+//        Barriers do not work for >16 waves per workgroup, so we cannot start with S_BARRIER
+//          Instead, the shader starts with an S_SETHALT 1. Once all waves are launched CP will send unhalt command
+//        The shader then clears all SGPRs allocated to it, cleaning out physical SGPRs 224-799
+
+shader main
+  asic(MI200)
+  type(CS)
+  wave_size(64)
+// Note: original source code from SQ team
+
+//   (theorhetical fastest = ~512clks vgpr + 1536 lds + ~128 sgpr  = 2176 clks)
+
+  s_cmp_eq_u32 s0, 1                                // Bit0 is set, sgpr0 is set then clear VGPRS and LDS as FW set COMPUTE_USER_DATA_3
+  s_cbranch_scc0  label_0023                        // Clean VGPRs and LDS if sgpr0 of wave is set, scc = (s3 == 1)
+  S_BARRIER
+
+  s_movk_i32    m0, 0x0000
+  s_mov_b32     s2, 0x00000078  // Loop 128/8=16 times  (loop unrolled for performance)
+  //
+  // CLEAR VGPRs
+  //
+  s_set_gpr_idx_on  s2, 0x8    // enable Dest VGPR indexing
+label_0005:
+  v_mov_b32     v0, 0
+  v_mov_b32     v1, 0
+  v_mov_b32     v2, 0
+  v_mov_b32     v3, 0
+  v_mov_b32     v4, 0
+  v_mov_b32     v5, 0
+  v_mov_b32     v6, 0
+  v_mov_b32     v7, 0
+  s_sub_u32     s2, s2, 8
+  s_set_gpr_idx_idx  s2
+  s_cbranch_scc0  label_0005
+  s_set_gpr_idx_off
+
+  //
+  //
+
+  s_mov_b32     s2, 0x80000000                      // Bit31 is first_wave
+  s_and_b32     s2, s2, s1                          // sgpr0 has tg_size (first_wave) term as in ucode only COMPUTE_PGM_RSRC2.tg_size_en is set
+  s_cbranch_scc0  label_clean_sgpr_1                // Clean LDS if its first wave of ThreadGroup/WorkGroup
+  // CLEAR LDS
+  //
+  s_mov_b32 exec_lo, 0xffffffff
+  s_mov_b32 exec_hi, 0xffffffff
+  v_mbcnt_lo_u32_b32  v1, exec_hi, 0          // Set V1 to thread-ID (0..63)
+  v_mbcnt_hi_u32_b32  v1, exec_lo, v1         // Set V1 to thread-ID (0..63)
+  v_mul_u32_u24  v1, 0x00000008, v1           // * 8, so each thread is a double-dword address (8byte)
+  s_mov_b32     s2, 0x00000003f               // 64 loop iterations
+  s_mov_b32     m0, 0xffffffff
+  // Clear all of LDS space
+  // Each FirstWave of WorkGroup clears 64kbyte block
+
+label_001F:
+  ds_write2_b64  v1, v[2:3], v[2:3] offset1:32
+  ds_write2_b64  v1, v[4:5], v[4:5] offset0:64 offset1:96
+  v_add_co_u32     v1, vcc, 0x00000400, v1
+  s_sub_u32     s2, s2, 1
+  s_cbranch_scc0  label_001F
+  //
+  // CLEAR SGPRs
+  //
+label_clean_sgpr_1:
+  s_mov_b32     m0, 0x0000005c   // Loop 96/4=24 times  (loop unrolled for performance)
+  s_nop 0
+label_sgpr_loop:
+  s_movreld_b32     s0, 0
+  s_movreld_b32     s1, 0
+  s_movreld_b32     s2, 0
+  s_movreld_b32     s3, 0
+  s_sub_u32         m0, m0, 4
+  s_cbranch_scc0  label_sgpr_loop
+
+  //clear vcc, flat scratch
+  s_mov_b32 flat_scratch_lo, 0   //clear  flat scratch lo SGPR
+  s_mov_b32 flat_scratch_hi, 0   //clear  flat scratch hi SGPR
+  s_mov_b64 vcc, 0               //clear vcc
+  s_mov_b64 ttmp0, 0             //Clear ttmp0 and ttmp1
+  s_mov_b64 ttmp2, 0             //Clear ttmp2 and ttmp3
+  s_mov_b64 ttmp4, 0             //Clear ttmp4 and ttmp5
+  s_mov_b64 ttmp6, 0             //Clear ttmp6 and ttmp7
+  s_mov_b64 ttmp8, 0             //Clear ttmp8 and ttmp9
+  s_mov_b64 ttmp10, 0            //Clear ttmp10 and ttmp11
+  s_mov_b64 ttmp12, 0            //Clear ttmp12 and ttmp13
+  s_mov_b64 ttmp14, 0            //Clear ttmp14 and ttmp15
+s_endpgm
+
+label_0023:
+
+  s_sethalt 1
+
+  s_mov_b32     m0, 0x0000005c   // Loop 96/4=24 times  (loop unrolled for performance)
+  s_nop 0
+label_sgpr_loop1:
+
+  s_movreld_b32     s0, 0
+  s_movreld_b32     s1, 0
+  s_movreld_b32     s2, 0
+  s_movreld_b32     s3, 0
+  s_sub_u32         m0, m0, 4
+  s_cbranch_scc0  label_sgpr_loop1
+
+  //clear vcc, flat scratch
+  s_mov_b32 flat_scratch_lo, 0   //clear  flat scratch lo SGPR
+  s_mov_b32 flat_scratch_hi, 0   //clear  flat scratch hi SGPR
+  s_mov_b64 vcc, 0xee            //clear vcc
+
+s_endpgm
+end
+
-- 
2.43.0

