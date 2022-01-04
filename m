Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA548409E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 12:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C111810E1DA;
	Tue,  4 Jan 2022 11:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C990710E1DA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:15:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47FA26133B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B369BC36AF3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641294911;
 bh=Wi4k8PV0jWc+h3FT6LgjEh/6Cq1OumVtVbqvqcM/twA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bk88CXi1cwyl/Wci+nNtZzfdF+IpTRWgt4AqLZvfltoZ+NxuRway1xCgMF1xORNRx
 SgyN+JtaWdMN1QBGtzodkOA08gM2cTZrMVWaZw4X1JAhvqWnTrtYrhkPIDWhQLsVAX
 9iI+2zD/w0pw5e+nByyW2TZcxyT4hC5ciYrslynWNiL0yjetr8Y+PkIM3r+zG8lr8a
 HV/L+fh/7GZr0g4GHf/GypgDHIP1YfXfQxp+jU/u7rRRd4RZzq2vwnwaL1UCtuE5KZ
 j0++ePd1cNYTlx6oBLLTJcxFp5oT1g09gb7xcqEtciOF+WqvpCPCTWebvM/F1VjHwA
 1lncwP+hshV5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A3AB2C05FDC; Tue,  4 Jan 2022 11:15:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Tue, 04 Jan 2022 11:15:11 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215436-2300-p6vT7TbgFM@https.bugzilla.kernel.org/>
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

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #300223|0                           |1
        is obsolete|                            |

--- Comment #21 from spasswolf@web.de ---
Created attachment 300224
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300224&action=3Dedit
new debuggin patch

Seems the call trace of rn_vbios_smu_set_dcn_low_power is
amdgpu_dm_atomic_commit_tail -> dc_commit_state -> dc_commit_state_nocheck =
->
dcn20_optimize_bandwith -> rn_update_clocks -> rn_vbios_smu_set_dcn_low_pow=
er

  53.562322] amdgpu 0000:08:00.0: amdgpu: Calling dc_commit_state from
amdgpu_dm_atomic_commit_tail
[   53.562426] amdgpu 0000:08:00.0: amdgpu: Calling dc_commit_state from
amdgpu_dm_atomic_commit_tail
[   53.563183] wlp4s0: deauthenticating from 54:67:51:3d:a2:e0 by local cho=
ice
(Reason: 3=3DDEAUTH_LEAVING)
[   53.673655] amdgpu 0000:08:00.0: amdgpu: Calling optimize_bandwidth from
dc_commit_state_no_check
[   53.673669] amdgpu 0000:08:00.0: amdgpu: Calling update_clocks from
dcn20_optimize_bandwidth
[   53.673672] amdgpu 0000:08:00.0: amdgpu: adev->in_s0ix =3D 0
[   53.673673] amdgpu 0000:08:00.0: amdgpu: calling
rn_vbios_smu_set_dcn_low_power
[   53.674562] amdgpu 0000:08:00.0: amdgpu: Calling dc_commit_state from
amdgpu_dm_atomic_commit_tail

This seems to be not really connected to suspend.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
