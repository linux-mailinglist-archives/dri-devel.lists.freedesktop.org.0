Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D2243F3E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 21:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F536E110;
	Thu, 13 Aug 2020 19:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C9F6E110
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:16:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208893] Navi (RX 5700 XT) system appears to hang with more than
 one display connected
Date: Thu, 13 Aug 2020 19:16:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gordon@gordonite.tech
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208893-2300-kmymVpQHy3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208893-2300@https.bugzilla.kernel.org/>
References: <bug-208893-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208893

--- Comment #12 from Gordon (gordon@gordonite.tech) ---
I'm not certain but:
- uint32_t cur_value, i, timeout = adev->usec_timeout * 10;

if adev_usec_timeout is the microseconds timeout, then most likely the * 10 is
wrong, as the below for loop uses microseconds too, so possibly they meant to
add there too. Each iteration is 1 micro second, and the below code makes it 10
times that for the timeout, i think this explains the 'hanging' but not why it
inconsistently breaks.

Another few thoughts were:
- Perhaps there is a period of messages on 'init' / startup where we are
sending more.
- I can only think the flaky behaviour is a memory issue, or a problem where
the GPU is not being reset fully on boot. As it makes zero sense it works
'sometimes'.
- When the message / error occours the 'timeout' is 10 times the value, thus
blocking messages for the other startup events.
- The display port being connected / or being interfaced with on init might be
preventing the normal startup messages to be sent to the GPU.

These GPUs have a problem in general with loss of display output, so if there
is an electronics issue, maybe we don't have the 'hack' to make it work.

IDK for sure, I'm new to kernel devel. I mainly work on Godot.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
