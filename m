Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD91A4CF06
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 00:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5F010E259;
	Mon,  3 Mar 2025 23:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MxpieRCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4C410E2AA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:04:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 057DB5C4A76
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 843D5C4CEEB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 23:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741043064;
 bh=Bm0ys1php9icn3xTG6Ic3cadVG+P/McRW1DbaVzH1eA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MxpieRCyay1z6RNofT+NTe+JRyJZ/iWh44LSozUymxt5QaS6+D+Hhn0DkueAqdRiB
 9f2mxyiCIQS1leACp5xs6m2kGJ3fXqWB6b8zryy4qxdQd4LWVKowkPz68AbMRPg54V
 2cCA9WB2gI92dwhGRQuspieyhTUbW2P9u0zjnlX3YN4SGX/DyEkvIs2ddEhgU4skI1
 by64FquMZDLNdSYVR9unPSGJDtm1nlEzIKmayi3xU3QgiNVBcw65ONobFyKhnIPtFA
 A/16AXFJ3hEvvrEa5E8QwWd35DIP1pmCvSbDcJZTKLNxe3xwmdA1+k8CARvH+hNxiu
 QvgVfITFRANpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6DA47C53BC5; Mon,  3 Mar 2025 23:04:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219834] amdgpu: kernel oops dce_aux_transfer_raw
Date: Mon, 03 Mar 2025 23:04:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: atiqcx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219834-2300-uOIFEpdahJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219834-2300@https.bugzilla.kernel.org/>
References: <bug-219834-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219834

--- Comment #1 from Atiq (atiqcx@gmail.com) ---
Distro: fedora 41
Device: Asus P16 H7606WV
Desktop: gnome
Xorg or wayland: wayland
Kernel: 6.13.5



related:
https://github.com/torvalds/linux/blob/99fa936e8e4f117d62f229003c9799686f74=
cebc/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c#L559

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
