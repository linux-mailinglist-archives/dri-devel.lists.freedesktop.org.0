Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487445F214
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98A66F632;
	Fri, 26 Nov 2021 16:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (unknown [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5616F632
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:37:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2991E6023D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637944632;
 bh=FOG9U262QpePOWI4dcinGRoMqBB8dWgu+gfD58tlrXM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BpA3MiOmSliILB4pOlro/6LaTUbOYmAszEdWvjcHwuzdbYzV68a/2glNqdoRjpC6q
 4ZdsDZxLDHz51xHfvcnmlCQ11P4iYiLDeIRP0njhalA8EFX9rwUY8oNX3+MYehpkH0
 ArbDmvwkjq2RPqJrF0XZuDZgGfBPP+0l04F0Too8nJSHofzqDw3FepvV7ExsXdyjkB
 kj8SZzF66ugTQQNs+rMZRTtvl66d9b31sVFe6EYwhDCR5bmVUdcFKDFf86DK4sCUxp
 k+m5jxW+pyJEnC5LM6bkycojib1xHJtcmobEXlMQQXiGZMvVZ0Pv2VlaTW11m0E9yo
 lf12BgZ//O0eA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 266FE60F46; Fri, 26 Nov 2021 16:37:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 26 Nov 2021 16:37:11 +0000
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
Message-ID: <bug-211277-2300-lUWmmuLYMs@https.bugzilla.kernel.org/>
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

--- Comment #82 from James Zhu (jamesz@amd.com) ---
Hi @kolAflash,

 I don't have issue with your .config. on ubuntu 20.04

From source code, it should be fine.

$ grep -rn  "kgd2kfd_resume_iommu"  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkf=
d.h
309:int kgd2kfd_resume_iommu(struct kfd_dev *kfd);

$ grep -rn  "amdgpu_amdkfd.h\|kgd2kfd_resume_iommu"=20
drivers/gpu/drm/amd/amdkfd/kfd_device.c
31:#include "amdgpu_amdkfd.h"
604:    kfd->pci_atomic_requested =3D amdgpu_amdkfd_have_atomics_support(kg=
d);
>>>>792:        if (kgd2kfd_resume_iommu(kfd))
940:int kgd2kfd_resume_iommu(struct kfd_dev *kfd)


Looks we are using different 5.10, should we use 5.10 stable for adding this
backport patches?.=20
>>>>754 |  if (kgd2kfd_resume_iommu(kfd))
      |      ^~~~~~~~~~~~~~~~~~~~
      |      kgd2kfd_resume_mm
Best Regards!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
