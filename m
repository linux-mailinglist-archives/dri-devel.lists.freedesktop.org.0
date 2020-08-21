Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE22224E12A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 21:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6BE6EBA4;
	Fri, 21 Aug 2020 19:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199586EBA3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 19:52:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208947] amdgpu DisplayPort won't recognize all display modes
 after 5.9 merges
Date: Fri, 21 Aug 2020 19:52:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ckane@colemankane.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208947-2300-3nylTLAFEL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208947-2300@https.bugzilla.kernel.org/>
References: <bug-208947-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208947

--- Comment #16 from Coleman Kane (ckane@colemankane.org) ---
Pulling the call / reassignment of "status" added in that commit seems to
revert the undesirable behavior, including in the latest "staging-testing" code
that I've tested on.

My hardware situation seems to be that the "native" resolution of my DP display
(3840x2160@60Hz) is also advertised as "supported" by the RX 580m on my laptop,
but for whatever reason the GPU is unable to actually drive that resolution. I
don't know enough about the hardware to speculate as to why this is, though.
Using the "video=" option to the kernel, I can force a functioning video mode,
which seems to be consistent with the intent of that variable, when this call
is commented out. However, if the call to check_link_loss_status happens, then
the inconsistent behavior occurs that I described above where it randomly might
work, might only give me 1024x768, or might never display on my DP-connected
monitor regardless of the resolution chosen.

That said, I wonder if it makes sense to wrap this call with another kernel
command-line boolean variable, so the behavior can be disabled in the event
someone has a misbehaving GPU or monitor like I do - unless you think there
might be a graceful way to auto-identify this type of defect. Not sure how the
auto-selection works for KMS console resolutions, but it would be helpful too
if it detected that an attempt at a high refresh rate didn't work, it
automatically tried lower refresh rates.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
