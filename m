Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438E2251E3
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 14:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BBC6E0F9;
	Sun, 19 Jul 2020 12:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A96E10F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 12:36:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208611] New: amdgpu crash on sharing image memory between
 Vulkan and OpenGL
Date: Sun, 19 Jul 2020 12:36:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yalterz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208611-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208611

            Bug ID: 208611
           Summary: amdgpu crash on sharing image memory between Vulkan
                    and OpenGL
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.8-200.fc32.x86_64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: yalterz@gmail.com
        Regression: No

Created attachment 290347
  --> https://bugzilla.kernel.org/attachment.cgi?id=290347&action=edit
The kernel crash part of the log.

I have two programs: one (Vulkan) creates an image, allocates memory for it and
exports the memory as an fd. The second program (OpenGL) receives the fd,
imports it as a memory for a texture, and blits some data into the texture. The
Vulkan program subsequently maps the memory and reads pixel values from it.

Both programs follow the code of this ANGLE test for Vulkan-OpenGL interop very
closely:
https://github.com/pmatos/WebKit/blob/c42c49d3859ceb5d6e5c502373c8d3e371662ac4/Source/ThirdParty/ANGLE/src/tests/gl_tests/VulkanExternalImageTest.cpp#L434

It works fine with VK_FORMAT_R8G8B8A8_UNORM, but after changing it to
R8G8B8_UNORM (without the alpha) in (I'm fairly certain) all respective places,
I got corrupt image data on one run and a kernel crash on another run. Here are
some excerpts from the log:

amdgpu 0000:01:00.0: GPU fault detected: 146 0x0f20880c for process
vulkan-external pid 173502 thread vulkan-external pid 173502
amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x001005E4
amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0608800C
amdgpu 0000:01:00.0: VM fault (0x0c, vmid 3, pasid 32784) at page 1050084, read
from 'TC6' (0x54433600) (136)
amdgpu 0000:01:00.0: IH ring buffer overflow (0x0008AF70, 0x00006660,
0x0000AF80)
[drm] Fence fallback timer expired on ring sdma0
gmc_v8_0_process_interrupt: 305 callbacks suppressed
amdgpu 0000:01:00.0: GPU fault detected: 146 0x0e20480c for process
vulkan-external pid 174193 thread vulkan-external pid 174193
amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x001005C4
amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0A04800C
amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5, pasid 32784) at page 1050052, read
from 'TC4' (0x54433400) (72)
[drm] Fence fallback timer expired on ring sdma0
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:49:crtc-1] flip_done timed out

Full last part of the log attached.

AMD RX 580, running Fedora 32 with GNOME Wayland.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
