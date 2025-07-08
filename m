Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7ECAFDBC2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 01:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DCB10E70A;
	Tue,  8 Jul 2025 23:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id B1C8310E704
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 23:16:30 +0000 (UTC)
Received: (qmail 4351 invoked from network); 8 Jul 2025 23:16:28 -0000
Received: from cucamonga.audible.transient.net (192.168.2.5)
 by canarsie.audible.transient.net with QMQP; 8 Jul 2025 23:16:28 -0000
Received: (nullmailer pid 16665 invoked by uid 1000);
 Tue, 08 Jul 2025 23:16:28 -0000
Date: Tue, 8 Jul 2025 23:16:28 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: bskeggs@nvidia.com, airlied@gmail.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] NVIDIA ION graphics broken with Linux 6.16-rc*
Message-ID: <aG2mzB58k3tkxvK-@audible.transient.net>
Mail-Followup-To: Rui Salvaterra <rsalvaterra@gmail.com>,
 bskeggs@nvidia.com, airlied@gmail.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <CALjTZvZgH0N43rMTcZiDVSX93PFL680hsYPwtp8=Ja1OWPvZ1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALjTZvZgH0N43rMTcZiDVSX93PFL680hsYPwtp8=Ja1OWPvZ1A@mail.gmail.com>
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

Rui Salvaterra wrote:
> Hi,
> 
> 
> The machine (Atom 330 CPU, ION chipset, GeForce 9400M graphics) works,
> but graphics are dead. Dmesg shows the following (Linux 6.16-rc5):
>
> [   34.408331] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   34.408351] #PF: supervisor instruction fetch in kernel mode
> [   34.408358] #PF: error_code(0x0010) - not-present page
> [   34.408364] PGD 0 P4D 0
> [   34.408373] Oops: Oops: 0010 [#1] SMP
> [   34.408383] CPU: 2 UID: 0 PID: 583 Comm: Xorg Not tainted
> 6.16.0-rc5-dbg+ #187 PREEMPTLAZY
> [   34.408393] Hardware name: To Be Filled By O.E.M. To Be Filled By
> O.E.M./To be filled by O.E.M., BIOS 080015  08/13/2009
> [   34.408399] RIP: 0010:0x0
> [   34.408414] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [   34.408420] RSP: 0018:ffff88800378bc08 EFLAGS: 00010202
> [   34.408428] RAX: ffffffff82071c60 RBX: ffff888008e6f000 RCX: 0000000000000978
> [   34.408434] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff888008e6f000
> [   34.408440] RBP: ffff88800378bd18 R08: 0000000000000000 R09: 00000000000003ff
> [   34.408445] R10: 0000000000000000 R11: ffff88800378bcc0 R12: ffff88800378bdb8
> [   34.408451] R13: ffff888007dad9c0 R14: ffff888004285680 R15: ffff888007e671c0
> [   34.408457] FS:  00007f2cc7b2eb00(0000) GS:ffff888149ecf000(0000)
> knlGS:0000000000000000
> [   34.408464] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   34.408469] CR2: ffffffffffffffd6 CR3: 0000000008a08000 CR4: 00000000000006f0
> [   34.408475] Call Trace:
> [   34.408482]  <TASK>
> [   34.408486]  nouveau_gem_ioctl_pushbuf+0x10d8/0x1240
> [   34.408504]  ? nouveau_gem_ioctl_new+0x160/0x160
> [   34.408513]  drm_ioctl_kernel+0x7a/0xe0
> [   34.408524]  drm_ioctl+0x1ef/0x490
> [   34.408532]  ? nouveau_gem_ioctl_new+0x160/0x160
> [   34.408541]  ? __handle_mm_fault+0xff2/0x1510
> [   34.408552]  nouveau_drm_ioctl+0x50/0xa0
> [   34.408560]  __x64_sys_ioctl+0x4be/0xa90
> [   34.408570]  ? handle_mm_fault+0xb5/0x1a0
> [   34.408578]  ? lock_mm_and_find_vma+0x34/0x170
> [   34.408587]  do_syscall_64+0x51/0x1d0
> [   34.408596]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> [   34.408605] RIP: 0033:0x7f2cc7d2f9dd
> [   34.408612] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
> 00 00
> [   34.408620] RSP: 002b:00007fff6a501ee0 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [   34.408628] RAX: ffffffffffffffda RBX: 000055c7792b3f78 RCX: 00007f2cc7d2f9dd
> [   34.408634] RDX: 00007fff6a501fa0 RSI: 00000000c0406481 RDI: 0000000000000011
> [   34.408640] RBP: 00007fff6a501f30 R08: 0000000000000978 R09: 000055c7792af740
> [   34.408645] R10: 0000000000000002 R11: 0000000000000246 R12: 00007fff6a501fa0
> [   34.408651] R13: 00000000c0406481 R14: 0000000000000011 R15: 000055c7792ac700
> [   34.408660]  </TASK>
> [   34.408664] Modules linked in:
> [   34.408671] CR2: 0000000000000000
> [   34.408678] ---[ end trace 0000000000000000 ]---
> [   34.408682] RIP: 0010:0x0
> [   34.408691] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> [   34.408696] RSP: 0018:ffff88800378bc08 EFLAGS: 00010202
> [   34.408703] RAX: ffffffff82071c60 RBX: ffff888008e6f000 RCX: 0000000000000978
> [   34.408709] RDX: 0000000000000020 RSI: 0000000000000002 RDI: ffff888008e6f000
> [   34.408715] RBP: ffff88800378bd18 R08: 0000000000000000 R09: 00000000000003ff
> [   34.408720] R10: 0000000000000000 R11: ffff88800378bcc0 R12: ffff88800378bdb8
> [   34.408726] R13: ffff888007dad9c0 R14: ffff888004285680 R15: ffff888007e671c0
> [   34.408731] FS:  00007f2cc7b2eb00(0000) GS:ffff888149ecf000(0000)
> knlGS:0000000000000000
> [   34.408738] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   34.408743] CR2: ffffffffffffffd6 CR3: 0000000008a08000 CR4: 00000000000006f0
> [   34.408750] note: Xorg[583] exited with irqs disabled
> 
> Unfortunately, bisecting is not feasible for me.

That looks pretty similar to the problem I posted
(https://lore.kernel.org/lkml/aElJIo9_Se6tAR1a@audible.transient.net/)
that I bisected to 862450a85b85 ("drm/nouveau/gf100-: track chan
progress with non-WFI semaphore release").  It still reverts cleanly
as of v6.16-rc5 so you might want to give that a shot.

-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
