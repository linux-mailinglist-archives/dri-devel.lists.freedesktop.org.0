Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570393FA4E6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 11:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D32E6EA36;
	Sat, 28 Aug 2021 09:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E986EA2E;
 Sat, 28 Aug 2021 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630143530;
 bh=/K2AIHPNi1ELUniy3IyZBfz60CCRq0L1+Owm4YQ9W4w=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=hieB/koUvkqLKt39cVlxsHI2b7pMPDfZ6fx5tREEPzXeg6ZKKm85BTjJReG9Ru5oa
 1m6WnZd4+12ytFbMVSLpmDQoubIRGxZSFBe4OT/gB+FFrFTd/jCw6wRlmEFB8r5Gk9
 ZwSyhwWHllPK4HnHRH/IaESQPAu/WTgROQJv+BVU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.216.248]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1mFZD02zHk-00DIQ9; Sat, 28
 Aug 2021 11:38:50 +0200
Message-ID: <b6faf6b447f2a5e92e50adb30bea8ebaa2e70ae1.camel@gmx.de>
Subject: dri, nouveau: BUG: KASAN: use-after-free in
 dma_fence_signal_timestamp_locked+0x399/0x430
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Sat, 28 Aug 2021 11:38:49 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.41.2 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EqPrmtaK9Qdqi20jMWZ22Wxje/Z3WbHO2u3Xmbte/1rfzDVzT66
 vzZ/OZS+keznbpdnCXySXp5Xs8tgYUT6H+fSfqa5Q8AmYc/lClfJE4QwyK4Hm4I2HORFJEG
 l0tB7s9FW3yLbJbmmCtZVytB8yaxA/tz/lh8qj3HDjsYtdX01Xt6xxZipjpCMlDQ9T+fca+
 58HduUfx9Fex54b4ap33A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IAhhfZe2M3k=:bUXKk/+3QMFq6+3MjozwZs
 UZFI4l+T5Xpdw8q25CxROIeWS/u/AavYfr4HUBtcFP0z6CcfbLi/8/kU26OOwBJsoZJmC8caj
 HpE8jsgzmDc5nw5vAL5h5IqSGMsaPx/RpbKQbyPDf0yiC3vNWoAA7IaJcvgIQnD4jD2Am/TQa
 Rq6Xt1ZWKuzdZRmYizPKSQb9L/CIJSZmFLhXTEb7PibA7WiSMTVZxrMm5xYP6tNwuVcSDIj48
 M5eVlGBk4f7dvZtrPO7GxUSTpXuBo8qj0DoANJ2xDEYEiIueufM2MyQT1fZOkCLmw0PyviM3r
 P005vq1na5/l0tL/e1ro4KhdBNuNv99Hq5HWZvvLR61/dEQeu1p3lAB+KaHDUsY7To+WOFqZp
 H/HaGc46DmalOrO7vRzPlTXqVU9+797rYrtQCjVx8nbqbdCzpWZ69WZE7x2NJ5jkukTMfbgyu
 KOg3q01VHQyolOaj7wNYwQEvEgOdbwSmffsppJDx1MzX2SMI/ZOw2C/tENSDSn1jCRlAGv+LZ
 Hza1+AdMCcTPnWHqnc2Qc7H7slct+mgHP4NJrCMEPqGy05+xWTDopBtTmT05D/SBoReK88Vuq
 4Lhwp88Ag41dhwHgJlsQN4xunkhesz+JH5GsK4sYRDjswrlfnX+eM2csH0uyM0vVvvIF6geUw
 uAYvX+S018mK4Pr9W8Da8RrulA6beboq8ZCxEQMxJgxoRhIzgArN9OAGTGazZ78CY6KkR5ppA
 56AzsxN+uCjSuze0QJZDEQ/ExuKlVPu6Zy5Rkr2kQFsky3PTn0KG1ZQGRTK+teZa+FDcm1KNq
 wr7l3Ix3PznVXyAHZMjTjydUHQ07Z9c6kT90AvmYBL+YBx99LVw8wpXZ13F3p1211JcGHkRMV
 h6/hYlo6D0EvmO0tIe6IeaOVOPqP4+PPypwQUowo4Xcw/fDBvMpPTEpaX5nuL8F+1yxdKkbiI
 TAT1snHYOycE/6cWbgjo33QN8SD/xTvsITwQ5oNgXRPoIZ0zUTebcWL7dL5/lMswhjobJnfzm
 ejQVPuPMMGwS5sx/44gWlWarZLdkEXJ2CXydGC9AVLdXvVNKzgOg6QqBz6+oE3bhW5wSLhdHi
 myWNWizQUWnaCe4xJssiaKRjd7F3tAiYHN8
