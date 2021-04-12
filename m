Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B04E35CF57
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 19:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F2189C9B;
	Mon, 12 Apr 2021 17:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06C789C9B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 17:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 76E1761246
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 17:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618248126;
 bh=E8Qd8QJbqbrA2AwytM3Wx4w27H2jA9svkIR2Lhsq0s0=;
 h=From:To:Subject:Date:From;
 b=jgUAG2LfCI0vYyR8GInNI3y9XpilNyH+FqC95lR1gAIJE9kbCzza2LA8c81tWL14N
 y6n25ByLEdcPDGHijLcM+hU61DFvutmOYOAR1ILTlpxTLimHO7KcILiupsN5cwUWqg
 VQJA2om4Ve4bA+2ssoVxOEwQoxS0IP8i6Ccwa9h6wceYx7nHQFEYgZeM1Mm0u7JCS5
 B/RN1VWPLkVSClMgs4TedgOpJSE2TDYbsYuxSDjpWAHj+rkgeHNfq91mDdCeOX7qjS
 BZ/kK9iQXRMNffM9+dFWSF5tAof7qNMwSH6QKf7GW+mRc5D9zxChtiVkiVQxXK4UAb
 jwslE+DoaZxyA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6854F61184; Mon, 12 Apr 2021 17:22:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212655] New: AMDGPU crashes when resuming from suspend when
 amd_iommu=on
Date: Mon, 12 Apr 2021 17:22:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fjfcavalcanti@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212655-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212655

            Bug ID: 212655
           Summary: AMDGPU crashes when resuming from suspend when
                    amd_iommu=on
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.10-1
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: fjfcavalcanti@gmail.com
        Regression: No

So, my setup is the following:

Manjaro Linux on kernel 5.11.10, but also tested on pop OS and it also happens.
Mb MSI Tomahawk B450
Ryzen 5 3600
GPU Radeon RX5700 (Powercolor Red Devil)

I tried multiple kernels from 5.9 to 5.12 and all had the same issue, if I turn
on iommu AMDGPU crashes during resume, and I have to hard-reset the system (I
cant reset it using shutdown -r for example)

What I see in DMESG after resume is the following:

[   36.492418] amdgpu 0000:28:00.0: amdgpu: failed send message:     RunBtc
(58)        param: 0x00000000 response 0xffffffc2
[   36.492420] amdgpu 0000:28:00.0: amdgpu: RunBtc failed!
[   36.492421] amdgpu 0000:28:00.0: amdgpu: Failed to setup smc hw!
[   36.492422] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of
IP block <smu> failed -62
[   36.492515] amdgpu 0000:28:00.0: amdgpu: amdgpu_device_ip_resume failed
(-62).
[   36.492516] PM: dpm_run_callback(): pci_pm_resume+0x0/0xe0 returns -62
[   36.492520] PM: Device 0000:28:00.0 failed to resume async: error -62

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
