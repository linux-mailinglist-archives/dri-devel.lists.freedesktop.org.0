Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDEEA23373
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED9C10E9C1;
	Thu, 30 Jan 2025 17:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G8oX5K9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D2C10E079;
 Thu, 30 Jan 2025 17:51:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC3E6A41FE9;
 Thu, 30 Jan 2025 17:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37509C4CED2;
 Thu, 30 Jan 2025 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738259469;
 bh=8ILs2EZ7y01odK/7QB5fifvei6UxkDe+Ir0p9+/191I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8oX5K9c4LRa4Pr5PDZozggkVjj1XeWFu7puLplRrtcTdo+I700IuF3WswCeMcL1T
 /kp5mPc649rlST//FQgyr46iaZR8YYqxm3/dPgmUzOQ1JT05QcWaS62W+2adRyS/Cc
 o7x49moNqhdFGU+O9EKsSueNQmtSHFAxBqCkEYiq9AfqePeLKvKbVar9dsQbW0gybG
 GanDmfUNpscb6fB/fIN5hw9x0ijJJemGHC4TpvY4wliwI1XPC8ToIhlQXtw++sUoo9
 KNhxhHYOWdDhdHTEoM/9BjXxF/QQmLqbVClONZzuAGt4VdlKbBrh7Sxgzy2o8CZET6
 1cXh+A8ImG0VA==
Date: Thu, 30 Jan 2025 10:51:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Jun Lei <jun.lei@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/amd/display: Increase sanitizer frame larger than
 limit when compile testing with clang
Message-ID: <20250130175103.GA3394637@ax162>
References: <20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig-v1-1-8c53a644d486@kernel.org>
 <CADnq5_Pun+zN1=B0eFMw1w8k_oD3fw626SdaEug24YRg8aOLKw@mail.gmail.com>
 <2025013058-fasting-gibberish-9718@gregkh>
 <2025013003-audience-opposing-7f95@gregkh>
 <5d1cfcee-b575-4e01-8ec0-dd1bcbba9bc0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d1cfcee-b575-4e01-8ec0-dd1bcbba9bc0@amd.com>
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

Hey Greg and Harry,

On Thu, Jan 30, 2025 at 11:02:37AM -0500, Harry Wentland wrote:
> On 2025-01-30 02:04, Greg KH wrote:
> > On Thu, Jan 30, 2025 at 07:47:59AM +0100, Greg KH wrote:
> > > Thanks, but I am still getting this error on Linus's current tree right
> > > now, with this commit applied:
> > > 
> > >    CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
> > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6713:12: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_support' [-Werror,-Wframe-larger-than]
> > >   6713 | dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
> > >        |            ^
> > > 1 error generated.

Bummer, that means that commit a8d42cd228ec ("drm/amd/display: mark
static functions noinline_for_stack") did not help this case like I had
hoped that it would.

> > > I think the issue is:
> > > 
> > > > > --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > > > > +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > > > > @@ -29,7 +29,11 @@ dml2_rcflags := $(CC_FLAGS_NO_FPU)
> > > > > 
> > > > >   ifneq ($(CONFIG_FRAME_WARN),0)
> > > > >   ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> > > 
> > > I do not have CONFIG_KASAN or CONFIG_KCSAN enabled, but I do have:
> > > 
> > > > > +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> > > 
> > > These two options enabled, and for some reason:
> > > 	CONFIG_FRAME_WARN=2048
> > > as well.
> > > 
> > > Ah, 2048 is the default value, that's how.
> > > 
> > > So this warning triggers even without KASAN or KCSAN being enabled, is
> > > that to be expected?  Is the stack really being used that much here?

It is entirely possible. Look at how many parameters there are to some
of these functions, which have to be passed on the stack when the
compiler runs out of registers. When I looked into this at one point,
GCC was barely doing better than Clang in certain configurations. What
version of clang is this and would you mind sharing your configuration?

> > > I'll go bump FRAME_WARN up to get some local testing working again, but
> > > odds are others are going to hit this if I am in my "normal" build
> > > tests.
> > 
> > Ick, no, bumping CONFIG_FRAME_WARN=8192 doesn't fix this here either.
> > Any hints?
> > 
> 
> It looks like we always override CONFIG_FRAME_WARN...
> 
> > ifneq ($(CONFIG_FRAME_WARN),0)
> > ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> > ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> > frame_warn_flag := -Wframe-larger-than=4096
> > else
> > frame_warn_flag := -Wframe-larger-than=3072
> > endif
> > else
> > frame_warn_flag := -Wframe-larger-than=2048
> 
> ... right here for the default case.
> 
> You could bump that locally.
> 
> A more robust solution would be to do a greater-than check here
> (for all the cases) and only set -Wframe-larger-than if the value
> is greater than the one defined by CONFIG_FRAME_WARN. There are
> a few "-gt" uses in other Makefiles, so I would think it's fine
> to use that.
> 
> I'm no Makefile expert but if this seems like a reasonable course
> of action I can take a stab at it.

Something like this would work I think? I added indentation because it
was getting a little gnarly. I am happy to write a formal patch and send
it off if this looks acceptable.

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 46f9c05de16e..e1d500633dfa 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -29,11 +29,15 @@ dml_ccflags := $(CC_FLAGS_FPU)
 dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-frame_warn_flag := -Wframe-larger-than=3072
-else
-frame_warn_flag := -Wframe-larger-than=2048
-endif
+    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+        frame_warn_limit := 3072
+    else
+        frame_warn_limit := 2048
+    endif
+
+    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
+        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
+    endif
 endif
 
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 91c4f3b4bd5f..21fd466dba26 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -28,15 +28,19 @@ dml2_ccflags := $(CC_FLAGS_FPU)
 dml2_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
-frame_warn_flag := -Wframe-larger-than=4096
-else
-frame_warn_flag := -Wframe-larger-than=3072
-endif
-else
-frame_warn_flag := -Wframe-larger-than=2048
-endif
+    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
+            frame_warn_limit := 4096
+        else
+            frame_warn_limit := 3072
+        endif
+    else
+        frame_warn_limit := 2048
+    endif
+
+    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
+        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
+    endif
 endif
 
 subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/dml2
