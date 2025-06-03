Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73829ACC16F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CA110E65C;
	Tue,  3 Jun 2025 07:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lyvkvUO5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f3pSxFpD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lyvkvUO5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f3pSxFpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE1710E664
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:49:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2DB7B21940;
 Tue,  3 Jun 2025 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748936990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tf4DS0GehIi8/XQhokywxkuFLFsIq/+63JU69pHJjmg=;
 b=lyvkvUO5WhWdgKxKt94krddww9QqMWE9o4sHp0D7JtvKYE6BQ0XVHlKLjkuegYa8SzIV3b
 z4ZsEWRQzH5GZMrK525onK25iLwNbujBVQ5nlqXFt2FgghcCt1KtGM/YFCI7TWkqZNc+9u
 i9tqY/hIDo7Oz4jeMwgPkQbI08sXkck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748936990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tf4DS0GehIi8/XQhokywxkuFLFsIq/+63JU69pHJjmg=;
 b=f3pSxFpDe8YUN7ze5fPdHwzF6Ra0l9X40RzDDeqebAKAhmDqxhSkGwoZ6t+6ZnyxTler+L
 PLJ5jpxZqgOhzIAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748936990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tf4DS0GehIi8/XQhokywxkuFLFsIq/+63JU69pHJjmg=;
 b=lyvkvUO5WhWdgKxKt94krddww9QqMWE9o4sHp0D7JtvKYE6BQ0XVHlKLjkuegYa8SzIV3b
 z4ZsEWRQzH5GZMrK525onK25iLwNbujBVQ5nlqXFt2FgghcCt1KtGM/YFCI7TWkqZNc+9u
 i9tqY/hIDo7Oz4jeMwgPkQbI08sXkck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748936990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tf4DS0GehIi8/XQhokywxkuFLFsIq/+63JU69pHJjmg=;
 b=f3pSxFpDe8YUN7ze5fPdHwzF6Ra0l9X40RzDDeqebAKAhmDqxhSkGwoZ6t+6ZnyxTler+L
 PLJ5jpxZqgOhzIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA16113A92;
 Tue,  3 Jun 2025 07:49:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 04fhMx2pPmi0GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Jun 2025 07:49:49 +0000
Message-ID: <678fa500-d0dd-48b2-9e02-5e09165bd493@suse.de>
Date: Tue, 3 Jun 2025 09:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 1/3] drm/shmem-helper: Import dmabuf without
 mapping its sg_table
From: Thomas Zimmermann <tzimmermann@suse.de>
To: oushixiong1025@163.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250522070714.439824-1-oushixiong1025@163.com>
 <f17ecc21-ec03-41fb-bcd9-ea56edf592f5@suse.de>
Content-Language: en-US
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
In-Reply-To: <f17ecc21-ec03-41fb-bcd9-ea56edf592f5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,poorly.run,redhat.com,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 FREEMAIL_TO(0.00)[163.com,amd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com]
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

Am 26.05.25 um 17:00 schrieb Thomas Zimmermann:
> Hi
>
> Am 22.05.25 um 09:07 schrieb oushixiong1025@163.com:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
>> [WHY]
>> 1. Drivers using DRM_GEM_SHADOW_PLANE_HELPER_FUNCS and
>>     DRM_GEM_SHMEM_DRIVER_OPS (e.g., udl, ast) do not require
>>     sg_table import.
>>     They only need dma_buf_vmap() to access the shared buffer's
>>     kernel virtual address.
>>
>> 2. On certain Aspeed-based boards, a dma_mask of 0xffff_ffff may
>>     trigger SWIOTLB during dmabuf import. However, IO_TLB_SEGSIZE
>>     restricts the maximum DMA streaming mapping memory, resulting in
>>     errors like:
>>
>>     ast 0000:07:00.0: swiotlb buffer is full (sz: 3145728 bytes), 
>> total 32768 (slots), used 0 (slots)
>>
>> [HOW]
>> Provide a gem_prime_import implementation without sg_table mapping
>> to avoid issues (e.g., "swiotlb buffer is full"). Drivers that do not
>> require sg_table can adopt this.
>>
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Looks good to me, but Christian might want to take a look as well. 
> Thanks for addressing the issue.

Christian told me that he's fine with the changes. I've merged the 
series into drm-misc-next. Thanks a lot for fixing the issue.

Best regards
Thomas

