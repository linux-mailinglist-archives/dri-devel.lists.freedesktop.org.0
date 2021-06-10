Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980083A2A07
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77F36ECFD;
	Thu, 10 Jun 2021 11:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A886ECFD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:16:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 64CBF613F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623323771;
 bh=eTDN/bZIgwo1mAHu3C7dO9Q3Gs2k2NzX94hn4szqx84=;
 h=From:To:Subject:Date:From;
 b=pZ7b7+2I8hCmBLaUzm4gQoOR257rYa4mDgLrswpM1LjTuLy176TBUwGle8iTAHE//
 6t81ZLIzKQcjA5gg5vYnWuF6tCqq9gqHoE81ti3a7KuAzPabizpMSbgsozMIKPmce1
 7UFFfbXqnA3BMAMqVfE1GU0aN2TzIUibT07xxVJFIZLWm558lbpn8CVsGO0voFGKFy
 5VKn/X0E4r+lKX03wDRO4ELyq14svJD1W6ZFfgbSwcIDXP1PXk1sbxnb1Hpq6HwYF1
 wqS8KWGkWS8Ralk4IIEtsZ05S9tdvksIumlNlmpR4Cy9wy+lpISo2TfIpyFThFohg3
 9isleRmHiGc9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5A71561158; Thu, 10 Jun 2021 11:16:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] New: AMDGPU retries page fault with some specific
 processes amdgpu: [gfxhub0] retry page fault until *ERROR* ring gfx timeout,
 but soft recovered
Date: Thu, 10 Jun 2021 11:16:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

            Bug ID: 213391
           Summary: AMDGPU retries page fault with some specific processes
                    amdgpu: [gfxhub0] retry page fault until *ERROR* ring
                    gfx timeout, but soft recovered
           Product: Drivers
           Version: 2.5
    Kernel Version: Linux 5.12.9-arch-1-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: samy@lahfa.xyz
        Regression: No

Hi,

I just updated recently from mainstream Kernel 5.11.16 to 5.12.9 and I've r=
an
into this issue, I've also updated the Mesa driver from mesa-git
(21.1.0_devel.137307.f8e5f945b8f-1) to mesa-git
(21.2.0_devel.140633.c04f20e7e01-1).

Current kernel parameters : /vmlinuz-linux zfs=3Dzroot/ROOT/default rw logl=
evel=3D3
quiet radeon.si_support=3D0 amdgpu.si_support=3D1 radeon.cik_support=3D0
amdgpu.cik_support=3D1

My computer is a Thinkpad T495 laptop (AMD Ryzen 7 3700 Pro with an iGPU RX
VEGA 10, 16GB DDR4 3200Mhz) the very important bit of information is that t=
he
BIOS reserves up to 2GB of DDR4 RAM for the iGPU VRAM, I currently have set=
up
1GB (1024MB) of RAM in my BIOS for the iGPU, I'm thinking the page fault
retries could be linked to this in someways.

I think this has a higher chance of happening when my RAM memory is under h=
eavy
load and the system is swapping quite a lot too. (I have 12.3GB of Swap on a
NVMe PCIe 3.0)

At present, I cannot reproduce this issue consistently yet, however it has =
been
happening with web browsers Qutebrowser (more with Qutebrowser) and also
happened only once with Chromium (made the X11 server crash and the computer
completely froze, kernel was still responsive to SysReq keys hence I could =
get
out of that tricky situation safely).

I'll be uploading both logs of the crashes I have encountered along with an
lspci and other logs files that could be useful.

Kind regards,

Lahfa Samy

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
