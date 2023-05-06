Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F025F6FBFEB
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E3E10E338;
	Tue,  9 May 2023 07:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE3B10E06C;
 Sat,  6 May 2023 14:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1683382500; bh=Sk09wyQy5/FQtij63zDaOgIadfEpa+myOBVzxsk5bmM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CpLYV/T4z4PgUQ9VcG/QpNyjw7V9VB15VBlKEOfRxi7e8a0IVhEHDwSCg3/PhvlGZ
 bK7k6BlI5IWeh+cIPkTA9oI5Yu8/XwYI+7MkRORXB5j5Ql4YsehYZj1KST05GGht5b
 0dcaryZDyjadD9JCk9ZHPQ6zqLTHvWaFNTxvhnSg=
Received: from [100.100.33.167] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5309760106;
 Sat,  6 May 2023 22:15:00 +0800 (CST)
Message-ID: <e6da1c1d-8c4a-920f-07a9-86679d579500@xen0n.name>
Date: Sat, 6 May 2023 22:14:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230505113233.3813801-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 09 May 2023 07:04:45 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Xuefeng Li <lixuefeng@loongson.cn>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/5/5 19:32, Huacai Chen wrote:
> Now LoongArch provides kernel_fpu_begin() and kernel_fpu_end() in commit
> 2b3bd32ea3a22ea2d ("LoongArch: Provide kernel fpu functions"), so we can
> enable DC_FP for DCN devices.

Some grammatical fixes and paraphrasing:

"LoongArch now provides kernel_fpu_{begin,end} that are used like the 
x86 counterparts in commit 2b3bd32ea3a22ea2d ("LoongArch: Provide kernel 
fpu functions"), so we can now implement DRM_AMD_DC_FP on LoongArch for 
supporting more DCN devices."

> 
> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

I just finished my tests according to the link above and all seems fine.

* Board: A2101 (Loongson 3A5000 with LS7A1000 bridge)
   - with the firmware provided at [1]
* GPU: RX 6400 (PowerColor ITX RX6400 4GB GDDR6)
* Display: Dell P2317H (connected via DisplayPort)
* Kernel: next-20230505 with this patch (with the conflict resolved)
* Sysroot: up-to-date Gentoo/LoongArch

I've tested:

* Desktop sessions: Xfce4, Plasma Wayland
* Hot-plugging
   - at tty, at sddm, inside Plasma Wayland session, multiple times each
* Changing resolutions
* kms_flip tests: every non-skipped case passed (I can't test 
dual-monitor right now)

[1]: https://github.com/loongson/Firmware/tree/main/5000Series/PC/A2101

Hence it's:

Tested-by: WANG Xuerui <kernel@xen0n.name>

> ---
> V2: Update commit message to add the commit which provides kernel fpu
>      functions.
> 
>   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
>   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
>   3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 2d8e55e29637..49df073962d5 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>   	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>   	select SND_HDA_COMPONENT if SND_HDA_CORE
>   	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>   	help
>   	  Choose this option if you want to use the new display engine
>   	  support for AMDGPU. This adds required support for Vega and
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 1743ca0a3641..86f4c0e04654 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -33,6 +33,8 @@
>   #include <asm/cputable.h>
>   #elif defined(CONFIG_ARM64)
>   #include <asm/neon.h>
> +#elif defined(CONFIG_LOONGARCH)
> +#include <asm/fpu.h>
>   #endif
>   
>   /**
> @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const int line)
>   	*pcpu += 1;
>   
>   	if (*pcpu == 1) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		kernel_fpu_begin();

And with the conflict here with linux-next resolved then we may be good 
to go.

>   #elif defined(CONFIG_PPC64)
>   		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> @@ -127,7 +129,7 @@ void dc_fpu_end(const char *function_name, const int line)
>   	pcpu = get_cpu_ptr(&fpu_recursion_depth);
>   	*pcpu -= 1;
>   	if (*pcpu <= 0) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		kernel_fpu_end();
>   #elif defined(CONFIG_PPC64)
>   		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 01db035589c5..542962a93e8f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
>   dml_rcflags := -mgeneral-regs-only
>   endif
>   
> +ifdef CONFIG_LOONGARCH
> +dml_ccflags := -mfpu=64
> +dml_rcflags := -msoft-float
> +endif
> +
>   ifdef CONFIG_CC_IS_GCC
>   ifneq ($(call gcc-min-version, 70100),y)
>   IS_OLD_GCC = 1

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

