Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A25205B1
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 22:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D612E10E422;
	Mon,  9 May 2022 20:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1407410E422
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 20:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9EXZ94ekDVHmeD8TA1v+QTPTpGzAZJnvsRP1nXnRkRc=; b=SIVK9gq0OZgxoVfCu3II57DuXe
 OiUjoW8LACsPpJI/Vvtzt6spfR/X4AUr/ueZOnl4RaHEBQXM0UXTWgZ+NU9bPAkyaJRXDD3YqZVdC
 mI3sKAUp+1QAtzmBZTz5B8AgK4GM0K67hoRL8y7NRCm8GBTPn3+zrIUArGOyYh60xGHdlut+Rb0IW
 Usd1lQSy2zOMLVYKu/sUtBDe20nMkcJL7ANcEOJkC6HnZrxOzIDsIMd7xowKepkQlyuw+L55wgvWW
 L8v2z5hgNMzFLCQX9181H7zL8jP8kxzFnJ9BgcyRyfIkHGvd2fsfSApYlqwvHTmCUX1cgeoNhb/tO
 rdW7KxSQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=53833)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1no9iT-0007PK-GC; Mon, 09 May 2022 22:10:49 +0200
Message-ID: <c9401901-bd7c-e162-6a23-ce6815a432e6@tronnes.org>
Date: Mon, 9 May 2022 22:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/5] drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20210730183511.20080-1-tzimmermann@suse.de>
 <20210730183511.20080-5-tzimmermann@suse.de>
 <9a6889dd-7fb3-2622-bae5-f9dd31a38856@tronnes.org>
 <5f17f381-0200-5dff-443f-80f8e6d8f47e@suse.de>
 <6deb6fcc-ee6c-9fc3-ad00-faf7352781ce@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <6deb6fcc-ee6c-9fc3-ad00-faf7352781ce@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 09.05.2022 10.32, skrev Thomas Zimmermann:
