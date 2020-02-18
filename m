Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431C9162EB8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 19:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423066EA6C;
	Tue, 18 Feb 2020 18:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2CA6E225;
 Tue, 18 Feb 2020 18:37:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s10so3823201wmh.3;
 Tue, 18 Feb 2020 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=vJn5gabJYwPVXLhWyUOhxucar70PnqFXlYN4da5wXjQ=;
 b=KczMDBoJURaQfN9n3iS1wealYWPZ6jNOjtVKRXeRa/0rZ50AnmlCPloJ39sEynyZl3
 UOMI/H6E9vR07/wAsBKxRsb64YkqIx3nj1FZ6I47U6YHx4uUJIgHafQ5DvaaEbp8SGj1
 6sv6Ig1Q6M7Gdh9vEVh38qVkXzVZteztZiOXMC7tJsIS1N+S9gDscQaeooQOw4gLVGsU
 WINgy4xnFf1AM1Vgy9H4Q9BooDY1Ve0ziqGGK8Dd2BEe2m7kfuY6P6GdZKszA4DJR4pz
 DlwCCCKRQpzWlBf081r6exlEKWSeXPO5QsouJDSJ+bTdbzhQQPS7IdYkYp6UbdEDSXE1
 ghfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=vJn5gabJYwPVXLhWyUOhxucar70PnqFXlYN4da5wXjQ=;
 b=OdW35gKjuhSQ3hbLa+JZ0ZhesyxKOv0caNyURj90BBFgFYUuFC19b1mHxdcnqs4Wc1
 fj83OGDxSP2l4SBmZ2go3Qkp/oK2x2+M/ZPhYdt+f9g24tu2XkEiJBiJQD5ynJHdRisG
 se3lnTzqBB3is5Jq/ydaKr/dBBeFDai7/aPmNshvbbhvd5Amlk2ZhzYzwhP3CjUL3h0S
 kq82La1D/AYMEjGcv4YF/AoX//nszpAN+lrLGUMwBcLVD49lgBeWCiMKPBK8+4E+kD3f
 +J/EUiequPFL4g+clpSl/xuQZNmYyv+RZ6BunKv/d//4V1AiG6fJvgcZNmWirLJdb5uJ
 2Ptg==
X-Gm-Message-State: APjAAAVY/tJQd5HgSyVNolSieZPG4qbvUR5LYFsVO2+4rpVb69BJQiz7
 sz2qUDhR+y+TdN4KIPPZXJY=
X-Google-Smtp-Source: APXvYqzjhkAmX9oT5F4/GAzysR3FBgZRkbpUmOkA1WS4SesM8XrXUZKIoyRPQHfDNvRtCJMwxVV8jQ==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr4289376wmd.80.1582051068992; 
 Tue, 18 Feb 2020 10:37:48 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:f960:eb89:795f:e107?
 ([2a02:908:1252:fb60:f960:eb89:795f:e107])
 by smtp.gmail.com with ESMTPSA id p26sm4306076wmc.24.2020.02.18.10.37.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 10:37:48 -0800 (PST)
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
 <f8534965-ea14-bbac-bd34-06b951766a7c@amd.com>
 <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <31b0cac7-82c7-60ad-830b-66f7838a1047@gmail.com>
Date: Tue, 18 Feb 2020 19:37:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============1856106975=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1856106975==
Content-Type: multipart/alternative;
 boundary="------------720D19E588A50163BC63142C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------720D19E588A50163BC63142C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 18.02.20 um 19:28 schrieb Thomas Zimmermann:
