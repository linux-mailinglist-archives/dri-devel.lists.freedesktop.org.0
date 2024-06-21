Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B2911CDA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D404A10EC11;
	Fri, 21 Jun 2024 07:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="L9UQtU/2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ACbHdsJr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L9UQtU/2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ACbHdsJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D9710EC09;
 Fri, 21 Jun 2024 07:32:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1767821A1E;
 Fri, 21 Jun 2024 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718955178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CPvb2Ui7jtt1rTSj3jfy2+c6RdBc6y3q3QXSp1IP23I=;
 b=L9UQtU/2RWRcgKEiOCOazFfBzhxTsVKaJVoSbl8C8B/e8f/Zp9eku4sbOkohmY2rN2f4b/
 clewWRi5XwkmcztUTPh1ZHTQubJyJSM6Nxg7slLlQaMmcYngqTtOjU5lqcHmqNtPnXu05j
 vgfxZ33hWSl7egiVGEPJKbj5L7brKDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718955178;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CPvb2Ui7jtt1rTSj3jfy2+c6RdBc6y3q3QXSp1IP23I=;
 b=ACbHdsJrrDH4w5lGGa3weFm8O07K3NXhGHeP+m0u7v6iblMUhQP4IzY59GCG+2IPeUEIeh
 non9QJN6pArkxhCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="L9UQtU/2";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ACbHdsJr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718955178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CPvb2Ui7jtt1rTSj3jfy2+c6RdBc6y3q3QXSp1IP23I=;
 b=L9UQtU/2RWRcgKEiOCOazFfBzhxTsVKaJVoSbl8C8B/e8f/Zp9eku4sbOkohmY2rN2f4b/
 clewWRi5XwkmcztUTPh1ZHTQubJyJSM6Nxg7slLlQaMmcYngqTtOjU5lqcHmqNtPnXu05j
 vgfxZ33hWSl7egiVGEPJKbj5L7brKDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718955178;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CPvb2Ui7jtt1rTSj3jfy2+c6RdBc6y3q3QXSp1IP23I=;
 b=ACbHdsJrrDH4w5lGGa3weFm8O07K3NXhGHeP+m0u7v6iblMUhQP4IzY59GCG+2IPeUEIeh
 non9QJN6pArkxhCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0F8A13AAA;
 Fri, 21 Jun 2024 07:32:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ktewMaksdWZIFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Jun 2024 07:32:57 +0000
Message-ID: <52f25080-4c56-45cc-b8e9-2ef4910803ed@suse.de>
Date: Fri, 21 Jun 2024 09:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Unmap BO memory before calling
 amdgpu_bo_unref()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, felix.kuehling@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240620145238.25295-1-tzimmermann@suse.de>
 <20240620145238.25295-2-tzimmermann@suse.de>
 <6f0d5bf4-1cb8-491f-b5aa-119dd6edc6d9@amd.com>
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
In-Reply-To: <6f0d5bf4-1cb8-491f-b5aa-119dd6edc6d9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1767821A1E
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Am 20.06.24 um 17:50 schrieb Christian König:
> Am 20.06.24 um 16:44 schrieb Thomas Zimmermann:
>> Prepares for using ttm_bo_vmap() and ttm_bo_vunmap() in amdgpu. Both
>> require the caller to hold the GEM reservation lock, which is not the
>> case while releasing a buffer object. Hence, push a possible call to
>> unmap out from the buffer-object release code. Warn if a buffer object
>> with mapped pages is supposed to be released.
>
> Yeah, I've looked into this a while ago as well and that unfortunately 
> won't work like this.
>
> Amdgpu also uses ttm_bo_kmap() on user allocations, so the 
> amdgpu_bo_kunmap() in amdgpu_bo_destroy() is a must have.

Is there a testcase (igt-gpu-tools ?) that runs this code?  I've tested 
these patches by booting and running a 3d game under X11. But I didn't 
expect that to fully cover all cases.

Best regards
Thomas

>
> On the other hand I'm pretty sure that calling ttm_bo_vunmap() without 
> holding the reservation lock is ok in this situation.
>
> After all it's guaranteed that nobody else is having a reference to 
> the BO any more.
>
> Regards,
> Christian.
>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index a1b7438c43dc8..d58b11ea0ead5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -58,7 +58,12 @@ static void amdgpu_bo_destroy(struct 
>> ttm_buffer_object *tbo)
>>   {
>>       struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
>>   -    amdgpu_bo_kunmap(bo);
>> +    /*
>> +     * BO memory pages should be unmapped at this point. Call
>> +     * amdgpu_bo_kunmap() before releasing the BO.
>> +     */
>> +    if (drm_WARN_ON_ONCE(bo->tbo.base.dev, bo->kmap.bo))
>> +        amdgpu_bo_kunmap(bo);
>>         if (bo->tbo.base.import_attach)
>>           drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
>> @@ -450,9 +455,7 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, 
>> u64 *gpu_addr,
>> WARN_ON(amdgpu_ttm_adev((*bo)->tbo.bdev)->in_suspend);
>>         if (likely(amdgpu_bo_reserve(*bo, true) == 0)) {
>> -        if (cpu_addr)
>> -            amdgpu_bo_kunmap(*bo);
>> -
>> +        amdgpu_bo_kunmap(*bo);
>>           amdgpu_bo_unpin(*bo);
>>           amdgpu_bo_unreserve(*bo);
>>       }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

