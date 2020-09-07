Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1325F131
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 02:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36B6E037;
	Mon,  7 Sep 2020 00:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA956E037
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 00:44:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209179] New: nouveau 0000:01:00.0: can't change power state
 from D3cold to D0 (config space inaccessible)
Date: Mon, 07 Sep 2020 00:44:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@mattmcadoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209179-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209179

            Bug ID: 209179
           Summary: nouveau 0000:01:00.0: can't change power state from
                    D3cold to D0 (config space inaccessible)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kernel@mattmcadoo.com
        Regression: No

Created attachment 292387
  --> https://bugzilla.kernel.org/attachment.cgi?id=292387&action=edit
full dmesg output

Lenovo ThinkPad W540, with hybrid video (Intel/Nvidia)

01:00.0 VGA compatible controller: NVIDIA Corporation GK107GLM [Quadro K1100M]
(rev ff) (prog-if ff)
!!! Unknown header type 7f
Kernel driver in use: nouveau

Dmesg has numerous errors like the following (full dmesg output in attachment):

[   16.243256] nouveau 0000:01:00.0: can't change power state from D3cold to D0
(config space inaccessible)
[   16.243265] nouveau 0000:01:00.0: can't change power state from D3cold to D0
(config space inaccessible)
[   16.303637] nouveau 0000:01:00.0: can't change power state from D3cold to D0
(config space inaccessible)
[   16.303659] nouveau 0000:01:00.0: tmr: stalled at ffffffffffffffff
[   16.303659] ------------[ cut here ]------------
[   16.303660] nouveau 0000:01:00.0: timeout
[   16.303679] WARNING: CPU: 6 PID: 87 at
drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c:107 nvkm_pmu_reset+0x275/0x2d0
[   16.303680] Modules linked in:
[   16.303683] CPU: 6 PID: 87 Comm: kworker/6:1 Not tainted 5.8.7-gentoo #5
[   16.303684] Hardware name: LENOVO 20BG0014US/20BG0014US, BIOS GNET91WW (2.39
) 05/29/2019
[   16.303688] Workqueue: pm pm_runtime_work
[   16.303691] RIP: 0010:nvkm_pmu_reset+0x275/0x2d0
[   16.303693] Code: e4 74 57 e8 dd 09 10 00 4c 89 e2 48 c7 c7 66 d0 33 84 48
83 05 8b f5 5e 04 01 48 89 c6 e8 62 19 1c ff 48 83 05 83 f5 5e 04 01 <0f> 0b 48
83 05 81 f5 5e 04 01 48 8b 45 00 48 83 05 7d f5 5e 04 01
[   16.303694] RSP: 0018:ffffc900002c7a80 EFLAGS: 00010202
[   16.303695] RAX: 0000000000000000 RBX: ffff88885338e800 RCX:
0000000000000000
[   16.303696] RDX: 0000000000000001 RSI: 0000000000000002 RDI:
0000000000000001
[   16.303697] RBP: ffff88885337da00 R08: 0000000000000491 R09:
0000000000000000
[   16.303699] R10: 0000000000000002 R11: 000000000007aee4 R12:
ffff8888591c95a0
[   16.303700] R13: 00000003caea9731 R14: 00000003caea956f R15:
ffff88885921b0b0
[   16.303701] FS:  0000000000000000(0000) GS:ffff88885d780000(0000)
knlGS:0000000000000000
[   16.303702] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   16.303703] CR2: 000055a07a344f14 CR3: 000000083ea48006 CR4:
00000000001606e0
[   16.303704] Call Trace:
[   16.303710]  nvkm_pmu_preinit+0x1a/0x30
[   16.303712]  nvkm_subdev_preinit+0x44/0xa0
[   16.303716]  ? nvkm_device_pci_preinit+0x5e/0x80
[   16.303717]  nvkm_device_init+0x76/0x2e0
[   16.303720]  nvkm_udevice_init+0x64/0x90
[   16.303721]  nvkm_object_init+0x52/0x190
[   16.303723]  nvkm_object_init+0x8b/0x190
[   16.303724]  nvkm_object_init+0x8b/0x190
[   16.303727]  ? new_id_store+0x2a0/0x2a0
[   16.303729]  nvkm_client_resume+0x19/0x30
[   16.303732]  nvif_client_resume+0x22/0x30
[   16.303734]  nouveau_do_resume+0x32/0x120
[   16.303736]  nouveau_pmops_runtime_resume+0xa4/0x1d0
[   16.303738]  pci_pm_runtime_resume+0xba/0x120
[   16.303740]  ? new_id_store+0x2a0/0x2a0
[   16.303741]  __rpm_callback+0xd6/0x1f0
[   16.303743]  ? new_id_store+0x2a0/0x2a0
[   16.303744]  ? new_id_store+0x2a0/0x2a0
[   16.303745]  rpm_callback+0x36/0xc0
[   16.303746]  ? new_id_store+0x2a0/0x2a0
[   16.303748]  rpm_resume+0x7d0/0x9f0
[   16.303750]  __pm_runtime_resume+0x5c/0x90
[   16.303751]  ? new_id_store+0x2a0/0x2a0
[   16.303752]  rpm_get_suppliers+0x4c/0x1a0
[   16.303754]  ? new_id_store+0x2a0/0x2a0
[   16.303755]  __rpm_callback+0x198/0x1f0
[   16.303756]  ? new_id_store+0x2a0/0x2a0
[   16.303757]  ? new_id_store+0x2a0/0x2a0
[   16.303759]  rpm_callback+0x36/0xc0
[   16.303760]  ? new_id_store+0x2a0/0x2a0
[   16.303761]  rpm_resume+0x7d0/0x9f0
[   16.303763]  pm_runtime_work+0x99/0xf0
[   16.303765]  process_one_work+0x203/0x620
[   16.303767]  worker_thread+0x257/0x5f0
[   16.303769]  ? rescuer_thread+0x4a0/0x4a0
[   16.303770]  kthread+0x1d0/0x220
[   16.303772]  ? kthread_create_worker+0xa0/0xa0
[   16.303774]  ret_from_fork+0x22/0x30
[   16.303777] ---[ end trace 084955cbd974989c ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
