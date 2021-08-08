Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B03E3C74
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 21:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828189ADC;
	Sun,  8 Aug 2021 19:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5159689ADC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 19:09:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 06F6B6054E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 19:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628449756;
 bh=oXsgyroBqd2cqnkEXGlc4c1a6WJSkfGyFTMk1yZ6Li0=;
 h=From:To:Subject:Date:From;
 b=hLfkI0yW42bFeL/79yzxVzPsy0//249aDa1E3rzL8SiRSS0weRmiKc1Tw1ibu3aqv
 nDWzVWIsapEbok2M9BCxi6lBCcr8ffuJRZPER8bbL28vaD19Vz1Oi456x7MZ4WFQ4c
 OZjS87ilY139BZ2i5LD1vGXZL5+174F2D1hTKvqr61dejid0bhMoLVacyBYsDnlZAd
 TzVtoYSvt7Cm5GiENTiooDi+XB9RhI8EMYk6dmty1x4yQkslGt2JPFAu6yPDYTMGYv
 rlgKBlSCf/xzSsmAZM2+48SjBGuAO92HRm+3WFVZ1Zf5N4YUKAx+NAlPJD497MBcww
 B0jZZUOmR6Sww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ED8F860FD8; Sun,  8 Aug 2021 19:09:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] New: [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Sun, 08 Aug 2021 19:09:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

            Bug ID: 214001
           Summary: [bisected][regression] After commit "drm/ttm:
                    Initialize debugfs from ttm_global_init()" kernels
                    without debugfs explicitly set to 'allow all' fail to
                    boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14-rc4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: untaintableangel@hotmail.co.uk
        Regression: No

So this is an interesting one.

Problem: System hangs indefinitely/refuses to boot up. 5.14rc3 was totally =
fine
but rc4 has the problem and I've bisected the commit to:=20

69de4421bb4c103ef42a32bafc596e23918c106f is the first bad commit
commit 69de4421bb4c103ef42a32bafc596e23918c106f
Author: Jason Ekstrand <jason@jlekstrand.net>
Date:   Wed Jul 21 10:23:57 2021 -0500

    drm/ttm: Initialize debugfs from ttm_global_init()

    We create a bunch of debugfs entries as a side-effect of
    ttm_global_init() and then never clean them up.  This isn't usually a
    problem because we free the whole debugfs directory on module unload.
    However, if the global reference count ever goes to zero and then
    ttm_global_init() is called again, we'll re-create those debugfs entries
    and debugfs will complain in dmesg that we're creating entries that
    already exist.  This patch fixes this problem by changing the lifetime
    of the whole TTM debugfs directory to match that of the TTM global
    state.

    Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
    Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20210721152358.2893314-6-jaso=
n@jlekstrand.net

I then tried loading an ubuntu mainline kernel for 5.14-rc4 and that was fi=
ne
too, which meant my .config was to blame in conjunction with the change.
The specific issue narrowed down to not having debug_fs enabled in my kernel
(CONFIG_DEBUG_FS is not set)

Now I've not had debugfs enabled for many, many years (is this even necessa=
ry
on a kernel on which the user makes no use of the information it provides?)=
 and
now I see the option CONFIG_DEBUG_FS=3Dy allows for one of three exclusive
options. (CONFIG_DEBUG_FS_ALLOW_ALL; CONFIG_DEBUG_FS_DISALLOW_MOUNT and
CONFIG_DEBUG_FS_ALLOW_NONE)

(*Moving forward, is debug_fs now a critical component of the linux kernel =
and
required to be enabled (CONFIG_DEBUG_FS=3DY) with a minimum of the 3rd opti=
on of
'allow none' given that so many things want to make use of it? Is debugfs
'expected' to be there to make reference to in driver code from now on?)

At any rate, I tested each of the 3 options and can confirm that since the
commit in question, the system will _only_ boot now if:=20

CONFIG_DEBUG_FS_ALLOW_ALL=3Dy

I suspect that the commit did not account for kernel compilers who don't ha=
ve
debugfs at all - however, it even causes boot issues if debugfs is present =
but
minimalised because neither:

CONFIG_DEBUG_FS_DISALLOW_MOUNT
"The API is open but filesystem is not loaded. Clients can still do
their work and read with debug tools that do not need debugfs filesystem."=
=20

nor CONFIG_DEBUG_FS_ALLOW_NONE:
"Access is off. Clients get -PERM when trying to create nodes in
debugfs tree and debugfs is not registered as a filesystem.
Client can then back-off or continue without debugfs access."

are sufficient to get a successful boot after this commit.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
