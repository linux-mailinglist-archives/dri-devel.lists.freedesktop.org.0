Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB1338D1C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 13:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D030B6F5F6;
	Fri, 12 Mar 2021 12:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA396F5F6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 12:31:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 783B364FE2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615552276;
 bh=tJ191gJ0m4+J37S/I6NjiX6q4qyB/ucIl9fcKEuYiV0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sp6UkT0CE5stxRGNFzhA/15ARlHZM3Snh18XPAA4djT82/DR1Bfem0+ouZkvVyAta
 0X18jdc8MZGG6+Xm/JKuTLYlMAXKkmMB3wYaW4YxRwq8gUa8Egblv7iWB4TJsH4cFv
 MLZUKe9Tr0e9X20ryUYuI4NEO/3i0VKkL2U4RmIbOMzeurMA/9v4enPLZ9r0LmlgSz
 l3vWEnZfdN5F31oVTFWmPfD5ovTSzoHWGvJBqFNz7K2h/WPsYIE7lYY+WpDtq+BJCo
 nJA1PPRdkSjvpPGhWQCY48B6tVwjA9c1+6i3dlbN8PdbR3nDgoLmkZJOqrxItRTF79
 R1NLamBng8naw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 62DCF653C1; Fri, 12 Mar 2021 12:31:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210321] /display/dc/dcn20/dcn20_resource.c:3240
 dcn20_validate_bandwidth_fp+0x8b/0xd0 [amdgpu]
Date: Fri, 12 Mar 2021 12:31:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tristen.hayfield@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210321-2300-anx37Wlb7t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210321-2300@https.bugzilla.kernel.org/>
References: <bug-210321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210321

