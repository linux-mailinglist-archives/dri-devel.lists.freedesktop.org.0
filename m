Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365790ADFE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 14:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB41710E379;
	Mon, 17 Jun 2024 12:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0uzo3Xkb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+DkukZkd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0uzo3Xkb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+DkukZkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18FA10E38E;
 Mon, 17 Jun 2024 12:32:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27CD660073;
 Mon, 17 Jun 2024 12:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718627565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aakrBUquGQuddyQGUx/8TZTieCuqoV5TUJnebhNYzD0=;
 b=0uzo3XkbJngiURRqIa0jcfIycyBtQ9cqLABGT8GBXcg2474k9bwuNBT/Oo5wIMg4VizPR9
 cXKQb0WqMC03G4csKUgBOMTQQfnEtBqER2Uo63hLjecRz548q+jUgEXGhBNOOPjXKuV9Z/
 xOPo9c+XPdI/2JjqTxtvnzS9qQtGjlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718627565;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aakrBUquGQuddyQGUx/8TZTieCuqoV5TUJnebhNYzD0=;
 b=+DkukZkdpGnO0OYpnsd8AAf41+HCJZVSKYC5IJeHWrNb16aOM6mI2uU9/DiS+w+9GGOLwk
 t4MC9vGZ6EpfxVCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718627565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aakrBUquGQuddyQGUx/8TZTieCuqoV5TUJnebhNYzD0=;
 b=0uzo3XkbJngiURRqIa0jcfIycyBtQ9cqLABGT8GBXcg2474k9bwuNBT/Oo5wIMg4VizPR9
 cXKQb0WqMC03G4csKUgBOMTQQfnEtBqER2Uo63hLjecRz548q+jUgEXGhBNOOPjXKuV9Z/
 xOPo9c+XPdI/2JjqTxtvnzS9qQtGjlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718627565;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aakrBUquGQuddyQGUx/8TZTieCuqoV5TUJnebhNYzD0=;
 b=+DkukZkdpGnO0OYpnsd8AAf41+HCJZVSKYC5IJeHWrNb16aOM6mI2uU9/DiS+w+9GGOLwk
 t4MC9vGZ6EpfxVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA01D139AB;
 Mon, 17 Jun 2024 12:32:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9B8mLOwscGa1MQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jun 2024 12:32:44 +0000
Message-ID: <820be6c8-ce77-4262-bb45-2c18597a661d@suse.de>
Date: Mon, 17 Jun 2024 14:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/ttm: Store the bo_kmap_type in struct iosys_map
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, kraxel@redhat.com,
 airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240614133556.11378-1-tzimmermann@suse.de>
 <20240614133556.11378-3-tzimmermann@suse.de>
 <5e770114-2751-414f-af57-de8077f6a6a0@amd.com>
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
In-Reply-To: <5e770114-2751-414f-af57-de8077f6a6a0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,redhat.com,loongson.cn];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
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

Am 14.06.24 um 16:31 schrieb Christian König:
> Am 14.06.24 um 15:21 schrieb Thomas Zimmermann:
>> For each instances of struct iosys_map set up by ttm_bo_vmap(), store
>> the type of allocation in the instance. Use this information to unmap
>> the memory in ttm_bo_vunmap(). This change simplifies the unmap code
>> and puts the complicated logic entirely into the map code.
>
> I'm not sure that's a good idea.
>
> The mapping information should already be available in the resource 
> and storing it in the iosys_map structures duplicates that information.
>
> So we might run into the issue that the resource has changed and so we 
> need a different approach now, but the iosys_map will say that we 
> should unmap things for example.

Patches 1 and 2 are only here to make patch 4 (add the kmap special 
case) work. How can I distinguish between vmap'ed and kmap'ed memory? 
It's not clear to me, whether there is a benefit from patch 4. The xe 
driver makes it sound like that, but the rest of the kernel appears to 
disagree.

