Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35A7DF8F1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBF210E972;
	Thu,  2 Nov 2023 17:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB39110E971;
 Thu,  2 Nov 2023 17:41:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1BC44B81DAD;
 Thu,  2 Nov 2023 17:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE916C433C7;
 Thu,  2 Nov 2023 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698946864;
 bh=suNiwwNilezg0GEF/Z8Hj2532TSYjnOgWmiM3lDXN6I=;
 h=From:Date:Subject:To:Cc:From;
 b=fbSO5mzQETvpJmPqUcObNr2DZ2/yFrW0MarXbm/hZareO/H18zmqJgmOTBjSMKFFx
 DoEqnT4wEq4CpdDAx+qh8yf9hqcagNA6iowAxhQqhFkEcZXyWvEnnt6IJgfo8I0+ZW
 XS2Lc5vauI7Og3U1pzA6Fv5rBh3Lkf2I03JpintvL48UhB0zuaLU8verpdsjk4qaEh
 3iB0Jr+A/xOloD9wW0rdi2qr0nzS9COCxqxXu+zrCJYpRCggOCDHaq1N/xVMJiOJDo
 4wa3f6wkS+iY9tE92c3UgzgABBSIlHsoUAoCIA4TKhx3ylkuqn2M3EM4YnT42sHSgs
 UAGujm0sF0tKA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 02 Nov 2023 10:40:52 -0700
Subject: [PATCH v2] drm/amd/display: Increase frame warning limit with
 KASAN or KCSAN in dml2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v2-1-b088a718131a@kernel.org>
X-B4-Tracking: v=1; b=H4sIACPfQ2UC/6WOTQ6CMBBGr0K6dgxtA4gr72FYlHaAidCSqeIP4
 e5WruDyfYv3vlVEZMIoztkqGBeKFHwCdciEHYzvEcglFipXWspcgZlcPz/ATaMC8pbRRISOzYQ
 Q6YPwNOzJ99AFBjsmA9hat0650pwqKZJ3ZuzotTevTeKB4j3we7+wyN/6T22RIKHEVhaVLlSt5
 eWG7HE8Bu5Fs23bF6mXC4jzAAAA
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3472; i=nathan@kernel.org;
 h=from:subject:message-id; bh=suNiwwNilezg0GEF/Z8Hj2532TSYjnOgWmiM3lDXN6I=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKnO9/Ubn6dEN/6y/aAj53U3uV/48FbW97vOxOo8yf3c5
 ew63TO6o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExEWoGR4Zb5i+Lo7Ypr51s8
 sMkySXOffsNjm9QuQYkzW35tuJEk8Ynhn/JO/o6/GWvEk14I2xazVLVuTvy4/13Kwi4ZBtHAT/a
 3mAA=
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building ARCH=x86_64 allmodconfig with clang, which will typically
have sanitizers enabled, there is a warning about a large stack frame.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6265:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
   6265 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
        |             ^
  1 error generated.

Notably, GCC 13.2.0 does not do too much of a better job, as it is right
at the current limit of 2048 (and others have reported being over with
older GCC versions):

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
   6705 | }
        | ^

In the past, these warnings have been avoided by reducing the number of
parameters to various functions so that not as many arguments need to be
passed on the stack. However, these patches take a good amount of effort
to write despite being mechanical due to code structure and complexity
and they are never carried forward to new generations of the code so
that effort has to be expended every new hardware generation, which
becomes harder to justify as time goes on.

To avoid having a noticeable or lengthy breakage in all{mod,yes}config,
which are easy testing targets that have -Werror enabled, increase the
limit for configurations that have KASAN or KCSAN enabled by 50% so that
cases of extremely poor code generation can still be caught while not
breaking the majority of builds. CONFIG_KMSAN also causes high stack
usage but the frame limit is already set to zero when it is enabled,
which is accounted for by the check for CONFIG_FRAME_WARN=0 in the dml2
Makefile.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
If there is another DRM pull before 6.7-rc1, it would be much
appreciated if this could make that so that other trees are not
potentially broken by this. If not, no worries, as it was my fault for
not sending this sooner.

Changes in v2:
- Adjust workaround to check for either CONFIG_KASAN=y or
  CONFIG_KCSAN=y, as the same problem has been reported with older
  versions of GCC (Hamza, Alex)
- Link to v1: https://lore.kernel.org/r/20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 70ae5eba624e..acff3449b8d7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -60,8 +60,12 @@ endif
 endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
+ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+frame_warn_flag := -Wframe-larger-than=3072
+else
 frame_warn_flag := -Wframe-larger-than=2048
 endif
+endif
 
 CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o := $(dml2_ccflags)

---
base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-c93bd2d6a871

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

