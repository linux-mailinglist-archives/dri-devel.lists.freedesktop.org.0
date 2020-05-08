Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1131C9FF1
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 03:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127F6E120;
	Fri,  8 May 2020 01:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A1A6E120
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 01:10:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207619] New: Screen corrupt in Wayland and kmscube, like wrong
 stride / pitch, on Radeon X1400 RV515
Date: Fri, 08 May 2020 01:10:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: boris.gjenero@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207619-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207619

            Bug ID: 207619
           Summary: Screen corrupt in Wayland and kmscube, like wrong
                    stride / pitch, on Radeon X1400 RV515
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7-rc4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: boris.gjenero@gmail.com
        Regression: No

I have a Dell Inspiron 6400 laptop with ATI / AMD Mobility Radeon X1400
graphics (RV515/M54) and a 1680x1050 LCD panel. If run GNOME shell with
Wayland, Sway, Weston or kmscube, the screen is corrupt as if the pitch /
stride is wrong. In other words, the picture is as if drawing assumes one
number of bytes per line, and the GPU uses a different number of bytes per line
when outputting to the screen. As a result, the image is slanted and wrapped.
It's like a CRT with incorrect horizontal hold, except it's an LCD and the
image is always slanted the same way.

In GNOME the mouse cursor is perfectly fine. I assume GNOME uses the hardware
mouse cursor, which is not affected by this problem. This also shows that the
issue is in with how data is represented in memory, and not a lack of
horizontal hold between the GPU and LCD.

The fact the exact same kind of corruption happens in 4 different applications
seems to imply this is a kernel bug. I'm observing this in Ubuntu 20.04 x86-64,
both with its 5.4.0-29-generic kernel and their
5.7.0-050700rc4-generic_5.7.0-050700rc4.202005051752 from upstream.

I do not have this problem in Xorg.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
