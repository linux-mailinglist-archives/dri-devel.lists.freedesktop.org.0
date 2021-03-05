Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6C32EE10
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4126EB2E;
	Fri,  5 Mar 2021 15:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC70A6EB2E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:13:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9BB6D65090
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614957195;
 bh=YEn2hfVyHF9sQ/2P6OrCK8/lIiWgSWTJduASjpwuIEE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ImzbWMeLHZlfvsVfc/IB3iYZBcHdrOmgyC2dRPvPBkEzovjLGeSUxGimLduZME/Q+
 0udDnndHUxzINyBT2PGqZCD/DVIXbFxB+vZ8BIQWuGLffgKIG87T6s/LxtMMD6tP0B
 EOwsLKJtbWI9SzvS9iueIsnks5ocnCU44v+JsH2GmtfcPG+G2ZrWYWlf5bCXQ+hvmm
 jEc5N+H6a7bXP6TJEuYJR6yJdUmzUcutg/TZvBgfctk/oK4M80TluWw6H9GrAtMMPy
 9Ub36F4wXMydLDAAIYYbMNQrDXzdyLUkomOdHy0PEeGE+sHkzrbTd6BS7PgzP/KFFt
 kGilhuwS+g4gA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 92AE26530C; Fri,  5 Mar 2021 15:13:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 05 Mar 2021 15:13:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-cl69smBxPX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #13 from Jerome C (me@jeromec.com) ---
(In reply to kolAflash from comment #12)
> I've tried doing a bisect using this script. Unfortunately I couldn't
> reproduce the bug this way. So I bisecting will take a lot longer.
> 
> for i in {0..19}; do
>   echo -e "\n${i}"
>   /usr/sbin/rtcwake --seconds 15 --mode no
>   systemctl start suspend.target
>   sleep 15
> done

Hiya

I did some testing myself recently and unfortunately doing 20 tests was not
enough for me. I found that it could be 50 - 100 resumes before it would fail
so I capped mine at 150 resumes, there were too many times where things looked
fine for me with less than 50. After I tested kernels between 5.10.4 to
5.11-rc5 ( I didn't use 5.10.0 to 5.10.3 ) and found that this commit

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a10aad137326d137a969fc6cc3555992b99ff9fc

was causing the issue for me

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
