Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B16534623
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 23:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911E810E85A;
	Wed, 25 May 2022 21:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C70010E710;
 Wed, 25 May 2022 21:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653515974; x=1685051974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9Kp/G8hWDt6FsuNU7sxTq5rigZvhNsOCk2Mpf7rNTGo=;
 b=K4zKK1c0GCjR+IfQn82KIpR6w/clRLG8TnDqvzZBbV89mXcfi3mxpgga
 evW4eqf5gWpfqlD0DUdsTA9XAB/5Z0iCdGUdrLcOgHDgGpmbWEkB0ma59
 cDQ1WWOmtIxrykxOD7METk2xkxp26uXXe49i8cBSqdJB6kXLZx3Mo6GuC
 dRyAzuuBBBALSYzjEqsJS1sentBhebbbnpU8JsvJoQ86hq0iiPu0E97Eh
 /y0b022vMaTjb0KM7l7zle1gRtMnTVvxJAjTaa6h5VZ21dKeUQMc+Mi1E
 IGVoQbWxUEk7Y/efOBFVfUyjKYJPUEeIaRRsUXOpKTmUfkSliQjOHQQIi w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="254442752"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="254442752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 14:59:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="677133139"
Received: from nazirhos-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.165.86])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 14:59:33 -0700
Date: Wed, 25 May 2022 14:59:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Message-ID: <20220525215933.m4yhm3b653gt4knp@ldmartin-desk2>
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
 <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
 <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
 <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
 <419c9bff-4292-3062-b7f2-efeb64b9e79f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <419c9bff-4292-3062-b7f2-efeb64b9e79f@gmail.com>
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 12:38:51PM +0200, Christian König wrote:
>Am 25.05.22 um 11:35 schrieb Lionel Landwerlin:
>>On 25/05/2022 12:26, Lionel Landwerlin wrote:
>>>On 25/05/2022 11:24, Christian König wrote:
>>>>Am 25.05.22 um 08:47 schrieb Lionel Landwerlin:
>>>>>On 09/02/2022 20:26, Christian König wrote:
>>>>>>It is illegal to add a dma_fence_chain as timeline point. Flatten out
>>>>>>the fences into a dma_fence_array instead.
>>>>>>
>>>>>>Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>---
>>>>>>  drivers/gpu/drm/drm_syncobj.c | 61 
>>>>>>++++++++++++++++++++++++++++++++---
>>>>>>  1 file changed, 56 insertions(+), 5 deletions(-)
>>>>>>
>>>>>>diff --git a/drivers/gpu/drm/drm_syncobj.c 
>>>>>>b/drivers/gpu/drm/drm_syncobj.c
>>>>>>index c313a5b4549c..7e48dcd1bee4 100644
>>>>>>--- a/drivers/gpu/drm/drm_syncobj.c
>>>>>>+++ b/drivers/gpu/drm/drm_syncobj.c
>>>>>>@@ -853,12 +853,57 @@ drm_syncobj_fd_to_handle_ioctl(struct 
>>>>>>drm_device *dev, void *data,
>>>>>>                      &args->handle);
>>>>>>  }
>>>>>>  +
>>>>>>+/*
>>>>>>+ * Try to flatten a dma_fence_chain into a dma_fence_array 
>>>>>>so that it can be
>>>>>>+ * added as timeline fence to a chain again.
>>>>>>+ */
>>>>>>+static int drm_syncobj_flatten_chain(struct dma_fence **f)
>>>>>>+{
>>>>>>+    struct dma_fence_chain *chain = to_dma_fence_chain(*f);
>>>>>>+    struct dma_fence *tmp, **fences;
>>>>>>+    struct dma_fence_array *array;
>>>>>>+    unsigned int count;
>>>>>>+
>>>>>>+    if (!chain)
>>>>>>+        return 0;
>>>>>>+
>>>>>>+    count = 0;
>>>>>>+    dma_fence_chain_for_each(tmp, &chain->base)
>>>>>>+        ++count;
>>>>>>+
>>>>>>+    fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
>>>>>>+    if (!fences)
>>>>>>+        return -ENOMEM;
>>>>>>+
>>>>>>+    count = 0;
>>>>>>+    dma_fence_chain_for_each(tmp, &chain->base)
>>>>>>+        fences[count++] = dma_fence_get(tmp);
>>>>>>+
>>>>>>+    array = dma_fence_array_create(count, fences,
>>>>>>+                       dma_fence_context_alloc(1),
>>>>>
>>>>>
>>>>>Hi Christian,
>>>>>
>>>>>
>>>>>Sorry for the late answer to this.
>>>>>
>>>>>
>>>>>It appears this commit is trying to remove the warnings added 
>>>>>by "dma-buf: Warn about dma_fence_chain container rules"
>>>>
>>>>Yes, correct. We are now enforcing some rules with warnings and 
>>>>this here bubbled up.
>>>>
>>>>>
>>>>>But the context allocation you added just above is breaking 
>>>>>some tests. In particular 
>>>>>igt@syncobj_timeline@transfer-timeline-point
>>>>>
>>>>>That test transfer points into the timeline at point 3 and 
>>>>>expects that we'll still on the previous points to complete.
>>>>
>>>>Hui what? I don't understand the problem you are seeing here. 
>>>>What exactly is the test doing?
>>>>
>>>>>
>>>>>In my opinion we should be reusing the previous context number 
>>>>>if there is one and only allocate if we don't have a point.
>>>>
>>>>Scratching my head what you mean with that. The functionality 
>>>>transfers a synchronization fence from one timeline to another.
>>>>
>>>>So as far as I can see the new point should be part of the 
>>>>timeline of the syncobj we are transferring to.
>>>>
>>>>>If the application wants to not depend on previous points for 
>>>>>wait operations, it can reset the syncobj prior to adding a 
>>>>>new point.
>>>>
>>>>Well we should never lose synchronization. So what happens is 
>>>>that when we do the transfer all the fences of the source are 
>>>>flattened out into an array. And that array is then added as new 
>>>>point into the destination timeline.
>>>
>>>
>>>In this case would be broken :
>>>
>>>
>>>syncobjA <- signal point 1
>>>
>>>syncobjA <- import syncobjB point 1 into syncobjA point 2
>>>
>>>syncobjA <- query returns 0
>>>
>>>
>>>-Lionel
>>
>>
>>Err... Let's double check with my colleagues.
>>
>>It seems we're running into a test failure in IGT with this patch, 
>>but now I have doubts that it's where the problem lies.
>
>Yeah, exactly that's what I couldn't understand as well.
>
>What you describe above should still work fine.
>
>Thanks for taking a look into this,
>Christian.

With some additional prints:

[  210.742634] Console: switching to colour dummy device 80x25
[  210.742686] [IGT] syncobj_timeline: executing
[  210.756988] [IGT] syncobj_timeline: starting subtest transfer-timeline-point
[  210.757364] [drm:drm_syncobj_transfer_ioctl] *ERROR* adding fence0 signaled=1
[  210.764543] [drm:drm_syncobj_transfer_ioctl] *ERROR* resulting array fence signaled=0
[  210.800469] [IGT] syncobj_timeline: exiting, ret=98
[  210.825426] Console: switching to colour frame buffer device 240x67


still learning this part of the code but AFAICS the problem is because
when we are creating the array, the 'signaled' doesn't propagate to the
array.

dma_fence_array_create() {
	...
	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
	...
}

This is not considering the fact that some of the fences could already
have been signaled as is the case in the igt@syncobj_timeline@transfer-timeline-point
test. See https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11693/shard-dg1-12/igt@syncobj_timeline@transfer-timeline-point.html

Quick patch on this function fixes it for me:

---------8<----------------
Subject: [PATCH] dma-buf: Honor already signaled fences on array creation

When creating an array, array->num_pending is marked with the number of
fences. However the fences could alredy have been signaled. Propagate
num_pending to the array by looking at each individual fence the array
contains.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
  drivers/dma-buf/dma-fence-array.c | 11 ++++++++++-
  1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..32f491c32fa0 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -158,6 +158,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
  {
  	struct dma_fence_array *array;
  	size_t size = sizeof(*array);
+	unsigned num_pending = 0;
+	struct dma_fence **f;
  
  	WARN_ON(!num_fences || !fences);
  
@@ -173,7 +175,14 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
  	init_irq_work(&array->work, irq_dma_fence_array_work);
  
  	array->num_fences = num_fences;
-	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
+
+	for (f = fences; f < fences + num_fences; f++)
+		num_pending += !dma_fence_is_signaled(*f);
+
+	if (signal_on_any)
+		num_pending = !!num_pending;
+
+	atomic_set(&array->num_pending, num_pending);
  	array->fences = fences;
  
  	array->base.error = PENDING_ERROR;
-- 
2.36.1
-----------------8<-------------------------

Not being too familiar with this code, I'm not sure about locking needed
here though. Would it be possible that while we are adding the fences
one of them is signaled and then array->num_pending gets out of sync
with the fences?

This fixes the result for me, but I still get the warning
WARN_ON(dma_fence_is_container(fences[num_fences])):

[ 1083.189164] ------------[ cut here ]------------
[ 1083.189169] WARNING: CPU: 2 PID: 6561 at drivers/dma-buf/dma-fence-array.c:202 dma_fence_array_create+0x155/0x1a0
[ 1083.189185] Modules linked in: i915 ttm drm_buddy drm_display_helper drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops prime_numbers fuse x86_pkg_temp_thermal coretemp kvm_intel mei_hdcp kvm irqbypass mei_me mei crct10dif_pclmul crc32_pclmul e1000e ghash_clmulni_intel ptp i2c_i801 pps_core i2c_smbus intel_lpss_pci
[ 1083.189240] CPU: 2 PID: 6561 Comm: syncobj_timelin Not tainted 5.18.0-demarchi+ #4
[ 1083.189245] Hardware name: Intel Corporation Tiger Lake Client Platform/TBD, BIOS TGLSFWI1.R00.3024.A25.2004152248 04/15/2020
[ 1083.189247] RIP: 0010:dma_fence_array_create+0x155/0x1a0
[ 1083.189253] Code: ff 85 c9 75 10 eb 2a 48 81 fa a0 a6 0a 82 74 1a 83 e8 01 72 1c 48 63 d0 48 8b 54 d5 00 48 8b 52 08 48 81 fa 00 a7 0a 82 75 dd <0f> 0b 83 e8 01 73 e4 48 83 c4 08 4c 89 f0 5b 5d 41 5c 41 5d 41 5e
[ 1083.189256] RSP: 0018:ffffc900012b7d30 EFLAGS: 00010246
[ 1083.189261] RAX: 0000000000000000 RBX: ffff88810d1c2418 RCX: 0000000000000001
[ 1083.189264] RDX: ffffffff820aa700 RSI: ffffffff822d6807 RDI: ffffffff82330a7f
[ 1083.189266] RBP: ffff88810d1c2410 R08: 0000000000000000 R09: 0000000000000001
[ 1083.189268] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
[ 1083.189271] R13: ffff88810d1c2418 R14: ffff88811d935100 R15: ffff88812feabbd8
[ 1083.189273] FS:  00007f715ea16540(0000) GS:ffff88888fd00000(0000) knlGS:0000000000000000
[ 1083.189276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1083.189279] CR2: 00007ffd80de7d20 CR3: 0000000130472001 CR4: 0000000000770ee0
[ 1083.189282] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 1083.189284] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 1083.189286] PKRU: 55555554
[ 1083.189288] Call Trace:
[ 1083.189290]  <TASK>
[ 1083.189297]  drm_syncobj_transfer_ioctl+0x1bb/0x490
[ 1083.189307]  ? drm_syncobj_fd_to_handle_ioctl+0x330/0x330
[ 1083.189314]  drm_ioctl_kernel+0xac/0x140
[ 1083.189324]  drm_ioctl+0x1fa/0x3d0
[ 1083.189329]  ? drm_syncobj_fd_to_handle_ioctl+0x330/0x330
[ 1083.189347]  __x64_sys_ioctl+0x7d/0xa0
[ 1083.189358]  do_syscall_64+0x38/0x90
[ 1083.189370]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 1083.189375] RIP: 0033:0x7f715f6b53ab
[ 1083.189379] Code: 0f 1e fa 48 8b 05 e5 7a 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b5 7a 0d 00 f7 d8 64 89 01 48
[ 1083.189382] RSP: 002b:00007ffd80dea8f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 1083.189386] RAX: ffffffffffffffda RBX: 00007ffd80dea930 RCX: 00007f715f6b53ab
[ 1083.189389] RDX: 00007ffd80dea930 RSI: 00000000c02064cc RDI: 0000000000000003
[ 1083.189391] RBP: 00000000c02064cc R08: 0000000000000002 R09: 0000000000000000
[ 1083.189393] R10: 00007f715f7fd20d R11: 0000000000000246 R12: 00007ffd80dea98c
[ 1083.189395] R13: 0000000000000003 R14: 0000000000000005 R15: 0000000000000000
[ 1083.189409]  </TASK>
[ 1083.189412] irq event stamp: 24265
[ 1083.189414] hardirqs last  enabled at (24271): [<ffffffff8112ee82>] __up_console_sem+0x62/0x70
[ 1083.189421] hardirqs last disabled at (24276): [<ffffffff8112ee67>] __up_console_sem+0x47/0x70
[ 1083.189424] softirqs last  enabled at (20506): [<ffffffff810b93a2>] irq_exit_rcu+0xd2/0x130
[ 1083.189428] softirqs last disabled at (20501): [<ffffffff810b93a2>] irq_exit_rcu+0xd2/0x130
[ 1083.189431] ---[ end trace 0000000000000000 ]---
[ 1083.189768] [IGT] syncobj_timeline: exiting, ret=0
[ 1083.191764] Console: switching to colour frame buffer device 240x67

