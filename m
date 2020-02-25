Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7916BC94
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0571A6EA62;
	Tue, 25 Feb 2020 08:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A1AA6E9C5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 00:10:15 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 1D6CE8030;
 Tue, 25 Feb 2020 00:10:59 +0000 (UTC)
Date: Mon, 24 Feb 2020 16:10:11 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225001011.GF37466@atomide.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Sebastian Reichel <sebastian.reichel@collabora.com> [200224 23:22]:
> This updates the existing omapdrm DSI code, so that it uses
> common drm_mipi_dsi API and drm_panel.
> 
> The patchset has been tested with Droid 4 using Linux console, X.org and
> Weston. The patchset is based on Laurent Pinchartl's patch series [0]
> and removes the last custom panel driver, so quite a few cleanups on the
> omapdrm codebase were possible.
> 
> [0] [PATCH v7 00/54] drm/omap: Replace custom display drivers with drm_bridge and drm_panel
>     https://lore.kernel.org/dri-devel/20200222150106.22919-1-laurent.pinchart@ideasonboard.com/
>     git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
> 
> I pushed this patchset into the following branch:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git omapdrm/bridge/devel-with-dsi

I gave your omapdrm/bridge/devel-with-dsi branch a quirk test
on droid4, but get the following oops with mostly modular
omap2_defconfig.

BTW, I think there's also some refcount issue in general where
the omapdrm related modules cannot be unloaded any longer?

Regards,

Tony

