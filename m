Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD910485EDE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 03:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BF510E5A4;
	Thu,  6 Jan 2022 02:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1310E5A4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 02:39:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6791B81F03
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 02:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D36BC36AF2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 02:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641436745;
 bh=4xb2fICb2SxJjm2d2xT4MMyHzW1W9mD81S3FeVGoySU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RseqTAw4G0GJBrku07YjSs7F3iCVXYNCgBaVPt+QuIIIYeave9r29ecDUd8M/kLII
 nx1Y1B/Oed8k7EQwx1NmXFxT1dMwTnSZxkwjarpsLZMON5U5JiU2SDG8GqHkLVQfZe
 mK10in0aczH4TmqdnCjBxcV9oE8f4CxW6raT+TTZPzalsGD1/N2pLbVkVWcOT5e7/h
 NrgXv4YJUrOWRpIvrubytH54SA8KC4I93d6e+NSeJzSHlsuBAoiD1MRRG/IFF5V8Si
 RI9fm9hpJiTm45aVonLAU040Df1tT6BtnMdELh+vOBucLpJ7hyc5Dv8ODV982BVCca
 XA7NGQdhUfKCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6154CC05FF3; Thu,  6 Jan 2022 02:39:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Thu, 06 Jan 2022 02:39:05 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs-a21@moonlit-rail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-5nVeJrWJcc@https.bugzilla.kernel.org/>
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

--- Comment #3 from Kris Karas (bugs-a21@moonlit-rail.com) ---
Added Javier Martinez to the CC list, as he's the patch author.

I just bisected this bug.  "First bad commit" is
d391c58271072d0b0fad93c82018d495b2633448

Author: Javier Martinez Canillas <javierm@redhat.com>
Date:   Fri Jun 25 15:09:46 2021 +0200

    drivers/firmware: move x86 Generic System Framebuffers support

    The x86 architecture has generic support to register a system framebuff=
er
    platform device. It either registers a "simple-framebuffer" if the conf=
ig
    option CONFIG_X86_SYSFB is enabled, or a legacy VGA/VBE/EFI FB device.

    But the code is generic enough to be reused by other architectures and =
can
    be moved out of the arch/x86 directory.

    This will allow to also support the simple{fb,drm} drivers on non-x86 E=
FI
    platforms, such as aarch64 where these drivers are only supported with =
DT.

    Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
    Acked-by: Borislav Petkov <bp@suse.de>
    Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Link:
https://patchwork.freedesktop.org/patch/msgid/20210625130947.1803678-2-javi=
erm@redhat.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
