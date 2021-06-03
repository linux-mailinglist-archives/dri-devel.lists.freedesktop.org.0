Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4439AE89
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 01:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9F36E199;
	Thu,  3 Jun 2021 23:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6176E199
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B7B6613F8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622762462;
 bh=EzpmbOarZGTRJPNX4df2x3suJwNmxuKBXkXqhE2mAU0=;
 h=From:To:Subject:Date:From;
 b=iqnefNsmr6fYWft1g1HXP2RDeD1bqzulP5vNTZoVTHaJRGtYAB3NSm/vIpAGc3fzW
 zISHAcyJ3g/PVB3P0bH+7HsC6qAiWEyiEzVCk4p9bsc5/k2NtGJTMxmxV1u9rlkAof
 944TLtxxvbeZ8cWDSTkD3BhYyEKZTjaS026PSqySTx0A2rw9w1JugefGgximIKaGWg
 c3m6HYcOqfj4YPUUJ1BWQA61ycjgvgu2oDhFxTMwRv9iMPGhP/njOWVmBuevSI3jvo
 vRkp6KAPApChRH2CbP59cY/eQmtT0Ff9ADWanw94tbKtH35dodW7Qa+AWNQdl8ISB3
 t5/qNpSmHsWiA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7109B61206; Thu,  3 Jun 2021 23:21:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213333] New: Regression: amdgpu_gfxhub raises protection fault, 
 crashes display
Date: Thu, 03 Jun 2021 23:21:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: unseddd@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213333-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213333

            Bug ID: 213333
           Summary: Regression: amdgpu_gfxhub raises protection fault,
                    crashes display
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.0-rc4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: unseddd@protonmail.com
        Regression: No

Created attachment 297137
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297137&action=3Dedit
commit message and fault logs

Change intended to clean up code functionally changes pointer arithmetic, a=
nd
causes protection fault when amdgpu_bo_gpu_offset(bo) < adev->gmc.vram_star=
t:
bad commit: 0ca565ab97083, CC: Oak.Zeng@amd.com,
Harish.Kasiviswanathan@amd.com, christian.koenig@amd.com,
alexander.deucher@amd.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
