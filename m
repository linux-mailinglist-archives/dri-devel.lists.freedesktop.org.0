Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493CF220110
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 01:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD126EA48;
	Tue, 14 Jul 2020 23:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690E26EA48
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 23:36:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 14 Jul 2020 23:36:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-207383-2300-1cMfKUQX82@https.bugzilla.kernel.org/>
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

Duncan (1i5t5.duncan@cox.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.7-rc1 - 5.7 - 5.8-rc4+    |5.7-rc1 - 5.7 - 5.8-rc5+

--- Comment #62 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to Duncan from comment #48)
> (In reply to Duncan from comment #47)
> > So I tried [patch-reverting] with the 11 above commits against
> > 5.8.0-rc4-00025-gbfe91da29, which previously tested as triggering the
> freeze
> > for me.  Of the 11, nine clean-reversed and I simply noted and skipped the
> > other two (3202fa62f and 630f289b7) for the moment.  The patched kernel
> > successfully built and I'm booted to it now.
> 
> Bah, humbug!  Got a freeze and the infamous logged trace on that too

After taking a few days discouragement-break I'm back at trying to pin it down.
 The quoted above left two candidate commits, 3202fa62f and 630f289b7, neither
of which would clean-revert as commits since were preventing that.

630f289b7 is a few lines changed in many files so I'm focusing on the simpler
3202fa62f first.  Turns out the reason 320... wasn't reverting was two
additional fixes to it that landed before v5.7.  Since they had Fixes: 320...
labels they were easy enough to find and patch-revert, after which
patch-reverting 320... itself worked against a current v5.8-rc5-8-g0dc589da8. 
I first tested it without the reverts to be sure it's still triggering this bug
for me, and just confirmed it was, freeze with the telltale log dump.

So for me at least, v5.8-rc5 is bad (just updated the version field to reflect
that).

Meanwhile I've applied the three 320-and-followups revert-patches to
v5.8-rc5-8-g0dc589da8 and just did the rebuild with them applied.  Now to
reboot to it and see if it still has our bug.  If no, great, pinned down.  If
yes, there's still that 630... commit to try to test.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
