Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362B23D4BB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 02:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCB26E0E4;
	Thu,  6 Aug 2020 00:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3CA6E0E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 00:33:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208825] New: lspci triggers NULL pointer dereference on AMD
 Renoir 4800H/5600M laptop
Date: Thu, 06 Aug 2020 00:33:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jontourville@me.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208825-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208825

            Bug ID: 208825
           Summary: lspci triggers NULL pointer dereference on AMD Renoir
                    4800H/5600M laptop
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jontourville@me.com
        Regression: No

Created attachment 290791
  --> https://bugzilla.kernel.org/attachment.cgi?id=290791&action=edit
lspci triggers NULL pointer dereference on AMD Renoir laptop

Running Arch Linux with 5.8.0 kernel built from linux-mainline on a Dell G5 15
SE 5505 laptop with a AMD 4800H Renoir APU and 5600M discrete GPU.

On a fresh install of Arch, running lspci triggers an oops and NULL pointer
dereference. The oops is not triggered if the kernel is booted with
amdgpu.runpm=0, so it appears to be power management-related. The oops kicks
off with the following errors (full dmesg and lspci -vvv output attached):

[   93.485414] [drm] PCIE GART of 512M enabled (table at 0x0000008000000000).
[   93.485452] [drm] PSP is resuming...
[   93.514696] [drm] reserve 0x900000 from 0x800f400000 for PSP TMR
[   93.684656] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[   93.704673] amdgpu: SMU is resuming...
[   95.835970] amdgpu: failed send message:     RunBtc (58)     param:
0x00000000 response 0xffffffc2
[   95.835971] amdgpu: RunBtc failed!
[   95.836016] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of
IP block <smu> failed -62
[   95.836053] [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_device_ip_resume failed (-62).
[   95.851331] snd_hda_intel 0000:03:00.1: refused to change power state from
D3hot to D0
[   95.956286] snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
