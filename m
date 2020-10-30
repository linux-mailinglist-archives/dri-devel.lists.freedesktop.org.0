Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578E2A0B24
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 17:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CF46E9CC;
	Fri, 30 Oct 2020 16:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2103A6E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 16:31:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208835] amdgpu fails to resume from suspend
Date: Fri, 30 Oct 2020 16:31:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tom@collider.in
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208835-2300-NuBInlMsUN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208835-2300@https.bugzilla.kernel.org/>
References: <bug-208835-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208835

Tom (tom@collider.in) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tom@collider.in

--- Comment #3 from Tom (tom@collider.in) ---
I am also affected by this. There are a few recent amdgpu suspend bugs open but
this one is most similar.

My card is a Radeon R7 260X (Bonaire XTX [Radeon R7 260X/360]), so I'm using
the experimental amdgpu driver support.

5.4.58 works,
5.4.72 does not,
5.9.1 does not.

My computer seems to be completely unresponsive after resuming. I haven't tried
SSHing but it does not respond to pressing the power button to put it back into
sleep. However there are systemd service logs in the journal after resume.

Kernel messages of note, which are not part of working logs:

18:14:26 amdgpu: [powerplay] 
          failed to send message 5e ret is 0
18:14:26 amdgpu: [powerplay] 
          failed to send message 145 ret is 0
------------------
18:14:26 [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not responding, trying to
reset the VCPU!!!
18:14:26 [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not responding, giving up!!!
18:14:26 [drm:amdgpu_device_ip_set_powergating_state [amdgpu]] *ERROR*
set_powergating_state of IP block <uvd_v4_2> failed -1
------------------
18:14:26 amdgpu 0000:01:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR*
ring uvd test failed (-110)
18:14:26 [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP
block <uvd_v4_2> failed -110
18:14:26 [drm:amdgpu_device_resume [amdgpu]] *ERROR* amdgpu_device_ip_resume
failed (-110).
18:14:26 PM: dpm_run_callback(): pci_pm_resume+0x0/0xe0 returns -110
18:14:26 PM: Device 0000:01:00.0 failed to resume async: error -110
------------------
18:14:27 [drm] Fence fallback timer expired on ring sdma0


Full journalctl from after resume attached.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
