Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6400301B57
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 12:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897B789E5B;
	Sun, 24 Jan 2021 11:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Sat, 23 Jan 2021 18:54:05 UTC
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EB16E08E
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jan 2021 18:54:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id BAA76DF8A6;
 Sat, 23 Jan 2021 18:43:32 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id m1eMAEU0DkAw; Sat, 23 Jan 2021 18:43:30 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 5F09BE0AB2;
 Sat, 23 Jan 2021 18:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NliS8qGi7FWf; Sat, 23 Jan 2021 18:43:29 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 58943DF8A6;
 Sat, 23 Jan 2021 18:43:29 +0000 (UTC)
Date: Sat, 23 Jan 2021 19:47:22 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
Message-ID: <20210123184722.GA1846417@demiurge.local>
References: <20210120170033.38468-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120170033.38468-1-noralf@tronnes.org>
X-Mailman-Approved-At: Sun, 24 Jan 2021 11:04:21 +0000
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, th020394@gmail.com,
 pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 06:00:30PM +0100, Noralf Tr=F8nnes wrote:
> Hi,
> =

> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
> =

> The reason for calling it 'Generic' is so anyone can make a USB
> display/adapter against this driver, all that's needed is to add a USB
> vid:pid.
> =

> Unfortunately I've had some compounding health problems that have
> severally limited the time I can spend in front of a computer. For this
> reason I've decided to keep the gadget driver out-of-tree and focus on
> getting the host driver merged first.
> =

> See the wiki[1] for more information and images for the Raspberry Pi
> Zero/4.
> =

> One big change this time is that I've followed Peter Stuge's advice to
> not let DRM stuff leak into the USB protocol. This has made the protocol
> easier to understand just from reading the header file.

Welcome back! I'm happy to see this patch set back on track. I've now
started putting together something that would work with GUD on
Lilygo T-Display-GD32, but it blew up in my face immediately (I had
CONFIG_DEBUG_SPINLOCK turned on):

  [   42.064362] usb 1-1.2: new full-speed USB device number 6 using mv-ehci
  [   42.228048] usb 1-1.2: New USB device found, idVendor=3D1d50, idProduc=
