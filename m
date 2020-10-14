Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE54728DDDF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 11:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E9189FF9;
	Wed, 14 Oct 2020 09:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E02F89FF9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 09:44:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208981] trace with B550I AORUS PRO AX and AMD Ryzen 5 PRO 4650G
Date: Wed, 14 Oct 2020 09:44:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anton@a-repko.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208981-2300-DakILeI9Ol@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208981-2300@https.bugzilla.kernel.org/>
References: <bug-208981-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208981

Anton Repko (anton@a-repko.sk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |anton@a-repko.sk

--- Comment #8 from Anton Repko (anton@a-repko.sk) ---
The same happened with the following setup:

- Kernel 5.8.14 and 5.9 with mostly Gentoo kernel config
- AMD Ryzen 7 PRO 4750G CPU+iGPU
- ASRock A520M-ITX/ac mainboard + ECC UDIMM memory

The trace mentioned above disappeared when I updated BIOS (v. 1.20 from
2020/9/18, it contains AGESA 1.0.8.0). However, I'm still not able to run ROCm
OpenCL (tried various versions, including 3.7 and 3.8), system either hangs, or
(if the program is killed early) dmesg shows

 Evicting PASID 0x8001 queues

BTW, clinfo causes GPU resets, and leaves 99% GPU utilization, while dmesg
shows something like

 qcm fence wait loop timeout expired
 The cp might be in an unrecoverable state due to an unsuccessful queues 
 preemption
 amdgpu: Failed to evict process queues
 amdgpu: Failed to quiesce KFD
 amdgpu 0000:07:00.0: amdgpu: GPU reset begin!
 [drm] free PSP TMP buffer
 amdgpu 0000:07:00.0: amdgpu: GPU reset succeeded, trying to resume
...(and similarly for kernel 5.9.0)

It is probably an off-topic, but it seems to be related to amdgpu driver, and I
don't know how to move forward (and somebody reported that ROCk 3.7 driver
works well with APU Renoir).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
