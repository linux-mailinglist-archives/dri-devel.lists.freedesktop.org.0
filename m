Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F32DC9E2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 01:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8770E899E9;
	Thu, 17 Dec 2020 00:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FBC89911
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 00:21:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210739] New: Regression in 5.10, Oops at
 amdgpu_connector_dp_detect()
Date: Thu, 17 Dec 2020 00:21:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs-a17@moonlit-rail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210739-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210739

            Bug ID: 210739
           Summary: Regression in 5.10, Oops at
                    amdgpu_connector_dp_detect()
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: bugs-a17@moonlit-rail.com
        Regression: Yes

Created attachment 294169
  --> https://bugzilla.kernel.org/attachment.cgi?id=294169&action=edit
dmesg from where X11 initializes

Booting into mainline 5.10.1 oopses in the amdgpu module in the routine
amdgpu_connector_dp_detect().  Kernels 5.9.15 and below are not affected.

Full dmesg attached.  Brief snippet of oops:
    BUG: kernel NULL pointer dereference, address: 0000000000000060
    Call Trace:
     amdgpu_connector_dp_detect+0x159/0x320 [amdgpu]
     drm_helper_probe_detect+0x93/0xd0
     drm_helper_probe_single_connector_modes+0x60c/0x7e0
     drm_client_modeset_probe+0x25c/0x13c0
[etc]

The GPU is inbuilt within the AMD A10-7870K (Radeon R7).
At system start:
    modprobe amdgpu clk_support=1
    modprobe radeon clk_support=0
Console output seems to be OK during system initialization.  But as soon as
Xorg starts, the oops occurs, and video output ceases.  System is still
responsive via the network.

The oops locks the video hardware spectacularly.  Neither the BIOS nor pressing
the motherboard <reset> button has any effect.  Only a power-cycle will get
things back to normal.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
