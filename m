Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C168890AE7C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEEA10E3A6;
	Mon, 17 Jun 2024 13:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d6PftEGn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8GcOsVf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d6PftEGn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d8GcOsVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB82D10E3A1;
 Mon, 17 Jun 2024 13:00:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F238F381E0;
 Mon, 17 Jun 2024 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718629223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hRxeM+z3HmX4zJFA4n6TDDzfhN0fNYmTvP4hXeA1wng=;
 b=d6PftEGnYh64MfYEGSAPDW8nVlD04eEB9l84dq6RklLM+E7Hl0iCHi9fr1ICHpAFAhweXT
 ZfXUpG/bMr7KfmrWkpiFcfzZo5VGcHE1uH1gaDcRZFSQV+L5wCsjWfKWUtE0NlrJWOhyaq
 uHKwLJMONsAIlWIxqEsEAEj89aZTmVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718629223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hRxeM+z3HmX4zJFA4n6TDDzfhN0fNYmTvP4hXeA1wng=;
 b=d8GcOsVf/N3ELbkmVGLg4yWdKhBnVK9U8Kegz77OGvgMge6yEYe9F+z2RH/4ZxRxFibECF
 nhbYEbiD+XDCAHDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718629223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hRxeM+z3HmX4zJFA4n6TDDzfhN0fNYmTvP4hXeA1wng=;
 b=d6PftEGnYh64MfYEGSAPDW8nVlD04eEB9l84dq6RklLM+E7Hl0iCHi9fr1ICHpAFAhweXT
 ZfXUpG/bMr7KfmrWkpiFcfzZo5VGcHE1uH1gaDcRZFSQV+L5wCsjWfKWUtE0NlrJWOhyaq
 uHKwLJMONsAIlWIxqEsEAEj89aZTmVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718629223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hRxeM+z3HmX4zJFA4n6TDDzfhN0fNYmTvP4hXeA1wng=;
 b=d8GcOsVf/N3ELbkmVGLg4yWdKhBnVK9U8Kegz77OGvgMge6yEYe9F+z2RH/4ZxRxFibECF
 nhbYEbiD+XDCAHDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83C1D13AAA;
 Mon, 17 Jun 2024 13:00:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ctTWHmYzcGbLOgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jun 2024 13:00:22 +0000
Message-ID: <106b9a0f-77b1-4c55-93aa-e73fa16f5d8c@suse.de>
Date: Mon, 17 Jun 2024 15:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/ttm: Support partial buffer mappings for
 ttm_bo_vmap()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, kraxel@redhat.com,
 airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240614133556.11378-1-tzimmermann@suse.de>
 <20240614133556.11378-4-tzimmermann@suse.de>
 <e597ad20-bd31-4388-ac75-50ecaf7c0cd2@amd.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <e597ad20-bd31-4388-ac75-50ecaf7c0cd2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[amd.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,redhat.com,loongson.cn];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, imap1.dmz-prg2.suse.org:helo,
 bootlin.com:url]
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spam-Level: 
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

Hi

Am 14.06.24 um 16:33 schrieb Christian König:
> Am 14.06.24 um 15:21 schrieb Thomas Zimmermann:
>> Add offset and size parameters to ttm_bo_vmap() to allow for partial
>> mappings of a buffer object. This brings the functionality on par with
>> ttm_bo_kmap().
>
> Well the long term plan was to remove this functionality from 
> ttm_bo_kmap() and nuke that function sooner or later.
>
> What exactly is the use case for partial mappings?

I don't have a use case; except for streamlining the DRM internals.

For the drivers, xe uses partial mappings in 
i915_gem_object_read_from_page(). But struct iosys_map to map the whole 
buffer and do memcpys within the range. See patch 6 for that. I think it 
could do without partial mappings. Vmwgfx uses a local mappings at [1], 
but as the nearby comment says, this could be a TTM helper. Or maybe TTM 
could provide a dedicated ttm_bo_kmap_local_page() for temporary 
mappings like this one. There's also [2], which looks like a candidate 
for a possible ttm_bo_kmap_local_page(). And in vmwgfx, there's the 
memcpy at [3], which could be replaced with ttm_bo_vmap() plus iosys_map 
helpers. I think that's it. Best regards Thomas [1] 
https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c#L457 
[2] 
https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c#L418 
[3] 
https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c#L430 

