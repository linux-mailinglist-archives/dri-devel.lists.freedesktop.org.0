Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02F8754BC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 18:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D791710EFC9;
	Thu,  7 Mar 2024 17:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Yf0DYSJp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fx/qv7Bv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yf0DYSJp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fx/qv7Bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805CB10EFC9
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 17:00:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 482FF67955;
 Thu,  7 Mar 2024 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709826091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nPLDl3B8siSpYrlGeKQXSgrrs6X9rC7KLdBsCdlrfX0=;
 b=Yf0DYSJpESp8S/YTWMbKbQ5suvbb/pTfdVnBygAX8kksjBFtqfrtfY+xTgzQJBSz0tjTcz
 xDs4KoApgzxpO5iB/ktgG6AMRI+85TYnlL4FscRs9FjzzifYm6Qz7f5k3lzh7SdKrP6rqP
 GzxSTcIg2ImSrSNVn6z2Xt7m43ezBlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709826091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nPLDl3B8siSpYrlGeKQXSgrrs6X9rC7KLdBsCdlrfX0=;
 b=fx/qv7BvTRQF2Mt1kOcmnA8mBeHWDZc7X8RBu8vfqO0H8/XrxVaNyka/2EniakgxHQ7Plo
 8R+3uAXjOlqJ3cBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709826091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nPLDl3B8siSpYrlGeKQXSgrrs6X9rC7KLdBsCdlrfX0=;
 b=Yf0DYSJpESp8S/YTWMbKbQ5suvbb/pTfdVnBygAX8kksjBFtqfrtfY+xTgzQJBSz0tjTcz
 xDs4KoApgzxpO5iB/ktgG6AMRI+85TYnlL4FscRs9FjzzifYm6Qz7f5k3lzh7SdKrP6rqP
 GzxSTcIg2ImSrSNVn6z2Xt7m43ezBlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709826091;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nPLDl3B8siSpYrlGeKQXSgrrs6X9rC7KLdBsCdlrfX0=;
 b=fx/qv7BvTRQF2Mt1kOcmnA8mBeHWDZc7X8RBu8vfqO0H8/XrxVaNyka/2EniakgxHQ7Plo
 8R+3uAXjOlqJ3cBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 05C05132A4;
 Thu,  7 Mar 2024 15:41:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id HQ9AACvg6WU5bwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Mar 2024 15:41:31 +0000
Message-ID: <cf7f311c-645c-4c5f-a595-8325a7ecc2f2@suse.de>
Date: Thu, 7 Mar 2024 16:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-1-jfalempe@redhat.com>
 <20240307091936.576689-3-jfalempe@redhat.com>
 <4c2def7e-88c0-44e4-8aec-8107c2b502c7@suse.de>
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
In-Reply-To: <4c2def7e-88c0-44e4-8aec-8107c2b502c7@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[10];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -3.09
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



Am 07.03.24 um 15:08 schrieb Thomas Zimmermann:
> Hi
>
> Am 07.03.24 um 10:14 schrieb Jocelyn Falempe:
>> This is needed for drm_panic, to draw the font, and fill
>> the background color, in multiple color format.
>
> As you know, I'm not happy about this patch and the the changes do not 
> reflect my easier

s/easier/earlier

