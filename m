Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A0B2E776
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA8A10E7F8;
	Wed, 20 Aug 2025 21:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uAog+1dB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF25310E7F8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 21:27:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c6fgK3Lcjz9v0j;
 Wed, 20 Aug 2025 23:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755725261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4BwG5GxXa65Oer5T9JaZqy/JEz3p3ax0/qtA9kjwVLs=;
 b=uAog+1dBh1zoF9dSsZrr+PNjt91loc7DIkO/q6g5LtYmb+3Iqer10dDsbTQlFQmvkGdDnY
 y2myaZnKmIw/yCdq+ewElINS/OM9LAnmBvA5GW5hiyl3OyDdHXYxNrYxdreUyXwpzngI3v
 44ag78rI4VTriqL/Z0d8n4Edx16TkEygiyEQS/Xg/FgHY4VS2W1ryWgxH/p0DusXFCvQrM
 TQnnNk+OMKXZEFblZOUxvLNbXqVLJ7do0qwEcxto84JCXpKvT/8Lw9VgV29agSRPiSEKO6
 Z8AJNGaGGXrUjBwELQHYqeD0px3Dkk3poKJh4olbgUGvkQ9TEtj/6w0Nv4/sWQ==
Message-ID: <1fda26b1-f988-449d-834d-b185d3ebf5c6@mailbox.org>
Date: Wed, 20 Aug 2025 23:27:38 +0200
MIME-Version: 1.0
Content-Language: en-US, de-DE
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
From: Erhard Furtner <erhard_f@mailbox.org>
Subject: UBSAN: shift-out-of-bounds in
 drivers/video/fbdev/core/fb_fillrect.h:100:21 (v6.17-rc2)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c5af65bb30fbc0d6e6b
X-MBO-RS-META: 3z3nxnsemqyeqhe74f3zbpctogaw78h6
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

Greetings!

Getting this UBSAN hit on my PowerMac G4 DP with kernel 6.17-rc2:

[...]
Console: switching to colour frame buffer device 240x67
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/video/fbdev/core/fb_fillrect.h:100:21
shift exponent 32 is too large for 32-bit type 'unsigned long'
CPU: 1 UID: 0 PID: 542 Comm: (udev-worker) Tainted: G                 N 
6.17.0-rc2-PMacG4 #2 PREEMPTLAZY
Tainted: [N]=TEST
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[c20fb270] [c0ac2494] __dump_stack+0x28/0x3c (unreliable)
[c20fb280] [c0ac244c] dump_stack_lvl+0x68/0x88
[c20fb2a0] [c0ac24c0] dump_stack+0x18/0x28
[c20fb2b0] [c06d8298] ubsan_epilogue+0x14/0x50
[c20fb2c0] [c06d7f3c] __ubsan_handle_shift_out_of_bounds+0x224/0x234
[c20fb350] [c07194b4] cfb_fillrect+0x9c4/0x9c8
[c20fb3c0] [c07181d4] bit_clear_margins+0xe8/0x108
[c20fb400] [c0714a0c] fbcon_clear_margins+0xa0/0xd8
[c20fb420] [c0715ce0] fbcon_switch+0x3c0/0x510
[c20fb500] [c0743934] redraw_screen+0x134/0x200
[c20fb530] [c0745ab0] do_bind_con_driver+0x41c/0x458
[c20fb590] [c0745eb0] do_take_over_console+0x18c/0x1e4
[c20fb5c0] [c0713f90] do_fbcon_takeover+0xf8/0x1bc
[c20fb5f0] [c0712bec] fbcon_fb_registered+0x1e8/0x2a8
[c20fb620] [c070e0bc] register_framebuffer+0x22c/0x2d0
[c20fb680] [beb146f4] 
__drm_fb_helper_initial_config_and_unlock+0x4b0/0x674 [drm_kms_helper]
[c20fb700] [beb14218] drm_fb_helper_initial_config+0x44/0x70 
[drm_kms_helper]
[c20fb720] [beb413c4] drm_fbdev_client_hotplug+0x90/0x104 [drm_client_lib]
[c20fb740] [c07ac3c4] drm_client_register+0x90/0xfc
[c20fb770] [beb4114c] drm_fbdev_client_setup+0x110/0x278 [drm_client_lib]
[c20fb790] [beb40278] drm_client_setup+0xc0/0x134 [drm_client_lib]
[c20fb7a0] [bebaa494] radeon_pci_probe+0x220/0x228 [radeon]
[c20fb7c0] [c06eee78] pci_device_probe+0xc4/0x190
[c20fb7f0] [c07c309c] really_probe+0xf4/0x2d8
[c20fb810] [c07c24c8] __driver_probe_device+0xa4/0x114
[c20fb830] [c07c2f0c] driver_probe_device+0x4c/0xe8
[c20fb850] [c07c26b0] __driver_attach+0xcc/0x128
[c20fb870] [c07bfc38] bus_for_each_dev+0xa4/0xe8
[c20fb8a0] [c07c25d4] driver_attach+0x24/0x34
[c20fb8b0] [c07c0380] bus_add_driver+0x20c/0x2e0
[c20fb8e0] [c07c3d4c] driver_register+0x8c/0x154
[c20fb900] [c06eeaa8] __pci_register_driver+0x74/0x88
[c20fb910] [beba60bc] init_module+0x8c/0xfd0 [radeon]
[c20fb920] [c0007958] do_one_initcall+0xf0/0x2d8
[c20fbc10] [c00fdf08] do_init_module+0x90/0x33c
[c20fbc30] [c00fd0cc] load_module+0x1428/0x14bc
[c20fbc80] [c00fafac] sys_finit_module+0x250/0x350
[c20fbd40] [c0012d60] system_call_exception+0xe0/0x204
[c20fbf30] [c00181ac] ret_from_syscall+0x0/0x2c
---- interrupt: c00 at 0x43fc94
NIP:  0043fc94 LR: 0054c254 CTR: 00453790
REGS: c20fbf40 TRAP: 0c00   Tainted: G                 N 
(6.17.0-rc2-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2822242c  XER: 20000000

GPR00: 00000161 af93bb50 a7ae5880 00000023 005583e8 00000000 af93bb25 
0000007f
GPR08: 00000000 00000000 0000002f 0a565c56 4422842c 00a9f71c 2822442c 
00000000
GPR16: 00020000 0aba9500 00000000 00000000 010b1dc0 00000000 010b86c0 
af93bd3c
GPR24: 010b1dc0 00000000 00020000 010a6400 005583e8 00000000 00577ad0 
010b1dc0
NIP [0043fc94] 0x43fc94
LR [0054c254] 0x54c254
---- interrupt: c00
---[ end trace ]---
ADM1030 fan controller [@2c]
DS1775 digital thermometer [@49]
radeon 0000:00:10.0: [drm] fb0: radeondrmfb frame buffer device
[...]

I guess this would be a problem on other 32bit arches too?

If needed I can attach full dmesg, kernel .config lspci output.

Regards,
Erhard
