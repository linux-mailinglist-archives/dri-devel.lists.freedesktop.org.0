Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D64FE9DB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 23:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1100010E080;
	Tue, 12 Apr 2022 21:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2115C10E080
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 21:08:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 354B9B81E81;
 Tue, 12 Apr 2022 21:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA3BC385A5;
 Tue, 12 Apr 2022 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1649797686;
 bh=RzfUsRBQu8r8E5evi119n2VAfDVXNhJ5JnBcAEt0HWU=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=ZNdZnwduOWULzDL1R55oFyL2l6G/eONxgl+j1sFgqYgpwEFi9LWh0AOjR40fj794D
 me7ndxdhxwkQ2Dd92cerku/8skL4VtwNwhfTe5DjbHEOvT0aXb3ysJ7uYRs8SFu5tG
 tqIXuihiZT7yu2IPfZF05T/G4tKzCZEWRZ5s94xo=
Date: Tue, 12 Apr 2022 14:08:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: bugzilla-daemon@kernel.org, parag.lkml@gmail.com, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Bug 215807] Bad page state in process systemd-udevd
Message-Id: <20220412140804.e73d55d5d192f2198c9278ec@linux-foundation.org>
In-Reply-To: <bug-215807-27-EqWyiHqWrc@https.bugzilla.kernel.org/>
References: <bug-215807-27@https.bugzilla.kernel.org/>
 <bug-215807-27-EqWyiHqWrc@https.bugzilla.kernel.org/>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

hm, that's my third `bad page' report in three emails.  But I'm not
seeing a pattern - this one might be a DRM thing.

