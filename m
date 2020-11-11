Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266E2AF6F1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 17:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276D66E087;
	Wed, 11 Nov 2020 16:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1513C6E087
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 16:53:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Wed, 11 Nov 2020 16:53:21 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-1kAsrFblUd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209457

--- Comment #15 from fawz (fawz@negentropy.io) ---
Hi all,

I'm not sure if I'm experiencing the same bug, but the outcome and some of the
log messages seem to be the same. 

For me, resuming from suspend is broken with kernel 5.9.0-2 and works when I
boot with 5.7.0-1, keeping the rest of my system the same. I'm on debian sid.

For SEO, in dmesg I see messages like

    nov. 11 17:27:35 [  202.045603] amdgpu: [powerplay] 
    nov. 11 17:27:35                 failed to send message 146 ret is 0

    nov. 11 17:27:35 [  203.073392] [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD
not responding, trying to reset the VCPU!!!

    nov. 11 17:27:35 [  216.242177] amdgpu 0000:01:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring uvd test failed (-110)
nov. 11 17:27:35 [  216.242245] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]]
*ERROR* resume of IP block <uvd_v4_2> failed -110
nov. 11 17:27:35 [  216.242312] [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_device_ip_resume failed (-110).

   nov. 11 17:27:44 [  224.963014] [drm] Fence fallback timer expired on ring
sdma0


My hardware:

- CPU: AMD FX-6200 Six-Core Processor
- VGA: [AMD/ATI] Hawaii PRO [Radeon R9 290/390]
- Motherboard: GA-990FXA-UD3 Firmware F9

Software
- debian sid
- firmware-amd-graphics: 20200918-1
- libdrm-amdgpu1: 2.4.102-1
- mesa: 20.2.1-1


To reiterate, just booting into kernel 5.7 instead of 5.9, resume from suspend
will work, keeping the above software the same.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
