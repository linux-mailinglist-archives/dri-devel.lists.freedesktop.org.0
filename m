Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8890B037A2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DA710E3FE;
	Mon, 14 Jul 2025 07:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hQEWiDxw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LWRESlag";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hQEWiDxw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LWRESlag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472C10E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 07:13:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A08C1F390;
 Mon, 14 Jul 2025 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752477183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=S1j1PPZO/CxHUUjgAmBLPxrpiDZa6ppjmh1PZ8qf+gI=;
 b=hQEWiDxwpNTaqpYbO3YkGS3proVHkFqA385KxnUvnGRhUG5OeEPI6td8nJAUJMBHxkcjxl
 Lxn4/922tzkGoeC6cwyuaeg4laJwxp0n9UAu75dElHGv+e53AeDFrcfpK0rTjKm8FeHYH6
 /J0qvKdbsopgUsChZqC3x0ck0ACsSA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752477183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=S1j1PPZO/CxHUUjgAmBLPxrpiDZa6ppjmh1PZ8qf+gI=;
 b=LWRESlagZ40mRoU6T4OwllQZ/FYrhj6t5nFL/41PU8IwCgupGKkFYUaSEBquE7OT8Xfs6I
 cGRdGDeRwlXCgsDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752477183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=S1j1PPZO/CxHUUjgAmBLPxrpiDZa6ppjmh1PZ8qf+gI=;
 b=hQEWiDxwpNTaqpYbO3YkGS3proVHkFqA385KxnUvnGRhUG5OeEPI6td8nJAUJMBHxkcjxl
 Lxn4/922tzkGoeC6cwyuaeg4laJwxp0n9UAu75dElHGv+e53AeDFrcfpK0rTjKm8FeHYH6
 /J0qvKdbsopgUsChZqC3x0ck0ACsSA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752477183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=S1j1PPZO/CxHUUjgAmBLPxrpiDZa6ppjmh1PZ8qf+gI=;
 b=LWRESlagZ40mRoU6T4OwllQZ/FYrhj6t5nFL/41PU8IwCgupGKkFYUaSEBquE7OT8Xfs6I
 cGRdGDeRwlXCgsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EED5A138A1;
 Mon, 14 Jul 2025 07:13:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6oZ/OP6tdGgrFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 07:13:02 +0000
Message-ID: <87fa470c-8094-4b2e-b4ea-76c8bd5f3daf@suse.de>
Date: Mon, 14 Jul 2025 09:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/color-mgmt: Prepare for RGB332 palettes
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
References: <20250617143649.143967-1-tzimmermann@suse.de>
 <20250617143649.143967-6-tzimmermann@suse.de>
 <87ple6ex00.fsf@minerva.mail-host-address-is-not-set>
 <635a8207-c52b-4a02-9135-738d12d517a7@suse.de>
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
In-Reply-To: <635a8207-c52b-4a02-9135-738d12d517a7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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


Am 11.07.25 um 14:30 schrieb Thomas Zimmermann:
> Hi
>
> Am 11.07.25 um 14:24 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>>> Add helper drm_crtc_fill_palette_332(), which fills palettes with
>>> RGB332 color data. Each color in RGB332 format serves as an index
>>> into an 8-bit palette that stores the corresponding component-based
>>> colors.
>>>
>>> Vesadrm will use the new helper to emulate RGB formats on top of
>>> framebuffers in C8 format.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/drm_color_mgmt.c | 32 
>>> ++++++++++++++++++++++++++++++++
>>>   include/drm/drm_color_mgmt.h     |  1 +
>>>   2 files changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_color_mgmt.c 
>>> b/drivers/gpu/drm/drm_color_mgmt.c
>>> index 37a3270bc3c2..7ef214848313 100644
>>> --- a/drivers/gpu/drm/drm_color_mgmt.c
>>> +++ b/drivers/gpu/drm/drm_color_mgmt.c
>>> @@ -817,6 +817,38 @@ void drm_crtc_load_palette_8(struct drm_crtc 
>>> *crtc, const struct drm_color_lut *
>>>   }
>>>   EXPORT_SYMBOL(drm_crtc_load_palette_8);
>>>   +static void fill_palette_332(struct drm_crtc *crtc, u16 r, u16 g, 
>>> u16 b,
>>> +                 drm_crtc_set_lut_func set_palette)
>>> +{
>>> +    unsigned int i = (r << 5) | (g << 2) | b;
>>> +
>>> +    r = (r << 13) | (r << 10) | (r << 7) | (r << 4) | (r << 1) | (r 
>>> >> 2);
>>> +    g = (g << 13) | (g << 10) | (g << 7) | (g << 4) | (g << 1) | (g 
>>> >> 2);
>>> +    b = (b << 14) | (b << 12) | (b << 10) | (b << 8) | (b << 6) | 
>>> (b << 4) | (b << 2) | b;
>>> +
>>> +    set_palette(crtc, i, r, g, b);
>>> +}
>> I think this helper can benefit of having a kernel-doc or some code
>> comments, e.g:
>>
>>            /* Calculate the 8-bit palette index from the color 
>> components */
>>            unsigned int i = (r << 5) | (g << 2) | b;
>>
>>            /* Expand R (3-bit) G (3-bit) and B (2-bit) values to 
>> 16-bit depth colors */
>>            r = (r << 13) | (r << 10) | (r << 7) | (r << 4) | (r << 1) 
>> | (r >> 2);
>>            g = (g << 13) | (g << 10) | (g << 7) | (g << 4) | (g << 1) 
>> | (g >> 2);
>>            b = (b << 14) | (b << 12) | (b << 10) | (b << 8) | (b << 
>> 6) | (b << 4) | (b << 2) | b;
>>
>>            /* Call the drivers' specific callback to program the 
>> hardware LUT */
>>            set_palette(crtc, i, r, g, b);
>>
>> It might be evident to you, but I don't think it will be for others 
>> looking
>> at the code later.
>>
>> The code itself looks good to me, if I understood it correctly :)
>
> Thanks for reviewing. Commenting this code makes sense.  I just looked 
> again at the r-g-b for loop and the limits are incorrect. Needs to by 
> 3-3-2 instead of 8-8-4. IDK how that happened, as the screenshot from 
> the test looks correct.
>
> https://imgur.com/a/vesadrm-day4-z2XQ4wA
>
> Anyway that is another fix here.

And looking at it again, 8-8-4 is actually correct. It's just 
non-obvious even to the code's author. Hence some docs/changes are needed.

>
> Best regards
> Thomas
>
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

