Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A0565AC6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4228410E4FD;
	Mon,  4 Jul 2022 16:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D98C10E059
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 22:14:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1091B80907
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 22:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C052C341CE
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 22:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656800082;
 bh=oCE/i8+/CueQ3Zaicsv0mVTtS1Az+0FPVXuLOPt+0oc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uBvBnvYzN4WoqOqIQvVUX+GGgL/0ldZU5gdUs5eIBcrIzD5U/gB65+TA8Lb7WJ4KL
 D1w0RTb6jG+Y/tW41EPE89ODJkl8ARvTeTqZH5xJADFvTNn6w3/7t1wA8TpWXQpagi
 S+0m0J6CwXc614+alnhKeCDR4FtUIqI2546WTjzM+pjdr2JZsq6NnFI8MRDafJOICc
 lIf+uqkgeEIB1avJbPBU2cRUh+Ia+z+mqf5hn/29TQwQ8N2IzVu4kRdIQdXoDh7qsw
 DeLFotZwaBtCPfhsuwG0rOIdcu229U+u4/oSJK46lGz9uQ8tT2+SVVswJXKobiMhAM
 TtKYbZfMOwOnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 71EBBC05FD5; Sat,  2 Jul 2022 22:14:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Sat, 02 Jul 2022 22:14:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216143-2300-YCi5ZzEzK1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Alex Deucher from comment #5)
> Does this patch help?
> https://patchwork.freedesktop.org/patch/490475/
Had a closer look at the patch as it did not apply on top of v5.19-rc4. See=
ms
like almost all of the patch diff is already in upstream v5.19-rc4. Only th=
ing
left to patch is:

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    2022-07-02 21:59:53.1715282=
02
+0200
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    2022-07-02 23:12:13.4819856=
65
+0200
@@ -579,16 +579,6 @@ static int amdgpu_cs_parser_bos(struct a
                e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
        }

-       /* Move fence waiting after getting reservation lock of
-        * PD root. Then there is no need on a ctx mutex lock.
-        */
-       r =3D amdgpu_ctx_wait_prev_fence(p->ctx, p->entity);
-       if (unlikely(r !=3D 0)) {
-               if (r !=3D -ERESTARTSYS)
-                       DRM_ERROR("amdgpu_ctx_wait_prev_fence failed.\n");
-               goto error_validate;
-       }
-
        amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshol=
d,
                                          &p->bytes_moved_vis_threshold);
        p->bytes_moved =3D 0;
@@ -947,7 +937,7 @@ static int amdgpu_cs_ib_fill(struct amdg
        if (parser->job->uf_addr && ring->funcs->no_user_fence)
                return -EINVAL;

-       return 0;
+       return amdgpu_ctx_wait_prev_fence(parser->ctx, parser->entity);
 }

 static int amdgpu_cs_process_fence_dep(struct amdgpu_cs_parser *p,


But applying this on top of v5.19-rc4 does not help either. I still need to
revert 94f4c4965e5513ba624488f4b601d6b385635aec to get X going.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
