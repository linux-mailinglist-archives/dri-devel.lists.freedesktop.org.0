Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1623AAFE3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 11:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935276E8D4;
	Thu, 17 Jun 2021 09:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895196E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 09:36:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FA1F6113C;
 Thu, 17 Jun 2021 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623922598;
 bh=rFbz7ddQ5lVb4KOK6CYAdhGrdrfonTpIQrfTxyFj7NI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KhnlnHyr+d3MexGnkk89LnF7rdfZP7apMPGSyq3mdT6VpH7rewT/Flhhniz+NL/yA
 sZvCTl3UR5oGlAZwY8IlZZp/gqnHo+WBL0w4q8CBXV4dCZlUfckiXj9I0oKWWA0bxs
 PaM7IV/0hWfIrJr0DMZ9M7ZBzPMfZXAx7VXmQVZVVlRAAGWSADjg47V5B5hM9k4uvW
 JrskXYUoLWPoDitC3/yaJfsnanHHq62S6rgNoJyDI2qyYynSM8AK9cF4YG/Yr5mebH
 D4oOuEIyEMUQqRgroi1MeuRXjCg3aF56EjhUjvaqWCiwBCqwltwLik0bQLK9K6WMfX
 MABQIYBP5N2Qg==
Message-ID: <6e658588097ef8d864a7347b93a0d2b5d75c18b9.camel@kernel.org>
Subject: Re: vc4_bo_create: Failed to allocate from CMA
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Jun 2021 11:36:34 +0200
In-Reply-To: <e4374e18-2c81-a743-e387-f2512910314d@i2se.com>
References: <e4374e18-2c81-a743-e387-f2512910314d@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2021-06-12 at 17:17 +0200, Stefan Wahren wrote:
> Hi,
> 
> while testing the mainline kernel (arm64, defconfig) on Raspberry Pi 3 B
> Plus with Raspberry Pi OS - 64 bit, sometimes X doesn't start into
> desktop properly (unexpected and unusable login screen instead of auto
> login or mouse pointer is show shorty and than switch back to black
> screen in a loop). In that case dmesg shows the following:
> 
> [   74.737106] [drm:vc4_bo_create [vc4]] *ERROR* Failed to allocate from
> CMA:
> [   74.737558] vc4-drm soc:gpu: [drm]                            V3D: 
> 28976kb BOs (10)
> [   74.737602] vc4-drm soc:gpu: [drm]                     V3D
> shader:     44kb BOs (11)
> [   74.737632] vc4-drm soc:gpu: [drm]                           dumb:  
> 4564kb BOs (5)
> [   74.737664] vc4-drm soc:gpu: [drm]                         binner: 
> 16384kb BOs (1)
> [   74.737697] vc4-drm soc:gpu: [drm]                total purged
> BO:      4kb BOs (1)
> [   74.739039] [drm:vc4_bo_create [vc4]] *ERROR* Failed to allocate from
> CMA:
> [   74.739466] vc4-drm soc:gpu: [drm]                            V3D: 
> 28972kb BOs (9)
> [   74.739512] vc4-drm soc:gpu: [drm]                     V3D
> shader:     44kb BOs (11)
> [   74.739541] vc4-drm soc:gpu: [drm]                           dumb:  
> 4564kb BOs (5)
> [   74.739570] vc4-drm soc:gpu: [drm]                         binner: 
> 16384kb BOs (1)
> [   74.739602] vc4-drm soc:gpu: [drm]                total purged
> BO:      4kb BOs (1)
> [   74.740718] [drm:vc4_bo_create [vc4]] *ERROR* Failed to allocate from
> CMA:
> [   74.741138] vc4-drm soc:gpu: [drm]                            V3D: 
> 28972kb BOs (9)
> [   74.741171] vc4-drm soc:gpu: [drm]                     V3D
> shader:     44kb BOs (11)
> [   74.741202] vc4-drm soc:gpu: [drm]                           dumb:  
> 4564kb BOs (5)
> [   74.741231] vc4-drm soc:gpu: [drm]                         binner: 
> 16384kb BOs (1)
> [   74.741263] vc4-drm soc:gpu: [drm]                total purged
> BO:      4kb BOs (1)
> ...
> 
> I have only seen this issue on arm64 with latest mainline kernel
> (5.13.0-rc5-00130-gf21b807c3cf8), but also with older kernel versions.
> So it's not a regression. It seems 64 bit needs more CMA.
> 
> In case X started properly i was also able to reproduce these errors
> above by dis- and reconneting HDMI.
> 
> So i increased CMA in bcm283x.dtsi and the problem disappeared:
> 
> iff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index b83a864..d1304cb 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -37,7 +37,7 @@
>  
>          cma: linux,cma {
>              compatible = "shared-dma-pool";
> -            size = <0x4000000>; /* 64MB */
> +            size = <0x6000000>; /* 96MB */
>              reusable;
>              linux,cma-default;
>          };
> 
> The questions are:
> 
> Is this the right way (tm) to fix this problem?

Frankly I don't know if there is a better way. IIRC opensuse and downstream use
DT overlays to cater for this limitation. It seems reasonable to bump the
value. But it'll be in detriment of users that don't care much for graphical
interfaces. Nonetheless, I'm not familiar with how DRM handles CMA/DMA memory.
So let me have a look at it. Maybe there is a SW fix. At first glance I'm
surprised they can't defer to normal page allocations when CMA isn't capable of
honoring the request (like the dma code does).

> And what is a sensible value (don't have a 4K display to test)?

The default for downstream is 256MB. But I've read discussions in the forum
where people needed even more. IIUC it's use-case dependent, resolution is only
one variable, you might then try to run a game and run out of memory there.

Regards,
Nicolas

