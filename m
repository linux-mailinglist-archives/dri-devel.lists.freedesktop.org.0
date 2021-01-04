Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C02E9C02
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 18:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3D8982E;
	Mon,  4 Jan 2021 17:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5818982E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 17:29:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0275F224DF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 17:28:59 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id ED05782574; Mon,  4 Jan 2021 17:28:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] New: [bisected][regression] amdgpu: *ERROR* Restoring
 old state failed with -12
Date: Mon, 04 Jan 2021 17:28:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zaltys@inbox.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211033

            Bug ID: 211033
           Summary: [bisected][regression] amdgpu: *ERROR* Restoring old
                    state failed with -12
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: zaltys@inbox.ru
        Regression: No

I have AMD RX560 GPU which is connected to LG 27UD-88 display via ATEN CS782DP
displayPort KVM switch.

I can't reliably switch KVM port to the machine running Kernel 5.10.4 with
previously mentioned GPU. Screen is usually blank and display even goes to
standby after the first try, however sometimes (if I switch KVM ports quickly a
few times) it turns on, but with wrong resolution. dmesg complains with:

[drm:dm_restore_drm_connector_state] *ERROR* Restoring old state failed with
-12

for every failed port switch.

KVM switch is configured to "redetect display" - basically it emulates
replugging when port is switched. I have been using it for 4 years with the
same GPU and it worked correctly until Kernel 5.10.4

I did a bisect, and it showed the first bad commit was:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/amd?h=linux-rolling-stable&id=ea64b21c6638d1ac3120fff89eb20c0e525a21d9

Reverting this commit fixed my issue (it works like pre 5.10.4)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
