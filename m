Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A82B904B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1A36E532;
	Thu, 19 Nov 2020 10:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0FB6E532
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 10:43:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201763] amdgpu: [powerplay] VBIOS did not find boot engine
 clock value in dependency table. Using Memory DPM level 0!
Date: Thu, 19 Nov 2020 10:43:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vyanitskiy@sysmocom.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201763-2300-5K8Bte4LLX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201763-2300@https.bugzilla.kernel.org/>
References: <bug-201763-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201763

Vadim Yanitskiy (vyanitskiy@sysmocom.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vyanitskiy@sysmocom.de

--- Comment #12 from Vadim Yanitskiy (vyanitskiy@sysmocom.de) ---
Hello all,

I have a DELL Inspiron 5547 with Radeon R7 M256:

03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Topaz XT
[Radeon R7 M260/M265 / M340/M360 / M440/M445 / 530/535 / 620/625 Mobile]

I never experienced any lockups with it, most likely because I was running
quite old kernel most of the time.  About a year ago, I started to use Arch
Linux (thus more or less recent kernels), and also started to see these
messages too:

[ 3916.822707] amdgpu: can't get the mac of 5
[ 3916.824691] amdgpu: VBIOS did not find boot engine clock value in dependency
table. Using Memory DPM level 0!
[ 3923.082543] amdgpu: VI should always have 2 performance levels

It's not like they indicate any problems, the GPU actually works: with hashcat
and proprietary OpenCL run-time on top of open source amdgpu driver I get
nearly the same performance as under Windows; and even OpenGL/Vulkan rendering
seems to work (although performance is significantly worse compared to Intel
Graphics).  Even though I use Intel Graphics most of the time, I was always
interested to investigate the cause of those warnings.

I had a quick look at the kernel's code, and from what I can see they are all
related to the power management (powerplay).  I patched and compiled my own
kernel to get a bit more information, and here is what I managed to understand:

> [ 3916.822707] amdgpu: can't get the mac of 5

According to 'drivers/gpu/drm/amd/powerplay/inc/smumgr.h', the 'mac 5'
corresponds to SMU_MAX_LEVELS_VDDGFX.  This value is neither handled in
iceland_get_mac_definition(), nor it's defined in
'drivers/gpu/drm/amd/powerplay/inc/smu71.h'.  For other GPU families this
constant is used in '*_Discrete_DpmTable', while in 'SMU71_Discrete_DpmTable' I
could not find anything related to VDDGFX.  Therefore I guess this GPU family
(Iceland, SMU71) does not support this kind of power control.

> [57695.583784] amdgpu: VBIOS did not find boot engine clock value in
> dependency table. Using Memory DPM level 0!

This is something I would love to investigate further, but unfortunately have
no time.  The warning itself comes from iceland_populate_smc_boot_level()
defined in 'drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c'.  This
function attempts to get initial clock levels for Graphics DPM and Memory DPM
from VBIOS.

Since we see only one warning, it successfully gets the clock value for
Graphics DPM, but not for Memory DPM.  The function attempts to find value
'data->vbios_boot_state.mclk_bootup_value' in table
'data->dpm_table.mclk_table', which in its turn is populated by
iceland_populate_all_memory_levels().  I need to add some more debug statements
to see the contents of this table and the value that is attampted to be found
in it.

> [ 3923.082543] amdgpu: VI should always have 2 performance levels

I patched the kernel to provide more details in this message, so:

> [ 5312.502812] amdgpu: VI should always have 2 performance levels, however 1
> was detected

This one comes from smu7_apply_state_adjust_rules() defined in
'drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c'.  As far as I can see, the
code is able to handle values !=2, and in some pleces I see checks like ==1, I
most likely this warning can be safely ignored.

As I conclusion, I would say that none of those warnings is critical.

P.S. I am not a kernel developer, and neither I am familiar with amdgpu code
base.  Just had some spare time :)

Best regards,
Vadim.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
