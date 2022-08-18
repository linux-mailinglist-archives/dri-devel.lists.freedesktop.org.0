Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B0598AEB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50510E12D;
	Thu, 18 Aug 2022 18:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A49A10E098
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:14:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B762EB82370
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71C64C433D6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660846453;
 bh=CI+6UZ9H6BiROO7eMbYJm5bkvIYLJ6cRiTHC+1UTGgQ=;
 h=From:To:Subject:Date:From;
 b=NHn7BNWHsNVcXdzOouAyX8/D1Ct2d5bg8MLxNfPkaCHohVPkIbRnUpfwXoBB2PH84
 GLZUWlaRyr5DbxZe0Hlg+OgHFxPq5XXVnvrTpU4lO0riLvWrOWvsEI37WTfTEyLoXF
 fKx2EMzu3BPSlcLrY6CdxlBMC9Kzp/34tTbQ/la/CzwP+4yALWHc/rD5dzaq5EgskT
 ZmSdSlJxdZyQ8i6B7gn4z7ihoxTwvtwix/hqmFGOANk5as0+rmuY1ZrodzAVZatV/O
 XeMwF5d9gpDMi3XS1UWPawDrzgI4fdnR9chW9hb9Qmep5O2RY4vi75wKbxOfDtu81d
 ca3Fm/Qm8NcLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4CC6FC433E7; Thu, 18 Aug 2022 18:14:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216376] New: AMDGPU: display output disables and quickly
 reenables when switching AVR into/from standby doing HDMI passthrough
Date: Thu, 18 Aug 2022 18:14:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jlp.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216376-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216376

            Bug ID: 216376
           Summary: AMDGPU: display output disables and quickly reenables
                    when switching AVR into/from standby doing HDMI
                    passthrough
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jlp.bugs@gmail.com
        Regression: No

Created attachment 301600
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301600&action=3Dedit
dmesg

I have A PC with Radeon RX480 which has HDMI output connected to HDMI input=
 on
Marantz SR5015 AV reciever and there the HDMI output goes to a TV (Panasonic
TX-55CX200E). The DVI output is connected to an LCD monitor. The AVR has the
feature to pass through HDMI signal when put into standby mode. When I swit=
ch
AVR from/to standby mode it looks like it for a very short time interrupts =
the
connection from PC to TV and during this time it appears that the video card
output turns off and monitor layout is re-aranged to one screen (DVI) only =
and
then almost immediately back two previous dual screen layout. Would it be
possible to delay turning off the HDMI output for a bit longer so that it w=
ould
wait long enough that AVR would reconnect entire HDMI path to TV back again=
 and
the HDMI output on video card would not need to be turned off and keep send=
ing
output in the meantime? So that the display layout configuration would keep
being in dual-screen mode for the whole time?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
