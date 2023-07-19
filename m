Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0F75967A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 15:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F38010E49D;
	Wed, 19 Jul 2023 13:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88AE10E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:20:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A06E6167D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AECC433CC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689772807;
 bh=yZoCxvNF5s0gL/fZtsW+zvWlIovQA8LgUz6UkdxGC18=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UTq8MODzPkzNer59YJUBnaaaoPdxMDZDwBTeY8DGvGFV0Up2TLiIY1wMf6+5fhnlI
 cRCT661pgtW/hgIqJdzB7uXVS6fr7ec5HYDp8jiaqBTk4w8Vn8NJsus6KEYayL8m5d
 T/iiWCvAVOWHaJKl2iHpKiWozVWYLww9Jfke1+rIYyTRlHHMJLeiNh9BtuFtWMkJ5l
 E491CvIsjUafNym+sOv7tMueGk4kMtBePOnANhV2Nrh994J1BCtfH+T2St7nD6TQAi
 QpRrVS+9cuoi7nuCFFEpCsJVA0DDCxC/Kt4/DOuwAZQ+fgKAou8UeOPtQQa0JeoCy7
 PzP9ndlDCHdVw==
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-51e5da802afso9730636a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:20:07 -0700 (PDT)
X-Gm-Message-State: ABy/qLY0VQCv5hm7s4wGlDQriGa6OtLG4IDNYioK6B+VagFADLwo73W7
 sl5OyeEmqo8J/bW7TtarnRFlsEmIY5JU6zCs8yY=
X-Google-Smtp-Source: APBJJlEDeW95vT+WNkySLB6ZtDyRARDMOnCg+A22VzfETzmrlrUEu1VhsXzk4cBSycG25SK3nm1qSXDZjkA6ddn0NTM=
X-Received: by 2002:ac2:5f03:0:b0:4f6:47a2:7bb4 with SMTP id
 3-20020ac25f03000000b004f647a27bb4mr10457024lfq.60.1689772785438; Wed, 19 Jul
 2023 06:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-10-arnd@kernel.org>
In-Reply-To: <20230719123944.3438363-10-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 19 Jul 2023 15:19:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF4YZXqG8Hu-dHZo3mxSk2d1n5gPPzQrPYPyFo1do=wFA@mail.gmail.com>
Message-ID: <CAMj1kXF4YZXqG8Hu-dHZo3mxSk2d1n5gPPzQrPYPyFo1do=wFA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] efi: move screen_info into efi init code
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>,
 linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-riscv@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jul 2023 at 14:41, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> After the vga console no longer relies on global screen_info, there are
