Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2B6BBB78
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 18:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603ED10E990;
	Wed, 15 Mar 2023 17:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912A010E2A9;
 Wed, 15 Mar 2023 17:54:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7560761E01;
 Wed, 15 Mar 2023 17:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93ECC433EF;
 Wed, 15 Mar 2023 17:54:53 +0000 (UTC)
Date: Wed, 15 Mar 2023 13:54:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Message-ID: <20230315135451.1f7b5e06@gandalf.local.home>
In-Reply-To: <20230315115712.56b3c21f@gandalf.local.home>
References: <20230307212223.7e49384a@gandalf.local.home>
 <20230307212615.7a099103@gandalf.local.home>
 <b919b550-6da8-f9f0-a0eb-0fd8af513817@amd.com>
 <20230315110949.1e11b3aa@gandalf.local.home>
 <07597f3e-0b35-c22b-91ec-fa3875d6fe22@gmail.com>
 <20230315115712.56b3c21f@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Mar 2023 11:57:12 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> The WARN_ON triggered:
> 
> [   21.481449] mpls_gso: MPLS GSO support
> [   21.488795] IPI shorthand broadcast: enabled
> [   21.488873] ------------[ cut here ]------------
> [   21.490101] ------------[ cut here ]------------
> 
> [   21.491693] WARNING: CPU: 1 PID: 38 at drivers/gpu/drm/ttm/ttm_bo.c:332 ttm_bo_release+0x2ac/0x2fc  <<<---- Line of the added WARN_ON()
> 
> [   21.492940] refcount_t: underflow; use-after-free.
> [   21.492965] WARNING: CPU: 0 PID: 84 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
> [   21.496116] Modules linked in:
> [   21.497197] Modules linked in:
> [   21.500105] CPU: 1 PID: 38 Comm: kworker/1:1 Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #993
> [   21.500789] CPU: 0 PID: 84 Comm: kworker/0:1H Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #993
> [   21.501882] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [   21.503533] sched_clock: Marking stable (20788024762, 714243692)->(22140778105, -638509651)
> [   21.504080] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
> [   21.504089] Workqueue: ttm ttm_bo_delayed_delete
> [   21.507196] Workqueue: events drm_fb_helper_damage_work
> [   21.509235] 
> [   21.510291] registered taskstats version 1
> [   21.510302] Running ring buffer tests...
> [   21.511792] 
> [   21.513870] EIP: refcount_warn_saturate+0xb6/0xfc
> [   21.515261] EIP: ttm_bo_release+0x2ac/0x2fc
> [   21.516566] Code: 68 00 27 0c d8 e8 36 3b aa ff 0f 0b 58 c9 c3 90 80 3d 41 c2 37 d8 00 75 8a c6 05 41 c2 37 d8 01 68 2c 27 0c d8 e8 16 3b aa ff <0f> 0b 59 c9 c3 80 3d 3f c2 37 d8 00 0f 85 67 ff ff ff c6 05 3f c2
> [   21.516998] Code: ff 8d b4 26 00 00 00 00 66 90 0f 0b 8b 43 10 85 c0 0f 84 a1 fd ff ff 8d 76 00 0f 0b 8b 43 28 85 c0 0f 84 9c fd ff ff 8d 76 00 <0f> 0b e9 92 fd ff ff 8d b4 26 00 00 00 00 66 90 c7 43 18 00 00 00
> [   21.517905] EAX: 00000026 EBX: c129d150 ECX: 00000040 EDX: 00000002
> [   21.518987] EAX: d78c8550 EBX: c129d134 ECX: c129d134 EDX: 00000001
> [   21.519337] ESI: c129d0bc EDI: f6f91200 EBP: c2b8bf18 ESP: c2b8bf14
> [   21.520617] ESI: c129d000 EDI: c126a7a0 EBP: c1839c24 ESP: c1839bec
> [   21.521546] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
> [   21.526154] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
> [   21.526162] CR0: 80050033 CR2: 00000000 CR3: 18506000 CR4: 00150ef0
> [   21.526166] Call Trace:
> [   21.526189]  ? ww_mutex_unlock+0x3a/0x94
> [   21.530300] CR0: 80050033 CR2: ff9ff000 CR3: 18506000 CR4: 00150ef0
> [   21.531722]  ? ttm_bo_cleanup_refs+0xc4/0x1e0
> [   21.533114] Call Trace:
> [   21.534516]  ttm_mem_evict_first+0x3d3/0x568
> [   21.535901]  ttm_bo_delayed_delete+0x9c/0xa4
> [   21.537391]  ? kfree+0x6b/0xdc
> [   21.538901]  process_one_work+0x21a/0x484
> [   21.540279]  ? ttm_range_man_alloc+0xe0/0xec
> [   21.540854]  worker_thread+0x14a/0x39c
> [   21.541714]  ? ttm_range_man_fini_nocheck+0xe8/0xe8
> [   21.543332]  kthread+0xea/0x10c

