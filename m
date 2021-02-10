Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB22316ADE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FD86ECA9;
	Wed, 10 Feb 2021 16:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20646ECA9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:14:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A0FE64E66
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612973684;
 bh=QKA8W0XNJ0l6U1P5mlplCmlAF/jlPuvWLjrBjqEze0k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=K4Kp6AQ5MVLWHtk7V4vODJ1qjMMo/oxGdrTLLZu8BjcXaGuzIm0O6dU/us5TexKi3
 mhq6SP1t+bCovwQS8IlrxGH6fgepQj5J/j9cSPQqlop+cawszibixpI17m1jhXsUP3
 dj7Sh9OCDequEip44AXbGI8uI/tsCqj+uSguBtz/eGl6XBMtLSyDHFM1BKMTFGk/r8
 3EPa13QCg53sJZ8+VbB7J4zHgDKPlI+ADg9iECQXuIN4RXWt6r+1X/6J759sAItqnU
 nK3mVfJCVT1cIxuSAS3NqdnCe1w9mdDywYLQ7ff7nJu7GWCUvlneYb85oPLtHREc6/
 G4iO/HVGS+Icw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 66AC06146F; Wed, 10 Feb 2021 16:14:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211649] "drm/amd/display: reuse current context instead of
 recreating one" cause hdmi hotplug blackscreen on amdgpu
Date: Wed, 10 Feb 2021 16:14:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211649-2300-gGZYky9WPO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211649-2300@https.bugzilla.kernel.org/>
References: <bug-211649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211649

--- Comment #3 from youling257@gmail.com ---
replug hdmi, [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:67:crtc-0] flip_done timed out


[  252.377374] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:67:crtc-0] flip_done timed out

[  262.617295] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:67:crtc-0] flip_done timed out

