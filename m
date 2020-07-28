Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29051230053
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 05:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E296E146;
	Tue, 28 Jul 2020 03:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BA76E146
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:39:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 28 Jul 2020 03:39:18 +0000
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
Message-ID: <bug-207383-2300-lItlYjztwW@https.bugzilla.kernel.org/>
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

--- Comment #104 from mnrzk@protonmail.com ---
(In reply to mnrzk from comment #103)
> (In reply to Nicholas Kazlauskas from comment #95)
> > Created attachment 290583 [details]
> > 0001-drm-amd-display-Force-add-all-CRTCs-to-state-when-us.patch
> > 
> > So the sequence looks like the following:
> > 
> > 1. Non-blocking commit #1 requested, checked, swaps state and deferred to
> > work queue.
> > 
> > 2. Non-blocking commit #2 requested, checked, swaps state and deferred to
> > work queue.
> > 
> > Commits #1 and #2 don't touch any of the same core DRM objects (CRTCs,
> > Planes, Connectors) so Commit #2 does not stall for Commit #1. DRM Private
> > Objects have always been avoided in stall checks, so we have no safety from
> > DRM core in this regard.
> > 
> > 3. Due to system load commit #2 executes first and finishes its commit tail
> > work. At the end of commit tail, as part of DRM core, it calls
> > drm_atomic_state_put().
> > 
> > Since this was the pageflip IOCTL we likely already dropped the reference
> on
> > the state held by the IOCTL itself. So it's going to actually free at this
> > point.
> > 
> > This eventually calls drm_atomic_state_clear() which does the following:
> > 
> > obj->funcs->atomic_destroy_state(obj, state->private_objs[i].state);
> > 
> > Note that it clears "state" here. Commit sets "state" to the following:
> > 
> > state->private_objs[i].state = old_obj_state;
> > obj->state = new_obj_state;
> > 
> > Since Commit #1 swapped first this means Commit #2 actually does free
> Commit
> > #1's private object.
> > 
> > 4. Commit #1 then executes and we get a use after free.
> > 
> > Same bug, it's just this was never corrupted before by the slab changes.
> > It's been sitting dormant for 5.0~5.8.
> > 
> > Attached is a patch that might help resolve this.
> 
> So I just got around to testing this patch and so far, not very promising.
> 
> Right now I can't comment on if the bug in question was resolved but this
> just introduced some new critical bugs for me.
> 
> I first tried this on my bare metal system w/ my RX 480 and it boots into
> lightdm just fine. As soon as I log in and start up XFCE however, one of my
> two monitors goes black (monitor reports being asleep) but my cursor seems
> to drift into the other monitor just fine. So after that, I check the
> display settings and both monitors are detected. So I tried re-enabling the
> off monitor and then both monitors work fine.
> 
> After that, another bug: I now have two cursors, one only works on my right
> monitor and the other only stays in one position.
> 
> At this point, I recompiled and remade the initramfs, and sure enough, same
> issues. This time, however, changing the display settings didn't "fix" the
> issue with one monitor being blank; the off monitor activated, but the
> previously working one just froze.
> 
> I also tried this on my VM passing through my GPU w/ vfio-pci; similar
> issues. Lightdm worked fine but when I started KDE Plasma, it started
> flashing white and one of my monitors just became blank. This time, I
> couldn't enable the blank display from the settings, it just didn't show
> up. Xrandr only showed one output as well; switching HDMI outputs still
> only lets me use the monitor on the "working" HDMI port.
> 
> I don't exactly know how I would go about debugging this since there's just
> too many bugs to count. I also don't know if it would be worth it at all.
> 
> Do you have any idea why this would occur? This patch only seems to force
> synchronisation, I don't quite know why it would break my system so much.

This just gets even weirder the more I test it out. Swapping the two
monitors (i.e. swapping the HDMI ports used for each monitor) seems to fix
the issue completely on my VM (at least from 1 minute of testing), but on
the host it fixes some of the issues (my cursor still disappears on one of
my monitors).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
