Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F402219C0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 04:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7236E1A5;
	Thu, 16 Jul 2020 02:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BB96E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 02:12:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Thu, 16 Jul 2020 02:12:52 +0000
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
Message-ID: <bug-207383-2300-E1xr4WPDDr@https.bugzilla.kernel.org/>
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

--- Comment #65 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to Duncan from comment #63)
> NB: The 3202fa62f followups are cbfc35a48 and 89b83f282.  That should let
> anyone else with git and kernel building skills try reverting the three.
> 
> Still too early (by days) to call it nailed down as I've had it take 2-3
> days to trigger, but no gfx freeze here yet on that v5.8-rc5+ with
> 320-and-followups reverted so far, despite playing 4k video to try to
> trigger it as it has previously on affected kernels.  I'll be trying update
> builds (gentoo) later today or tomorrow, another previous trigger, so we'll
> see how it goes.

I'm still not saying for sure, but that's actually looking like the culprit.

Today's gentoo update included a dep of qtwebengine, which changed ABI so
qtwebengine needed rebuilt on top of it, and qtwebengine is chromium-based. 
And as anyone that's built chromium (or firefox for that matter) can tell you,
at least on older fx-based hardware, it's several hours of near constant 100%
all-cores.

While rebuilding qtwebengine (at a batch-nice of +19 so it doesn't interfere
too badly with anything else I want to run), I was playing youtube videos at
1080p, not normally a problem by themselves (tho 4k can be, especially 4k60)
but with qtwebengine building at the same time...

No freezes.

I'm going to run with the 320 commit and followups reverted a few more days
before declaring it for sure the culprit, and I'm watching for Anthony's
results as well, but the bug's sure doing a convincing job of hiding ATM if
that commit isn't the culprit!

I'd say it's time to start reviewing the amdgpu code to see what relocating the
slub freelist pointer to the middle of the object (what the 320 commit did
according to its git log explanation) could tickle, when the work goes on the
work queue to run later, since that's consistently what the logs say is the
scenario and what mnrzk confirmed by forcing it /not/ to go to the work queue
in comment #30.

Hopefully we can still get and confirm a proper codefix by 5.8.0 release. =:^)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
