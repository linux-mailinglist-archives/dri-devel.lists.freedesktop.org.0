Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E745FE84
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 13:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2986E199;
	Sat, 27 Nov 2021 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 406 seconds by postgrey-1.36 at gabe;
 Sat, 27 Nov 2021 12:21:37 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7936E199
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 12:21:37 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14B1260929
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 12:14:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 58AD960C41
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638015290;
 bh=xSDr1FExr39+krBY2raW2cIZ/Z3VfJRUynzTZUwaZGo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JeChi8sygyy9+wMYygRhSAk9z+nZDpiRayswtPVAZNd1OuyqE/J5D5ENn1xjlqNv3
 Mqm5SWXmED6amDDUB9B0RwY0VY3HRFZ9tEeiW84YCJu5Uxh8ngGNfwUoWbmm+mrGPe
 H+P+WH3L2snnZHFYh7bujF/Ol0iu2k7kD4HHSQ3OWnxUPK81/VGdZ0H9KsKVfcoeUe
 KQRJY2T0YYs7owyQzTUExFJ8AX90istoFFLD88wOhqbYYgM+neHac+lHuer+JtPQ9l
 72k1Agt+BWiGPM4Ywn/Ae8jdO5f8f1MjPzNpDVA0uQIytih6UjbHc9poOk27RRJm30
 KoKCJ8Y1dDp8A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5502061001; Sat, 27 Nov 2021 12:14:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Sat, 27 Nov 2021 12:14:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-Y2E1IqON6R@https.bugzilla.kernel.org/>
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

--- Comment #83 from kolAflash (kolAflash@kolahilft.de) ---
Hi James,

(In reply to James Zhu from comment #82)
> [...]
> $ grep -rn  "amdgpu_amdkfd.h\|kgd2kfd_resume_iommu"=20
> drivers/gpu/drm/amd/amdkfd/kfd_device.c
> 31:#include "amdgpu_amdkfd.h"
> 604:  kfd->pci_atomic_requested =3D amdgpu_amdkfd_have_atomics_support(kg=
d);
> >>>>792:        if (kgd2kfd_resume_iommu(kfd))
> 940:int kgd2kfd_resume_iommu(struct kfd_dev *kfd)

the line numbers you're quoting are for Linux v5.12.19
(0e6f651912bdd027a6d730b68d6d1c3f4427c0ae) + the attachment-299697 patch.


> Looks we are using different 5.10, should we use 5.10 stable for adding t=
his
> backport patches?.=20
> >>>>754 |  if (kgd2kfd_resume_iommu(kfd))
>       |      ^~~~~~~~~~~~~~~~~~~~
>       |      kgd2kfd_resume_mm

I'm testing with Linux v5.10.80 (f884bb85b8d877d4e0c670403754813a7901705b) +
the attachment-299697 patch.
And there it's line number 754.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
