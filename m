Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70842485A93
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 22:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225D310E309;
	Wed,  5 Jan 2022 21:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4910E309
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:25:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C52CB81DD7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59A0DC36AF3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641417909;
 bh=v3K0RHP8tv4k0u52tlILSGKTL1/3cA/9tQkrrx+iEJA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LBozcB6vyDbfSBz3USIMauOzcNv11YiltxPP+5NX76sBA6r1HzbZCodck5+O2yZ9u
 ar0p71AcZf52+OB2YUM3NXN7+VMNaZhKPXc7mcALTlUnG5BTushFIL11JiBlCoyUV4
 2LlhJUHVjc1JPVJK5pbWNUSwgKJgEHTaPaWgyRm5XPgr+kgKoRXg727nsYUGasVwls
 r5Cq1N3SfnpwCY05u6uGHXk7RFYamdOrOM29JIu3yVk5MBOVmbnCmfXie2tGF7ZAKe
 pWZieiWgfu0P2pMuqViD1ueKd9qmMG/bDv4sFK6xrZHZtuVPPRCan427gKxe1Lg5TQ
 2zTSao8CW8uSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 32E5DC05FF8; Wed,  5 Jan 2022 21:25:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Wed, 05 Jan 2022 21:25:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaromir.obr@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210263-2300-P1LCcrELaH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210263

jaromir.obr@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jaromir.obr@gmail.com

--- Comment #6 from jaromir.obr@gmail.com ---
@Fabian
I have the same experience. I was running kernel 5.13 on Ubuntu 21.10 and w=
hen
I upgraded to mainline kernel 5.15.13 (using
https://github.com/pimlie/ubuntu-mainline-kernel.sh), the service
"systemd-backlight@backlight:amdgpu_bl0.service" starts as expected and
backlight seems to be restored.

With kernel 5.13 it failed: "Failed to start Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0" and I was not able to start it manually.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
