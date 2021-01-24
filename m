Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3622301E6E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 20:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC60F89C80;
	Sun, 24 Jan 2021 19:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B957989C80
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 19:23:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6667E22C9C
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 19:23:19 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 57B4082545; Sun, 24 Jan 2021 19:23:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sun, 24 Jan 2021 19:23:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211277-2300-T72wnOjJUv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

Jerome C (me@jeromec.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |me@jeromec.com

--- Comment #4 from Jerome C (me@jeromec.com) ---
I too have a Ryzen 5 3500U and random resumes where the screen updates are very
slow ( 1 frame change every 1-2 minutes ) which looks like it's crashed and in
the kernel logs I see a bunch of "flip_done timed out" and
"amdgpu_dm_atomic_commit_tail" errors

This never happened for me between 5.4.6 - 5.9.14. I noticed this since 5.10.4
and did never suspended on 5.10.0 - 5.10.3, so my guess it's an issue sometime
in 5.10.0 - 5.10.3

Do you have kernel parameter set "init_on_free=1" or in your kernel config
"CONFIG_INIT_ON_FREE_DEFAULT_ON=y", if so try changing/setting the kernel
parameter "init_on_free=0", so far ( for me and still testing ) it's resumed
every time

I think it's an issue with amdgpu and kernel paramater "init_on_free=1" or
kernel config "CONFIG_INIT_ON_FREE_DEFAULT_ON=y" which zero's memory on
free/deallocation.

kernel paramter "init_on_alloc=1" or kernel config
"CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y" works fine for me

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
