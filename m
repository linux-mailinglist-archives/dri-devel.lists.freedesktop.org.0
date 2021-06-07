Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04639E7A8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 21:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2AF6E9E4;
	Mon,  7 Jun 2021 19:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD4B6E9E4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 19:41:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5124961208
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 19:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623094871;
 bh=V647WXolPsSAd73xJ4zNyirbihz0L+8Sus+ufSzzR20=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XzroYuMVvntIZBuEQn45JxkvtdWp/itoo6b/IRWY/yZ3MHOBmUMhgv5UtjJELw3XR
 5nduZyFfEoHu9dHa6MV/enbirqihVx1h8yV6BUdxef15oW2I5htMbe++HKEbEX6kQj
 OQtncVm9djIthZfqtpLIB3nZe6t2yRSlMGBuv1Iqg6bBp3X1hXJ41zkJr4AdLlFH5h
 iVGuIAnZCzVxBs+axFd/vYXqSjdZq46b8iI8+uMIOHLroIT6n8y3LFEnIinWDuWinD
 PjMUsg/DCoZ8Wq+17fC+PuRs8h1Y59S1oV0KPQPBWDKPIvlJXRFG4PRAufEVtKjqxr
 aNVN04F2U/Xjg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 49089611CB; Mon,  7 Jun 2021 19:41:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Mon, 07 Jun 2021 19:41:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tgayoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-sigzrhOzWN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #7 from Tomas Gayoso (tgayoso@gmail.com) ---
System config for the record as in the mesa bug:=20

root@tufboxen:~# date=20
Mon Jun  7 16:40:27 -03 2021
root@tufboxen:~# inxi -GSC -xx
System:    Host: tufboxen.lan Kernel: 5.10.42-TUF x86_64 bits: 64 compiler:=
 gcc
v: 2.36.1-slack15 Desktop: i3 4.18.3 dm: XDM=20
           Distro: Slackware 14.2=20
CPU:       Info: 8-Core model: AMD Ryzen 7 4800H with Radeon Graphics bits:=
 64
type: MT MCP arch: Zen 2 rev: 1 cache:=20
           L1: 512 KiB L2: 4 MiB L3: 8 MiB=20
           flags: avx avx2 lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3
svm bogomips: 92624=20
           Speed: 1370 MHz min/max: 1400/2900 MHz boost: enabled Core speeds
(MHz): 1: 1370 2: 1290 3: 1402 4: 1497 5: 1388=20
           6: 1327 7: 1390 8: 1391 9: 1566 10: 1370 11: 1301 12: 1396 13: 1=
394
14: 1411 15: 1397 16: 1517=20
Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] vendor: ASU=
STeK
driver: nvidia v: 465.31 bus-ID: 01:00.0=20
           chip-ID: 10de:2191=20
           Device-2: Advanced Micro Devices [AMD/ATI] Renoir vendor: ASUSTeK
driver: amdgpu v: kernel bus-ID: 05:00.0=20
           chip-ID: 1002:1636=20
           Device-3: IMC Networks USB2.0 HD UVC WebCam type: USB driver:
uvcvideo bus-ID: 3-4:4 chip-ID: 13d3:56a2=20
           Display: server: X.Org 1.20.11 driver: loaded: amdgpu,ati,nvidia
unloaded: modesetting,nouveau,nv,vesa=20
           alternate: fbdev resolution: 1: 1920x1080~144Hz 2: 2560x1440 s-d=
pi:
96=20
           OpenGL: renderer: AMD RENOIR (DRM 3.40.0 5.10.42-TUF LLVM 12.0.0=
) v:
4.6 Mesa 21.1.2 direct render: Yes=20
root@tufboxen:~#

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
