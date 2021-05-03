Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74ED3717FA
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBC76E8B8;
	Mon,  3 May 2021 15:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFFA6E8B8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:26:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A34D61040
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620055611;
 bh=r9Fgm4aS3D/FHtsvh+gP8KFLuOaDVC7Ltzia3LbfcEM=;
 h=From:To:Subject:Date:From;
 b=HyFzuyz/DPqkst7Ans+B0ZKkuX18tdOkj7L9oJpv2N92aVj0NGA58b2DdwoSU2lwc
 Du/oPqTuTtJYvKG+GzkYf/8PInetGlctdae3zdCSUKuGIAeAyUrruAwloTCVO5SBfK
 4lZrIuMonrBH25/O/y9snnSonu94GfuP9dhDGFkR73SVcPl9l1ZAOdcMfDD3E8cUIA
 gT9wbkNuyiYy5QdtO3gWw1RFa1Ie7AJjddW4UY2jYL8J0gk8O2zFRGg2n9F0YqgCkl
 Uw6d7NjpStFe4hoyYIXhUHWNbKaY0Qb7PPoCfx8BLxzrKPDJPVYhMwNzfsM3/JbVta
 v5xyDuKCkJWfg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 946B16120E; Mon,  3 May 2021 15:26:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212935] New: When my monitors go to standby amdgpu crashes
Date: Mon, 03 May 2021 15:26:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mwolf@adiumentum.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212935-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212935

            Bug ID: 212935
           Summary: When my monitors go to standby amdgpu crashes
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mwolf@adiumentum.com
        Regression: No

Created attachment 296605
  --> https://bugzilla.kernel.org/attachment.cgi?id=296605&action=edit
dmesg of the crash

general protection fault, probably for non-canonical address
0x8e60543000000000: 0000 [#1] SMP PTI
CPU: 4 PID: 34572 Comm: kworker/4:0 Not tainted 5.11.16-300.fc34.x86_64 #1
Hardware name: ASUS All Series/Z97-A-USB31, BIOS 3503 04/18/2018
Workqueue: events drm_sched_job_timedout [gpu_sched]
amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
amdgpu 0000:01:00.0: amdgpu: Bailing on TDR for s_job:201fc, as another already
in progress
RIP: 0010:free_mqd_hiq_sdma+0x5/0x20 [amdgpu]
Code: 00 48 01 d1 48 89 48 18 49 8b 88 08 02 00 00 48 01 d1 48 89 48 08 49 03
90 10 02 00 00 48 89 50 10 5b 5d c3 90 0f 1f 44 00 00 <48> 83 7a 18 00 48 89 d7
74 05 e9 bc 7b cb d5 0f 0b e9 b5 7b cb d5
RSP: 0018:ffffb1b7446c3d30 EFLAGS: 00010206
RAX: ffffffffc063a220 RBX: ffff89b10a957400 RCX: 0000000080800033
RDX: 8e60543000000000 RSI: 0000000055d51400 RDI: ffff89b10da85700
RBP: ffff89b2f0284000 R08: 0000000000000001 R09: 0000000000000000
R10: ffff89b243481a40 R11: 0000000000000001 R12: ffff89b10a9574d0
R13: ffff89b10b580000 R14: ffff89b1014e7000 R15: ffff89b1014e70c8
FS:  0000000000000000(0000) GS:ffff89b42ed00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000037dbfa13c000 CR3: 00000001bba10006 CR4: 00000000001706e0
Call Trace:
 kernel_queue_uninit+0x33/0xe0 [amdgpu]
 stop_cpsch+0xa0/0xc0 [amdgpu]
 kgd2kfd_suspend.part.0+0x2f/0x40 [amdgpu]
 kgd2kfd_pre_reset+0x3f/0x50 [amdgpu]
 amdgpu_device_gpu_recover.cold+0x33d/0x924 [amdgpu]
 ? uvd_v3_1_resume+0x11/0x20 [amdgpu]
 amdgpu_job_timedout+0x123/0x150 [amdgpu]
 drm_sched_job_timedout+0x72/0xf0 [gpu_sched]
 process_one_work+0x1ec/0x380
 worker_thread+0x53/0x3e0
 ? process_one_work+0x380/0x380
 kthread+0x11b/0x140
 ? kthread_associate_blkcg+0xa0/0xa0
 ret_from_fork+0x22/0x30
Modules linked in: uinput snd_seq_dummy snd_hrtimer tun xt_CHECKSUM
xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_sip nf_nat_tftp nf_conntrack_sip
nf_conntrack_tftp nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat bridge stp llc nf_tables
ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_filter
ebtables ip6table_filter ip6_tables iptable_filter sunrpc vfat fat
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
intel_rapl_msr intel_rapl_common snd_hda_intel snd_intel_dspcfg soundwire_intel
soundwire_generic_allocation snd_soc_core x86_pkg_temp_thermal intel_powerclamp
coretemp snd_compress kvm_intel snd_pcm_dmaengine soundwire_cadence
snd_hda_codec
 snd_usb_audio kvm snd_hda_core mei_hdcp iTCO_wdt eeepc_wmi snd_usbmidi_lib
intel_pmc_bxt ac97_bus at24 iTCO_vendor_support snd_rawmidi snd_hwdep asus_wmi
irqbypass snd_seq sparse_keymap rapl intel_cstate snd_seq_device rfkill
intel_uncore mxm_wmi wmi_bmof pcspkr i2c_i801 i2c_smbus snd_pcm snd_timer
lpc_ich joydev mc snd mei_me mei soundcore acpi_pad binfmt_misc zram ip_tables
amdgpu uas usb_storage drm_ttm_helper ttm crct10dif_pclmul iommu_v2
crc32_pclmul

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
