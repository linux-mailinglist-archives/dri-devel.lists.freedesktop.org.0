Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5422D3C3
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 04:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727B26EA57;
	Sat, 25 Jul 2020 02:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91676EA57
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 02:38:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sat, 25 Jul 2020 02:38:07 +0000
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
Message-ID: <bug-207383-2300-Hy7zJ7lYcj@https.bugzilla.kernel.org/>
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

--- Comment #93 from mnrzk@protonmail.com ---
(In reply to Nicholas Kazlauskas from comment #92)
> This sounds very similar to a bug I fixed a year ago but that issue was with
> freeing the dc_state.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=204181
> 
> 1. Client requests non-blocking Commit #1, has a new dc_state #1,
> state is swapped, commit tail is deferred to work queue
> 
> 2. Client requests non-blocking Commit #2, has a new dc_state #2,
> state is swapped, commit tail is deferred to work queue
> 
> 3. Commit #2 work starts before Commit #1, commit tail finishes,
> atomic state is cleared, dc_state #1 is freed
> 
> 4. Commit #1 work starts after Commit #2, uses dc_state #1, NULL pointer
> deref.
> 
> This issue was fixed, but it occurred under similar conditions - heavy
> system load and frequent pageflipping.
> 
> However, in the case of dm_state things can't be solved in the same manner.
> Commit #2 can't free Commit #1's commit - only the commit tail for Commit #1
> can free it along with the IOCTL caller.
> 
> I don't know if this is going down any of the deadlock paths in DRM core
> because that might trigger strange behavior as well with clearing/putting
> the dm_state.
> 
> If someone who can reproduce this issue can produce a dmesg log with the DRM
> IOCTLs logged (I think drm.debug=0x54 should work) then I should be able to
> examine the IOCTL sequence in more detail.

Yes, this actually seems quite similar to that bug. Perhaps it's something
like that bug but with dm_state instead?

Also, some more observations I've made:
While dm_state is encountering a use-after-free bug, it does not seem like
state as a whole is. The KASAN bug report only states that reading from
dm_state is invalid, but the same cannot be said about state.

Furthermore, dm_state seems to be used in two separate commits and is being
freed after one commit is complete. This creates a race between the two
commits where the completion of one commit before the other calls
dm_atomic_get_new_state causes a use-after-free.

I think the bug works something like this. Keep in mind that I haven't
worked with this code outside of this bug report so there may be a few
misconceptions:

1. Client requests non-blocking Commit #1, has a new dm_state #1,
state is swapped, commit tail is deferred to work queue

2. Client requests non-blocking Commit #2, has a new dm_state #2,
state is swapped, commit tail is deferred to work queue

3. Commit #2 work starts before Commit #1, commit tail finishes,
atomic state is cleared, dm_state #1 is freed

4. Commit #1 work starts after Commit #2, uses dm_state #1 (use-after-free),
reads bad context pointer and dereferences freelist pointer instead.

So I would agree that this is very similar to the dc_state bug (I even
based that explanation on yours). Perhaps that bug you fixed also
affected dm_state as a whole but only caused an issue with dc_state at the
time?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
