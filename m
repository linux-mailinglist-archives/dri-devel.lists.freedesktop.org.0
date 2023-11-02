Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD157DF875
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4200310E95A;
	Thu,  2 Nov 2023 17:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B8010E05D;
 Thu,  2 Nov 2023 17:12:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 904B0B81D65;
 Thu,  2 Nov 2023 17:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCAEC433C8;
 Thu,  2 Nov 2023 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698945159;
 bh=ryrWuOdl5QuvOo8MpWIUO841knqP3oJT43UEwAMLjDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/rvGNC6axkHxeKTK5U0IZVFi6LZ05A3vL9dJJVOW19SJZhOxitTGGSLBsSKyz2v2
 d3FXXgSnQYKc3wq32ofYyQoXw6ytZroz8Uo31TQOdsqwjPidNRIAxXpdyfsdZdRAYC
 u0APsG5geXUWVOnpi5aw1UOLhrKyoF3beWPdxRyMKcjoD2g0cpuplDzxm4XaJYQk2a
 1Mppxl/gVrH09BUeG/IqekPXY/m8VO4oDThYxRCT/L1W5Gu9E8OaKAqROfguT9UHD6
 WowWGw6Tp55BRZAtlORAOLEzG3yZeHasI8J1YouQP3Bn5srHf5RfB+XoA5ni+XfgTs
 Bz+4Ve/MSegrQ==
Date: Thu, 2 Nov 2023 10:12:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/amd/display: Increase frame warning limit for clang
 in dml2
Message-ID: <20231102171237.GA1184739@dev-arch.thelio-3990X>
References: <20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-v1-1-6eb157352931@kernel.org>
 <bb3b74c8-8ab5-472c-84c1-8aa0d8bfa3b8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb3b74c8-8ab5-472c-84c1-8aa0d8bfa3b8@amd.com>
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev, sunpeng.li@amd.com,
 trix@redhat.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 12:59:00PM -0400, Hamza Mahfooz wrote:
> On 11/2/23 12:24, Nathan Chancellor wrote:
> > When building ARCH=x86_64 allmodconfig with clang, which have sanitizers
> > enabled, there is a warning about a large stack frame.
> > 
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6265:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
> >     6265 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
> >          |             ^
> >    1 error generated.
> > 
> > Notably, GCC 13.2.0 does not do too much of a better job, as it is right
> > at the current limit of 2048:
> > 
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
> >     6705 | }
> >          | ^
> > 
> > In the past, these warnings have been avoided by reducing the number of
> > parameters to various functions so that not as many arguments need to be
> > passed on the stack. However, these patches take a good amount of effort
> > to write despite being mechanical due to code structure and complexity
> > and they are never carried forward to new generations of the code so
> > that effort has to be expended every new hardware generation, which
> > becomes harder to justify as time goes on.
> > 
> > There is some effort to improve clang's code generation but that may
> > take some time between code review, shifting priorities, and release
> > cycles. To avoid having a noticeable or lengthy breakage in
> > all{mod,yes}config, which are easy testing targets that have -Werror
> > enabled, increase the limit for clang by 50% so that cases of extremely
> > poor code generation can still be caught while not breaking the majority
> > of builds. When clang's code generation improves, the limit increase can
> > be restricted to older clang versions.
> > 
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > If there is another DRM pull before 6.7-rc1, it would be much
> > appreciated if this could make that so that other trees are not
> > potentially broken by this. If not, no worries, as it was my fault for
> > not sending this sooner.
> > ---
> >   drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > index 70ae5eba624e..dff8237c0999 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > @@ -60,7 +60,7 @@ endif
> >   endif
> >   ifneq ($(CONFIG_FRAME_WARN),0)
> > -frame_warn_flag := -Wframe-larger-than=2048
> > +frame_warn_flag := -Wframe-larger-than=$(if $(CONFIG_CC_IS_CLANG),3072,2048)
> 
> I would prefer checking for `CONFIG_KASAN || CONFIG_KCSAN` instead
> since the stack usage shouldn't change much if both of those are disabled.

So something like this? Or were you talking about replacing the clang
check entirely with the KASAN/KCSAN check?

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 70ae5eba624e..0fc1b13295eb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -60,8 +60,12 @@ endif
 endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
+ifeq ($(CONFIG_CC_IS_CLANG)$(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),yy)
+frame_warn_flag := -Wframe-larger-than=3072
+else
 frame_warn_flag := -Wframe-larger-than=2048
 endif
+endif
 
 CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o := $(dml2_ccflags)

> >   endif
> >   CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
> > 
> > ---
> > base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
> > change-id: 20231102-amdgpu-dml2-increase-frame-size-warning-for-clang-c93bd2d6a871
> > 
> > Best regards,
> -- 
> Hamza
> 
