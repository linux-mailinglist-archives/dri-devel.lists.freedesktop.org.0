Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4458DF6C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 20:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790FBBFD73;
	Tue,  9 Aug 2022 18:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F86BFA95
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 18:53:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6BE7B8171E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 18:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1C6DC433B5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660071181;
 bh=xG7uHA/3BauAbYna4J0TVE7S9p2hedTqt6lJCZTVDkw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YPb1oOWlfRJZ5iui5qM2UcF3Lxda1Kk73NCsf5M141GGjKbAj9pKHvTsh5pMK/AbA
 8cV+1LUcduHyN4tmNPj5zrLwApMaCbMKc3juJ0ZOneUYVxBacFGEU2vrkOZSmQ9w2h
 uzBf8j9e8pd6vljr6/74i5EeZ/KWPstJNHII1/slD8rCUYnbdfF28b9NDrgICfiz1B
 fTCW2pxF1RLHlSk3WjVWwegt4NU41WU92wKsyBT5bjEZiWH33/s0YHgS9ryBC/40A5
 1NN0l2qMi8gvkD3DMgU+CQbTHtFBO3XnvMerqT0iYtHofatx/GrxT44nnMRS0VNs3a
 vnua1G6FPJcfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D0601C04231; Tue,  9 Aug 2022 18:53:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 09 Aug 2022 18:53:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-3ODAqoxt8F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #35 from Harald Judt (h.judt@gmx.at) ---
I have not had time yet to try any patches, but here are more detailed dmesg
messages when things get awry after resuming from hibernation and vt-switch=
ing
(see symptoms described above). Maybe they give someone additional hints wh=
at's
going wrong:

[drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences timed out!
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
[drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences timed out!
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
[drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences timed out!
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
[drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences timed out!
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
[drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences timed out!
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
[drm:amdgpu_dm_atomic_commit_tail] *ERROR* Waiting for fences timed out!
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x000cc40c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0C0C40=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 6, pasid 0) at page 0, re=
ad
from 'TC7' (0x54433700) (196)
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x0004c40c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x040C40=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 2, pasid 0) at page 0, re=
ad
from 'TC7' (0x54433700) (196)
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x000ac40c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0A0C40=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 5, pasid 0) at page 0, re=
ad
from 'TC7' (0x54433700) (196)
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x0004c40c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x040C40=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 2, pasid 0) at page 0, re=
ad
from 'TC7' (0x54433700) (196)
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x0004480c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x040480=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 2, pasid 0) at page 0, re=
ad
from 'TC0' (0x54433000) (72)
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x0004480c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x040480=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 2, pasid 0) at page 0, re=
ad
from 'TC0' (0x54433000) (72)
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered
amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 146 0x000a480c
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x000000=
00
amdgpu 0000:01:00.0: amdgpu:   VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0A0480=
0C
amdgpu 0000:01:00.0: amdgpu: VM fault (0x0c, vmid 5, pasid 0) at page 0, re=
ad
from 'TC0' (0x54433000) (72)
[drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft recovered

The funny thing was that another X session was still somehow usable (it tak=
es a
while to switch to it because of the hangs). But in general, those hangs wh=
en
vt-switching sucks.

I will try to revert all the fbdev patches again to see if that also happens
with the old fb code, though I cannot remember it did.

I will also test whether that happens when using only S3 instead of S4.

It will probably take me a few days until I can get to it though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
