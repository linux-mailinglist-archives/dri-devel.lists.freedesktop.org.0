Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B220F40D9AA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 14:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314AC6EB74;
	Thu, 16 Sep 2021 12:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE206EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:17:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 23EB260E90
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631794679;
 bh=xoXqIopxpxVoJkyUcVFtI1H2bdHGFH3sGI9I2d7xg0Q=;
 h=From:To:Subject:Date:From;
 b=LxLZXUNTcZ+ysX69x0lqUbNnCB1aOSb8wqYK/y0j2uY0zoGU1MkKqpd7FqIdGgv5G
 orI4B9f41jRLnIMz0WgU6zpCzEDYEqXiNSae/kSHSAOLWh1U/zsss9Yx2n556xKt2u
 sbdijZ3/pkAaUtufVf81ROn+eDujQmGXGidzoRsZUMwhw15MeEogjFkr/OxG/vL5rs
 l2eI+IR4QmZpiKnv3Z10KuyIZ7lsPN3VAiAh/yTJqcx/G45FUKpcnhl7IFaX6Wg2JP
 nHPu0TKtNLb/hzlTBC4i+1ZX92sbE8of1mocuTwG1qC1gj2cKJ9IJs0bo9Y+J3YPyD
 RP1Qm+wHXUMQQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1A6B7610CA; Thu, 16 Sep 2021 12:17:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214431] New: [AMDGPU] Graphic lockups and various ECC errors on
 Radeon VII
Date: Thu, 16 Sep 2021 12:17:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214431-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214431

            Bug ID: 214431
           Summary: [AMDGPU] Graphic lockups and various ECC errors on
                    Radeon VII
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.0
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ted437@gmail.com
        Regression: No

Created attachment 298837
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298837&action=3Dedit
Lockup while using an internet browser

Not a kernel programmer or good at tracing issues, but I'll do my best. I
orignally posted here https://bugzilla.kernel.org/show_bug.cgi?id=3D211277 =
but
was told to post a new bug. I'll bring some context.

Radeon VII on Fedora 35 Kernel 5.14.0. Issues introduced in 5.14.0-rc7. 3
monitors connected via 3 Display Port connections. Power managment seems to=
 be
borked as well as I can hear my fans ramp up at different times. Grahpic
lockups typically happen monitors suspend or waking up from sleep. Today I =
had
one during regular usage. Booting with `pci=3Dnoats` reduces the graphic
artifacts noted here -- https://bugzilla.kernel.org/show_bug.cgi?id=3D21127=
7#c48

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
