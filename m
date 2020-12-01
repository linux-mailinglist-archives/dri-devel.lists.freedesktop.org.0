Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F084E2CAF31
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 22:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F3889BF6;
	Tue,  1 Dec 2020 21:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5510389BF6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 21:54:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Tue, 01 Dec 2020 21:54:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fawz@negentropy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201539-2300-1eFwR5twmb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201539

fawz (fawz@negentropy.io) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fawz@negentropy.io

--- Comment #57 from fawz (fawz@negentropy.io) ---
Hi all!

I'm running a Radeon R9 290 with amdgpu.

I've had the same issue of pwm1_enable being set to MANUAL on boot, and then
being stuck to AUTO after switching to AUTO. I've had a quick browse of the
code and have a fix that seems to work for me.

See the attached patch for my fix/work-around.

Thoughts and explanations follow.

Some comments and questions on the code. My card seems to use the smu7_* code
for handling fan and power related functionality. I'm not sure if this is
correct, but it seems that MANUAL is simply the default state for the card at
boot, and the software (maybe on purpose? it's unclear) mirrors because there's
a variable called fan_ctrl_enabled which is never explicitly initialized, and
thus is default-initialized to false, which equates to MANUAL in the
get_pwm1_enable() logic, which again means you may set the fan speed manually.

For those who want to take a look themselves, this is roughly what happens when
you write 2 (auto) to pwm1_enable:

> amdgpu_pm.c: amdgpu_hwmon_set_pwm1()
> smu7_hwmgr.c: smu7_set_fan_control_mode()
> smu7_thermal.c: smu7_fan_ctrl_set_static_mode()
> smu7_thermal.c: smu7_fan_ctrl_start_smc_fan_control()
> 
> // Send PPSMC_StartFanControl with parameter FAN_CONTROL_TABLE
> smumgr.c: smum_send_msg_to_smc_with_parameter 
> smu7_thermal.c: hwmgr->fan_ctrl_enabled = true;

Note that fan_ctrl_enabled is now true. When reading pwm1_enable, this is the
value that's checked.

Now, this happens when we try to write 1 (manualy) to pwm1_enable again:

> amdgpu_pm.c: amdgpu_hwmon_set_pwm1_enable()
> smu7_hwmgr.c: smu7_set_fan_control_mode()
> smu7_hwmgr.c: smu7_fan_ctrl_stop_smc_fan_control
> 
> // Now, a so-called phm platform cap is checked
> // See hardwaremanager.h for its definition
> // Its description is simply "Fan is controlled by the SMC microcode."
> if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
>                       PHM_PlatformCaps_MicrocodeFanControl))
>               smu7_fan_ctrl_stop_smc_fan_control(hwmgr);

If the above check were to succeed, it would continue to send a smum message of
PPSMC_StopFanControl and set fan_ctrl_enabled = false, and we would be back in
MANUAL land. However, the PHM_PlatformCaps_MicrocodeFanControl cap is never
set. AFAICT, this cap is only ever set for vega12 and vega20 cards, in
vega20_processpptables.c and vega12_processpptables.c. It's checked in a bunch
of places for smu7, but never in a way that explicitly prevents manual fan
control once manual fan control is enabled, such as after boot.

Simply commenting out the check above fixed the problem for me, and I have seen
no strange side-effects yet. This makes sense to me; after boot, setting fan
speed manually works and the code responsible doesn't require the
MicrocodeFanControl cap to be set for that. However, I don't know what the
purpose of that cap is, whether the only reason for it being present in smu7
and elsewhere is a situation of copy-pasting skeleton code, or what.

From looking at vega10_hwmgr.c, it looks like vega10 (AMDGPU_FAMILY_AI, arctic
islands?) cards should have the same problem and I assume the same fix should
work, so I included it in the patch. It would be great if someone with an
arctic islands card (RX 400 series?) could test and confirm this.

Comments and feedback are very welcome.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
