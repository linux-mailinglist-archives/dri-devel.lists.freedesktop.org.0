Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA342E3233
	for <lists+dri-devel@lfdr.de>; Sun, 27 Dec 2020 18:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC995893E7;
	Sun, 27 Dec 2020 17:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B76893E7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 17:36:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 15CDB206DC
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Dec 2020 17:36:01 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 0A21F81F1E; Sun, 27 Dec 2020 17:36:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210921] New: amdgpu on Radeon R9 280X floods "[drm] Display
 Core has been requested via kernel parameter but isn't supported by ASIC,
 ignoring"
Date: Sun, 27 Dec 2020 17:36:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210921-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210921

            Bug ID: 210921
           Summary: amdgpu on Radeon R9 280X floods "[drm] Display Core
                    has been requested via kernel parameter but isn't
                    supported by ASIC, ignoring"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.14
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alexandre.f.demers@gmail.com
        Regression: No

A small extract of what is spurted in logs when using an Radeon R9 280X with
amdgpu.

[...]
[47837.292590] [drm] Display Core has been requested via kernel parameter but
isn't supported by ASIC, ignoring
[47837.409321] [drm] Display Core has been requested via kernel parameter but
isn't supported by ASIC, ignoring
[47837.553302] [drm] Display Core has been requested via kernel parameter but
isn't supported by ASIC, ignoring
[47837.640563] [drm] Display Core has been requested via kernel parameter but
isn't supported by ASIC, ignoring
[...]

My R9 280X was put aside in the last year for a Vega FE. However, I'm back at
working on VCE 1 and this is one of the things I've found out since plugging
the card in. I don't see why we should continually print (and at that pace...)
that this is not supported. Report it once and move along.

I've narrowed down the issue to line 3037 in
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c. DRM_INFO should be replaced by
DRM_INFO_ONCE.

By the way, the card is still rock solid for any regular work and many games in
my library.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
