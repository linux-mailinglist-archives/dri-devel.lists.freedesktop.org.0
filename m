Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51E441A53
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 12:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5655E89BFB;
	Mon,  1 Nov 2021 11:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFE189BF8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 11:01:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 47D2460FD9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635764466;
 bh=Bh6S6+TZwvMehjwPSjgy2VB/3C8posY4M4HqpPlxCtM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eH5aduhtd1JiwH2KMSqslrTfIvmLMesV35WLELuvK3gbtHkns8XxpSfQF+zzyDfHY
 xVTGPPvvYobrkU1J8PhGpfZumiPB3fKrUQNGM5SVriU7Fmh3dWyt/lnqa0aDj/CZqF
 MB2Vf9MEANskPd1fUGxYTO2cox/Pp/mL80Fv8GUvfoOOa+m5Wc0GN7+l9iq7bOZZ6k
 ASy4L4VJzMqZstziui3G2JOkE6AajtyjfWz3WwoiEpgmx/dIuz9PAxFKiseKUrrlh/
 FNvdXfPt6sC8hPh+0tnzd4WS/YVXdxgb3xus+hOcXDn5LoTOvY3xNLlANVUvoQmRSz
 Lru+A6pHelvtQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3CD1460FC0; Mon,  1 Nov 2021 11:01:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214901] amdgpu freezes HP laptop at start up
Date: Mon, 01 Nov 2021 11:01:06 +0000
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
Message-ID: <bug-214901-2300-YiaL4L3uht@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214901-2300@https.bugzilla.kernel.org/>
References: <bug-214901-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214901

--- Comment #4 from spasswolf@web.de ---
Just confirmed that removing the 3 lines
        r =3D amdgpu_amdkfd_resume_iommu(adev);
        if (r)
                goto init_failed;
can be used as a workaround. Removing only the if (r) check is not enough,=
=20
just calling amdgpu_amdkfd_resume_iommu(adev) leads to freezing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
