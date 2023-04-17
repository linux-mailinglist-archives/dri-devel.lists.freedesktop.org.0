Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D011B6E4C91
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5750D10E196;
	Mon, 17 Apr 2023 15:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F190610E196
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:15:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCDBB61FF6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D8DDC433D2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681744550;
 bh=gSij+LmGEaC3sSs3ekWPmeiWyy5wJ3LB5PWNrfgMwBY=;
 h=From:To:Subject:Date:From;
 b=lvhSQ8e6N2i66PMn+VOyWA4eonFOPYMpF/8qwVjnXhWJfl/IVYikkDmqXckJJU66x
 pQSpjANM0LgktToCBEJlklKB8EvF3wqJE93PS4BzaKOmM71PkD6ouroxLTxgwyxAUM
 VXBLOC+a9l0WxhSJouf2XXCQE/zxAe2E867lkC+gkl9jmqW+MoVZXjzRHchfIC6Y5+
 vvgcGIPi8ZOXxl7LZnDwiltzwAoH7gR9MCCOCg/FRU+YtsIaHKHWHPHmsFgs80IMwc
 7EIy9DEfJz95/7dNZO+bNgaiwQRBnKKOiIJr8STvlAX5nrONGswnsR16NefjNhOzji
 G0GGRoxzcK0eg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2BBE1C43143; Mon, 17 Apr 2023 15:15:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217348] New: Regression nvidia dkms driver installation
Date: Mon, 17 Apr 2023 15:15:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 19.jaime.91@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217348-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217348

            Bug ID: 217348
           Summary: Regression nvidia dkms driver installation
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: 19.jaime.91@gmail.com
        Regression: No

Since commit 96a7b60f6ddb2bc966fac800c1dd18876a6e3c3f dumb_destroy func were
removed but nvidia dkms seems to look for that


 CC [M]  /var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-encode=
r.o
  CC [M]=20
/var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-connector.o
/var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-drv.c: In funct=
ion
=E2=80=98nv_drm_update_drm_driver_features=E2=80=99:
/var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-drv.c:924:18:
error: =E2=80=98struct drm_driver=E2=80=99 has no member named =E2=80=98dum=
b_destroy=E2=80=99
  924 |     nv_drm_driver.dumb_destroy     =3D nv_drm_dumb_destroy;
      |                  ^
make[2]: *** [scripts/Makefile.build:252:
/var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-drv.o] Error 1
make[2]: *** Waiting for unfinished jobs....
/var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-crtc.c: In func=
tion
=E2=80=98__nv_drm_plane_atomic_destroy_state=E2=80=99:
/var/lib/dkms/nvidia/525.105.17/build/nvidia-drm/nvidia-drm-crtc.c:678:5:
warning: ISO C90 forbids mixed declarations and code
[-Wdeclaration-after-statement]
  678 |     struct nv_drm_plane_state *nv_drm_plane_state =3D
      |     ^~~~~~
make[1]: *** [Makefile:2025: /var/lib/dkms/nvidia/525.105.17/build] Error 2
make[1]: Leaving directory '/usr/src/linux-headers-6.3.0-rc6-next-20230414'
make: *** [Makefile:82: modules] Error 2

Should I contact NVIDIA or this will be added again in kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