8< -------------------------
Internal error: Oops: 805 [#1] PREEMPT SMP ARM
Modules linked in: omapdss(+) omapdss_base drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm drm_panel_ors
CPU: 0 PID: 811 Comm: modprobe Not tainted 5.6.0-rc2-00376-g163017c12d62a #1926
Hardware name: Generic OMAP4 (Flattened Device Tree)
PC is at drm_bridge_remove+0x24/0x40 [drm]
LR is at drm_bridge_remove+0x14/0x40 [drm]
pc : [<bf2a0cb4>]    lr : [<bf2a0ca4>]    psr: 60000013
sp : edc6fc88  ip : eda3a100  fp : bf38a5b4
r10: bf38c7d0  r9 : edc164b8  r8 : edc1606c
r7 : edc1647c  r6 : edc93010  r5 : bf2dc428  r4 : edc164b8
r3 : edc164fc  r2 : 00000000  r1 : 00000000  r0 : bf2dc428
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: adc7404a  DAC: 00000051
Process modprobe (pid: 811, stack limit = 0x(ptrval))
Stack: (0xedc6fc88 to 0xedc70000)
fc80:                   edc16040 fffffdfb edc93010 bf37dfd0 00000080 edc2eb00
fca0: edc16040 edc93010 edc93010 00000000 bf392178 00000000 00000000 bf392178
fcc0: 0000001e c0624424 edc93010 c0efafa0 c0efafa4 00000000 00000000 c06222e4
fce0: edc93010 bf392178 bf392178 c0622880 c06243a0 c06243dc c0e93210 c06225cc
fd00: bf38c450 a0000013 bf38a5b4 edc93010 00000000 bf392178 c0622880 c06243a0
fd20: c06243dc c0622878 00000000 bf392178 edc93010 c06228d8 edc94fb4 edc6e000
fd40: bf392178 c062069c edc50eb8 ee8dae58 edc94fb4 d759a07d ee8dae6c bf392178
fd60: edc50e80 c0e93210 00000000 c0621618 bf38f0c0 bf3922c0 00000006 bf392178
fd80: bf3922c0 00000006 c0623db0 c062344c 00000002 bf3922c0 00000006 c06244fc
fda0: bf38a5b0 bf38a5a8 000be666 c0ec0540 bf39a000 00000000 bf392308 00000002
fdc0: edc2c300 c01dc694 edc6ff30 c0102fec c0ebbcf4 00000000 00000cc0 c0d75a70
fde0: edc2c2c0 c02b4538 c0d75a70 a0000013 a0000013 00000008 c01de5bc 00000002
fe00: 00000001 c01dc694 edc6ff30 d759a07d edbe7400 bf3922c0 00000002 d759a07d
fe20: bf392308 bf3922c0 edbe7400 edc2c2c0 bf392308 c01de5f8 00000002 edc2c2c0
fe40: bf3922c0 00000002 edc2c2c0 c01e0b1c bf3922cc 00007fff bf3922c0 c01dd34c
fe60: bf3a44ee 004c1a8f bf3922c0 bf3923d4 bf3924b8 c0a05fa8 00000000 bf38d075
fe80: 00000001 00000000 c0bddd78 c0bc76d8 bf38a03c 00000002 00000000 00000000
fea0: 00000000 00000000 6e72656b 00006c65 00000000 00000000 00000000 00000000
fec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
fee0: 00000000 d759a07d 7fffffff edc6e000 00000000 00000003 004c1a8f 7fffffff
ff00: 00000000 0000017b 004d56a0 c01e1050 7fffffff 00000000 00000003 c093c724
ff20: 00000002 f1370000 000e3464 00000000 f138b0c6 f138f3c0 f1370000 000e3464
ff40: f1452a3c f14527a4 f1425e58 00022000 00025680 0000a084 00027a0b 00000000
ff60: 00000000 00000000 0000a074 0000003e 0000003f 00000021 00000025 00000018
ff80: 00000000 d759a07d 004dcb80 64a54c46 b6f6a510 0000017b 0000017b c0101204
ffa0: edc6e000 c0101000 64a54c46 b6f6a510 00000003 004c1a8f 00000000 004dcb80
ffc0: 64a54c46 b6f6a510 0000017b 0000017b 004dcb80 00000001 00000000 004d56a0
ffe0: 004dcb80 bea7ba90 0043d1a9 b6f1d0b8 60000030 00000003 00000000 00000000
[<bf2a0cb4>] (drm_bridge_remove [drm]) from [<bf37dfd0>] (dsi_probe+0x3ac/0x55c [omapdss])
[<bf37dfd0>] (dsi_probe [omapdss]) from [<c0624424>] (platform_drv_probe+0x48/0x98)
[<c0624424>] (platform_drv_probe) from [<c06222e4>] (really_probe+0x1dc/0x340)
[<c06222e4>] (really_probe) from [<c06225cc>] (driver_probe_device+0x5c/0x160)
[<c06225cc>] (driver_probe_device) from [<c0622878>] (device_driver_attach+0x58/0x60)
[<c0622878>] (device_driver_attach) from [<c06228d8>] (__driver_attach+0x58/0xcc)
[<c06228d8>] (__driver_attach) from [<c062069c>] (bus_for_each_dev+0x78/0xb8)
[<c062069c>] (bus_for_each_dev) from [<c0621618>] (bus_add_driver+0xf0/0x1d4)
[<c0621618>] (bus_add_driver) from [<c062344c>] (driver_register+0x74/0x108)
[<c062344c>] (driver_register) from [<c06244fc>] (__platform_register_drivers+0x54/0xd0)
[<c06244fc>] (__platform_register_drivers) from [<c0102fec>] (do_one_initcall+0x44/0x2a8)
[<c0102fec>] (do_one_initcall) from [<c01de5f8>] (do_init_module+0x5c/0x234)
[<c01de5f8>] (do_init_module) from [<c01e0b1c>] (load_module+0x22c4/0x2580)
[<c01e0b1c>] (load_module) from [<c01e1050>] (sys_finit_module+0xc4/0xe0)
[<c01e1050>] (sys_finit_module) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xedc6ffa8 to 0xedc6fff0)
ffa0:                   64a54c46 b6f6a510 00000003 004c1a8f 00000000 004dcb80
ffc0: 64a54c46 b6f6a510 0000017b 0000017b 004dcb80 00000001 00000000 004d56a0
ffe0: 004dcb80 bea7ba90 0043d1a9 b6f1d0b8
Code: e5942048 e5941044 e2843044 e1a00005 (e5812004)
---[ end trace 6213ab3cbabf9f59 ]---
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