> Hi
>
> Am 18.02.20 um 19:23 schrieb Christian König:
>> Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 18.02.20 um 18:13 schrieb Nirmoy:
>>>> On 2/18/20 1:44 PM, Christian König wrote:
>>>>> Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
>>>>>> Hi
>>>>>>
>>>>>> Am 17.02.20 um 16:04 schrieb Nirmoy Das:
>>>>>>> GPU address handling is device specific and should be handle by its
>>>>>>> device
>>>>>>> driver.
>>>>>>>
>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
>>>>>>>     include/drm/ttm/ttm_bo_api.h    | 2 --
>>>>>>>     include/drm/ttm/ttm_bo_driver.h | 1 -
>>>>>>>     3 files changed, 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> index 151edfd8de77..d5885cd609a3 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>>>> @@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
>>>>>>> ttm_bo_device *bdev, struct drm_printer *p
>>>>>>>         drm_printf(p, "    has_type: %d\n", man->has_type);
>>>>>>>         drm_printf(p, "    use_type: %d\n", man->use_type);
>>>>>>>         drm_printf(p, "    flags: 0x%08X\n", man->flags);
>>>>>>> -    drm_printf(p, "    gpu_offset: 0x%08llX\n", man->gpu_offset);
>>>>>>>         drm_printf(p, "    size: %llu\n", man->size);
>>>>>>>         drm_printf(p, "    available_caching: 0x%08X\n",
>>>>>>> man->available_caching);
>>>>>>>         drm_printf(p, "    default_caching: 0x%08X\n",
>>>>>>> man->default_caching);
>>>>>>> @@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
>>>>>>> ttm_buffer_object *bo,
>>>>>>>     moved:
>>>>>>>         bo->evicted = false;
>>>>>>>     -    if (bo->mem.mm_node)
>>>>>>> -        bo->offset = (bo->mem.start << PAGE_SHIFT) +
>>>>>>> -            bdev->man[bo->mem.mem_type].gpu_offset;
>>>>>>> -    else
>>>>>>> -        bo->offset = 0;
>>>>>>> -
>>>>>> After moving this into users, the else branch has been lost. Is
>>>>>> 'bo->mem.mm_node' always true?
>>>>> At least for the amdgpu and radeon use cases, yes.
>>>>>
>>>>> But that is a rather good question I mean for it is illegal to get the
>>>>> GPU BO address if it is inaccessible (e.g. in the system domain).
>>>>>
>>>>> Could be that some driver relied on the behavior to get 0 for the
>>>>> system domain here.
>>>> I wonder how to verify that ?
>>>>
>>>> If I understand correctly:
>>>>
>>>> 1 qxl uses bo->offset only in qxl_bo_physical_address() which is not in
>>>> system domain.
>>>>
>>>> 2 unfortunately I can't say the same for bochs but it works with this
>>>> patch series so I think bochs is fine as well.
>>>>
>>>> 3 vmwgfx uses bo->offset only when bo->mem.mem_type == TTM_PL_VRAM so
>>>> vmwgfx should be fine.
>>>>
>>>> 4 amdgpu and radeon runs with 'bo->mem.mm_node' always true
>>>>
>>>> I am not sure about  nouveau as bo->offset is being used in many places.
>>>>
>>>> I could probably mirror the removed logic to nouveau as
>>> I suggest to introduce a ttm helper that contains the original branching
>>> and use it everywhere. Something like
>>>
>>>     s64 ttm_bo_offset(struct ttm_buffer_object *bo)
>>>     {
>>>        if (WARN_ON_ONCE(!bo->mem.mm_node))
>>>            return 0;
>>>        return bo->mem.start << PAGE_SHIFT;
>>>     }
>>>
>>> Could be static inline. The warning should point to broken drivers. This
>>> also gets rid of the ugly shift in the drivers.
>> Big NAK on this. That is exactly what we should NOT do.
>>
>> See the shift belongs into the driver, because it is driver dependent if
>> we work with page or byte offsets.
>>
>> For amdgpu we for example want to work with byte offsets and TTM should
>> not make any assumption about what bo->mem.start actually contains.
> OK. What about something like ttm_bo_pg_offset()? Same code without the
> shift. Would also make it clear that it's a page offset.

That is a rather good idea. We could name that ttm_bo_man_offset() and 
put it into ttm_bo_manager.c next to the manager which allocates them.

It's just that this manager is not used by everybody, so amdgpu, radeon 
and nouveau would still need a separate function.

Christian.