Lucas De Marchi

>
>>
>>
>>-Lionel
>>
>>
>>>
>>>
>>>>
>>>>Where exactly is the problem?
>>>>
>>>>Regards,
>>>>Christian.
>>>>
>>>>>
>>>>>
>>>>>
>>>>>Cheers,
>>>>>
>>>>>
>>>>>-Lionel
>>>>>
>>>>>
>>>>>
>>>>>>+                       1, false);
>>>>>>+    if (!array)
>>>>>>+        goto free_fences;
>>>>>>+
>>>>>>+    dma_fence_put(*f);
>>>>>>+    *f = &array->base;
>>>>>>+    return 0;
>>>>>>+
>>>>>>+free_fences:
>>>>>>+    while (count--)
>>>>>>+        dma_fence_put(fences[count]);
>>>>>>+
>>>>>>+    kfree(fences);
>>>>>>+    return -ENOMEM;
>>>>>>+}
>>>>>>+
>>>>>>  static int drm_syncobj_transfer_to_timeline(struct 
>>>>>>drm_file *file_private,
>>>>>>                          struct drm_syncobj_transfer *args)
>>>>>>  {
>>>>>>      struct drm_syncobj *timeline_syncobj = NULL;
>>>>>>-    struct dma_fence *fence;
>>>>>>      struct dma_fence_chain *chain;
>>>>>>+    struct dma_fence *fence;
>>>>>>      int ret;
>>>>>>        timeline_syncobj = drm_syncobj_find(file_private, 
>>>>>>args->dst_handle);
>>>>>>@@ -869,16 +914,22 @@ static int 
>>>>>>drm_syncobj_transfer_to_timeline(struct drm_file 
>>>>>>*file_private,
>>>>>>                       args->src_point, args->flags,
>>>>>>                       &fence);
>>>>>>      if (ret)
>>>>>>-        goto err;
>>>>>>+        goto err_put_timeline;
>>>>>>+
>>>>>>+    ret = drm_syncobj_flatten_chain(&fence);
>>>>>>+    if (ret)
>>>>>>+        goto err_free_fence;
>>>>>>+
>>>>>>      chain = dma_fence_chain_alloc();
>>>>>>      if (!chain) {
>>>>>>          ret = -ENOMEM;
>>>>>>-        goto err1;
>>>>>>+        goto err_free_fence;
>>>>>>      }
>>>>>>+
>>>>>>      drm_syncobj_add_point(timeline_syncobj, chain, fence, 
>>>>>>args->dst_point);
>>>>>>-err1:
>>>>>>+err_free_fence:
>>>>>>      dma_fence_put(fence);
>>>>>>-err:
>>>>>>+err_put_timeline:
>>>>>>      drm_syncobj_put(timeline_syncobj);
>>>>>>        return ret;
>>>>>
>>>>>
>>>>
>>>
>>
>
