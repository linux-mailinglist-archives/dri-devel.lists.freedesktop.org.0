Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2035484482
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BEC10E265;
	Tue,  4 Jan 2022 15:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534D10E265
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:27:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 774D6B816BF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ACA1C36AF4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641310059;
 bh=vA726MlerYdUJeYtsagDGsupsOVlf9ozzU4tZwN+9GQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lp2ZuSwjhz5SR3NV8ZCvfSPkJ1Vzbq9SYFvWPDm2PL2Tqau01zoR2AdUPcG+rZLw9
 oumZ76f1IX50bXWZ2qFOI3OBUtb1Ne7utH67jyBbhGcBmVmEjn9FdC/eLvu1gB/WGL
 vaW2AscN10Y6bWNnVeduoBc+Pni2+R/bCQUiwdEYnmWVFSRuwOpou2Jp9bSKoCtzz/
 F9bcADpzBqSvlhBc+XBG2g01fWElcrwasBL9y+0lPmUN9u8xgllM99s/jhTIzL5r/2
 GW6f404P1mQIOJc9ZPV861X7PHp80KBLeSNEOHB8r7PSAWgJr8c19aYWgnqMVieT5N
 IbgVqdOStGTcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 196CEC05FCB; Tue,  4 Jan 2022 15:27:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 15:27:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-hBhYp0R9mv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #26 from spasswolf@web.de ---
For the extra call hpd_state =3D 0:
[   30.684201] wlp4s0: deauthenticating from 54:67:51:3d:a2:e0 by local cho=
ice
(Reason: 3=3DDEAUTH_LEAVING)
[   30.794571] amdgpu 0000:08:00.0: amdgpu: Calling optimize_bandwidth from
dc_commit_state_no_check
[   30.794609] amdgpu 0000:08:00.0: amdgpu: Calling update_clocks from
dcn20_optimize_bandwidth
[   30.794613] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 0, hpd_state =
=3D 1
[   35.026604] PM: suspend entry (s2idle)
[   35.256153] Filesystems sync: 0.229 seconds
[   35.257044] Freezing user space processes ... (elapsed 0.002 seconds) do=
ne.
[   35.259636] OOM killer disabled.
[   35.259636] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s)
done.
[   35.260642] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[   35.264212] amdgpu 0000:08:00.0: amdgpu: amdgpu_pmops_suspend: adev->in_=
s0ix
=3D 1
[   35.264369] amdgpu 0000:08:00.0: amdgpu: calling update_clocks from
dcn21_optimize_pwr_state
[   35.264379] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 1, hpd_state =
=3D 0
[   35.264381] amdgpu 0000:08:00.0: amdgpu: calling
rn_vbios_smu_set_dcn_low_power

So one could go back to the old version of rn_update_clocks with=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
if (display_count =3D=3D 0 && !hpd_state) {

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
