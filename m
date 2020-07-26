Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F7722E210
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 20:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F43889FD1;
	Sun, 26 Jul 2020 18:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8411789F19
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 18:40:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sun, 26 Jul 2020 18:40:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207383-2300-zSXBhK7kGU@https.bugzilla.kernel.org/>
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

--- Comment #95 from Nicholas Kazlauskas (nicholas.kazlauskas@amd.com) ---
Created attachment 290583
  --> https://bugzilla.kernel.org/attachment.cgi?id=290583&action=edit
0001-drm-amd-display-Force-add-all-CRTCs-to-state-when-us.patch

So the sequence looks like the following:

1. Non-blocking commit #1 requested, checked, swaps state and deferred to work
queue.

2. Non-blocking commit #2 requested, checked, swaps state and deferred to work
queue.

Commits #1 and #2 don't touch any of the same core DRM objects (CRTCs, Planes,
Connectors) so Commit #2 does not stall for Commit #1. DRM Private Objects have
always been avoided in stall checks, so we have no safety from DRM core in this
regard.

3. Due to system load commit #2 executes first and finishes its commit tail
work. At the end of commit tail, as part of DRM core, it calls
drm_atomic_state_put().

Since this was the pageflip IOCTL we likely already dropped the reference on
the state held by the IOCTL itself. So it's going to actually free at this
point.

This eventually calls drm_atomic_state_clear() which does the following:

obj->funcs->atomic_destroy_state(obj, state->private_objs[i].state);

Note that it clears "state" here. Commit sets "state" to the following:

state->private_objs[i].state = old_obj_state;
obj->state = new_obj_state;

Since Commit #1 swapped first this means Commit #2 actually does free Commit
#1's private object.

4. Commit #1 then executes and we get a use after free.

Same bug, it's just this was never corrupted before by the slab changes. It's
been sitting dormant for 5.0~5.8.

Attached is a patch that might help resolve this.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
