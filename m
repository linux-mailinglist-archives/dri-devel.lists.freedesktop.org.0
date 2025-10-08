Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22002BC4243
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 11:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4736510E0CA;
	Wed,  8 Oct 2025 09:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U2MBua/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F1D10E0CA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 09:19:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B7076140B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 09:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 435E1C4CEFF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759915158;
 bh=iSAZJDkJE+S6rPufoc/giexH7iLRmwhIj3kXAPoe3ds=;
 h=From:To:Subject:Date:From;
 b=U2MBua/7yL79V4qOSDc0Cc/YH6qdjOK4UOlGaMNMZmofBEAa1uws0X3hkpIsVHkHL
 BLjXelge/0FmlZcyTChIrpOtaoOOX0zgnuwmGYWcIggym6kIqR04lHrlNJjvNQDcZG
 ivrX8DINC1P/HJ5TAAn5Z69ecIWOxRtZHX3EanGLH6lLYoadj9pB72BLJWBgnopRgC
 wowrxGxr2q5CXC0mQE1m6GXV7wShppSAEAzFUoZMTY8kUwIUNKYlkSI6sKVjYP3hr7
 FhgV9xYPcRtbOn3Gcc6o1PAs98e/vnTa5HOKn/dfx8dlW1aIQkxn+aoB5LtBVEM9fj
 7Y90IwwdlF+XA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 34368C41613; Wed,  8 Oct 2025 09:19:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220642] New: amdgpu: Vblank missed when playing video using GBM
 on AMD Ryzen APU
Date: Wed, 08 Oct 2025 09:19:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eric@w-id.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-220642-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220642

               URL: https://github.com/xbmc/xbmc/issues/26167
            Bug ID: 220642
           Summary: amdgpu: Vblank missed when playing video using GBM on
                    AMD Ryzen APU
           Product: Drivers
           Version: 2.5
    Kernel Version: at least 6.8.x up to current
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: eric@w-id.eu
        Regression: No

Created attachment 308777
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308777&action=3Dedit
Screenshot of kodi with the 5fps issue

#### Description:

 First, this problem is **NOT** due to kodi, I only use it to explain the
problem.

 When kodi GBM plays a video, the rendering speed is always 5 fps lower than
screen framerate which causes stuttering. The problem occurs whatever the
framerate is, it is always 5 fps lower.

#### Steps to Reproduce:

 1. use an AMD Ryzen APU (confirmed for AMD 5xxx/7xxx/8xxx/HX 370)
 1. use a distro known to have the problem: at least ubuntu 24.04, archlinu=
x,
gentoo. The problem occurs probably on all distros.
 1. start kodi using GBM rendering (both opengl and gles versions have the
problem)
 1. start playing a video (any resolution and framerate)
 1. press O (uppercase o) to open debug overlay and press right to choose
system

#### Actual Results:

 System rendering speed is 5 fps lower than Screen resolution framerate

#### Expected Results:

 Rendering speed matchs screen resolution framerate

#### Build:

 1. CPU: AMD 5xxx/7xxx/8xxx/HX 370
 1. kernel version: at least since 6.8.x up to now
 1. firmware: at least since 20250211 up to now
 1. cpu governor and frequency: occurs on both performance and powersave, f=
rom
400MHz to 3600MHz

#### Additionnal informations:

A whole description of the problem with various tests performed by several
users can be found on issue 26167 on kodi's github

When the issue occurs, DRM debug messages always contains for each second
several lines like this one
 > [drm:amdgpu_dm_crtc_vblank_control_worker [amdgpu]] Allow idle optimizat=
ions
(MALL): true
 > [drm:amdgpu_dm_crtc_vblank_control_worker [amdgpu]] Allow idle optimizat=
ions
(MALL): false

The problem disappears as soon as the value remains "stuck" on true.

In the same way, when the issue is here, periodically, DRM log contains lin=
es
like this one:
 > [drm:drm_calc_timestamping_constants [drm]] crtc 79: hwmode: htotal 2750,
vtotal 1125, vdisplay 1080
 > [drm:drm_calc_timestamping_constants [drm]] crtc 79: clock 74176 kHz
framedur 41708234 linedur 37073

A workaround seems to exist.

 1. enable DRM debug using *echo 0xf > /sys/module/drm/parameters/debug*
 1. Wait until the rendering speed is *fixed*. Each time I tried, it took l=
ess
than 10 seconds
 1. Stop DRM debug using *echo 0 > /sys/module/drm/parameters/debug*

For an unknown reason, libreelec (kodi's JEOS) does not have the problem
despite using the same unpatched kernel, the same firmware and the same .co=
nfig
(more details in XBMC issue)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
