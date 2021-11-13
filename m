Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FDD44F2E1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 12:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546086FC32;
	Sat, 13 Nov 2021 11:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5359A6FC31
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 11:47:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D7FED61156
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636804027;
 bh=RhWkYX5IQtKvmeXhK1oV+Y1U7lndiH799x4p0LXarmo=;
 h=From:To:Subject:Date:From;
 b=nkkmi1QfnCPEBUfkbh8kpZuzDCOGEOfFK5FxLV/F0UN25Z8N6kVfBUD1dXLK0QGtU
 RCHdFKtGq8Dr00F3WxNhAAzCEfMzMerYIOZHqAgawZp3F4Gb52vRLraVA0imwcNodL
 1T3PRvXPhiMX0Ayj0tR9r5zCqoblptzvBklwlizJ1oDHzJmgEK+gqSYiGGtZWUfNMs
 SV2Wmucz/R5yE38hEIwEjxLho6K9pxeZO2h6ZvVP/wANugnaKvHUjmpIe9q2Tu8d4A
 mzUza8Wua46Elf6GZNr830e4qwafYPorElHaq0nVQAKZuRkI80EFUfrDhzQBESiH5x
 mJYf/KNfeV7IQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C6AA26112E; Sat, 13 Nov 2021 11:47:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] New: apple_gmux fails to initialize and iGPU unclaimed
 on MacBook Pro 16" 2019
Date: Sat, 13 Nov 2021 11:47:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dreifachstein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

            Bug ID: 215003
           Summary: apple_gmux fails to initialize and iGPU unclaimed on
                    MacBook Pro 16" 2019
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.y
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dreifachstein@gmail.com
        Regression: No

MBP2019 can be tricked into booting with the iGPU enabled
(https://github.com/0xbb/apple_set_os.efi) but i915 does not claim the iGPU
after booting.


I have tracked down the direct cause but do not how to fix it.

When booting with the iGPU enabled `apple_gmux_present` returns true becaus=
e=20
GMUX_ACPI_HID ("APP000B") is present in the ACPI tables.=20
Because apple_gmux fails to initialize with "Failed to find gmux I/O resour=
ce"
and never registers with vgaswitcheroo the i915 probe routine always bails =
out
after `vga_switcheroo_client_probe_defer` lefting the device unclaimed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
