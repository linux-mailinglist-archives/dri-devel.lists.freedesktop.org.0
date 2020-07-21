Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FD2289F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 22:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E126E0E4;
	Tue, 21 Jul 2020 20:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331F26E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 20:33:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 21 Jul 2020 20:33:54 +0000
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
Message-ID: <bug-207383-2300-mFL0I6lM2i@https.bugzilla.kernel.org/>
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

--- Comment #76 from mnrzk@protonmail.com ---
(In reply to Kees Cook from comment #75)
> Hi!
> 
> First, let me say sorry for all the work my patch has caused! It seems like
> it might be tickling another (previously dormant) bug in the gpu driver.
> 
> 
> (In reply to mnrzk from comment #30)
> > I've been looking at this bug for a while now and I'll try to share what
> > I've found about it.
> > 
> > In some conditions, when amdgpu_dm_atomic_commit_tail calls
> > dm_atomic_get_new_state, dm_atomic_get_new_state returns a struct
> > dm_atomic_state* with an garbage context pointer.
> > 
> > I've also found that this bug exclusively occurs when commit_work is on the
> > workqueue. After forcing drm_atomic_helper_commit to run all of the commits
> > without adding to the workqueue and running the OS, the issue seems to have
> > disappeared. The system was stable for at least 1.5 hours before I manually
> > shut it down (meanwhile it has usually crashed within 30-45 minutes).
> > 
> > Perhaps there's some sort of race condition occurring after commit_work is
> > queued?
> 
> If it helps to explain what's happening in 3202fa62f, the kernel memory
> allocator is moving it's free pointer from offset 0 to the middle of the
> object. That means that when the memory is freed, it writes 8 bytes to join
> the newly freed memory into the allocator's freelist. That always happened,
> but after 3202fa62f it began writing it in the middle, not offset 0. If the
> work queue is trying to use freed memory, and before it didn't notice the
> first 8 bytes getting written, now it appears to notice the overwrite... but
> that still means something is freeing memory before it should.
> 
> Finding that might be a real trick. :( However, if you've suffered through
> all those bisections, I wonder if you can try one other thing, which is to
> compile the kernel with KASAN:
> 
> CONFIG_KASAN=y
> CONFIG_KASAN_GENERIC=y
> CONFIG_KASAN_OUTLINE=y
> CONFIG_KASAN_STACK=y
> CONFIG_KASAN_VMALLOC=y
> 
> This will make things _slow_, which might mean the use-after-free race may
> never trigger. *However* it's possible that it'll catch a bad behavior
> before it even needs to get hit in a race that triggers the behavior you're
> seeing. (And note that swapping CONFIG_KASAN_OUTLINE=y for
> CONFIG_KASAN_INLINE=y might speed things up, but the kernel image gets
> bigger).
> 
> I'm going to try to read the work queue code for the driver and see if
> anything obvious stands out...

Actually this makes perfect sense, struct dm_atomic_state* dm_state has
two components, base (a struct containing a struct drm_atomic_state*) and
context (a struct dc_state*). Reading through the code of
amdgpu_dm_atomic_commit_tail, I see that dm_state->base is never used.

If my understanding is correct, base would have previously been filled with
the freelist pointer (since it's the first 8 bytes). Now since the freelist
pointer is being put in the middle (rounded to the nearest sizeof(void*),
 or 8 bytes), it's being put in the last 8 bytes of *dm_state
(or dm_state->context).

I'll place a void* for padding in the middle of struct dm_atomic_state* and
if my hypothesis is correct, the padding will be filled with garbage data
instead of context and the bug should be fixed. Of course, there would
still be a use-after-free bug in the code which may cause other issues in
the future so I wouldn't really consider it a solution.

Regarding KASAN, I've tried compiling the kernel with KASAN enabled and
from my experience, the bug did not trigger after actively using the system
for 3 hours and leaving it on for 12 hours. This was almost a month ago
though so maybe I'll try again with different KASAN options (i.e.
CONFIG_KASAN_INLINE=y). If anyone has any more tips on getting KASAN to run
faster, I'll be glad to hear them.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
