Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6173C23DD10
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 19:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1846E8E7;
	Thu,  6 Aug 2020 16:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511B6E8E7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 16:59:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208839] New: AMDGPU: DPM is not enabled after hibernate and
 resume for CIK/Hawaii GPUs (e.g R9 390)
Date: Thu, 06 Aug 2020 16:59:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sandy.8925@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208839-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208839

            Bug ID: 208839
           Summary: AMDGPU: DPM is not enabled after hibernate and resume
                    for CIK/Hawaii GPUs (e.g R9 390)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: sandy.8925@gmail.com
        Regression: No

Created attachment 290801
  --> https://bugzilla.kernel.org/attachment.cgi?id=290801&action=edit
Resume after suspend ftrace

After hibernating and resuming, DPM is not enabled. This remains the case even
if you test hibernate using the steps here:
https://www.kernel.org/doc/html/latest/power/basic-pm-debugging.html

I debugged the problem, and figured out that in the file hardwaremanager.c, in
the function, phm_enable_dynamic_state_management(), the check 'if
(!hwmgr->pp_one_vf && smum_is_dpm_running(hwmgr) && !amdgpu_passthrough(adev)
&& adev->in_suspend)' returns true for the hibernate case, and false for the
suspend case.

This means that for the hibernate case, the AMDGPU driver doesn't enable DPM
(even though it should) and simply returns from that function. In the suspend
case, it goes ahead and enables DPM, even though it doesn't need to.

I debugged further, and found out that in the case of suspend, for the
CIK/Hawaii GPUs, smum_is_dpm_running(hwmgr) returns false, while in the case of
hibernate, smum_is_dpm_running(hwmgr) returns true.

For CIK, the function ci_is_smc_ram_running() is ultimately used to determine
if DPM is currentle enabled or not, and this seems to provide the wrong answer.

I've attached ftrace traces for the resume after suspend and resume after
hibernate cases (with some functions excluded for brevity).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
