Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DD7CA10D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 09:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F222F10E124;
	Mon, 16 Oct 2023 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2329310E124
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 52D38B80C80
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC6AEC433CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697442901;
 bh=B/hLK4cb/tuNZYNOMVeIiggeFdM5Lfrhx2/y8eDJfVs=;
 h=From:To:Subject:Date:From;
 b=EOmEpB2AMW+Fq1PZKwx7yT/NB1wd5NgA6Xqf6Ikuu99Ot6Yh4TDImxU8JTtpUNP7N
 MAqVcU9nXCKjqxvSyv5yetwDNlrBegfr5C4KaI2WxsT6exf3hZDkZfLEOG3k/WFAZi
 vLCzlr69WR+L74SFhCh6j/whVU+UrejTu56SnqCN2NRQaZYkMR8Q49LGxsRtXMr6ZV
 PMNkSJgBwFuj3jV3w7sr+TAPLMW2aQbyWnapbAssZXKiwbCLyLgrwTC8dO4t2xHapa
 yZO6IH4taJQ8T0Yiwf5I/QAYGSqM2MpB/lamBmVIkoceqWT4OT/QhjPzzrDiSteIH+
 +ntbf6hO68S/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 960A2C53BD3; Mon, 16 Oct 2023 07:55:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] New: amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Mon, 16 Oct 2023 07:55:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.zilka@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cc cf_regression
Message-ID: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

            Bug ID: 218015
           Summary: amdgpu powerplay: Spontaneous changes to
                    power_dpm_force_performance_level
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.57
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: roman.zilka@gmail.com
                CC: alexdeucher@gmail.com, christian.koenig@amd.com
        Regression: No

On an RX 6500 XT card I set
/sys/class/drm/card*/device/power_dpm_force_performance_level to
"profile_standard" before I start any game. That is to avoid overheating (9=
5+
=C2=B0C) which occurs quickly when the perf level is left at the default of=
 "auto"
(it's some sort of OC card) and impacts the GPU as well as the nearby mobo
components (I get a thermal warning in kernel log about the onboard audio
chip). The perf level setting spontaneously reverts back to "auto" at rando=
m,
however, and I'm forced to run a script which polls
power_dpm_force_performance_level and corrects it when necessary. This happ=
ens
0-10 times per hour while playing.

MSI Radeon RX 6500 XT MECH 2X 4G OC. Kernel 6.1.57, x86_64, Gentoo, gcc 13.=
2.1
20230826, X11, xf86-video-amdgpu-23.0.0, linux-firmware-20230919.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
