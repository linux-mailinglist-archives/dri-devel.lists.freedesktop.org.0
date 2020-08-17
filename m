Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD0247875
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 23:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58DD89C96;
	Mon, 17 Aug 2020 21:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8B89C96
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 21:02:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208947] New: amdgpu DisplayPort won't recognize all display
 modes after 5.9 merges
Date: Mon, 17 Aug 2020 21:02:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ckane@colemankane.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208947-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208947

            Bug ID: 208947
           Summary: amdgpu DisplayPort won't recognize all display modes
                    after 5.9 merges
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9 staging-testing, rc1, and latest linux.git
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ckane@colemankane.org
        Regression: No

I've got an AMD Ryzen 7 1700 and a POLARIS10 Radeon RX 580M GPU in an ASUS ROG
GL702ZC laptop.

I'm using the regular 5.8.1 kernel on Arch linux, and also have been tracking
in-development kernel changes via the "staging-testing" branch on the
gregkh/staging.git Linux tree as well as the torvalds/linux.git tree.

Sometime during the course of the 5.9 updates getting merged into those trees,
the 5.9 kernels I build no longer recognize all of the graphics modes for my 4K
(3840x2160) monitor when it is plugged into the DisplayPort. Instead, the
highest mode reported available is 1024x768, and Xorg also gets limited to
these choices.

This behavior appears limited to the monitor being plugged in via its
DisplayPort input. When I use an HDMI input, all of the supported graphics
modes are reported properly. I am using /sys/class/drm/card0-DP-1/modes to
display the available modes, and also starting Xorg to test it as well.

Would be happy to test patches if this is a known regression, or would
appreciate some help/direction in tracking down potential likely culprits of
the problem so I can try to diagnose it myself. I am somewhat familiar with
kernel development, so I'm capable of hacking on it a bit if anyone can point
me in a good direction. I'm just not too familiar with the inner workings of
the AMDGPU, KMS, or DRM code. Not even certain if this is an issue specific to
AMDGPU or something agnostic to the specific video hw.

I also tried dumping the /sys/class/drm/card0-DP-1/edid after booting into
5.8.1 and then 5.9-latest and I get exactly the same data for both, so it seems
like the EDID data is at least being fetched properly. I also tried saving that
EDID data to a *.bin file and manually loading that via kernel arguments
(drm.edid_firmware): verified it was loading properly for DP-1, but I still got
the same results (no high-resolution video modes).

Let me know what data would be helpful to attach to this issue, as well.

Thanks,
Coleman Kane

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