> review. These format helpers are supposed to serve all of DRM and not 
> just the panic handler. I know that the current code isn't perfect, 
> but the R1 support is a step backwards IMHO.
>
> I suggest to the drawing routines entirely within the panic-handler 
> code and maybe try to sort out things later. IIRC that's how it was in 
> earlier revisions of the patchset.
>
> Best regards
> Thomas
>
>>
>> v5:
>>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>>   * Also add drm_fb_fill() to fill area with background color.
>> v6:
>>   * fix __le32 conversion warning found by the kernel test bot
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 432 ++++++++++++++++++++++------
>>   include/drm/drm_format_helper.h     |   9 +
>>   2 files changed, 360 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c 
>> b/drivers/gpu/drm/drm_format_helper.c
>> index b1be458ed4dd..2d9646cefc4f 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -111,6 +111,153 @@ void drm_format_conv_state_release(struct 
>> drm_format_conv_state *state)
>>   }
>>   EXPORT_SYMBOL(drm_format_conv_state_release);
>>   +static __le16 drm_format_xrgb8888_to_rgb565(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = ((pix & 0x00F80000) >> 8) |
>> +        ((pix & 0x0000FC00) >> 5) |
>> +        ((pix & 0x000000F8) >> 3);
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static __le16 drm_format_xrgb8888_to_rgba5551(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = ((pix & 0x00f80000) >> 8) |
>> +        ((pix & 0x0000f800) >> 5) |
>> +        ((pix & 0x000000f8) >> 2) |
>> +        BIT(0); /* set alpha bit */
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static __le16 drm_format_xrgb8888_to_xrgb1555(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = ((pix & 0x00f80000) >> 9) |
>> +        ((pix & 0x0000f800) >> 6) |
>> +        ((pix & 0x000000f8) >> 3);
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static __le16 drm_format_xrgb8888_to_argb1555(__le32 val32)
>> +{
>> +    u16 val16;
>> +    u32 pix;
>> +
>> +    pix = le32_to_cpu(val32);
>> +    val16 = BIT(15) | /* set alpha bit */
>> +        ((pix & 0x00f80000) >> 9) |
>> +        ((pix & 0x0000f800) >> 6) |
>> +        ((pix & 0x000000f8) >> 3);
>> +    return cpu_to_le16(val16);
>> +}
>> +
>> +static __le32 drm_format_xrgb8888_to_argb8888(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 |= GENMASK(31, 24); /* fill alpha bits */
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +static __le32 drm_format_xrgb8888_to_xbgr8888(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
>> +        ((val32 & 0x0000ff00) >>  8) <<  8 |
>> +        ((val32 & 0x000000ff) >>  0) << 16 |
>> +        ((val32 & 0xff000000) >> 24) << 24;
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +static __le32 drm_format_xrgb8888_to_abgr8888(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x00ff0000) >> 16) <<  0 |
>> +        ((val32 & 0x0000ff00) >>  8) <<  8 |
>> +        ((val32 & 0x000000ff) >>  0) << 16 |
>> +        GENMASK(31, 24); /* fill alpha bits */
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +static __le32 drm_format_xrgb8888_to_xrgb2101010(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x000000FF) << 2) |
>> +        ((val32 & 0x0000FF00) << 4) |
>> +        ((val32 & 0x00FF0000) << 6);
>> +    return cpu_to_le32(val32 | ((val32 >> 8) & 0x00300C03));
>> +}
>> +
>> +static __le32 drm_format_xrgb8888_to_argb2101010(__le32 pix)
>> +{
>> +    u32 val32;
>> +
>> +    val32 = le32_to_cpu(pix);
>> +    val32 = ((val32 & 0x000000FF) << 2) |
>> +        ((val32 & 0x0000FF00) << 4) |
>> +        ((val32 & 0x00FF0000) << 6);
>> +    val32 = GENMASK(31, 30) | /* set alpha bits */
>> +          val32 | ((val32 >> 8) & 0x00300c03);
>> +    return cpu_to_le32(val32);
>> +}
>> +
>> +/**
>> + * drm_fb_convert_from_xrgb8888 - convert one pixel from xrgb8888 to 
>> the desired format
>> + * @color: input color, in xrgb8888 format
>> + * @format: output format
>> + *
>> + * Returns:
>> + * Color in the format specified, casted to u32.
>> + * Or 0 if the format is unknown.
>> + */
>> +u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format)
>> +{
>> +    __le32 pix = cpu_to_le32(color);
>> +
>> +    switch (format) {
>> +    case DRM_FORMAT_RGB565:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_rgb565(pix));
>> +    case DRM_FORMAT_RGBA5551:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_rgba5551(pix));
>> +    case DRM_FORMAT_XRGB1555:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_xrgb1555(pix));
>> +    case DRM_FORMAT_ARGB1555:
>> +        return le16_to_cpu(drm_format_xrgb8888_to_argb1555(pix));
>> +    case DRM_FORMAT_RGB888:
>> +    case DRM_FORMAT_XRGB8888:
>> +        return le32_to_cpu(pix);
>> +    case DRM_FORMAT_ARGB8888:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_argb8888(pix));
>> +    case DRM_FORMAT_XBGR8888:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_xbgr8888(pix));
>> +    case DRM_FORMAT_XRGB2101010:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_xrgb2101010(pix));
>> +    case DRM_FORMAT_ARGB2101010:
>> +        return le32_to_cpu(drm_format_xrgb8888_to_argb2101010(pix));
>> +    default:
>> +        WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>> +        return 0;
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_fb_convert_from_xrgb8888);
>> +
>>   static unsigned int clip_offset(const struct drm_rect *clip, 
>> unsigned int pitch, unsigned int cpp)
>>   {
>>       return clip->y1 * pitch + clip->x1 * cpp;
>> @@ -366,6 +513,193 @@ void drm_fb_swab(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>   }
>>   EXPORT_SYMBOL(drm_fb_swab);
>>   +static void drm_fb_r1_to_16bit(struct iosys_map *dmap, unsigned 
>> int dpitch,
>> +                   const u8 *sbuf8, unsigned int spitch,
>> +                   unsigned int height, unsigned int width,
>> +                   __le16 fg16, __le16 bg16)
>> +{
>> +    unsigned int l, x;
>> +    __le16 val16;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            val16 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 
>> 8))) ? fg16 : bg16;
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, 
>> le16_to_cpu(val16));
>> +        }
>> +    }
>> +}
>> +
>> +static void drm_fb_r1_to_24bit(struct iosys_map *dmap, unsigned int 
>> dpitch,
>> +                   const u8 *sbuf8, unsigned int spitch,
>> +                   unsigned int height, unsigned int width,
>> +                   __le32 fg32, __le32 bg32)
>> +{
>> +    unsigned int l, x;
>> +    __le32 color;
>> +    u32 val32;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            u32 off = l * dpitch + x * 3;
>> +
>> +            color = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 
>> 8))) ? fg32 : bg32;
>> +            val32 = le32_to_cpu(color);
>> +
>> +            /* write blue-green-red to output in little endianness */
>> +            iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
>> +            iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
>> +            iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 
>> 16);
>> +        }
>> +    }
>> +}
>> +
>> +static void drm_fb_r1_to_32bit(struct iosys_map *dmap, unsigned int 
>> dpitch,
>> +                   const u8 *sbuf8, unsigned int spitch,
>> +                   unsigned int height, unsigned int width,
>> +                   __le32 fg32, __le32 bg32)
>> +{
>> +    unsigned int l, x;
>> +    __le32 val32;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            val32 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 
>> 8))) ? fg32 : bg32;
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, 
>> le32_to_cpu(val32));
>> +        }
>> +    }
>> +}
>> +
>> +/**
>> + * drm_fb_blit_from_r1 - convert a monochrome image to a linear 
>> framebuffer
>> + * @dmap: destination iosys_map
>> + * @dpitch: destination pitch in bytes
>> + * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
>> + * @spitch: source pitch in bytes
>> + * @height: height of the image to copy, in pixels
>> + * @width: width of the image to copy, in pixels
>> + * @fg_color: foreground color, in destination format
>> + * @bg_color: background color, in destination format
>> + * @pixel_width: pixel width in bytes.
>> + *
>> + * This can be used to draw font which are monochrome images, to a 
>> framebuffer
>> + * in other supported format.
>> + */
>> +void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
>> +             const u8 *sbuf8, unsigned int spitch,
>> +             unsigned int height, unsigned int width,
>> +             u32 fg_color, u32 bg_color,
>> +             unsigned int pixel_width)
>> +{
>> +    switch (pixel_width) {
>> +    case 2:
>> +        drm_fb_r1_to_16bit(dmap, dpitch, sbuf8, spitch,
>> +                   height, width,
>> +                   cpu_to_le16(fg_color),
>> +                   cpu_to_le16(bg_color));
>> +    break;
>> +    case 3:
>> +        drm_fb_r1_to_24bit(dmap, dpitch, sbuf8, spitch,
>> +                   height, width,
>> +                   cpu_to_le32(fg_color),
>> +                   cpu_to_le32(bg_color));
>> +    break;
>> +    case 4:
>> +        drm_fb_r1_to_32bit(dmap, dpitch, sbuf8, spitch,
>> +                   height, width,
>> +                   cpu_to_le32(fg_color),
>> +                   cpu_to_le32(bg_color));
>> +    break;
>> +    default:
>> +        WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_fb_blit_from_r1);
>> +
>> +static void drm_fb_fill8(struct iosys_map *dmap, unsigned int dpitch,
>> +             unsigned int height, unsigned int width,
>> +             u8 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++)
>> +        for (x = 0; x < width; x++)
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u8), u8, color);
>> +}
>> +
>> +static void drm_fb_fill16(struct iosys_map *dmap, unsigned int dpitch,
>> +              unsigned int height, unsigned int width,
>> +              u16 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++)
>> +        for (x = 0; x < width; x++)
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, 
>> color);
>> +}
>> +
>> +static void drm_fb_fill24(struct iosys_map *dmap, unsigned int dpitch,
>> +              unsigned int height, unsigned int width,
>> +              u32 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++) {
>> +        for (x = 0; x < width; x++) {
>> +            unsigned int off = l * dpitch + x * 3;
>> +
>> +            /* write blue-green-red to output in little endianness */
>> +            iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
>> +            iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
>> +            iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 
>> 16);
>> +        }
>> +    }
>> +}
>> +
>> +static void drm_fb_fill32(struct iosys_map *dmap, unsigned int dpitch,
>> +              unsigned int height, unsigned int width,
>> +              u32 color)
>> +{
>> +    unsigned int l, x;
>> +
>> +    for (l = 0; l < height; l++)
>> +        for (x = 0; x < width; x++)
>> +            iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, 
>> color);
>> +}
>> +
>> +/**
>> + * drm_fb_fill - Fill a rectangle with a color
>> + * @dmap: destination iosys_map, pointing to the top left corner of 
>> the rectangle
>> + * @dpitch: destination pitch in bytes
>> + * @height: height of the rectangle, in pixels
>> + * @width: width of the rectangle, in pixels
>> + * @color: color to fill the rectangle.
>> + * @pixel_width: pixel width in bytes
>> + *
>> + * Fill a rectangle with a color, in a linear framebuffer.
>> + */
>> +void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
>> +             unsigned int height, unsigned int width,
>> +             u32 color, unsigned int pixel_width)
>> +{
>> +    switch (pixel_width) {
>> +    case 1:
>> +        drm_fb_fill8(dmap, dpitch, height, width, color);
>> +    break;
>> +    case 2:
>> +        drm_fb_fill16(dmap, dpitch, height, width, color);
>> +    break;
>> +    case 3:
>> +        drm_fb_fill24(dmap, dpitch, height, width, color);
>> +    break;
>> +    case 4:
>> +        drm_fb_fill32(dmap, dpitch, height, width, color);
>> +    break;
>> +    default:
>> +        WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_fb_fill);
>> +
>>   static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void 
>> *sbuf, unsigned int pixels)
>>   {
>>       u8 *dbuf8 = dbuf;
>> @@ -420,15 +754,9 @@ static void drm_fb_xrgb8888_to_rgb565_line(void 
>> *dbuf, const void *sbuf, unsigne
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>>         for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = ((pix & 0x00F80000) >> 8) |
>> -            ((pix & 0x0000FC00) >> 5) |
>> -            ((pix & 0x000000F8) >> 3);
>> -        dbuf16[x] = cpu_to_le16(val16);
>> +        dbuf16[x] = drm_format_xrgb8888_to_rgb565(sbuf32[x]);
>>       }
>>   }
>>   @@ -498,16 +826,9 @@ static void 
>> drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = ((pix & 0x00f80000) >> 9) |
>> -            ((pix & 0x0000f800) >> 6) |
>> -            ((pix & 0x000000f8) >> 3);
>> -        dbuf16[x] = cpu_to_le16(val16);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf16[x] = drm_format_xrgb8888_to_xrgb1555(sbuf32[x]);
>>   }
>>     /**
>> @@ -550,17 +871,9 @@ static void 
>> drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = BIT(15) | /* set alpha bit */
>> -            ((pix & 0x00f80000) >> 9) |
>> -            ((pix & 0x0000f800) >> 6) |
>> -            ((pix & 0x000000f8) >> 3);
>> -        dbuf16[x] = cpu_to_le16(val16);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf16[x] = drm_format_xrgb8888_to_argb1555(sbuf32[x]);
>>   }
>>     /**
>> @@ -603,17 +916,9 @@ static void 
>> drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
>>       __le16 *dbuf16 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u16 val16;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val16 = ((pix & 0x00f80000) >> 8) |
>> -            ((pix & 0x0000f800) >> 5) |
>> -            ((pix & 0x000000f8) >> 2) |
>> -            BIT(0); /* set alpha bit */
>> -        dbuf16[x] = cpu_to_le16(val16);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf16[x] = drm_format_xrgb8888_to_rgba5551(sbuf32[x]);
>>   }
>>     /**
>> @@ -707,13 +1012,9 @@ static void 
>> drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        pix |= GENMASK(31, 24); /* fill alpha bits */
>> -        dbuf32[x] = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        dbuf32[x] = drm_format_xrgb8888_to_argb8888(sbuf32[x]);
>>   }
>>     /**
>> @@ -756,16 +1057,9 @@ static void 
>> drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        pix = ((pix & 0x00ff0000) >> 16) <<  0 |
>> -              ((pix & 0x0000ff00) >>  8) <<  8 |
>> -              ((pix & 0x000000ff) >>  0) << 16 |
>> -              GENMASK(31, 24); /* fill alpha bits */
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_abgr8888(sbuf32[x]);
>>   }
>>     static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, 
>> const unsigned int *dst_pitch,
>> @@ -787,16 +1081,9 @@ static void 
>> drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsig
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        pix = ((pix & 0x00ff0000) >> 16) <<  0 |
>> -              ((pix & 0x0000ff00) >>  8) <<  8 |
>> -              ((pix & 0x000000ff) >>  0) << 16 |
>> -              ((pix & 0xff000000) >> 24) << 24;
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_xbgr8888(sbuf32[x]);
>>   }
>>     static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, 
>> const unsigned int *dst_pitch,
>> @@ -818,17 +1105,9 @@ static void 
>> drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 val32;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val32 = ((pix & 0x000000FF) << 2) |
>> -            ((pix & 0x0000FF00) << 4) |
>> -            ((pix & 0x00FF0000) << 6);
>> -        pix = val32 | ((val32 >> 8) & 0x00300C03);
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_xrgb2101010(sbuf32[x]);
>>   }
>>     /**
>> @@ -872,18 +1151,9 @@ static void 
>> drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
>>       __le32 *dbuf32 = dbuf;
>>       const __le32 *sbuf32 = sbuf;
>>       unsigned int x;
>> -    u32 val32;
>> -    u32 pix;
>>   -    for (x = 0; x < pixels; x++) {
>> -        pix = le32_to_cpu(sbuf32[x]);
>> -        val32 = ((pix & 0x000000ff) << 2) |
>> -            ((pix & 0x0000ff00) << 4) |
>> -            ((pix & 0x00ff0000) << 6);
>> -        pix = GENMASK(31, 30) | /* set alpha bits */
>> -              val32 | ((val32 >> 8) & 0x00300c03);
>> -        *dbuf32++ = cpu_to_le32(pix);
>> -    }
>> +    for (x = 0; x < pixels; x++)
>> +        *dbuf32++ = drm_format_xrgb8888_to_argb2101010(sbuf32[x]);
>>   }
>>     /**
>> diff --git a/include/drm/drm_format_helper.h 
>> b/include/drm/drm_format_helper.h
>> index f13b34e0b752..f416f0bef52d 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -66,6 +66,7 @@ void *drm_format_conv_state_reserve(struct 
>> drm_format_conv_state *state,
>>                       size_t new_size, gfp_t flags);
>>   void drm_format_conv_state_release(struct drm_format_conv_state 
>> *state);
>>   +u32 drm_fb_convert_from_xrgb8888(u32 color, u32 format);
>>   unsigned int drm_fb_clip_offset(unsigned int pitch, const struct 
>> drm_format_info *format,
>>                   const struct drm_rect *clip);
>>   @@ -76,6 +77,14 @@ void drm_fb_swab(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>            const struct iosys_map *src, const struct drm_framebuffer 
>> *fb,
>>            const struct drm_rect *clip, bool cached,
>>            struct drm_format_conv_state *state);
>> +void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
>> +             const u8 *sbuf8, unsigned int spitch,
>> +             unsigned int height, unsigned int width,
>> +             u32 fg_color, u32 bg_color,
>> +             unsigned int pixel_width);
>> +void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
>> +         unsigned int height, unsigned int width,
>> +         u32 color, unsigned int pixel_width);
>>   void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>>                      const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                      const struct drm_rect *clip, struct 
>> drm_format_conv_state *state);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

