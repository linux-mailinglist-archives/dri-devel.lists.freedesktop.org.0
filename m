Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F86F912E
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7ED10E247;
	Sat,  6 May 2023 10:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 516 seconds by postgrey-1.36 at gabe;
 Fri, 05 May 2023 17:54:36 UTC
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D712D10E64B;
 Fri,  5 May 2023 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1683308756; bh=QlShsxwd0kdvZtM/A05hD2rA+a7fXcPIOLRLtkUtidg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ww/K2YV77CbATKFRaApaPH2FSMy7OJGhhpwrNljc+ze+GID1qYSvLsWDUceDsHDaz
 FEI5xPdft4XqKoM4BDWfw4avHuQJrFe9Bdbsyup2JkDNBx1tQTvDd3M6WQEJsfCgjs
 32WFCAt43TFsKXHjWjarJCACsunGjXr/k3xJ4Uds=
Received: from [192.168.9.172] (unknown [101.228.138.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AC4F7600A6;
 Sat,  6 May 2023 01:45:55 +0800 (CST)
Message-ID: <70129238-a589-1d70-a7f2-50a35b4ee897@xen0n.name>
Date: Sat, 6 May 2023 01:45:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
To: Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
 <c4146636-2321-b271-b480-b8693169c119@amd.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <c4146636-2321-b271-b480-b8693169c119@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/5/23 21:39, Hamza Mahfooz wrote:
>
> Hey Huacai,
>
> On 5/5/23 07:32, Huacai Chen wrote:
>> Now LoongArch provides kernel_fpu_begin() and kernel_fpu_end() in commit
>> 2b3bd32ea3a22ea2d ("LoongArch: Provide kernel fpu functions"), so we can
>> enable DC_FP for DCN devices.
>
> Have you had the chance to test how well this is working on actual
> hardware, or was it only compile tested? If it was only compile tested,
> it would be great if you could run some tests. Please see the following
> for more details:
> https://lore.kernel.org/amd-gfx/8eb69dfb-ae35-dbf2-3f82-e8cc00e5389a@amd.com/ 
>
>
Thanks for the helpful link!

I did test an earlier version of this patch along with the 
arch/loongarch kernel FPU bits before that patch got upstreamed, with a 
RX 6400 (BEIGE_GOBY) on a Loongson 3A5000 + LS7A1000 system (by far the 
most popular combination for LoongArch desktops). Things like Plasma 
Wayland session or glmark2 work just fine, although I didn't go for the 
more complete testing as detailed in the mail you linked to. I'll try 
going through that procedure in the next 1~2 days when I have time & get 
physical access to that box.

On a side note, I had to modprobe amdgpu with runpm=0, otherwise my 
dmesg gets flooded with PSP getting resumed every 8~10 seconds or so. I 
currently have none of the connectors plugged in. I didn't notice any 
similar reports on the Internet so I don't know if it's due to platform 
quirks or not.

>>
>> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>> V2: Update commit message to add the commit which provides kernel fpu
>>      functions.
>>
>>   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
>>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
>>   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/Kconfig 
>> b/drivers/gpu/drm/amd/display/Kconfig
>> index 2d8e55e29637..49df073962d5 100644
>> --- a/drivers/gpu/drm/amd/display/Kconfig
>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>>       depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>>       select SND_HDA_COMPONENT if SND_HDA_CORE
>>       # !CC_IS_CLANG: 
>> https://github.com/ClangBuiltLinux/linux/issues/1752
>> -    select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && 
>> KERNEL_MODE_NEON && !CC_IS_CLANG))
>> +    select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) 
>> || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>>       help
>>         Choose this option if you want to use the new display engine
>>         support for AMDGPU. This adds required support for Vega and
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> index 1743ca0a3641..86f4c0e04654 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> @@ -33,6 +33,8 @@
>>   #include <asm/cputable.h>
>>   #elif defined(CONFIG_ARM64)
>>   #include <asm/neon.h>
>> +#elif defined(CONFIG_LOONGARCH)
>> +#include <asm/fpu.h>
>>   #endif
>>     /**
>> @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const 
>> int line)
>>       *pcpu += 1;
>>         if (*pcpu == 1) {
>> -#if defined(CONFIG_X86)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>>           kernel_fpu_begin();
This is going to conflict with commit b1bcdd409d2d ("drm/amd/display: 
Disable migration to ensure consistency of per-CPU variable"), which is 
present in next-20230505. Resolution is trivial though.
>>   #elif defined(CONFIG_PPC64)
>>           if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
>> @@ -127,7 +129,7 @@ void dc_fpu_end(const char *function_name, const 
>> int line)
>>       pcpu = get_cpu_ptr(&fpu_recursion_depth);
>>       *pcpu -= 1;
>>       if (*pcpu <= 0) {
>> -#if defined(CONFIG_X86)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>>           kernel_fpu_end();
>>   #elif defined(CONFIG_PPC64)
>>           if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile 
>> b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index 01db035589c5..542962a93e8f 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
>>   dml_rcflags := -mgeneral-regs-only
>>   endif
>>   +ifdef CONFIG_LOONGARCH
>> +dml_ccflags := -mfpu=64
>> +dml_rcflags := -msoft-float
>> +endif
>> +
>>   ifdef CONFIG_CC_IS_GCC
>>   ifneq ($(call gcc-min-version, 70100),y)
>>   IS_OLD_GCC = 1

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

