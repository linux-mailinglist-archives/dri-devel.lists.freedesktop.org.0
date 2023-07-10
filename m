Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1C74DFDA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 22:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8974B10E085;
	Mon, 10 Jul 2023 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A1610E085
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 20:56:34 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-67ef5af0ce8so4285422b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689022593; x=1691614593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RsDPQ8CuFl8MSgf/CYW8UJVYFDRlJDmb8So8Ibacq/g=;
 b=kons8MUbgNo0agjw8x1y/CjrkyuRhs4mbhVuiLLwuYPaEDBdOEgQQy1kwFpV+Z3efL
 ooRNcSgsAzkFfgo21M8NbRfASieDY0ZJwFQmq9TFcmGIpECXUQh1EFadWQ76Si9l92TO
 iBqfz1zsqg553xoQVytIymsBtqddJa0w9A7zXswhRj8ZnmkjeWmRG4UVTlgnSPUcU850
 VIiaWxfKUrKphqnT8nJlttuQcihX//JpicERffyqaBEmvqAR+OlVimip+NPqOX4pw+jn
 39aVFcYRpsbjz+SSiIcbgdHloy82FOhy5dtfMiHnY53p1n8KlHGzWD8h9B94D3KjGIBh
 Kk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689022593; x=1691614593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RsDPQ8CuFl8MSgf/CYW8UJVYFDRlJDmb8So8Ibacq/g=;
 b=cmK72QWI/MU4KHccBcsehors0LaqD+VawKBncQEOLc8Ulw5d0+GBcL1yoAKwadGARx
 4YOnwb3kp/2Bt8ic9HKzNiqOwADpwRaCXmggEV0UCaW1f1E095SwvUqYaNBT61R6/RWh
 17BYDPxy6s6tyEvvWfb2B4Gb1IcRUX576RMkQeLrkIh2yR4eHlH3aNUGApB6vTRLoPuR
 SaWoPPteIH4EWOhqD5cee3PSifKwmEhPRkVQWCJvkvdDcuiAWSidwnwwahK6eZZwCIF+
 f5f+jXIOqB0nclWQKMjWl4JbT/mpHgCJHRrK0m3icRjRTOww+7UtwsZO7QIfejArxtQ6
 4oeA==
X-Gm-Message-State: ABy/qLY+CvR5XBogE+UzmJ8spkkgmQj/wci5+06mI08u95jJ1nL+TJr6
 B7/V3iqMw15DjZTBCmSZBHiWl+VqM28=
X-Google-Smtp-Source: APBJJlGaqGqJF1kXGlAUpjuHGrOSpKbmD47UgpZSHZpqVTHLmpg+IpRZ5v1rUF0ifvqM7+98k+nkBQ==
X-Received: by 2002:a05:6a00:1948:b0:67a:553d:3bc3 with SMTP id
 s8-20020a056a00194800b0067a553d3bc3mr15034102pfk.6.1689022593391; 
 Mon, 10 Jul 2023 13:56:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 g19-20020aa78753000000b00663b712bfbdsm226520pfo.57.2023.07.10.13.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 13:56:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: Add missing RCU flag to fence slab
