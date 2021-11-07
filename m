Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108B447670
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 23:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891296E5BE;
	Sun,  7 Nov 2021 22:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFCC6E5BE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 22:48:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A61F76139E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 22:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636325331;
 bh=P21O1C5MfLAGWDyiOF+OHD74S3lOVBG6x76z4HENNKQ=;
 h=From:To:Subject:Date:From;
 b=WMQ9fdZpqEpku/w6H8DIOiOuxNNm9O6Lr4Gncwkzj6h4fKcElH1bfTQoibxTBvDMG
 kD68fWbMGVloV0d40cLnq7L0HknA2BcY+l7icYuqFK8y70oi/eZHM38dkrhzuPNGIB
 au0mUUAGSivLsZuar0Myf0tMkelcAbGZ3hYqAgRisofFLgFKhVeZ6kzkx9H79I9Ern
 DXgUIqVMxHMbP1aDeE5W95IdFGuipOBXeMbiki+kIOk3OwxMO495FE5dIli7/26+m5
 8JMkLXYwsIGHMVwztp5p8rASTyjn3DguqubFFpRaow4fwlO0lSmHVS9CyeoDohciS4
 mtIGMSV0ER0qA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9BCC960FE7; Sun,  7 Nov 2021 22:48:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214963] New: [amdgpu] resuming from suspend fails when IOMMU is
 missing
Date: Sun, 07 Nov 2021 22:48:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214963-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214963

            Bug ID: 214963
           Summary: [amdgpu] resuming from suspend fails when IOMMU is
                    missing
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.0, 5.15.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: spasswolf@web.de
        Regression: No

On the HP bw064-ng Laptop the BIOS does not correctly initialize the IOMMU.
This brakes resuming from suspend:
Nov  7 23:23:02 bart kernel: [   96.378265] kfd kfd: amdgpu: Failed to resu=
me
IOMMU for device 1002:9874
Nov  7 23:23:02 bart kernel: [   96.378271] amdgpu 0000:00:01.0: amdgpu:
amdgpu_device_ip_resume failed (-6).
Nov  7 23:23:02 bart kernel: [   96.378274] PM: dpm_run_callback():
pci_pm_resume+0x0/0x110 returns -6
Nov  7 23:23:02 bart kernel: [   96.378283] amdgpu 0000:00:01.0: PM: failed=
 to
resume async: error -6

leading to the follow up errors:
Nov 7 23:23:03 bart kernel: [   97.580799] [drm]
perform_link_training_with_retries: Link training attempt 1 of 4 failed
...
Nov  7 23:23:04 bart kernel: [   98.646241] [drm]
perform_link_training_with_retries: Link training attempt 2 of 4 failed
...
Nov  7 23:23:05 bart kernel: [   99.709472] [drm]
perform_link_training_with_retries: Link training attempt 3 of 4 failed
Nov  7 23:23:06 bart kernel: [  100.772840] [drm] enabling link 0 failed: 15
Nov  7 23:23:22 bart kernel: [  106.160854] [drm:amdgpu_dm_atomic_commit_ta=
il
[amdgpu]] *ERROR* Waiting for fences timed out!
Nov  7 23:23:22 bart kernel: [  116.397484]
[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:47:crtc-0] flip_do=
ne
timed out

Simply changing the amdgpu_device_ip function in
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c to
static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
{
        int r;

#if 0=20
        r =3D amdgpu_amdkfd_resume_iommu(adev);
        if (r)
                return r;
#endif

        r =3D amdgpu_device_ip_resume_phase1(adev);
        if (r)
                return r;

        r =3D amdgpu_device_fw_loading(adev);
        if (r)
                return r;

        r =3D amdgpu_device_ip_resume_phase2(adev);

        return r;
}
makes resuming from suspend work for me again. But of course this is not a
viable solution as on systems with working IOMMU this is needed.
One could probably add a flag so that in case of missing IOMMU
amdgpu_amdkfd_resume_iommu returns 0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
