Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAABC6E103C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 16:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AA910E233;
	Thu, 13 Apr 2023 14:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D0F10E17C;
 Thu, 13 Apr 2023 14:43:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FED661527;
 Thu, 13 Apr 2023 14:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C7CC433D2;
 Thu, 13 Apr 2023 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681397038;
 bh=AjYMdKM0hDHqTLI9N4QN9XTQwY63MI6AowdWFYWZDpY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=NIw322gwUkbyFgo8Gw3qWZMwUCesB2sEM5PNyElM1qFYdILWfzTZH1dWuZBydHWEE
 BbjNtJozTeIP/HbD1p9xXxkAJkKBiPOlZ+dVDK9K9a2o7Dzbk41XhmMv9RWzq9HMrn
 HqmvYb50jE6PHEM8vveylyuP2MEGjbqwQcRFLwZRjGhcjBO8w7hR3padOck6X5oTzi
 T8GuayEigD/kq8Fh11D78DzlZFdjTTCKJKFeryxkUuc6oEtvr2AXxcv/lGmvpYewg8
 eYuu1B2AlVZgWrW6UEdAVW6yDumwDa1yQ2gOzJWa7kiSHcPaW3HNqxQn0nNhYenZPr
 01HuJBruh0wAA==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 0C11C15404B3; Thu, 13 Apr 2023 07:43:58 -0700 (PDT)
Date: Thu, 13 Apr 2023 07:43:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Rui Salvaterra <rsalvaterra@gmail.com>
Subject: Re: [BUG?] INFO: rcu_sched detected expedited stalls on CPUs/tasks:
 { 0-.... } 3 jiffies s: 309 root: 0x1/.
Message-ID: <2495408f-a644-4e56-aaca-e6915cbda179@paulmck-laptop>
References: <CALjTZvZ=Y1psyd0nmfzm6GhqMKvq5V_NQCWb_X02nasp1CpfcQ@mail.gmail.com>
 <87r0spcuvi.fsf@intel.com>
 <CALjTZvao=N7wxyj_DpqzWUhdJwEsWSKUo3ddi-3ubgMp8BXi_Q@mail.gmail.com>
 <CALjTZvaf1cwcZc9O8g24SnZXsoQaWB97UVQW=g6M0coaudLr6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALjTZvaf1cwcZc9O8g24SnZXsoQaWB97UVQW=g6M0coaudLr6w@mail.gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 08:30:02AM +0100, Rui Salvaterra wrote:
> Hi again, everyone.
> 
> So, while preparing to file the bug report with the requested
> information, I got a trace completely unrelated to DRM (on a swapon
> call, it seems).
> 
> [    4.868340] rcu: INFO: rcu_sched detected expedited stalls on
> CPUs/tasks: { 4-.... } 3 jiffies s: 265 root: 0x10/.
> [    4.868349] rcu: blocking rcu_node structures (internal RCU debug):
> [    4.868351] Sending NMI from CPU 3 to CPUs 4:
> [    4.868355] NMI backtrace for cpu 4
> [    4.868357] CPU: 4 PID: 462 Comm: swapon Not tainted 6.3.0-rc6-debug+ #57
> [    4.868359] Hardware name: Apple Inc.
> Macmini6,2/Mac-F65AE981FFA204ED, BIOS 429.0.0.0.0 03/18/2022
> [    4.868360] RIP: 0010:zram_submit_bio+0x57c/0x940
> [    4.868365] Code: 04 4c 01 f0 48 8d 48 08 f0 48 0f ba 68 08 0d 0f
> 82 80 00 00 00 4c 89 ef e8 01 eb ff ff 49 8b 45 00 4a 8d 44 30 09 f0
> 80 20 df <f0> 48 ff 45 00 48 81 eb 00 10 00 00 41 83 c4 01 48 81 fb ff
> 0f 00
> [    4.868366] RSP: 0018:ffff8881057dbcd8 EFLAGS: 00000246
> [    4.868368] RAX: ffffc90001c186d9 RBX: 000000003e893000 RCX: ffffc90001c186d8
> [    4.868369] RDX: ffffc90001c186d0 RSI: 0000000000000000 RDI: ffff88810083b400
> [    4.868369] RBP: ffff88810083b470 R08: 0000000000027e40 R09: 0000000000025850
> [    4.868370] R10: 000000000014b212 R11: ffff88810ba03180 R12: 00000000000c176d
> [    4.868371] R13: ffff88810083b400 R14: 0000000000c176d0 R15: 0000000000000000
> [    4.868372] FS:  00007fbd8f8ce800(0000) GS:ffff888266100000(0000)
> knlGS:0000000000000000
> [    4.868373] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.868374] CR2: 0000563005371000 CR3: 000000010355c003 CR4: 00000000001706e0
> [    4.868375] Call Trace:
> [    4.868377]  <TASK>
> [    4.868378]  ? block_read_full_folio+0x23e/0x2e0
> [    4.868383]  ? kmem_cache_alloc+0x1b/0x110
> [    4.868385]  ? mempool_alloc+0x37/0x140
> [    4.868388]  ? pcpu_block_update_hint_alloc+0xce/0x2f0
> [    4.868390]  __submit_bio+0x41/0xd0
> [    4.868394]  submit_bio_noacct_nocheck+0xc4/0x2b0
> [    4.868396]  blk_next_bio+0x55/0x70
> [    4.868398]  __blkdev_issue_discard+0xc8/0x180
> [    4.868401]  blkdev_issue_discard+0x3c/0x80
> [    4.868403]  __x64_sys_swapon+0xb71/0x1120
> [    4.868407]  do_syscall_64+0x2b/0x50
> [    4.868410]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [    4.868414] RIP: 0033:0x7fbd8f712d5b
> [    4.868416] Code: 73 01 c3 48 8b 0d bd 30 0e 00 f7 d8 64 89 01 48
> 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 a7 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 8d 30 0e 00 f7 d8 64 89
> 01 48
> [    4.868417] RSP: 002b:00007ffcaf9a3448 EFLAGS: 00000246 ORIG_RAX:
> 00000000000000a7
> [    4.868418] RAX: ffffffffffffffda RBX: 0000000000018064 RCX: 00007fbd8f712d5b
> [    4.868419] RDX: 0000000000018064 RSI: 0000000000018064 RDI: 000056300535fb10
> [    4.868420] RBP: 00007ffcaf9a3530 R08: 000000014b213000 R09: 00007fbd8f7f70f0
> [    4.868420] R10: 0000000000001000 R11: 0000000000000246 R12: 000056300535fb10
> [    4.868421] R13: 0000000000000064 R14: 00007ffcaf9a3530 R15: 0000000000000000
> [    4.868423]  </TASK>
> 
> Could it be that RCU is reporting expedited stalls too eagerly? And,
> if so, why only on this machine?

My guess would be that you have CONFIG_RCU_EXP_CPU_STALL_TIMEOUT set to
some small non-zero number, for example, you might have set up a recent
Android .config or some such.  The default of zero would give you about
21 seconds rather than the three jiffies that you are seeing.

Could you please check your .config?

							Thanx, Paul
