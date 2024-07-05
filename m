Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AC928B82
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 17:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7891710E262;
	Fri,  5 Jul 2024 15:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SDXxiems";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843E610E262
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 15:20:05 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-25e19ad0050so336663fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720192804; x=1720797604; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yVIaMr3VV9q0tqzRrCwjg3C4RyaY8vMcyWD00KlGcoI=;
 b=SDXxiemsHTU8R2JITydvWlJIgLCnozHPSy0iVUFNj71kJG3LU5yd4DLfH8F0jZ0AdU
 oj5nr2eM1dHPFZGzRCAshdTlZeB86ijyj8vrSw9lnVQsSLVqdcrINTG7TJpHxKzv8TIs
 k/wu58QywZjJaL2E2hjRucS+fHFXItNQYyQB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720192804; x=1720797604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVIaMr3VV9q0tqzRrCwjg3C4RyaY8vMcyWD00KlGcoI=;
 b=w8MIRKan0nh1I1qyY0hMbaAyv53oxyLplxzpgL248GnlIeehU3nbpW5TkA86OFe4ro
 4CDV0B03jEmMeyqkdKquV34tkPiAvs+Q4YphX2QDtaS6ucjYw5LebJxDCVWXFqH8/Oe6
 PWfmukMKv6ZO2Hdzuwn7sdVBdSEzbPMKoQvVk0CL0zKndqWjd181cldgi2JDRFSUTckW
 azW5ZgLtbOkGmJBLeVSG0PsIOmgi9f84263ulhwOAFgDOeocNvSkRlz+gZ5n4zvHnPjz
 fA9YZ3sCDkjaY9A8/1aEX8YzIRTJWH0jZNFCF7uQsZrpP5McZyqsjspua/cZh9L0LR27
 oA4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPrpmz2+HpzOy6ckyJYKGuixQoXBRit91EOP/FiS0fcLsjiUzGEl3NX4KnRtjmkhamod3rwVlRidIvbrwJW/fFopjS61NOiKplosEwUuq2
X-Gm-Message-State: AOJu0Yx90rEg8HMOqC467jbgDzKw/T1uj58ea46VXcsp0Gw9El5eJJ6Z
 Afx+2OzrY11RE9PUoeTG93XbMUkzkD4SNd++xutwXCgwKQ3t6tug+fBqi+Ylev/5TmFOljkDNRL
 OSDyEOfMfoe1kZDu3VpVhqpRpT3YcJxaC0ju71A==
X-Google-Smtp-Source: AGHT+IEM4NFr5wCGhOiiuYUS5u3D1NDi/p8D9rTGnXjrsGtntNojdVfk1nYxVYbB+RSjrZTycZuhtNsDdO/r2d+fzEQ=
X-Received: by 2002:a05:6870:b250:b0:25e:180:9183 with SMTP id
 586e51a60fabf-25e2bf95bc9mr4521301fac.4.1720192804535; Fri, 05 Jul 2024
 08:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <6a13d674-96d3-40a2-8d4b-634fc2aed836@gmx.net>
In-Reply-To: <6a13d674-96d3-40a2-8d4b-634fc2aed836@gmx.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 5 Jul 2024 17:19:52 +0200
Message-ID: <CAKMK7uFa1_dzyZX+GzgncynLAJu=0ZdddbmRSO6-ETep8B3dXA@mail.gmail.com>
Subject: Re: vc4: Increased CMA usage after replace drm_gem_dma_object for
 drm_gem_object in vc4_exec_info
To: Stefan Wahren <wahrenst@gmx.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Maxime Ripard <maxime@cerno.tech>, Melissa Wen <mwen@igalia.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000f5f9b061c819939"
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

--0000000000000f5f9b061c819939
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding dri-devel

On Fri, 5 Jul 2024 at 17:14, Stefan Wahren <wahrenst@gmx.net> wrote:

