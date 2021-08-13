Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89123EBBFE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 20:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5B86E8C3;
	Fri, 13 Aug 2021 18:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42966E8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 18:24:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 56EE4610CF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628879052;
 bh=Pq6UZTIzUVq6uBL9h0g13DIO7GHFqO3RxtJlE80iGM0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j+yaUiZFvFRRYC7HyVo/XCw0XkuSyQgEB8oejYZ3AkuVibR028JCeuZqwjwmY769x
 t6k0Du7zJa//3gp4hhW2u3yojp/F0P9llMlG5iHcX1+kp+wjMCQZh6tKQij9q4XnvJ
 uxGsapu8YC9hOQAF7alSFSTE+maTeuqwMHc/UlQtsBBIJHxWS8upnk6LhVgnaJM+Ps
 KMJVJmWAHQMX5OaAixJQjrdK81o31p/cb19IQGqGe64HezMrH6h00lSEoYiuLlv8jx
 Hl+sJyQB10XQd5T9GprcPVrmqq+w3EsW/Y/t/m42v77JhNTFCvRJusuXR4xnrbBYU+
 7r6csO+MzKjLQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4E7B360EE7; Fri, 13 Aug 2021 18:24:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Fri, 13 Aug 2021 18:24:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214001-2300-5cxax72eI0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
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

--- Comment #3 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
Thanks for your comment, Duncan!
Yes, I'm on a customised kernel that has a lot removed (including debugfs as
you can tell) and also amdgpu (RX 5700).=20
There's usually a bug in a testing RC every few releases, I just report them
here after bisecting; seems the right place for it even if it's not lol=20=
=20
Caught a nice bug last release cycle with the memory reservation for the bi=
os
(https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-Always-Reser=
ve-1MB)

(I wasn't sure to file this one under an AMD ("non-intel") specific 'video'=
 bug
but the commit was for 'drivers/gpu/drm/ttm' which I assume is agnostic. I
don't know what it's for or whether only amdgpu/radeon makes use of it to s=
ay
but it is interesting that the 3 of us have similar hardware.)
I can confirm all my .configs have had CONFIG_VGA_CONSOLE=3Dy in it (though=
 a lot
of fallback stuff pulled out that probably stops me getting the legacy low-=
res
VGA mode you mention, c'est la vie)

But anyways as you say, the ability to create a bootable kernel only become=
s an
issue from the commit in question when not having CONFIG_DEBUG_FS=3Dy (and
CONFIG_DEBUG_FS_ALLOW_ALL=3Dy along with that)

Don't get me wrong, it's not a showstopper 'massive bug' because you can al=
ways
put debugfs + 'allow all' into your kernel, I did so and am happily on rc5 =
now,
but that's why I'd like a consensus to be known or shared (i.e. change the
wording for the kconfig options) about whether a lot of things are expecting
debugfs to be there in some form now - is it now an 'essential' part of the
kernel? Or should things that rely on it fail gracefully if they don't find=
 it?
Either it's essential and this isn't a bug and there needs to be clarificat=
ion
that debugfs should always be there in some form, or this is a bug and the
commit needs tweaked to account for debugfs not being there or there in a
diminished capacity.=20=20=20=20

It is a bit silly that even CONFIG_DEBUG_FS_ALLOW_NONE wouldn't work for th=
is
bug because that seems like it should be providing that 'fail gracefully'
mechanism to debugfs being 'there' but 'don't bother with it'.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