Date: Mon, 10 Jul 2023 13:56:24 -0700
Message-ID: <20230710205625.130664-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Alexander Potapenko <glider@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes the KASAN splat:

   ==================================================================
   BUG: KASAN: use-after-free in msm_ioctl_wait_fence+0x31c/0x7b0
   Read of size 4 at addr ffffff808cb7c2f8 by task syz-executor/12236
   CPU: 6 PID: 12236 Comm: syz-executor Tainted: G        W         5.15.119-lockdep-19932-g4a017c53fe63 #1 b15455e5b94c63032dd99eb0190c27e582b357ed
   Hardware name: Google Homestar (rev3) (DT)
   Call trace:
    dump_backtrace+0x0/0x4e8
    show_stack+0x34/0x50
    dump_stack_lvl+0xdc/0x11c
    print_address_description+0x30/0x2d8
    kasan_report+0x178/0x1e4
    kasan_check_range+0x1b0/0x1b8
    __kasan_check_read+0x44/0x54
    msm_ioctl_wait_fence+0x31c/0x7b0
    drm_ioctl_kernel+0x214/0x418
    drm_ioctl+0x524/0xbe8
    __arm64_sys_ioctl+0x154/0x1d0
    invoke_syscall+0x98/0x278
    el0_svc_common+0x214/0x274
    do_el0_svc+0x9c/0x19c
    el0_svc+0x5c/0xc0
    el0t_64_sync_handler+0x78/0x108
    el0t_64_sync+0x1a4/0x1a8
   Allocated by task 12224:
    kasan_save_stack+0x38/0x68
    __kasan_slab_alloc+0x6c/0x88
    kmem_cache_alloc+0x1b8/0x428
    drm_sched_fence_alloc+0x30/0x94
    drm_sched_job_init+0x7c/0x178
    msm_ioctl_gem_submit+0x2b8/0x5ac4
    drm_ioctl_kernel+0x214/0x418
    drm_ioctl+0x524/0xbe8
    __arm64_sys_ioctl+0x154/0x1d0
    invoke_syscall+0x98/0x278
    el0_svc_common+0x214/0x274
    do_el0_svc+0x9c/0x19c
    el0_svc+0x5c/0xc0
    el0t_64_sync_handler+0x78/0x108
    el0t_64_sync+0x1a4/0x1a8
   Freed by task 32:
    kasan_save_stack+0x38/0x68
    kasan_set_track+0x28/0x3c
    kasan_set_free_info+0x28/0x4c
    ____kasan_slab_free+0x110/0x164
    __kasan_slab_free+0x18/0x28
    kmem_cache_free+0x1e0/0x904
    drm_sched_fence_free_rcu+0x80/0x9c
    rcu_do_batch+0x318/0xcf0
    rcu_nocb_cb_kthread+0x1a0/0xc4c
    kthread+0x2e4/0x3a0
    ret_from_fork+0x10/0x20
   Last potentially related work creation:
    kasan_save_stack+0x38/0x68
    kasan_record_aux_stack+0xd4/0x114
    __call_rcu_common+0xd4/0x1478
    call_rcu+0x1c/0x28
    drm_sched_fence_release_scheduled+0x108/0x158
    dma_fence_release+0x178/0x564
    drm_sched_fence_release_finished+0xb4/0x124
    dma_fence_release+0x178/0x564
    __msm_gem_submit_destroy+0x150/0x488
    msm_job_free+0x9c/0xdc
    drm_sched_main+0xec/0x9ac
    kthread+0x2e4/0x3a0
    ret_from_fork+0x10/0x20
   Second to last potentially related work creation:
    kasan_save_stack+0x38/0x68
    kasan_record_aux_stack+0xd4/0x114
    __call_rcu_common+0xd4/0x1478
    call_rcu+0x1c/0x28
    drm_sched_fence_release_scheduled+0x108/0x158
    dma_fence_release+0x178/0x564
    drm_sched_fence_release_finished+0xb4/0x124
    dma_fence_release+0x178/0x564
    drm_sched_entity_fini+0x170/0x238
    drm_sched_entity_destroy+0x34/0x44
    __msm_file_private_destroy+0x60/0x118
    msm_submitqueue_destroy+0xd0/0x110
    __msm_gem_submit_destroy+0x384/0x488
    retire_submits+0x6a8/0xa14
    recover_worker+0x764/0xa50
    kthread_worker_fn+0x3f4/0x9ec
    kthread+0x2e4/0x3a0
    ret_from_fork+0x10/0x20
   The buggy address belongs to the object at ffffff808cb7c280
   The buggy address is located 120 bytes inside of
   The buggy address belongs to the page:
   page:000000008b01d27d refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10cb7c
   head:000000008b01d27d order:1 compound_mapcount:0
   flags: 0x8000000000010200(slab|head|zone=2)
   raw: 8000000000010200 fffffffe06844d80 0000000300000003 ffffff80860dca00
   raw: 0000000000000000 0000000000190019 00000001ffffffff 0000000000000000
   page dumped because: kasan: bad access detected
   Memory state around the buggy address:
    ffffff808cb7c180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    ffffff808cb7c200: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
   >ffffff808cb7c280: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                   ^
    ffffff808cb7c300: fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc
    ffffff808cb7c380: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
   ==================================================================

Suggested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index ef120475e7c6..b624711c6e03 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -35,7 +35,7 @@ static int __init drm_sched_fence_slab_init(void)
 {
 	sched_fence_slab = kmem_cache_create(
 		"drm_sched_fence", sizeof(struct drm_sched_fence), 0,
-		SLAB_HWCACHE_ALIGN, NULL);
+		SLAB_HWCACHE_ALIGN | SLAB_TYPESAFE_BY_RCU, NULL);
 	if (!sched_fence_slab)
 		return -ENOMEM;
 
-- 
2.41.0

