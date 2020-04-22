Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ABD1B3706
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 07:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1586E4E6;
	Wed, 22 Apr 2020 05:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47906E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 05:58:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205291] Cannot switch off Radeon HD 4330/4350/4550 with
 vgaswitcheroo
Date: Wed, 22 Apr 2020 05:58:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205291-2300-6fbjHxmgkA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205291-2300@https.bugzilla.kernel.org/>
References: <bug-205291-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205291

Lukas Wunner (lukas@wunner.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lukas@wunner.de

--- Comment #8 from Lukas Wunner (lukas@wunner.de) ---
Starting with v4.17, the power management of HDA controllers on discrete GPUs
was changed such that the HDA keeps the GPU awake as long as it's in use:
https://lists.freedesktop.org/archives/nouveau/2018-February/029851.html

This exposed an issue with some ATI cards which was fixed in June 2018:
https://git.kernel.org/linus/57cb54e53bdd

So if you still experience GPU insomnia with v5.3 (which contains that fix),
then it's a different problem.

In one case, a user reported GPU insomnia with an Nvidia card and it turned out
that it was caused by a user space tool called "tlp" which disabled runtime
power management of the HDA via sysfs. Naturally, this caused the GPU to stay
awake. The solution in this case was to change the configuration of "tlp". But
it was also possible to manually override disablement of runtime PM on the HDA
by echoing "on" to the "power/control" file in the HDA PCI device's sysfs
directory:
https://bugs.freedesktop.org/show_bug.cgi?id=75985#c116

So you first may want to check whether runtime PM is disabled in sysfs, try to
manually enable it and see if the GPU runtime suspends, and if that works, find
out which user space tool disabled runtime PM on the HDA.

It's also possible that you've got a user space tool running which has opened
the HDA and thereby keeps the GPU awake. Some audio mixers do that.

If none of that fixes the problem, then we may indeed be dealing with a kernel
bug. The other bugs related to runtime PM of the HDA contain all the steps and
several debug patches to understand what's keeping the HDA awake, so we need
you to follow those instructions and report the results back. Here are the
relevant bugzillas:
https://bugs.freedesktop.org/show_bug.cgi?id=106597#c4
https://bugs.freedesktop.org/show_bug.cgi?id=106957#c1

One oddity I notice in your dmesg output is that there's only a single HDA
controller detected in your machine and that's the one on the discrete GPU.
Normally there are two HDAs, one is part of the Intel chipset and is
responsible for headphones, loudspeakers, mic and so on, and the other one is
on the discrete GPU and is only responsible for HDMI audio. On your machine,
there's no Intel chipset HDA and the one on the discrete GPU has a Line Out for
loudspeakers, headphone out, digital out and two microphone inputs. So that's a
little odd and may contribute to this issue.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
