Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E411A44FF45
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 08:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63D56E45D;
	Mon, 15 Nov 2021 07:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Sun, 14 Nov 2021 23:47:18 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80789F75
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 23:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1636933246; bh=IAcEClY5snWVS6du2PcYs3Fl3UZmRdQ8wEpCS9VYb0E=;
 h=Date:From:To:Subject:From;
 b=ctxKIv72mF2l1iZTCdBqFWIoBu36WwVBshqre6AsKCcdVXI7iu38Vd58+FTEjNp8e
 oR/jVINIzTEy0bZl8+9NsmwJYfLb3K3bxb606ExajcHQ1IX0jtz8O+v7QjOTsDa7hS
 7VwuaucKo8+iKwsDSOuHWKdBQ0fIejNAdwy2qcl4=
Date: Mon, 15 Nov 2021 00:40:45 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: dri-devel@lists.freedesktop.org
Subject: Panic with linus/master and panfrost
Message-ID: <20211114234045.cc5tearljna2ywij@core>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 15 Nov 2021 07:35:18 +0000
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

Hello,

I'm getting some fence refcounting related panics with the current
Linus's master branch:

It happens immediately whenever I start Xorg or sway.

Anyone has any ideas where to start looking? It works fine with v5.15.

(sorry for the interleaved log, it's coming from multiple CPUs at once
I guess)

kind regards,
	o.

------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 4 PID: 560 at lib/refcount.c:28 refcount_warn_saturate+0xec/0x140
Modules linked in:
CPU: 4 PID: 560 Comm: sway Not tainted 5.15.0-13547-g5169ae41ace0 #24
Hardware name: Pine64 PinePhonePro (DT)
pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : refcount_warn_saturate+0xec/0x140
lr : refcount_warn_saturate+0xec/0x140
sp : ffff8000127b3be0
x29: ffff8000127b3be0 x28: ffff8000127b3d50 x27: ffff00001927e700
x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000004
x23: ffff00001e31da80 x22: ffff000005497580 x21: ffff00001e31da90
x20: ffff00001e31da80 x19: ffff00001e31da90 x18: 0000000000000003
x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000127b3b68
x14: ffffffffffffffff x13: 2e656572662d7265 x12: 7466612d65737520
x11: 3b776f6c66726564 x10: ffff800011d7e8a0 x9 : ffff800010178a1c
x8 : 00000000ffffefff x7 : ffff800011dd68a0 x6 : 0000000000000001
x5 : ffff0000f778e788 x4 : 0000000000000000 x3 : 0000000000000027
x2 : 0000000000000023 x1 : ffff0000f778e790 x0 : 0000000000000026
Call trace:
 refcount_warn_saturate+0xec/0x140
 drm_syncobj_replace_fence+0x16c/0x17c
 panfrost_ioctl_submit+0x364/0x440
 drm_ioctl_kernel+0x9c/0x154
 drm_ioctl+0x1f0/0x410
 __arm64_sys_ioctl+0xb4/0xdc
 invoke_syscall+0x4c/0x110
 el0_svc_common.constprop.0+0x48/0xf0
 do_el0_svc+0x2c/0x90
 el0_svc+0x14/0x50
 el0t_64_sync_handler+0x9c/0x120
 el0t_64_sync+0x158/0x15c
---[ end trace 51cdc14807ba9222 ]---
------------[ cut here ]------------
Unable to handle kernel write to read-only memory at virtual address ffff800010820b10
refcount_t: saturated; leaking memory.
Mem abort info:
WARNING: CPU: 1 PID: 223 at lib/refcount.c:22 refcount_warn_saturate+0x6c/0x140
  ESR = 0x9600004e
Modules linked in:
  EC = 0x25: DABT (current EL), IL = 32 bits

CPU: 1 PID: 223 Comm: pan_js Tainted: G        W         5.15.0-13547-g5169ae41ace0 #24
  SET = 0, FnV = 0
