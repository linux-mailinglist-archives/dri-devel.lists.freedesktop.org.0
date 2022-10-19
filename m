Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78B60584D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CF110E385;
	Thu, 20 Oct 2022 07:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out-06.comm2000.it (smtp-out-06.comm2000.it [212.97.32.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F279110E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 16:55:08 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id BEE81563EC3;
 Wed, 19 Oct 2022 18:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1666198504;
 bh=eNJuvrm0OLE1ElbWzHkO7dbxfd4V9jaQDcr1IyUW5VU=;
 h=Date:From:To:Cc:Subject;
 b=PWw9sS0JZ1HZ50UrZLtlQCIFixu6Jz/0rDl3i5mJzHB0ekrRPiEcMlhXAbV+P+Y3x
 bcn2YjlpTgWVMr4xHU5Wc5PVJdYza6S1SeH4rYSRI1nJ1NuayEPervxzhTsZiK5jth
 lVgXAhvbh099qjbgw7ws5FRdQ/aHvPGsTbk+U4hrxk2kOGBC9kzpAJWpfbsREW/A6W
 ctVXA0iYs8ntfa5A847MUGIXoZZKObLYWoHGy1LW1qPez5eMOJwev01HyiOaZC+LqC
 ophTsekXwPb9St6/Z8Yc8Yv4rjxGpx2tEU6BZCGxhQbvHsQx1szrH3++pfLxWaXZAP
 R57Npd5/ukshQ==
Date: Wed, 19 Oct 2022 18:54:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org
Subject: etnaviv OOPS, NULL pointer dereference on Linux 6.0.2
Message-ID: <Y1Ar4wnv4zeh9Bmw@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 20 Oct 2022 07:21:18 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello all,
I got the following Oops, on a Apalis iMX6 Dual with 512MB RAM,
running glmark2 tests with the system under memory pressure (OOM
Killer!).

It's not something systematic and I cannot tell if this is a regression
or not, any suggestion? The system just froze afterward.

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.0.2-6.1.0-devel+git.dab08f7eecdf (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 11.3.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP Sat Oct 15 06:02:59 UTC 2022
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Ixora Carrier Board V1.1

...

[    1.749471] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    1.750527] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    1.751522] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    1.751566] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    1.753141] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    1.753392] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    1.753421] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    1.756559] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0

...

