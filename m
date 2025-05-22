Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92232AC0D73
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D0A10EEA9;
	Thu, 22 May 2025 14:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PmEBTn5i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KEDf09bk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PmEBTn5i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KEDf09bk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD33C10EC82
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 14:00:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F0BB1F460;
 Thu, 22 May 2025 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747922419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EIUxX77NgRuPXfl0BP57nHv2w9g+OaYCuOBs8POQkoE=;
 b=PmEBTn5irpV+flbzjrG5fWKG2zpYWhgCogQPhHM8APzLf7ueEUpgM0zcH1ftDe18eMe80a
 wrw0GyjzYHx/CswcsUfSchI31oJ1qz+AaCq0tMO7tSqfa8QbasD/8PNHESqmDL/DrN0Dl9
 DEWDF5rMqcAJNJhqySW+5FPvc7WO+KY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747922419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EIUxX77NgRuPXfl0BP57nHv2w9g+OaYCuOBs8POQkoE=;
 b=KEDf09bkbz2kxbR2ztr6OMAmLZhguNdYZaDSE21h96rkHuxeJV1bZN85E8zhQJETlv+dbL
 nzJWmzi/HwokpuDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747922419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EIUxX77NgRuPXfl0BP57nHv2w9g+OaYCuOBs8POQkoE=;
 b=PmEBTn5irpV+flbzjrG5fWKG2zpYWhgCogQPhHM8APzLf7ueEUpgM0zcH1ftDe18eMe80a
 wrw0GyjzYHx/CswcsUfSchI31oJ1qz+AaCq0tMO7tSqfa8QbasD/8PNHESqmDL/DrN0Dl9
 DEWDF5rMqcAJNJhqySW+5FPvc7WO+KY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747922419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EIUxX77NgRuPXfl0BP57nHv2w9g+OaYCuOBs8POQkoE=;
 b=KEDf09bkbz2kxbR2ztr6OMAmLZhguNdYZaDSE21h96rkHuxeJV1bZN85E8zhQJETlv+dbL
 nzJWmzi/HwokpuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77269137B8;
 Thu, 22 May 2025 14:00:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QRxRHPMtL2gADgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 May 2025 14:00:19 +0000
Message-ID: <045429ae-f140-4fda-a6db-9d735f15e9f2@suse.de>
Date: Thu, 22 May 2025 16:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] iosys-map: add new accessor interfaces and use them
 internally.
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-2-airlied@gmail.com>
 <2cc885d5-adcf-46d1-abca-c50431ca8316@suse.de>
 <f54h5mhkkcexf57vpyrzscjdetztqt3itg47fmlazsbo47zrcr@swwclbb7dkg7>
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
In-Reply-To: <f54h5mhkkcexf57vpyrzscjdetztqt3itg47fmlazsbo47zrcr@swwclbb7dkg7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 22.05.25 um 15:34 schrieb Lucas De Marchi:
[...]
>>
>> We should encourage users to the other helpers for interacting with 
>> iosys-map structures instead of decoding them manually. OTOH there 
>> are cases where decoding them by hand is clearly better. I'd suggest 
>> to prefix the new helpers with __ so mark them an internal/special.
>
> From the other patches there are quite a few cases that would be using
> "internal"  API. From those there are just a few cases in which we'd
> have a direct translation to existing API... so I wouldn't make this
> internal when they are clearly needed externally.

FTR I'm fine with either.

Best regards
Thomas

