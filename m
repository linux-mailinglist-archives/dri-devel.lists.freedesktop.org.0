Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB82339C2E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 06:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24CD6E093;
	Sat, 13 Mar 2021 05:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AECD6E093
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 05:39:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E26B264E6F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 05:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615613988;
 bh=ZAMSsKLv7qaFiKbpa1L7Rxxjl504AEM2FXnofoDz9HM=;
 h=From:To:Subject:Date:From;
 b=o7zNyGV+92WE9PTzpoA5h0KhmnTUfJTKFOPX1LFh8Rg3BCmbGmQa/8v7455cRplpz
 eFZGco7NdkJre/ZS6lrOH7+tntnlstkDHVHKlpIuI/pkajeunGfH4fHc3w3VeCbSdU
 ZrKHWxAvg7CkvFnV6FaLuP9IOSkjev49bVDjlWdKNh94aEKttIL6I5UpZ7QwAi2Y2G
 Eq9dYsuhtoySLD4p+zOeL0NqW0vSd+cWMZBaZCua7jPFRWjk0WOYabXneJYeLdB64k
 IHLsFbPiV3m4IH+bfhGrOsYtMGA4gfQKGBCa79BKUMcIpdzrFyGDAVozRtCREBD1kZ
 nTeptPsv4dnCg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D8CCA652E8; Sat, 13 Mar 2021 05:39:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212259] New: Entire graphics stack locks up when running
 SteamVR and sometimes Sway; is sometimes unrecoverable
Date: Sat, 13 Mar 2021 05:39:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212259-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212259

            Bug ID: 212259
           Summary: Entire graphics stack locks up when running SteamVR
                    and sometimes Sway; is sometimes unrecoverable
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.0
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: happysmash27@protonmail.com
        Regression: No

Created attachment 295831
  --> https://bugzilla.kernel.org/attachment.cgi?id=295831&action=edit
Last 406 lines of dmesg at the time of error

This bug is driving me nuts! 

First time, it frequently happened when I ran Sway and LXDE at the same time,
where my entire graphics stack would freeze and I would be unable to switch
virtual TTYs or even kill X, even with kill -9 on everything. 

Now, I am experiencing this bug again, this time with SteamVR, and at a MUCH
higher frequency. It seems to happen, fairly randomly, whenever I start
SteamVR, but seems to be more likely when my system has been running for a long
time, or when Waterfox has been running for a long time. 

A couple weeks ago I found a way to reset my GPU as a workaround to the bug
(https://www.reddit.com/r/linuxquestions/comments/lpiwkg/how_to_reset_graphics_stack_when_x_stops/),
but today, this did not work. My screen went black, but I was still unable to
kill -9 X, even after trying the reset many times. In dmesg, there were
messages about the reset still being in-progress, but I did not see anything
seem to change. Eventually, I decided to give up on gracefully fixing this bug
with no downtime to my website and poweroff, then hold the power button of my
computer after the HDD activity light went off as even powering off doesn't
seem to work properly with this bug. Only then, could I reboot and recover. 

I have attached the end of the most recent dmesg where this failed. I also have
more dmesgs that may or may not be the same bug, but the attachment field only
allows for one.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
