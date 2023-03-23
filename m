Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD96C7274
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 22:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB32910E0BC;
	Thu, 23 Mar 2023 21:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A25F10E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 21:40:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D585EB82242
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 21:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8612CC433EF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679607612;
 bh=DJe3b/vw4fMbm9YSte3VAaCDkfFYDp9MWJSq3yh1Vdg=;
 h=From:To:Subject:Date:From;
 b=p1/dvjN2hnfP8bDJm99osUjMPwMGEu1pjEXFlhYRdkpmblIJ7dcVWP/2Mlj9vgs6U
 Ggy2vSogXYmnRv6ZeGwF0DGzJYcdc56VYOAxnA6vVoj0TgdCC7xsfhtn4Tnjw0/41M
 uwYA/npIeT6E8MG1NmjHeyJqrv+Gh3mCcvvoMPA2q+8zerh4nlOg457eBuZern2asi
 l+y9+bEQ4nI5znA+lVT4FT68XSP4TBtnVgY6uBw9cVJxOcyCq0xo5YUKHa2mNjZq9p
 LGmdAosbhpyu3ZiPc6CPq1DzW2iN4mP0/7ePi8U3AnQMqHYC/K66C8ZeroqtxIv8OI
 CVCdLo9hJBDCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 74F1EC43143; Thu, 23 Mar 2023 21:40:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217237] New: Fail to read EDID after resuming from suspend
 since kernel 6.2
Date: Thu, 23 Mar 2023 21:40:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chewi@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217237-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217237

            Bug ID: 217237
           Summary: Fail to read EDID after resuming from suspend since
                    kernel 6.2
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.3.0-rc3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: chewi@gentoo.org
        Regression: No

Created attachment 304013
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304013&action=3Dedit
dmesg from 6.2.7 showing boot, suspend, resume

Since upgrading past Linux kernel 6.2, my system has been unable to read the
EDID after resuming from suspend. I got the following error:

[  135.566642] EDID block 0 is all zeroes
[  135.566831] amdgpu 0000:0f:00.0: [drm] User-defined mode not supported:
"2560x1440": 144 592000 2560 2568 2600 2666 1440 1465 1470 1543 0x60 0x9
[  135.566836] amdgpu 0000:0f:00.0: [drm] User-defined mode not supported:
"2560x1440": 144 807923 2560 2784 3072 3584 1440 1441 1444 1565 0x20 0x6

After this, the only available mode is 640x480. This happens with both my
displays, a monitor and a TV. I have a Radeon RX 6800 XT that previously wo=
rked
fine in this regard. I usually override the EDID with drm.edid_firmware, but
removing this has not helped.

I tried bisecting the issue, but perhaps it doesn't happen every single tim=
e,
as it lead my down a dead end. I also tried reverting some potential culpri=
ts,
to no avail. I can see that there were some very large EDID-related changes=
 by
Jani Nikula for 6.2. I wasn't able to revert these, so I will CC them here.

I am happy to provide further information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
