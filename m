Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56122DC54
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 08:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F48E89F8E;
	Sun, 26 Jul 2020 06:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB489F8E
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 06:47:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 26 Jul 2020 06:47:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mnrzk@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-Z6y7rTbjA2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207383

--- Comment #94 from mnrzk@protonmail.com ---
I just got this interesting log w/ drm.debug=0x54 right before a crash:

[  971.537862] [drm:drm_atomic_state_init [drm]] Allocated atomic state
00000000cac2d51a
[  971.537909] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:47:crtc-0]
00000000dc3e08a2 state to 00000000cac2d51a
[  971.537938] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:45:plane-5]
00000000ab054dfb state to 00000000cac2d51a
[  971.537963] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:103] for
[PLANE:45:plane-5] state 00000000ab054dfb
[  971.537988] [drm:drm_atomic_check_only [drm]] checking 00000000cac2d51a
[  971.538064] [drm:drm_atomic_get_private_obj_state [drm]] Added new private
object 00000000da817c3e state 000000001743c8e6 to 00000000cac2d51a
[  971.538211] [drm:drm_atomic_nonblocking_commit [drm]] committing
00000000cac2d51a nonblocking
[  971.538898] [drm:drm_atomic_state_init [drm]] Allocated atomic state
00000000cc027c4b
[  971.538941] [drm:drm_atomic_get_crtc_state [drm]] Added [CRTC:49:crtc-1]
00000000992fcbd2 state to 00000000cc027c4b
[  971.538968] [drm:drm_atomic_get_plane_state [drm]] Added [PLANE:44:plane-4]
000000009d6970b1 state to 00000000cc027c4b
[  971.538992] [drm:drm_atomic_set_fb_for_plane [drm]] Set [FB:103] for
[PLANE:44:plane-4] state 000000009d6970b1
[  971.539017] [drm:drm_atomic_check_only [drm]] checking 00000000cc027c4b
[  971.539108] [drm:drm_atomic_get_private_obj_state [drm]] Added new private
object 00000000da817c3e state 0000000057153d72 to 00000000cc027c4b
[  971.539140] [drm:drm_atomic_nonblocking_commit [drm]] committing
00000000cc027c4b nonblocking
[  971.544942] [drm:drm_atomic_state_default_clear [drm]] Clearing atomic state
00000000cc027c4b
[  971.544977] [drm:__drm_atomic_state_free [drm]] Freeing atomic state
00000000cc027c4b

and then my debugger detected a use-after-free while 00000000cac2d51a was being
committed.

Basically the sequence of events is as follows:

1. Non-blocking commit #1 (00000000cac2d51a) was requested, allocated, and is
deferred to workqueue.

2. Non-blocking commit #2 (00000000cc027c4b) was requested, allocated, and is
deferred to workqueue.

3. Commit #2 starts and completes before commit #1 is started, dm_state is
freed.

4. Commit #1 starts after commit #2 and is using commit #2's freed dm_state
pointer.

And from every instance of this bug I have seen, it has been due to
page-flipping.

So Nicholas, it seems your observation was correct; the sequence of events are
very similar to how you've described the other bug.

Perhaps we'll have to look into the page-flipping code to figure out what
exactly
is going on.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
