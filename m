Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC1928C23
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 18:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F40A10EC1B;
	Fri,  5 Jul 2024 16:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="BS5zMMfA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2196210EC1C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720196231; x=1720801031; i=wahrenst@gmx.net;
 bh=1oRwnciuEXkv2Uecg1J00P8VU6GnpRNyjC2WILIluhI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BS5zMMfAuDN9p/7E6Iortp4qvljfI4NKhSeBZ6sKybjZ0MzKOj9XmbzNBh2II2Nj
 5MNRiQqC/uR9OtRx+BrwG+5aeC5T/oLMva43RGgl9Vgw+t0fxlTAOypykQraTkilc
 GdnUDWdZRIND8wkypUGt3SNIS+bcfbiV12UA4ilBaCQVzHTGdmJGFi0k5JOyYrR0S
 pOYGs/NEf+5RgKvdvjoXtWAx+qwPL9LFV1PKFyPFZ8g2D5fscvULySS7Aoebw1FTa
 jgVmrx/iMa23u+r8L3vCCAqGqUBtcL83y8YjUo/2P1Nc+RKfZrpRAmOq+M/p/sWxS
 5OqztOSeTx9+xqNmAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1s0ubD3u7h-00hsLn; Fri, 05
 Jul 2024 18:17:11 +0200
Message-ID: <85107d7a-44b4-442b-8bd1-de08790feded@gmx.net>
Date: Fri, 5 Jul 2024 18:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: Increased CMA usage after replace drm_gem_dma_object for
 drm_gem_object in vc4_exec_info
To: Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <maxime@cerno.tech>, Melissa Wen <mwen@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
References: <6a13d674-96d3-40a2-8d4b-634fc2aed836@gmx.net>
 <CAKMK7uFa1_dzyZX+GzgncynLAJu=0ZdddbmRSO6-ETep8B3dXA@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAKMK7uFa1_dzyZX+GzgncynLAJu=0ZdddbmRSO6-ETep8B3dXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KZncnkCBkpOvVlkTvL+JVimoquidWM+JKmZcAIF6+VEAjBAbeXj
 SLZz58/3FyenYIbSnN+ACDOBMhsWPp8Je/tI4cU/QFLUJiX8KaLjOZeKaf1A8DIBlCjq7i4
 Uc/2HIJj/Jp8+Nz8ivEAp1F0mHCj8R0zYn9zUW5749Lc+41OI2PyzFP5L5/SiM2KIcgl3x6
 sVJFrnyS7nVZ2JdSp+IPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1ICjHHNvIpM=;On6iYA3Cd0nFF63XFqeYoSQ1g5L
 7OW01YJD8jtCxeZAMwFP7xGF6D7Z88RNBU57B8eQ/BunsAAkczyFWuyxtI5teumXvOlZqfW27
 IFA5I9+xLKEWx/MRueZN6MKFMnN8x4vEdJDfHHolqb0lmQF/gUVriy8HTnCIb2R8MbwbcdzmE
 IQR5EDdN6q9IEOgmTH9b/iTDPFdxEewi/s1KMKzYo4DL7EPcgad777IcRdvs5fSe4u9mo+4hg
 QGaxxqLAf0EAf+2KSn0UHtGopFx5YwSpCahrLi6L4oxyBxa70yr99JWHPq+b24pRL0PwBCcaz
 lMz4w8muZ6BSWDd8tAvKOaD21ig/vpLoNZUcfRmKifG9+9Drb03Ck9XHpmt5fjE3f8YfvWcKd
 dNHhOfA5Fa/LT3sKvu2GvsdOTjKxBIs+b92LroLi461ykKahKRrZQ26JwsXxwEY6PL7ynRC9d
 3gOhIzodifQzdEdALum/5j4y+DyiOdesNjlMveNrkZp/hfmC+3jWLfrOaY0nF2lLX+NPRXJGF
 TWsBq98SABrfaZf/AsaXCQS424sTQvH3Y5tx5MOA43/5E2Pu/1NXo5YZwANYRvWb+UufslkLL
 UHWl/1MafxGOMPTmAg1iK4al3NKjkk8EZ5whI8sg7fw64liNOZdN/vAvvyqfJ71396F46Hw0g
 wWBm5fQV5RGgGBHUJmxHL4C1KfAQNKCuYX6wYvJVJSbNiDKStUP5h1LQ2qJsf/xLohgjw2bht
 Umh1kKvI+nXc+EQnjp4DUOTIuBOOQzJD3SV8ww9/+wefo/hrb3WLysw60dc5ATFEQofppxMyL
 EVqXyQNYDs/qfpBkuqlku6wEMImgE6P3ufwykL2ITUer8=
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

