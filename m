Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029482B418
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 18:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC9810E98A;
	Thu, 11 Jan 2024 17:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C2910E966
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:30:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8B0E2B81F63
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFF48C43601
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 17:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704994234;
 bh=LW8VXw9J4wJNTWJHH7yePLOztGJmT5soBFwftkPqXrA=;
 h=From:To:Subject:Date:From;
 b=SD1K5nE2Ag+BxvKFmOAkNQvMVus44RqAsNpxDdSbzOIV19/EOVpbckY9y+UFOewcJ
 YiV0UwB1Oa3zabhvRYuiqLMydeSjV+XDLwa3ZRsrZCyY36bHfQuGlXNuA0YZyyWXS2
 Ri9g7HK7tnwOrABb94hagLNulCeaU/loL9msfC8DGMvTH6GAvs2ssQOzrfKXX6GcZP
 eTUhtAVD8q6qZpaGa1bDSGuSMO1i3EAFLc4JAKZ4IOGXYr3PYFeh/MO8mwOnsS3ujK
 nT+Lsf+Q9e43cz5bBmI1LjPmIyiouKVsfwHP03zMcMJVFE6xY+VYlMdZoHEuQXZ1p4
 9rF807Rv1j0PQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CBA33C53BCD; Thu, 11 Jan 2024 17:30:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218368] New: amdgpu crashes on loading on both kernel-6.6.9 and
 kernel-6.1.69 at cold boot
Date: Thu, 11 Jan 2024 17:30:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nvaert1986@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218368-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218368

            Bug ID: 218368
           Summary: amdgpu crashes on loading on both kernel-6.6.9 and
                    kernel-6.1.69 at cold boot
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: nvaert1986@hotmail.com
        Regression: No

The amdgpu driver crashes frequently whenever I cold boot my system. The is=
sue
has not occurred so far when rebooting the system. I can see the screen (wh=
en
efifb is running) and then as soon as amdgpu is loaded my screen goes blank=
. I
press ctrl - alt - del to reboot the system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