>
> Best regards
> Thomas
>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> index f8015e0318d7..5a6a2af91318 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> @@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
>>>> *bo, bool evict,
>>>>                   list_for_each_entry(vma, &nvbo->vma_list, head) {
>>>>                           nouveau_vma_map(vma, mem);
>>>>                   }
>>>> +               if (bo->mem.mm_node)
>>>> +                       nvbo->offset = (new_reg->start << PAGE_SHIFT);
>>>> +               else
>>>> +                       nvbo->offset = 0;
>>>>           } else {
>>>>                   list_for_each_entry(vma, &nvbo->vma_list, head) {
>>>>                           WARN_ON(ttm_bo_wait(bo, false, false));
>>>>
>>>> Regards,
>>>>
>>>> Nirmoy
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>>         ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
>>>>>>>         return 0;
>>>>>>>     diff --git a/include/drm/ttm/ttm_bo_api.h
>>>>>>> b/include/drm/ttm/ttm_bo_api.h
>>>>>>> index b9bc1b00142e..d6f39ee5bf5d 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>> @@ -213,8 +213,6 @@ struct ttm_buffer_object {
>>>>>>>          * either of these locks held.
>>>>>>>          */
>>>>>>>     -    uint64_t offset; /* GPU address space is independent of CPU
>>>>>>> word size */
>>>>>>> -
>>>>>>>         struct sg_table *sg;
>>>>>>>     };
>>>>>>>     diff --git a/include/drm/ttm/ttm_bo_driver.h
>>>>>>> b/include/drm/ttm/ttm_bo_driver.h
>>>>>>> index c9e0fd09f4b2..c8ce6c181abe 100644
>>>>>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>>>>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>>>>>> @@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
>>>>>>>         bool has_type;
>>>>>>>         bool use_type;
>>>>>>>         uint32_t flags;
>>>>>>> -    uint64_t gpu_offset; /* GPU address space is independent of CPU
>>>>>>> word size */
>>>>>>>         uint64_t size;
>>>>>>>         uint32_t available_caching;
>>>>>>>         uint32_t default_caching;
>>>>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------720D19E588A50163BC63142C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 18.02.20 um 19:28 schrieb Thomas
      Zimmermann:<br>
    </div>
    <blockquote type="cite"
      cite="mid:48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de">
      <pre class="moz-quote-pre" wrap="">Hi

Am 18.02.20 um 19:23 schrieb Christian König:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 18.02.20 um 19:16 schrieb Thomas Zimmermann:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi

Am 18.02.20 um 18:13 schrieb Nirmoy:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 2/18/20 1:44 PM, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 18.02.20 um 13:40 schrieb Thomas Zimmermann:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi

Am 17.02.20 um 16:04 schrieb Nirmoy Das:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">GPU address handling is device specific and should be handle by its
device
driver.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@amd.com">&lt;nirmoy.das@amd.com&gt;</a>
---
   drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
   include/drm/ttm/ttm_bo_api.h    | 2 --
   include/drm/ttm/ttm_bo_driver.h | 1 -
   3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
b/drivers/gpu/drm/ttm/ttm_bo.c
index 151edfd8de77..d5885cd609a3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct
ttm_bo_device *bdev, struct drm_printer *p
       drm_printf(p, "    has_type: %d\n", man-&gt;has_type);
       drm_printf(p, "    use_type: %d\n", man-&gt;use_type);
       drm_printf(p, "    flags: 0x%08X\n", man-&gt;flags);
-    drm_printf(p, "    gpu_offset: 0x%08llX\n", man-&gt;gpu_offset);
       drm_printf(p, "    size: %llu\n", man-&gt;size);
       drm_printf(p, "    available_caching: 0x%08X\n",
man-&gt;available_caching);
       drm_printf(p, "    default_caching: 0x%08X\n",
man-&gt;default_caching);
@@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct
ttm_buffer_object *bo,
   moved:
       bo-&gt;evicted = false;
   -    if (bo-&gt;mem.mm_node)
-        bo-&gt;offset = (bo-&gt;mem.start &lt;&lt; PAGE_SHIFT) +
-            bdev-&gt;man[bo-&gt;mem.mem_type].gpu_offset;
-    else
-        bo-&gt;offset = 0;
-
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">After moving this into users, the else branch has been lost. Is
'bo-&gt;mem.mm_node' always true?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">At least for the amdgpu and radeon use cases, yes.

But that is a rather good question I mean for it is illegal to get the
GPU BO address if it is inaccessible (e.g. in the system domain).

Could be that some driver relied on the behavior to get 0 for the
system domain here.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I wonder how to verify that ?

If I understand correctly:

1 qxl uses bo-&gt;offset only in qxl_bo_physical_address() which is not in
system domain.

2 unfortunately I can't say the same for bochs but it works with this
patch series so I think bochs is fine as well.

3 vmwgfx uses bo-&gt;offset only when bo-&gt;mem.mem_type == TTM_PL_VRAM so
vmwgfx should be fine.

4 amdgpu and radeon runs with 'bo-&gt;mem.mm_node' always true

I am not sure about  nouveau as bo-&gt;offset is being used in many places.

I could probably mirror the removed logic to nouveau as
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I suggest to introduce a ttm helper that contains the original branching
and use it everywhere. Something like

   s64 ttm_bo_offset(struct ttm_buffer_object *bo)
   {
      if (WARN_ON_ONCE(!bo-&gt;mem.mm_node))
          return 0;
      return bo-&gt;mem.start &lt;&lt; PAGE_SHIFT;
   }

Could be static inline. The warning should point to broken drivers. This
also gets rid of the ugly shift in the drivers.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Big NAK on this. That is exactly what we should NOT do.

See the shift belongs into the driver, because it is driver dependent if
we work with page or byte offsets.

For amdgpu we for example want to work with byte offsets and TTM should
not make any assumption about what bo-&gt;mem.start actually contains.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK. What about something like ttm_bo_pg_offset()? Same code without the
shift. Would also make it clear that it's a page offset.</pre>
    </blockquote>
    <br>
    That is a rather good idea. We could name that ttm_bo_man_offset()
    and put it into ttm_bo_manager.c next to the manager which allocates
    them.<br>
    <br>
    It's just that this manager is not used by everybody, so amdgpu,
    radeon and nouveau would still need a separate function.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite"
      cite="mid:48a5e3e2-cb9d-8328-1529-3558601ba860@suse.de">
      <pre class="moz-quote-pre" wrap="">

Best regards
Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Best regards
Thomas


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f8015e0318d7..5a6a2af91318 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1317,6 +1317,10 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object
*bo, bool evict,
                 list_for_each_entry(vma, &amp;nvbo-&gt;vma_list, head) {
                         nouveau_vma_map(vma, mem);
                 }
+               if (bo-&gt;mem.mm_node)
+                       nvbo-&gt;offset = (new_reg-&gt;start &lt;&lt; PAGE_SHIFT);
+               else
+                       nvbo-&gt;offset = 0;
         } else {
                 list_for_each_entry(vma, &amp;nvbo-&gt;vma_list, head) {
                         WARN_ON(ttm_bo_wait(bo, false, false));

Regards,

Nirmoy


</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Best regards
Thomas

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">       ctx-&gt;bytes_moved += bo-&gt;num_pages &lt;&lt; PAGE_SHIFT;
       return 0;
   diff --git a/include/drm/ttm/ttm_bo_api.h
b/include/drm/ttm/ttm_bo_api.h
index b9bc1b00142e..d6f39ee5bf5d 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -213,8 +213,6 @@ struct ttm_buffer_object {
        * either of these locks held.
        */
   -    uint64_t offset; /* GPU address space is independent of CPU
word size */
-
       struct sg_table *sg;
   };
   diff --git a/include/drm/ttm/ttm_bo_driver.h
b/include/drm/ttm/ttm_bo_driver.h
index c9e0fd09f4b2..c8ce6c181abe 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
       bool has_type;
       bool use_type;
       uint32_t flags;
-    uint64_t gpu_offset; /* GPU address space is independent of CPU
word size */
       uint64_t size;
       uint32_t available_caching;
       uint32_t default_caching;

</pre>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------720D19E588A50163BC63142C--

--===============1856106975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1856106975==--
