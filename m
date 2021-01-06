Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFD42EC395
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 19:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C15899F3;
	Wed,  6 Jan 2021 18:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A42D89453
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 18:59:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BAC0023333
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 18:59:54 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id B5D5586731; Wed,  6 Jan 2021 18:59:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Wed, 06 Jan 2021 18:59:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-s2OWTPMffl@https.bugzilla.kernel.org/>
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

--- Comment #120 from Duncan (1i5t5.duncan@cox.net) ---
On Wed, 06 Jan 2021 12:05:17 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=207383
> 
> --- Comment #119 from Duncan (1i5t5.duncan@cox.net) ---
> (In reply to Christopher Snowhill from comment #118)
> > Now experiencing this attempting to run Luxmark with literally any
> > OpenCL runtime on my RX 480

> > Happens with both 5.10.4 and 5.4.86 kernels.  

> So did you try earlier 5.10 releases, 5.10.0-5.10.3, and were they
> fine? Because I'm still on 5.10.0 and haven't had an issue since this
> bug was originally resolved.
> 
> Maybe I better get with the program and try current 5.11-rcs...

On current 5.11-rc2+ (rc2-00142-g9f1abbe to be exact) now (5 hours
since rebooting to new kernel) and not seeing anything unusual, tho on
my system the bug did sometimes take a couple days to trigger. Also I
was on X before and am now on wayland (plasma/kwin), however that might
or might not affect it.

5.11 is reported to be pretty big amdgpu-wise, tho most of it is
register headers for new silicon.  But it might be worth testing since
it's there /to/ test.

(The below's probably obvious and some is repeat from earlier comments,
but in case it mentions something or triggers an association you
previously missed ...)

If you haven't, check out the possibly related bug I
mentioned in comment #117, which has a similar atomic-commit-tail print
and was originally suspected to be triggered by the fix for this
one, tho reverting it didn't fix it, so...  As of last nite the last
comment on the freedesktop.org issue for it was reported as three
months old, without a fix because they haven't been able to
definitively bisect.

But (if you don't believe it puts you at too much risk) you might
consider trying with a 5.4 series previous to 5.4.56, which got the fix
for this bug.  5.4.86 is what you just tested and see it.  5.4.58 is
what the reporter of that bug/issue says he was on, and 5.4.56
introduced the patch for this bug, thus making the fix for this bug
suspect tho he says reverting it didn't help.  So try 5.4.55 or earlier
and see if you can reproduce. That's where I'd start, anyway, since
you've already replicated on 5.4.86.  Then if that's clean bisect
between it and current; if not, try all the way back to 5.4.0.  Because
there's way less backported patches to test so if you can definitively
say it wasn't in 5.4.x and appeared in 5.4.y you've just cut the
problem and bisect space /tremendously/, compared to everything in
mainline since 5.4-stable's branch.

What does not help (as I found out with my bisect struggles on this
bug) is that the change may well be in some other part of the kernel.
So don't just look at amdgpu or all of the drm tree, as you could
easily miss it, just as I did on the first bisect with this bug, because
it was a hardening patch introduced thru Andrew's tree that triggered it
(tho the bug had actually existed for quite some time and was simply
revealed/triggered by that patch).

The other thing is I don't have freesync monitors (they're both 75-inch
UHD/4K@60 TVs), so if that's your trigger I'd be unlikely to see it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
