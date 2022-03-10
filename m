Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C24D3E30
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 01:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A7310E627;
	Thu, 10 Mar 2022 00:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7D10E627
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 00:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 23E6C1F40657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646872390;
 bh=xt2ZwYSUhTIQueoIK4YLX4GNXMdlK2nXmSvFnrsHQ28=;
 h=Date:To:Cc:From:Subject:From;
 b=PIOtBXnkL6MclmXRldTDCvVX4lJU+lmGR28MIPjDYvpZzLw5C53JHMvdxEgCjII7b
 5KFr6ZsJV7dIrHgFAaTalRl8Itf2EddcjsFivsjrRbYFgiZ6zIodhod9t5eCa4YjGt
 9X01UhcjKWxG7EMDqH6fai7bBVFr/RKSfYxeAXuZeHzP7QmJ8niFDmlRPPCgZzIpcm
 GYwU7gsUO7YDLKoT5eEMBR0YJ/X79tXtRwfZMBw3E7W199VRlwDjOy6G3FDm2eL/FE
 5JY/Fld44JiCNs8+H2BfLyT70W6XC26XmEB0bJeo80c/T3keooZSDKynZgXYhXH8Ir
 EKN/zTlyOc6fw==
Message-ID: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
Date: Thu, 10 Mar 2022 03:33:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
X-Mozilla-News-Host: news://nntp.lore.kernel.org:119
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: BUG: KASAN: use-after-free in drm_atomic_helper_wait_for_vblanks()
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

I was playing/testing SuperTuxKart using VirtIO-GPU driver and spotted a
UAF bug in drm_atomic_helper_wait_for_vblanks().

SuperTuxKart can use DRM directly, i.e. you can run game in VT without
Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
non-blocking atomic page flips and UAF happens when a new atomic state
is committed while there is a previous page flip still in-fly.

What happens is that the new and old atomic states refer to the same
CRTC state somehow. Once the older atomic state is destroyed, the CRTC
state is freed and the newer atomic state continues to use the freed
CRTC state.

The bug is easily reproducible (at least by me) by playing SuperTuxKart
for a minute. It presents on latest -next and 5.17-rc7, I haven't
checked older kernel versions.

I'm not an expert of the non-blocking code paths in DRM, so asking for
suggestions about where the root of the problem could be.

Here is the KASAN report:

 ==================================================================
 BUG: KASAN: use-after-free in
drm_atomic_helper_wait_for_vblanks.part.0+0x10b/0x4b0
 Read of size 1 at addr ffff888110354809 by task kworker/u8:5/97

 CPU: 1 PID: 97 Comm: kworker/u8:5 Not tainted 5.17.0-rc7-next-20220309+
#158
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
 Workqueue: events_unbound commit_work
 Call Trace:
  <TASK>
  dump_stack_lvl+0x49/0x5e
  print_report.cold+0x9c/0x562
  ? drm_atomic_helper_wait_for_vblanks.part.0+0x10b/0x4b0
  kasan_report+0xb9/0xf0
  ? drm_atomic_helper_wait_for_vblanks.part.0+0x10b/0x4b0
  __asan_load1+0x4d/0x50
  drm_atomic_helper_wait_for_vblanks.part.0+0x10b/0x4b0
  ? page_flip_common+0x150/0x150
  ? complete_all+0x41/0x50
  ? drm_atomic_helper_commit_hw_done+0x1a2/0x220
  drm_atomic_helper_commit_tail+0x8c/0xa0
  commit_tail+0x15c/0x1d0
  commit_work+0x12/0x20
  process_one_work+0x50e/0x9d0
  ? pwq_dec_nr_in_flight+0x120/0x120
  ? do_raw_spin_lock+0x10a/0x190
  worker_thread+0x2ba/0x630
  ? process_one_work+0x9d0/0x9d0
  kthread+0x15d/0x190
  ? kthread_complete_and_exit+0x30/0x30
  ret_from_fork+0x1f/0x30
  </TASK>

 Allocated by task 325:
  kasan_save_stack+0x26/0x50
  __kasan_kmalloc+0x88/0xa0
  kmem_cache_alloc_trace+0x1fa/0x380
  drm_atomic_helper_crtc_duplicate_state+0x4a/0x80
  drm_atomic_get_crtc_state+0xbf/0x1d0
  page_flip_common+0x46/0x150
  drm_atomic_helper_page_flip+0x7a/0xe0
  drm_mode_page_flip_ioctl+0x9c6/0xa20
  drm_ioctl_kernel+0x145/0x220
  drm_ioctl+0x34e/0x5f0
  __x64_sys_ioctl+0xbe/0xf0
  do_syscall_64+0x35/0x80
  entry_SYSCALL_64_after_hwframe+0x44/0xae

 Freed by task 230:
  kasan_save_stack+0x26/0x50
  kasan_set_track+0x25/0x30
  kasan_set_free_info+0x24/0x40
  __kasan_slab_free+0x100/0x140
  kfree+0xaf/0x310
  drm_atomic_helper_crtc_destroy_state+0x1e/0x30
  drm_atomic_state_default_clear+0x20e/0x5d0
  __drm_atomic_state_free+0xbf/0x130
  commit_tail+0x166/0x1d0
  commit_work+0x12/0x20
  process_one_work+0x50e/0x9d0
  worker_thread+0x2ba/0x630
  kthread+0x15d/0x190
  ret_from_fork+0x1f/0x30

 The buggy address belongs to the object at ffff888110354800
  which belongs to the cache kmalloc-512 of size 512
 The buggy address is located 9 bytes inside of
  512-byte region [ffff888110354800, ffff888110354a00)

 The buggy address belongs to the physical page:
 page:0000000010a164bd refcount:1 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x110354
 head:0000000010a164bd order:2 compound_mapcount:0 compound_pincount:0
 flags: 0x8000000000010200(slab|head|zone=2)
 raw: 8000000000010200 0000000000000000 dead000000000001 ffff888100042c80
 raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
 page dumped because: kasan: bad access detected

 Memory state around the buggy address:
  ffff888110354700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff888110354780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 >ffff888110354800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                       ^
  ffff888110354880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888110354900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ==================================================================
 ------------[ cut here ]------------
