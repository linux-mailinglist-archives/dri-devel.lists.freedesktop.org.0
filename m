Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CEC206893
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 01:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3E86E48B;
	Tue, 23 Jun 2020 23:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021606E48B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 23:41:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 23 Jun 2020 23:41:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-Svi0SdyqOZ@https.bugzilla.kernel.org/>
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

--- Comment #22 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to rtmasura+kernel from comment #21)
> OK. I've uninstalled the vast majority of KDE and am using a vanilla XFCE4.
> It's been about 12 hours on 5.7.4-arch1-1 and I have yet to have a crash. It
> is looking like it may be something with KDE.

Note that it is possible to run kwin (kwin_x11 being the actual executable) on
another desktop, or conversely, a different WM on plasma.  To run kwin and make
it replace the existing WM you'd simply type in (in the xfce runner or terminal
window, it can be done from a different VT as well but then you gotta feed kwin
the display information too) kwin_x11 --replace.  Presumably other WMs have a
similar command-line option.

I've never actually done it on a non-plasma desktop (tho I run live-git plasma
and frameworks so I must always be prepared to restart it or various other
plasma components, to the point I have non-kde-invoked shortcuts setup to do it
there), but I /think/ kwin would continue to use the configuration setup on
kde, the various window rules, configured kwin keyboard shortcuts and effects,
etc.

That could prove whether it's actually kwin triggering or not (tho it's a
kernel bug regardless), tho I suspect the proof is academic at this point given
that you've demonstrated that the trigger does appear to be kde/plasma related,
at least.  IMO kwin triggering is a reasonably safe assumption given that.  But
it does explain why the bug isn't widely reported, plasma being the apparent
biggest trigger and limited to specific now older generations of hardware means
few people, even of those running the latest kernels, are going to see it.

Meanwhile, I actually got a log-dump on the 4th crash of the kernel at that
bisect step, confirming it is indeed this bug, and have advanced a bisect step.
 But git says I still have ~11 steps, 1000+ commits, so it's still well too
large to start trying to pick out candidate buggy commits from the remainder. 
Slow going indeed.  At this rate a full bisect and fix could well be after 5.8
release, giving us two full bad release cycles and kernels before a fix.  Not
good. =:^(

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
