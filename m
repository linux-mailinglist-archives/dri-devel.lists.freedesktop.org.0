Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C43AC78BAC7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C177B10E0AB;
	Mon, 28 Aug 2023 22:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E18810E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:00:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA9062FBE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4C64C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693260054;
 bh=h0qALN1oPRjFGXYSS4Tk8qRYeYTeKOkEbwnpqjcuW0Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ohyymh/j1pgRaGV7Fo9M59xEm+pyhpJK3833oy/JiLXpfUd3LEfc2VYXHKwoWc69L
 GGqrM49e6rBZ3bdWptaKjSzp9MFZ61VzOOLulXw7zfkPi4V72L9BFfm+iCmN5z2+PK
 J8vFBQAzTpbBXuwtaLZUz0+mpxgaCDbAf0sSgWO9pmMZ/1GA+P92b+e3ZH6Kl5Oj4y
 X+lq/aiuil7J3AxDQ3y/w/bh6YjUro9sF+hbJl34GIOLaK03h7vewLCiBZi2aB5pmW
 XaQPXAeZemxqvNq0pdEzmA2HLeVVpLRMkKK9vm5lz/Frw6ryff0GHf4Vr4kTQs1dcZ
 q16A45Hflg8Qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9137EC53BD4; Mon, 28 Aug 2023 22:00:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 22:00:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-BEyrfPGigp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #46 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
(In reply to popus_czy_to_ty from comment #43)
> Created attachment 304974 [details]
> acpi dump

It appears that your system doesn't have the StorageD3Enable _DSD on any of=
 the
AHCI ports, it's only for NVME.  However we already have a force for this in
the kernel for your system since kernel 6.3-rc1.:

> 2023-08-27 07:32:12,410 INFO: =E2=9C=85 AMD Ryzen 5 5600H with Radeon Gra=
phics
> (family 19 model 50)

https://github.com/torvalds/linux/commit/e2a56364485e7789e7b8f342637c7f3a21=
9f7ede

> also i changed value from =3D3 to =3D0 on CONFIG_SATA_MOBILE_LPM_POLICY a=
nd i was
> able to compile it smoothly and run, but still no change

3 is the right value (medium with DPM enabled)

> Aug 26 17:57:15 Crawler-E25 kernel: ata1.00: Features: Trust Dev-Sleep
> NCQ-sndrcv

The disk supports the feature we need, DevSlp.

> Aug 26 17:57:15 Crawler-E25 kernel: ahci 0000:06:00.0: flags: 64bit ncq s=
ntf
> ilck pm led clo only pmp fbs pio slum part=20

The controller does not support 'sds' or 'sadm'.
'sds' is DevSlp
'sadm' is aggressive DevSlp

The 'sds' is the important one, this is what allows the disk to transition =
to
DevSlp during suspend.

Does your BIOS have any settings for this?

> 2) sata is itself kubuntu 23.04, i will try to install that on main nvme
> (after how to learn build from source not from distro

Something else you can do if it makes your experimentation easier is to tak=
e a
live USB key of Ubuntu and boot off that with your SATA disk disconnected.=
=20
This should let you test whether this feature works without the SATA disk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
