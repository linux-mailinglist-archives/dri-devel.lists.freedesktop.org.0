Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B1340A7B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2256E91E;
	Thu, 18 Mar 2021 16:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5886E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:48:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 953DC64EED
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616086081;
 bh=0lbHLm17MBYoes6HSU+EjXDnMfqP7V/uH5NPbugT6WI=;
 h=From:To:Subject:Date:From;
 b=ZsT83dE09N3Et8rJF3p//fEu9ZCnQPfQxk30A7EDgQOL7yfqYjpAOU0jqLc2u3p1I
 W3Y6/A0S6kyDPVapPFkraDcCVYOJNh76SKJTp3nshjGxCxvwozkq+Eml0Rz68f+wbF
 9TI9PiRwDGJTGiDLgQFSfPa4Ev9XpTHyXrcU/naTzPh6tMabMj1Uq4V+vITwMJ+vnG
 1eJlJsAw4MJKqbu1O2YZljAdFAHk0B4aRZCSjvpI88dxkF/VIf3ImhrGhPg21je6OZ
 O3ZeZWy/Nc1/GK1ctxG6Q1A8zWzDLdJdFzGXAj4rR0kQqloCKvLqZlQ2x1DoI0CKY+
 LqvGuaWCKNELA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8C17A653CB; Thu, 18 Mar 2021 16:48:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212333] New: Bisected: 5.11.7 breaks amdgpu resume from S3
Date: Thu, 18 Mar 2021 16:48:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: timo.valtoaho@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-212333-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212333

            Bug ID: 212333
           Summary: Bisected: 5.11.7 breaks amdgpu resume from S3
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.7
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: timo.valtoaho@gmail.com
        Regression: No

Created attachment 295921
  --> https://bugzilla.kernel.org/attachment.cgi?id=295921&action=edit
Working kernel config with CONFIG_AMD_PMC is not set

After upgrading kernel 5.11.6 => 5.11.7 my Asus Vivobook S14 (Model M433I,
Ryzen 5 4500U), resume from S3 suspend is broken.

Asus has disabled S3 completely, it is not shown in BIOS/UEFI at all. I have
modified DSDT table which works fine providing working S3.

Now, after upgrade, suspend seems to happen just fine but resume gives me
scrambled screen for few seconds, then screen goes completely black and mouse
cursor shows up and is fully alive.I have to do a hard reboot to get away.

Bisecting led to this:

# first bad commit: [084b4f3304f923e39e64216a818a8bbf398dd896] drm/amdgpu: fix
S0ix handling when the CONFIG_AMD_PMC=m

When I change "CONFIG_AMD_PMC is not set" all is working again.
CONFIG_AMD_PMC=y also breaks resume. All of this applies also to 5.12-rc3 which
I tested too.

Also, removing modified DSDT and using S2idle instead of deep, is broken too.
It has never worked on this laptop. Now s2idle suspends, but resume scrambles
screen for few seconds, then it works fine on first round. Suspending second
time will end up on black screen on resume and I have to hard reboot.

OS is Kubuntu 20.10 and firmware is the latest (linux-firmware package v1.195)
taken from next release.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
