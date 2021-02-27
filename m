Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC6326E2F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 18:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC1F6E0E7;
	Sat, 27 Feb 2021 17:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547D36E0E7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 17:10:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DCB3464E85
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614445220;
 bh=0nmgi8Yh6Ggu0qusOQH2nrdKypZwtP/B5Mf7cjLYK5Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nS0/DuE/GBXyMeur7dLRHx6Bvi3SL6RzWvD98kmdIhE6uVwPrmnUnn3Vgfo7wdfdm
 9h/dFVOERyuXfPzSglx7yhSaRePNggUtlLCpfkrAVzrgLX7SgBEfd2xGR6db3hvclV
 nutP3yKiSUh1LuorgWISjedIndoONUmhdkBO2x0MGdNOovLj3Z71l/IwxxnXeVOWMS
 nM4hecd1K5KOgbQ+2wigz8oB8nNU5cqfjKGAdqaCsqznIcYTP8Q/uXuWRrCm41Hm1l
 QTLzYid/NLJsVxLf93wOv9wh9mfm+JlnJc+j1pBzRaZ/6IWQu8wHshXb4osuBJBi1M
 SvnBMd+9v/o2g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CBD0E652F4; Sat, 27 Feb 2021 17:00:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Sat, 27 Feb 2021 17:00:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version bug_severity
Message-ID: <bug-211425-2300-j6Lyut4oF8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.10.17 and 5.11.0          |5.11.2
           Severity|normal                      |blocking

--- Comment #11 from Andreas (icedragon.aw@web.de) ---
Until 5.10.19 the issue is still persistent, but the screen recovers after a
while. Bisection result can found in comment 9.

!!!ATTENTION!!!
BUT with kernel 5.11.0 to 5.11.2 the screen freezes after showing the content.
In addition the keyboard seems also to be affected (only Magic SysRq keys
working - but no screens witching). After reboot I could observer the old
kernel messages from the crash:

