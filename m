Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E753891CD
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1226EDD5;
	Wed, 19 May 2021 14:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C586EDD5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:46:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1367E6105A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621435603;
 bh=AUQVXMs5LBLcgZiLoG5ztNSP3G96NHF1rabfqPPPZKk=;
 h=From:To:Subject:Date:From;
 b=oLW/ZkOlm8YraHgfHBWf39UfEbB+sMnE2ifZ5w1EQeY+1ZhBMg9NxS7PhrF40AqcX
 XAAJYjS8cAjvCjRUHlXzyELd4vwpSk8S0rb7IRVqWU2TIfw8XYD3l+ojoDXtGelqSL
 hLGljZBMNLlCOPqL+PAtl7okzdTcFSqezQaDLUzQHAhnnnnLsZs9rvNho8gQbAIswG
 Te4vlRpGyNLGNrErwZJjzOpcCcM9KRSBhNwYuDACtdrRSRRs6ktqSXNaf7OBaMQ1Up
 9L2BM6iHq9X055oZfbqdoFitjmVQ/BxqjcbdBvi/fT8gt92aMzlOO2G2KRJoJiYMl2
 NyfuZ0OAxNHBQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 075896125F; Wed, 19 May 2021 14:46:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] New: AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 19 May 2021 14:46:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213145-2300@https.bugzilla.kernel.org/>
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

            Bug ID: 213145
           Summary: AMDGPU resets, timesout and crashes after "*ERROR*
                    Waiting for fences timed out!"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.37 and 5.10.38
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: tgayoso@gmail.com
        Regression: No

Created attachment 296867
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296867&action=3Dedit
lspci output

AMDGPU driver crashes randomly corrupting screen and freezing X with:


[   60.449781] [drm:0xffffffffc25a7a57] *ERROR* Waiting for fences timed ou=
t!
[   60.971941] [drm:0xffffffffc25281ae] *ERROR* ring gfx timeout, signaled
seq=3D3658, emitted seq=3D3660
[   60.971946] [drm:0xffffffffc25281cb] *ERROR* Process information: process
Xorg pid 1192 thread Xorg:cs0 pid 1193
[   60.971952] amdgpu 0000:05:00.0: amdgpu: GPU reset begin!

... (some output suppressed for clarity, look at attached dmesg, please).=20

[   61.800343] amdgpu 0000:05:00.0: amdgpu: recover vram bo from shadow sta=
rt
[   61.800346] amdgpu 0000:05:00.0: amdgpu: recover vram bo from shadow done
[   61.800348] [drm] Skip scheduling IBs!
[   61.800350] [drm] Skip scheduling IBs!
[   61.800382] [drm] Skip scheduling IBs!
[   61.800398] amdgpu 0000:05:00.0: amdgpu: GPU reset(2) succeeded!
[   61.800566] [drm] Skip scheduling IBs!
[   61.800580] [drm] Skip scheduling IBs!
[   61.800627] [drm] Skip scheduling IBs!
[   61.801012] [drm] Skip scheduling IBs!
[   61.801024] [drm] Skip scheduling IBs!
[   61.801052] [drm] Skip scheduling IBs!
[   61.801062] [drm] Skip scheduling IBs!
[   61.801096] [drm] Skip scheduling IBs!
[   61.801105] [drm] Skip scheduling IBs!
[   61.801137] [drm] Skip scheduling IBs!
[   61.801806] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.808746] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.809392] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.809764] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.810389] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.810866] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.812529] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.813359] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.814770] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   61.816488] [drm:0xffffffffc24219b8] *ERROR* Failed to initialize parser
-125!
[   62.541982] ucsi_acpi USBC000:00: PPM init failed (-110)
[   67.004898] amdgpu_cs_ioctl: 1467 callbacks suppressed




Hardware: ASUS TUF506IU laptop (dual GPU Renoir and Nvidia GeForce GTX 1660=
 Ti
Mobile)

Detailed hardware in lspci.txt.=20
Detailed modules in lsmod.txt.=20
Kernle config attached in Kernel_config.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
