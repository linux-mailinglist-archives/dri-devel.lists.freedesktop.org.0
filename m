Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A7483668
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F338189330;
	Mon,  3 Jan 2022 17:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625C28972C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:51:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 063736112B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67824C36AF1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641232316;
 bh=wfJ5TlgeZ6bEpO+QAn5wdj3kEUNTUO6TsMkaz02+TN4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JFmrdTyOr++evYmV3UoeKb5JLAIgq0Lzm5udHAOk1hciZEKhQvhB1OUMn0Df4Ikui
 hUJ5E2ZOVd2LCgvTJ1/BEhh3wkVjQVRo6J+Mup1i309RHXx7RD/schHhIX3saubkHD
 GEOkIHlinHAGn5RFCSGiRRcgh2ulPYzrpkZ87k3uwtAbn+5m0AxQYwD8CqWpoWEYAw
 1IaWTQZC8XGQrkWX51naErGP6g3gBNYa6JIGmq7JiUzwVLqsjTI/sFX2n9TLXjdbIo
 kJ5r5pH8VIudAkoANTprXxlAP4UcuCSGMZ3baJaRbQ6tQRneDFVpwPlYHJRzNrVKaU
 nP7vgQx8i86lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5160AC05FC8; Mon,  3 Jan 2022 17:51:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Mon, 03 Jan 2022 17:51:56 +0000
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
Message-ID: <bug-215436-2300-Seg2UA8lkx@https.bugzilla.kernel.org/>
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

--- Comment #18 from spasswolf@web.de ---
The problem seems to be that rn_update_clocks tries to call
rn_vbios_smu_set_dcn_low power before adev->in_s0ix is set to 1 in
amdpgu_pmops_suspend:

Changes to rn_update_clocks:
dev_info(adev->dev, "adev->in_s0ix =3D %d\n", adev->in_s0ix);
//if (display_count =3D=3D 0 && (adev->in_s0ix || !hpd_state)) {
if (display_count =3D=3D 0) {
        dev_info(adev->dev, "calling rn_vbios_smu_set_dcn_low_power\n");
        rn_vbios_smu_set_dcn_low_power_state(clk_mgr, DCN_PWR_STATE_LOW_POW=
ER);
Changes to amdgpu_pmops_suspend:
if (amdgpu_acpi_is_s0ix_active(adev))
        adev->in_s0ix =3D true;
dev_info(adev->dev, "amdgpu_pmops_suspend: adev->in_s0ix =3D %d\n",
adev->in_s0ix);


[   36.010259] wlp4s0: deauthenticating from 54:67:51:3d:a2:e0 by local cho=
ice
(Reason: 3=3DDEAUTH_LEAVING)
[   36.043902] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 0
[   36.043904] amdgpu 0000:08:00.0: amdgpu: calling
rn_vbios_smu_set_dcn_low_power
[   40.015570] PM: suspend entry (s2idle)
[   40.239013] Filesystems sync: 0.223 seconds
[   40.239912] Freezing user space processes ... (elapsed 0.002 seconds) do=
ne.
[   40.242407] OOM killer disabled.
[   40.242407] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s)
done.
[   40.243513] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[   40.246850] amdgpu 0000:08:00.0: amdgpu: amdgpu_pmops_suspend: adev->in_=
s0ix
=3D 1
[   40.266376] queueing ieee80211 work while going to suspend

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