> Hi Noralf
> 
> Am 06.05.22 um 16:11 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 06.05.22 um 16:01 schrieb Noralf Trønnes:
>>> Hi Thomas,
>>>
>>> I'm getting this on Ubuntu 22.04:
>>>
>>> [    0.000000] Linux version 5.15.0-27-generic (buildd@ubuntu) (gcc
>>> (Ubuntu 11.2.0-19ubuntu1) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.38)
>>> #28-Ubuntu SMP Thu Apr 14 04:55:28 UTC 2022 (Ubuntu 5.15.0-27.28-generic
>>> 5.15.30)
>>>
>>> [    4.830866] usb 2-3.1: new high-speed USB device number 4 using
>>> xhci_hcd
>>> [    4.935546] usb 2-3.1: New USB device found, idVendor=1d50,
>>> idProduct=614d, bcdDevice= 1.00
>>> [    4.935553] usb 2-3.1: New USB device strings: Mfr=1, Product=2,
>>> SerialNumber=3
>>> [    4.935556] usb 2-3.1: Product: Raspberry Pi 4 Display Gadget
>>> [    4.935558] usb 2-3.1: Manufacturer: Raspberry Pi
>>> [    4.935560] usb 2-3.1: SerialNumber: 100000003b40d6c6
>>>
>>> [    7.497361] [drm] Initialized gud 1.0.0 20200422 for 2-3.1:1.0 on
>>> minor 0
>>>
>>> [    7.573048] gud 2-3.1:1.0: [drm] fb1: guddrmfb frame buffer device
>>>
>>> [    9.199402]
>>> ================================================================================
>>>
>>> [    9.199411] UBSAN: invalid-load in
>>> /build/linux-HMZHpV/linux-5.15.0/include/linux/dma-buf-map.h:224:9
>>> [    9.199416] load of value 226 is not a valid value for type '_Bool'
>>> [    9.199420] CPU: 0 PID: 113 Comm: kworker/0:2 Not tainted
>>> 5.15.0-27-generic #28-Ubuntu
>>> [    9.199424] Hardware name: Hewlett-Packard HP EliteBook 820 G1/1991,
>>> BIOS L71 Ver. 01.44 04/12/2018
>>> [    9.199427] Workqueue: events_long gud_flush_work [gud]
>>> [    9.199440] Call Trace:
>>> [    9.199443]  <TASK>
>>> [    9.199447]  show_stack+0x52/0x58
>>> [    9.199456]  dump_stack_lvl+0x4a/0x5f
>>> [    9.199464]  dump_stack+0x10/0x12
>>> [    9.199468]  ubsan_epilogue+0x9/0x45
>>> [    9.199473]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
>>> [    9.199478]  drm_gem_fb_vmap.cold+0x10/0x3d [drm_kms_helper]
>>> [    9.199519]  gud_prep_flush+0xaa/0x410 [gud]
>>> [    9.199525]  ? check_preempt_curr+0x5d/0x70
>>> [    9.199533]  ? update_load_avg+0x82/0x620
>>> [    9.199540]  ? set_next_entity+0xb7/0x200
>>> [    9.199545]  gud_flush_work+0x1e0/0x430 [gud]
>>> [    9.199551]  ? psi_task_switch+0x1e7/0x220
>>> [    9.199557]  process_one_work+0x22b/0x3d0
>>> [    9.199564]  worker_thread+0x53/0x410
>>> [    9.199570]  ? process_one_work+0x3d0/0x3d0
>>> [    9.199575]  kthread+0x12a/0x150
>>> [    9.199579]  ? set_kthread_struct+0x50/0x50
>>> [    9.199584]  ret_from_fork+0x22/0x30
>>> [    9.199593]  </TASK>
>>> [    9.199595]
>>> ================================================================================
>>>
>>>
>>> [    9.199598]
>>> ================================================================================
>>>
>>> [    9.199600] UBSAN: invalid-load in
>>> /build/linux-HMZHpV/linux-5.15.0/include/linux/dma-buf-map.h:194:9
>>> [    9.199604] load of value 226 is not a valid value for type '_Bool'
>>> [    9.199606] CPU: 0 PID: 113 Comm: kworker/0:2 Not tainted
>>> 5.15.0-27-generic #28-Ubuntu
>>> [    9.199610] Hardware name: Hewlett-Packard HP EliteBook 820 G1/1991,
>>> BIOS L71 Ver. 01.44 04/12/2018
>>> [    9.199612] Workqueue: events_long gud_flush_work [gud]
>>> [    9.199618] Call Trace:
>>> [    9.199619]  <TASK>
>>> [    9.199621]  show_stack+0x52/0x58
>>> [    9.199627]  dump_stack_lvl+0x4a/0x5f
>>> [    9.199633]  dump_stack+0x10/0x12
>>> [    9.199637]  ubsan_epilogue+0x9/0x45
>>> [    9.199641]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
>>> [    9.199646]  drm_gem_fb_vmap.cold+0x24/0x3d [drm_kms_helper]
>>> [    9.199675]  gud_prep_flush+0xaa/0x410 [gud]
>>> [    9.199682]  ? check_preempt_curr+0x5d/0x70
>>> [    9.199688]  ? update_load_avg+0x82/0x620
>>> [    9.199693]  ? update_load_avg+0x82/0x620
>>> [    9.199697]  gud_flush_work+0x1e0/0x430 [gud]
>>> [    9.199702]  ? psi_task_switch+0x1e7/0x220
>>> [    9.199706]  process_one_work+0x22b/0x3d0
>>> [    9.199713]  worker_thread+0x53/0x410
>>> [    9.199718]  ? process_one_work+0x3d0/0x3d0
>>> [    9.199723]  kthread+0x12a/0x150
>>> [    9.199728]  ? set_kthread_struct+0x50/0x50
>>> [    9.199732]  ret_from_fork+0x22/0x30
>>> [    9.199741]  </TASK>
>>> [    9.199743]
>>> ================================================================================
>>>
>>>
>>> It's the "if (map->is_iomem)" statement in dma_buf_map_clear() and
>>> dma_buf_map_is_null() that triggers this.
>>>
>>> I tried 5.18.0-rc5 and the problem is still present.
>>>
>>> UBSAN entries in the config:
>>>
>>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
>>> CONFIG_UBSAN=y
>>> # CONFIG_UBSAN_TRAP is not set
>>> CONFIG_CC_HAS_UBSAN_BOUNDS=y
>>> CONFIG_UBSAN_BOUNDS=y
>>> CONFIG_UBSAN_ONLY_BOUNDS=y
>>> CONFIG_UBSAN_SHIFT=y
>>> # CONFIG_UBSAN_DIV_ZERO is not set
>>> CONFIG_UBSAN_BOOL=y
>>> CONFIG_UBSAN_ENUM=y
>>> # CONFIG_UBSAN_ALIGNMENT is not set
>>> CONFIG_UBSAN_SANITIZE_ALL=y
>>> # CONFIG_TEST_UBSAN is not set
>>>
>>> Continuing further down.
>>>
>>>
>>> Den 30.07.2021 20.35, skrev Thomas Zimmermann:
>>>> Abstract the framebuffer details by mapping its BOs with a call
>>>> to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunmap().
>>>>
>>>> The call to drm_gem_fb_vmap() ensures that all BOs are mapped
>>>> correctly. Gud still only supports single-plane formats.
>>>>
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Acked-by: Noralf Trønnes <noralf@tronnes.org>
>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>> ---
>>>>   drivers/gpu/drm/gud/gud_pipe.c | 10 +++++-----
>>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/gud/gud_pipe.c
>>>> b/drivers/gpu/drm/gud/gud_pipe.c
>>>> index 4d7a26b68a2e..7e009f562b30 100644
>>>> --- a/drivers/gpu/drm/gud/gud_pipe.c
>>>> +++ b/drivers/gpu/drm/gud/gud_pipe.c
>>>> @@ -14,8 +14,8 @@
>>>>   #include <drm/drm_format_helper.h>
>>>>   #include <drm/drm_fourcc.h>
>>>>   #include <drm/drm_framebuffer.h>
>>>> +#include <drm/drm_gem.h>
>>>>   #include <drm/drm_gem_framebuffer_helper.h>
>>>> -#include <drm/drm_gem_shmem_helper.h>
>>>>   #include <drm/drm_print.h>
>>>>   #include <drm/drm_rect.h>
>>>>   #include <drm/drm_simple_kms_helper.h>
>>>> @@ -152,7 +152,7 @@ static int gud_prep_flush(struct gud_device
>>>> *gdrm, struct drm_framebuffer *fb,
>>>>   {
>>>>       struct dma_buf_attachment *import_attach =
>>>> fb->obj[0]->import_attach;
>>>>       u8 compression = gdrm->compression;
>>>> -    struct dma_buf_map map;
>>>> +    struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>>>
>>> Zeroing map solves the problem:
>>>
>>>          struct iosys_map map[DRM_FORMAT_MAX_PLANES] = {};
>>>
>>> I don't understand the conditional clearing in
>>> dma_buf_map_clear/iosys_map_clear(), the doc says: Clears all fields to
>>> zero. If I zero the whole structure unconditionally this also keeps
>>> UBSAN happy.
> 
> iomap_sys_clear() assumes that the instance is already initialized.
> Hence, calling it at [1] with un-zeroed, stack-allocated memory operates
> on undefined state.  It doesn't matter for the result, though.  I guess
> the semantics of iosys_sys_clear() are not stellar.
> 

I did a quick look through the struct iosys_map users and found these
using a stack allocated variable that has not been initialized:

These call dma_buf_vmap() directly:
drm_gem_cma_prime_import_sg_table_vmap
igt_dmabuf_export_vmap
igt_dmabuf_import_ownership
igt_dmabuf_import
etnaviv_gem_prime_vmap_impl

Ends up calling dma_buf_vmap() if the bo is imported:
panfrost_perfcnt_enable_locked
lima_sched_build_error_task_list
tegra_bo_mmap
mipi_dbi_fb_dirty
mipi_dbi_buf_copy
gud_prep_flush

Ends up calling iosys_map_is_null() at least:
ast_cursor_plane_init

Ends up calling iosys_map_is_equal():
ast_cursor_plane_destroy

>>
>> Thanks for debugging this problem. It's uninitialized and some of the
>> internal helpers look at all planes, even if they are empty. I have a
>> patchset to fix that throughout the DRM modules. I'll post on Monday.
> 
> I have posted that patchset at [2]. If you have the time, I'd appreciate
> if you could give it a test run.
> 

I'll see if I can do that.

Noralf.

> Best regards
> Thomas
> 
> [1]
> https://elixir.bootlin.com/linux/v5.17.5/source/drivers/gpu/drm/drm_gem_framebuffer_helper.c#L348
> 
> [2]
> https://lore.kernel.org/dri-devel/20220509081602.474-1-tzimmermann@suse.de/T/#t
> 
> 
>>
>> If we need a quick fix, we could do the zeroing everywhere.
>>
>> Best regards
>> Thomas
>>
>>>
>>> Noralf.
>>>
>>>>       void *vaddr, *buf;
>>>>       size_t pitch, len;
>>>>       int ret = 0;
>>>> @@ -162,11 +162,11 @@ static int gud_prep_flush(struct gud_device
>>>> *gdrm, struct drm_framebuffer *fb,
>>>>       if (len > gdrm->bulk_len)
>>>>           return -E2BIG;
>>>> -    ret = drm_gem_shmem_vmap(fb->obj[0], &map);
>>>> +    ret = drm_gem_fb_vmap(fb, map);
>>>>       if (ret)
>>>>           return ret;
>>>> -    vaddr = map.vaddr + fb->offsets[0];
>>>> +    vaddr = map[0].vaddr + fb->offsets[0];
>>>>       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>>>>       if (ret)
>>>> @@ -225,7 +225,7 @@ static int gud_prep_flush(struct gud_device
>>>> *gdrm, struct drm_framebuffer *fb,
>>>>   end_cpu_access:
>>>>       drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>>>>   vunmap:
>>>> -    drm_gem_shmem_vunmap(fb->obj[0], &map);
>>>> +    drm_gem_fb_vunmap(fb, map);
>>>>       return ret;
>>>>   }
>>
> 
