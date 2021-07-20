Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272D73CFEC3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 18:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCA789954;
	Tue, 20 Jul 2021 16:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F92891CE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 16:08:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CD86F610D2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626797318;
 bh=dApPVcBB/jtfRPotj6kpFRV5fB4trfyYQu7F8ZK0VcY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gB6pKtOj0FmK/1CEoBL828eW/2QKFI00laYFpSRM9ltWJWJDpMGTccVrAp11W2VYm
 uwWG7Q6KcT+ajZYB2H7OiaXjPXCltMvQYn/Z7HHMy0MVfD5PtCILCYPKDqoTyfcDrq
 gmt3qGWcesTKJP5NFrTwdPXmXxvxI8KP42CSZatEjx9a2FNf8g98DRxaUar+0WZ1Xa
 YRNzNwEbYKeh8ezROeF7HC6GaBRnfWsh5tjwA8ffZusHm+7xIPcmN7wnmrVj3filJt
 gJKnn4tWq6qUnM0iI5c2TgG901PvOVgbrm7jrbcnsE5gh4DDP2fO1/hP+MtmL0nxqW
 w63bCPzOAmaMg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C5BE361205; Tue, 20 Jul 2021 16:08:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213715] failed to change brightness of HDR panel on AMD
 GREEN_SARDINE through aux
Date: Tue, 20 Jul 2021 16:08:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213715-2300-yYHb1CQ5q7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213715-2300@https.bugzilla.kernel.org/>
References: <bug-213715-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213715

mario.limonciello@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #2 from mario.limonciello@amd.com ---
I would suggest to work with BOE and CSO to fix the DPCD values in panel
firmware to not report aux control if it is not functional.

You can see the kernel checks the DPCD to determine whether to use AUX or P=
WM.

https://github.com/torvalds/linux/blob/c010efb7f0bc0c3cb2cd26b000f71d4bd0c4=
27cd/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L2433

BTW this behavior has been also been reported in the past, so a heuristic m=
ay
be introduced at some point in the future for the buggy panel firmware:
https://gitlab.freedesktop.org/drm/amd/-/issues/1438

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