>
> Best regards
> Thomas
>
>> ---
>> v1->v2:
>>     Patch rebase.
>> v2->v3:
>>     Rename the import callback function.
>>     Remove drm_gem_shmem_prime_export() and separate some codes
>>     to drm_gem_prime_import_self().
>> v3->v4:
>>     Separate the test from the policy.
>>     Rename the macro.
>> v4->v5:
>>     Rename some functions.
>>
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 57 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_prime.c            | 36 ++++++++++++----
>>   include/drm/drm_gem_shmem_helper.h     | 15 +++++++
>>   include/drm/drm_prime.h                |  3 ++
>>   4 files changed, 102 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c 
>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index aa43265f4f4f..126aa79042ad 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -800,6 +800,63 @@ drm_gem_shmem_prime_import_sg_table(struct 
>> drm_device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
>>   +/**
>> + * drm_gem_shmem_prime_import_no_map - Import dmabuf without mapping 
>> its sg_table
>> + * @dev: Device to import into
>> + * @dma_buf: dma-buf object to import
>> + *
>> + * Drivers that use the shmem helpers but also wants to import 
>> dmabuf without
>> + * mapping its sg_table can use this as their 
>> &drm_driver.gem_prime_import
>> + * implementation.
>> + */
>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct 
>> drm_device *dev,
>> +                             struct dma_buf *dma_buf)
>> +{
>> +    struct dma_buf_attachment *attach;
>> +    struct drm_gem_shmem_object *shmem;
>> +    struct drm_gem_object *obj;
>> +    size_t size;
>> +    int ret;
>> +
>> +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
>> +        /*
>> +         * Importing dmabuf exported from our own gem increases
>> +         * refcount on gem itself instead of f_count of dmabuf.
>> +         */
>> +        obj = dma_buf->priv;
>> +        drm_gem_object_get(obj);
>> +        return obj;
>> +    }
>> +
>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>> +    if (IS_ERR(attach))
>> +        return ERR_CAST(attach);
>> +
>> +    get_dma_buf(dma_buf);
>> +
>> +    size = PAGE_ALIGN(attach->dmabuf->size);
>> +
>> +    shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>> +    if (IS_ERR(shmem)) {
>> +        ret = PTR_ERR(shmem);
>> +        goto fail_detach;
>> +    }
>> +
>> +    drm_dbg_prime(dev, "size = %zu\n", size);
>> +
>> +    shmem->base.import_attach = attach;
>> +    shmem->base.resv = dma_buf->resv;
>> +
>> +    return &shmem->base;
>> +
>> +fail_detach:
>> +    dma_buf_detach(dma_buf, attach);
>> +    dma_buf_put(dma_buf);
>> +
>> +    return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>> +
>>   MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index d828502268b8..b825b71038d6 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -910,6 +910,26 @@ struct dma_buf *drm_gem_prime_export(struct 
>> drm_gem_object *obj,
>>   }
>>   EXPORT_SYMBOL(drm_gem_prime_export);
>>   +
>> +/**
>> + * drm_gem_is_prime_exported_dma_buf -
>> + * checks if the DMA-BUF was exported from a GEM object belonging to 
>> @dev.
>> + * @dev: drm_device to check against
>> + * @dma_buf: dma-buf object to import
>> + *
>> + * Return: true if the DMA-BUF was exported from a GEM object belonging
>> + * to @dev, false otherwise.
>> + */
>> +
>> +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>> +                       struct dma_buf *dma_buf)
>> +{
>> +    struct drm_gem_object *obj = dma_buf->priv;
>> +
>> +    return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev 
>> == dev);
>> +}
>> +EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
>> +
>>   /**
>>    * drm_gem_prime_import_dev - core implementation of the import 
>> callback
>>    * @dev: drm_device to import into
>> @@ -933,16 +953,14 @@ struct drm_gem_object 
>> *drm_gem_prime_import_dev(struct drm_device *dev,
>>       struct drm_gem_object *obj;
>>       int ret;
>>   -    if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
>> +    if (drm_gem_is_prime_exported_dma_buf(dev, dma_buf)) {
>> +        /*
>> +         * Importing dmabuf exported from our own gem increases
>> +         * refcount on gem itself instead of f_count of dmabuf.
>> +         */
>>           obj = dma_buf->priv;
>> -        if (obj->dev == dev) {
>> -            /*
>> -             * Importing dmabuf exported from our own gem increases
>> -             * refcount on gem itself instead of f_count of dmabuf.
>> -             */
>> -            drm_gem_object_get(obj);
>> -            return obj;
>> -        }
>> +        drm_gem_object_get(obj);
>> +        return obj;
>>       }
>>         if (!dev->driver->gem_prime_import_sg_table)
>> diff --git a/include/drm/drm_gem_shmem_helper.h 
>> b/include/drm/drm_gem_shmem_helper.h
>> index b4f993da3cae..35f7466dca84 100644
>> --- a/include/drm/drm_gem_shmem_helper.h
>> +++ b/include/drm/drm_gem_shmem_helper.h
>> @@ -287,6 +287,8 @@ drm_gem_shmem_prime_import_sg_table(struct 
>> drm_device *dev,
>>                       struct sg_table *sgt);
>>   int drm_gem_shmem_dumb_create(struct drm_file *file, struct 
>> drm_device *dev,
>>                     struct drm_mode_create_dumb *args);
>> +struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct 
>> drm_device *dev,
>> +                             struct dma_buf *buf);
>>     /**
>>    * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
>> @@ -298,4 +300,17 @@ int drm_gem_shmem_dumb_create(struct drm_file 
>> *file, struct drm_device *dev,
>>       .gem_prime_import_sg_table = 
>> drm_gem_shmem_prime_import_sg_table, \
>>       .dumb_create           = drm_gem_shmem_dumb_create
>>   +/**
>> + * DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT - shmem GEM operations
>> + *                                       without mapping sg_table on
>> + *                                       imported buffer.
>> + *
>> + * This macro provides a shortcut for setting the shmem GEM 
>> operations in
>> + * the &drm_driver structure for drivers that do not require a 
>> sg_table on
>> + * imported buffers.
>> + */
>> +#define DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT \
>> +    .gem_prime_import       = drm_gem_shmem_prime_import_no_map, \
>> +    .dumb_create            = drm_gem_shmem_dumb_create
>> +
>>   #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>> index fa085c44d4ca..f50f862f0d8b 100644
>> --- a/include/drm/drm_prime.h
>> +++ b/include/drm/drm_prime.h
>> @@ -100,6 +100,9 @@ struct dma_buf *drm_gem_prime_export(struct 
>> drm_gem_object *obj,
>>   unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt);
>>     /* helper functions for importing */
>> +bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>> +                       struct dma_buf *dma_buf);
>> +
>>   struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device 
>> *dev,
>>                           struct dma_buf *dma_buf,
>>                           struct device *attach_dev);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

