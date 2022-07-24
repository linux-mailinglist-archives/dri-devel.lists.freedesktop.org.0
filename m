Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3557F590
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 16:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDA1112251;
	Sun, 24 Jul 2022 14:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501C10E0F4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 14:55:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C166AB80D7E
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 14:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 621C3C341CF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658674550;
 bh=yDfsJBAeYq/WYzWMvh0fgrniLI9xtp/fyATWyFNnb3I=;
 h=From:To:Subject:Date:From;
 b=X4K+PAeqlm7jO2kU30ZveFygvH0mdWxH6YOcigex/GZzQtTW3se9zibzGyaAMXlOA
 cmgSGmvKvt6bfsaanXn6MddU4zgmk6296vBDd7SjCCLRp2I3wygpHWYLgv4yU1aghX
 7MQG16sCOq60jsGnFyE/ofN7C0TYDnx1Bns27/Qy0El68CPf1C/P17XYSYDD9L84NG
 i+jfobyeXGvDCU09ANYGgYsVxU2CJbAjiwZcEPsSFHxz6LA3R0Nk45ly+SBu6cE4xd
 GufBv/5JYGhj94fo/+Kf3Jm9bJas0rYXDJIuhqtcO0Q81CXYXnzmnexBZ2bqN6T1Sf
 IzhW668TjQ2Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 490DECC13AD; Sun, 24 Jul 2022 14:55:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216277] New: X11 doesn't wait for amdgpu driver to be up
Date: Sun, 24 Jul 2022 14:55:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216277

            Bug ID: 216277
           Summary: X11 doesn't wait for amdgpu driver to be up
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.11+
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dark_sylinc@yahoo.com.ar
        Regression: No

# Context

I'm using Xubuntu 20.04
I compiled Kernel 5.18.11+ myself (shows bug)
I compiled Kernel 5.13.7+ myself (does not show bug)
My GPU is AMD Radeon 6800 XT 16GB, I don't have an iGPU (CPU is Ryzen 5900X)

Mesa is:

OpenGL renderer string: AMD Radeon RX 6800 XT (sienna_cichlid, LLVM 14.0.1,=
 DRM
3.46, 5.18.11+)
OpenGL core profile version string: 4.6 (Core Profile) Mesa 22.0.5 - kisak-=
mesa
PPA
OpenGL core profile shading language version string: 4.60


# Steps to reproduce

1. Turn on the PC
2. On *some* occasions X11 will crash, taking down the keyboard; leaving the
computer in a seemingly frozen state while displaying tty with the last info
messages
3. As a workaround, I can login via ssh and type `sudo service lightdm rest=
art`
and the X11 server will start and everything starts working perfectly fine

# Diagnostic

It seems X11 doesn't wait for amdgpu to be up. This can be seen by checking
/var/log/Xorg.0.log (attached):

[     7.718] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[     7.718] (II) FBDEV: driver for framebuffer: fbdev
[     7.718] (II) VESA: driver for VESA chipsets: vesa
[     7.718] (WW) xf86OpenConsole: setpgid failed: Operation not permitted
[     7.718] (WW) xf86OpenConsole: setsid failed: Operation not permitted
[     7.719] (EE) open /dev/dri/card0: No such file or directory
[     7.719] (WW) Falling back to old probe method for modesetting
[     7.719] (EE) open /dev/dri/card0: No such file or directory

Visually speaking, I *think* that X11 tries to init while tty is still in V=
ESA
mode before/during switching to 1920x1080

AFAIK, systemd is responsible for waiting the GPU drivers are up. Does anyb=
ody
know where I should look? Does systemd need an update? Could this be a libD=
RM
issue? I currently have installed 2.4.110 in /usr/lib and libdrm 2.4.111
compiled from source in /usr/local/lib

I could try bisecting but unfortunately the reproducibility isn't "always"
which makes it hard to debug.

All of this has been working fine with Kernel 5.13.7+

Cheers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