Hi,

Am 05.07.24 um 17:19 schrieb Daniel Vetter:
> Adding dri-devel
>
> On Fri, 5 Jul 2024 at 17:14, Stefan Wahren <wahrenst@gmx.net> wrote:
>
>     Hi,
>     last year my Raspberry Pi 3B Plus died, so i didn't noticed this
>     sooner.
>     If I ran Raspberry Pi OS Bullseye with X11 and a recent Mainline
>     Kernel
>     (arm/multi_v7_defconfig) on my new Raspberry Pi 3 B+, i'm getting th=
e
>     following errors:
>
>     [=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0
>     [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 6.10.0-rc1-g685505219723
>     (stefanw@stefanw-SCHENKER) (arm-linux-gnueabihf-gcc (GCC) 11.3.1
>     20220604 [releases/gcc-11 revision
>     591c0f4b92548e3ae2e8173f4f93984b1c7f62bb], GNU ld
>     (Linaro_Binutils-2022.06) 2.37.20220122) #1 SMP Wed Jul=C2=A0 3
>     19:57:14 CEST
>     2024
>     [=C2=A0=C2=A0=C2=A0 0.000000] CPU: ARMv7 Processor [410fd034] revisi=
on 4 (ARMv7),
>     cr=3D10c5383d
>     [=C2=A0=C2=A0=C2=A0 0.000000] CPU: div instructions available: patch=
ing division code
>     [=C2=A0=C2=A0=C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cach=
e, VIPT aliasing
>     instruction cache
>     [=C2=A0=C2=A0=C2=A0 0.000000] OF: fdt: Machine model: Raspberry Pi 3=
 Model B Plus
>     Rev 1.3
>     [=C2=A0=C2=A0=C2=A0 0.000000] random: crng init done
>     [=C2=A0=C2=A0=C2=A0 0.000000] Memory policy: Data cache writealloc
>     [=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.
>     [=C2=A0=C2=A0=C2=A0 0.000000] Reserved memory: created CMA memory po=
ol at 0x37000000,
>     size 64 MiB
>     [=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized node lin=
ux,cma,
>     compatible
>     id shared-dma-pool
>     [=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: 0x37000000..0x3affff=
ff (65536
>     KiB) map
>     reusable linux,cma
>     [=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:
>     [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [mem 0x0000000000000000-0x000000002fffffff]
>     [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty
>     [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 HighMem=C2=A0 [mem 0x00000=
00030000000-0x000000003b3fffff]
>     [=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node
>     [=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges
>     [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0=
x0000000000000000-0x000000003b3fffff]
>     [=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem
>     0x0000000000000000-0x000000003b3fffff]
>     [=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 17 pages/cpu s40404 r=
8192 d21036
>     u69632
>     [=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: s40404 r8192 d21036 u69632=
 alloc=3D17*4096
>     [=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
>     [=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: video=3DHDMI-A-1:=
1920x1200M@60
>     dma.dmachans=3D0x7ff5 bcm2709.boardrev=3D0xa020d3
>     bcm2709.serial=3D0x51972538
>     bcm2709.uart_clock=3D48000000 bcm2709.disk_led_gpio=3D29
>     bcm2709.disk_led_active_low=3D0 vc_mem.mem_base=3D0x3ec00000
>     vc_mem.mem_size=3D0x40000000 console=3DttyS1,115200 console=3Dtty1
>     root=3DPARTUUID=3Decfed651-02 rootfstype=3Dext4 fsck.repair=3Dyes ro=
otwait
>     [=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries: 13107=
2 (order: 7,
>     524288
>     bytes, linear)
>     [=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 65536 =
(order: 6, 262144
>     bytes, linear)
>     [=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping o=
n. Total
>     pages: 242688
>     [=C2=A0=C2=A0=C2=A0 0.000000] mem auto-init: stack:off, heap alloc:o=
ff, heap
>     free:off,
>     mlocked free:off
>     [=C2=A0=C2=A0=C2=A0 0.000000] Memory: 868880K/970752K available (153=
60K kernel code,
>     2535K rwdata, 6708K rodata, 2048K init, 426K bss, 36336K reserved,
>     65536K cma-reserved, 118784K highmem)
>     ...
>     [=C2=A0=C2=A0 56.187787] [drm:vc4_bo_create [vc4]] *ERROR* Failed to
>     allocate from
>     GEM DMA helper:
>     [=C2=A0=C2=A0 56.187870] vc4-drm soc:gpu: [drm] V3D:=C2=A0 36316kb B=
Os (40)
>     [=C2=A0=C2=A0 56.187884] vc4-drm soc:gpu: [drm] V3D shader:
>     124kb BOs (31)
>     [=C2=A0=C2=A0 56.187893] vc4-drm soc:gpu: [drm] dumb:=C2=A0=C2=A0 45=
64kb BOs (5)
>     [=C2=A0=C2=A0 56.187900] vc4-drm soc:gpu: [drm] binner:=C2=A0 16384k=
b BOs (1)
>     [=C2=A0=C2=A0 56.187909] vc4-drm soc:gpu: [drm]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tota=
l purged BO:
>     19540kb BOs (15)
>     [=C2=A0=C2=A0 56.188269] [drm:vc4_bo_create [vc4]] *ERROR* Failed to
>     allocate from
>     GEM DMA helper:
>     [=C2=A0=C2=A0 56.188315] vc4-drm soc:gpu: [drm] V3D:=C2=A0 35072kb B=
Os (30)
>     [=C2=A0=C2=A0 56.188325] vc4-drm soc:gpu: [drm] V3D shader:
>     124kb BOs (31)
>     [=C2=A0=C2=A0 56.188337] vc4-drm soc:gpu: [drm] dumb:=C2=A0=C2=A0 45=
64kb BOs (5)
>     [=C2=A0=C2=A0 56.188345] vc4-drm soc:gpu: [drm] binner:=C2=A0 16384k=
b BOs (1)
>     [=C2=A0=C2=A0 56.188354] vc4-drm soc:gpu: [drm]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tota=
l purged BO:
>     19540kb BOs (15)
>     ...
>
>     Except of these errors, X11 works as expected. Since I knew that thi=
s
>     setup shouldn't throw these errors without CMA modifications, I
>     bisected
>     this to this commit:
>
>     commit 47c07e46c86f310bed73b9c895155a49df3d5e71 (HEAD)
>     Author: Ma=C3=ADra Canal <mcanal@igalia.com>
>     Date:=C2=A0=C2=A0 Thu Feb 2 08:19:43 2023 -0300
>
>     drm/vc4: replace drm_gem_dma_object for drm_gem_object in
>     vc4_exec_info
>
>     After that I increased the CMA to 128 MB via Kernel cmdline and
>     compared
>     /proc/meminfo before and after the patch:
>
>     Before
>     CmaTotal:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 131072 kB
>     CmaFree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 20132 kB
>
>     After
>     CmaTotal:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 131072 kB
>     CmaFree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 5644 kB
>
>     So my question: is this noticable CMA increase expected by this
>     change?
>
>
> No, it shouldn't change anything. All it does is change the type we
> use to iterate over objects from the subclass to the base class in the
> command submission code. The resulting code should be entirely
> unchanged, if the compiler doesn't get confused at least and applies
> all the same optimizations.
>
> Can you please double-check that it's really this commit that makes
> the difference, and nothing else changed in the system?
Sorry, the fluctuation of meminfo wasn't a good indication so i used
"watch" on the output and it showed similiar values.

So i dropped the cma setting from cmdline in order to reproduce the
original issue. Unfortunately the error is reproducible only in 50%
percent of all cases. So I assume this is all caused by runtime (maybe
memory pressure) and a low CMA value.

Sorry for the noise
>
> Thanks, Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

