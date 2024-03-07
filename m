Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B1874D72
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 12:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9016113052;
	Thu,  7 Mar 2024 11:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UkSh176g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F44113052
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 11:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF95B60EB2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 11:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98FDDC43390
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709811211;
 bh=vqJsIARby30mbF12xlo2HZYqbVA/UWzcjknJN1n/WQg=;
 h=From:To:Subject:Date:From;
 b=UkSh176gHuZ7qCJJlGz5hygxSKZKN/8hQ1vN7h6pfu8Mb7fC6ZkhRDolRsFecKeMy
 A8n5Lp7lw6xcPiOw7X5v6qtS1zIrt8SqUbXHcr69RLwZChTopiNroDsY/XK2Ais37V
 k49fIwZ8bYuY6bbfMEG3XTufxNZEJXy5oMdfju6vXWDpNzm+4/hZ0VMJoSLY3UjVRk
 KMn8rHfV6XOsb2fXO6U/BmUMuOI1ADqiubScnyS4AwBz3BlqCeh+FTROAJBGGU/Fpk
 E4uhyg5JUrgwbUxUtiV09QoGtcx2uJc97sjLaaqcnSI3BvXQVLxvG7GT+pthdYJXU+
 DuF/l++ywQGnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 82B85C53BC6; Thu,  7 Mar 2024 11:33:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218569] New: Early KMS Resolution Issue on MST dock connected
 4K Monitor
Date: Thu, 07 Mar 2024 11:33:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erenoglu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218569

            Bug ID: 218569
           Summary: Early KMS Resolution Issue on MST dock connected 4K
                    Monitor
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erenoglu@gmail.com
        Regression: No

My laptop, a Thinkpad P14s Gen2 AMD has two usb-c and an hdmi port. I use o=
ne
USB-C port to connect to Thinkpad Dock Type 40B0 which has an internal MST =
hub.
The Dock has 2xDP connectors and 1xHDMI. The dock is connected to a 4K TV (=
LG
C2), using a DP to HDMI cable.

The system works fine when Wayland or Xorg starts and displays 3840x2160@60=
hz.

I noticed a lot of monitor sync loss when changing modes. At UEFI boot it's=
 at
1280x1024, then at kernel boot it switches to 1920x1080 and monitor loses
signal during this transition, then SDDM or GDM starts it switches to
3840x2160, and when I login to KDE, it loses signal again for a few seconds
then shows the desktop again at 3840x2160@60.
So this is a nuisance for losing monitor sync but not effecting normal
operation.

I then tried to use the HDMI port on the laptop. I unplugged the cable from=
 the
dock and plugged a separate HDMI cable directly to the port on the Laptop. =
Then
I noticed it was fully smooth. After UEFI, mode immediately switched to
3840x2160@60 with early kms and then SDDM launched without losing any signa=
l.
Then logging into desktop also is smooth and does not lose any signal.

So I concluded something is wrong when one uses a Monitor connected to a Do=
ck
with MST Hub function, connected to a USB-C port on the laptop
(no-Thunderbolt). Problems are:
1) When using the MST docking station, early kms does not switch to native =
4K
resolution (3840x2160@60hz). I tried feeding an EDID at kernel command line=
, it
did not work.
2) Monitor loses signal sync when switching modes when using Dock. Does not
happen when using HDMI port on laptop.

This does not happen if I use a simpler usb-c hub without MST support. So a
simple usb-c hub with one HDMI port out works fine.

Problematic setup:
Laptop --usb-c-- dock_with_mst -- dp2hdmi cable -- hdmi_port_on_4K_Monitor
Working setup:
Laptop -- hdmi -- hdmi_port_on_4K_Monitor

Kernel Version: Linux: 6.7.8-arch1-1

bug reported to Arch as well but I'm directed to report upstream:
https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/32

Steps to reproduce:
1) Use any recent kernel and use any docking station with an MST hub.
2) Connect a monitor to the docking station.
3) Connect Dock to the laptop using USB-C port (no thunderbolt support, ie =
amd
laptop)
4) Use early kms by adding amdgpu to mkinitcpio.conf modules section
5) Watch monitor resolution using Monitor functions while booting

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
