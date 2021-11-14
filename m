Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B244FB93
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17796E082;
	Sun, 14 Nov 2021 20:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ED46E088
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:31:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B0B7C6112E
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636921904;
 bh=Bdr4mkUC21qrHcz8Pj9pVNYf2YXhMhTqaPYh0izBU+E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dMDC4Y4b/nDKjzkfNdVwLvN1KWU/evJrMghTgQvY+ysyqQfqhXvc7B5DbPUBbmSyw
 59yt5yc4//iiIxa4Msl4oCPUrYuekVa7HGV3Z//75bCjV2LQAqmHVIjYVRKAD2i84/
 ZB9GnU/QIJyqkuR6m17VsHiQ1JG8udniQYEGyRQyihDACkIn5aTWeKNjW6h7qpHOQ4
 OcC250QHYtJjlJjLWThZl8FgSvRMyqwkl6knLlajK2qTtSsSM0CcBywKBVr3EdG6By
 9+3uxYTEw9CZMdL4ja5UdrimULyZXFBPpDQ1vnFFsufjl6bskMyMlzjXi/fYNhLVmy
 N21EgzOQoBnWQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A303A60F5B; Sun, 14 Nov 2021 20:31:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214921] amdgpu hangs HP Laptop on shutdown
Date: Sun, 14 Nov 2021 20:31:44 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-214921-2300-YWUyVjChSd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214921-2300@https.bugzilla.kernel.org/>
References: <bug-214921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214921

spasswolf@web.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.15, 5.15.1                |5.15, 5.15.1,
                   |                            |5.15.0-next-20211112

--- Comment #4 from spasswolf@web.de ---
This still bug is still present in the 5.15.0-next-20211112 where it breaks
suspend:

static int uvd_v6_0_suspend(void *handle)
{
        int r;
        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;

        /*
         * Proper cleanups before halting the HW engine:
         *   - cancel the delayed idle work
         *   - enable powergating
         *   - enable clockgating
         *   - disable dpm
         *
         * TODO: to align with the VCN implementation, move the
         * jobs for clockgating/powergating/dpm setting to
         * ->set_powergating_state().
         */
#if 0
        cancel_delayed_work_sync(&adev->uvd.idle_work);

        if (adev->pm.dpm_enabled) {
                amdgpu_dpm_enable_uvd(adev, false);
        } else {
                amdgpu_asic_set_uvd_clocks(adev, 0, 0);
                /* shutdown the UVD block */
                amdgpu_device_ip_set_powergating_state(adev,
AMD_IP_BLOCK_TYPE_UVD,
                                                       AMD_PG_STATE_GATE);
                amdgpu_device_ip_set_clockgating_state(adev,
AMD_IP_BLOCK_TYPE_UVD,
                                                       AMD_CG_STATE_GATE);
        }
#endif

        r =3D uvd_v6_0_hw_fini(adev);
        if (r)
                return r;

        return amdgpu_uvd_suspend(adev);
}
This makes suspend work again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