> Hi,
> last year my Raspberry Pi 3B Plus died, so i didn't noticed this sooner.
> If I ran Raspberry Pi OS Bullseye with X11 and a recent Mainline Kernel
> (arm/multi_v7_defconfig) on my new Raspberry Pi 3 B+, i'm getting the
> following errors:
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.10.0-rc1-g685505219723
> (stefanw@stefanw-SCHENKER) (arm-linux-gnueabihf-gcc (GCC) 11.3.1
> 20220604 [releases/gcc-11 revision
> 591c0f4b92548e3ae2e8173f4f93984b1c7f62bb], GNU ld
> (Linaro_Binutils-2022.06) 2.37.20220122) #1 SMP Wed Jul  3 19:57:14 CEST
> 2024
> [    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7),
> cr=3D10c5383d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model B Plus Rev 1.=
3
> [    0.000000] random: crng init done
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] Reserved memory: created CMA memory pool at 0x37000000,
> size 64 MiB
> [    0.000000] OF: reserved mem: initialized node linux,cma, compatible
> id shared-dma-pool
> [    0.000000] OF: reserved mem: 0x37000000..0x3affffff (65536 KiB) map
> reusable linux,cma
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
> [    0.000000]   Normal   empty
> [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000003b3fffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x000000003b3fffff]
> [    0.000000] Initmem setup node 0 [mem
> 0x0000000000000000-0x000000003b3fffff]
> [    0.000000] percpu: Embedded 17 pages/cpu s40404 r8192 d21036 u69632
> [    0.000000] pcpu-alloc: s40404 r8192 d21036 u69632 alloc=3D17*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
> [    0.000000] Kernel command line: video=3DHDMI-A-1:1920x1200M@60
> dma.dmachans=3D0x7ff5 bcm2709.boardrev=3D0xa020d3 bcm2709.serial=3D0x5197=
2538
> bcm2709.uart_clock=3D48000000 bcm2709.disk_led_gpio=3D29
> bcm2709.disk_led_active_low=3D0 vc_mem.mem_base=3D0x3ec00000
> vc_mem.mem_size=3D0x40000000 console=3DttyS1,115200 console=3Dtty1
> root=3DPARTUUID=3Decfed651-02 rootfstype=3Dext4 fsck.repair=3Dyes rootwai=
t
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
> bytes, linear)
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 242688
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off,
> mlocked free:off
> [    0.000000] Memory: 868880K/970752K available (15360K kernel code,
> 2535K rwdata, 6708K rodata, 2048K init, 426K bss, 36336K reserved,
> 65536K cma-reserved, 118784K highmem)
> ...
> [   56.187787] [drm:vc4_bo_create [vc4]] *ERROR* Failed to allocate from
> GEM DMA helper:
> [   56.187870] vc4-drm soc:gpu: [drm] V3D:  36316kb BOs (40)
> [   56.187884] vc4-drm soc:gpu: [drm]                     V3D shader:
> 124kb BOs (31)
> [   56.187893] vc4-drm soc:gpu: [drm] dumb:   4564kb BOs (5)
> [   56.187900] vc4-drm soc:gpu: [drm] binner:  16384kb BOs (1)
> [   56.187909] vc4-drm soc:gpu: [drm]                total purged BO:
> 19540kb BOs (15)
> [   56.188269] [drm:vc4_bo_create [vc4]] *ERROR* Failed to allocate from
> GEM DMA helper:
> [   56.188315] vc4-drm soc:gpu: [drm] V3D:  35072kb BOs (30)
> [   56.188325] vc4-drm soc:gpu: [drm]                     V3D shader:
> 124kb BOs (31)
> [   56.188337] vc4-drm soc:gpu: [drm] dumb:   4564kb BOs (5)
> [   56.188345] vc4-drm soc:gpu: [drm] binner:  16384kb BOs (1)
> [   56.188354] vc4-drm soc:gpu: [drm]                total purged BO:
> 19540kb BOs (15)
> ...
>
> Except of these errors, X11 works as expected. Since I knew that this
> setup shouldn't throw these errors without CMA modifications, I bisected
> this to this commit:
>
> commit 47c07e46c86f310bed73b9c895155a49df3d5e71 (HEAD)
> Author: Ma=C3=ADra Canal <mcanal@igalia.com>
> Date:   Thu Feb 2 08:19:43 2023 -0300
>
> drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info
>
> After that I increased the CMA to 128 MB via Kernel cmdline and compared
> /proc/meminfo before and after the patch:
>
> Before
> CmaTotal:         131072 kB
> CmaFree:           20132 kB
>
> After
> CmaTotal:         131072 kB
> CmaFree:            5644 kB
>
> So my question: is this noticable CMA increase expected by this change?
>