>
> Lucas De Marchi
>
>>
>> Best regards
>> Thomas
>>
>>>  /**
>>>   * IOSYS_MAP_INIT_VADDR - Initializes struct iosys_map to an 
>>> address in system memory
>>>   * @vaddr_:    A system-memory address
>>> @@ -234,9 +249,9 @@ static inline bool iosys_map_is_equal(const 
>>> struct iosys_map *lhs,
>>>   */
>>>  static inline bool iosys_map_is_null(const struct iosys_map *map)
>>>  {
>>> -    if (map->is_iomem)
>>> -        return !map->vaddr_iomem;
>>> -    return !map->vaddr;
>>> +    if (iosys_map_is_iomem(map))
>>> +        return !iosys_map_ioptr(map);
>>> +    return !iosys_map_ptr(map);
>>>  }
>>>  /**
>>> @@ -286,10 +301,10 @@ static inline void iosys_map_clear(struct 
>>> iosys_map *map)
>>>  static inline void iosys_map_memcpy_to(struct iosys_map *dst, 
>>> size_t dst_offset,
>>>                         const void *src, size_t len)
>>>  {
>>> -    if (dst->is_iomem)
>>> -        memcpy_toio(dst->vaddr_iomem + dst_offset, src, len);
>>> +    if (iosys_map_is_iomem(dst))
>>> +        memcpy_toio(iosys_map_ioptr(dst) + dst_offset, src, len);
>>>      else
>>> -        memcpy(dst->vaddr + dst_offset, src, len);
>>> +        memcpy(iosys_map_ptr(dst) + dst_offset, src, len);
>>>  }
>>>  /**
>>> @@ -306,10 +321,10 @@ static inline void iosys_map_memcpy_to(struct 
>>> iosys_map *dst, size_t dst_offset,
>>>  static inline void iosys_map_memcpy_from(void *dst, const struct 
>>> iosys_map *src,
>>>                       size_t src_offset, size_t len)
>>>  {
>>> -    if (src->is_iomem)
>>> -        memcpy_fromio(dst, src->vaddr_iomem + src_offset, len);
>>> +    if (iosys_map_is_iomem(src))
>>> +        memcpy_fromio(dst, iosys_map_ioptr(src) + src_offset, len);
>>>      else
>>> -        memcpy(dst, src->vaddr + src_offset, len);
>>> +        memcpy(dst, iosys_map_ptr(src) + src_offset, len);
>>>  }
>>>  /**
>>> @@ -322,7 +337,7 @@ static inline void iosys_map_memcpy_from(void 
>>> *dst, const struct iosys_map *src,
>>>   */
>>>  static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>>>  {
>>> -    if (map->is_iomem)
>>> +    if (iosys_map_is_iomem(map))
>>>          map->vaddr_iomem += incr;
>>>      else
>>>          map->vaddr += incr;
>>> @@ -341,10 +356,10 @@ static inline void iosys_map_incr(struct 
>>> iosys_map *map, size_t incr)
>>>  static inline void iosys_map_memset(struct iosys_map *dst, size_t 
>>> offset,
>>>                      int value, size_t len)
>>>  {
>>> -    if (dst->is_iomem)
>>> -        memset_io(dst->vaddr_iomem + offset, value, len);
>>> +    if (iosys_map_is_iomem(dst))
>>> +        memset_io(iosys_map_ioptr(dst) + offset, value, len);
>>>      else
>>> -        memset(dst->vaddr + offset, value, len);
>>> +        memset(iosys_map_ptr(dst) + offset, value, len);
>>>  }
>>>  #ifdef CONFIG_64BIT
>>> @@ -393,10 +408,10 @@ static inline void iosys_map_memset(struct 
>>> iosys_map *dst, size_t offset,
>>>   */
>>>  #define iosys_map_rd(map__, offset__, type__) ({                    \
>>>      type__ val_;                                    \
>>> -    if ((map__)->is_iomem) {                            \
>>> -        __iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), 
>>> type__);    \
>>> +    if (iosys_map_is_iomem(map__)) {                        \
>>> +        __iosys_map_rd_io(val_, iosys_map_ioptr(map__) + 
>>> (offset__), type__);    \
>>>      } else {                                    \
>>> -        __iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), 
>>> type__);        \
>>> +        __iosys_map_rd_sys(val_, iosys_map_ptr(map__) + (offset__), 
>>> type__);    \
>>>      }                                        \
>>>      val_;                                        \
>>>  })
>>> @@ -415,10 +430,10 @@ static inline void iosys_map_memset(struct 
>>> iosys_map *dst, size_t offset,
>>>   */
>>>  #define iosys_map_wr(map__, offset__, type__, val__) 
>>> ({                    \
>>>      type__ val_ = (val__);                                \
>>> -    if ((map__)->is_iomem) {                            \
>>> -        __iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), 
>>> type__);    \
>>> +    if (iosys_map_is_iomem(map__)) {                        \
>>> +        __iosys_map_wr_io(val_, iosys_map_ioptr(map__) + 
>>> (offset__), type__);    \
>>>      } else {                                    \
>>> -        __iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), 
>>> type__);        \
>>> +        __iosys_map_wr_sys(val_, iosys_map_ptr(map__) + (offset__), 
>>> type__);    \
>>>      }                                        \
>>>  })
>>
>> -- 
>> -- 
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

