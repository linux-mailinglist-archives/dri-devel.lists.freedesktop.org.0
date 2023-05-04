Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B843B6F6800
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903CE10E3FF;
	Thu,  4 May 2023 09:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AE310E3FF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:09:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93DFB6328B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08F47C4339B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683191361;
 bh=EeGd7ZBG9sQ1eTCWihn0JXzYu5hSR5ExuyYRqYctqUk=;
 h=From:To:Subject:Date:From;
 b=dzSqeGmxr7wA+JIga8nYBtJbfVCWnFOJphF9NZcSwIPt6fDwSy038u7zJtzH3ddqP
 //YXUE8tpRckl5vZxDnaL8jO4LOGS5QBSW5QLp5GP0OXzUeIl5qrvLKzZFI/X2u4k5
 cid2k2/UW0TPd7sdmh2nf8xTsWEn36tW3fNM2ZstUUTwXontknRpQ+M+XlxbpUJpjK
 HVgKzrZPLtAWq+QPzLSCpnQAJs0gV61RTmlsGSsi8zsOjvd8jY216bLkZrIUk8DeHW
 n3PzvptlNe6tleCdO760xuU58k3rCU89lYWuBhzuQUeFbi3IWgFyhNT1BBJN93XM66
 bwWix43nR3vFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EB3E5C43141; Thu,  4 May 2023 09:09:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217398] New: amdgpu module loading breaks display output - no
 signal
Date: Thu, 04 May 2023 09:09:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a1bert@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-217398-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217398

            Bug ID: 217398
           Summary: amdgpu module loading breaks display output - no
                    signal
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.3.1
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: a1bert@atlas.cz
        Regression: No

after loading amdgpu module of 6.3.1 kernel (from ubuntu kernel-ppa) monitor
starts "blinking" between blank screen and "no signal" message

console nor X are working

model name      : AMD Ryzen 5 5600G with Radeon Graphics

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
