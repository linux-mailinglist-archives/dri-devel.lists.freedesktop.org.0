Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A9228A90
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 23:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985536E037;
	Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C236E037
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 21:16:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 21 Jul 2020 21:16:03 +0000
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
Message-ID: <bug-207383-2300-znmrvEwL7a@https.bugzilla.kernel.org/>
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

--- Comment #79 from mnrzk@protonmail.com ---
(In reply to Kees Cook from comment #78)
> (In reply to mnrzk from comment #76)
> > If my understanding is correct, base would have previously been filled with
> > the freelist pointer (since it's the first 8 bytes). Now since the freelist
> > pointer is being put in the middle (rounded to the nearest sizeof(void*),
> >  or 8 bytes), it's being put in the last 8 bytes of *dm_state
> > (or dm_state->context).
> > 
> > I'll place a void* for padding in the middle of struct dm_atomic_state* and
> > if my hypothesis is correct, the padding will be filled with garbage data
> > instead of context and the bug should be fixed. Of course, there would
> > still be a use-after-free bug in the code which may cause other issues in
> > the future so I wouldn't really consider it a solution.
> 
> Agreed: that should make it disappear again, but as you say, it's just
> kicking the problem down the road since now the failing condition is losing
> a race with kfree()+kmalloc()+new contents.
> 
> And if you want to detect without crashing, you can just zero the padding at
> init time and report when it's non-NULL at workqueue run time... I wonder if
> KASAN can run in a mode where the allocation/freeing tracking happens, but
> without the heavy checking instrumentation? Then when the corruption is
> detected, it could dump a traceback about who did the early kfree()... hmmm.

So far I've been testing it by passing my GPU to my VM via vfio-pci and
attaching kgdb to the guest. To test if the context was invalid, I added
a check to make sure the context pointer wasn't garbage data (by checking
if dc_state was not null and the upper 16 bits were set on dc_state).

I wonder if there's any way to set a watchpoint to see where exactly the
dm_atomic_state gets filled with garbage data.

Also, since I'm not too familiar with freelists, do freelist pointers look
like regular pointers? On a regular pointer on a system with a 48-bit
virtual address space, regular pointers would be something like
0xffffXXXXXXXXXXXX. I've noticed that the data being inserted never
followed this format. Is this something valuable to note or is that just
the nature of freelist pointers?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
