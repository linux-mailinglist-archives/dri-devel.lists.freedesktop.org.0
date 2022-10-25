Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5360D100
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 17:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027A810E3D7;
	Tue, 25 Oct 2022 15:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC62310E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30A2E619E4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF6FC433D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666713124;
 bh=DbE697BXw7Cl3QkziQMPiDWOnp+fyQ+L/4yEQMqvaVc=;
 h=From:To:Subject:Date:From;
 b=J/K5MmyKoq2XJ/jSKVDMjnFA53rBMWUGxQ47+aAtaGw3ZZdk0w4rOjt4wygPgQhfA
 XMFuQGDKYQkVObm7TxLfcUZljDMcK4AIRpuilfE5r+p17J+d1owuOefkb+N8/96vZv
 daCGY07jF8cRsHJawZ13mI6g/kRU4RVErfgmXmQJDFCYGKAIq9GjE9/6+YG3owSfrj
 +JZK0NDGAuoEdCEJgSOEJr0f6qJvjFLPKVuBVYFrAd9G6G2cR1EeXu86NovYhfyzBW
 Ccoj8/7lLiw7Jd32cbgIqNK9h3TAqt1XnqN9H/MoK2s9ZdDBD2rKxeeNEPe1oed5f2
 FeG/2gFJxkcEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7AB2FC433E6; Tue, 25 Oct 2022 15:52:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] New: [regression] GPU lockup on Radeon R7 Kaveri
Date: Tue, 25 Oct 2022 15:52:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

            Bug ID: 216625
           Summary: [regression] GPU lockup on Radeon R7 Kaveri
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.16-100.fc35.x86_64
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: pierre-bugzilla@ossman.eu
        Regression: No

Created attachment 303084
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303084&action=3Dedit
dmesg since problems began

Ever since I upgraded from Fedora 34 to Fedora 35 I've gotten random GPU
lockups. This machine has otherwise been stable for years.

I don't really know what triggers the issue. I *think* it happens in some c=
ases
when I try to play a video in Firefox, but I'm not completely sure.

Reported here, but Fedora generally don't give any attention to GPU driver
issues:

https://bugzilla.redhat.com/show_bug.cgi?id=3D2131923

Last working system:

  kernel-5.13.8-100.fc33.x86_64
  libglvnd-1:1.3.3-1.fc34.x86_64
  mesa-libGL-21.1.8-3.fc34.x86_64
  libdrm-2.4.109-1.fc34.x86_64
  xorg-x11-server-Xorg-1.20.14-3.fc34.x86_64

First broken system:

  kernel-5.19.8-100.fc35.x86_64
  libglvnd-1:1.3.4-2.fc35.x86_64
  mesa-libGL-21.3.9-1.fc35.x86_64
  libdrm-2.4.110-1.fc35.x86_64
  xorg-x11-server-Xorg-1.20.14-7.fc35.x86_64

Attached is all kernel logs since the issue started happening. It also incl=
udes
a fresh boot from the last good kernel, and a good run with the new kernel.

I think that first run with the new kernel was just a fluke, though. The on=
ly
package upgraded after the system upgrade and before the lockups started is
annobin.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