X-Mailman-Approved-At: Sat, 28 Aug 2021 09:56:00 +0000
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

Enabling kasan or kcsan in my GTX-980 equipped box will in fairly short
order result in emission of a use-after-free detection gripe (no access
assert in kcsan case.. same same), immediately followed by a small
mushroom cloud as the kernel attempts to access the twilight zone.

The below (brought to you by me forgetting to boot nomodeset despite
knowing full well that nouveau WILL muck up any testing with either of
these tools:) is x86-tip, with lockdep and kasan enabled.  Branch isn't
really irrelevant, it explodes just as readily in master.

[  604.071721] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  604.072204] BUG: KASAN: use-after-free in dma_fence_signal_timestamp_loc=
ked+0x399/0x430
[  604.072269] Read of size 8 at addr ffff8881fffa0b28 by task swapper/1/0
[  604.072330]=20
[  604.072351] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: G      =
      E     5.14.0.g29fb75d-tip_debug #19
[  604.072439] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[  604.072502] Call Trace:
[  604.072530]  <IRQ>
[  604.072563]  dump_stack_lvl+0x45/0x59
[  604.072605]  print_address_description.constprop.0+0x1f/0x140
[  604.072650]  ? dma_fence_signal_timestamp_locked+0x399/0x430
[  604.072708]  kasan_report.cold+0x83/0xdf
[  604.072761]  ? dma_fence_signal_timestamp_locked+0x399/0x430
[  604.072820]  dma_fence_signal_timestamp_locked+0x399/0x430
[  604.072865]  ? perf_trace_dma_fence+0x940/0x940
[  604.072916]  ? ktime_get+0x64/0x160
[  604.072955]  ? ktime_get+0x99/0x160
[  604.072981]  nouveau_fence_signal+0x11/0x210 [nouveau]
[  604.073161]  nouveau_fence_wait_uevent_handler+0x116/0x220 [nouveau]
[  604.073333]  ? __lock_release+0xec/0x4e0
[  604.073367]  nvif_notify+0x276/0x4f0 [nouveau]
[  604.073490]  ? nvif_notify_get+0x170/0x170 [nouveau]
[  604.073623]  ? nvkm_notify_send+0x195/0x510 [nouveau]
[  604.073760]  ? do_raw_spin_unlock+0x55/0x1f0
[  604.073814]  nvkm_notify_send+0x238/0x510 [nouveau]
[  604.073903]  ? do_raw_spin_unlock+0x55/0x1f0
[  604.073934]  nvkm_event_send+0x1e3/0x2d0 [nouveau]
[  604.074069]  ? validate_chain+0x124/0xd50
[  604.074096]  nvkm_fifo_uevent+0x60/0x70 [nouveau]
[  604.074257]  ? nvkm_fifo_cevent+0x20/0x20 [nouveau]
[  604.074367]  ? check_prev_add+0x20c0/0x20c0
[  604.074409]  ? mark_lock+0xc3/0xac0
[  604.074448]  gk104_fifo_intr+0x627/0x960 [nouveau]
[  604.074585]  nvkm_mc_intr+0x407/0x5e0 [nouveau]
[  604.074715]  ? __lock_acquire+0xad9/0x17b0
[  604.074765]  nvkm_pci_intr+0x12b/0x190 [nouveau]
[  604.074912]  ? nvkm_pci_init+0x1d0/0x1d0 [nouveau]
[  604.075076]  ? nvkm_pci_init+0x1d0/0x1d0 [nouveau]
[  604.075202]  __handle_irq_event_percpu+0x24a/0x640
[  604.075240]  handle_irq_event+0xef/0x230
[  604.075285]  ? handle_irq_event_percpu+0x100/0x100
[  604.075348]  handle_edge_irq+0x20d/0xb70
[  604.075408]  __common_interrupt+0x94/0x1e0
[  604.075459]  common_interrupt+0x9f/0xd0
[  604.075503]  </IRQ>
[  604.075533]  asm_common_interrupt+0x1e/0x40
[  604.075576] RIP: 0010:cpuidle_enter_state+0x1f8/0x8d0
[  604.075629] Code: 00 41 8b 77 04 bf ff ff ff ff e8 43 ef ff ff 31 ff e8 =
0c 15 fe fe 80 7c 24 08 00 0f 85 9e 01 00 00 e8 bc aa 22 ff fb 45 85 e4 <0f=
> 88 8c 02 00 00 49 63 ec 48 8d 44 6d 00 48 8d 44 85 00 48 8d 7c
[  604.075781] RSP: 0018:ffff8881009bfdc8 EFLAGS: 00000206
[  604.075835] RAX: 0000000000701531 RBX: ffffffff83a34520 RCX: 1ffffffff07=
8ba21
[  604.075899] RDX: 0000000000000000 RSI: ffffffff82e83020 RDI: ffffffff82f=
a1660
[  604.075962] RBP: 0000000000000003 R08: 0000000000000001 R09: ffffffff83c=
5f617
[  604.076025] R10: fffffbfff078bec2 R11: 0000000000000001 R12: 00000000000=
00003
[  604.076088] R13: ffff8883ce8c564c R14: 0000008ca56ecfa2 R15: ffff8883ce8=
c5648
[  604.076179]  ? cpuidle_enter_state+0x1f4/0x8d0
[  604.076238]  cpuidle_enter+0x4a/0xa0
[  604.076283]  cpuidle_idle_call+0x255/0x3c0
[  604.076328]  ? arch_cpu_idle_exit+0x40/0x40
[  604.076372]  ? tsc_verify_tsc_adjust+0x9c/0x2e0
[  604.076418]  ? lockdep_hardirqs_off+0x90/0xd0
[  604.076472]  do_idle+0xd7/0x140
[  604.076513]  cpu_startup_entry+0x19/0x20
[  604.076554]  start_secondary+0x250/0x2f0
[  604.076598]  ? set_cpu_sibling_map+0x1c20/0x1c20
[  604.076657]  secondary_startup_64_no_verify+0xb0/0xbb
[  604.076742]=20
[  604.076762] Allocated by task 2004:
[  604.076796]  kasan_save_stack+0x1b/0x40
[  604.076836]  __kasan_kmalloc+0x7c/0x90
[  604.076873]  nouveau_gem_object_close+0x300/0x7f0 [nouveau]
[  604.077060]  drm_gem_object_release_handle+0x69/0xf0 [drm]
[  604.077171]  drm_gem_handle_delete+0x5b/0xa0 [drm]
[  604.077260]  drm_ioctl_kernel+0x1a7/0x240 [drm]
[  604.077349]  drm_ioctl+0x400/0x8b0 [drm]
[  604.077453]  nouveau_drm_ioctl+0xec/0x230 [nouveau]
[  604.077630]  __x64_sys_ioctl+0x11c/0x170
[  604.077671]  do_syscall_64+0x38/0x90
[  604.077707]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  604.077754]=20
[  604.077772] Freed by task 4941:
[  604.077803]  kasan_save_stack+0x1b/0x40
[  604.077840]  kasan_set_track+0x1c/0x30
[  604.077877]  kasan_set_free_info+0x20/0x30
[  604.077917]  __kasan_slab_free+0xec/0x130
[  604.077955]  slab_free_freelist_hook+0x90/0x1a0
[  604.077999]  kfree+0xcc/0x510
[  604.078031]  nouveau_gem_object_delete_work+0x7f/0xa0 [nouveau]
[  604.078215]  nouveau_cli_work+0x1ec/0x330 [nouveau]
[  604.078390]  process_one_work+0x89c/0x14d0
[  604.078431]  worker_thread+0x57d/0x1310
[  604.078468]  kthread+0x335/0x400
[  604.078501]  ret_from_fork+0x1f/0x30
[  604.078537]=20
[  604.078555] The buggy address belongs to the object at ffff8881fffa0b00
                which belongs to the cache kmalloc-96 of size 96
