Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002DE58C237
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 05:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E183214A7BA;
	Mon,  8 Aug 2022 03:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m11885.qiye.163.com (mail-m11885.qiye.163.com
 [115.236.118.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405D1113C1F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 03:51:34 +0000 (UTC)
Received: from [192.168.111.100] (unknown [58.22.7.114])
 by mail-m11885.qiye.163.com (Hmail) with ESMTPA id 5A6DD4C04D5;
 Mon,  8 Aug 2022 11:51:28 +0800 (CST)
Message-ID: <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
Date: Mon, 8 Aug 2022 11:51:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.1
Subject: Re: [PATCH v2] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
From: Chen Jeffy <jeffy.chen@rock-chips.com>
In-Reply-To: <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGU9NVkNJHU5DSR9KGRgZSFUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NS46LTo6Qj08HSkyQhILLFYV
 IU8wFD9VSlVKTU5CQkhLTUNCSUpPVTMWGhIXVREeHR0CVRgTHhU7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCTE1INwY+
X-HM-Tid: 0a827b943d252eb9kusn5a6dd4c04d5
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

Thanks for your reply, and sorry i didn't make it clear.

On 8/8 星期一 0:52, Christian König wrote:
> Am 03.08.22 um 10:32 schrieb Jeffy Chen:
>> Currently we are assuming a one to one mapping between dmabuf and handle
>> when releasing GEM handles.
>>
>> But that is not always true, since we would create extra handles for the
>> GEM obj in cases like gem_open() and getfb{,2}().
>>
>> A similar issue was reported at:
>> https://lore.kernel.org/all/20211105083308.392156-1-jay.xu@rock-chips.com/
>>
>> Another problem is that the drm_gem_remove_prime_handles() now only
>> remove handle to the exported dmabuf (gem_obj->dma_buf), so the imported
>> ones would leak:
>> WARNING: CPU: 2 PID: 236 at drivers/gpu/drm/drm_prime.c:228 
>> drm_prime_destroy_file_private+0x18/0x24
>>
>> Let's fix these by using handle to find the exact map to remove.
> 
> Well we are clearly something missing here. As far as I can see the 
> current code is correct.
> 
> Creating multiple GEM handles for the same DMA-buf is possible, but 
> illegal. >
> In other words when a GEM handle is exported as DMA-buf and imported 
> again you should intentionally always get the same handle.

These issue are not about having handles for importing an exported 
dma-buf case, but for having multiple handles to a GEM object(which 
means having multiple handles to a dma-buf).

I know the drm-prime is trying to make dma-buf and handle maps one to 
one, but the drm-gem is allowing to create extra handles for a GEM 
object, for example:
drm_gem_open_ioctl -> drm_gem_handle_create_tail
drm_mode_getfb2_ioctl -> drm_gem_handle_create
drm_mode_getfb -> fb->funcs->create_handle

So we are allowing GEM object to have multiple handles, and GEM object 
could have at most one dma-buf, doesn't that means that dma-buf could 
map to multiple handles?

Or should we rewrite the GEM framework to limit GEM object with uniq handle?


The other issue is that we are leaking dma-buf <-> handle map for the 
imported dma-buf, since the drm_gem_remove_prime_handles doesn't take 
care of obj->import_attach->dmabuf.

But of cause this can be fixed in other way:
+++ b/drivers/gpu/drm/drm_gem.c
@@ -180,6 +180,9 @@ drm_gem_remove_prime_handles(struct drm_gem_object 
*obj, struct drm_file *filp)
                 drm_prime_remove_buf_handle_locked(&filp->prime,
                                                    obj->dma_buf);
         }
+       if (obj->import_attach)
+               drm_prime_remove_buf_handle_locked(&filp->prime,
+ 
obj->import_attach->dmabuf);
         mutex_unlock(&filp->prime.lock);
  }


> So this is pretty much a clear NAK to this patch since it shouldn't be 
> necessary or something is seriously broken somewhere else.
> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> Fix a typo of rbtree.
>>
>>   drivers/gpu/drm/drm_gem.c      | 17 +----------------
>>   drivers/gpu/drm/drm_internal.h |  4 ++--
>>   drivers/gpu/drm/drm_prime.c    | 20 ++++++++++++--------
>>   3 files changed, 15 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index eb0c2d041f13..ed39da383570 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct 
>> drm_device *dev,
>>   }
>>   EXPORT_SYMBOL(drm_gem_private_object_init);
>> -static void
>> -drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct 
>> drm_file *filp)
>> -{
>> -    /*
>> -     * Note: obj->dma_buf can't disappear as long as we still hold a
>> -     * handle reference in obj->handle_count.
>> -     */
>> -    mutex_lock(&filp->prime.lock);
>> -    if (obj->dma_buf) {
>> -        drm_prime_remove_buf_handle_locked(&filp->prime,
>> -                           obj->dma_buf);
>> -    }
>> -    mutex_unlock(&filp->prime.lock);
>> -}
>> -
>>   /**
>>    * drm_gem_object_handle_free - release resources bound to userspace 
>> handles
>>    * @obj: GEM object to clean up.
>> @@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void *ptr, 
>> void *data)
>>       if (obj->funcs->close)
>>           obj->funcs->close(obj, file_priv);
>> -    drm_gem_remove_prime_handles(obj, file_priv);
>> +    drm_prime_remove_buf_handle(&file_priv->prime, id);
>>       drm_vma_node_revoke(&obj->vma_node, file_priv);
>>       drm_gem_object_handle_put_unlocked(obj);
>> diff --git a/drivers/gpu/drm/drm_internal.h 
>> b/drivers/gpu/drm/drm_internal.h
>> index 1fbbc19f1ac0..7bb98e6a446d 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device 
>> *dev, void *data,
>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>> *prime_fpriv);
>>   void drm_prime_destroy_file_private(struct drm_prime_file_private 
>> *prime_fpriv);
>> -void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private 
>> *prime_fpriv,
>> -                    struct dma_buf *dma_buf);
>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>> *prime_fpriv,
>> +                 uint32_t handle);
>>   /* drm_drv.c */
>>   struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index e3f09f18110c..bd5366b16381 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -190,29 +190,33 @@ static int drm_prime_lookup_buf_handle(struct 
>> drm_prime_file_private *prime_fpri
>>       return -ENOENT;
>>   }
>> -void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private 
>> *prime_fpriv,
>> -                    struct dma_buf *dma_buf)
>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>> *prime_fpriv,
>> +                 uint32_t handle)
>>   {
>>       struct rb_node *rb;
>> -    rb = prime_fpriv->dmabufs.rb_node;
>> +    mutex_lock(&prime_fpriv->lock);
>> +
>> +    rb = prime_fpriv->handles.rb_node;
>>       while (rb) {
>>           struct drm_prime_member *member;
>> -        member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>> -        if (member->dma_buf == dma_buf) {
>> +        member = rb_entry(rb, struct drm_prime_member, handle_rb);
>> +        if (member->handle == handle) {
>>               rb_erase(&member->handle_rb, &prime_fpriv->handles);
>>               rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>> -            dma_buf_put(dma_buf);
>> +            dma_buf_put(member->dma_buf);
>>               kfree(member);
>> -            return;
>> -        } else if (member->dma_buf < dma_buf) {
>> +            break;
>> +        } else if (member->handle < handle) {
>>               rb = rb->rb_right;
>>           } else {
>>               rb = rb->rb_left;
>>           }
>>       }
>> +
>> +    mutex_unlock(&prime_fpriv->lock);
>>   }
>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>> *prime_fpriv)
> 
> 

