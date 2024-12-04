Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9B9E3430
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 08:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6210EC1D;
	Wed,  4 Dec 2024 07:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t64at3gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2010EC1B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 07:39:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 671B4A41A30
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 07:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43A37C4CED1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733297945;
 bh=vr1rTZHPc014gCh8l7akpdoC0bpslb05/XW9TbVl/z0=;
 h=From:To:Subject:Date:From;
 b=t64at3gvY4o66Ymhys8hyo7mwRJRBsLKAXEFhumVZc8eZQxupcCfXbKa8Hew45o5O
 5PZTmB5ro5hAylcDO0t4IWY2IZvCE8r7A2QW9MeYEuAuZY3vOM8drAnGRJu1Scv5KX
 ecg+btNRQmQya2p4ZDi3ghZgOR5AWJWgwNf0/CG45r8yT4HPkABIWJvD2L+y2SVtDM
 eHqelfbCEHMEKsaaUI2mRO5eZUxa9fBuMO8qIWYJe3Dhx60MIY5nbzwJJnwuIwbYNJ
 XHKhhxY1T/2xcK8ocEnJq6nClEG7J8Fsou6olzLk0KlINSXhAJPPGSS/VHRWQMSo7Z
 MotoFEPsbkMwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 365F1C41612; Wed,  4 Dec 2024 07:39:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219556] New: AMDGPU monitoring is broken
Date: Wed, 04 Dec 2024 07:39:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression cf_bisect_commit
Message-ID: <bug-219556-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219556

            Bug ID: 219556
           Summary: AMDGPU monitoring is broken
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.13-rc1
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: i.r.e.c.c.a.k.u.n+bugzilla.kernel.org@gmail.com
        Regression: Yes
           Bisected 831c1926ee728c3e747255f7c0f434762e8e863d
         commit-id:

In 6.13-rc1, AMDGPU monitoring is broken. Many sysfs knobs simply output
nothing. For example:

# cd /sys/class/drm/card1/device
# <gpu_busy_percent
# <pp_dpm_sclk
# <pp_od_clk_voltage
# <hwmon/hwmon6/temp1_input

Otherwise the kernel log seems to be totally fine and GPU itself appears to
work normally.

I tried AMD GPUs of different generations, so it doesn't appear to be
series/model specific.

I have done a bisection though.

first bad commit: [831c1926ee728c3e747255f7c0f434762e8e863d] Merge tag
'uml-for-linus-6.13-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
