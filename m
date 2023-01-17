Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE466E23C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 16:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB2810E571;
	Tue, 17 Jan 2023 15:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5813E10E571
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 15:34:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C308DB81658
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 15:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 719CAC43392
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673969646;
 bh=dKo2M1F/bCl0TXDwzFxF9VdEHnoZYEdP0mLXJeSm/dk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=r9Ndj3gsMjgibrOJkZ5OPkk5aw3UEmhINgMuEgMCbWQhgmfj+ct/mBIYnAYHbLm5Z
 s87KOUH/sJpof7HR6bTjaT2Hk1ANWGSJSQaZvQs/g0UHtUwKrtFY6FKvGEE/GSuPLi
 mhJtp/1ooJ5vkPp9OD6u42lNDr7wXQDKfvDr8saX8aQpHJqIwG9f1EpYIHlAIaNqNO
 GqNxNyWoP4+XctEP18o5/HHPQti4+KLNKspBmlL4X8g8a2MwIW1T5e19Lbvo0kyuRh
 ApJweDa8yW6aNa1QmgkGMGAZeqLqbt+jPg6zfMyJ0g1XHjF0+bJQAbS3YP2rDU+VoN
 5iqHDVO0Eamww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5AEEEC004D5; Tue, 17 Jan 2023 15:34:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Tue, 17 Jan 2023 15:34:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrf@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-qN8GPvTybU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #25 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to Alex Deucher from comment #23)
> I'll just revert it.  It is more important for kernels with the the
> drm_buddy changes.

Would the following be equivalent to what you intended with your commit?
Looks a bit awkward but hibernate/resume work with it for 6.0.19 (and a Ryz=
en
5600G):


uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
                                            uint32_t domain)
{
        if (domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT))=
 {
                domain =3D AMDGPU_GEM_DOMAIN_VRAM;
                if ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_ty=
pe =3D=3D
CHIP_STONEY)) {
                        if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRESHO=
LD)
                                domain =3D AMDGPU_GEM_DOMAIN_GTT;
                }
        }
        return domain;
}


Let me know whether this is worth persuing. I could then test it with 5.15.=
88
and 6.1.6.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