Feb 27 17:46:35 localhost kernel: [  281.048286]
[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:67:crtc-0] flip_done
timed out
Feb 27 17:46:35 localhost kernel: [  281.560277] [drm:amdgpu_dm_atomic_check]
*ERROR* [CRTC:67:crtc-0] hw_done or flip_done timed out
Feb 27 17:46:45 localhost kernel: [  291.800273]
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:67:crtc-0]
flip_done timed out
Feb 27 17:46:56 localhost kernel: [  302.040411]
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:55:plane-3]
flip_done timed out
Feb 27 17:46:56 localhost kernel: [  302.124826] ------------[ cut here
]------------
Feb 27 17:46:56 localhost kernel: [  302.124832] WARNING: CPU: 7 PID: 588 at
amdgpu_dm_atomic_commit_tail+0x256a/0x25f0
Feb 27 17:46:56 localhost kernel: [  302.124843] Modules linked in:
snd_seq_dummy snd_hrtimer vmw_vsock_vmci_transport vsock vmw_vmci si2157 si2168
m88rs6000t a8293 cx25840 binfmt_misc nls_iso8859_1 wmi_bmof snd_hda_codec_hdmi
snd_hda_intel snd_intel_dspcfg cx23885 snd_hda_codec tveeprom amd64_edac_mod
snd_hwdep edac_mce_amd altera_ci snd_hda_core cx2341x tda18271 kvm_amd
snd_seq_midi snd_pcm snd_seq_midi_event kvm altera_stapl snd_rawmidi rc_core
videobuf2_dvb crct10dif_pclmul joydev videobuf2_dma_sg ghash_clmulni_intel
m88ds3103 snd_seq i2c_mux dvb_core snd_seq_device rapl videobuf2_vmalloc
videobuf2_memops snd_timer videobuf2_v4l2 videobuf2_common k10temp snd videodev
efi_pstore mc soundcore ccp wmi video nf_log_ipv6 xt_hl ip6_tables ip6t_rt
nf_log_ipv4 nf_log_common xt_LOG nft_limit xt_limit xt_addrtype xt_tcpudp
xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nft_counter
sch_fq_codel nct6775 hwmon_vid nf_tables lm92 nfnetlink lm83 ip_tables x_tables
autofs4 raid10 raid1 raid0 multipath linear
Feb 27 17:46:56 localhost kernel: [  302.124937]  hid_generic usbhid hid r8169
crc32_pclmul i2c_piix4 xhci_pci realtek e1000e ahci xhci_pci_renesas libahci
gpio_amdpt gpio_generic
Feb 27 17:46:56 localhost kernel: [  302.124954] CPU: 7 PID: 588 Comm:
kworker/7:2 Not tainted 5.11.2-aw #1
Feb 27 17:46:56 localhost kernel: [  302.124959] Hardware name: To Be Filled By
O.E.M. To Be Filled By O.E.M./B550M Pro4, BIOS P1.70 12/01/2020
Feb 27 17:46:56 localhost kernel: [  302.124962] Workqueue: events
dm_irq_work_func
Feb 27 17:46:56 localhost kernel: [  302.124968] RIP:
0010:amdgpu_dm_atomic_commit_tail+0x256a/0x25f0
Feb 27 17:46:56 localhost kernel: [  302.124973] Code: a0 fd ff ff 01 c7 85 9c
fd ff ff 37 00 00 00 c7 85 a4 fd ff ff 20 00 00 00 e8 f2 4a 13 00 e9 da fa ff
ff 0f 0b e9 2a f9 ff ff <0f> 0b e9 79 f9 ff ff 0f 0b 0f 0b e9 8f f9 ff ff 49 8b
06 41 0f b6
Feb 27 17:46:56 localhost kernel: [  302.124976] RSP: 0018:ffff9d9e00b8ba48
EFLAGS: 00010002
Feb 27 17:46:56 localhost kernel: [  302.124980] RAX: 0000000000000002 RBX:
0000000000000005 RCX: ffff92630167e118
Feb 27 17:46:56 localhost kernel: [  302.124982] RDX: 0000000000000001 RSI:
0000000000000297 RDI: ffff926304e80188
Feb 27 17:46:56 localhost kernel: [  302.124985] RBP: ffff9d9e00b8bd48 R08:
0000000000000005 R09: 0000000000000000
Feb 27 17:46:56 localhost kernel: [  302.124987] R10: ffff9d9e00b8b998 R11:
ffff9d9e00b8b99c R12: 0000000000000287
Feb 27 17:46:56 localhost kernel: [  302.124989] R13: ffff92631f003000 R14:
ffff92630167e000 R15: ffff92630f5eb400
Feb 27 17:46:56 localhost kernel: [  302.124992] FS:  0000000000000000(0000)
GS:ffff9271af3c0000(0000) knlGS:0000000000000000
Feb 27 17:46:56 localhost kernel: [  302.124995] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Feb 27 17:46:56 localhost kernel: [  302.124997] CR2: 00007f02dc01f018 CR3:
0000000f9ee10000 CR4: 0000000000350ee0
Feb 27 17:46:56 localhost kernel: [  302.125000] Call Trace:
Feb 27 17:46:56 localhost kernel: [  302.125007]  ? irq_work_queue+0x3a/0x50
Feb 27 17:46:56 localhost kernel: [  302.125013]  ? vprintk_emit+0x12a/0x240
Feb 27 17:46:56 localhost kernel: [  302.125015]  commit_tail+0x99/0x130
Feb 27 17:46:56 localhost kernel: [  302.125015] 
drm_atomic_helper_commit+0x123/0x150
Feb 27 17:46:56 localhost kernel: [  302.125015]  drm_atomic_commit+0x4a/0x50
Feb 27 17:46:56 localhost kernel: [  302.125015] 
dm_restore_drm_connector_state+0xf3/0x170
Feb 27 17:46:56 localhost kernel: [  302.125015]  handle_hpd_irq+0x11a/0x150
Feb 27 17:46:56 localhost kernel: [  302.125015]  dm_irq_work_func+0x4e/0x60
Feb 27 17:46:56 localhost kernel: [  302.125015]  process_one_work+0x217/0x3e0
Feb 27 17:46:56 localhost kernel: [  302.125015]  worker_thread+0x50/0x3f0
Feb 27 17:46:56 localhost kernel: [  302.125015]  ? rescuer_thread+0x390/0x390
Feb 27 17:46:56 localhost kernel: [  302.125015]  kthread+0x145/0x170
Feb 27 17:46:56 localhost kernel: [  302.125015]  ?
__kthread_bind_mask+0x70/0x70
Feb 27 17:46:56 localhost kernel: [  302.125015]  ret_from_fork+0x22/0x30
Feb 27 17:46:56 localhost kernel: [  302.125015] ---[ end trace
9496598019bd6508 ]---
Feb 27 17:46:56 localhost kernel: [  302.125015] ------------[ cut here
]------------
Feb 27 17:46:56 localhost kernel: [  302.125015] WARNING: CPU: 7 PID: 588 at
amdgpu_dm_atomic_commit_tail+0x2573/0x25f0
Feb 27 17:46:56 localhost kernel: [  302.125015] Modules linked in:
snd_seq_dummy snd_hrtimer vmw_vsock_vmci_transport vsock vmw_vmci si2157 si2168
m88rs6000t a8293 cx25840 binfmt_misc nls_iso8859_1 wmi_bmof snd_hda_codec_hdmi
snd_hda_intel snd_intel_dspcfg cx23885 snd_hda_codec tveeprom amd64_edac_mod
snd_hwdep edac_mce_amd altera_ci snd_hda_core cx2341x tda18271 kvm_amd
snd_seq_midi snd_pcm snd_seq_midi_event kvm altera_stapl snd_rawmidi rc_core
videobuf2_dvb crct10dif_pclmul joydev videobuf2_dma_sg ghash_clmulni_intel
m88ds3103 snd_seq i2c_mux dvb_core snd_seq_device rapl videobuf2_vmalloc
videobuf2_memops snd_timer videobuf2_v4l2 videobuf2_common k10temp snd videodev
efi_pstore mc soundcore ccp wmi video nf_log_ipv6 xt_hl ip6_tables ip6t_rt
nf_log_ipv4 nf_log_common xt_LOG nft_limit xt_limit xt_addrtype xt_tcpudp
xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_compat nft_counter
sch_fq_codel nct6775 hwmon_vid nf_tables lm92 nfnetlink lm83 ip_tables x_tables
autofs4 raid10 raid1 raid0 multipath linear
Feb 27 17:46:56 localhost kernel: [  302.125015]  hid_generic usbhid hid r8169
crc32_pclmul i2c_piix4 xhci_pci realtek e1000e ahci xhci_pci_renesas libahci
gpio_amdpt gpio_generic
Feb 27 17:46:56 localhost kernel: [  302.125015] CPU: 7 PID: 588 Comm:
kworker/7:2 Tainted: G        W         5.11.2-aw #1
Feb 27 17:46:56 localhost kernel: [  302.125015] Hardware name: To Be Filled By
O.E.M. To Be Filled By O.E.M./B550M Pro4, BIOS P1.70 12/01/2020
Feb 27 17:46:56 localhost kernel: [  302.125015] Workqueue: events
dm_irq_work_func
Feb 27 17:46:56 localhost kernel: [  302.125015] RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2573/0x25f0
Feb 27 17:46:56 localhost kernel: [  302.125015] Code: ff ff 37 00 00 00 c7 85
a4 fd ff ff 20 00 00 00 e8 f2 4a 13 00 e9 da fa ff ff 0f 0b e9 2a f9 ff ff 0f
0b e9 79 f9 ff ff 0f 0b <0f> 0b e9 8f f9 ff ff 49 8b 06 41 0f b6 8e 2d 01 00 00
48 c7 c6 50
Feb 27 17:46:56 localhost kernel: [  302.125015] RSP: 0018:ffff9d9e00b8ba48
EFLAGS: 00010082
Feb 27 17:46:56 localhost kernel: [  302.125015] RAX: 0000000000000001 RBX:
0000000000000005 RCX: ffff92630167e118
Feb 27 17:46:56 localhost kernel: [  302.125015] RDX: 0000000000000001 RSI:
0000000000000297 RDI: ffff926304e80188
Feb 27 17:46:56 localhost kernel: [  302.125015] RBP: ffff9d9e00b8bd48 R08:
0000000000000005 R09: 0000000000000000
Feb 27 17:46:56 localhost kernel: [  302.125015] R10: ffff9d9e00b8b998 R11:
ffff9d9e00b8b99c R12: 0000000000000287
Feb 27 17:46:56 localhost kernel: [  302.125015] R13: ffff92631f003000 R14:
ffff92630167e000 R15: ffff92630f5eb400
Feb 27 17:46:56 localhost kernel: [  302.125015] FS:  0000000000000000(0000)
GS:ffff9271af3c0000(0000) knlGS:0000000000000000
Feb 27 17:46:56 localhost kernel: [  302.125015] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Feb 27 17:46:56 localhost kernel: [  302.125015] CR2: 00007f02dc01f018 CR3:
0000000f9ee10000 CR4: 0000000000350ee0
Feb 27 17:46:56 localhost kernel: [  302.125015] Call Trace:
Feb 27 17:46:56 localhost kernel: [  302.125015]  ? irq_work_queue+0x3a/0x50
Feb 27 17:46:56 localhost kernel: [  302.125015]  ? vprintk_emit+0x12a/0x240
Feb 27 17:46:56 localhost kernel: [  302.125015]  commit_tail+0x99/0x130
Feb 27 17:46:56 localhost kernel: [  302.125015] 
drm_atomic_helper_commit+0x123/0x150
Feb 27 17:46:56 localhost kernel: [  302.125015]  drm_atomic_commit+0x4a/0x50
Feb 27 17:46:56 localhost kernel: [  302.125015] 
dm_restore_drm_connector_state+0xf3/0x170
Feb 27 17:46:56 localhost kernel: [  302.125015]  handle_hpd_irq+0x11a/0x150
Feb 27 17:46:56 localhost kernel: [  302.125015]  dm_irq_work_func+0x4e/0x60
Feb 27 17:46:56 localhost kernel: [  302.125015]  process_one_work+0x217/0x3e0
Feb 27 17:46:56 localhost kernel: [  302.125015]  worker_thread+0x50/0x3f0
Feb 27 17:46:56 localhost kernel: [  302.125015]  ? rescuer_thread+0x390/0x390
Feb 27 17:46:56 localhost kernel: [  302.125015]  kthread+0x145/0x170
Feb 27 17:46:56 localhost kernel: [  302.125015]  ?
__kthread_bind_mask+0x70/0x70
Feb 27 17:46:56 localhost kernel: [  302.125015]  ret_from_fork+0x22/0x30
Feb 27 17:46:56 localhost kernel: [  302.125015] ---[ end trace
9496598019bd6509 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
