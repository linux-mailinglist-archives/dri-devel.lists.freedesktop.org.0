Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9282EC1FB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 18:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6868889C80;
	Wed,  6 Jan 2021 17:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2849989C80
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 17:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 059A52312F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 17:20:39 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id F39FD81624; Wed,  6 Jan 2021 17:20:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Wed, 06 Jan 2021 17:20:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shlomo@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211033-2300-4ySUgxF3Lo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

Shlomo (shlomo@fastmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |shlomo@fastmail.com

--- Comment #6 from Shlomo (shlomo@fastmail.com) ---
I think I have the same bug on Arch after upgrading linux from 5.10.3.arch1-1
to 5.10.4.arch2-1.

My graphics card is Gigabyte Radeon RX VEGA 56 GAMING OC 8G, connected to 6
monitors: 3 HDMI outputs + 3 DisplayPort outputs. (One of the DisplayPort
outputs is connected to a DisplayPort->HDMI converter). No KVM.
All monitors run at 59.95 or 60 Hz.

Sometimes when I try to wake up the monitors, the 3 monitors on the HDMI
outputs (or occasionally just 1 or 2 of them) don't turn back on. dmesg shows:

[   56.906065] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[   56.936004] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[   56.976021] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[   62.646390] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[   62.671813] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12
[   62.697193] [drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring
old state failed with -12

The DisplayPort outputs work fine.

Sometimes all monitors correctly turn on, but dmesg shows the following errors
which didn't appear before:

[  542.425462] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!
[  542.592191] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!
[  542.937936] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!
[  543.104672] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!
[  543.421457] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!
[  543.588188] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!
[  543.771657] [drm:dce110_enable_timing_synchronization [amdgpu]] *ERROR* GSL:
Timeout on reset trigger!

ea64b21c6638d1ac3120fff89eb20c0e525a21d9 "drm/amd/display: Fix memory leaks in
S3 resume" is the first bad commit.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
