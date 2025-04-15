Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24543A89E54
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628E210E776;
	Tue, 15 Apr 2025 12:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eOEkr2Bc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H9w309eU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yXIbe49e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="glknqEq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A9B10E776
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:40:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDA7F210F4;
 Tue, 15 Apr 2025 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744720805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jK4Eh9H6ZnAHMicDIT09c1HLtTEiBBJCncungg/b1e0=;
 b=eOEkr2Bc/8PmfTxRX/jZuED0Yov803joHTDW35rHeNHSWYeQFyYWjuH9PQsSE/BHV9jc0D
 N9tWjf02jInbtNFipWCPx4Xz4QKacMoCUqNIQUZS2RIkMCJKD8PD7pn+PsZ5pOUKEwpfGl
 OWnGx5z3BKAzjcLiJVPv/G0NYIiI3Vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744720805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jK4Eh9H6ZnAHMicDIT09c1HLtTEiBBJCncungg/b1e0=;
 b=H9w309eUFx4A1eXC4efgW6R7UTjm+5EOFYnt1otaKN7tckPRCI0unt8u8iwB+34DNU6hkQ
 LbhBoO0LMukMuvAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744720804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jK4Eh9H6ZnAHMicDIT09c1HLtTEiBBJCncungg/b1e0=;
 b=yXIbe49en1VW3LQfuAeJMFmrab2uMzryCtS/Wqhv/8B4m1ZVHG8F0Czi6VUW87luQ9iDrC
 cYD77DygAn1nnkVEZKUA/cYZWtnM2N87bDeJeQRLOu+GaXqlKhFNfgXZHD0W/+wqhXX1zU
 7ucDUPkPNJdgcwglk+Znhhlc5GCpSu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744720804;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jK4Eh9H6ZnAHMicDIT09c1HLtTEiBBJCncungg/b1e0=;
 b=glknqEq5qjCRJh4Y74M8NllXlXOr45QI0paAtqauR1jqYBFMRMKvbjaa8LyPGBhOG7hlrk
 LKnidA4wvI+IJCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F588137A5;
 Tue, 15 Apr 2025 12:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OBCEIaRT/melFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Apr 2025 12:40:04 +0000
Message-ID: <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
Date: Tue, 15 Apr 2025 14:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
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
In-Reply-To: <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[amd.com,ffwll.ch,gmail.com,redhat.com,163.com,kernel.org,linux.intel.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email, linaro.org:email, suse.de:email,
 suse.de:mid, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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

Am 15.04.25 um 14:19 schrieb Christian König:
> Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 15.04.25 um 11:39 schrieb Christian König:
>>> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
>>>> Test struct drm_gem_object.import_attach to detect imported objects
>>>> during cleanup. At that point, the imported DMA buffer might have
>>>> already been released and the dma_buf field is NULL. The object's
>>>> free callback then does a cleanup as for native objects.
>>> I don't think that this is a good idea.
>>>
>>> The DMA-buf is separately reference counted through the import attachment.
>> I understand that it's not ideal, but testing for import_attach to be set is what we currently do throughout drivers. Putting this behind an interface is already a step forward.
>>
>>>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
>>>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
>>> That is for exported DMA-buf and should *NEVER* be used for imported ones.
>> Did you look at the discussion at the Closes tag? Where else could dma-buf be cleared?
> Yeah, I've seen that. The solution is just completely wrong.
>
> See for the export case obj->dma_buf points to the exported DMA-buf and causes a circle dependency when not set to NULL when the last handle is released.
>
> But for the import case obj->dma_buf is actually not that relevant. Instead obj->import_attach->dma_buf should be used.

So if I understand correctly, the tests in that helper should be done by 
looking at import_attach->dma_buf.

The long-term goal is to make import_attach optional because its setup 
requires a DMA-capable device.

Best regards
Thomas

>
> Regards,
> Christian.
>
>> Best regards
>> Thomas
>>
>>> Regards,
>>> Christian.
>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>>> Reported-by: Andy Yan <andyshrk@163.com>
>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>>> Tested-by: Andy Yan <andyshrk@163.com>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>> ---
>>>>    include/drm/drm_gem.h | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
>>>> --- a/include/drm/drm_gem.h
>>>> +++ b/include/drm/drm_gem.h
>>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>>>    static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>>>    {
>>>>        /* The dma-buf's priv field points to the original GEM object. */
>>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
>>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
>>>> +           /*
>>>> +        * TODO: During object release, the dma-buf might already
>>>> +        *       be gone. For now keep testing import_attach, but
>>>> +        *       this should be removed at some point.
>>>> +        */
>>>> +           obj->import_attach;
>>>>    }
>>>>      #ifdef CONFIG_LOCKDEP

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

