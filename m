Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24532B9470
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC6A6E517;
	Thu, 19 Nov 2020 14:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E886E530
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:23:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201763] amdgpu: [powerplay] VBIOS did not find boot engine
 clock value in dependency table. Using Memory DPM level 0!
Date: Thu, 19 Nov 2020 14:23:09 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201763-2300-awQyS3tSB7@https.bugzilla.kernel.org/>
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

--- Comment #13 from Vadim Yanitskiy (vyanitskiy@sysmocom.de) ---
Here we go:

[  582.721066] amdgpu: iceland_populate_all_memory_levels(): mclk_table has 3
entries
[  582.721081] amdgpu: iceland_populate_all_memory_levels(): dpm_levels[0] is
30000
[  582.721095] amdgpu: iceland_populate_all_memory_levels(): dpm_levels[1] is
60000
[  582.721110] amdgpu: iceland_populate_all_memory_levels(): dpm_levels[2] is
90000
[  582.722669] amdgpu: VBIOS did not find boot engine clock value (29900) in
dependency table. Using Memory DPM level 0!

As can be seen, the driver falls-back to level 0, which is very close to the
requested value (29900 vs 30000).  Looks like a bug in VBIOS, because AFAIU,
value 29900 comes from there (see smu7_dpm_patch_boot_state() in
'drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c').  In any case, this does
not look critical to me too.

Best regards,
Vadim.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
