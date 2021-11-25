Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E745E0CB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 19:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CD86E043;
	Thu, 25 Nov 2021 18:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297E6E043
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 18:58:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B85D86113B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637866690;
 bh=xjT3ayDlVkNN2roaifqpbZ+Ny0h//KoHjV+TMYbmZxw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Zn3EyZ673SzcE68yhQ/5KKKNK0op+xKXaa+IB8QKrf8Ci/cDkCCL3ufC3M6/RGNEj
 aLECvdw83Zlr63IgMRLcjiuQShSj2Dpcz1R2UXYp0oy2CBr1X2TsBY3T3j2SnilXk2
 3ud2MfDYoXLAvG4PPlBmNNL8TCiQWHfrp3MnvaOCqaWaOMjGfzcc6yoBSN9aDheOIH
 5xiai54biJhJ3Z/G9/+WAuunaN4XGYPY5q2uh4GcYU5aribqkpC0AKCQLDA+QGq1T9
 KafwhtMyLr6y3rV2q27YZ0hcmutWJFmqtUBj8PN3CycmY9JFH4+swoACaoVWjxdoIU
 vvRyfNRlQge1A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B4F0E60EE8; Thu, 25 Nov 2021 18:58:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 25 Nov 2021 18:58:10 +0000
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
Message-ID: <bug-211277-2300-OrrECYjsf4@https.bugzilla.kernel.org/>
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

--- Comment #79 from kolAflash (kolAflash@kolahilft.de) ---
@James

Got this when compiling with Linux-5.10.81:

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.c: In function
=E2=80=98kgd2kfd_device_init=E2=80=99:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.c:754:6: error: implicit
declaration of function =E2=80=98kgd2kfd_resume_iommu=E2=80=99; did you mean
=E2=80=98kgd2kfd_resume_mm=E2=80=99? [-Werror=3Dimplicit-function-declarati=
on]
  754 |  if (kgd2kfd_resume_iommu(kfd))
      |      ^~~~~~~~~~~~~~~~~~~~
      |      kgd2kfd_resume_mm


Patching 5.10.81 was without problems:

$ patch -p1 -i
../../backport_patch/0001-drm-amdkfd-separate-kfd_iommu_resume-from-kfd_res=
ume.patch
patching file drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
patching file drivers/gpu/drm/amd/amdkfd/kfd_device.c

$ patch -p1 -i
../../backport_patch/0002-drm-amdgpu-add-amdgpu_amdkfd_resume_iommu.patch
patching file drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
patching file drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h

$ patch -p1 -i
../../backport_patch/0003-drm-amdgpu-move-iommu_resume-before-ip-init-resum=
e.patch
patching file drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

$ patch -p1 -i
../../backport_patch/0004-drm-amdgpu-init-iommu-after-amdkfd-device-init.pa=
tch
patching file drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

$ patch -p1 -i
../../backport_patch/0005-drm-amdkfd-fix-boot-failure-when-iommu-is-disable=
d-i.patch
patching file drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
patching file drivers/gpu/drm/amd/amdkfd/kfd_device.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
