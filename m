Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C749909319
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BB410E279;
	Fri, 14 Jun 2024 19:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a/3qJFPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4FB10E27B;
 Fri, 14 Jun 2024 19:55:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0B6FCE2CC6;
 Fri, 14 Jun 2024 19:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0B4C4AF1A;
 Fri, 14 Jun 2024 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718394931;
 bh=6hytKhk1dc1GDL7VPe+EM8eZ6CLJyveS9w/tIrrv9Vw=;
 h=From:Date:Subject:To:Cc:From;
 b=a/3qJFPPZ1KSHUorotwefPE5p80dX7pKKGLw2r9tv1f7FWgvPltENKiMPEgEUYEim
 NnYstjOlhwde6WRHvSlRcr04O0SSFTLSulacLuW8lOMt7AZIr3vmuyeM5khvr32s9m
 BJWf12zqlsXywgqhCdab2nCF8WA1FpJQ4FkUMFz7tMtP7aF2MJgzBc9raAVzlxiesq
 SDGP8JjnIbwZD9+U608Uwc5amP2U5jbtZzhKEqMH3IrFbGIOTbI8uSuRwIoWvCLriA
 SQ8y3frxPIDKESdxNyMdK1+Pu/LzXqikAftI5V8YOGObOoLRuBiSECYRUPWMFaYE2F
 XFV6VKvyZbFoQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 14 Jun 2024 12:54:52 -0700
Subject: [PATCH] drm/amd/display: Disable CONFIG_DRM_AMD_DC_FP for RISC-V
 with clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-v1-1-a6d40617dc9b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAugbGYC/x2N0QqDMAxFf0XyvEDrisz9ythDbVINqCsJykD89
 3U+ngvnngOMVdjg2RygvIvJZ63gbw2kKa4jo1BlaF0bXOcDxoXGsiGJxWFmJF3+E1LCXFDF0o5
 priLefXqE3A197wjqXVHO8r1Sr/d5/gC4IFUjegAAAA==
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6hytKhk1dc1GDL7VPe+EM8eZ6CLJyveS9w/tIrrv9Vw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGk5C4wY5T4e+uzEkf9v82Jf87ze/3X8i1OW7Zeo9LOuf
 /ZG///PjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRaVMYGc4eSP89k1uxT9rr
 2ETLzcul2Q919t4KkWiKffnkvqu3wj5GhmVmusv+OH7lSj5fdvn3xEUO+YfmdW61tMh6+odJWDH
 vAysA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Commit 77acc6b55ae4 ("riscv: add support for kernel-mode FPU") and
commit a28e4b672f04 ("drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT")
enabled support for CONFIG_DRM_AMD_DC_FP with RISC-V. Unfortunately,
this exposed -Wframe-larger-than warnings (which become fatal with
CONFIG_WERROR=y) when building ARCH=riscv allmodconfig with clang:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2448) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
     58 | static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
        |             ^
  1 error generated.

Many functions in this file use a large number of parameters, which must
be passed on the stack at a certain pointer due to register exhaustion,
which can cause high stack usage when inlining and issues with stack
slot analysis get involved. While the compiler can and should do better
(as GCC uses less than half the amount of stack space for the same
function), it is not as simple as a fix as adjusting the functions not
to take a large number of parameters.

Unfortunately, modifying these files to avoid the problem is a difficult
to justify approach because any revisions to the files in the kernel
tree never make it back to the original source (so copies of the code
for newer hardware revisions just reintroduce the issue) and the files
are hard to read/modify due to being "gcc-parsable HW gospel, coming
straight from HW engineers".

Avoid building the problematic code for RISC-V by modifying the existing
condition for arm64 that exists for the same reason. Factor out the
logical not to make the condition a little more readable naturally.

Fixes: a28e4b672f04 ("drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT")
Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Closes: https://lore.kernel.org/20240530145741.7506-2-palmer@rivosinc.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 5fcd4f778dc3..47b8b49da8a7 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
+	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CLANG && (ARM64 || RISCV))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and

---
base-commit: c6c4dd54012551cce5cde408b35468f2c62b0cce
change-id: 20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-31c84f6b990d

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