[  480.994256] Out of memory: Killed process 1740 (Qt5_CinematicEx) total-vm:242656kB, anon-rss:105212kB, file-rss:9864kB, shmem-rss:1304kB, UID:0 pgtables:192kB oom_score_adj:0
[  481.068691] 8<--- cut here ---
[  481.072037] Unable to handle kernel NULL pointer dereference at virtual address 00000004
[  481.080366] [00000004] *pgd=00000000
[  481.083994] Internal error: Oops: 805 [#1] SMP ARM
[  481.088813] Modules linked in: 8021q imx_sdma virt_dma coda_vpu v4l2_jpeg imx_vdoa dw_hdmi_ahb_audio fuse
[  481.098458] CPU: 1 PID: 1755 Comm: QSGRenderThread Not tainted 6.0.2-6.1.0-devel+git.dab08f7eecdf #1
[  481.107619] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[  481.114157] PC is at etnaviv_gem_free_object+0x40/0x128
[  481.119412] LR is at lock_is_held_type+0xa4/0x15c
[  481.124138] pc : [<c0787f90>]    lr : [<c0e46250>]    psr: 60030113
[  481.130421] sp : e1155da8  ip : 00000000  fp : 0000000c
[  481.135670] r10: c34ef400  r9 : c262066c  r8 : 00000122
[  481.140916] r7 : c2153000  r6 : c2153000  r5 : 00000870  r4 : c25f24a0
[  481.147460] r3 : 00000000  r2 : 00000000  r1 : 00000100  r0 : 00000000
[  481.153997] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  481.161143] Control: 10c5387d  Table: 2caf004a  DAC: 00000051
[  481.166896] Register r0 information: NULL pointer
[  481.171615] Register r1 information: non-paged memory
[  481.176694] Register r2 information: NULL pointer
[  481.181429] Register r3 information: NULL pointer
[  481.181441] Register r4 information: slab kmalloc-128 start c25f2480 pointer offset 32 size 128
[  481.186173] Register r5 information: non-paged memory
[  481.186181] Register r6 information: slab kmalloc-512 start c2153000 pointer offset 0 size 512
[  481.199953] Register r7 information: slab kmalloc-512 start c2153000 pointer offset 0 size 512
[  481.199975] Register r8 information: non-paged memory
[  481.199983] Register r9 information: slab kmalloc-2k start c2620000 pointer offset 1644 size 2048
[  481.222276] Register r10 information: slab kmalloc-1k start c34ef400 pointer offset 0 size 1024
[  481.222297] Register r11 information: non-paged memory
[  481.245038] Register r12 information: NULL pointer
[  481.245056] Process QSGRenderThread (pid: 1755, stack limit = 0xd30acffa)
[  481.245070] Stack: (0xe1155da8 to 0xe1156000)
[  481.245084] 5da0:                   c0787f50 fffffff4 00000870 c8102400 c212f000 c2620000
[  481.245094] 5dc0: c262066c c34ef400 0000000c c078693c 00000003 00000000 00000000 c07e2960
[  481.245103] 5de0: c2153000 042beef1 c2153a00 c2620000 c8102400 c8102940 c34ef5e4 c07324ec
[  481.245112] 5e00: c262066c c34ef400 0000000c c2153a00 c2620000 c34ef400 e1155e6c c0732a5c
[  481.245121] 5e20: c00c642e 0000000c c212f000 0000000c c0f6d968 e1155e6c c34ef400 c0723448
[  481.245130] 5e40: 0000e280 00000001 c12b5820 c212f000 aed13e60 e1155e6c 0000002e c2f39000
[  481.245138] 5e60: c0732e44 00000051 00000000 00000000 00000000 0000000c c212f000 c212f7a0
[  481.318348] 5e80: 00000000 c018b61c c212f000 c16e0d20 c03514d8 c156155c 60070013 c0193790
[  481.318369] 5ea0: b28a3000 00000254 c6d00280 00000001 00000000 042beef1 00000009 00004000
[  481.318378] 5ec0: c212f000 c3caf280 00000001 c2f39000 00000028 c03514f0 00000000 00000000
[  481.342916] 5ee0: c03513f0 c212f7a0 00000000 042beef1 aed13e60 c00c642e c2f39001 c0100080
[  481.342928] 5f00: aed13e60 c212f000 c2f39000 c25b8710 00000009 c0342234 00000000 042beef1
[  481.342938] 5f20: c36866e0 80000007 c212f000 b28a311c c3686680 c36866e0 e1155fb0 80000007
[  481.342948] 5f40: c212f000 c0e516b0 aefd7cd0 c01d34b0 000001e0 00000000 00000000 00000000
[  481.342958] 5f60: 00000193 00000007 c160fd90 b28a311c e1155fb0 c0e51500 0000021c 042beef1
[  481.342969] 5f80: adf87818 aed13e90 aed13e60 c00c642e 00000036 c01002b4 c212f000 00000036
[  481.342978] 5fa0: adf87818 c0100080 aed13e90 aed13e60 00000009 c00c642e aed13e60 aed13e40
[  481.342988] 5fc0: aed13e90 aed13e60 c00c642e 00000036 00000001 0000021c 00870000 adf87818
[  481.408411] 5fe0: 00000036 aed13e28 b6088089 b6001ae6 60070030 00000009 00000000 00000000
[  481.408431]  etnaviv_gem_free_object from etnaviv_gem_prime_import_sg_table+0x12c/0x160
[  481.408469]  etnaviv_gem_prime_import_sg_table from drm_gem_prime_import_dev+0x98/0x150
[  481.408509]  drm_gem_prime_import_dev from drm_gem_prime_fd_to_handle+0x188/0x1f8
[  481.408528]  drm_gem_prime_fd_to_handle from drm_ioctl+0x1e8/0x3a0
[  481.408545]  drm_ioctl from sys_ioctl+0x530/0xdbc
[  481.408571]  sys_ioctl from ret_fast_syscall+0x0/0x1c
[  481.408587] Exception stack(0xe1155fa8 to 0xe1155ff0)
[  481.408599] 5fa0:                   aed13e90 aed13e60 00000009 c00c642e aed13e60 aed13e40
[  481.408608] 5fc0: aed13e90 aed13e60 c00c642e 00000036 00000001 0000021c 00870000 adf87818
[  481.477625] 5fe0: 00000036 aed13e28 b6088089 b6001ae6
[  481.477641] Code: e5962174 e59f80e0 e3a01c01 e1a07006 (e5823004)
[  481.477819] ---[ end trace 0000000000000000 ]---

Francesco

