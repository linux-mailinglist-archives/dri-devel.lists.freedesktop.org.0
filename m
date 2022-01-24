Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CB499F1F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 00:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41810E250;
	Mon, 24 Jan 2022 23:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3A010E250
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 23:17:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49CE060B63
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 23:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F5AC340ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643066245;
 bh=83VsNtaeia9aF4K3WQ0xENrzjDtuMpbeVt77pgmANqw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XmoFSYExvY8Q0VcR4Wc0UNpzkTLs6zeE1oJ+vT+yyrm/Wk3wswqq9vQIoyOey4PFm
 FLv1OQVvakahpJvcSIp1BTgh2PVh9dTUxAwlUm23Qejn7goL+mYNyLHZ7+QiUPtjrO
 /QO3NiFaWY0rjJ0ZseEEuSM5N+mREq4aXeJGPSPucIkJgmUw9U8JxjLvErA234A1Of
 sn8CNL0obA6yEggfhRrAdeEmVNQguYIavJhQlyYKzET5kjMY9yRFhjf1ehdIuhGABn
 FKpZE7mgykG6ctA9DCjA1oIrFsTQlqnK2sFkq7Y6UvfvxuvZkQjj01xnWrk4Izt8UC
 aTttL/wm7yGLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 92332CC13A7; Mon, 24 Jan 2022 23:17:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Mon, 24 Jan 2022 23:17:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: smp@nandre.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-201957-2300-8F5he1ILu2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #57 from Spencer (smp@nandre.com) ---
Created attachment 300315
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300315&action=3Dedit
Kernel config

OS: Gentoo
Kernel: 5.15.16, config attached, built with make -j12
Launch options: root=3D/dev/sda2 ro quiet

I'd like to be able to boot with amdgpu.dpm=3D0, as this seems to fix the b=
ug
with minor tradeoffs, however:
When I boot with dpm disabled, my screen will freeze and leave this nice li=
ttle
stinker to ruin my day

Jan 24 16:33:05 [kernel] [    2.572474] Loading firmware: amdgpu/navi10_pfp=
.bin
Jan 24 16:33:05 [kernel] [    2.572475] Loading firmware: amdgpu/navi10_me.=
bin
Jan 24 16:33:05 [kernel] [    2.572476] Loading firmware: amdgpu/navi10_ce.=
bin
Jan 24 16:33:05 [kernel] [    2.572477] Loading firmware: amdgpu/navi10_rlc=
.bin
Jan 24 16:33:05 [kernel] [    2.572477] Loading firmware: amdgpu/navi10_mec=
.bin
Jan 24 16:33:05 [kernel] [    2.572478] Loading firmware:
amdgpu/navi10_mec2.bin
Jan 24 16:33:05 [kernel] [    2.572968] EXT4-fs (sdb1): mounted filesystem =
with
ordered data mode. Opts: discard. Quota mode: none.
Jan 24 16:33:05 [kernel] [    2.573030] Loading firmware:
amdgpu/navi10_sdma.bin
Jan 24 16:33:05 [kernel] [    2.573032] Loading firmware:
amdgpu/navi10_sdma1.bin
Jan 24 16:33:05 [kernel] [    2.573071] Loading firmware: amdgpu/navi10_vcn=
.bin
Jan 24 16:33:05 [kernel] [    2.573072] [drm] Found VCN firmware Version EN=
C:
1.14 DEC: 5 VEP: 0 Revision: 20
Jan 24 16:33:05 [kernel] [    2.573075] amdgpu 0000:28:00.0: amdgpu: Will u=
se
PSP to load VCN firmware
Jan 24 16:33:05 [kernel] [    2.747244] [drm] reserve 0x900000 from
0x817e400000 for PSP TMR
Jan 24 16:33:05 [kernel] [    2.785931] amdgpu 0000:28:00.0: amdgpu: RAS:
optional ras ta ucode is not available
Jan 24 16:33:05 [kernel] [    2.790137] amdgpu 0000:28:00.0: amdgpu: RAP:
optional rap ta ucode is not available
Jan 24 16:33:05 [kernel] [    2.790138] amdgpu 0000:28:00.0: amdgpu:
SECUREDISPLAY: securedisplay ta ucode is not available
Jan 24 16:33:05 [kernel] [    2.790140] amdgpu: smu firmware loading failed
Jan 24 16:33:05 [kernel] [    2.790141] amdgpu 0000:28:00.0: amdgpu:
amdgpu_device_ip_init failed
Jan 24 16:33:05 [kernel] [    2.790143] amdgpu 0000:28:00.0: amdgpu: Fatal
error during GPU init
Jan 24 16:33:05 [kernel] [    2.790144] amdgpu 0000:28:00.0: amdgpu: amdgpu:
finishing device.
Jan 24 16:33:05 [kernel] [    2.793726] [drm] free PSP TMR buffer
Jan 24 16:33:05 [kernel] [    2.825874] amdgpu: probe of 0000:28:00.0 failed
with error -95
Jan 24 16:33:05 [kernel] [    2.825951] BUG: unable to handle page fault for
address: ffffa4af5100d000
Jan 24 16:33:05 [kernel] [    2.825954] #PF: supervisor write access in ker=
nel
mode
Jan 24 16:33:05 [kernel] [    2.825955] #PF: error_code(0x0002) - not-prese=
nt
page
Jan 24 16:33:05 [kernel] [    2.825957] PGD 100000067 P4D 100000067 PUD
100104067 PMD 0
Jan 24 16:33:05 [kernel] [    2.825960] Oops: 0002 [#1] SMP NOPTI
Jan 24 16:33:05 [kernel] [    2.825962] CPU: 6 PID: 759 Comm: systemd-udevd=
 Not
tainted 5.15.16-gentoo #8
Jan 24 16:33:05 [kernel] [    2.825965] Hardware name: Micro-Star Internati=
onal
Co., Ltd MS-7B86/B450 GAMING PLUS MAX (MS-7B86), BIOS H.60 04/18/2020
Jan 24 16:33:05 [kernel] [    2.825967] RIP: 0010:vcn_v2_0_sw_fini+0x65/0x80
[amdgpu]
Jan 24 16:33:05 [kernel] [    2.826139] Code: 89 ef e8 fe 1b ff ff 85 c0 75=
 08
48 89 ef e8 42 1a ff ff 48 8b 54 24 08 65 48 2b 14 25 28 00 00 00 75 18 48 =
83
c4 10 5b 5d c3 <c7> 03 00 00 00 00 8b 7c 24 04 e8 4c c4 4d e9 eb bc e8 15 c=
d ab
e9
Jan 24 16:33:05 [kernel] [    2.826142] RSP: 0018:ffffa4af40bc7c30 EFLAGS:
00010202

TL;DR: amdgpu: smu firmware loading failed
What it means exactly, I know not, but I know it means my screen is frozen
Is there a trick? A workaround to this?
If there is some info I left out ask for it and I'll fetch it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