[  604.078654] The buggy address is located 40 bytes inside of
                96-byte region [ffff8881fffa0b00, ffff8881fffa0b60)
[  604.078747] The buggy address belongs to the page:
[  604.078790] page:000000005085aa1b refcount:1 mapcount:0 mapping:00000000=
00000000 index:0x0 pfn:0x1fffa0
[  604.078868] flags: 0x2ffe00000000200(slab|node=3D0|zone=3D2|lastcpupid=
=3D0x7ff)
[  604.078931] raw: 02ffe00000000200 0000000000000000 dead000000000122 ffff=
888100042780
[  604.078996] raw: 0000000000000000 0000000000200020 00000001ffffffff 0000=
000000000000
[  604.079059] page dumped because: kasan: bad access detected
[  604.079107]=20
[  604.079125] Memory state around the buggy address:
[  604.079168]  ffff8881fffa0a00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc=
 fc fc
[  604.079238]  ffff8881fffa0a80: fa fb fb fb fb fb fb fb fb fb fb fb fc fc=
 fc fc
[  604.079299] >ffff8881fffa0b00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc=
 fc fc
[  604.079360]                                   ^
[  604.079401]  ffff8881fffa0b80: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc=
 fc fc
[  604.079480]  ffff8881fffa0c00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc=
 fc fc
