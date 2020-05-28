Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A131E6384
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 16:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA666E578;
	Thu, 28 May 2020 14:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569566E578
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 14:17:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 28 May 2020 14:17:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jpa@kernelbug.mail.kapsi.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206987-2300-pU47hce7Dz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206987

Petteri Aimonen (jpa@kernelbug.mail.kapsi.fi) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jpa@kernelbug.mail.kapsi.fi

--- Comment #16 from Petteri Aimonen (jpa@kernelbug.mail.kapsi.fi) ---
I hit the same issue, using Ubuntu 20.04. It happened when switching window to
Firefox. For me it only crashed Xorg, ssh to the machine still worked ok.
Killing Xorg didn't work and `shutdown -r now` hung up somewhere.

Here is a bug report on the Ubuntu package:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1881134

Here is call trace decoded with the debug symbols:

--

[455834.385061] Call Trace:
[455834.385120] mode_support_and_system_configuration
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calc_auto.c:176)
amdgpu
[455834.385174] ? calculate_inits_and_adj_vp
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:950
(discriminator 12)) amdgpu
[455834.385230] dcn_validate_bandwidth
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1034)
amdgpu
[455834.385283] dc_validate_global_state
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:2093)
amdgpu
[455834.385338] amdgpu_dm_atomic_check
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:7413)
amdgpu
[455834.385351] drm_atomic_check_only
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_atomic.c:1179) drm
[455834.385361] drm_atomic_commit
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_atomic.c:1220) drm
[455834.385370] drm_mode_obj_set_property_ioctl
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_mode_object.c:496
/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_mode_object.c:533) drm
[455834.385379] ? drm_mode_obj_find_prop_id
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_mode_object.c:512) drm
[455834.385386] drm_ioctl_kernel
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_ioctl.c:793) drm
[455834.385394] drm_ioctl
(/build/linux-FFoizL/linux-5.4.0/include/linux/thread_info.h:119
/build/linux-FFoizL/linux-5.4.0/include/linux/thread_info.h:152
/build/linux-FFoizL/linux-5.4.0/include/linux/uaccess.h:151
/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_ioctl.c:888) drm
[455834.385402] ? drm_mode_obj_find_prop_id
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/drm_mode_object.c:512) drm
[455834.385406] ? recalc_sigpending
(/build/linux-FFoizL/linux-5.4.0/kernel/signal.c:184) 
[455834.385440] amdgpu_drm_ioctl
(/build/linux-FFoizL/linux-5.4.0/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1293)
amdgpu
[455834.385443] do_vfs_ioctl (/build/linux-FFoizL/linux-5.4.0/fs/ioctl.c:47
/build/linux-FFoizL/linux-5.4.0/fs/ioctl.c:510
/build/linux-FFoizL/linux-5.4.0/fs/ioctl.c:697) 
[455834.385444] ? recalc_sigpending
(/build/linux-FFoizL/linux-5.4.0/kernel/signal.c:184) 
[455834.385446] ? _copy_from_user
(/build/linux-FFoizL/linux-5.4.0/arch/x86/include/asm/uaccess_64.h:46
/build/linux-FFoizL/linux-5.4.0/arch/x86/include/asm/uaccess_64.h:71
/build/linux-FFoizL/linux-5.4.0/lib/usercopy.c:14) 
[455834.385448] ksys_ioctl
(/build/linux-FFoizL/linux-5.4.0/include/linux/file.h:43
/build/linux-FFoizL/linux-5.4.0/fs/ioctl.c:715) 
[455834.385449] __x64_sys_ioctl
(/build/linux-FFoizL/linux-5.4.0/fs/ioctl.c:719) 
[455834.385451] do_syscall_64
(/build/linux-FFoizL/linux-5.4.0/arch/x86/entry/common.c:290) 
[455834.385455] entry_SYSCALL_64_after_hwframe
(/build/linux-FFoizL/linux-5.4.0/arch/x86/entry/entry_64.S:184) 
[455834.385456] RIP: 0033:0x7faf3181837b

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
