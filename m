Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D63A2290A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 08:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F3910E273;
	Thu, 30 Jan 2025 07:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W/Wu4myP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DC210E273;
 Thu, 30 Jan 2025 07:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7BD5FA41B34;
 Thu, 30 Jan 2025 07:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C9CC4CED2;
 Thu, 30 Jan 2025 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1738220672;
 bh=4jivC6LP33sqHcamtkNrVE//7hbpZlTsOyw8xSt8r0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W/Wu4myP/aHEawNyadI78+Y1eFnLgl67sXzcIGjYUM2iepYtQ1weX82Cz439bel6V
 KKmO78/ykXhn8lLwUk0wJpIW4IkmwUXv0ZwKfLmaPM7GxC0vJhyRDCjyoOVea07osC
 ONbYnwHtJM6xyOgoRj4qp+7Tj1ym0ZgDP6CE3zjk=
Date: Thu, 30 Jan 2025 08:04:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>,
 Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/amd/display: Increase sanitizer frame larger than
 limit when compile testing with clang
Message-ID: <2025013003-audience-opposing-7f95@gregkh>
References: <20241219-amdgpu-dml2-address-clang-frame-larger-than-allconfig-v1-1-8c53a644d486@kernel.org>
 <CADnq5_Pun+zN1=B0eFMw1w8k_oD3fw626SdaEug24YRg8aOLKw@mail.gmail.com>
 <2025013058-fasting-gibberish-9718@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025013058-fasting-gibberish-9718@gregkh>
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

On Thu, Jan 30, 2025 at 07:47:59AM +0100, Greg KH wrote:
> On Mon, Jan 06, 2025 at 12:29:32PM -0500, Alex Deucher wrote:
> > Applied.  Thanks!
> 
> Thanks, but I am still getting this error on Linus's current tree right
> now, with this commit applied:
> 
>   CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.o
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6713:12: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_support' [-Werror,-Wframe-larger-than]
>  6713 | dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
>       |            ^
> 1 error generated.
> 
> 
> I think the issue is:
> 
> > > --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > > +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> > > @@ -29,7 +29,11 @@ dml2_rcflags := $(CC_FLAGS_NO_FPU)
> > >
> > >  ifneq ($(CONFIG_FRAME_WARN),0)
> > >  ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> 
> I do not have CONFIG_KASAN or CONFIG_KCSAN enabled, but I do have:
> 
> > > +ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> 
> These two options enabled, and for some reason:
> 	CONFIG_FRAME_WARN=2048
> as well.
> 
> Ah, 2048 is the default value, that's how.
> 
> So this warning triggers even without KASAN or KCSAN being enabled, is
> that to be expected?  Is the stack really being used that much here?
> 
> I'll go bump FRAME_WARN up to get some local testing working again, but
> odds are others are going to hit this if I am in my "normal" build
> tests.

Ick, no, bumping CONFIG_FRAME_WARN=8192 doesn't fix this here either.
Any hints?

thanks,

greg k-h