>
> Regards,
> Christian.
>
>>
>> Callers pass the byte offset and size within the buffer object and
>> receive a page-aligned mapping of the buffer object's memory for the
>> specified area.
>>
>> Also update all callers of ttm_bo_vmap() for the new parameters. As
>> before, existing callers map the buffer object's complete memory.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_ttm_helper.c  |  2 +-
>>   drivers/gpu/drm/drm_gem_vram_helper.c |  2 +-
>>   drivers/gpu/drm/loongson/lsdc_gem.c   |  2 +-
>>   drivers/gpu/drm/qxl/qxl_object.c      |  2 +-
>>   drivers/gpu/drm/ttm/ttm_bo_util.c     | 21 +++++++++++++++------
>>   drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
>>   drivers/gpu/drm/xe/xe_vm.c            |  2 +-
>>   include/drm/ttm/ttm_bo.h              |  4 +++-
>>   8 files changed, 24 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c 
>> b/drivers/gpu/drm/drm_gem_ttm_helper.c
>> index 3734aa2d1c5b5..f26b7c9077a68 100644
>> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
>> @@ -67,7 +67,7 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>>   {
>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>   -    return ttm_bo_vmap(bo, map);
>> +    return ttm_bo_vmap(bo, 0, gem->size, map);
>>   }
>>   EXPORT_SYMBOL(drm_gem_ttm_vmap);
>>   diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 6027584406af6..1670f9a459a9d 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -398,7 +398,7 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object 
>> *gbo, struct iosys_map *map)
>>        * no mapping present.
>>        */
>>       if (iosys_map_is_null(&gbo->map)) {
>> -        ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
>> +        ret = ttm_bo_vmap(&gbo->bo, 0, gbo->bo.base.size, &gbo->map);
>>           if (ret)
>>               return ret;
>>       }
>> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c 
>> b/drivers/gpu/drm/loongson/lsdc_gem.c
>> index a720d8f532093..f709960c781b9 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
>> @@ -77,7 +77,7 @@ static int lsdc_gem_object_vmap(struct 
>> drm_gem_object *obj, struct iosys_map *ma
>>           return ret;
>>       }
>>   -    ret = ttm_bo_vmap(tbo, &lbo->map);
>> +    ret = ttm_bo_vmap(tbo, 0, tbo->base.size, &lbo->map);
>>       if (ret) {
>>           drm_err(obj->dev, "ttm bo vmap failed\n");
>>           lsdc_bo_unpin(lbo);
>> diff --git a/drivers/gpu/drm/qxl/qxl_object.c 
>> b/drivers/gpu/drm/qxl/qxl_object.c
>> index 5893e27a7ae50..9f06d5e26a32c 100644
>> --- a/drivers/gpu/drm/qxl/qxl_object.c
>> +++ b/drivers/gpu/drm/qxl/qxl_object.c
>> @@ -164,7 +164,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct 
>> iosys_map *map)
>>           goto out;
>>       }
>>   -    r = ttm_bo_vmap(&bo->tbo, &bo->map);
>> +    r = ttm_bo_vmap(&bo->tbo, 0, bo->tbo.base.size, &bo->map);
>>       if (r) {
>>           qxl_bo_unpin_locked(bo);
>>           return r;
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index a9df0deff2deb..31f9772f05dac 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -457,17 +457,23 @@ EXPORT_SYMBOL(ttm_bo_kunmap);
>>    * ttm_bo_vmap
>>    *
>>    * @bo: The buffer object.
>> + * @offset: Byte offset into the buffer.
>> + * @size: Number of bytes to map.
>>    * @map: pointer to a struct iosys_map representing the map.
>>    *
>>    * Sets up a kernel virtual mapping, using ioremap or vmap to the
>>    * data in the buffer object. The parameter @map returns the virtual
>>    * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
>> + * The address stored in @map will be aligned to the next lower page
>> + * boundaries.
>>    *
>>    * Returns
>>    * -ENOMEM: Out of memory.
>>    * -EINVAL: Invalid range.
>>    */
>> -int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>> +int ttm_bo_vmap(struct ttm_buffer_object *bo,
>> +        unsigned long offset, unsigned long size,
>> +        struct iosys_map *map)
>>   {
>>       struct ttm_resource *mem = bo->resource;
>>       int ret;
>> @@ -483,18 +489,18 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct iosys_map *map)
>>           u16 alloc_flags;
>>             if (mem->bus.addr) {
>> -            vaddr_iomem = (void __iomem *)mem->bus.addr;
>> +            vaddr_iomem = (u8 __iomem *)mem->bus.addr + offset;
>>               alloc_flags = ttm_bo_map_premapped;
>>           } else if (mem->bus.caching == ttm_write_combined) {
>> -            vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
>> +            vaddr_iomem = ioremap_wc(mem->bus.offset + offset, size);
>>               alloc_flags = ttm_bo_map_iomap;
>>   #ifdef CONFIG_X86
>>           } else if (mem->bus.caching == ttm_cached) {
>> -            vaddr_iomem = ioremap_cache(mem->bus.offset, 
>> bo->base.size);
>> +            vaddr_iomem = ioremap_cache(mem->bus.offset + offset, 
>> size);
>>               alloc_flags = ttm_bo_map_iomap;
>>   #endif
>>           } else {
>> -            vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
>> +            vaddr_iomem = ioremap(mem->bus.offset + offset, size);
>>               alloc_flags = ttm_bo_map_iomap;
>>           }
>>   @@ -510,6 +516,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct iosys_map *map)
>>               .no_wait_gpu = false
>>           };
>>           struct ttm_tt *ttm = bo->ttm;
>> +        unsigned long start_page = offset >> PAGE_SHIFT;
>> +        unsigned long aligned_size = size + (offset - (start_page << 
>> PAGE_SHIFT));
>> +        unsigned long num_pages = DIV_ROUND_UP(aligned_size, 
>> PAGE_SIZE);
>>           pgprot_t prot;
>>           void *vaddr;
>>           u16 alloc_flags;
>> @@ -523,7 +532,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct iosys_map *map)
>>            * or to make the buffer object look contiguous.
>>            */
>>           prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
>> -        vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
>> +        vaddr = vmap(ttm->pages + start_page, num_pages, 0, prot);
>>           if (!vaddr)
>>               return -ENOMEM;
>>           alloc_flags = ttm_bo_map_vmap;
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index c1bb85d2e243f..3a68fe6d592ed 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1595,7 +1595,7 @@ void xe_lrc_snapshot_capture_delayed(struct 
>> xe_lrc_snapshot *snapshot)
>>           goto put_bo;
>>         xe_bo_lock(bo, false);
>> -    if (!ttm_bo_vmap(&bo->ttm, &src)) {
>> +    if (!ttm_bo_vmap(&bo->ttm, 0, bo->ttm.base.size, &src)) {
>>           xe_map_memcpy_from(xe_bo_device(bo),
>>                      snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
>>                      snapshot->lrc_size);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 99bf7412475c0..81306c32f5d09 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3485,7 +3485,7 @@ void xe_vm_snapshot_capture_delayed(struct 
>> xe_vm_snapshot *snap)
>>             if (bo) {
>>               xe_bo_lock(bo, false);
>> -            err = ttm_bo_vmap(&bo->ttm, &src);
>> +            err = ttm_bo_vmap(&bo->ttm, 0, bo->ttm.base.size, &src);
>>               if (!err) {
>>                   xe_map_memcpy_from(xe_bo_device(bo),
>>                              snap->snap[i].data,
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 6ccf96c91f3ae..c421ffe3563b1 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -375,7 +375,9 @@ int ttm_bo_init_validate(struct ttm_device *bdev, 
>> struct ttm_buffer_object *bo,
>>   int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long 
>> start_page,
>>           unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>> -int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>> +int ttm_bo_vmap(struct ttm_buffer_object *bo,
>> +        unsigned long offset, unsigned long size,
>> +        struct iosys_map *map);
>>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map 
>> *map);
>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>> ttm_buffer_object *bo);
>>   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct 
>> ttm_operation_ctx *ctx,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

