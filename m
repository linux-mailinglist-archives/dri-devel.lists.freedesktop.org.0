Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C937DF798
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E97910E090;
	Thu,  2 Nov 2023 16:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D411710E090;
 Thu,  2 Nov 2023 16:25:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5FD2DCE2112;
 Thu,  2 Nov 2023 16:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2127C433CA;
 Thu,  2 Nov 2023 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698942305;
 bh=ZP/kIBCdvT4zzHe9YkNWVQ0ufjZVnXPWplIffBkOZoU=;
 h=From:Date:Subject:To:Cc:From;
 b=mva+y3X476vfa8R9Ay7i+hgpOKdcBcnT38YLWatpi/J8z8Z6sPJZsOtffdqm7TfpG
 VRuccAfqXOOUW5HLNq/PDoDaIH9jezPF/Qrjze+v/BtdTwA6ug9URafaxvMWtlHok6
 s00AoYSmXQmmr/XCNSgDOPYumIUd1DaV0TiI5gH6T+DYbG50NpuLzr+dWfmINnt8Tw
 VYY3T4Z6fUsewqp3Ov5l3g3EVsO4Atjw9MocsBie8EjEf4fFQwPyiYWFY8QtUOAbVp
 4fBqiMhkSexrR4dxZLHOKHFaK0T+d89HUEknPkspkOg6CQy2koq5v7dc6hPEUAoDlY
 g0JHHZqIrez0g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 02 Nov 2023 09:24:53 -0700
Subject: [PATCH] drm/amd/display: Increase frame warning limit for clang in
 dml2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFTNQ2UC/x3NSwrDMAwA0asErSuIHejvKqUL1ZZdQawEmbQlI
 XeP6XI2bzaobMIV7t0Gxh+pMmkLd+ogvEkzo8TW4Hs/ONd7pBLzvGAso0fRYEyVMRkVxior45d
 MRTOmyTCMTcBwG17RxzNdLw6aOxsn+f2fj+e+H2ns4L+DAAAA
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZP/kIBCdvT4zzHe9YkNWVQ0ufjZVnXPWplIffBkOZoU=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDKnOZxOE5a7O1RNk3ayX/IjH2VpChG1W37WPdUsva134J
 bep79PpjlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCR0hiGv9Jd7iE/9zJdrvsU
 L3/8f5hZQVXfqbU/bjyftcxv83NBqZsM//3PJT6qUm/167ww8/p3VffuTYYm+5ui1ikLfqyrUt1
 0mgsA
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

When building ARCH=x86_64 allmodconfig with clang, which have sanitizers
enabled, there is a warning about a large stack frame.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6265:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
   6265 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
        |             ^
  1 error generated.

Notably, GCC 13.2.0 does not do too much of a better job, as it is right
at the current limit of 2048:

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

There is some effort to improve clang's code generation but that may
take some time between code review, shifting priorities, and release
cycles. To avoid having a noticeable or lengthy breakage in
all{mod,yes}config, which are easy testing targets that have -Werror
enabled, increase the limit for clang by 50% so that cases of extremely
poor code generation can still be caught while not breaking the majority
of builds. When clang's code generation improves, the limit increase can
be restricted to older clang versions.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
If there is another DRM pull before 6.7-rc1, it would be much
appreciated if this could make that so that other trees are not
potentially broken by this. If not, no worries, as it was my fault for
not sending this sooner.
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 70ae5eba624e..dff8237c0999 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -60,7 +60,7 @@ endif
 endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-frame_warn_flag := -Wframe-larger-than=2048
+frame_warn_flag := -Wframe-larger-than=$(if $(CONFIG_CC_IS_CLANG),3072,2048)
 endif
 
 CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)

---
base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-c93bd2d6a871

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

