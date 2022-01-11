Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD548B904
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6095A10F411;
	Tue, 11 Jan 2022 20:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A1710F409
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=NaqWFVPD5yQIsLxFNwU6hznpj4Tbd38uPn6NrjndwIQ=; b=DxE8TozFpC4e4PdN9ZsDYZQEsD
 9in9ykF5exZmMqNCTgn3/P9U3IDcpm4MKR4ZMMEnB1peH4kwrzmhSy4LmwxdMouHvPuFSaAx8mHS5
 C88HpMq5plOaYlsTNBTy6x8zSZLF8Yu1nqTNZC8fqVoIZNoAslj3aTyWGU0EqnbxwZaPapsWNkUQB
 eMJm32nZWGEqYg2apBhkf5doa+FFTZSbrKt8tgVoPO0Nr34l+/9eis4BCcDOEGd1Y4Nu6MDUFIRvy
 pVoao7bgWPOGkaJv2edDjgnFAyjOaKgBZy4scIIWFQvK0HDHFSaUufEkr4U+mJvl8wZE+LK4fU3pr
 dkT/yhuw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7O9l-003ZcZ-HI; Tue, 11 Jan 2022 20:54:14 +0000
Message-ID: <172e8971-f160-b04e-3250-b8743f31c820@infradead.org>
Date: Tue, 11 Jan 2022 12:54:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Unable to unselect VGA_ARB (VGA Arbitration)
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <b72ad376-7a42-1ff2-701d-7fb2f3333c64@molgen.mpg.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b72ad376-7a42-1ff2-701d-7fb2f3333c64@molgen.mpg.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On 1/11/22 12:28, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> I am using Linux 5.16, and I am unable to unset `VGA_ARB` in Kconfig (`make menuconfig`). I have an Asus F2A85-M PRO with an AMD A6-6400K APU (integrated Radeon graphics device), so no legacy stuff.
> 
> From `drivers/gpu/vga/Kconfig`:
> 
> ```
> config VGA_ARB
>         bool "VGA Arbitration" if EXPERT

You can modify VGA_ARB if you set ^^^^^^ "EXPERT".

>         default y
>         depends on (PCI && !S390)
>         help
>           […]
> 
> config VGA_ARB_MAX_GPUS
>         int "Maximum number of GPUs"
>         default 16
>         depends on VGA_ARB
>         help
>           […]
> 
> config VGA_SWITCHEROO
>         bool "Laptop Hybrid Graphics - GPU switching support"
>         depends on X86
>         depends on ACPI
>         depends on PCI
>         depends on (FRAMEBUFFER_CONSOLE=n || FB=y)
>         select VGA_ARB
>         help
>           […]
> ```
> 
> But in `make menuconfig` I am unable to unselect it.
> 
>     -*- VGA Arbitration
> 
> and the help says:
> 
>     Symbol: VGA_ARB [=y]
>     Type  : bool
>       Depends on: HAS_IOMEM [=y] && PCI [=y] && !S390
>       Visible if: HAS_IOMEM [=y] && PCI [=y] && !S390 && EXPERT [=n]
>       Location:
>         Main menu
>          -> Device Drivers
>            -> Graphics support
>     Selected by [n]:
>       - VGA_SWITCHEROO [=n] && HAS_IOMEM [=y] && X86 [=y] && ACPI [=y] && PCI [=y] && (!FRAMEBUFFER_CONSOLE [=y] || FB [=y]=y)
> 
> So, VGA_SWITCHEROO is not set, and, therefore, as `Selected by [n]:` suggests, I thought I’d be able to deselect it.
> 
> It’d be great if you could help me out.
> 
> 
> Kind regards,
> 
> Paul

-- 
~Randy
