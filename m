Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D030484405
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5310E4FE;
	Tue,  4 Jan 2022 14:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED87C10E4B5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:59:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D93ABB8160D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D6DEC36AF2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641308393;
 bh=CxPxiA3avQklZYKx1cZBBhSsCQuomZsfnOeLybxAsGo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rVYQKS3jlhfMFpT7nOlbo7F3sYYD6BStd3KSxzY/5lBxSi6q8AIibbyVTm5Ii2he5
 Lo9zT48jw31efB6u/Gkn5jI6MnwyMq9SRwewiV23PwVuj/EyKQ1ClcWLWkhF3J4tUm
 iv4rHl+sj0nF3enPP1HrCwXBP1BC44kuD88TCBjpF1+wf4He2F0cgafLeAYpL9AS4C
 qq6B7NonIQBfWhJV+chifMsXSMvd93SJFvbKEr32W2aCSEna8MBGo0QpwRChkfpvL6
 kWzytHJgN0Ufz/cRjHOqh5HF7y30tF5l1HzcBhyEhCDb5mCt9iESDih6WXgfL6bW8g
 GEXhhNI64ythg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7CD3EC05FCC; Tue,  4 Jan 2022 14:59:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 14:59:52 +0000
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
Message-ID: <bug-215436-2300-GlPVDOE3UE@https.bugzilla.kernel.org/>
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

--- Comment #24 from spasswolf@web.de ---
That's it! The extra call to clk_mgr_optimize_pwr_state now leads to
rn_update_clock being called with adev->in_s0ix =3D 1:


[   31.142514] wlp4s0: deauthenticating from 54:67:51:3d:a2:e0 by local cho=
ice
(Reason: 3=3DDEAUTH_LEAVING)
[   31.176805] amdgpu 0000:08:00.0: amdgpu: Calling optimize_bandwidth from
dc_commit_state_no_check
[   31.176815] amdgpu 0000:08:00.0: amdgpu: Calling update_clocks from
dcn20_optimize_bandwidth
[   31.176818] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 0
[   35.056209] PM: suspend entry (s2idle)
[   36.535688] Filesystems sync: 1.479 seconds
[   36.536404] Freezing user space processes ... (elapsed 0.024 seconds) do=
ne.
[   36.561024] OOM killer disabled.
[   36.561025] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s)
done.
[   36.562212] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[   36.566381] amdgpu 0000:08:00.0: amdgpu: amdgpu_pmops_suspend: adev->in_=
s0ix
=3D 1
[   36.566557] amdgpu 0000:08:00.0: amdgpu: calling update_clocks from
dcn21_optimize_pwr_state
[   36.566567] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 1
[   36.566569] amdgpu 0000:08:00.0: amdgpu: calling
rn_vbios_smu_set_dcn_low_power

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
