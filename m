Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803386AFCE8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 03:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADB410E179;
	Wed,  8 Mar 2023 02:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A438A10E130;
 Wed,  8 Mar 2023 02:26:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D395E615F8;
 Wed,  8 Mar 2023 02:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60965C433D2;
 Wed,  8 Mar 2023 02:26:17 +0000 (UTC)
Date: Tue, 7 Mar 2023 21:26:15 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [BUG 6.3-rc1] Bad lock in ttm_bo_delayed_delete()
Message-ID: <20230307212615.7a099103@gandalf.local.home>
In-Reply-To: <20230307212223.7e49384a@gandalf.local.home>
References: <20230307212223.7e49384a@gandalf.local.home>
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

On Tue, 7 Mar 2023 21:22:23 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Looks like there was a lock possibly used after free. But as commit
> 9bff18d13473a9fdf81d5158248472a9d8ecf2bd ("drm/ttm: use per BO cleanup
> workers") changed a lot of this code, I figured it may be the culprit.

If I bothered to look at the second warning after this one (I usually stop
after the first), it appears to state there was a use after free issue.

[  206.692285] ------------[ cut here ]------------
[  206.706333] refcount_t: underflow; use-after-free.
[  206.720577] WARNING: CPU: 0 PID: 332 at lib/refcount.c:28 refcount_warn_saturate+0xb6/0xfc
[  206.735810] Modules linked in:
[  206.749493] CPU: 0 PID: 332 Comm: kworker/0:13H Tainted: G        W          6.3.0-rc1-test-00001-ga98bd42762ed-dirty #965
[  206.765833] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
[  206.781767] Workqueue: ttm ttm_bo_delayed_delete
[  206.796500] EIP: refcount_warn_saturate+0xb6/0xfc
[  206.811121] Code: 68 50 1c 0d cf e8 66 b3 a9 ff 0f 0b 58 c9 c3 90 80 3d 57 c6 38 cf 00 75 8a c6 05 57 c6 38 cf 01 68 7c 1c 0d cf e8 46 b3 a9 ff <0f> 0b 59 c9 c3 80 3d 55 c6 38 cf 00 0f 85 67 ff ff ff c6 05 55 c6
[  206.844560] EAX: 00000026 EBX: c2d5f150 ECX: c3ae5e40 EDX: 00000002
[  206.862109] ESI: c2d5f0bc EDI: f6f91200 EBP: c3ae5f18 ESP: c3ae5f14
[  206.878773] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[  206.895665] CR0: 80050033 CR2: ff9ff000 CR3: 0f512000 CR4: 00150ef0
[  206.912303] Call Trace:
[  206.927940]  ttm_bo_delayed_delete+0x8c/0x94
[  206.944179]  process_one_work+0x21a/0x538
[  206.960605]  worker_thread+0x146/0x398
[  206.976839]  kthread+0xea/0x10c
[  206.992696]  ? process_one_work+0x538/0x538
[  207.008827]  ? kthread_complete_and_exit+0x1c/0x1c
[  207.025150]  ret_from_fork+0x1c/0x28
[  207.041307] irq event stamp: 4219
[  207.056883] hardirqs last  enabled at (4219): [<ced2a039>] _raw_spin_unlock_irqrestore+0x2d/0x58
[  207.074298] hardirqs last disabled at (4218): [<ce1d3a65>] kvfree_call_rcu+0x155/0x2ec
[  207.091461] softirqs last  enabled at (3570): [<ced2b113>] __do_softirq+0x2f3/0x48b
[  207.107979] softirqs last disabled at (3565): [<ce0c84e9>] call_on_stack+0x45/0x4c
[  207.123827] ---[ end trace 0000000000000000 ]---


-- Steve
