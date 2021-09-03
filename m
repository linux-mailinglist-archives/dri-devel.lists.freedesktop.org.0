Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C026B3FFAB1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 08:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C0C6E848;
	Fri,  3 Sep 2021 06:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED8B6E848
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 06:52:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C3546108E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 06:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630651949;
 bh=32jy7zeKplfwA5WLz1QuKWV6OECJcIWZS/+Ek8O+aEc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uU3AumhXa62xOzQiOqPmLhuT3KHq3BtTUGc/KwBeuDOCgmgYJMCSHWVcgyMmn4wU3
 xBeoY426M6YKDtCXO5EtW27sZbqVfWgQG3W/ohoTeILpL7hbQYQAKvKiPAZQO3mD4O
 9SZQVunUG+xVUh1AO7EGEayWvYkHtWEKJlwiBL9GO4q+RWAkbCFlCRWjjLd5+c5+p/
 IlDoL2fTP9fGfp8g6HjBwpDbXE8XnUU6D11JQRyJEpqP4ev+z7v0Wb5KEvnrl7m2H2
 OS2cb+b5fVu730i/xGeUVBn8Qamu9SlppgB89zFJihMOgCtL2jVoPiCgl+jOV3QNFb
 tItj5XAHGkZnw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 797A160EB4; Fri,  3 Sep 2021 06:52:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 03 Sep 2021 06:52:28 +0000
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
Message-ID: <bug-211277-2300-Eg4riOgeE3@https.bugzilla.kernel.org/>
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

--- Comment #45 from Jerome C (me@jeromec.com) ---
Unfortunately this failed after 138 susp/resu


Thanks

Jerome

On 02/09/2021 22:24, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D211277
>
> --- Comment #44 from James Zhu (jamesz@amd.com) ---
> Created attachment 298651
>    --> https://bugzilla.kernel.org/attachment.cgi?id=3D298651&action=3Ded=
it
> A workaround for suspend/resume hung issue
>
> The VCN block passed all ring tests, usually the vcn will get into idle
> within
> 1 sec. Somehow it affected later amd iommu device resume which is control=
led
> by
> kfd resume. This workaround is to gate vcn block immediately when ring te=
st
> passed.
> It can fix the suspend/resume hung issue.
>
> Hi kolAflash,
> Please help check the WA in your setup. I will continue working on root
> cause.
> thanks!
> James
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
