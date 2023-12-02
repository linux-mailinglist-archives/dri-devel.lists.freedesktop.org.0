Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B28023B3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 13:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246410E2CC;
	Sun,  3 Dec 2023 12:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1986 seconds by postgrey-1.36 at gabe;
 Sat, 02 Dec 2023 22:47:12 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4C10E22C;
 Sat,  2 Dec 2023 22:47:12 +0000 (UTC)
Received: from c-76-132-34-178.hsd1.ca.comcast.net ([76.132.34.178]:33994
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
 id 1r9YFO-0001jB-VK by authid <merlins.org> with srv_auth_plain;
 Sat, 02 Dec 2023 14:14:02 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1r9YFO-0003Wt-Q3; Sat, 02 Dec 2023 14:14:02 -0800
Date: Sat, 2 Dec 2023 14:14:02 -0800
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>,
 Timur Tabi <ttabi@nvidia.com>
Subject: Re: [Nouveau] Thinkpad P17 gen 2 kernel 6.4 and 6.6 lack of support
 for nvidia GA104GLM [RTX A5000 Mobile] and missing module firmware
Message-ID: <20231202221402.GA11155@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231202214503.GA153303@merlins.org>
 <ee2168cb672d8210854535dc9d80c854880ea4fb.camel@nvidia.com>
 <20231202171326.GB24486@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 76.132.34.178
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
X-Mailman-Approved-At: Sun, 03 Dec 2023 12:21:37 +0000
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 02, 2023 at 06:08:01PM +0000, Timur Tabi wrote:
> On Sat, 2023-12-02 at 09:13 -0800, Marc MERLIN wrote:
> > [    3.184525] nouveau: unknown parameter 'modset' ignored
> 
> For starters, you misspelled "modeset"

That was a previous boot in dmesg where I failed to turn off the module,
but I was mostly interested in showing the errors of all the firmware
missing and nouveau failing to start, which those logs do show.

Separely, both 6.4 and 6.6 are hanging after a few hours of runtime with
networking dying or other issues that require reboot

See below

6.4:
> [55647.774842] vgaarb: client 0x00000000c24cb19e called 'target'
> [55647.774852] vgaarb: PCI:0000:00:02.0 ==> 0000:00:02.0 pdev 00000000bfa35d85
> [55647.774854] vgaarb: vgadev 000000008ea0fc7d
> [55825.318992] INFO: task NetworkManager:3372 blocked for more than 120 seconds.
> [55825.318999]       Tainted: G     U     OE      6.4.9-amd64-preempt-sysrq-20220227 #2
> [55825.319000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [55825.319002] task:NetworkManager  state:D stack:0     pid:3372  ppid:1      flags:0x00000002
> [55825.319005] Call Trace:
> [55825.319006]  <TASK>
> [55825.319009]  __schedule+0xba5/0xc17
> [55825.319015]  schedule+0x95/0xce
> [55825.319017]  schedule_preempt_disabled+0x15/0x22
> [55825.319020]  __mutex_lock.constprop.0+0x18b/0x291
> [55825.319025]  nl80211_prepare_wdev_dump+0x8b/0x19f [cfg80211 d0c23c84d531afea8d4a2711c5c3e691cbb9587f]
> [55825.319065]  nl80211_dump_station+0x49/0x1d0 [cfg80211 d0c23c84d531afea8d4a2711c5c3e691cbb9587f]
> [55825.319091]  ? __mod_lruvec_page_state+0x4c/0x86
> [55825.319093]  ? mod_lruvec_page_state.constprop.0+0x1c/0x2e
> [55825.319096]  ? __kmalloc_large_node+0xd5/0xfb
> [55825.319099]  ? __kmalloc_node_track_caller+0x5a/0xad
> [55825.319101]  ? kmalloc_reserve+0xa7/0xe2
> [55825.319104]  ? __alloc_skb+0xe9/0x148
> [55825.319106]  netlink_dump+0x143/0x2b2
> [55825.319109]  __netlink_dump_start+0x125/0x177
> [55825.319111]  genl_family_rcv_msg_dumpit+0xf1/0x110
> [55825.319114]  ? poll_freewait+0x72/0x91
> [55825.319117]  ? __pfx_genl_start+0x40/0x40
> [55825.319119]  ? __pfx_nl80211_dump_station+0x40/0x40 [cfg80211 d0c23c84d531afea8d4a2711c5c3e691cbb9587f]
> [55825.319143]  ? __pfx_genl_parallel_done+0x40/0x40
> [55825.319146]  genl_rcv_msg+0x189/0x1e2
> [55825.319148]  ? __pfx_nl80211_dump_station+0x40/0x40 [cfg80211 d0c23c84d531afea8d4a2711c5c3e691cbb9587f]
> [55825.319172]  ? __pfx_genl_rcv_msg+0x40/0x40
> [55825.319173]  netlink_rcv_skb+0x89/0xe3
> [55825.319176]  genl_rcv+0x24/0x31
> [55825.319178]  netlink_unicast+0x10e/0x1ae
> [55825.319180]  netlink_sendmsg+0x321/0x361
> [55825.319182]  sock_sendmsg_nosec+0x35/0x64
> [55825.319186]  ____sys_sendmsg+0x13e/0x1ef
> [55825.319188]  ___sys_sendmsg+0x76/0xb3
> [55825.319190]  ? __fget_light+0x41/0x50
> [55825.319193]  ? do_epoll_wait+0x49b/0x4d4
> [55825.319196]  ? __pfx_pollwake+0x40/0x40
> [55825.319198]  ? __rseq_handle_notify_resume+0x2a0/0x4bd
> [55825.319200]  ? __fget+0x38/0x47
> [55825.319202]  __sys_sendmsg+0x60/0x97
> [55825.319204]  do_syscall_64+0x7e/0xa7
> [55825.319208]  ? syscall_exit_to_user_mode+0x18/0x27
> [55825.319210]  ? __task_pid_nr_ns+0x5f/0x6d
> [55825.319213]  ? syscall_exit_to_user_mode+0x18/0x27
> [55825.319214]  ? do_syscall_64+0x9d/0xa7
> [55825.319216]  ? do_syscall_64+0x9d/0xa7
> [55825.319218]  ? do_syscall_64+0x9d/0xa7
> [55825.319220]  ? do_syscall_64+0x9d/0xa7
> [55825.319222]  entry_SYSCALL_64_after_hwframe+0x77/0xe1
> [55825.319224] RIP: 0033:0x7f1fdc79e9bd
> [55825.319226] RSP: 002b:00007ffeb6460900 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
> [55825.319228] RAX: ffffffffffffffda RBX: 000055e0a9ce1d90 RCX: 00007f1fdc79e9bd
> [55825.319229] RDX: 0000000000000000 RSI: 00007ffeb6460950 RDI: 000000000000000b
> [55825.319230] RBP: 00007ffeb6460950 R08: 0000000000000000 R09: 0000000000000300
> [55825.319231] R10: 0000000000000000 R11: 0000000000000293 R12: 00007ffeb6460a30
> [55825.319232] R13: 00007f1fd0038690 R14: 00007ffeb6460c60 R15: 000055e0aa210400
> [55825.319234]  </TASK>

6.6.3:
[  443.613095] BTRFS info (device dm-2): scrub: started on devid 1
[  484.778344] INFO: task kworker/2:1:106 blocked for more than 120 seconds.
[  484.778352]       Tainted: G     U             6.6.3-amd64-preempt-sysrq-20220227 #4
[  484.778353] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  484.778354] task:kworker/2:1     state:D stack:0     pid:106   ppid:2      flags:0x00004000
[  484.778358] Workqueue: ipv6_addrconf addrconf_verify_work
[  484.778365] Call Trace:
[  484.778367]  <TASK>
[  484.778369]  __schedule+0xba0/0xc05
[  484.778373]  schedule+0x95/0xce
[  484.778375]  schedule_preempt_disabled+0x15/0x22
[  484.778376]  __mutex_lock.constprop.0+0x18b/0x291
[  484.778379]  addrconf_verify_work+0xe/0x20
[  484.778381]  process_scheduled_works+0x1da/0x2e0
[  484.778385]  worker_thread+0x1ca/0x224
[  484.778388]  ? __pfx_worker_thread+0x40/0x40
[  484.778390]  kthread+0xe9/0xf4
[  484.778393]  ? __pfx_kthread+0x40/0x40
[  484.778395]  ret_from_fork+0x21/0x38
[  484.778397]  ? __pfx_kthread+0x40/0x40
[  484.778399]  ret_from_fork_asm+0x1b/0x80
[  484.778403]  </TASK>
[  484.778409] INFO: task kworker/4:2:388 blocked for more than 120 seconds.
[  484.778410]       Tainted: G     U             6.6.3-amd64-preempt-sysrq-20220227 #4
[  484.778411] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  484.778412] task:kworker/4:2     state:D stack:0     pid:388   ppid:2      flags:0x00004000
[  484.778415] Workqueue: ipv6_addrconf addrconf_verify_work
[  484.778417] Call Trace:
[  484.778418]  <TASK>
[  484.778420]  __schedule+0xba0/0xc05
[  484.778422]  schedule+0x95/0xce
[  484.778423]  schedule_preempt_disabled+0x15/0x22
[  484.778425]  __mutex_lock.constprop.0+0x18b/0x291
[  484.778427]  addrconf_verify_work+0xe/0x20
[  484.778429]  process_scheduled_works+0x1da/0x2e0
[  484.778431]  worker_thread+0x1ca/0x224
[  484.778433]  ? __pfx_worker_thread+0x40/0x40
[  484.778436]  kthread+0xe9/0xf4
[  484.778437]  ? __pfx_kthread+0x40/0x40
[  484.778439]  ret_from_fork+0x21/0x38
[  484.778440]  ? __pfx_kthread+0x40/0x40
[  484.778442]  ret_from_fork_asm+0x1b/0x80
[  484.778444]  </TASK>
[  484.778468] INFO: task NetworkManager:3372 blocked for more than 120 seconds.
[  484.778469]       Tainted: G     U             6.6.3-amd64-preempt-sysrq-20220227 #4
[  484.778470] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  484.778471] task:NetworkManager  state:D stack:0     pid:3372  ppid:1      flags:0x00000002
[  484.778473] Call Trace:
[  484.778474]  <TASK>
[  484.778475]  __schedule+0xba0/0xc05
[  484.778477]  schedule+0x95/0xce
[  484.778478]  schedule_preempt_disabled+0x15/0x22
[  484.778480]  __mutex_lock.constprop.0+0x18b/0x291
[  484.778483]  nl80211_prepare_wdev_dump+0x8b/0x19f [cfg80211 443448ea372df5c5c09782a3fb412c115f1aa45a]
[  484.778526]  nl80211_dump_station+0x49/0x1d0 [cfg80211 443448ea372df5c5c09782a3fb412c115f1aa45a]
[  484.778555]  ? __alloc_pages+0x131/0x1e8
[  484.778558]  ? __mod_lruvec_page_state+0x4c/0x86
[  484.778561]  ? mod_lruvec_page_state.constprop.0+0x1c/0x2e
[  484.778564]  ? __kmalloc_large_node+0xd5/0xfb
[  484.778566]  ? __alloc_skb+0xad/0x148
[  484.778569]  ? __kmalloc_node_track_caller+0x5b/0xb2
[  484.778571]  ? kmalloc_reserve+0xab/0xe6
[  484.778573]  genl_dumpit+0x32/0x4d
[  484.778576]  netlink_dump+0x143/0x2b2
[  484.778579]  __netlink_dump_start+0x145/0x197
[  484.778583]  genl_family_rcv_msg_dumpit+0xa3/0xd1
[  484.778585]  ? __pfx_genl_start+0x40/0x40
[  484.778586]  ? __pfx_genl_dumpit+0x40/0x40
[  484.778588]  ? __pfx_genl_done+0x40/0x40
[  484.778589]  genl_rcv_msg+0x1a0/0x1f2
[  484.778591]  ? __pfx_nl80211_dump_station+0x40/0x40 [cfg80211 443448ea372df5c5c09782a3fb412c115f1aa45a]
[  484.778619]  ? __pfx_genl_rcv_msg+0x40/0x40
[  484.778620]  netlink_rcv_skb+0x89/0xe3
[  484.778623]  genl_rcv+0x24/0x31
[  484.778625]  netlink_unicast+0x114/0x1b4
[  484.778627]  netlink_sendmsg+0x321/0x361
[  484.778630]  sock_sendmsg_nosec+0x46/0x70
[  484.778633]  ____sys_sendmsg+0x144/0x1f5
[  484.778635]  ___sys_sendmsg+0x76/0xb3
[  484.778637]  ? __fget+0x38/0x47
[  484.778640]  ? __fget_light+0x41/0x50
[  484.778642]  ? do_epoll_wait+0x49e/0x4d7
[  484.778645]  ? __pfx_pollwake+0x40/0x40
[  484.778647]  ? __fget+0x38/0x47
[  484.778649]  __sys_sendmsg+0x60/0x97
[  484.778652]  do_syscall_64+0x7e/0xa7
[  484.778655]  ? do_syscall_64+0x9d/0xa7
[  484.778656]  ? do_syscall_64+0x9d/0xa7
[  484.778657]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[  484.778661] RIP: 0033:0x7fad667fe9bd
[  484.778663] RSP: 002b:00007ffd9d5a4f00 EFLAGS: 00000293 ORIG_RAX: 000000000000002e
[  484.778665] RAX: ffffffffffffffda RBX: 000055d7ea4dad90 RCX: 00007fad667fe9bd
[  484.778666] RDX: 0000000000000000 RSI: 00007ffd9d5a4f50 RDI: 000000000000000b
[  484.778667] RBP: 00007ffd9d5a4f50 R08: 0000000000000000 R09: 0000000000000300
[  484.778669] R10: 0000000000000000 R11: 0000000000000293 R12: 00007ffd9d5a5030
[  484.778670] R13: 000055d7ea9f9050 R14: 00007ffd9d5a5260 R15: 000055d7eaa03050
[  484.778671]  </TASK>


-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
