Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5F2303A0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A0A6E19A;
	Tue, 28 Jul 2020 07:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C566E183
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:14:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 28 Jul 2020 07:14:06 +0000
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
Message-ID: <bug-207383-2300-wil2Uj89Z5@https.bugzilla.kernel.org/>
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

--- Comment #105 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to Duncan from comment #102)
> (In reply to Duncan from comment #101)
> > (In reply to Nicholas Kazlauskas from comment #95)
> > > 0001-drm-amd-display-Force-add-all-CRTCs-to-state-when-us.patch
> > 
> > Just booted to 5.8-rc7 with this patched in 
> 
> So far building system updates so heavy cpu load while playing only moderate
> FHD video.  No freezes but I have seen a bit of the predicted judder.
> 
> The 4k30 and 4k60 youtube tests will probably have to wait for tomorrow, tho,
> as I've been up near 24 now...

Still up...  Here's the promised 4k youtube-in-firefox tests.

4k is a bit more stuttery than normal with the patch, but not near as bad as I
expected it to be.  I can normally run 4k60 at 80-85% normal speed with
occasional stutters but without freezing the video entirely until I drop the
speed down again as I often have to do if I try running over that.  With the
patch I was doing 70-75%.  So there's definitely some effect on 4k60. 
Switching to the performance cpufreq governor from my default conservative, as
usual, helps a bit, but not a lot, maybe 5%, tho the frame-freezes seem to
recover a bit better on performance.  In addition to long video freezes at the
full 4k60 100%, even normally I'll sometimes get tab-crashes depending on the
video.  I didn't have any for this test but then I'm so used to not being able
to run at full-speed that I didn't try it for long.

I can normally run 4k30 videos without much problem on default conservative. 
With the patch I was still getting some stuttering at 30fps on conservative,
but it pretty much cleared up with on-demand.  I did just have a tab-crash at
4k30, something I very rarely if ever see normally on 4k30, it normally takes
4k60 to trigger them, so it's definitely affecting it.

But... other than slowing down the usable 4k fps, I'm not seeing any of judder
artifacts on the work (non-video-playing) monitor that I was seeing with the
high system load but relatively low video load build testing with only FHD
video.  That surprised me.  I expected to see more of that with the more
demanding video.  But apparently that's tied to CPU or memory load, not video
load.

But nothing like the problems mnrzk's seeing with the patch, at all.  Both
monitors running fine in text mode, login, startx to plasma, running fine there
too.  Hardware cursor's fine. <shrug>  The only thing I'm seeing is some
slowdown and judder, as described above.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