No, it shouldn't change anything. All it does is change the type we use to
iterate over objects from the subclass to the base class in the command
submission code. The resulting code should be entirely unchanged, if the
compiler doesn't get confused at least and applies all the same
optimizations.

Can you please double-check that it's really this commit that makes the
difference, and nothing else changed in the system?

Thanks, Sima
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

--0000000000000f5f9b061c819939
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_attr">Addin=
g dri-devel<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, 5 Jul 2024 at 17:14, Stefan Wahren =
&lt;<a href=3D"mailto:wahrenst@gmx.net">wahrenst@gmx.net</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
last year my Raspberry Pi 3B Plus died, so i didn&#39;t noticed this sooner=
.<br>
If I ran Raspberry Pi OS Bullseye with X11 and a recent Mainline Kernel<br>
(arm/multi_v7_defconfig) on my new Raspberry Pi 3 B+, i&#39;m getting the<b=
r>
following errors:<br>
<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Linux version 6.10.0-rc1-g685505219723<br>
(stefanw@stefanw-SCHENKER) (arm-linux-gnueabihf-gcc (GCC) 11.3.1<br>
20220604 [releases/gcc-11 revision<br>
591c0f4b92548e3ae2e8173f4f93984b1c7f62bb], GNU ld<br>
(Linaro_Binutils-2022.06) 2.37.20220122) #1 SMP Wed Jul=C2=A0 3 19:57:14 CE=
ST<br>
2024<br>
[=C2=A0=C2=A0=C2=A0 0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (A=
RMv7),<br>
cr=3D10c5383d<br>
[=C2=A0=C2=A0=C2=A0 0.000000] CPU: div instructions available: patching div=
ision code<br>
[=C2=A0=C2=A0=C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT=
 aliasing<br>
instruction cache<br>
[=C2=A0=C2=A0=C2=A0 0.000000] OF: fdt: Machine model: Raspberry Pi 3 Model =
B Plus Rev 1.3<br>
[=C2=A0=C2=A0=C2=A0 0.000000] random: crng init done<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Memory policy: Data cache writealloc<br>
[=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Reserved memory: created CMA memory pool at 0=
x37000000,<br>
size 64 MiB<br>
[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized node linux,cma,=
 compatible<br>
id shared-dma-pool<br>
[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: 0x37000000..0x3affffff (655=
36 KiB) map<br>
reusable linux,cma<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:<br>
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 [mem 0x0000000000000000-0x000000002fffffff]<br>
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br>
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 HighMem=C2=A0 [mem 0x000000003000=
0000-0x000000003b3fffff]<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges<br>
[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x000000=
0000000000-0x000000003b3fffff]<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem<br>
0x0000000000000000-0x000000003b3fffff]<br>
[=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 17 pages/cpu s40404 r8192 d2=
1036 u69632<br>
[=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: s40404 r8192 d21036 u69632 alloc=
=3D17*4096<br>
[=C2=A0=C2=A0=C2=A0 0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: video=3DHDMI-A-1:1920x12=
00M@60<br>
dma.dmachans=3D0x7ff5 bcm2709.boardrev=3D0xa020d3 bcm2709.serial=3D0x519725=
38<br>
bcm2709.uart_clock=3D48000000 bcm2709.disk_led_gpio=3D29<br>
bcm2709.disk_led_active_low=3D0 vc_mem.mem_base=3D0x3ec00000<br>
vc_mem.mem_size=3D0x40000000 console=3DttyS1,115200 console=3Dtty1<br>
root=3DPARTUUID=3Decfed651-02 rootfstype=3Dext4 fsck.repair=3Dyes rootwait<=
br>
[=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries: 131072 (orde=
r: 7, 524288<br>
bytes, linear)<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 65536 (order:=
 6, 262144<br>
bytes, linear)<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 242688<br>
[=C2=A0=C2=A0=C2=A0 0.000000] mem auto-init: stack:off, heap alloc:off, hea=
p free:off,<br>
mlocked free:off<br>
[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 868880K/970752K available (15360K ker=
nel code,<br>
2535K rwdata, 6708K rodata, 2048K init, 426K bss, 36336K reserved,<br>
65536K cma-reserved, 118784K highmem)<br>
...<br>
[=C2=A0=C2=A0 56.187787] [drm:vc4_bo_create [vc4]] *ERROR* Failed to alloca=
te from<br>
GEM DMA helper:<br>
[=C2=A0=C2=A0 56.187870] vc4-drm soc:gpu: [drm] V3D:=C2=A0 36316kb BOs (40)=
<br>
[=C2=A0=C2=A0 56.187884] vc4-drm soc:gpu: [drm]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 V3D shader:=C2=A0=C2=A0=C2=A0<br>
124kb BOs (31)<br>
[=C2=A0=C2=A0 56.187893] vc4-drm soc:gpu: [drm] dumb:=C2=A0=C2=A0 4564kb BO=
s (5)<br>
[=C2=A0=C2=A0 56.187900] vc4-drm soc:gpu: [drm] binner:=C2=A0 16384kb BOs (=
1)<br>
[=C2=A0=C2=A0 56.187909] vc4-drm soc:gpu: [drm]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 total purge=
d BO:=C2=A0<br>
19540kb BOs (15)<br>
[=C2=A0=C2=A0 56.188269] [drm:vc4_bo_create [vc4]] *ERROR* Failed to alloca=
te from<br>
GEM DMA helper:<br>
[=C2=A0=C2=A0 56.188315] vc4-drm soc:gpu: [drm] V3D:=C2=A0 35072kb BOs (30)=
<br>
[=C2=A0=C2=A0 56.188325] vc4-drm soc:gpu: [drm]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 V3D shader:=C2=A0=C2=A0=C2=A0<br>
124kb BOs (31)<br>
[=C2=A0=C2=A0 56.188337] vc4-drm soc:gpu: [drm] dumb:=C2=A0=C2=A0 4564kb BO=
s (5)<br>
[=C2=A0=C2=A0 56.188345] vc4-drm soc:gpu: [drm] binner:=C2=A0 16384kb BOs (=
1)<br>
[=C2=A0=C2=A0 56.188354] vc4-drm soc:gpu: [drm]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 total purge=
d BO:=C2=A0<br>
19540kb BOs (15)<br>
...<br>
<br>
Except of these errors, X11 works as expected. Since I knew that this<br>
setup shouldn&#39;t throw these errors without CMA modifications, I bisecte=
d<br>
this to this commit:<br>
<br>
commit 47c07e46c86f310bed73b9c895155a49df3d5e71 (HEAD)<br>
Author: Ma=C3=ADra Canal &lt;<a href=3D"mailto:mcanal@igalia.com" target=3D=
"_blank">mcanal@igalia.com</a>&gt;<br>
Date:=C2=A0=C2=A0 Thu Feb 2 08:19:43 2023 -0300<br>
<br>
drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info<br>
<br>
After that I increased the CMA to 128 MB via Kernel cmdline and compared<br=
>
/proc/meminfo before and after the patch:<br>
<br>
Before<br>
CmaTotal:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 131072 kB<br>
CmaFree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20132 =
kB<br>
<br>
After<br>
CmaTotal:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 131072 kB<br>
CmaFree:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
5644 kB<br>
<br>
So my question: is this noticable CMA increase expected by this change?<br>=
</blockquote><div><br></div><div>No, it shouldn&#39;t change anything. All =
it does is change the type we use to iterate over objects from the subclass=
 to the base class in the command submission code. The resulting code shoul=
d be entirely unchanged, if the compiler doesn&#39;t get confused at least =
and applies all the same optimizations.</div><div><br></div><div>Can you pl=
ease double-check that it&#39;s really this commit that makes the differenc=
e, and nothing else changed in the system?</div><div><br></div><div>Thanks,=
 Sima</div></div><span class=3D"gmail_signature_prefix">-- </span><br><div =
dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Daniel Vetter<br>Sof=
tware Engineer, Intel Corporation<br><a href=3D"http://blog.ffwll.ch" targe=
t=3D"_blank">http://blog.ffwll.ch</a></div></div></div>

--0000000000000f5f9b061c819939--
