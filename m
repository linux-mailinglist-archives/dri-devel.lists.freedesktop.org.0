Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE68BB136
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607F710E785;
	Fri,  3 May 2024 16:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aco0kBue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B4510E785;
 Fri,  3 May 2024 16:48:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 50DB061DC8;
 Fri,  3 May 2024 16:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E910C116B1;
 Fri,  3 May 2024 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714754895;
 bh=aE0iuQ/yueU4jPEF48i9AW4lOh1KcBQsXM/Bra676Po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Aco0kBueWG4Majy+thipijsqB5My9rzYpYkvr5e3CTpi0AypaPbjG/oOhG5lwgGTW
 xjswA5sEsW26MYKtyB5x96KR8qNT62YxRDY5EumKEzVtSAcq9uezlIHtcpLUz3hfNE
 0X4By2QImrFmUwXSUYCiN6SfEpuoST79hIQK4S6toK09rYqkqj7/4OnspR7XNFr1H5
 x7XO4XstfgAjbc3mDqqOKw5NG+0b7b/04zAg0ayYXln5M8ezwXQ+pxN3ssJfwBdmI1
 vKO/ENkX4douQVm9sbZ5ZnBj2joG1y1Br1NiQGV8FfIx6YlRZzrwj9sAa/Rd3Gy8dD
 EkxhokJ9WAMhw==
Date: Fri, 3 May 2024 09:48:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/msm/gen_header: allow skipping the validation
Message-ID: <20240503164812.GA4153965@thelio-3990X>
References: <20240409-fd-fix-lxml-v1-1-e5c300d6c1c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409-fd-fix-lxml-v1-1-e5c300d6c1c8@linaro.org>
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

Hi Dmitry,

On Tue, Apr 09, 2024 at 05:22:54PM +0300, Dmitry Baryshkov wrote:
> We don't need to run the validation of the XML files if we are just
> compiling the kernel. Skip the validation unless the user enables
> corresponding Kconfig option. This removes a warning from gen_header.py
> about lxml being not installed.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240409120108.2303d0bd@canb.auug.org.au/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |  8 ++++++++
>  drivers/gpu/drm/msm/Makefile                |  9 ++++++++-
>  drivers/gpu/drm/msm/registers/gen_header.py | 14 +++++++++++---
>  3 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index f202f26adab2..4c9bf237d4a2 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -54,6 +54,14 @@ config DRM_MSM_GPU_SUDO
>  	  Only use this if you are a driver developer.  This should *not*
>  	  be enabled for production kernels.  If unsure, say N.
>  
> +config DRM_MSM_VALIDATE_XML
> +	bool "Validate XML register files against schema"
> +	depends on DRM_MSM && EXPERT
> +	depends on $(success,$(PYTHON3) -c "import lxml")
> +	help
> +	  Validate XML files with register definitions against rules-fd schema.
> +	  This option is mostly targeting DRM MSM developers. If unsure, say N.

Is this change going to be applied? I have gotten a little tired of
seeing "lxml not found, skipping validation" in all of my builds :)

Cheers,
Nathan
