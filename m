Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2E84A827
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 22:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FED10FC2D;
	Mon,  5 Feb 2024 21:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jj2o3pkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4359E10FC2D;
 Mon,  5 Feb 2024 21:54:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A2D0CE10E3;
 Mon,  5 Feb 2024 21:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC07C433C7;
 Mon,  5 Feb 2024 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707170050;
 bh=6GEDCFQk41XP9DzQmt+P7xWPiXzZfQEwbIAYsyL/6lY=;
 h=From:Date:Subject:To:Cc:From;
 b=Jj2o3pkngkvdJslLtmThbXMGJLXgEonRU0XkDkA5VSynRzNafZQYBhR0MwS2Yl2Av
 WSXySO4kdnczUeTzv1GpIyQQ1tDJb+Pp1mJ2cqmarPN5orAlu3n6091jZg3mSMRER7
 nOEuXRcSkcgkayi+1PhrreJvPypDfAHU5GegfQRvTCNHFBIfKKNQp6LcVDU5UWe9fA
 v93Gd0MoGmDc34Y+chk4j+l7UMWP+fy83EW0ZIlsAeUkCSUC1pXxCwzNkQ7TpEIuZx
 Ekupidglumd3Aode9f/uAldY8t3ukiCX2HOujyZiQSmdGUGQVGfaEYoiGUG2q3e4Mx
 br5mYdGEBztJw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Feb 2024 14:54:05 -0700
Subject: [PATCH] drm/amd/display: Increase frame-larger-than for all
 display_mode_vba files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-amdgpu-raise-flt-for-dml-vba-files-v1-1-9bc8c8b98fb4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPxYwWUC/x3NywqDMBBG4VeRWXcgTc2ifZXSRTR/7EC8MFOlI
 L67weW3OWcngwqMXs1Oik1M5qnifmuo/8ZpAEuqJu9867wLHMc0LCtrFAPn8uM8K6ex8NZFzlJ
 gDIQuxGcf0D6ohhZFlv81eX+O4wQUV7JbdAAAAA==
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, morbo@google.com, 
 justinstitt@google.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6GEDCFQk41XP9DzQmt+P7xWPiXzZfQEwbIAYsyL/6lY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkHIxnj9YTvrShxvWjc1DiTy07ynlzcAc6LYifEJZkWC
 VXXirJ0lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgInsVGdk+BHpcmr2r5kGQTMk
 Shd21Z6M5OET7p/ZEyf/12Z6pt7njYwMq3/f7WIIe2TkI/OmcAPbuVePSva0SKnYpwZNCmpP+L2
 GHwA=
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

After a recent change in LLVM, allmodconfig (which has CONFIG_KCSAN=y
and CONFIG_WERROR=y enabled) has a few new instances of
-Wframe-larger-than for the mode support and system configuration
functions:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v2.c:3393:6: error: stack frame size (2144) exceeds limit (2048) in 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
   3393 | void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 error generated.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:3520:6: error: stack frame size (2192) exceeds limit (2048) in 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
   3520 | void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 error generated.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3286:6: error: stack frame size (2128) exceeds limit (2048) in 'dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
   3286 | void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 error generated.

Without the sanitizers enabled, there are no warnings.

This was the catalyst for commit 6740ec97bcdb ("drm/amd/display:
Increase frame warning limit with KASAN or KCSAN in dml2") and that same
change was made to dml in commit 5b750b22530f ("drm/amd/display:
Increase frame warning limit with KASAN or KCSAN in dml") but the
frame_warn_flag variable was not applied to all files. Do so now to
clear up the warnings and make all these files consistent.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issue/1990
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 6042a5a6a44f..59ade76ffb18 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -72,11 +72,11 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn10/dcn10_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)

---
base-commit: 6813cdca4ab94a238f8eb0cef3d3f3fcbdfb0ee0
change-id: 20240205-amdgpu-raise-flt-for-dml-vba-files-ee5b5a9c5e43

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

