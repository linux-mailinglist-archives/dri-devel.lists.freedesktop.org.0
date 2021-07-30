Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A53DB082
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 03:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA96EEA2;
	Fri, 30 Jul 2021 01:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197126E209
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 01:10:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 644D060F43
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627607435;
 bh=pxjh4D6dUneswaG2Op7MYCTss28czlDOI5d9h02QmDE=;
 h=From:To:Subject:Date:From;
 b=qOCvTLc+KeqwlDj9xhFxRrdqXe7t51rh3+h1JyeFnZnRBBO+6sOlawl0YJ2JEcP51
 gPsBbGeDSZFNiH87fwhRNm6f9cU3QXz1bnin3pQEff0Amhvo1CKmyitRyz/KEsZk8d
 B1kEe4e0F4L9cQ6XrtkCm+lRj572KzidUyo6TYxbobY4H9gnfb4rCMV9Y7sops+ZkE
 FciYgGSdRjwMgQRNEXdbbeKtKmAeuU3TmNHjQ2e04wvztgLDrG3gNyUcl5pvwe2uWD
 ADV4l3w5CmqoOr94CVFqMYFtFvtC9n2A/7yZNY3cb/r/aLEjRqdA+fMGtabNaLQCU5
 mRWPyH5c9JgHA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5760C60EE2; Fri, 30 Jul 2021 01:10:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213917] New: Screen starts flickering when laptop(amdgpu) wakes
 up after suspend.
Date: Fri, 30 Jul 2021 01:10:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: utkarsh.naveen@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213917-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213917

            Bug ID: 213917
           Summary: Screen starts flickering when laptop(amdgpu) wakes up
                    after suspend.
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: utkarsh.naveen@gmail.com
        Regression: No

I have an ASUS FX505DT with an AMD Ryzen 3550H APU. This is not a new bug a=
nd
it was fixed in kernel v5.6 with commit hash:
eb916a5a93a64c182b0a8f43886aa6bb4c3e52b0


I haven't had the time to test out each of the kernel versions individually,
but this bug isn't there in Linux v5.12.6 and only appeared after I updated=
 to
v5.13.5.


## Steps to reproduce
1. Let the laptop suspend.
2. Wake it up with some keypresses or something.
3. After waking up, the screen starts flickering on/off every second.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