On Tue, 12 Apr 2022 20:52:18 +0000 bugzilla-daemon@kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=215807
> 
> paragw (parag.lkml@gmail.com) changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |parag.lkml@gmail.com
> 
> --- Comment #1 from paragw (parag.lkml@gmail.com) ---
> Same issue on different hardware - multiple occurrences of below on 5.18.0-rc2+
> boot  -
> 
> [    8.453363] amdgpu: Topology: Add CPU node
> [    8.467169] BUG: Bad page state in process systemd-udevd  pfn:11b403
> [    8.467180] fbcon: Taking over console
> [    8.467188] page:000000002cc06944 refcount:0 mapcount:0
> mapping:0000000000000000 index:0x3 pfn:0x11b403
> [    8.467195] head:00000000aa25e58e order:9 compound_mapcount:0
> compound_pincount:0
> [    8.467198] flags: 0x17ffffc0010000(head|node=0|zone=2|lastcpupid=0x1fffff)
> [    8.467205] raw: 0017ffffc0000000 fffff2da846d0001 fffff2da846d00c8
> 0000000000000000
> [    8.467208] raw: 0000000000000000 0000000000000000 00000000ffffffff
> 0000000000000000
> [    8.467210] head: 0017ffffc0010000 0000000000000000 dead000000000122
> 0000000000000000
> [    8.467212] head: 0000000000000000 0000000000000000 00000000ffffffff
> 0000000000000000
> [    8.467214] page dumped because: corrupted mapping in tail page
> [    8.467215] Modules linked in: amdgpu(+) rtsx_usb_sdmmc mmc_core
> drm_ttm_helper ttm rtsx_usb hid_sensor_hub
>  iommu_v2 nvme crct10dif_pclmul crc32_pclmul gpu_sched crc32c_intel nvme_core
> uas ccp drm_dp_helper usb_storag
> e ghash_clmulni_intel amd_sfh ucsi_acpi sp5100_tco typec_ucsi typec
> i2c_hid_acpi i2c_hid fuse ipmi_devintf ipm
> i_msghandler
> [    8.467249] CPU: 2 PID: 416 Comm: systemd-udevd Not tainted 5.18.0-rc2+ #1
> [    8.467254] Hardware name: ASUSTeK COMPUTER INC. MINIPC PN50/PN50, BIOS 0623
> 05/13/2021
> [    8.467256] Call Trace:
> [    8.467260]  <TASK>
> [    8.467265]  dump_stack_lvl+0x48/0x5d
> [    8.467274]  bad_page.cold+0x63/0x8f
> [    8.467280]  free_tail_pages_check+0x144/0x180
> [    8.467287]  free_pcp_prepare+0x2e8/0x410
> [    8.467292]  free_unref_page+0x20/0x150
> [    8.467298]  __vunmap+0x217/0x2c0
> [    8.467303]  drm_fbdev_cleanup+0x5f/0xb0
> [    8.467310]  drm_fbdev_fb_destroy+0x19/0x30
> [    8.467315]  unregister_framebuffer+0x30/0x40
> [    8.467321]  drm_client_dev_unregister+0x6e/0xe0
> [    8.467327]  drm_dev_unregister+0x32/0x80
> [    8.467332]  drm_dev_unplug+0x25/0x40
> [    8.467335]  simpledrm_remove+0x15/0x20
> [    8.467339]  platform_remove+0x23/0x40
> [    8.467344]  device_release_driver_internal+0x1b3/0x210
> [    8.467349]  bus_remove_device+0xdc/0x150
> [    8.467353]  device_del+0x18f/0x3f0
> [    8.467359]  platform_device_del.part.0+0x13/0x70
> [    8.467364]  platform_device_unregister+0x20/0x30
> [    8.467369]  drm_aperture_detach_drivers+0xa1/0xd0
> [    8.467376]  drm_aperture_remove_conflicting_pci_framebuffers+0x43/0x80
> [    8.467382]  amdgpu_pci_probe+0x12a/0x3c0 [amdgpu]
> [    8.467833]  local_pci_probe+0x45/0x80
> [    8.467840]  pci_device_probe+0xaf/0x200
> [    8.467846]  really_probe+0x1a1/0x370
> [    8.467850]  __driver_probe_device+0xfc/0x170
> [    8.467854]  driver_probe_device+0x1f/0x90
> [    8.467858]  __driver_attach+0xbf/0x1a0
> [    8.467862]  ? __device_attach_driver+0xe0/0xe0
> [    8.467866]  bus_for_each_dev+0x66/0x90
> [    8.467870]  bus_add_driver+0x152/0x1f0
> [    8.467873]  driver_register+0x8d/0xe0
> [    8.467877]  ? 0xffffffffc0518000
> [    8.467880]  do_one_initcall+0x48/0x200
> [    8.467887]  ? do_init_module+0x22/0x250
> [    8.467892]  ? kmem_cache_alloc_trace+0x165/0x2c0
> [    8.467898]  do_init_module+0x4a/0x250
> [    8.467902]  __do_sys_finit_module+0x93/0xf0
> [    8.467911]  do_syscall_64+0x3e/0x90
> [    8.467917]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [    8.467923] RIP: 0033:0x7fb9b13cd59d
> [    8.467928] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89
> f8 48 89 f7 48 89 d6 48 89 ca 4d
>  89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4b
> 78 0e 00 f7 d8 64 89 01 48
> [    8.467931] RSP: 002b:00007ffc90f5b558 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000139
> [    8.467936] RAX: ffffffffffffffda RBX: 0000562a33e1bcd0 RCX:
> 00007fb9b13cd59d
> [    8.467938] RDX: 0000000000000000 RSI: 00007fb9b152f43c RDI:
> 0000000000000011
> [    8.467940] RBP: 00007fb9b152f43c R08: 0000000000000000 R09:
> 0000562a33e1bf90
> [    8.467943] R10: 0000000000000011 R11: 0000000000000246 R12:
> 0000000000020000
> [    8.467945] R13: 0000562a33df8f90 R14: 0000000000000000 R15:
> 0000562a33e1d540
> [    8.467950]  </TASK>
> 
> -- 
> You may reply to this email to add a comment.
> 
> You are receiving this mail because:
> You are the assignee for the bug.
