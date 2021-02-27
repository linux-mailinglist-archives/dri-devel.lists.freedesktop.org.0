Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E4326D43
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 14:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E026B6E4AF;
	Sat, 27 Feb 2021 13:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6627C6E4AF
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 13:51:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 14A0964EB7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614433912;
 bh=iVAHClXzWrpuAaKEPYoKBgX0QQteIY5ZuXRqJpY1qW0=;
 h=From:To:Subject:Date:From;
 b=c8637YrYAAVz1LTRfnYM+SYjAo7ozqKzqol+TfDVp021BSa/cSn5Srf0AKT+Z++CC
 bUaro29y8qQlPYI7NFXr4xO6vfbUycGb+ncnZvevG+t79SZ4Q7jOKPu38q7tXYtsTs
 3Ys00Acwm4kytQ/S59rKpzoRMPZIKBJP38T2tfqNQD79pYvXlPB1IPFOY+V3XW9Yzn
 3oIUTM5gASINR0HHX/1R4NRxMNOde2Te8bql5DlSY4CGg4icPnbtbvN2xeq9PcNKjp
 AO2XPervTn1uh1IPVRRrkpDQgFKTWsoR6JNzGBusWnhKYpfdNfmALyNHG13elxMBe7
 15nUQxJNUqcmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 08872652FF; Sat, 27 Feb 2021 13:51:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211981] New: AMDGPU: without cable attached videocard shuts
 down and does wake up again, log prints "[drm] Cannot find any crtc or sizes"
Date: Sat, 27 Feb 2021 13:51:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: raulvior.bcn@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211981-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211981

            Bug ID: 211981
           Summary: AMDGPU: without cable attached videocard shuts down
                    and does wake up again, log prints "[drm] Cannot find
                    any crtc or sizes"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: raulvior.bcn@gmail.com
        Regression: No

Created attachment 295505
  --> https://bugzilla.kernel.org/attachment.cgi?id=295505&action=edit
Dmesg when no output is attached. Framebuffer not initalized.

Linux boot shows the message in the title of this bug report if the videocard
does not have any output attached. The computer boots up and when Linux starts
loading, the card shuts down: fans stop spinning and the LED of the logo turns
off. It's a Sapphire Radeon RX 580. If I attach the cable past this point the
card does not turn on again. Pressing keys on the keyboard, moving the mouse or
turning off and on the monitor does not awake the GPU.

> amdgpu 0000:27:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 9, active_cu_number
> 36
> amdgpu 0000:27:00.0: [drm] Cannot find any crtc or sizes
> [drm] Initialized amdgpu 3.40.0 20150101 for 0000:27:00.0 on minor 0


If there's an output device attached to the videocard, then it prints this
text:
> amdgpu 0000:27:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 9, active_cu_number
> 36
> [drm] fb mappable at 0xE0BEB000
> [drm] vram apper at 0xE0000000
> [drm] size 7299072
> [drm] fb depth is 24
> [drm]    pitch is 6912
> fbcon: amdgpudrmfb (fb0) is primary device
> EDAC amd64: F17h detected (node 0).
> EDAC amd64: Node 0: DRAM ECC disabled.
> Console: switching to colour frame buffer device 210x65
> amdgpu 0000:27:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [drm] Initialized amdgpu 3.40.0 20150101 for 0000:27:00.0 on minor 0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
