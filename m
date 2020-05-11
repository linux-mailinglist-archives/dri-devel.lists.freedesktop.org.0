Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC611CDE03
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 17:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6B06E4A7;
	Mon, 11 May 2020 15:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8F56E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:01:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203033] nouveau hung task
Date: Mon, 11 May 2020 15:01:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathieu.malaterre@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203033-2300-C0x92sr4h7@https.bugzilla.kernel.org/>
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

--- Comment #2 from Mathieu Malaterre (mathieu.malaterre@gmail.com) ---
Same here:

May 11 16:54:31 vostrodell kernel: [  605.330992] INFO: task kworker/u8:3:162
blocked for more than 120 seconds.
May 11 16:54:31 vostrodell kernel: [  605.330997]       Not tainted
5.4.0-0.bpo.4-amd64 #1 Debian 5.4.19-1~bpo10+1
May 11 16:54:31 vostrodell kernel: [  605.330999] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 11 16:54:31 vostrodell kernel: [  605.331001] kworker/u8:3    D    0   162 
    2 0x80004000
May 11 16:54:31 vostrodell kernel: [  605.331083] Workqueue: events_unbound
nv50_disp_atomic_commit_work [nouveau]
May 11 16:54:31 vostrodell kernel: [  605.331095] Call Trace:
May 11 16:54:31 vostrodell kernel: [  605.331108]  ? __schedule+0x2e6/0x6f0
May 11 16:54:31 vostrodell kernel: [  605.331111]  schedule+0x2f/0xa0
May 11 16:54:31 vostrodell kernel: [  605.331114]  schedule_timeout+0x20d/0x310
May 11 16:54:31 vostrodell kernel: [  605.331155]  ? nvif_notify_get+0x94/0xa0
[nouveau]
May 11 16:54:31 vostrodell kernel: [  605.331224]  ? nv84_fence_sync+0x40/0x40
[nouveau]
May 11 16:54:31 vostrodell kernel: [  605.331234] 
dma_fence_default_wait+0x22f/0x290
May 11 16:54:31 vostrodell kernel: [  605.331241]  ?
dma_fence_release+0x140/0x140
May 11 16:54:31 vostrodell kernel: [  605.331245] 
dma_fence_wait_timeout+0xdd/0x100
May 11 16:54:31 vostrodell kernel: [  605.331264] 
drm_atomic_helper_wait_for_fences+0x3c/0xd0 [drm_kms_helper]
May 11 16:54:31 vostrodell kernel: [  605.331332] 
nv50_disp_atomic_commit_tail+0x72/0x710 [nouveau]
May 11 16:54:31 vostrodell kernel: [  605.331340]  ? __switch_to_asm+0x40/0x70
May 11 16:54:31 vostrodell kernel: [  605.331357]  ? __switch_to_asm+0x34/0x70
May 11 16:54:31 vostrodell kernel: [  605.331360]  ? __switch_to+0x7a/0x3e0
May 11 16:54:31 vostrodell kernel: [  605.331365]  ? __switch_to_asm+0x34/0x70
May 11 16:54:31 vostrodell kernel: [  605.331370]  process_one_work+0x1a7/0x360
May 11 16:54:31 vostrodell kernel: [  605.331377]  worker_thread+0x30/0x390
May 11 16:54:31 vostrodell kernel: [  605.331383]  ? create_worker+0x1a0/0x1a0
May 11 16:54:31 vostrodell kernel: [  605.331388]  kthread+0x112/0x130
May 11 16:54:31 vostrodell kernel: [  605.331394]  ? kthread_park+0x80/0x80
May 11 16:54:31 vostrodell kernel: [  605.331400]  ret_from_fork+0x35/0x40

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
