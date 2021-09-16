Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCA40D459
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880E86EACE;
	Thu, 16 Sep 2021 08:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1C36EACE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:17:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EA5A36105A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631780221;
 bh=A1KgN/BKdzFqw2IvcqbNn2/tItfe/AQG4ohJ9B0YRm4=;
 h=From:To:Subject:Date:From;
 b=DeAlRofwl7+Y2/HvbWcebGmPwOTXxUCwWSjLP0lUOXLj+hYPo69z8nNBE/VIG8vIJ
 LDdMMRYSweoBc7hITNAOIYbGGLFOgfWKQLj6iwSY3JwmRungov5d5CBdj6RWZy+Vn9
 y/2rFkr181FdVMdhg63k3S3mWUuDeDv5m6xbP3tNsSN11Q7dhrRsQraObtyuTOvs2f
 JJxah1DISVfg+Q8MJo/DpvwdE2fKo+6IhTpkFphO8JmvU0Y8C+AZcv5D2FJz6KqprN
 99ts/9ZVs9ADhxHfCmmClfdUA54wQur4Gb92mSlcRn7bCAKRXOdgIngLlkhGqcL49t
 hgcuY/a+zKxiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D9E47610CA; Thu, 16 Sep 2021 08:17:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214427] New: Amdgpu hangs kernel on boot trying init debugfs
Date: Thu, 16 Sep 2021 08:17:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: inferrna@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-214427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214427

            Bug ID: 214427
           Summary: Amdgpu hangs kernel on boot trying init debugfs
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: inferrna@gmail.com
        Regression: No

Created attachment 298831
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298831&action=3Dedit
Screenshot

Early on kernel 5.10 and before it was just
[drm] Initialized amdgpu 3.40.0 20150101 for 0000:05:00.0 on minor 0
[drm:amdgpu_debugfs_init] *ERROR* Failed to init debugfs
[drm:amdgpu_pci_probe] *ERROR* Creating debugfs files failed (-1).

but now it became panic. Kernel patched with
https://github.com/dolohow/uksm/blob/master/v5.x/uksm-5.14.patch - I'm usin=
g it
since version 4 without problems.

Panic starts with

RIP: 0010:debugfs_create_file_size+0x2e/0x40

..and see more on the picture

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
