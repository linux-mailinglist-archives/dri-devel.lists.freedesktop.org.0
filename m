Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F360A1082C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 14:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB9210E2F1;
	Tue, 14 Jan 2025 13:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eaGRr8F/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O0VD1u/k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eaGRr8F/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O0VD1u/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FBB10E2C4;
 Tue, 14 Jan 2025 13:51:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DEBD2116A;
 Tue, 14 Jan 2025 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736862629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kru6DSrUnl2eUBRYcxxMVFGIDND6Bp53H3iDhc2SIB4=;
 b=eaGRr8F/SP+WjIJSjy5B3Z39rdmT4PdwenGwI03+hgjtIY1t9wc7nz87TcTNDfbjljXMB8
 ZdUT+UGgYvQfp5AZ3kecqtJQ5/6gxK8v2PAkkiHwOiS6k8jrWKSwZYVX51VbmLpJtoOb9C
 crymOruD2e4ox76z96t67bQzPjZk5U8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736862629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kru6DSrUnl2eUBRYcxxMVFGIDND6Bp53H3iDhc2SIB4=;
 b=O0VD1u/kRnmksNxzoRxDb+x0/0RsK7VO39Q37gSeodBijCeH9A4EY9YEEJ925o12tBY4m7
 MVbTJ2Cv+xpi2fBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736862629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kru6DSrUnl2eUBRYcxxMVFGIDND6Bp53H3iDhc2SIB4=;
 b=eaGRr8F/SP+WjIJSjy5B3Z39rdmT4PdwenGwI03+hgjtIY1t9wc7nz87TcTNDfbjljXMB8
 ZdUT+UGgYvQfp5AZ3kecqtJQ5/6gxK8v2PAkkiHwOiS6k8jrWKSwZYVX51VbmLpJtoOb9C
 crymOruD2e4ox76z96t67bQzPjZk5U8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736862629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kru6DSrUnl2eUBRYcxxMVFGIDND6Bp53H3iDhc2SIB4=;
 b=O0VD1u/kRnmksNxzoRxDb+x0/0RsK7VO39Q37gSeodBijCeH9A4EY9YEEJ925o12tBY4m7
 MVbTJ2Cv+xpi2fBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BCB1139CB;
 Tue, 14 Jan 2025 13:50:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Nj7cHKVrhmdFUgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jan 2025 13:50:29 +0000
Message-ID: <7cf9af86-b656-4153-9db2-eeb4e8433f2b@suse.de>
Date: Tue, 14 Jan 2025 14:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <96a3171d-7052-4a6d-92cc-daac7976e4ef@suse.de>
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
In-Reply-To: <96a3171d-7052-4a6d-92cc-daac7976e4ef@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,bootlin.com:url]
X-Spam-Flag: NO
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


Am 14.01.25 um 14:46 schrieb Thomas Zimmermann:
> Hi
>
>
> Am 15.12.24 um 21:53 schrieb Marek Olšák:
>> The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
>>
>> Signed-off-by: Marek Olšák <marek.olsak@amd.com>
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h 
>> b/include/uapi/drm/drm_fourcc.h
>> index 78abd819fd62e..8ec4163429014 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -484,9 +484,27 @@ extern "C" {
>>   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the 
>> DRM_ADDFB2 ioctl),
>>   * which tells the driver to also take driver-internal information 
>> into account
>>   * and so might actually result in a tiled framebuffer.
>> + *
>> + * WARNING:
>> + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, 
>> but only
>> + * support a certain pitch alignment and can't import images with 
>> this modifier
>> + * if the pitch alignment isn't exactly the one supported. They can 
>> however
>> + * allocate images with this modifier and other drivers can import 
>> them only
>> + * if they support the same pitch alignment. Thus, 
>> DRM_FORMAT_MOD_LINEAR is
>> + * fundamentically incompatible across devices and is the only 
>> modifier that
>> + * has a chance of not working. The PITCH_ALIGN modifiers should be 
>> used
>> + * instead.
>>   */
>>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>>
>> +/* Linear layout modifiers with an explicit pitch alignment in bytes.
>> + * Exposing this modifier requires that the pitch alignment is exactly
>> + * the number in the definition.
>> + */
>> +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
>
> I recently went through drivers and tried to harmonize some 
> pitch-related code. There are essentially all cases from 2 to 256. See 
> my series at
>
>   https://patchwork.freedesktop.org/series/141168/
>
> Sometimes the driver computes the pitch requirements from the 
> bit-per-pixels. [1]
>
> Hardware also has alignment requirements for framebuffer width 
> (usually 8 pixels).

To clarify: given this and the overall discussion here, it seems to me 
that modifiers and descriptors really don't fit well to the problem.

Best regards
Thomas

>
> Best regards
> Thomas
>
> [1] 
> https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c#L410
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

