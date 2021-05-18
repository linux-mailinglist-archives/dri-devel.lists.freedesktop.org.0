Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D973A387877
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB83E6EB41;
	Tue, 18 May 2021 12:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D856EB41
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BC966600D4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621339712;
 bh=NgFduRCLCnvoPdvI5drDwtRFNRGtqsHAfsIw8gs5p30=;
 h=From:To:Subject:Date:From;
 b=VtkCdp+JnVmRi16kdasu8FIRU200WnVPb3tKPWoma5aEUnGStDywUcEbiBZ6wjLne
 s0tWXFv1Jwi0/PQSVsaEfamV33+eknLmvFjPOMMKNSbQgx8yph3YrXdxTPxzFMmUtv
 0+5TGT8Vhd3ztlvEhj4GU9aQf6YZ8H8hrU2IdCsRyl3szHMccg3tJxkWDQfL9UCTmw
 SFtthkFz+zW62Ep5eN+jvdkRq5f2OBy3vedqQqNWqWpogkuAoxCfVGcGW/ISuxreXq
 vesaAnRpl0i3FOs0SXjYNNv4oq8KTEUT0m6UQ8vHxedYuzp0c/6ZWBeEAL7boWRQLU
 juylPGwy5n1kg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B295761249; Tue, 18 May 2021 12:08:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213129] New: Tiny font
Date: Tue, 18 May 2021 12:08:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thoralf.dassler@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213129-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213129

            Bug ID: 213129
           Summary: Tiny font
           Product: Drivers
           Version: 2.5
    Kernel Version: Tiny font during kernel boot with multihead
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: thoralf.dassler@gmail.com
        Regression: No

Created attachment 296833
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296833&action=3Dedit
relev_out

The following issue started with the 5.10.33 vanilla kernel (currently I am=
 on
5.10.37 vanilla). I get my kernels (incl. firmware, modules and headers)
through my distro.

My graphics card is a Radean RX 560, on which I use all three heads:
DisplayPort 1.2, HDMI and DVI.


Here is the issue:
------------------
At the beginning of the kernel boot process, the frame buffer fonts on all
three heads are normal size. But as soon as amdgpu takes over during the bo=
ot
process, the font on the DisplayPort changes to this:
1) the fontsize goes tiny;
2) only the upper-left quadrant of DisplayPort is used.

Fonts on the other two heads are unaffected.

When I disconnect the cables from HDMI and DVI, so that I only use DisplayP=
ort,
then fonts remain of a good size and the full screen area is used.

I attach the relevant output of lspci and dmesg, with all heads connected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