Tristen Hayfield (tristen.hayfield@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tristen.hayfield@gmail.com

--- Comment #4 from Tristen Hayfield (tristen.hayfield@gmail.com) ---
I'm seeing this on the 5.10.* series as well. Currently 5.10.23, Gentoo. Radeon
RX 5500 XT.

Looking at the offending section of code, it seems an assertion is being
triggered:

        // Fallback: Try to only support G6 temperature read latency
        context->bw_ctx.dml.soc.dram_clock_change_latency_us =
context->bw_ctx.dml.soc.dummy_pstate_latency_us;

        voltage_supported = dcn20_validate_bandwidth_internal(dc, context,
false);
        dummy_pstate_supported =
context->bw_ctx.bw.dcn.clk.p_state_change_support;

        if (voltage_supported && dummy_pstate_supported) {
                context->bw_ctx.bw.dcn.clk.p_state_change_support = false;
                goto restore_dml_state;
        }

        // ERROR: fallback is supposed to always work.
        ASSERT(false);

So one of (or both) voltage_supported and dummy_pstate_supported are evaluating
to false here and falling through to the assertions.

Stack trace attached for completeness' sake. Hopefully a dev that understands
the hardware will take a look at this one day and find it helpful.

[  642.193449] WARNING: CPU: 22 PID: 3546 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:3242
dcn20_validate_bandwidth_fp+0xd3/0xf0 [amdgpu]
[  642.193450] Modules linked in: fuse nfs lockd grace nfs_ssc sunrpc k10temp
amdgpu backlight gpu_sched snd_hda_codec_hdmi ttm iwlmvm iwlwifi acpi_cpufreq
efivarfs
[  642.193457] CPU: 22 PID: 3546 Comm: X Not tainted 5.10.23-gentoo #1
[  642.193457] Hardware name: System manufacturer System Product Name/TUF
GAMING X570-PLUS (WI-FI), BIOS 3402 01/13/2021
[  642.193487] RIP: 0010:dcn20_validate_bandwidth_fp+0xd3/0xf0 [amdgpu]
[  642.193488] Code: 5d 41 5c c3 5b 48 89 ee 4c 89 e7 5d ba 01 00 00 00 41 5c
e9 2f f6 ff ff 41 0f b6 f4 48 c7 c7 a0 a8 8c c0 31 c0 e8 8d 09 14 d9 <0f> 0b 48
89 9d 50 26 00 00 44 89 e0 5b 5d 41 5c c3 0f 0b e9 53 ff
[  642.193489] RSP: 0018:ffffc18284b37b40 EFLAGS: 00010246
[  642.193490] RAX: 0000000000000000 RBX: 4079400000000000 RCX:
0000000000000000
[  642.193490] RDX: 0000000000000000 RSI: ffff9ea22f197380 RDI:
ffff9ea22f197380
[  642.193491] RBP: ffff9e93ab0e0000 R08: 0000000000000000 R09:
ffffc18284b37910
[  642.193492] R10: ffffc18284b37908 R11: ffffffff9a722228 R12:
0000000000000001
[  642.193492] R13: 0000000000000000 R14: ffff9e93ab0e0000 R15:
ffff9e9344e5b560
[  642.193493] FS:  00007fc5f22978c0(0000) GS:ffff9ea22f180000(0000)
knlGS:0000000000000000
[  642.193494] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  642.193494] CR2: 000055fa36a96628 CR3: 00000001155b2000 CR4:
0000000000350ee0
[  642.193495] Call Trace:
[  642.193526]  dcn20_validate_bandwidth+0x24/0x40 [amdgpu]
[  642.193548]  dc_validate_global_state+0x284/0x300 [amdgpu]
[  642.193580]  amdgpu_dm_atomic_check+0xb09/0xc00 [amdgpu]
[  642.193584]  drm_atomic_check_only+0x555/0x7d0
[  642.193585]  drm_atomic_commit+0xe/0x50
[  642.193586]  drm_atomic_connector_commit_dpms+0xd5/0xf0
[  642.193588]  drm_mode_obj_set_property_ioctl+0x184/0x3a0
[  642.193589]  ? drm_connector_set_obj_prop+0x80/0x80
[  642.193590]  drm_connector_property_set_ioctl+0x32/0x50
[  642.193592]  drm_ioctl_kernel+0xa5/0xf0
[  642.193593]  drm_ioctl+0x20a/0x3a0
[  642.193594]  ? drm_connector_set_obj_prop+0x80/0x80
[  642.193614]  amdgpu_drm_ioctl+0x44/0x80 [amdgpu]
[  642.193616]  __x64_sys_ioctl+0x81/0xa0
[  642.193618]  do_syscall_64+0x33/0x80
[  642.193620]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  642.193621] RIP: 0033:0x7fc5f24cb227
[  642.193622] Code: 1f 40 00 48 89 d8 49 8d 3c 1c 48 f7 d8 49 39 c4 72 b1 e8
0c ff ff ff 85 c0 78 b6 5b 4c 89 e0 5d 41 5c c3 b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 11 6c 0c 00 f7 d8 64 89 01 48
[  642.193622] RSP: 002b:00007fff122b98c8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  642.193623] RAX: ffffffffffffffda RBX: 00007fff122b9900 RCX:
00007fc5f24cb227
[  642.193624] RDX: 00007fff122b9900 RSI: 00000000c01064ab RDI:
000000000000000c
[  642.193624] RBP: 00000000c01064ab R08: 0000000000000000 R09:
00007fc5f2b97d10
[  642.193625] R10: 00007fc5f2b97d20 R11: 0000000000000246 R12:
000055fa38755350
[  642.193625] R13: 000000000000000c R14: 0000000000000000 R15:
000055fa36abf540
[  642.193626] ---[ end trace b1edc8bf2eac897c ]---


I added the following line before the assertion and recompiled the kernel:
DC_LOG_ERROR("voltage_supported: %d, dummy_pstate_supported: %d\n",
voltage_supported, dummy_pstate_supported);

When the issue triggered again, it logged:
[drm:dcn20_validate_bandwidth_fp [amdgpu]] *ERROR* voltage_supported: 1,
dummy_pstate_supported: 0

So in my case the assertion is being triggered because dummy_pstate_supported
is false and the fallback is not working as intended.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
