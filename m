Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00C33EEC9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 11:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D826E51C;
	Wed, 17 Mar 2021 10:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10296E51C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 10:50:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C7EBC64F3A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615978256;
 bh=EATQHvFUvgwYYq0xjfitpw1Yojpfmh4CWyXa8RhcPhA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uZuHcsKkhtFPhnkalrcyh8UN3HcmeY2uGXbBE31fh3LbDIpqeJW3db5taIiy4RSVN
 8mV2R7Bkdh9Bl5trUCO9BhAvtbDmWDNPKWV6BwXriz9ufs/65mpDQw9XRKwjecBz1M
 Yj362d2tLcth2hh20XjCBhyVt7HJ8yFsPMzehdsQQguHsTK6hCzDvOP2un9NkTYQTZ
 xRtnGewSAvPAyHvgV963U3ej4+y1Qzsgkfj8g/TlE1zb8fIICg0CCf2nM5WD20I52N
 t9WjjQLIM1BVR59O3CF6zED6lQZxK/S5drfHfdbocRNF+nDq/RIns0AQEARqp649C+
 D3xyzKtRXtT3g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B4EB0653C5; Wed, 17 Mar 2021 10:50:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212311] amdgpu DCN callis sleeping function in illegal context
Date: Wed, 17 Mar 2021 10:50:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nirmoy.aiemd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212311-2300-HsqaxJFWvk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212311-2300@https.bugzilla.kernel.org/>
References: <bug-212311-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212311

--- Comment #1 from Nirmoy (nirmoy.aiemd@gmail.com) ---
DCN also calls into SMU which can sleep because of mutex_lock(&smu->mutex)

[    6.547189] amdgpu 0000:44:00.0: amdgpu: SMU is initialized successfully!
[    6.547217] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:935
[    6.547248] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 581,
name: kworker/6:2
[    6.547262] 2 locks held by kworker/6:2/581:
[    6.547264]  #0: ffff8906c7c59148 ((wq_completion)events){....}-{0:0}, at:
process_one_work+0x1fb/0x4f0
[    6.547275]  #1: ffffa398447e3e68
((work_completion)(&wfc.work)){....}-{0:0}, at: process_one_work+0x1fb/0x4f0
[    6.547282] CPU: 6 PID: 581 Comm: kworker/6:2 Tainted: G            E    
5.11.0-1-default+ #171
[    6.547285] Hardware name: Gigabyte Technology Co., Ltd. X399 DESIGNARE
EX/X399 DESIGNARE EX-CF, BIOS F12i 09/24/2019
[    6.547287] Workqueue: events work_for_cpu_fn
[    6.547291] Call Trace:
[    6.547296]  dump_stack+0x6b/0x83
[    6.547300]  ___might_sleep.cold+0xa7/0xb7
[    6.547305]  ? smu_get_max_sustainable_clocks_by_dc+0x38/0x80 [amdgpu]
[    6.547494]  __mutex_lock+0x45/0x8c0
[    6.547500]  ? ___slab_alloc+0x42d/0x640
[    6.547505]  smu_get_max_sustainable_clocks_by_dc+0x38/0x80 [amdgpu]
[    6.547654]  pp_nv_get_maximum_sustainable_clocks+0x2f/0x50 [amdgpu]
[    6.547810]  init_soc_bounding_box+0x111/0x200 [amdgpu]
[    6.547975]  dcn20_resource_construct+0x440/0xd30 [amdgpu]
[    6.548134]  ? fs_reclaim_release+0x46/0x80
[    6.548138]  ? dcn20_create_resource_pool+0x25/0x80 [amdgpu]
[    6.548294]  ? kmem_cache_alloc_trace+0x1a4/0x360
[    6.548296]  ? __kmalloc+0x1c1/0x3c0
[    6.548301]  dcn20_create_resource_pool+0x3c/0x80 [amdgpu]
[    6.548457]  dc_create_resource_pool+0x13f/0x1d0 [amdgpu]
[    6.548611]  dc_create+0x203/0x7b0 [amdgpu]
[    6.548768]  amdgpu_dm_init.isra.0+0x1de/0x270 [amdgpu]
[    6.548923]  ? dev_vprintk_emit+0x12c/0x150
[    6.548931]  ? dev_printk_emit+0x4e/0x65
[    6.548941]  dm_hw_init+0xe/0x20 [amdgpu]
[    6.549094]  amdgpu_device_init.cold+0x13e6/0x17ad [amdgpu]
[    6.549248]  ? pci_bus_read_config_word+0x49/0x70
[    6.549254]  amdgpu_driver_load_kms+0x64/0x260 [amdgpu]
[    6.549376]  amdgpu_pci_probe+0x122/0x1b0 [amdgpu]
[    6.549497]  local_pci_probe+0x42/0x80
[    6.549501]  work_for_cpu_fn+0x16/0x20
[    6.549503]  process_one_work+0x28c/0x4f0
[    6.549509]  worker_thread+0x20d/0x3f0
[    6.549512]  ? rescuer_thread+0x390/0x390
[    6.549515]  kthread+0x13a/0x150
[    6.549517]  ? __kthread_bind_mask+0x60/0x60
[    6.549521]  ret_from_fork+0x22/0x30
[    6.549969] [drm] Display Core initialized with v3.2.127!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