Hardware name: Pine64 PinePhonePro (DT)
  EA = 0, S1PTW = 0
pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  FSC = 0x0e: level 2 permission fault
pc : refcount_warn_saturate+0x6c/0x140
Data abort info:
lr : refcount_warn_saturate+0x6c/0x140
  ISV = 0, ISS = 0x0000004e
sp : ffff800012a2bd90
  CM = 0, WnR = 1
x29: ffff800012a2bd90
swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000019ba000
 x28: 0000000000000000
[ffff800010820b10] pgd=10000000f7fff003
 x27: 0000000000000000
, p4d=10000000f7fff003

, pud=10000000f7ffe003
x26: 0000000000000000
, pmd=0040000000a00781
 x25: ffff800011906000

 x24: ffff000013ee7a20
Internal error: Oops: 9600004e [#1] SMP

Modules linked in:
x23: ffff8000108211e0

 x22: ffff800011906000
CPU: 2 PID: 222 Comm: pan_js Tainted: G        W         5.15.0-13547-g5169ae41ace0 #24
 x21: ffff0000251ef000
Hardware name: Pine64 PinePhonePro (DT)

pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
x20: ffff000005497580
pc : dma_fence_add_callback+0xc8/0x120
 x19: ffff00001532b4c0
lr : dma_fence_add_callback+0x78/0x120
 x18: 0000000000000000
sp : ffff800012a23d60

x29: ffff800012a23d60
x17: 000000040044ffff
 x28: 0000000000000000
 x16: 00000032b5503510
 x27: 0000000000000000
 x15: 0000000000000000


x26: 0000000000000000
x14: ffff00000550c380
 x25: ffff800011906000
 x13: 2e79726f6d656d20
 x24: 0000000000000000
 x12: 676e696b61656c20


x23: 0000000000000000
x11: 3b64657461727574
 x22: ffff8000108211e0
 x10: 6173203a745f746e
 x21: ffff0000054975d0
 x9 : ffff80001022e51c


x20: ffff00001532b468
x8 : 0000000000000001
 x19: ffff000005497580
 x7 : 0000000000000e08
 x18: 0000000000000000
 x6 : 0000000000000001


x17: 000000040044ffff
x5 : 0000000000000000
 x16: 00000032b5503510
 x4 : ffff0000f773a788
 x15: 0000000000000000
 x3 : ffff0000f77466f0


x14: ffff00000550d100
x2 : ffff0000f773a788
 x13: ffff8000e5e4e000
 x1 : ffff8000e5e32000
 x12: 0000000034d4d91d
 x0 : 0000000000000026


x11: 0000000000000000
Call trace:
 x10: 0000000000000002
 refcount_warn_saturate+0x6c/0x140
 x9 : ffff800010899578
 drm_sched_entity_pop_job+0x418/0x490
 
 drm_sched_main+0xb0/0x41c
x8 : ffff0000148dcd60
 kthread+0x14c/0x160
 x7 : 0000000000000000
 ret_from_fork+0x10/0x20
 x6 : 00000000010a4760
---[ end trace 51cdc14807ba9223 ]---

x5 : ffff000013ee79f8 x4 : 0000000000000001 x3 : ffff0000054975b0
x2 : 0000000000000000 x1 : ffff800010820b10 x0 : ffff000005497590
Call trace:
 dma_fence_add_callback+0xc8/0x120
 drm_sched_entity_pop_job+0xa4/0x490
 drm_sched_main+0xb0/0x41c
 kthread+0x14c/0x160
 ret_from_fork+0x10/0x20
Code: 91004260 f9400e61 f9000e74 a9000680 (f9000034)
---[ end trace 51cdc14807ba9224 ]---
Kernel panic - not syncing: Oops: Fatal exception
SMP: stopping secondary CPUs
SMP: failed to stop secondary CPUs 1-2
Kernel Offset: disabled
CPU features: 0x2,00004042,40000806
Memory Limit: none
---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

