Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A421B381
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 12:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BFD6EBCE;
	Fri, 10 Jul 2020 10:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6F56EBCE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:55:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Fri, 10 Jul 2020 10:55:02 +0000
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
Message-ID: <bug-207383-2300-BWKaOYvFQb@https.bugzilla.kernel.org/>
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
     Kernel Version|5.7-rc1 - 5.7 - 5.8-rc1+    |5.7-rc1 - 5.7 - 5.8-rc4+

--- Comment #56 from Duncan (1i5t5.duncan@cox.net) ---
Some notes and a question (last * point):

* There seem to be two and it's now looking like three near identical bugs or
variants of the same bug, all with the very similar
amdgpu-dm-atomic-commit-tail/events-unbound-commit-work log trace.  

1) Until now all the reports seemed to start by 5.7.0 and presumably between
5.6.0 and 5.7-rc1, which was when I first saw it.  But now, comment #53 is
reporting an origin with 5.7.6 or 5.7.7 while 5.7.5 was fine.  That's on rx580,
which wikipedia says is polaris20.

2) Of the other two, one is reported fixed (on an rc5700/navi10) by commit
6eb3cf2e0 which we were asked to try above, that made it into 5.8-rc4, while...

3) My older rx460/polaris11, started with a pull shortly before 5.7-rc1 (that
I've been unable to properly bisect to, once for sure and it's looking like
twice, much to my frustration!) and continues all the way thru today's almost
5.8-rc5 -- the 6eb commit didn't help.

Seems the vega/navi graphics either started later (your 5.7.5 good, 5.7.7 bad)
or are fixed by 6eb, while my older polaris, started earlier and isn't fixed by
6eb.

BTW Stratos, that 6eb commit appears to be in the fresh 5.7.8 as well.  Seeing
if the bug is still there would thus be interesting.

* Chris mentioned variable-refresh-rate/VRR in comment #49.  He was wondering
if turning it OFF helped him as he had done so when migrating cards and hadn't
seen the problem on his rx480 after that.

I hadn't messed with VRR here on my rx460/polaris11, because I'm running dual
4k TVs as monitors and didn't think they supported it, yet I was the OP, so at
least on rx460 having VRR off doesn't seem to help.  But just for kicks I did
try turning it on yesterday while back on a stable 5.6.0, and then booted to
today's near-5.8-rc5 to test it.  Still got the graphics freeze.  So that
didn't appear to affect the bug here on my rx460 anyway.

Interestingly enough, tho, quite aside from this bug and maybe it's all in my
head, but despite thinking VRR shouldn't be available here and expecting no
difference, turning it on /does/ seem to make things smoother.  Now I'm
wondering if even without actual VRR, turning it on helps something stay in
sync better, at least on my hardware.  <shrug>  Tho it doesn't seem to affect
how the bug triggers, maybe that'll be the hint necessary for the devs to
figure out what's different with the bug on my rx460 compared to the newer
stuff, thus helping them to fix the older stuff too.

* Now the question: Anybody with this bug that is **NOT** running multi-monitor
when it triggers?  Seems all I've seen are multi-monitor, but someone could
have simply not mentioned (or I just missed it) that they're seeing it on
single-monitor too.  (If you are running multi-monitor you don't need to post a
reply just for this, as that seems to be the reported default.  But having
explicit confirmation of whether it affects single-monitor or not could be
helpful.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
