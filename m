Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC39387F35
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564966E0CC;
	Tue, 18 May 2021 18:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5406E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:04:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D71A61209
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621361053;
 bh=mbbgtZOJOKaPCJcZWifRFFuNaOBikx93E4NyTKe6sPs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AO0RMnSn7qhEJZbWY2B+KBIos+xVBZarXPf/nra0Rb47l9V68MkplVWjrRJACMLep
 ZgSIxxyFHoHgK9cqj3m3I6RoBVlLd+K3zPF8k8e9IJ0r6lQOJPrx859psCiTjDg6ts
 cFBUz7fccKMygWf4RHYQYUi8k+cwz6SpIeE/yVHqScZm9Jrd+Z7UJNfVyiEqAG0F+x
 qeks1VZBXheR4oQin+n0zNmMs/QHyujyoB7QDPtFEY0qZg0g27VmbnBopvMcKyGAhp
 PdSk7Ei4GARuOjB8bRkn+s57UO45/4HaHiLbS8M9+fHVJeNsg3eIyYEpgTrINe2xmP
 AZQa2fUEPUOvw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 222786124C; Tue, 18 May 2021 18:04:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 18:04:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-M7pdl2hFjm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #23 from James Zhu (jamesz@amd.com) ---
Hi kolAflash,=20
VCN IP is for video acceleration(for video playback), if vcn ip didn't hand=
le
suspend/resume process properly, we do observe other IP blocks be affected.=
 For
your case it is display IP(dm) related. ip_block_mask=3D0xff (in grub shoul=
d be
amdgpu.ip_block_mask=3D0x0ff) can disable VCN IP during amdgpu driver loadi=
ng. so
this experiment can tell if this dm error is caused by VCN IP or not.=20
sometimes /sys/kernel/debug/dri/0/amdgpu_fence_info  can provide some useful
information if it has chance to be dumped.
these experiments can help identified which IP cause the issue. So we can f=
ind
expert in that area to continue to triage. Your current report is case 2, s=
o it
can be replaced with=20
2. amd-drm-next-5.14-2021-05-12* with ip_block_mask=3D0x0ff, with Xorg and
without 3D acceleration in daily use.
I suggest you to execute your test plan in order 4->3->2->1.
Thanks!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
