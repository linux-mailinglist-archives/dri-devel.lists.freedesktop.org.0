Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A067E452E87
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B890C6EE43;
	Tue, 16 Nov 2021 09:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515C26EE20
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:57:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 280166322A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637056657;
 bh=JcOwCXfmIu82oy8cZbUGMHkFtOrK9BKQGDdUxiUTdyc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G1zubvLpek+4pPhPnSGM/bhsHWDRF5x9A1XGfO5VS0YnLspLsup/pMGsw7DmDllmh
 gjlgu2ixRErGbndOaatfqIIorH13IWqzWsUMlyfoV1zUyA4p06g5wc7LaSglj4tAXj
 cf24NZvYXY4rMh5s1J+spMGI1YjFo4LzE6Bipjd9Vbm4JVrMWRsc6CxhCiAQ8V5u5P
 PWjAeb6UsyqA/VsJej174eq/Nm6X3BFmC4nzuM0Mh+oQ8ulZRKWdPNUbF/PVvLlONH
 IvEZZKr4zTmfrtybgX5fF4C4d1f32JsSDI/QsNZZ+Q+48d3NuopZB5FXWzv2JKIobq
 GmnCp3zcMt+Ng==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2153960F50; Tue, 16 Nov 2021 09:57:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Tue, 16 Nov 2021 09:57:36 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-LSiMQAXZCf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
CC'ing the relevant mailing list.

> A regression in kernel 5.15 causes FB_VGA16 (vga16fb) to fail to detect t=
hat
> it has been passed a firmware-initialized graphics bitmap instead of a
> character-mapped 80x25 display.  It takes ownership of the console, inste=
ad
> of passing control to FB_EFI, FB_VESA, FB_SIMPLE and so on.  This results=
 in
> writing ASCII bytes into the RGB bitmap, with random bits appearing in the
> first few scanlines of the screen.  (The remainder of the screen is
> untouched, e.g. Grub's window saying it is loading the Linux kernel.)
>=20
> Once udevd loads the appropriate modesetting driver (in my case, amdgpu),=
 the
> graphics screen is (re)initialized properly and becomes usable.
>=20
> Kernel config options CONFIG_SYSFB_SIMPLEFB, CONFIG_FB_SIMPLE, CONFIG_FB_=
EFI,
> and CONFIG_FB_VESA had no effect when toggled on and off.
>=20
> Workaround: Disabling CONFIG_FB_VGA16 blocks vga16fb from grabbing the
> console, allowing the EFI framebuffer to properly take ownership of the
> console.
>=20
> This bug is a duplicate of #214603.  Credit goes to that reporter for
> disabling FB_VGA16 as a workaround.  I would have updated that report rat=
her
> than file a duplicate, except that #214603 does not have its metadata
> (product, component, version, regression, or even its summary fields) set
> correctly.  Hopefully this new report will be seen by the correct
> maintainers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
