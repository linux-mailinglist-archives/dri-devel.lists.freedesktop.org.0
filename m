Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C30251430
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 10:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C1D6E88B;
	Tue, 25 Aug 2020 08:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CB56E88B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 08:27:45 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o8so6987609otp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 01:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hxg7mNwlR3vuscL5TlgoioLVulJhR5tUG0gm7sNHuU=;
 b=pPyosm+j9HdrVTDoBx5vqCf+LUgp6oWcyrMwybcHG/1q9nMIMyXShfaYaEAZO7drkF
 OkF1jT1Zjb0aRyiulaCy0CdpmeN8yUAO2J7rvmbZCC6PN5zdDBW5fmtYmvV/30rYnDoc
 Qeioy7oNLyy7AG3DOUN47yLUkyRL+K4IRYiCfiqB7xwk8lT/2mP7WfGpPoBwwtI3ZpE3
 r/vQ5LLEYFTDQqptj/UYRreh/9u4sYxhEkEJTFiO+cNuo8h2OoTRJGswDlzUfzj1VioJ
 zIk/x8aEfwGgLgcA63BAHQoe0cnBsDOp8ugio8EihjUvTyCM+KEcJ1/zVxBjUfaonc0u
 aN5Q==
X-Gm-Message-State: AOAM532lXaYgkzLAfCSjuv6HduUahcKJMAyt36S24/A14Ye84R9+szok
 3QjYhwGBz4IoKS77wqKJnLdd9Y7T9GDngycXiWA=
X-Google-Smtp-Source: ABdhPJx0zXPstCnHnri8lFi7O8MyFA9EVV1YuGVzMSeMep6iCVN61tQvMEWQU45MOEt5Xh8X+3G5H74q0zQlBpGScQA=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr6283711otn.250.1598344064333; 
 Tue, 25 Aug 2020 01:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200825081909.2797-1-geert@linux-m68k.org>
In-Reply-To: <20200825081909.2797-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2020 10:27:32 +0200
Message-ID: <CAMuHMdUZgx51cFuJdeKo57pmRX+NB+OBxsCv1sg46=MLxouN7w@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.9-rc2
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 25, 2020 at 10:23 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.9-rc2[1] to v5.9-rc1[3], the summaries are:
>   - build errors: +12/-0

  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
error: implicit declaration of function 'disable_kernel_vsx'
[-Werror=implicit-function-declaration]:  => 676:2
  + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
error: implicit declaration of function 'enable_kernel_vsx'
[-Werror=implicit-function-declaration]:  => 640:2

powerpc-gcc4.9/ppc64_book3e_allmodconfig

  + error: arch/sparc/kernel/head_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against `.init.text':  => (.head.text+0x5040),
(.head.text+0x5100)
  + error: arch/sparc/kernel/head_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text
section in arch/sparc/kernel/trampoline_32.o:  => (.init.text+0xa4)
  + error: arch/sparc/kernel/process_32.o: relocation truncated to
fit: R_SPARC_WDISP22 against `.text':  => (.fixup+0x4), (.fixup+0xc)
  + error: arch/sparc/kernel/signal_32.o: relocation truncated to fit:
R_SPARC_WDISP22 against `.text':  => (.fixup+0x28), (.fixup+0x1c),
(.fixup+0x34), (.fixup+0x10), (.fixup+0x4)

sparc64/sparc-allmodconfig

  + error: modpost: "devm_ioremap"
[drivers/net/ethernet/xilinx/ll_temac.ko] undefined!:  => N/A
  + error: modpost: "devm_ioremap_resource"
[drivers/net/ethernet/xilinx/xilinx_emac.ko] undefined!:  => N/A
  + error: modpost: "devm_of_iomap"
[drivers/net/ethernet/xilinx/ll_temac.ko] undefined!:  => N/A
  + error: modpost: "devm_platform_ioremap_resource"
[drivers/iio/adc/adi-axi-adc.ko] undefined!:  => N/A
  + error: modpost: "devm_platform_ioremap_resource"
[drivers/ptp/ptp_ines.ko] undefined!:  => N/A
  + error: modpost: "devm_platform_ioremap_resource_byname"
[drivers/net/ethernet/xilinx/ll_temac.ko] undefined!:  => N/A

um-x86_64/um-all{mod,yes}config

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/d012a7190fc1fd72ed48911e77ca97ba4521bccd/ (all 192 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/9123e3a74ec7b934a4a099e98af6a61c2f80bbf5/ (all 192 configs)
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
