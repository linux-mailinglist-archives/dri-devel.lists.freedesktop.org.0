Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1A255DC3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 17:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81D89BEC;
	Fri, 28 Aug 2020 15:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDF189BEC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:23:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203033] nouveau hung task
Date: Fri, 28 Aug 2020 15:23:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: james.obeirne@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203033-2300-3DmOQ755HX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203033-2300@https.bugzilla.kernel.org/>
References: <bug-203033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203033

James O'Beirne (james.obeirne@pm.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |james.obeirne@pm.me

--- Comment #5 from James O'Beirne (james.obeirne@pm.me) ---
Having the same issue.

# lspci | grep VGA
1f:00.0 VGA compatible controller: NVIDIA Corporation GK208 [GeForce GT 710B]
(rev a1)

# uname -a
Linux slug 4.19.0-10-amd64 #1 SMP Debian 4.19.132-1 (2020-07-24) x86_64
GNU/Linux

Aug 28 02:34:11 slug kernel: [38304.923718] INFO: task kworker/u32:0:5123
blocked for more than 120 seconds.
Aug 28 02:34:11 slug kernel: [38304.923725]       Tainted: G            E    
4.19.0-10-amd64 #1 Debian 4.19.132-1
Aug 28 02:34:11 slug kernel: [38304.923727] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Aug 28 02:34:11 slug kernel: [38304.923729] kworker/u32:0   D    0  5123      2
0x80000000
Aug 28 02:34:11 slug kernel: [38304.923798] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
Aug 28 02:34:11 slug kernel: [38304.923799] Call Trace:
Aug 28 02:34:11 slug kernel: [38304.923808]  __schedule+0x2a2/0x870
Aug 28 02:34:11 slug kernel: [38304.923812]  schedule+0x28/0x80
Aug 28 02:34:11 slug kernel: [38304.923814]  schedule_timeout+0x26d/0x390
Aug 28 02:34:11 slug kernel: [38304.923875]  ? nvkm_client_map+0x10/0x10
[nouveau]
Aug 28 02:34:11 slug kernel: [38304.923880]  dma_fence_default_wait+0x238/0x2a0
Aug 28 02:34:11 slug kernel: [38304.923882]  ? dma_fence_release+0x90/0x90
Aug 28 02:34:11 slug kernel: [38304.923884]  dma_fence_wait_timeout+0x42/0xf0
Aug 28 02:34:11 slug kernel: [38304.923897] 
drm_atomic_helper_wait_for_fences+0x63/0xc0 [drm_kms_helper]
Aug 28 02:34:11 slug kernel: [38304.923957] 
nv50_disp_atomic_commit_tail+0x7c/0x880 [nouveau]
Aug 28 02:34:11 slug kernel: [38304.923963]  ? __switch_to+0x15b/0x440
Aug 28 02:34:11 slug kernel: [38304.923966]  ? __switch_to_asm+0x35/0x70
Aug 28 02:34:11 slug kernel: [38304.923971]  process_one_work+0x1a7/0x3a0
Aug 28 02:34:11 slug kernel: [38304.923975]  worker_thread+0x30/0x390
Aug 28 02:34:11 slug kernel: [38304.923978]  ? create_worker+0x1a0/0x1a0
Aug 28 02:34:11 slug kernel: [38304.923981]  kthread+0x112/0x130
Aug 28 02:34:11 slug kernel: [38304.923983]  ? kthread_bind+0x30/0x30
Aug 28 02:34:11 slug kernel: [38304.923985]  ret_from_fork+0x22/0x40

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
