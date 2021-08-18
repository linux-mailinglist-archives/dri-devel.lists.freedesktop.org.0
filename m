Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F293F0B4B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 20:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DAE6E8B7;
	Wed, 18 Aug 2021 18:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1913 seconds by postgrey-1.36 at gabe;
 Wed, 18 Aug 2021 18:25:21 UTC
Received: from bitmer.com (49-237-179-185.static.tentacle.fi [185.179.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C4E6E8B7;
 Wed, 18 Aug 2021 18:25:21 +0000 (UTC)
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142]
 helo=[192.168.1.48])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1mGPki-0008Q2-W7; Wed, 18 Aug 2021 20:53:25 +0300
To: Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: nouveau resume regression after 64f7c698bea9 ("drm/nouveau/fifo: add
 engine_id hook")
Message-ID: <189814ad-62e1-2f0a-4841-81870fd2c887@bitmer.com>
Date: Wed, 18 Aug 2021 20:53:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 18 Aug 2021 18:52:02 +0000
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

Hi

My old Thinkpad T410i won't resume properly anymore after suspend or
hibernation after v5.12 including today's head 614cb2751d31 ("Merge tag
'trace-v5.14-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace").

I bisected regression to commit 64f7c698bea9 ("drm/nouveau/fifo: add
engine_id hook").

Issue is that Xorg screen is completely messed up, like screen is filled
with random pixels and changing patterns. Text console is fine but Xorg
doesn't get better when switching between them.

$ sudo lspci -s 01:00.0 -nnv
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218M [NVS
3100M] [10de:0a6c] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: Lenovo ThinkPad T410 [17aa:2142]
        Flags: bus master, fast devsel, latency 0, IRQ 30
        Memory at cc000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at ce000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 2000 [size=128]
        Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1
Len=024 <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

"dmesg | grep -i nouveau" before suspend:
[    0.698044] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    0.699574] nouveau 0000:01:00.0: NVIDIA GT218 (0a8600a2)
[    0.737665] nouveau 0000:01:00.0: bios: version 70.18.88.00.06
[    0.738228] nouveau 0000:01:00.0: fb: 256 MiB GDDR3
[    0.838796] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    0.838798] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    0.838802] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    0.838804] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    0.838807] nouveau 0000:01:00.0: DRM: DCB outp 00: 01800323 00010034
[    0.838809] nouveau 0000:01:00.0: DRM: DCB outp 01: 02811300 00000000
[    0.838811] nouveau 0000:01:00.0: DRM: DCB outp 02: 028223a6 0f220010
[    0.838813] nouveau 0000:01:00.0: DRM: DCB outp 03: 02822362 00020010
[    0.838815] nouveau 0000:01:00.0: DRM: DCB outp 04: 048333b6 0f220010
[    0.838817] nouveau 0000:01:00.0: DRM: DCB outp 05: 04833372 00020010
[    0.838819] nouveau 0000:01:00.0: DRM: DCB outp 06: 088443c6 0f220010
[    0.838821] nouveau 0000:01:00.0: DRM: DCB outp 07: 08844382 00020010
[    0.838823] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[    0.838825] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[    0.838827] nouveau 0000:01:00.0: DRM: DCB conn 02: 00101246
[    0.838828] nouveau 0000:01:00.0: DRM: DCB conn 03: 00202346
[    0.838830] nouveau 0000:01:00.0: DRM: DCB conn 04: 00410446
[    0.841812] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    1.268466] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb:
0x50000, bo (____ptrval____)
[    1.268527] fbcon: nouveaudrmfb (fb0) is primary device
[    2.600674] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame
buffer device
[    2.632208] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0
on minor 0

Around suspend/resume dmesg is overrun with these kind of errors:

[   80.883468] nouveau 0000:01:00.0: fb: trapped read at 00005756c0 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
reason 00000006 [NULL_DMAOBJ]
[   80.883479] nouveau 0000:01:00.0: ce: intr 00000300
[   80.883504] nouveau 0000:01:00.0: fb: trapped read at 0000576000 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
reason 00000006 [NULL_DMAOBJ]
[   80.883515] nouveau 0000:01:00.0: ce: intr 00000300
[   80.883523] nouveau 0000:01:00.0: fb: trapped read at 0000579170 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
reason 00000006 [NULL_DMAOBJ]
[   80.883535] nouveau 0000:01:00.0: ce: intr 00000300
[   80.883557] nouveau 0000:01:00.0: fb: trapped write at 000057dbd0 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
reason 00000006 [NULL_DMAOBJ]
...
[   81.435778] OOM killer enabled.
[   81.435780] Restarting tasks ...
[   81.436020] systemd-journald[248]: /dev/kmsg buffer overrun, some
messages lost.
[   81.443134] done.
[   81.445883] nouveau 0000:01:00.0: ce: intr 00000300
[   81.445908] nouveau 0000:01:00.0: fb: trapped read at 0000026000 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
reason 00000006 [NULL_DMAOBJ]
[   81.445932] nouveau 0000:01:00.0: ce: intr 00000300
...
[   81.977050] nouveau 0000:01:00.0: fb: trapped write at 00219728b0 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
reason 00000006 [NULL_DMAOBJ]
[   81.983342] nouveau 0000:01:00.0: ce: intr 00000300
[   81.989505] nouveau 0000:01:00.0: fb: trapped write at 0021bbd2c0 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
reason 00000006 [NULL_DMAOBJ]
[   81.995758] nouveau 0000:01:00.0: ce: intr 00000300
[   82.001600] nouveau 0000:01:00.0: fb: trapped write at 0021e13320 on
channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
reason 00000006 [NULL_DMAOBJ]
[   82.006931] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040
[RT_FAULT] - Address 0020230000
[   82.012021] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00000000, e20: 00002a00, e24: 00030000
[   82.017184] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f8c8000
Xorg[628]] subc 3 class 8597 mthd 15f0 data 00170017
[   82.022332] nouveau 0000:01:00.0: fb: trapped write at 002026bd00 on
channel 4 [0f8c8000 Xorg[628]] engine 00 [PGRAPH] client 0b [PROP]
subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]

Jarkko
