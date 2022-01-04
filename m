Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365C4840C7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 12:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD610E22E;
	Tue,  4 Jan 2022 11:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F76310E22E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:27:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A580B6131C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18459C36AF4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641295658;
 bh=onPMDw7fDjUw5QgNja4dguXpmc7yswgiiFmH0OiL2vI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FGarv7KQITFegT8+zozZComcbwRQ4Y2wCdOeHjYs+adT+R1Ix7DpOFOPzU6XKXL0v
 RiHWvIo4TJcWB+4LlJ2w6o5gQldSkWao2rdBdDah5k2IzVPPDTBjJcLgQ+cexHXAH6
 iwWE6xSJN/WKtpMneVc7nbQyUqp/dv54uJL3O89qo+yEsTH5EbsXhyYzO9qz9pgsPb
 cpwW2fPv3IxvJzOm1SUkhTAx6BFLfFTFrsQKOSgn6xeJiZsS6wksnw17t2XzSvVHyd
 k9cCFBBYZJxl5JsUevjIGJHm2iVlGHC8MmbCxdndtm4tT/R5zLk36eMg6GfQu4rNnJ
 lQKV0RAkOetNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EDF36C05FDD; Tue,  4 Jan 2022 11:27:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 11:27:37 +0000
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
Message-ID: <bug-215436-2300-hoV1WL6UyZ@https.bugzilla.kernel.org/>
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

--- Comment #22 from spasswolf@web.de ---
I get similar message if I just lock the screen which then switches off:
[ 1732.526162] amdgpu 0000:08:00.0: amdgpu: Calling dc_commit_state from
amdgpu_dm_atomic_commit_tail
[ 1732.640992] amdgpu 0000:08:00.0: amdgpu: Calling optimize_bandwidth from
dc_commit_state_no_check
[ 1732.641005] amdgpu 0000:08:00.0: amdgpu: Calling update_clocks from
dcn20_optimize_bandwidth
[ 1732.641007] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 0
[ 1732.641008] amdgpu 0000:08:00.0: amdgpu: calling
rn_vbios_smu_set_dcn_low_power

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
