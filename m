Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59544E462
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFD86E91D;
	Fri, 12 Nov 2021 10:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2E66E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:10:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7908A61052
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636711802;
 bh=rTIGWYvB2I9sl2LfST45D+KjapXXb3dDxJrsVMhWWNE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GPkkt5RCcFaYvIJl5w105Ds9d6S2RrNoR3QsvrbFKI9R+duQixf/0Hc3Yio2ErUNa
 N5tUxbtfZhfjN4OnvMrb+TJ+yBJGvPfLWcEPBxCD61iuUfpBfcyrJezIrxgH07SyI5
 Q/+TI0IhBilVrIj7B1eSWiwWN5GcxxBoynTK5OBLvZ+ysqvMl9cvsnGERGL4KAQtzA
 4nbNXlWgZdoGJL3RXafLDVXe6TkJ6nsrQZTCYG+6garX1CvcFS2Ebt1zFH470Nnxuf
 wrCXcYkHgQuG1j6X1MFE+1PVO8d+0g8QHhjRR9hGjB66bSTXDPNFOTDUYpzvF4p0pa
 mD65alHM02jow==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 761B461102; Fri, 12 Nov 2021 10:10:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Fri, 12 Nov 2021 10:10:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-hIHITTJHPz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #18 from Lang Yu (Lang.Yu@amd.com) ---
Hi all,

I reproduced the issue. Thanks for Erhard F.'s work!

The problem is the pinned BO of last call to=20
amdgpu_display_crtc_page_flip_target() was not unpinned properly.


int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
                                struct drm_framebuffer *fb,
                                struct drm_pending_vblank_event *event,
                                uint32_t page_flip_flags, uint32_t target,
                                struct drm_modeset_acquire_ctx *ctx)
{
        struct drm_device *dev =3D crtc->dev;
        struct amdgpu_device *adev =3D drm_to_adev(dev);
        struct amdgpu_crtc *amdgpu_crtc =3D to_amdgpu_crtc(crtc);
        struct drm_gem_object *obj;
        struct amdgpu_flip_work *work;
        struct amdgpu_bo *new_abo;
        unsigned long flags;
        u64 tiling_flags;
        int i, r;

        work =3D kzalloc(sizeof *work, GFP_KERNEL);
        if (work =3D=3D NULL)
                return -ENOMEM;

        INIT_DELAYED_WORK(&work->flip_work, amdgpu_display_flip_work_func);
        INIT_WORK(&work->unpin_work, amdgpu_display_unpin_work_func);

        work->event =3D event;
        work->adev =3D adev;
        work->crtc_id =3D amdgpu_crtc->crtc_id;
        work->async =3D (page_flip_flags & DRM_MODE_PAGE_FLIP_ASYNC) !=3D 0;

        /* schedule unpin of the old buffer */
        obj =3D crtc->primary->fb->obj[0];

        /* take a reference to the old object */
        work->old_abo =3D gem_to_amdgpu_bo(obj);
        amdgpu_bo_ref(work->old_abo);

        obj =3D fb->obj[0];
        new_abo =3D gem_to_amdgpu_bo(obj);

        /* pin the new buffer */
        r =3D amdgpu_bo_reserve(new_abo, false);
        if (unlikely(r !=3D 0)) {
                DRM_ERROR("failed to reserve new abo buffer before flip\n");
                goto cleanup;
        }

        if (!adev->enable_virtual_display) {
                r =3D amdgpu_bo_pin(new_abo,
                                  amdgpu_display_supported_domains(adev,
new_abo->flags));
                if (unlikely(r !=3D 0)) {
                        DRM_ERROR("failed to pin new abo buffer before
flip\n");
                        goto unreserve;
                }
        }

        ......

}

Regards,
Lang

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
