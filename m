Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17CAB47EF
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 01:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7D210E249;
	Mon, 12 May 2025 23:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEC910E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 16:58:32 +0000 (UTC)
Received: from localhost (unknown [82.64.135.138])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 38CBE2003ED;
 Mon, 12 May 2025 18:58:16 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
 id 878C9C4CE; Mon, 12 May 2025 16:58:15 +0000 (GMT)
Date: Mon, 12 May 2025 16:58:15 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: RaspberryPi4B, VC4 fails to output on HDMI
Message-ID: <aCIopzfzbckMQFLj@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 12 May 2025 23:33:49 +0000
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

Hi all (and i hope you won't feel spammed).

I have a Raspberry Pi 4B i want to use with HDMI0, but i can't make it
work (tried lot of kernel versions), and i'd appreciate some guidance.

Overview of dmesg (6.15-rc6 with some trace/stack dump of mine):
[    0.212555] simple-framebuffer 3e40f000.framebuffer: framebuffer at 0x3e40f000, 0x6e7000 bytes
[    0.212569] simple-framebuffer 3e40f000.framebuffer: format=a8r8g8b8, mode=1824x984x32, linelength=7296
[    0.216036] Console: switching to colour frame buffer device 228x61
[    0.219382] simple-framebuffer 3e40f000.framebuffer: fb0: simplefb registered!
...
[    1.923879] raspberrypi-firmware soc:firmware: Attached to firmware from 2025-02-17T20:03:07
...
[    1.957445] v3d fec00000.gpu: [drm] Using Transparent Hugepages
[    1.964814] [drm] Initialized v3d 1.0.0 for fec00000.gpu on minor 0
[    1.972428] Console: do_bind_con_driver, backtrace:
[    1.972437] CPU: 0 UID: 0 PID: 44 Comm: kworker/u16:2 Not tainted 6.15.0-rc6-00001-gb4f861e88093-dirty #2 PREEMPT 
[    1.972446] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[    1.972449] Workqueue: events_unbound deferred_probe_work_func
[    1.972465] Call trace:
[    1.972467]  show_stack+0x2c/0xc0 (C)
[    1.972476]  dump_stack_lvl+0x60/0x94
[    1.972483]  dump_stack+0x18/0x30
[    1.972488]  do_bind_con_driver.isra.0+0x40/0x294
[    1.972497]  do_unbind_con_driver+0x1b8/0x1dc
[    1.972506]  fbcon_fb_unbind+0x108/0x1d8
[    1.972512]  unregister_framebuffer+0x110/0x120
[    1.972522]  simplefb_remove+0x14/0x2c
[    1.972527]  platform_remove+0x28/0x5c
[    1.972533]  device_remove+0x4c/0xa0
[    1.972538]  device_release_driver_internal+0x1fc/0x250
[    1.972543]  device_release_driver+0x18/0x40
[    1.972548]  bus_remove_device+0xd4/0x17c
[    1.972552]  device_del+0x150/0x3b8
[    1.972559]  platform_device_del+0x28/0xbc
[    1.972564]  platform_device_unregister+0x18/0x50
[    1.972570]  aperture_detach_platform_device+0x14/0x2c
[    1.972575]  aperture_detach_devices+0xb8/0x120
[    1.972581]  aperture_remove_conflicting_devices+0x10/0x2c
[    1.972587]  vc4_drm_bind+0x110/0x364
[    1.972592]  try_to_bring_up_aggregate_device+0x22c/0x308
[    1.972597]  __component_add+0xec/0x224
[    1.972602]  component_add+0x14/0x30
[    1.972607]  vc4_hdmi_dev_probe+0x1c/0x40
[    1.972614]  platform_probe+0x68/0xf0
[    1.972620]  really_probe+0xc0/0x3ac
[    1.972624]  __driver_probe_device+0x7c/0x174
[    1.972629]  driver_probe_device+0x40/0x100
[    1.972634]  __device_attach_driver+0x10c/0x1e0
[    1.972639]  bus_for_each_drv+0x88/0x100
[    1.972643]  __device_attach+0xa0/0x1c8
[    1.972647]  device_initial_probe+0x14/0x30
[    1.972652]  bus_probe_device+0xc8/0xcc
[    1.972656]  deferred_probe_work_func+0xb8/0x12c
[    1.972661]  process_one_work+0x160/0x2d4
[    1.972668]  worker_thread+0x2d8/0x400
[    1.972673]  kthread+0x12c/0x208
[    1.972678]  ret_from_fork+0x10/0x20
[    1.972720] Console: switching to colour dummy device 80x25
[    3.115665] vc4-drm gpu: bound fe400000.hvs (ops 0xffffffd14312f480)
[    3.122490] Registered IR keymap rc-cec
[    3.125869] rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0
[    3.133033] input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input0
[    3.141737] vc4-drm gpu: bound fef00700.hdmi (ops 0xffffffd14312bc68)
[    3.148700] Registered IR keymap rc-cec
[    3.152074] rc rc1: vc4-hdmi-1 as /devices/platform/soc/fef05700.hdmi/rc/rc1
[    3.159241] input: vc4-hdmi-1 as /devices/platform/soc/fef05700.hdmi/rc/rc1/input1
[    3.168548] vc4-drm gpu: bound fef05700.hdmi (ops 0xffffffd14312bc68)
[    3.174671] vc4-drm gpu: bound fe004000.txp (ops 0xffffffd1431307d0)
[    3.181044] vc4-drm gpu: bound fe206000.pixelvalve (ops 0xffffffd1431296f0)
[    3.188070] vc4-drm gpu: bound fe207000.pixelvalve (ops 0xffffffd1431296f0)
[    3.195114] vc4-drm gpu: bound fe20a000.pixelvalve (ops 0xffffffd1431296f0)
[    3.202132] vc4-drm gpu: bound fe216000.pixelvalve (ops 0xffffffd1431296f0)
[    3.210213] [drm] Initialized vc4 0.0.0 for gpu on minor 1
...
[   12.308295] EDID block 1 read ok (drivers/gpu/drm/drm_edid.c:edid_block_status_print case EDID_BLOCK_OK)

The EDID is fetched ok (but strangely late according to dmesg), and edid-decode
softly complains about it (and it lists a wide range of modes it does not
complain about):
Warnings:

Block 1, CTA-861 Extension Block:
  Display Product Serial Number is set, so the Serial Number in the Base EDID should be 0.
  Add a Colorimetry Data Block with the sRGB colorimetry bit set to avoid interop issues.

Failures:

Block 1, CTA-861 Extension Block:
  Missing VCDB, needed for Set Selectable RGB Quantization to avoid interop issues.
EDID:
  Base EDID: Some timings are out of range of the Monitor Ranges:
    Vertical Freq: 50.000 - 75.029 Hz (Monitor: 56.000 - 76.000 Hz)
    Horizontal Freq: 15.625 - 79.976 kHz (Monitor: 30.000 - 83.000 kHz)


Interestingly enough, while EDID seems to have parsed ok, there is zero
entry in /sys/class/drm/card1-HDMI-A-1/modes (the hdmi node i took the
edid from).


Can someone give me some hint(s) on how to get this hdmi output working?
I can obviously give more informations if needed.

Regards.

