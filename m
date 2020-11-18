Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692112B87C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 23:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996206E4CB;
	Wed, 18 Nov 2020 22:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2CE6E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 22:33:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] New: brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Wed, 18 Nov 2020 22:33:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plusfabi@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210263

            Bug ID: 210263
           Summary: brightness device returns ENXIO (?) on brightness
                    restore at boot, with bootoption "quiet"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.8
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: plusfabi@gmail.com
        Regression: No

Created attachment 293729
  --> https://bugzilla.kernel.org/attachment.cgi?id=293729&action=edit
dmesg

Following: https://github.com/systemd/systemd/issues/17645

If I set kernel boot option "quiet", systemd fails to restore brightness level
with error

Failed to start Load/Save Screen Backlight Brightness of backlight:amdgpu_bl0.

At boot.

full journal output is: 

journalctl -b -1 -u systemd-backlight@backlight:amdgpu_bl0.service
-- Logs begin at Thu 2020-09-17 08:15:00 CEST, end at Tue 2020-11-17 14:19:18
CET. --
Nov 17 14:15:15 frigg systemd[1]: Starting Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0...
Nov 17 14:15:15 frigg systemd-backlight[325]: amdgpu_bl0: Failed to write
system 'brightness' attribute: No such device or address
Nov 17 14:15:15 frigg systemd[1]:
systemd-backlight@backlight:amdgpu_bl0.service: Main process exited,
code=exited, status=1/FAILURE
Nov 17 14:15:15 frigg systemd[1]:
systemd-backlight@backlight:amdgpu_bl0.service: Failed with result 'exit-code'.
Nov 17 14:15:15 frigg systemd[1]: Failed to start Load/Save Screen Backlight
Brightness of backlight:amdgpu_bl0.


This is an AMD Renoir system, with AMD Ryzen 5 4500U APU,

This happens only, if I set 'quiet' as boot option. If I remove it, brightness
restore works fine.

If I boot with quiet set, after login I can do 

systemctl start systemd-backlight@backlight:amdgpu_bl0.service

And it will successfully restore my brightness level.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
