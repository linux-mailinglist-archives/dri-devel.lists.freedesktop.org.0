Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144519621D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 00:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904D6E02F;
	Fri, 27 Mar 2020 23:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616146E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 23:44:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207005] New: amd polaris (rx 470) strange instant
 artifacts/graphical corruptions
Date: Fri, 27 Mar 2020 23:44:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: destekerdemonder@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207005-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207005

            Bug ID: 207005
           Summary: amd polaris (rx 470) strange instant
                    artifacts/graphical corruptions
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.13 and 5.6rc7
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: destekerdemonder@gmail.com
        Regression: No

Created attachment 288099
  --> https://bugzilla.kernel.org/attachment.cgi?id=288099&action=edit
journalctl dump drm.debug=6 grub set

my gpu: msi radeon rx 470 gaming x 4g
my cpu: amd r7 3700x
my motherboard: asus prime x370-pro

Tested kernels: user-pc 5.5.13-1-MANJARO, 5.6rc7, linux-next git,
amd-staging-drm-next, drm-next from
"https://cgit.freedesktop.org/~agd5f/linux/" link. 

Tried grub settings(not solution): "amdgpu.aspm=0 amdgpu.bapm=0
amdgpu.compute_multipipe=0 amdgpu.cwsr_enable=0 amdgpu.dpm=0 amdgpu.discovery=0
amdgpu.exp_hw_support=1 amdgpu.gpu_recovery=0 amdgpu.lbpw=0 amdgpu.msi=0
amdgpu.pcie_gen2=0 amdgpu.noretry=0 amdgpu.ras_enable=0 amdgpu.runpm=0
amdgpu.sched_policy=2 amdgpu.sdma_phase_quantum=0 ccp.max_devs=0 acpi_osi=Linux
video=efifb:nobgrt"

Also tried add "export AMD_DEBUG=nodcc" to '/etc/environment' Not solution.

Also tried iommu grub settings. Not solution. 

I'm using picom compositor on startup of xfce. Problem (A) occurs when using
picom.( picom stable version v7.5 from manjaro ) I will add a video's
screenshot for this. I'm using manjaro xfce testing branch. 

Problem (B) occurs every time.

My other links for this problem:

https://forum.manjaro.org/t/amdgpu-polaris-opengl-vulkan-starting-artifact/130501

Video:

https://streamable.com/85qxm

(A) Instant graphic corruption occurs during login ( i will add a video's
screenshot for this ) This problem occurs picom autostarted xfce or kde login. 

My startup setttings for picom:

"picom --experimental-backends --backend glx --use-damage
--glx-no-rebind-pixmap --glx-no-stencil --unredir-if-possible --vsync -b"

I found temporary fix for this problem. I changed picom autostart with this:
"sh -c "sleep 3 && picom --experimental-backends --backend glx --use-damage
--glx-no-rebind-pixmap --glx-no-stencil --unredir-if-possible --vsync -b""

(B) Instant screen corruption or artifact for game starting. I see this on two
games. Dote underlors and albion online. I will add a video's screenshot for
this.

I'm added attachment. Dump of journalctl drm.debug=6 grub set.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
