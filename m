Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D388D243
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 23:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A8A10F483;
	Tue, 26 Mar 2024 22:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="knur54c4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAEE10F47B;
 Tue, 26 Mar 2024 22:56:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C691FCE19AE;
 Tue, 26 Mar 2024 22:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A308FC433C7;
 Tue, 26 Mar 2024 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711493814;
 bh=uMrfzN4xjKjod6GbAc1xRQd4HusxFp38FVyEvv2mIkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=knur54c4eVgsNUNQfgkHX+FMHtB4w0y37mRCWkmBDyM1xKXZ8MEnDqG3oeYUBuu5o
 ZJSsNnndctin55unNbYnFqDuPY4yxaB9fjSaUFtd6aJvxVkabOL6FjKAOY3kc0ldkD
 B7Cc+0gwSEiGtr8Rpeh8CAVGPnsM6LVJ6JfU+8iihJKDUdPiNL2sGhCNvNQ94Hajhn
 gMoUEyyaIlTyQilt1rew3rAhVOyzX+QKEQ22d8dDg2L8shl2SJQZ61jNbsP+q4KV5l
 YWTODMdkdknK/m/AgVZgJWtg0IvDbXsFrLKonIZleuQzP46MtfjcU2o29F2cHA3JJc
 OaxpvvvnTDRhg==
Date: Tue, 26 Mar 2024 15:56:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
Message-ID: <20240326225650.GA2784736@dev-arch.thelio-3990X>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
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

On Tue, Mar 05, 2024 at 11:07:36AM +0200, Jani Nikula wrote:
> Add kconfig to enable -Werror subsystem wide. This is useful for
> development and CI to keep the subsystem warning free, while avoiding
> issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
> hit.
> 
> v2: Don't depend on COMPILE_TEST
> 
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/Kconfig  | 13 +++++++++++++
>  drivers/gpu/drm/Makefile |  3 +++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6e853acf15da..c08e18108c2a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -416,3 +416,16 @@ config DRM_LIB_RANDOM
>  config DRM_PRIVACY_SCREEN
>  	bool
>  	default n
> +
> +config DRM_WERROR
> +	bool "Compile the drm subsystem with warnings as errors"
> +	depends on EXPERT
> +	default n
> +	help
> +	  A kernel build should not cause any compiler warnings, and this
> +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
> +
> +	  The drm subsystem enables more warnings than the kernel default, so
> +	  this config option is disabled by default.
> +
> +	  If in doubt, say N.

While I understand the desire for an easy switch that maintainers and
developers can use to ensure that their changes are warning free for the
drm subsystem specifically, I think subsystem specific configuration
options like this are actively detrimental to developers and continuous
integration systems that build test the entire kernel. For example, we
turned off CONFIG_WERROR for our Hexagon builds because of warnings that
appear with -Wextra that are legitimate but require treewide changes to
resolve in a manner sufficient for Linus:

https://github.com/ClangBuiltLinux/linux/issues/1285
https://lore.kernel.org/all/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/

But now, due to CONFIG_DRM_WERROR getting enabled by all{mod,yes}config
and -Wextra being unconditionally enabled for DRM, those warnings hard
break the build despite CONFIG_WERROR=n...

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2eEBDGEqfmMZjGg3ZvDx2af2pde/build.log

Same thing with PowerPC allmodconfig because we see -Wframe-larger-than
that appears because allmodconfig enables CONFIG_KASAN or CONFIG_KCSAN
usually:

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2eE2HDsODudQGqkMKAPQnId7pRd/build.log

I don't know what the solution for this conflict is through. I guess it
is just the nature of the kernel being a federation of independent
subsystems that want to have their own policies. I suppose we can just
set CONFIG_DRM_WERROR=n and be done with it but I would like to avoid
this issue from spreading to other subsystems because it does not scale
for folks like us who do many builds across many trees.

It would be nice if there was something like CONFIG_WERROR_DIRS or
something that could take a set of directories that should have -Werror
enabled so that you could do something like

  CONFIG_WERROR_DIRS="drivers/gpu/drm"

and have -Werror automatically added to all commands within that
directory like subdir-ccflags-y but it is explicitly opt in on the part
of the developer/tester, rather than just happening to get enabled due
to all{mod,yes}config. No idea if that is feasible or not though.

> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ea456f057e8a..a73c04d2d7a3 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -30,6 +30,9 @@ subdir-ccflags-y += -Wno-sign-compare
>  endif
>  # --- end copy-paste
>  
> +# Enable -Werror in CI and development
> +subdir-ccflags-$(CONFIG_DRM_WERROR) += -Werror
> +
>  drm-y := \
>  	drm_aperture.o \
>  	drm_atomic.o \
> -- 
> 2.39.2
> 
