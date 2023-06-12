Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F472C7D9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7BF10E28A;
	Mon, 12 Jun 2023 14:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76D510E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28077629CE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEE8CC4339B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686579304;
 bh=Z121IE/ITnkjYCsnRmOu1UA+eFvdmeSLsilPEg8/810=;
 h=From:To:Subject:Date:From;
 b=lFAzUSJBOEir4h8jmxO0doCHl4yTC5OJpIbodBRFfFYoAFmNuaV/ZadnfQhF+3A7n
 EOs4UEIhXEy8h3UOkVFTP+7g3KaE7l4MgQ031GdVyLUOCsiba5TjGp5/qvcNJ65SQq
 izZRk/J9GxAzTrBPbGQmIBkJPhgm/KWXE74kOMUo2lARrzbV3yWA7tjJ/CUvo5Xwx7
 4CgHFenL5Ytnh5O9bM0qZtTc8eQu7trlaa0ViJ8y44vq+BMvTuUAtYWlKJfD4WaTAD
 Yekhs/IAYGoWxhmsjEnYMBRQdUYW73WJ0YwvHc8F138eFNe597fQd1Su0uzmrYZFeW
 Dp678y8zfl2qA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D99B0C43141; Mon, 12 Jun 2023 14:15:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217545] New: Serious regression on amdgpu
 (drm_display_helper/drm_dp_atomic_find_time_slots) with two DisplayPort
 connected via a HP G5 docking station
Date: Mon, 12 Jun 2023 14:15:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla.kernel.bpeb@manchmal.in-ulm.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217545-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217545

            Bug ID: 217545
           Summary: Serious regression on amdgpu
                    (drm_display_helper/drm_dp_atomic_find_time_slots)
                    with two DisplayPort connected via a HP G5 docking
                    station
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: bugzilla.kernel.bpeb@manchmal.in-ulm.de
        Regression: Yes

Created attachment 304404
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304404&action=3Dedit
lscpi

This was previously mentioned in comment 69 in
https://bugzilla.kernel.org/show_bug.cgi?id=3D204181 but I reckon it's a
different story.

Hardware:

* Notebook hp mt45 with

    03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile Series]
[1002:15d8] (rev d3)

  Also briefly confirmed with a Thinkpad T495 with

    06:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile Series]
[1002:15d8] (rev d2)

* HP G5 USB-C docking station (HSN-IX02)

Problem:

After upgrading from kernel 6.0 to 6.1, the host crashes once a *second*
external display is connected via DisplayPort on that docking station:

    BUG: kernel NULL pointer dereference, address: 0000000000000008
    RIP: 0010:drm_dp_atomic_find_time_slots+0x47/0x250 [drm_display_helper]

(see attachment for full log)

Another way to reproduce this:

* Use the Ubuntu 23.04 installer/test image.
* Boot with displays disconnected.
* Select "Try Ubuntu".
* Connect displays.
* Upon connecting the second display, the system freezes.


Insights found after bisecting:

* This was introduced with commit

    commit a5c2c0d164e96d24f73faffcd3b7bbb607e701a9
    Author: Lyude Paul <lyude@redhat.com>
    Date:   Wed Aug 17 15:38:37 2022 -0400

        drm/display/dp_mst: Add nonblocking helpers for DP MST

* Later this was half-fixed with commit

    commit efa4c4df864ecd969670093524d3e8f69188e5eb
    Author: Harry Wentland <harry.wentland@amd.com>
    Date:   Mon Feb 13 17:36:55 2023 -0500

        drm/amd/display: call remove_stream_from_ctx from res_pool funcs

Now the notebook no longer crashes, however the displays remain dark althou=
gh
from the operating system's point of view they are connected and should show
some content. This may or may not be a userland problem. (Aside: This commit
should be backported to the 6.1 stable series. It applies and likewise redu=
ces
the problem from "crash" to "dark screens" there.)

This situation still exists with 6.4-rc6 (released last night)

Please advise if there's anything else we can do.

Find attached:

* lscpi
* dmesg (with drm.debug=3D4)
* kernel.log (the actual crash)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
