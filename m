Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53646C4E0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB916F88F;
	Tue,  7 Dec 2021 20:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from manul.sfritsch.de (manul.sfritsch.de
 [IPv6:2a01:4f8:172:195f:112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB966E084;
 Tue,  7 Dec 2021 19:22:39 +0000 (UTC)
Message-ID: <3bf72f52-0101-36e1-8c95-4bd983dd4f04@sfritsch.de>
Date: Tue, 7 Dec 2021 20:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
Content-Language: de-DE
To: Dan Moulding <dmoulding@me.com>, christian.koenig@amd.com
References: <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
 <20211207190111.5266-1-dmoulding@me.com>
From: Stefan Fritsch <sf@sfritsch.de>
In-Reply-To: <20211207190111.5266-1-dmoulding@me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Dec 2021 20:48:44 +0000
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
Cc: nouveau@lists.freedesktop.org, regressions@leemhuis.info,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a pretty obvious typo in there:

--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -359,7 +359,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct 
nouveau_channel *chan, bool e
                 fobj = dma_resv_shared_list(resv);
         }

-       for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
+       for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
                 struct nouveau_channel *prev = NULL;
                 bool must_wait = true;


With that it works and I don't see the flickering in a short test. I 
will do more testing, but maybe Dan can test, too.

Cheers,
Stefan

On 07.12.21 20:01, Dan Moulding wrote:
>> Please test if that patch changes anything.
> 
> Looks like the driver is not functional after applying that patch. As
> soon as the display manager is supposed to start I get a black screen
> with just a (working) mouse pointer. VT switching doesn't work after
> that point.
> 
> I got the following warning when compiling with that patch applied:
> 
> drivers/gpu/drm/nouveau/nouveau_fence.c: In function ‘nouveau_fence_sync’:
> drivers/gpu/drm/nouveau/nouveau_fence.c:362:24: warning: comparison between pointer and integer
>    362 |         for (i = 0; (i < fobj ? fobj->shared_count : 0) && !ret; ++i) {
>        |                        ^
> 
> Below are the relevant portions from dmesg after attempting to run
> with the patch applied.
> 
> Cheers,
> 
> -- Dan
> 
> dmesg:
> =====
> 
> <snip>
> 
> [    0.269958] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
> [    0.377100] nouveau 0000:01:00.0: bios: version 86.04.50.80.13
> [    0.377210] nouveau 0000:01:00.0: pmu: firmware unavailable
> [    0.377711] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
> [    0.391160] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
> [    0.391164] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
> [    0.391166] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
> [    0.391168] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
> [    0.391170] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    0.391172] nouveau 0000:01:00.0: DRM: DCB version 4.1
> [    0.391174] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 00020030
> [    0.391176] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
> [    0.391178] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 00020020
> [    0.391180] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
> [    0.391182] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 00020010
> [    0.391184] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
> [    0.391186] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
> [    0.391188] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
> [    0.391190] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
> [    0.391191] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
> [    0.391193] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
> [    0.391194] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
> [    0.391196] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
> [    0.391489] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> [    0.891103] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x200000, bo 00000000bba11dd4
> [    0.892559] fbcon: nouveau (fb0) is primary device
> [    1.298487] tsc: Refined TSC clocksource calibration: 2999.999 MHz
> [    1.298492] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2b3e44b2357, max_idle_ns: 440795324996 ns
> [    1.298555] clocksource: Switched to clocksource tsc
> [    1.340790] Console: switching to colour frame buffer device 240x67
> [    1.341249] nouveau 0000:01:00.0: [drm] fb0: nouveau frame buffer device
> [    1.341412] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
> [    1.341420] nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
> 
> <snip>
> 
> [   19.742986] general protection fault, probably for non-canonical address 0x3e40c25cd2e657bd: 0000 [#1] SMP
> [   19.742989] CPU: 0 PID: 3588 Comm: X Tainted: G                T 5.15.6p2+ #1
> [   19.742991] Hardware name: Dell Inc. XPS 8930/0T2HR0, BIOS 1.1.17 06/22/2021
> [   19.742992] RIP: 0010:nouveau_fence_sync+0x6f/0x240
> [   19.742995] Code: 00 8b 7b 10 85 ff 0f 84 a7 00 00 00 41 89 cd 31 ed 31 d2 49 be ff ff ff ff ff ff ff 7f 4c 8b 7c d3 18 49 8b 94 24 90 00 00 00 <49> 8b 47 08 48 3d 00 37 0f a0 74 0c 48 3d 60 37 0f a0 0f 85 16 01
> [   19.742996] RSP: 0018:ffffb3bc413e7c10 EFLAGS: 00010202
> [   19.742998] RAX: 0000000000001001 RBX: ffff897383c07980 RCX: 0000000000000003
> [   19.742999] RDX: ffff897380cce000 RSI: 0000000000000001 RDI: 0000000000000001
> [   19.743000] RBP: 0000000000000001 R08: ffff897382af6c00 R09: ffff8973868641b8
> [   19.743001] R10: 0000000000000002 R11: ffff8973868641dc R12: ffff897386862400
> [   19.743001] R13: 0000000000000001 R14: 7fffffffffffffff R15: 3e40c25cd2e657b5
> [   19.743002] FS:  00007f5e661be8c0(0000) GS:ffff897ae0c00000(0000) knlGS:0000000000000000
> [   19.743003] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   19.743004] CR2: 000055c9e8e33d50 CR3: 00000001152b7001 CR4: 00000000003706f0
> [   19.743005] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   19.743006] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   19.743006] Call Trace:
> [   19.743008]  <TASK>
> [   19.743009]  nouveau_gem_ioctl_pushbuf+0x6ba/0x11a0
> [   19.743011]  ? nouveau_gem_ioctl_new+0x100/0x100
> [   19.743012]  drm_ioctl_kernel+0x9f/0xe0
> [   19.743015]  drm_ioctl+0x214/0x3f0
> [   19.743016]  ? nouveau_gem_ioctl_new+0x100/0x100
> [   19.743017]  ? syscall_exit_to_user_mode+0x1d/0x40
> [   19.743019]  ? do_syscall_64+0x63/0x80
> [   19.743021]  __x64_sys_ioctl+0x80/0xa0
> [   19.743023]  do_syscall_64+0x56/0x80
> [   19.743025]  ? exc_page_fault+0x18c/0x4e0
> [   19.743026]  ? __do_sys_getpid+0x15/0x20
> [   19.743029]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   19.743030] RIP: 0033:0x7f5e666c52d7
> [   19.743031] Code: 3c 1c e8 2c ff ff ff 85 c0 79 97 5b 49 c7 c4 ff ff ff ff 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 69 4b 0c 00 f7 d8 64 89 01 48
> [   19.743032] RSP: 002b:00007ffe8a5c2588 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   19.743034] RAX: ffffffffffffffda RBX: 00007ffe8a5c25e0 RCX: 00007f5e666c52d7
> [   19.743034] RDX: 00007ffe8a5c25e0 RSI: 00000000c0406481 RDI: 000000000000000e
> [   19.743035] RBP: 00000000c0406481 R08: 0000000000000000 R09: 00007f5e6678ac00
> [   19.743036] R10: 000055c9e96d3f10 R11: 0000000000000246 R12: 000055c9e8e17eb0
> [   19.743036] R13: 000000000000000e R14: 000055c9e8e14340 R15: 000055c9e9791120
> [   19.743037]  </TASK>
> [   19.743038] ---[ end trace e5a33326c4208bdb ]---
> [   19.743039] RIP: 0010:nouveau_fence_sync+0x6f/0x240
> [   19.743040] Code: 00 8b 7b 10 85 ff 0f 84 a7 00 00 00 41 89 cd 31 ed 31 d2 49 be ff ff ff ff ff ff ff 7f 4c 8b 7c d3 18 49 8b 94 24 90 00 00 00 <49> 8b 47 08 48 3d 00 37 0f a0 74 0c 48 3d 60 37 0f a0 0f 85 16 01
> [   19.743041] RSP: 0018:ffffb3bc413e7c10 EFLAGS: 00010202
> [   19.743042] RAX: 0000000000001001 RBX: ffff897383c07980 RCX: 0000000000000003
> [   19.743043] RDX: ffff897380cce000 RSI: 0000000000000001 RDI: 0000000000000001
> [   19.743043] RBP: 0000000000000001 R08: ffff897382af6c00 R09: ffff8973868641b8
> [   19.743044] R10: 0000000000000002 R11: ffff8973868641dc R12: ffff897386862400
> [   19.743045] R13: 0000000000000001 R14: 7fffffffffffffff R15: 3e40c25cd2e657b5
> [   19.743045] FS:  00007f5e661be8c0(0000) GS:ffff897ae0c00000(0000) knlGS:0000000000000000
> [   19.743046] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   19.743047] CR2: 000055c9e8e33d50 CR3: 00000001152b7001 CR4: 00000000003706f0
> [   19.743048] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   19.743048] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