t=3D614d, bcdDevice=3D 1.00
  [   42.236812] usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
  [   42.254298] usb 1-1.2: Product: LCD Display Interface
  [   42.259771] usb 1-1.2: Manufacturer: Lubomir Rintel <lkundrak@v3.sk>
  [   42.266395] usb 1-1.2: SerialNumber: FFFFFFFF3736030061294139
  [   42.284771] BUG: spinlock bad magic on CPU#0, kworker/0:0/5
  [   42.290394] 8<--- cut here ---
  [   42.293415] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000031c
  [   42.301417] pgd =3D e351f484
  [   42.304184] [0000031c] *pgd=3D00000000
  [   42.307826] Internal error: Oops: 15 [#1] PREEMPT SMP ARM
  [   42.313250] Modules linked in:
  [   42.316208] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.11.0-rc4-001=
13-g8c3d05f1939a #1274
  [   42.324729] Hardware name: Marvell MMP3
  [   42.328540] Workqueue: usb_hub_wq hub_event
  [   42.332759] PC is at spin_dump+0x5c/0x88
  [   42.336556] LR is at spin_dump+0x48/0x88
  [   42.340644] pc : [<c0c3da6c>]    lr : [<c0c3da58>]    psr: 200f0193
  [   42.346895] sp : c810b910  ip : 00000000  fp : c1107b40
  [   42.352039] r10: ffffc005  r9 : 00000000  r8 : 001fffff
  [   42.357238] r7 : 00000000  r6 : 00000438  r5 : c14456f8  r4 : 00000014
  [   42.363837] r3 : 0000044c  r2 : c1091500  r1 : eefb8540  r0 : 0000002f
  [   42.370351] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segm=
ent none
  [   42.377456] Control: 10c5387d  Table: 09f0806a  DAC: 00000051
  [   42.383286] Process kworker/0:0 (pid: 5, stack limit =3D 0xda2575c6)
  [   42.389392] Stack: (0xc810b910 to 0xc810c000)
  [   42.393801] b900:                                     00000005 c14456f=
8 c14456f8 c058f244
  [   42.401916] b920: a00f0113 c018b1cc c14456f8 c058f244 a00f0113 c0c4e45=
4 00000001 00000000
  [   42.410117] b940: c058f244 00000003 c9d1d800 ca01f000 7fffffff c058f24=
4 200f0113 00000001
  [   42.418267] b960: 00000cc0 c810a000 00000dc0 00000000 c1053148 0000002=
3 c9d1d814 c14456f8
  [   42.426399] b980: 00000000 00000000 00000003 00000000 00000000 fcee162=
a 00000cc0 c9d1d800
  [   42.434607] b9a0: ca01f000 00000000 c810a000 00000014 c9d1d814 c14452e=
0 ca01f42c c0669f84
  [   42.442749] b9c0: c0668d98 00000000 00000dc0 00000dc0 00000000 c126dd9=
0 00000dc0 ca01f24c
  [   42.450887] b9e0: 00000410 c14456f8 ca01f000 fcee162a 00000000 c9d1d80=
0 00000000 00000000
  [   42.459087] ba00: 00000000 00000001 ca01f000 ca01fac8 00000002 c06965e=
0 00000000 00000000
  [   42.467220] ba20: 00000000 c03027b0 c8001600 00000001 c810a000 fcee162=
a 00000000 fcee162a
  [   42.475373] ba40: a00f0113 c9d25880 c0694894 a00f0113 c8000000 0000782=
0 00000000 fcee162a
  [   42.483470] ba60: 00000002 00000000 ca01f000 c9ae7800 c810a000 0000000=
1 c9d258c0 ca01fac8
  [   42.491685] ba80: 00000002 c0694a14 00000002 c0d68608 00000000 0000000=
1 00000000 c0186460
  [   42.499882] baa0: c9d65878 c9d25940 c0d51198 00000001 00000000 3631475=
2 34325241 00000000
  [   42.508038] bac0: 00000001 c9ae7820 00000000 34325258 c9ae7800 c810a00=
0 00000022 c0c4e6b8
  [   42.516202] bae0: c98b1a00 fcee162a c9d65878 c9ae7820 c9d65878 c144619=
8 c9ae7800 c9d65800
  [   42.524347] bb00: 00000001 c0d68618 ffffffed c07eae44 c07ead58 c9ae782=
0 c18004e0 00000000
  [   42.532534] bb20: c18004e8 00000000 c1446198 c14ab308 00000022 c069f12=
4 c9ae79cc 00000001
  [   42.540557] bb40: c9ae78dc 00000000 c14555b0 c9ae7820 c14ab308 c144619=
8 c069fba4 00000001
  [   42.548847] bb60: c1800494 00000000 c14555b0 c069f5bc 00000001 c069fb7=
8 00000000 c810bbc4
  [   42.556874] bb80: c810a000 00000001 c1800494 00000000 c14555b0 c069cef=
c c14555b0 c8a964e4
  [   42.565179] bba0: c8e90d58 fcee162a c9d65934 c9ae7820 c810a000 c9ae782=
0 c9ae7864 c069f8f4
  [   42.573316] bbc0: c109aed0 c9ae7820 00000001 fcee162a c9ae7820 c14555c=
8 c9ae7820 c9d65878
  [   42.581503] bbe0: c1446248 c069e06c c9ae7820 00000000 c810a000 c069b76=
c 00000000 c0c49b8c
  [   42.589664] bc00: c9d65800 c9d65800 c9079800 00000000 c9d65800 0000000=
1 c810bc14 fcee162a
  [   42.597796] bc20: 00000000 c9ae7800 c9bbb050 c14af400 c9d65800 c9bbb05=
0 c10b6f28 00000001
  [   42.605979] bc40: c10b6f50 c07e9120 00000001 00000000 00000000 0000000=
0 00001388 00000001
  [   42.614148] bc60: c810bc5c c98b1844 00000001 c9079800 c9d65878 c9d6580=
4 c98b1844 c14557bc
  [   42.622314] bc80: c14555c8 c07e77e0 c9bbb00c c9bbb000 c98b1840 0000000=
1 00000001 00000001
  [   42.630470] bca0: 00000004 c9bbb04c c10b6eac c9d72dd0 00000000 c9d6580=
0 00000001 c145615c
  [   42.638629] bcc0: c9d65800 00000000 c145615c c14ab308 00000022 c07f4f3=
4 c9d65878 c9d65878
  [   42.646777] bce0: c145615c c07ea6d4 c9d65878 c18004e0 00000000 c18004e=
8 00000000 c069f124
  [   42.654833] bd00: c9d65a24 00000001 c9d65934 00000000 c14552d0 c9d6587=
8 c14ab308 c145615c
  [   42.663083] bd20: c069fba4 00000001 c1800494 00000000 c14552d0 c069f5b=
c 00000001 c069fb78
  [   42.671276] bd40: 00000000 c810bd8c c810a000 00000001 c1800494 0000000=
0 c14552d0 c069cefc
  [   42.679443] bd60: c14552d0 c8a964e4 c8a98dd8 fcee162a c90af134 c9d6587=
8 c810a000 c9d65878
  [   42.687596] bd80: c9d658bc c069f8f4 c109aed0 c9d65878 00000001 fcee162=
a c9d65878 c14555c8
  [   42.695758] bda0: c9d65878 c90af078 c1446248 c069e06c c9d65878 0000000=
0 c810a000 c069b76c
  [   42.703831] bdc0: 60030013 c810a000 c98b1a80 c0631c34 c1096e00 3938312=
8 c900353a c810bdec
  [   42.712078] bde0: ffff9b37 fcee162a c810be08 c9d65800 c9d65878 c98b1a8=
0 c815d7c0 c90af000
  [   42.720211] be00: c90dcdbc 00000002 00000000 c07ddee8 00000003 0000000=
0 00000002 c9d65800
  [   42.728403] be20: 00000002 00000000 c815d7c0 c90af000 c90dcdbc c07e005=
4 0000000a 00000002
  [   42.736572] be40: 00000000 00000000 000003e8 c8108e40 c81093a0 c90af00=
0 c90dfc00 c90dccf6
  [   42.744732] be60: c90dcc6c c8162800 c90dcc70 c90dfc08 c90dcc00 c90dfea=
c c90dcc78 c90af0bc
  [   42.752829] be80: c810a000 00000006 c90dfeac c14aea10 c8162820 c907980=
0 c90af000 c10b5eb8
  [   42.761064] bea0: c1801ff0 00000064 00010101 c12554f8 00000000 c0185b2=
0 00000000 00000000
  [   42.769217] bec0: c0143a20 00000000 00000000 fcee162a c80b6100 c90dcdb=
c c80b6100 eefc3680
  [   42.777340] bee0: ff7c9800 c149f400 c810a000 00000000 c1307fd0 c0143ad=
c 00000001 00000000
  [   42.785540] bf00: c0143a20 00000000 00000000 00000000 00000001 eefc368=
0 c1802040 c15025a4
  [   42.793706] bf20: 00000000 c10b60a8 00000000 fcee162a eefc3680 c80b610=
0 eefc3680 c80b6114
  [   42.801867] bf40: eefc36b8 c1304d00 00000008 c810a000 eefc3680 c014444=
4 c80b60c4 c149e9e7
  [   42.809958] bf60: c810a000 c80b6080 c80ba500 c810a000 00000000 c80fde7=
4 c01443e4 c80b6100
  [   42.818193] bf80: c80b60c4 c014932c 00000000 c80ba500 c01491c4 0000000=
0 00000000 00000000
  [   42.826341] bfa0: 00000000 00000000 00000000 c0100150 00000000 0000000=
0 00000000 00000000
  [   42.834464] bfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
  [   42.842587] bfe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0 00000000 00000000
  [   42.850770] [<c0c3da6c>] (spin_dump) from [<c018b1cc>] (do_raw_spin_lo=
ck+0xc4/0x120)
  [   42.858556] [<c018b1cc>] (do_raw_spin_lock) from [<c0c4e454>] (_raw_sp=
in_lock_irqsave+0x48/0x54)
  [   42.867394] [<c0c4e454>] (_raw_spin_lock_irqsave) from [<c058f244>] (i=
da_alloc_range+0xb0/0x3e4)
  [   42.876092] [<c058f244>] (ida_alloc_range) from [<c0669f84>] (drm_conn=
ector_init+0x13c/0x484)
  [   42.884667] [<c0669f84>] (drm_connector_init) from [<c06965e0>] (gud_c=
onnector_create+0x100/0x5f0)
  [   42.893673] [<c06965e0>] (gud_connector_create) from [<c0694a14>] (gud=
_probe+0x884/0x930)
  [   42.901860] [<c0694a14>] (gud_probe) from [<c07eae44>] (usb_probe_inte=
rface+0xec/0x2cc)
  [   42.909857] [<c07eae44>] (usb_probe_interface) from [<c069f124>] (real=
ly_probe+0x108/0x528)
  [   42.918208] [<c069f124>] (really_probe) from [<c069f5bc>] (driver_prob=
e_device+0x78/0x1d8)
  [   42.926468] [<c069f5bc>] (driver_probe_device) from [<c069cefc>] (bus_=
for_each_drv+0x84/0xc8)
  [   42.935005] [<c069cefc>] (bus_for_each_drv) from [<c069f8f4>] (__devic=
e_attach+0xd0/0x1d0)
  [   42.943226] [<c069f8f4>] (__device_attach) from [<c069e06c>] (bus_prob=
e_device+0x88/0x90)
  [   42.951424] [<c069e06c>] (bus_probe_device) from [<c069b76c>] (device_=
add+0x330/0x808)
  [   42.959342] [<c069b76c>] (device_add) from [<c07e9120>] (usb_set_confi=
guration+0x4b0/0x8b4)
  [   42.967684] [<c07e9120>] (usb_set_configuration) from [<c07f4f34>] (us=
b_generic_driver_probe+0x50/0x8c)
  [   42.977007] [<c07f4f34>] (usb_generic_driver_probe) from [<c07ea6d4>] =
(usb_probe_device+0x44/0xf8)
  [   42.986016] [<c07ea6d4>] (usb_probe_device) from [<c069f124>] (really_=
probe+0x108/0x528)
  [   42.994109] [<c069f124>] (really_probe) from [<c069f5bc>] (driver_prob=
e_device+0x78/0x1d8)
  [   43.002364] [<c069f5bc>] (driver_probe_device) from [<c069cefc>] (bus_=
for_each_drv+0x84/0xc8)
  [   43.010874] [<c069cefc>] (bus_for_each_drv) from [<c069f8f4>] (__devic=
e_attach+0xd0/0x1d0)
  [   43.019142] [<c069f8f4>] (__device_attach) from [<c069e06c>] (bus_prob=
e_device+0x88/0x90)
  [   43.027252] [<c069e06c>] (bus_probe_device) from [<c069b76c>] (device_=
add+0x330/0x808)
  [   43.035225] [<c069b76c>] (device_add) from [<c07ddee8>] (usb_new_devic=
e+0x254/0x4ac)
  [   43.042972] [<c07ddee8>] (usb_new_device) from [<c07e0054>] (hub_event=
+0xd7c/0x1998)
  [   43.050707] [<c07e0054>] (hub_event) from [<c0143adc>] (process_one_wo=
rk+0x2ac/0x7c8)
  [   43.058526] [<c0143adc>] (process_one_work) from [<c0144444>] (worker_=
thread+0x60/0x568)
  [   43.066597] [<c0144444>] (worker_thread) from [<c014932c>] (kthread+0x=
168/0x184)
  [   43.074009] [<c014932c>] (kthread) from [<c0100150>] (ret_from_fork+0x=
14/0x24)
  [   43.081238] Exception stack(0xc810bfb0 to 0xc810bff8)
  [   43.086278] bfa0:                                     00000000 0000000=
0 00000000 00000000
  [   43.094436] bfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
  [   43.102593] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
  [   43.109198] Code: e5952004 10843006 e595c008 03e00000 (15940308)
  [   43.115208] ---[ end trace aa41dc7cdb58205e ]---
  [   43.119821] note: kworker/0:0[5] exited with preempt_count 1

No big deal though it seems: just that connector_ida for then newly added U=
SB
connector is not set up. This fixes the crash:

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 98b6ec45ef967..7631f76e7f345 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -94,6 +94,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_=
list[] =3D {
        { DRM_MODE_CONNECTOR_DPI, "DPI" },
        { DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
        { DRM_MODE_CONNECTOR_SPI, "SPI" },
+       { DRM_MODE_CONNECTOR_USB, "USB" },
 };

Hopefully I'll be able to follow up with a Tested-by: once I'll make the
display side work on my MCU.

Take care
Lubo

> =

> Noralf.
> =

> [1] https://github.com/notro/gud/wiki
> =

> =

> Noralf Tr=F8nnes (3):
>   drm/uapi: Add USB connector type
>   drm/probe-helper: Check epoch counter in output_poll_execute()
>   drm: Add Generic USB Display driver
> =

>  MAINTAINERS                         |   8 +
>  drivers/gpu/drm/Kconfig             |   2 +
>  drivers/gpu/drm/Makefile            |   1 +
>  drivers/gpu/drm/drm_probe_helper.c  |   7 +-
>  drivers/gpu/drm/gud/Kconfig         |  14 +
>  drivers/gpu/drm/gud/Makefile        |   4 +
>  drivers/gpu/drm/gud/gud_connector.c | 722 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_drv.c       | 620 ++++++++++++++++++++++++
>  drivers/gpu/drm/gud/gud_internal.h  | 148 ++++++
>  drivers/gpu/drm/gud/gud_pipe.c      | 472 ++++++++++++++++++
>  include/drm/gud.h                   | 356 ++++++++++++++
>  include/uapi/drm/drm_mode.h         |   1 +
>  12 files changed, 2354 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/gud/Kconfig
>  create mode 100644 drivers/gpu/drm/gud/Makefile
>  create mode 100644 drivers/gpu/drm/gud/gud_connector.c
>  create mode 100644 drivers/gpu/drm/gud/gud_drv.c
>  create mode 100644 drivers/gpu/drm/gud/gud_internal.h
>  create mode 100644 drivers/gpu/drm/gud/gud_pipe.c
>  create mode 100644 include/drm/gud.h
> =

> -- =

> 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
