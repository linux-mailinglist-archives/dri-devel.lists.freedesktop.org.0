Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AED6AFCDC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 03:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA5110E041;
	Wed,  8 Mar 2023 02:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E4610E041;
 Wed,  8 Mar 2023 02:22:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5B37B81B7E;
 Wed,  8 Mar 2023 02:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEE6C433EF;
 Wed,  8 Mar 2023 02:22:25 +0000 (UTC)
Date: Tue, 7 Mar 2023 21:22:23 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Message-ID: <20230307212223.7e49384a@gandalf.local.home>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


In a report for a regression in my code, I tried to run v6.3-rc1 through my
tests. It crashed at boot up on my first test (my start up tests do take a
long time, hence the 206 seconds of boot!).

[  206.238782] ------------[ cut here ]------------
[  206.277786] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
[  206.277946] WARNING: CPU: 0 PID: 332 at kernel/locking/mutex.c:582 __ww_mutex_lock.constprop.0+0x566/0xfec
[  206.313338] Modules linked in:
[  206.324732] CPU: 0 PID: 332 Comm: kworker/0:13H Not tainted 6.3.0-rc1-test-00001-ga98bd42762ed-dirty #965
[  206.338273] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[  206.353596] Workqueue: ttm ttm_bo_delayed_delete
[  206.370520] EIP: __ww_mutex_lock.constprop.0+0x566/0xfec
[  206.382855] Code: e8 ab 59 95 ff 85 c0 0f 84 25 fb ff ff 8b 0d 58 c0 3b cf 85 c9 0f 85 17 fb ff ff 68 e0 8d 07 cf 68 2b ac 05 cf e8 e6 e6 3f ff <0f> 0b 58 5a e9 ff fa ff ff e8 78 59 95 ff 85 c0 74 0e 8b 0d 58 c0
[  206.411247] EAX: 00000028 EBX: 00000000 ECX: c3ae5dd8 EDX: 00000002
[  206.425193] ESI: 00000000 EDI: c2d5f0bc EBP: c3ae5f00 ESP: c3ae5eac
[  206.439236] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[  206.453597] CR0: 80050033 CR2: ff9ff000 CR3: 0f512000 CR4: 00150ef0
[  206.467841] Call Trace:
[  206.481059]  ? ttm_bo_delayed_delete+0x30/0x94
[  206.494980]  ww_mutex_lock+0x32/0x94
[  206.508699]  ttm_bo_delayed_delete+0x30/0x94
[  206.522371]  process_one_work+0x21a/0x538
[  206.536306]  worker_thread+0x146/0x398
[  206.549860]  kthread+0xea/0x10c
[  206.563141]  ? process_one_work+0x538/0x538
[  206.576835]  ? kthread_complete_and_exit+0x1c/0x1c
[  206.590652]  ret_from_fork+0x1c/0x28
[  206.604522] irq event stamp: 4219
[  206.617852] hardirqs last  enabled at (4219): [<ced2a039>] _raw_spin_unlock_irqrestore+0x2d/0x58
[  206.633077] hardirqs last disabled at (4218): [<ce1d3a65>] kvfree_call_rcu+0x155/0x2ec
[  206.648161] softirqs last  enabled at (3570): [<ced2b113>] __do_softirq+0x2f3/0x48b
[  206.663025] softirqs last disabled at (3565): [<ce0c84e9>] call_on_stack+0x45/0x4c
[  206.678065] ---[ end trace 0000000000000000 ]---

Looks like there was a lock possibly used after free. But as commit
9bff18d13473a9fdf81d5158248472a9d8ecf2bd ("drm/ttm: use per BO cleanup
workers") changed a lot of this code, I figured it may be the culprit.

-- Steve