So I triggered it again, and the same backtrace is there.

> [   21.544301]  ttm_bo_mem_space+0x1d0/0x1e4

It looks like the object is being reserved before it's fully removed. And
it's somewhere in this tty_bo_mem_space() (which comes from the
qxl_bo_create()).

I don't know this code at all, nor do I have any idea of what it's trying
to do. All I know is that this is triggering often (not always), and it has
to do with some race.

Now my config has lots of debugging enabled, which slows down the system
quite a bit. This also happens to open up race windows. Just because your
testing doesn't trigger it, doesn't mean that the race doesn't exist. It's
just likely to be very hard to hit.

> [   21.544942]  ? process_one_work+0x484/0x484
> [   21.545887]  ttm_bo_validate+0xc5/0x19c
> [   21.546986]  ? kthread_complete_and_exit+0x1c/0x1c
> [   21.547680]  ttm_bo_init_reserved+0x15e/0x1fc
> [   21.548716]  ret_from_fork+0x1c/0x28
> [   21.549650]  qxl_bo_create+0x145/0x20c

Here's the latest backtrace:

[  170.817449] ------------[ cut here ]------------
[  170.817455] ------------[ cut here ]------------
[  170.818210] refcount_t: underflow; use-after-free.
[  170.818228] WARNING: CPU: 0 PID: 267 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
[  170.819352] WARNING: CPU: 3 PID: 2382 at drivers/gpu/drm/ttm/ttm_bo.c:332 ttm_bo_release+0x278/0x2c8
[  170.820124] Modules linked in:
[  170.822127] Modules linked in:
[  170.823829] 
[  170.823832] CPU: 0 PID: 267 Comm: kworker/0:10H Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #998
[  170.824610] 
[  170.825121] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[  170.825124] Workqueue: ttm ttm_bo_delayed_delete
[  170.825498] CPU: 3 PID: 2382 Comm: kworker/3:3 Not tainted 6.3.0-rc2-test-00047-g6015b1aca1a2-dirty #998
[  170.826996] 
[  170.827367] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[  170.828839] EIP: refcount_warn_saturate+0xb6/0xfc
[  170.829842] Workqueue: events drm_fb_helper_damage_work
[  170.831325] Code: 68 50 ab ef d3 e8 76 ce b2 ff 0f 0b 58 c9 c3 90 80 3d 4e e0 18 d4 00 75 8a c6 05 4e e0 18 d4 01 68 7c ab ef d3 e8 56 ce b2 ff <0f> 0b 59 c9 c3 80 3d 4c e0 18 d4 00 0f 85 67 ff ff ff c6 05 4c e0
[  170.831670] 
[  170.833138] EAX: 00000026 EBX: c2aa6ef4 ECX: 00000002 EDX: 80000002
[  170.834080] EIP: ttm_bo_release+0x278/0x2c8
[  170.834910] ESI: c27744e0 EDI: f758eaa8 EBP: c3083f34 ESP: c3083f30
[  170.838453] Code: 00 90 89 f8 e9 91 fe ff ff 90 0f 0b 8b 43 10 85 c0 0f 84 d5 fd ff ff 8d 76 00 0f 0b 8b 43 28 85 c0 0f 84 d0 fd ff ff 8d 76 00 <0f> 0b e9 c6 fd ff ff 8d b4 26 00 00 00 00 66 90 c7 43 18 00 00 00
[  170.838714] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[  170.839872] EAX: d3835cf0 EBX: c2aa6ed8 ECX: c2aa6ed8 EDX: 00000001
[  170.840546] CR0: 80050033 CR2: 005ce01c CR3: 03afa000 CR4: 00150ef0
[  170.841669] ESI: c2aa6e00 EDI: c11333d8 EBP: c3b15ca0 ESP: c3b15c68
[  170.844583] Call Trace:
[  170.845738] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[  170.846732]  ttm_bo_delayed_delete+0x7c/0x84
[  170.847766] CR0: 80050033 CR2: 005b59b1 CR3: 03b12000 CR4: 00150ef0
[  170.848761]  process_one_work+0x18a/0x350
[  170.849177] Call Trace:
[  170.850250]  worker_thread+0x136/0x378
[  170.850942]  ? ttm_resource_free+0x57/0x6c
[  170.851928]  ? _raw_spin_unlock_irqrestore+0x25/0x40
[  170.852583]  ? ttm_bo_cleanup_memtype_use+0x5f/0x64
[  170.853002]  kthread+0xda/0xfc
[  170.853608]  ? ttm_bo_cleanup_refs+0xbb/0x1c8
[  170.854266]  ? rescuer_thread+0x340/0x340
[  170.855058]  ttm_mem_evict_first+0x324/0x3a0
[  170.855840]  ? kthread_complete_and_exit+0x1c/0x1c
[  170.856341]  ttm_bo_mem_space+0x1d8/0x1ec
[  170.857056]  ret_from_fork+0x1c/0x28
[  170.857702]  ttm_bo_validate+0xb3/0x13c
[  170.858393] ---[ end trace 0000000000000000 ]---
[  170.859167]  ttm_bo_init_reserved+0x12e/0x1cc
[  170.863261] systemd[1]: Starting Create System Users...
[  170.863964]  qxl_bo_create+0x14a/0x1f8
[  170.892037]  ? qxl_ttm_debugfs_init+0x48/0x48
[  170.892043]  qxl_alloc_bo_reserved+0x39/0x98
         Starting ESC[0;1;39mCreat[  170.892047]  ? kmalloc_trace+0x22/0x84
e System UsersESC[0m...
[  170.895826]  qxl_image_alloc_objects+0x91/0xfc
[  170.897122]  qxl_draw_dirty_fb+0x159/0x440
[  170.898207] systemd[1]: Finished Set the console keyboard layout.
[  170.898329]  qxl_framebuffer_surface_dirty+0xfb/0x1cc
[  170.901528]  ? qxl_create_plane+0xc4/0xc4
[  170.901533]  drm_fbdev_fb_dirty+0x129/0x1ac
[ESC[0;32m  OK  ESC[0m] Finished ESC[0[  170.901537]  drm_fb_helper_damage_work+0x8f/0x158
;1;39mSet the console keyboard layoutESC[0m.
[  170.905435]  process_one_work+0x18a/0x350
[  170.906578]  worker_thread+0x136/0x378
[  170.906832] systemd[1]: Finished Load/Save Random Seed.
[  170.907195]  ? _raw_spin_unlock_irqrestore+0x25/0x40
[  170.910267]  kthread+0xda/0xfc
[  170.910271]  ? rescuer_thread+0x340/0x340
[  170.910275]  ? kthread_complete_and_exit+0x1c/0x1c
[  170.910278]  ret_from_fork+0x1c/0x28
[  170.910282] ---[ end trace 0000000000000000 ]---

-- Steve
