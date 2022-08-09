Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FFC58D1BE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 03:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4521135B0;
	Tue,  9 Aug 2022 01:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com
 [115.236.118.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A1CB8D4D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 01:28:41 +0000 (UTC)
Received: from [192.168.111.100] (unknown [58.22.7.114])
 by mail-m11885.qiye.163.com (Hmail) with ESMTPA id 613EC4C0545;
 Tue,  9 Aug 2022 09:28:37 +0800 (CST)
Message-ID: <cd806954-e94e-aec8-2b0c-4047da9a92ec@rock-chips.com>
Date: Tue, 9 Aug 2022 09:28:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [PATCH v2] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
 <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
 <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
From: Chen Jeffy <jeffy.chen@rock-chips.com>
In-Reply-To: <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR9MVkoZSE5CSkweT0lNHlUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NEk6SDo4LT06Iy8ZCTIQSzkc
 AggwCypVSlVKTU1LS0tDTkpDSUtJVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSUhDTTcG
X-HM-Tid: 0a828037d0932eb9kusn613ec4c0545
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 8/9 星期二 2:03, Christian König wrote:
> Hi Jeffy,
> 
> Am 08.08.22 um 05:51 schrieb Chen Jeffy:
>> Hi Christian,
>>
>> Thanks for your reply, and sorry i didn't make it clear.
>>
>> On 8/8 星期一 0:52, Christian König wrote:
>>> Am 03.08.22 um 10:32 schrieb Jeffy Chen:
>>>> Currently we are assuming a one to one mapping between dmabuf and 
>>>> handle
>>>> when releasing GEM handles.
>>>>
>>>> But that is not always true, since we would create extra handles for 
>>>> the
>>>> GEM obj in cases like gem_open() and getfb{,2}().
>>>>
>>>> A similar issue was reported at:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20211105083308.392156-1-jay.xu%40rock-chips.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cd7488e9f235041f7e84408da78f14882%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637955274964656400%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=9G2YbHcYUs1VQYyvjXwLzYawNw%2BP8i%2BjjPBSHx3r2yg%3D&amp;reserved=0
>>>>
>>>> Another problem is that the drm_gem_remove_prime_handles() now only
>>>> remove handle to the exported dmabuf (gem_obj->dma_buf), so the 
>>>> imported
>>>> ones would leak:
>>>> WARNING: CPU: 2 PID: 236 at drivers/gpu/drm/drm_prime.c:228 
>>>> drm_prime_destroy_file_private+0x18/0x24
>>>>
>>>> Let's fix these by using handle to find the exact map to remove.
>>>
>>> Well we are clearly something missing here. As far as I can see the 
>>> current code is correct.
>>>
>>> Creating multiple GEM handles for the same DMA-buf is possible, but 
>>> illegal. >
>>> In other words when a GEM handle is exported as DMA-buf and imported 
>>> again you should intentionally always get the same handle.
>>
>> These issue are not about having handles for importing an exported 
>> dma-buf case, but for having multiple handles to a GEM object(which 
>> means having multiple handles to a dma-buf).
>>
>> I know the drm-prime is trying to make dma-buf and handle maps one to 
>> one, but the drm-gem is allowing to create extra handles for a GEM 
>> object, for example:
>> drm_gem_open_ioctl -> drm_gem_handle_create_tail
>> drm_mode_getfb2_ioctl -> drm_gem_handle_create
>> drm_mode_getfb -> fb->funcs->create_handle
> 
> Yes, so far that's correct.
> 
>>
>>
>> So we are allowing GEM object to have multiple handles, and GEM object 
>> could have at most one dma-buf, doesn't that means that dma-buf could 
>> map to multiple handles?
> 
> No, at least not for the same GEM file private. That's the reason why 
> the rb is indexed by the dma_buf object and not the handle.
> 
> In other words the rb is so that you have exactly one handle for each 
> dma_buf in each file private.

I don't think so, because if user get multiple handles for the same GEM 
obj and use drm_gem_prime_handle_to_fd() for those handles, the current 
code would try to add multiple maps to rb:
drm_prime_add_buf_handle(buf_1, hdl_1)
drm_prime_add_buf_handle(buf_1, hdl_2)
...
drm_prime_add_buf_handle(buf_1, hdl_n)

> 
>>
>> Or should we rewrite the GEM framework to limit GEM object with uniq 
>> handle?
> 
> No, the extra handles are expected because when you call 
> drm_mode_getfb*() and drm_gem_open_ioctl() the caller now owns the 
> returned GEM handle.
> 
>>
>> The other issue is that we are leaking dma-buf <-> handle map for the 
>> imported dma-buf, since the drm_gem_remove_prime_handles doesn't take 
>> care of obj->import_attach->dmabuf.
> 
> No, that's correct as well. obj->dma_buf is set even for imported 
> DMA-buf objects. See drm_gem_prime_fd_to_handle().

Well, that obj->dma_buf would be set in 
drm_gem_prime_fd_to_handle(create new handle), and cleared when 
releasing the latest handle(release handle).

So it doesn't cover other handle creating path.

For example, a imported dma buf:
drm_gem_prime_fd_to_handle <-- we got a handle and obj->dma_buf and 
obj->import_attach->dmabuf
drm_gem_handle_delete <-- we lost that handle and obj->dma_buf cleared
drm_gem_open_ioctl/or getfb* <-- we got a new handle and 
obj->import_attach->dmabuf
drm_gem_handle_delete <-- we lost that handle and obj->dma_buf is null, 
which means rb leaks.

> 
> Regards,
> Christian.
> 
>>
>> But of cause this can be fixed in other way:
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -180,6 +180,9 @@ drm_gem_remove_prime_handles(struct drm_gem_object 
>> *obj, struct drm_file *filp)
>> drm_prime_remove_buf_handle_locked(&filp->prime,
>> obj->dma_buf);
>>         }
>> +       if (obj->import_attach)
>> + drm_prime_remove_buf_handle_locked(&filp->prime,
>> + obj->import_attach->dmabuf);
>>         mutex_unlock(&filp->prime.lock);
>>  }
>>
>>
>>> So this is pretty much a clear NAK to this patch since it shouldn't 
>>> be necessary or something is seriously broken somewhere else.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> Fix a typo of rbtree.
>>>>
>>>>   drivers/gpu/drm/drm_gem.c      | 17 +----------------
>>>>   drivers/gpu/drm/drm_internal.h |  4 ++--
>>>>   drivers/gpu/drm/drm_prime.c    | 20 ++++++++++++--------
>>>>   3 files changed, 15 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>> index eb0c2d041f13..ed39da383570 100644
>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>> @@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct 
>>>> drm_device *dev,
>>>>   }
>>>>   EXPORT_SYMBOL(drm_gem_private_object_init);
>>>> -static void
>>>> -drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct 
>>>> drm_file *filp)
>>>> -{
>>>> -    /*
>>>> -     * Note: obj->dma_buf can't disappear as long as we still hold a
>>>> -     * handle reference in obj->handle_count.
>>>> -     */
>>>> -    mutex_lock(&filp->prime.lock);
>>>> -    if (obj->dma_buf) {
>>>> - drm_prime_remove_buf_handle_locked(&filp->prime,
>>>> -                           obj->dma_buf);
>>>> -    }
>>>> -    mutex_unlock(&filp->prime.lock);
>>>> -}
>>>> -
>>>>   /**
>>>>    * drm_gem_object_handle_free - release resources bound to 
>>>> userspace handles
>>>>    * @obj: GEM object to clean up.
>>>> @@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void *ptr, 
>>>> void *data)
>>>>       if (obj->funcs->close)
>>>>           obj->funcs->close(obj, file_priv);
>>>> -    drm_gem_remove_prime_handles(obj, file_priv);
>>>> +    drm_prime_remove_buf_handle(&file_priv->prime, id);
>>>>       drm_vma_node_revoke(&obj->vma_node, file_priv);
>>>>       drm_gem_object_handle_put_unlocked(obj);
>>>> diff --git a/drivers/gpu/drm/drm_internal.h 
>>>> b/drivers/gpu/drm/drm_internal.h
>>>> index 1fbbc19f1ac0..7bb98e6a446d 100644
>>>> --- a/drivers/gpu/drm/drm_internal.h
>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>>> @@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device 
>>>> *dev, void *data,
>>>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>>>> *prime_fpriv);
>>>>   void drm_prime_destroy_file_private(struct drm_prime_file_private 
>>>> *prime_fpriv);
>>>> -void drm_prime_remove_buf_handle_locked(struct 
>>>> drm_prime_file_private *prime_fpriv,
>>>> -                    struct dma_buf *dma_buf);
>>>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>>>> *prime_fpriv,
>>>> +                 uint32_t handle);
>>>>   /* drm_drv.c */
>>>>   struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>> index e3f09f18110c..bd5366b16381 100644
>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>> @@ -190,29 +190,33 @@ static int drm_prime_lookup_buf_handle(struct 
>>>> drm_prime_file_private *prime_fpri
>>>>       return -ENOENT;
>>>>   }
>>>> -void drm_prime_remove_buf_handle_locked(struct 
>>>> drm_prime_file_private *prime_fpriv,
>>>> -                    struct dma_buf *dma_buf)
>>>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>>>> *prime_fpriv,
>>>> +                 uint32_t handle)
>>>>   {
>>>>       struct rb_node *rb;
>>>> -    rb = prime_fpriv->dmabufs.rb_node;
>>>> +    mutex_lock(&prime_fpriv->lock);
>>>> +
>>>> +    rb = prime_fpriv->handles.rb_node;
>>>>       while (rb) {
>>>>           struct drm_prime_member *member;
>>>> -        member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>>>> -        if (member->dma_buf == dma_buf) {
>>>> +        member = rb_entry(rb, struct drm_prime_member, handle_rb);
>>>> +        if (member->handle == handle) {
>>>>               rb_erase(&member->handle_rb, &prime_fpriv->handles);
>>>>               rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>>>> -            dma_buf_put(dma_buf);
>>>> +            dma_buf_put(member->dma_buf);
>>>>               kfree(member);
>>>> -            return;
>>>> -        } else if (member->dma_buf < dma_buf) {
>>>> +            break;
>>>> +        } else if (member->handle < handle) {
>>>>               rb = rb->rb_right;
>>>>           } else {
>>>>               rb = rb->rb_left;
>>>>           }
>>>>       }
>>>> +
>>>> +    mutex_unlock(&prime_fpriv->lock);
>>>>   }
>>>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>>>> *prime_fpriv)
>>>
>>>
>>
> 
> 