> only two remaining use cases:
>
>  - on the x86 architecture, it is used for multiple boot methods
>    (bzImage, EFI, Xen, kexec) to commicate the initial VGA or framebuffer
>    settings to a number of device drivers.
>
>  - on other architectures, it is only used as part of the EFI stub,
>    and only for the three sysfb framebuffers (simpledrm, simplefb, efifb).
>
> Remove the duplicate data structure definitions by moving it into the
> efi-init.c file that sets it up initially for the EFI case, leaving x86
> as an exception that retains its own definition for non-EFI boots.
>
> The added #ifdefs here are optional, I added them to further limit the
> reach of screen_info to configurations that have at least one of the
> users enabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm/kernel/setup.c                       |  4 ----
>  arch/arm64/kernel/efi.c                       |  4 ----
>  arch/arm64/kernel/image-vars.h                |  2 ++
>  arch/ia64/kernel/setup.c                      |  4 ----
>  arch/loongarch/kernel/efi.c                   |  3 ++-
>  arch/loongarch/kernel/image-vars.h            |  2 ++
>  arch/loongarch/kernel/setup.c                 |  5 -----
>  arch/riscv/kernel/image-vars.h                |  2 ++
>  arch/riscv/kernel/setup.c                     |  5 -----
>  drivers/firmware/efi/efi-init.c               | 14 +++++++++++++-
>  drivers/firmware/efi/libstub/efi-stub-entry.c |  8 +++++++-
>  11 files changed, 28 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 86c2751f56dcf..135b7eff03f72 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -939,10 +939,6 @@ static struct screen_info vgacon_screen_info = {
>  };
>  #endif
>
> -#if defined(CONFIG_EFI)
> -struct screen_info screen_info;
> -#endif
> -
>  static int __init customize_machine(void)
>  {
>         /*
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 3afbe503b066f..ff2d5169d7f1f 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -71,10 +71,6 @@ static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
>         return pgprot_val(PAGE_KERNEL_EXEC);
>  }
>
> -/* we will fill this structure from the stub, so don't put it in .bss */
> -struct screen_info screen_info __section(".data");
> -EXPORT_SYMBOL(screen_info);
> -
>  int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
>  {
>         pteval_t prot_val = create_mapping_protection(md);
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 35f3c79595137..5e4dc72ab1bda 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -27,7 +27,9 @@ PROVIDE(__efistub__text                       = _text);
>  PROVIDE(__efistub__end                 = _end);
>  PROVIDE(__efistub___inittext_end               = __inittext_end);
>  PROVIDE(__efistub__edata               = _edata);
> +#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  PROVIDE(__efistub_screen_info          = screen_info);
> +#endif
>  PROVIDE(__efistub__ctype               = _ctype);
>
>  PROVIDE(__pi___memcpy                  = __pi_memcpy);
> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
> index 82feae1323f40..e91a91b5e9142 100644
> --- a/arch/ia64/kernel/setup.c
> +++ b/arch/ia64/kernel/setup.c
> @@ -86,10 +86,6 @@ EXPORT_SYMBOL(local_per_cpu_offset);
>  #endif
>  unsigned long ia64_cycles_per_usec;
>  struct ia64_boot_param *ia64_boot_param;
> -#if defined(CONFIG_EFI)
> -/* No longer used on ia64, but needed for linking */
> -struct screen_info screen_info;
> -#endif
>  #ifdef CONFIG_VGA_CONSOLE
>  unsigned long vga_console_iobase;
>  unsigned long vga_console_membase;
> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
> index 9fc10cea21e10..df7db34024e61 100644
> --- a/arch/loongarch/kernel/efi.c
> +++ b/arch/loongarch/kernel/efi.c
> @@ -115,7 +115,8 @@ void __init efi_init(void)
>
>         set_bit(EFI_CONFIG_TABLES, &efi.flags);
>
> -       init_screen_info();
> +       if (IS_ENABLED(CONFIG_EFI_EARLYCON) || IS_ENABLED(CONFIG_SYSFB))
> +               init_screen_info();
>
>         if (boot_memmap == EFI_INVALID_TABLE_ADDR)
>                 return;
> diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
> index e561989d02de9..5087416b9678d 100644
> --- a/arch/loongarch/kernel/image-vars.h
> +++ b/arch/loongarch/kernel/image-vars.h
> @@ -12,7 +12,9 @@ __efistub_kernel_entry                = kernel_entry;
>  __efistub_kernel_asize         = kernel_asize;
>  __efistub_kernel_fsize         = kernel_fsize;
>  __efistub_kernel_offset                = kernel_offset;
> +#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_screen_info          = screen_info;
> +#endif
>
>  #endif
>
> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
> index 77e7a3722caa6..4570c3149b849 100644
> --- a/arch/loongarch/kernel/setup.c
> +++ b/arch/loongarch/kernel/setup.c
> @@ -16,7 +16,6 @@
>  #include <linux/dmi.h>
>  #include <linux/efi.h>
>  #include <linux/export.h>
> -#include <linux/screen_info.h>
>  #include <linux/memblock.h>
>  #include <linux/initrd.h>
>  #include <linux/ioport.h>
> @@ -57,10 +56,6 @@
>  #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>  #define LOONGSON_EFI_ENABLE            (1 << 3)
>
> -#ifdef CONFIG_EFI
> -struct screen_info screen_info __section(".data");
> -#endif
> -
>  unsigned long fw_arg0, fw_arg1, fw_arg2;
>  DEFINE_PER_CPU(unsigned long, kernelsp);
>  struct cpuinfo_loongarch cpu_data[NR_CPUS] __read_mostly;
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 15616155008cc..89d92f9644d5e 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -27,7 +27,9 @@ __efistub__start              = _start;
>  __efistub__start_kernel                = _start_kernel;
>  __efistub__end                 = _end;
>  __efistub__edata               = _edata;
> +#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_screen_info          = screen_info;
> +#endif
>
>  #endif
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index a3dbe13f45fb3..aea585dc8e8f3 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -15,7 +15,6 @@
>  #include <linux/memblock.h>
>  #include <linux/sched.h>
>  #include <linux/console.h>
> -#include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
>  #include <linux/sched/task.h>
>  #include <linux/smp.h>
> @@ -39,10 +38,6 @@
>
>  #include "head.h"
>
> -#if defined(CONFIG_EFI)
> -struct screen_info screen_info __section(".data");
> -#endif
> -
>  /*
>   * The lucky hart to first increment this variable will boot the other cores.
>   * This is used before the kernel initializes the BSS so it can't be in the
> diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
> index ef0820f1a9246..d4987d0130801 100644
> --- a/drivers/firmware/efi/efi-init.c
> +++ b/drivers/firmware/efi/efi-init.c
> @@ -55,6 +55,15 @@ static phys_addr_t __init efi_to_phys(unsigned long addr)
>
>  extern __weak const efi_config_table_type_t efi_arch_tables[];
>
> +/*
> + * x86 defines its own screen_info and uses it even without EFI,
> + * everything else can get it from here.
> + */
> +#if !defined(CONFIG_X86) && (defined(CONFIG_SYSFB) || defined(CONFIG_EFI_EARLYCON))
> +struct screen_info screen_info __section(".data");
> +EXPORT_SYMBOL_GPL(screen_info);
> +#endif
> +
>  static void __init init_screen_info(void)
>  {
>         struct screen_info *si;
> @@ -240,5 +249,8 @@ void __init efi_init(void)
>         memblock_reserve(data.phys_map & PAGE_MASK,
>                          PAGE_ALIGN(data.size + (data.phys_map & ~PAGE_MASK)));
>
> -       init_screen_info();
> +       if (IS_ENABLED(CONFIG_X86) ||
> +           IS_ENABLED(CONFIG_SYSFB) ||
> +           IS_ENABLED(CONFIG_EFI_EARLYCON))
> +               init_screen_info();
>  }
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index 2f1902e5d4075..a6c0498351905 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -13,7 +13,13 @@ struct screen_info *alloc_screen_info(void)
>  {
>         if (IS_ENABLED(CONFIG_ARM))
>                 return __alloc_screen_info();
> -       return (void *)&screen_info + screen_info_offset;
> +
> +       if (IS_ENABLED(CONFIG_X86) ||
> +           IS_ENABLED(CONFIG_EFI_EARLYCON) ||
> +           IS_ENABLED(CONFIG_SYSFB))
> +               return (void *)&screen_info + screen_info_offset;
> +
> +       return NULL;
>  }
>
>  /*
> --
> 2.39.2
>
