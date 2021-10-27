Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE6243CAF2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767B06E89C;
	Wed, 27 Oct 2021 13:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDA56E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:43:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F0F660E74
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635342219;
 bh=f3K135fFyRe2WrfxYkF8b0CFeLfkWi8oAkXGi++/ryQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qJ49FXssnOyodR7/o1C4uY6dFMBsa0tlMDrodlsTS4OjlAk8akhnPHZDGd/YptMeG
 u+2kSoHUczoDz1HvGAbhI7EPjFHq/I9MHoAovVafkQjQ8lq4uW6Ugxnn2jefSEKZQ+
 lDKQ2J9C3582ORMkcb6hJLz+720YJnwxlmknQVawVOeE6ZGcN+Gk1tlIIedYWxvYMO
 YmxToRzTvpjOKw2nzff8zwBNeYArMgSa6BFAr486Anzr+bYlwL9rSWIQX+W6F7+5Wg
 hDY8E1bv7yiCceh/dZFAUO1cMRyinCFFCApT0F/WldrbbI4AVbf5GEW1SJ+abQwqm6
 TDsDB/OeeCotQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 693EB60FE3; Wed, 27 Oct 2021 13:43:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Wed, 27 Oct 2021 13:43:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213983-2300-8ZSiQI0i3i@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christian K=C3=B6nig from comment #3)
> Well what happens here is that a buffer object is released while it is
> pinned and TTM now warns about doing stuff like that.
>=20
> The key point is we need to figure out why the buffer is pinned in the fi=
rst
> place.
>=20
> One possibility is that it is used for scanout and containing the display=
ed
> picture, but from the backtrace my guess is that the buffer is shared wit=
h a
> different device and pinned because of that.
>=20
> Can we get an lspci output for the system?
No prob. Changed the CPU to an A10-8750B meanwhile but the other hardware is
the same as in the original report.

 # lspci=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Family 15h (Models 30h-3f=
h)
I/O Memory Management Unit
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Kaveri [Radeon R7 Graphics] (rev d7)
00:01.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Kaveri HDMI/DP
Audio Controller
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Kaveri P2P Bridge for
GFX PCIe Port [1:0]
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:03.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI
Controller (rev 09)
00:10.1 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI
Controller (rev 09)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Contro=
ller
[AHCI mode] (rev 40)
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 11)
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 11)
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 11)
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 11)
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 16)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
11)
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] FCH PCI Bridge (rev =
40)
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 11)
00:15.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Hudson PCI to PCI br=
idge
(PCIE port 0)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 5
01:00.0 USB controller: ASMedia Technology Inc. ASM2142 USB 3.1 Host Contro=
ller
02:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Contro=
ller
03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 11)
05:00.0 Non-Volatile memory controller: Sandisk Corp WD Black SN750 / PC SN=
730
NVMe SSD

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