Best regards
Thomas

>
> Regards,
> Christian.
>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 46 +++++++++++++++++++++----------
>>   1 file changed, 31 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 0b3f4267130c4..a9df0deff2deb 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -36,6 +36,7 @@
>>   #include <drm/ttm/ttm_tt.h>
>>     #include <drm/drm_cache.h>
>> +#include <drm/drm_device.h>
>>     struct ttm_transfer_obj {
>>       struct ttm_buffer_object base;
>> @@ -479,24 +480,29 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct iosys_map *map)
>>         if (mem->bus.is_iomem) {
>>           void __iomem *vaddr_iomem;
>> +        u16 alloc_flags;
>>   -        if (mem->bus.addr)
>> +        if (mem->bus.addr) {
>>               vaddr_iomem = (void __iomem *)mem->bus.addr;
>> -        else if (mem->bus.caching == ttm_write_combined)
>> -            vaddr_iomem = ioremap_wc(mem->bus.offset,
>> -                         bo->base.size);
>> +            alloc_flags = ttm_bo_map_premapped;
>> +        } else if (mem->bus.caching == ttm_write_combined) {
>> +            vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
>> +            alloc_flags = ttm_bo_map_iomap;
>>   #ifdef CONFIG_X86
>> -        else if (mem->bus.caching == ttm_cached)
>> -            vaddr_iomem = ioremap_cache(mem->bus.offset,
>> -                          bo->base.size);
>> +        } else if (mem->bus.caching == ttm_cached) {
>> +            vaddr_iomem = ioremap_cache(mem->bus.offset, 
>> bo->base.size);
>> +            alloc_flags = ttm_bo_map_iomap;
>>   #endif
>> -        else
>> +        } else {
>>               vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
>> +            alloc_flags = ttm_bo_map_iomap;
>> +        }
>>             if (!vaddr_iomem)
>>               return -ENOMEM;
>>             iosys_map_set_vaddr_iomem(map, vaddr_iomem);
>> +        map->alloc_flags = alloc_flags;
>>         } else {
>>           struct ttm_operation_ctx ctx = {
>> @@ -506,6 +512,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct iosys_map *map)
>>           struct ttm_tt *ttm = bo->ttm;
>>           pgprot_t prot;
>>           void *vaddr;
>> +        u16 alloc_flags;
>>             ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>           if (ret)
>> @@ -519,8 +526,10 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, 
>> struct iosys_map *map)
>>           vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
>>           if (!vaddr)
>>               return -ENOMEM;
>> +        alloc_flags = ttm_bo_map_vmap;
>>             iosys_map_set_vaddr(map, vaddr);
>> +        map->alloc_flags = alloc_flags;
>>       }
>>         return 0;
>> @@ -537,20 +546,27 @@ EXPORT_SYMBOL(ttm_bo_vmap);
>>    */
>>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map 
>> *map)
>>   {
>> -    struct ttm_resource *mem = bo->resource;
>> -
>>       dma_resv_assert_held(bo->base.resv);
>>         if (iosys_map_is_null(map))
>>           return;
>>   -    if (!map->is_iomem)
>> -        vunmap(map->vaddr);
>> -    else if (!mem->bus.addr)
>> +    switch (map->alloc_flags) {
>> +    case ttm_bo_map_iomap:
>>           iounmap(map->vaddr_iomem);
>> -    iosys_map_clear(map);
>> -
>> +        break;
>> +    case ttm_bo_map_vmap:
>> +        vunmap(map->vaddr);
>> +        break;
>> +    case ttm_bo_map_premapped:
>> +        break;
>> +    default:
>> +        drm_err(bo->base.dev, "Unsupported alloc_flags 0x%x\n", 
>> map->alloc_flags);
>> +        return;
>> +    }
>>       ttm_mem_io_free(bo->bdev, bo->resource);
>> +
>> +    iosys_map_clear(map);
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vunmap);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

