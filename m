Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9B42E4BE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 01:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABC26EC88;
	Thu, 14 Oct 2021 23:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE516EC88
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 23:28:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D993D610CF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634254092;
 bh=F24RIqN/gDcL8DQfe3YNXX+fkDXQ3o5ChNUkeGjB/vI=;
 h=From:To:Subject:Date:From;
 b=sCVdnMJKsbeM32fEmlU+hOSiI663AioamLy83eVnbvQ/V/fgIBFWKmQ3Q8rUepo9D
 i5Xe/fkyUl/HmQqk+E3vRFvFlGaXlExMVbFga38iSqMUFUkOqAmjnEcH4qmogtJ6h3
 zo/4nhh7f0L8RrQP5Gvlpa352nBl1Tl0u77KcTNEJGErGQL36T34jN+aRm4Lh7xJcb
 5LXjg0E4FTo6Dcah5lHTs6dgC4bMLo0/0W7GUJzPmcA62V5usMlnR5n2neg/470lNe
 KpzzsASC80c1aRDWzl/8maq3AJ6y+pKEu5ZeMJfsJLT48b9XaB9dlq300MO2oSeKBW
 E7oXhhkwWaKGA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CE5B660F13; Thu, 14 Oct 2021 23:28:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214725] New: simpledrm and i915 both active after boot
Date: Thu, 14 Oct 2021 23:28:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dennis.lissov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214725-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214725

            Bug ID: 214725
           Summary: simpledrm and i915 both active after boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.11
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dennis.lissov@gmail.com
        Regression: No

Gentoo Linux, custom kernel build, 5.14.11 with
CONFIG_DRM_SIMPLEDRM=3Dy
CONFIG_DRM_I915=3Dy

Plasma (wayland) sees two monitors: the laptop screen and an unknown one. T=
he
only monitor physically present is the laptop screen. This did not happen a=
 few
months ago (possibly started with 5.14 upgrade).

$ ls /sys/class/drm/
card0  card0-eDP-1  card1  card1-Unknown-1  card2  card2-DP-1  card2-DP-2=20
card2-DP-3  renderD128  renderD129  version
$ readlink /sys/class/drm/card0 # Intel GPU
../../devices/pci0000:00/0000:00:02.0/drm/card0
$ readlink /sys/class/drm/card1 # Simple DRM
../../devices/platform/simple-framebuffer.0/drm/card1
$ readlink /sys/class/drm/card2 # Nouveau (not used at the moment)
../../devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card2

$ dmesg | egrep '(simple|i915)'
[    0.000000] Command line: BOOT_IMAGE=3D/kernel-5.14.11 root=3D[...] ro
acpi_backlight=3Dvideo resume=3D[...] i915.enable_gvt=3D1 quiet
[    0.060342] Kernel command line: BOOT_IMAGE=3D/kernel-5.14.11 root=3D[..=
.] ro
acpi_backlight=3Dvideo resume=3D[...] i915.enable_gvt=3D1 quiet
[    1.076957] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    1.076961] i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.387359] i915 0000:00:02.0: Direct firmware load for
i915/gvt/vid_0x8086_did_0x191b_rid_0x06.golden_hw_state failed with error -2
[    1.404418] i915 0000:00:02.0: vgaarb: changed VGA decodes:
olddecodes=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    1.404525] i915 0000:00:02.0: [drm] Disabling framebuffer compression (=
FBC)
to prevent screen flicker with VT-d enabled
[    1.404931] i915 0000:00:02.0: [drm] Finished loading DMC firmware
i915/skl_dmc_ver1_27.bin (v1.27)
[    1.422128] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on mi=
nor
0
[    1.425127] [drm] Initialized simpledrm 1.0.0 20200625 for
simple-framebuffer.0 on minor 1
[    1.437859] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrm
frame buffer device
[    1.438058] fbcon: i915 (fb1) is primary device
[    2.579133] i915 0000:00:02.0: [drm] fb1: i915 frame buffer device
[   22.162612] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
i915_audio_component_bind_ops)
[   52.106084] simple-framebuffer simple-framebuffer.0: swiotlb buffer is f=
ull
(sz: 8388608 bytes), total 32768 (slots), used 0 (slots)

Looks like the hand-over mechanism does not correctly handle this combinati=
on,
possibly due to i915 loading before simpledrm.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