[  270.268771] [drm] amdgpu_dm_irq_schedule_work FAILED src 2
[  272.857440] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:55:plane-3] flip_done timed out
[  272.906034] ------------[ cut here ]------------
[  272.906037] WARNING: CPU: 0 PID: 15 at
amdgpu_dm_atomic_commit_tail+0x2582/0x25f0 [amdgpu]
[  272.906404] Modules linked in: nct6775 hwmon_vid ccm binfmt_misc overlay
exportfs kvm_amd kvm crc32c_intel crc32_pclmul snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore
snd_intel_dspcfg amdgpu drm_kms_helper cec fb_sys_fops syscopyarea sysfillrect
sysimgblt gpu_sched drm_ttm_helper ttm drm ccp rng_core hid_multitouch btusb
iwlmvm btrtl btintel btbcm bluetooth ecdh_generic ecc mac80211 libarc4 iwlwifi
cfg80211 igb i2c_algo_bit k10temp gpio_amdpt gpio_generic efi_pstore sdcardfs
[  272.906461] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W        
5.11.0-rc5-android-x86_64+ #1
[  272.906466] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./B450 Gaming-ITX/ac, BIOS P4.10 07/08/2020
[  272.906468] Workqueue: events dm_irq_work_func [amdgpu]
[  272.906826] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x2582/0x25f0 [amdgpu]
[  272.907181] Code: a0 fd ff ff 01 c7 85 9c fd ff ff 37 00 00 00 c7 85 a4 fd
ff ff 20 00 00 00 e8 5a 30 13 00 e9 a0 fa ff ff 0f 0b e9 f0 f8 ff ff <0f> 0b e9
3f f9 ff ff 0f 0b 0f 0b e9 55 f9 ff ff 49 8b 06 41 0f b6
[  272.907185] RSP: 0018:ffffa0a8000a3ab8 EFLAGS: 00210002
[  272.907189] RAX: 0000000000000002 RBX: 0000000000000003 RCX:
ffff996d91211918
[  272.907191] RDX: 0000000000000001 RSI: 0000000000200297 RDI:
ffff996d510a0178
[  272.907194] RBP: ffffa0a8000a3db8 R08: 0000000000000005 R09:
0000000000000000
[  272.907196] R10: ffffa0a8000a3a18 R11: ffffa0a8000a3a1c R12:
0000000000200287
[  272.907198] R13: ffff996d6c35d800 R14: ffff996d91211800 R15:
ffff996d6f4d3600
[  272.907200] FS:  0000000000000000(0000) GS:ffff996e56e00000(0000)
knlGS:0000000000000000
[  272.907203] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  272.907206] CR2: 00000000144c2000 CR3: 000000010e262000 CR4:
00000000001506f0
[  272.907209] Call Trace:
[  272.907219]  commit_tail+0x94/0x130 [drm_kms_helper]
[  272.907251]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[  272.907280]  dm_restore_drm_connector_state+0xef/0x170 [amdgpu]
[  272.907635]  handle_hpd_irq+0x118/0x150 [amdgpu]
[  272.907990]  dm_irq_work_func+0x49/0x60 [amdgpu]
[  272.908346]  process_one_work+0x1c1/0x3c0
[  272.908353]  worker_thread+0x4d/0x3d0
[  272.908357]  ? rescuer_thread+0x3b0/0x3b0
[  272.908362]  kthread+0x133/0x150
[  272.908367]  ? kthread_create_worker_on_cpu+0x70/0x70
[  272.908373]  ret_from_fork+0x22/0x30
[  272.908379] ---[ end trace 9e7a0ad9c8574ed6 ]---
[  272.908402] ------------[ cut here ]------------
[  272.908403] WARNING: CPU: 0 PID: 15 at
amdgpu_dm_atomic_commit_tail+0x258b/0x25f0 [amdgpu]
[  272.908757] Modules linked in: nct6775 hwmon_vid ccm binfmt_misc overlay
exportfs kvm_amd kvm crc32c_intel crc32_pclmul snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi snd_hda_intel
snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore
snd_intel_dspcfg amdgpu drm_kms_helper cec fb_sys_fops syscopyarea sysfillrect
sysimgblt gpu_sched drm_ttm_helper ttm drm ccp rng_core hid_multitouch btusb
iwlmvm btrtl btintel btbcm bluetooth ecdh_generic ecc mac80211 libarc4 iwlwifi
cfg80211 igb i2c_algo_bit k10temp gpio_amdpt gpio_generic efi_pstore sdcardfs
[  272.908803] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W        
5.11.0-rc5-android-x86_64+ #1
[  272.908807] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./B450 Gaming-ITX/ac, BIOS P4.10 07/08/2020
[  272.908809] Workqueue: events dm_irq_work_func [amdgpu]
[  272.909163] RIP: 0010:amdgpu_dm_atomic_commit_tail+0x258b/0x25f0 [amdgpu]
[  272.909517] Code: ff ff 37 00 00 00 c7 85 a4 fd ff ff 20 00 00 00 e8 5a 30
13 00 e9 a0 fa ff ff 0f 0b e9 f0 f8 ff ff 0f 0b e9 3f f9 ff ff 0f 0b <0f> 0b e9
55 f9 ff ff 49 8b 06 41 0f b6 8e 2d 01 00 00 48 c7 c6 38
[  272.909521] RSP: 0018:ffffa0a8000a3ab8 EFLAGS: 00210086
[  272.909524] RAX: 0000000000000001 RBX: 0000000000000003 RCX:
ffff996d91211918
[  272.909526] RDX: 0000000000000001 RSI: 0000000000200297 RDI:
ffff996d510a0178
[  272.909528] RBP: ffffa0a8000a3db8 R08: 0000000000000005 R09:
0000000000000000
[  272.909530] R10: ffffa0a8000a3a18 R11: ffffa0a8000a3a1c R12:
0000000000200287
[  272.909532] R13: ffff996d6c35d800 R14: ffff996d91211800 R15:
ffff996d6f4d3600
[  272.909534] FS:  0000000000000000(0000) GS:ffff996e56e00000(0000)
knlGS:0000000000000000
[  272.909537] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  272.909539] CR2: 00000000144c2000 CR3: 000000010e262000 CR4:
00000000001506f0
[  272.909541] Call Trace:
[  272.909549]  commit_tail+0x94/0x130 [drm_kms_helper]
[  272.909579]  drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
[  272.909608]  dm_restore_drm_connector_state+0xef/0x170 [amdgpu]
[  272.909961]  handle_hpd_irq+0x118/0x150 [amdgpu]
[  272.910315]  dm_irq_work_func+0x49/0x60 [amdgpu]
[  272.910669]  process_one_work+0x1c1/0x3c0
[  272.910674]  worker_thread+0x4d/0x3d0
[  272.910678]  ? rescuer_thread+0x3b0/0x3b0
[  272.910682]  kthread+0x133/0x150
[  272.910687]  ? kthread_create_worker_on_cpu+0x70/0x70
[  272.910692]  ret_from_fork+0x22/0x30
[  272.910697] ---[ end trace 9e7a0ad9c8574ed7 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
