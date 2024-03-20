Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E76881768
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 19:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B65010EF38;
	Wed, 20 Mar 2024 18:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iXQjGxqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4BD10EF38
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:44:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 15A1760FDD
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B76BCC43394
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710960268;
 bh=6WqChKc6e9yRXlSkQssuDc/NgKsP2mVSy/OxIoUmM0M=;
 h=From:To:Subject:Date:From;
 b=iXQjGxqT76jRxQ4nBvKhBm3hlJvjB1rm+BpXGKmv/KFWzUTzgens7zNB4+VzPv5aU
 1YDchfOcYqcageRCnFc2tb7Fv0iqw9JYKF1T5zULfY+wFtJgdog+/6+fdnb1Up1zvW
 trcqcvvjMixR97nDnDCpACQrnOQy2RICZpH+F32xjgaNiYvqptjqwVP9PSDGNvRjM9
 CJ/ebhzvCNQUafsY/xMbEgBCoJ0bS4Y8ch5P9ZgUfoMY65fdofOAcpqzIxbRDVEWvd
 k87Yk3aIsl+u2MJXY/vUDi1BnhCKRZs6k3BICjhvo1Q9RsEpG3D49dHREc/ajNf1w9
 AOzHRKjvy0LcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AFBFFC53BCD; Wed, 20 Mar 2024 18:44:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218617] New: Linux Kernel Bug Report: "Scheduling while atomic"
 Kernel Panic and System Freeze on NVIDIA RTX 2000 Ada Generation
 Laptop GPU
Date: Wed, 20 Mar 2024 18:44:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: sarah.salzstein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218617-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218617

            Bug ID: 218617
           Summary: Linux Kernel Bug Report: "Scheduling while atomic"
                    Kernel Panic and System Freeze on NVIDIA RTX 2000 Ada
                    Generation Laptop GPU
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: sarah.salzstein@gmail.com
        Regression: No

Created attachment 306013
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306013&action=3Dedit
Relevant dmesg output

Dear Linux Kernel Development Team,

I am writing to report a critical issue I have been encountering with the L=
inux
kernel, specifically related to my NVIDIA RTX 2000 Ada Generation Laptop GP=
U,
installed in a Lenovo ThinkPad P1 Gen 6. The problem manifests as a "schedu=
ling
while atomic" kernel bug, followed by a complete system freeze.

Description of the Problem:
Randomly during system operation, the kernel gives the error message
"scheduling while atomic". This error occurs seemingly at random intervals =
and
under varying system loads. Subsequently, at some point, the system becomes
unresponsive and necessitates a hard reboot to regain functionality.

Steps to Reproduce:
- The error occurs randomly during system operation.
- The system becomes unresponsive, leading to a complete freeze.


System Information:
- GPU: NVIDIA Corporation AD107GLM [RTX 2000 Ada Generation Laptop GPU] (rev
a1)
Linux Distribution: Gentoo Linux
- Kernel Version: 6.8.1 (Also affects kernel versions 6.7.x, 6.6.x, and 6.1=
.x)

Additional Information:
The issue persists across multiple kernel versions, indicating it is not
specific to a particular kernel release.
I have examined the system logs and have identified the occurrence of the
"scheduling while atomic" error as the primary issue leading to the kernel
panic and subsequent system freeze.
No specific system activity or workload triggers the error; it happens
seemingly at random.
I have ensured that the GPU drivers are up to date and have attempted to
reinstall them without resolving the issue, but no matter which NVIDIA driv=
er
version I install, the bug consistently persists.

Attached Logs:
Attached the relevant portion of the dmesg output showing the BUG.

This issue severely affects the usability and stability of my system, and I
kindly request your assistance in resolving it promptly. If there are any
additional diagnostic steps or information required from my end, please let=
 me
know, and I will gladly provide it.

Thank you for your attention to this matter.

Sincerely,
Sarah S.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
