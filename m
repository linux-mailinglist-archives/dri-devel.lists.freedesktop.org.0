Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A171585815
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 04:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA74810E2C3;
	Sat, 30 Jul 2022 02:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBF010E042;
 Sat, 30 Jul 2022 02:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DoWUSFfdp1DbelCpJZW8+ybwygbd/m+exxYZmmyTXOc=; b=BIhMo1Y/s4qhZ3Hu44+7Yu3cDV
 vKphqnukwIKms2hZ7+8vymACWRWH7hzxDuEcZXqC7TSSeKrT+KQ5ntbvwBo8hknF0+pFx2+5W1O0g
 QTgkN46hoJZlA29R1HW+/2zMn7Ymf06F12Nw8ONwkxRKi6GB0qM11Xd2dM3C8b3ZYr8mA+NM59Pf6
 m48vr3icZtio49TVDQAQHEty93bQSajyMA6yNCBeTzKeFXIOWo+3Zs+NHSKgU51hKriIXYkCzo0JS
 bgr5Yih/H0xf9Xa7joLUzz8dgKazAi1QPPUzTlqutrq+ABhhSaGgSvVVvRTnQ2JyD2Ct3bpSCRsSh
 RH9tuuwQ==;
Received: from [187.34.27.134] (helo=[192.168.15.109])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oHcQe-00BiFl-Rj; Sat, 30 Jul 2022 04:42:12 +0200
Message-ID: <85a49b72-8bb7-b3b3-8a69-2c90cda8079d@igalia.com>
Date: Fri, 29 Jul 2022 23:41:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Stack-frame warnings in display_mode_vba_32.c
Content-Language: en-US
To: paulmck@kernel.org
References: <20220730022532.GA1234397@paulmck-ThinkPad-P17-Gen-1>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220730022532.GA1234397@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
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
Cc: sfr@canb.auug.org.au, arnd@arndb.de, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Às 23:25 de 29/07/22, Paul E. McKenney escreveu:
> Hello!
> 
> I am seeing the following in allmodconfig builds of recent -next on x86:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1659:1: error: the frame size of 2144 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>  1659 | }
>       | ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘dml32_ModeSupportAndSystemConfigurationFull’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3799:1: error: the frame size of 2480 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>  3799 | } // ModeSupportAndSystemConfigurationFull
>       | ^

I think they are fixed at amd-staging-drm-next:

git log --oneline amd/amd-staging-drm-next
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
953daa61981b drm/amd/display: Reduce stack size in the mode support function
361e705e712d drm/amd/display: reduce stack for
dml32_CalculatePrefetchSchedule
f2dbf5a4dd1e drm/amd/display: reduce stack for
dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
a0a68cda2ef8 drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
ca6730ca0f01 drm/amd/display: reduce stack for
dml32_CalculateSwathAndDETConfiguration
593eef8c1a5e drm/amd/display: reduce stack size in dcn32 dml (v2)

https://gitlab.freedesktop.org/agd5f/linux/-/commits/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c

> 
> Bisection located the commit shown below.  Doing an allmodconfig build
> on this commit reproduces the error, its parent builds fine.
> 
> Thoughts?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 3876a8b5e241081b2a519f848a65c00d8e6cd124
> Author: Guenter Roeck <linux@roeck-us.net>
> Date:   Tue Jul 12 15:42:47 2022 -0700
> 
>     drm/amd/display: Enable building new display engine with KCOV enabled
>     
>     The new display engine uses floating point math, which is not supported
>     by KCOV. Commit 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov
>     is enabled") tried to work around the problem by disabling
>     CONFIG_DRM_AMD_DC_DCN if KCOV_INSTRUMENT_ALL and KCOV_ENABLE_COMPARISONS
>     are enabled. The result is that KCOV can not be enabled on systems which
>     require this display engine. A much simpler and less invasive solution is
>     to disable KCOV selectively when compiling the display enagine while
>     keeping it enabled for the rest of the kernel.
>     
>     Fixes: 9d1d02ff3678 ("drm/amd/display: Don't build DCN1 when kcov is enabled")
>     Cc: Arnd Bergmann <arnd@arndb.de>
>     Cc: Leo Li <sunpeng.li@amd.com>
>     Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>     Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index b4029c0d5d8c5..96cbc87f7b6b8 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>  	bool "AMD DC - Enable new display engine"
>  	default y
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
> -	select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
> +	select DRM_AMD_DC_DCN if (X86 || PPC64)
>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and
> diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
> index 273f8f2c8e020..b9effadfc4bb7 100644
> --- a/drivers/gpu/drm/amd/display/dc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/Makefile
> @@ -25,6 +25,9 @@
>  DC_LIBS = basics bios dml clk_mgr dce gpio irq link virtual
>  
>  ifdef CONFIG_DRM_AMD_DC_DCN
> +
> +KCOV_INSTRUMENT := n
> +
>  DC_LIBS += dcn20
>  DC_LIBS += dsc
>  DC_LIBS += dcn10
