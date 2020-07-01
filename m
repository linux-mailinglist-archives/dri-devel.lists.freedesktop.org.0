Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476192108FB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 12:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79B6E887;
	Wed,  1 Jul 2020 10:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80CF6E884
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:10:32 +0000 (UTC)
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id E7B6DF445EE771926D20;
 Wed,  1 Jul 2020 18:10:27 +0800 (CST)
Received: from dggeme768-chm.china.huawei.com (10.3.19.114) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 1 Jul 2020 18:10:27 +0800
Received: from [10.174.177.240] (10.174.177.240) by
 dggeme768-chm.china.huawei.com (10.3.19.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 1 Jul 2020 18:10:26 +0800
Subject: Re: [PATCH] drm: fix double free for gbo in drm_gem_vram_init and
 drm_gem_vram_create
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20200620062134.82961-1-jiayang5@huawei.com>
 <b6410a5e-2649-ba17-b4fe-eb24dab45253@huawei.com>
 <9ab7bd1e-93b2-6867-aea8-239fb848b3bb@suse.de>
From: Jia Yang <jiayang5@huawei.com>
Message-ID: <ab274c09-b5e8-5e5e-77e1-1f0ba3d23ead@huawei.com>
Date: Wed, 1 Jul 2020 18:10:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9ab7bd1e-93b2-6867-aea8-239fb848b3bb@suse.de>
X-Originating-IP: [10.174.177.240]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggeme768-chm.china.huawei.com (10.3.19.114)
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for your suggestion, I can make the patch. But the
problem is reported by tool "Hulk Robot" and only happen
one time. No scripts are left, so I have no exact environment
to test.


On 2020/7/1 14:56, Thomas Zimmermann wrote:
> Hi
> 
> Thanks for the patch and apologies for being late with the review.
> 
> The fix is good, but I'd like to see different approach. I'd rather have
> drm_gem_vram_init() being integrated into drm_gem_vram_create().
> 
> Do you prefer to make the patch or shall I type up something? Would you
> be able to test?
> 
> I have some comments on the resulting changes below.
> 
> Am 01.07.20 um 04:32 schrieb Jia Yang:
>> Ping...
>>
>> On 2020/6/20 14:21, Jia Yang wrote:
>>> I got a use-after-free report when doing some fuzz test:
>>>
>>> If ttm_bo_init() fails, the "gbo" and "gbo->bo.base" will be
>>> freed by ttm_buffer_object_destroy() in ttm_bo_init(). But
>>> then drm_gem_vram_create() and drm_gem_vram_init() will free
>>> "gbo" and "gbo->bo.base" again.
>>>
>>> BUG: KMSAN: use-after-free in drm_vma_offset_remove+0xb3/0x150
>>> CPU: 0 PID: 24282 Comm: syz-executor.1 Tainted: G    B   W         5.7.0-rc4-msan #2
>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014
>>> Call Trace:
>>>  __dump_stack
>>>  dump_stack+0x1c9/0x220
>>>  kmsan_report+0xf7/0x1e0
>>>  __msan_warning+0x58/0xa0
>>>  drm_vma_offset_remove+0xb3/0x150
>>>  drm_gem_free_mmap_offset
>>>  drm_gem_object_release+0x159/0x180
>>>  drm_gem_vram_init
>>>  drm_gem_vram_create+0x7c5/0x990
>>>  drm_gem_vram_fill_create_dumb
>>>  drm_gem_vram_driver_dumb_create+0x238/0x590
>>>  drm_mode_create_dumb
>>>  drm_mode_create_dumb_ioctl+0x41d/0x450
>>>  drm_ioctl_kernel+0x5a4/0x710
>>>  drm_ioctl+0xc6f/0x1240
>>>  vfs_ioctl
>>>  ksys_ioctl
>>>  __do_sys_ioctl
>>>  __se_sys_ioctl+0x2e9/0x410
>>>  __x64_sys_ioctl+0x4a/0x70
>>>  do_syscall_64+0xb8/0x160
>>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> RIP: 0033:0x4689b9
>>> Code: fd e0 fa ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 cb e0 fa ff c3 66 2e 0f 1f 84 00 00 00 00
>>> RSP: 002b:00007f368fa4dc98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>>> RAX: ffffffffffffffda RBX: 000000000076bf00 RCX: 00000000004689b9
>>> RDX: 0000000020000240 RSI: 00000000c02064b2 RDI: 0000000000000003
>>> RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
>>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>>> R13: 00000000004d17e0 R14: 00007f368fa4e6d4 R15: 000000000076bf0c
>>>
>>> Uninit was created at:
>>>  kmsan_save_stack_with_flags
>>>  kmsan_internal_poison_shadow+0x66/0xd0
>>>  kmsan_slab_free+0x6e/0xb0
>>>  slab_free_freelist_hook
>>>  slab_free
>>>  kfree+0x571/0x30a0
>>>  drm_gem_vram_destroy
>>>  ttm_buffer_object_destroy+0xc8/0x130
>>>  ttm_bo_release
>>>  kref_put
>>>  ttm_bo_put+0x117d/0x23e0
>>>  ttm_bo_init_reserved+0x11c0/0x11d0
>>>  ttm_bo_init+0x289/0x3f0
>>>  drm_gem_vram_init
>>>  drm_gem_vram_create+0x775/0x990
>>>  drm_gem_vram_fill_create_dumb
>>>  drm_gem_vram_driver_dumb_create+0x238/0x590
>>>  drm_mode_create_dumb
>>>  drm_mode_create_dumb_ioctl+0x41d/0x450
>>>  drm_ioctl_kernel+0x5a4/0x710
>>>  drm_ioctl+0xc6f/0x1240
>>>  vfs_ioctl
>>>  ksys_ioctl
>>>  __do_sys_ioctl
>>>  __se_sys_ioctl+0x2e9/0x410
>>>  __x64_sys_ioctl+0x4a/0x70
>>>  do_syscall_64+0xb8/0x160
>>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>
>>> If ttm_bo_init() fails, the "gbo" will be freed by
>>> ttm_buffer_object_destroy() in ttm_bo_init(). But then
>>> drm_gem_vram_create() and drm_gem_vram_init() will free
>>> "gbo" again.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Jia Yang <jiayang5@huawei.com>
>>> ---
>>>  drivers/gpu/drm/drm_gem_vram_helper.c | 28 +++++++++++++++------------
>>>  1 file changed, 16 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> index 8b2d5c945c95..1d85af9a481a 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -175,6 +175,10 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
>>>  	}
>>>  }
>>>  
>>> +/*
>>> + * Note that on error, drm_gem_vram_init will free the buffer object.
>>> + */
>>> +
> 
> This comment could go away.
> 
>>>  static int drm_gem_vram_init(struct drm_device *dev,
>>>  			     struct drm_gem_vram_object *gbo,
>>>  			     size_t size, unsigned long pg_align)
>>> @@ -184,15 +188,19 @@ static int drm_gem_vram_init(struct drm_device *dev,
>>>  	int ret;
>>>  	size_t acc_size;
>>>  
>>> -	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
>>> +	if (WARN_ONCE(!vmm, "VRAM MM not initialized")) {
>>> +		kfree(gbo);
>>>  		return -EINVAL;
>>> +	}
> 
> This test can go to the top of drm_gem_vram_create()
> 
>>>  	bdev = &vmm->bdev;
>>>  
>>>  	gbo->bo.base.funcs = &drm_gem_vram_object_funcs;
>>>  
>>>  	ret = drm_gem_object_init(dev, &gbo->bo.base, size);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		kfree(gbo);
>>>  		return ret;
>>> +	}
>>>  
>>>  	acc_size = ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
>>>  
>>> @@ -203,13 +211,13 @@ static int drm_gem_vram_init(struct drm_device *dev,
>>>  			  &gbo->placement, pg_align, false, acc_size,
>>>  			  NULL, NULL, ttm_buffer_object_destroy);
>>>  	if (ret)
>>> -		goto err_drm_gem_object_release;
>>> +		/*
>>> +		 * A failing ttm_bo_init will call ttm_buffer_object_destroy
>>> +		 * to release gbo->bo.base and kfree gbo.
>>> +		 */
>>> +		return ret;
> 
> The rest of this function would be inlined where the call to
> drm_gem_vram_init() currently happens.
> 
>>>  
>>>  	return 0;
>>> -
>>> -err_drm_gem_object_release:
>>> -	drm_gem_object_release(&gbo->bo.base);
>>> -	return ret;
>>>  }
>>>  
>>>  /**
>>> @@ -243,13 +251,9 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>>>  
>>>  	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
>>>  	if (ret < 0)
>>> -		goto err_kfree;
>>> +		return ERR_PTR(ret);
>>>  
>>>  	return gbo;
>>> -
>>> -err_kfree:
>>> -	kfree(gbo);
>>> -	return ERR_PTR(ret);
> 
> All inlined code up to ttm_bo_init() would jump to error labels on
> errors. ttm_bo_init() would return directly.
> 
> Best regards
> Thomas
> 
> 
>>>  }
>>>  EXPORT_SYMBOL(drm_gem_vram_create);
>>>  
>>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