[  604.079553] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  604.079631] Disabling lock debugging due to kernel taint
[  604.079653] general protection fault, probably for non-canonical address=
 0xaf600177000016b5: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  604.079675] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: G    B =
      E     5.14.0.g29fb75d-tip_debug #19
[  604.079696] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[  604.079710] RIP: 0010:queue_work_on+0x2f/0x80
[  604.079723] Code: 41 56 41 55 49 89 f5 41 54 49 89 d4 55 89 fd 53 9c 58 =
fa 25 00 02 00 00 48 89 c3 75 33 be 08 00 00 00 4c 89 e7 e8 c1 dc 5b 00 <f0=
> 49 0f ba 2c 24 00 41 be 00 00 00 00 73 1e 48 85 db 74 06 e8 58
[  604.079752] RSP: 0018:ffff8883ce88fa88 EFLAGS: 00010002
[  604.079767] RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff811=
90eff
[  604.079781] RDX: 0000000000000001 RSI: 0000000000000008 RDI: af600177000=
016b5
[  604.079795] RBP: 0000000000000008 R08: 0000000000000001 R09: af600177000=
016bd
[  604.079809] R10: fffffbfff0723948 R11: 0000000000000001 R12: af600177000=
016b5
[  604.079823] R13: ffff88810005b000 R14: 1ffff11079d11f58 R15: ffff8881fff=
a0580
[  604.079837] FS:  0000000000000000(0000) GS:ffff8883ce880000(0000) knlGS:=
0000000000000000
[  604.079853] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  604.079866] CR2: 00007fd91d12000b CR3: 000000000782a001 CR4: 00000000001=
706e0
[  604.079880] Call Trace:
[  604.079888]  <IRQ>
[  604.079897]  dma_fence_signal_timestamp_locked+0x213/0x430
[  604.079915]  ? perf_trace_dma_fence+0x940/0x940
[  604.079929]  ? ktime_get+0x64/0x160
[  604.079941]  ? ktime_get+0x99/0x160
[  604.079955]  nouveau_fence_signal+0x11/0x210 [nouveau]
[  604.080091]  nouveau_fence_wait_uevent_handler+0x116/0x220 [nouveau]
[  604.080248]  ? __lock_release+0xec/0x4e0
[  604.080263]  nvif_notify+0x276/0x4f0 [nouveau]
[  604.080398]  ? nvif_notify_get+0x170/0x170 [nouveau]
[  604.080533]  ? nvkm_notify_send+0x195/0x510 [nouveau]
[  604.080671]  ? do_raw_spin_unlock+0x55/0x1f0
[  604.080684]  nvkm_notify_send+0x238/0x510 [nouveau]
[  604.080788]  ? do_raw_spin_unlock+0x55/0x1f0
[  604.080813]  nvkm_event_send+0x1e3/0x2d0 [nouveau]
[  604.080926]  ? validate_chain+0x124/0xd50
[  604.080939]  nvkm_fifo_uevent+0x60/0x70 [nouveau]
[  604.081080]  ? nvkm_fifo_cevent+0x20/0x20 [nouveau]
[  604.081228]  ? check_prev_add+0x20c0/0x20c0
[  604.081239]  ? mark_lock+0xc3/0xac0
[  604.081250]  gk104_fifo_intr+0x627/0x960 [nouveau]
[  604.081394]  nvkm_mc_intr+0x407/0x5e0 [nouveau]
[  604.081525]  ? __lock_acquire+0xad9/0x17b0
[  604.081539]  nvkm_pci_intr+0x12b/0x190 [nouveau]
[  604.081667]  ? nvkm_pci_init+0x1d0/0x1d0 [nouveau]
[  604.081793]  ? nvkm_pci_init+0x1d0/0x1d0 [nouveau]
[  604.081926]  __handle_irq_event_percpu+0x24a/0x640
[  604.081942]  handle_irq_event+0xef/0x230
[  604.081954]  ? handle_irq_event_percpu+0x100/0x100
[  604.081968]  handle_edge_irq+0x20d/0xb70
[  604.081982]  __common_interrupt+0x94/0x1e0
[  604.081996]  common_interrupt+0x9f/0xd0
[  604.082009]  </IRQ>
[  604.082017]  asm_common_interrupt+0x1e/0x40
[  604.082028] RIP: 0010:cpuidle_enter_state+0x1f8/0x8d0
[  604.082043] Code: 00 41 8b 77 04 bf ff ff ff ff e8 43 ef ff ff 31 ff e8 =
0c 15 fe fe 80 7c 24 08 00 0f 85 9e 01 00 00 e8 bc aa 22 ff fb 45 85 e4 <0f=
> 88 8c 02 00 00 49 63 ec 48 8d 44 6d 00 48 8d 44 85 00 48 8d 7c
[  604.082070] RSP: 0018:ffff8881009bfdc8 EFLAGS: 00000206
[  604.082083] RAX: 0000000000701531 RBX: ffffffff83a34520 RCX: 1ffffffff07=
8ba21
[  604.082097] RDX: 0000000000000000 RSI: ffffffff82e83020 RDI: ffffffff82f=
a1660
[  604.082110] RBP: 0000000000000003 R08: 0000000000000001 R09: ffffffff83c=
5f617
[  604.082123] R10: fffffbfff078bec2 R11: 0000000000000001 R12: 00000000000=
00003
[  604.082137] R13: ffff8883ce8c564c R14: 0000008ca56ecfa2 R15: ffff8883ce8=
c5648
[  604.082157]  ? cpuidle_enter_state+0x1f4/0x8d0
[  604.082172]  cpuidle_enter+0x4a/0xa0
[  604.082185]  cpuidle_idle_call+0x255/0x3c0
[  604.082198]  ? arch_cpu_idle_exit+0x40/0x40
[  604.082210]  ? tsc_verify_tsc_adjust+0x9c/0x2e0
[  604.082222]  ? lockdep_hardirqs_off+0x90/0xd0
[  604.082236]  do_idle+0xd7/0x140
[  604.082248]  cpu_startup_entry+0x19/0x20
[  604.082259]  start_secondary+0x250/0x2f0
[  604.082271]  ? set_cpu_sibling_map+0x1c20/0x1c20
[  604.082286]  secondary_startup_64_no_verify+0xb0/0xbb
[  604.082305] Modules linked in: overlay(E) sr_mod(E) cdrom(E) btrfs(E) bl=
ake2b_generic(E) xor(E) raid6_pq(E) xfs(E) libcrc32c(E) loop(E) af_packet(E=
) ip6table_mangle(E) ip6table_raw(E) iptable_raw(E) nfnetlink(E) bridge(E) =
ebtable_filter(E) stp(E) llc(E) ebtables(E) iscsi_ibft(E) iscsi_boot_sysfs(=
E) ip6table_filter(E) ip6_tables(E) rfkill(E) iptable_filter(E) ip_tables(E=
) x_tables(E) bpfilter(E) nls_iso8859_1(E) nls_cp437(E) usblp(E) joydev(E) =
intel_rapl_msr(E) intel_rapl_common(E) x86_pkg_temp_thermal(E) intel_powerc=
lamp(E) coretemp(E) kvm_intel(E) iTCO_wdt(E) intel_pmc_bxt(E) at24(E) mei_h=
dcp(E) regmap_i2c(E) iTCO_vendor_support(E) kvm(E) snd_hda_codec_realtek(E)=
 snd_hda_codec_hdmi(E) snd_hda_codec_generic(E) ledtrig_audio(E) irqbypass(=
E) crct10dif_pclmul(E) crc32_pclmul(E) ghash_clmulni_intel(E) snd_hda_intel=
(E) snd_intel_dspcfg(E) aesni_intel(E) crypto_simd(E) cryptd(E) snd_hda_cod=
ec(E) r8169(E) snd_hwdep(E) i2c_i801(E) snd_hda_core(E) i2c_smbus(E) pcspkr=
(E) realtek(E) snd_pcm(E)
[  604.082429]  mdio_devres(E) snd_timer(E) lpc_ich(E) snd(E) libphy(E) mei=
_me(E) mfd_core(E) mei(E) soundcore(E) fan(E) thermal(E) intel_smartconnect=
(E) sch_fq_codel(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lockd(E) grace(E) fus=
e(E) configfs(E) sunrpc(E) hid_logitech_hidpp(E) hid_logitech_dj(E) uas(E) =
usb_storage(E) hid_generic(E) usbhid(E) nouveau(E) drm_ttm_helper(E) ttm(E)=
 wmi(E) i2c_algo_bit(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sys=
imgblt(E) fb_sys_fops(E) cec(E) rc_core(E) ahci(E) libahci(E) xhci_pci(E) d=
rm(E) ehci_pci(E) libata(E) ehci_hcd(E) xhci_hcd(E) usbcore(E) video(E) but=
ton(E) sd_mod(E) t10_pi(E) vfat(E) fat(E) virtio_blk(E) virtio_mmio(E) virt=
io_ring(E) virtio(E) ext4(E) crc32c_intel(E) crc16(E) mbcache(E) jbd2(E) sg=
(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E=
) scsi_mod(E) msr(E) efivarfs(E) autofs4(E)
[  604.082768] Dumping ftrace buffer:
[  604.082781]    (ftrace buffer empty)

