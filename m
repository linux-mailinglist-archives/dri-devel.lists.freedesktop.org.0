Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8BAD2E50
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B769410E00F;
	Tue, 10 Jun 2025 07:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FImUI0Hh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+GuKTvJQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FImUI0Hh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+GuKTvJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7B910E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:07:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 766172126D;
 Tue, 10 Jun 2025 07:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749539228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gpMx911qwrqAv1gOomUuHD02QO8sPmNP4NjZv0z49dU=;
 b=FImUI0HhZWBu9ZG1DNA/+q/4EKocp4lCNPkCB2idtxUIdGGfuqhQFyQfqeW/hlkWQLVvOi
 YJJqsLw19WtZOoHGha52mAcy/PgvyUzBOaSBnagGfA/VaMbsVfuykCI+KODOyNcSUHc80k
 41bhD3dLy8N2NF90UfvS/mY9f2jZQpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749539228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gpMx911qwrqAv1gOomUuHD02QO8sPmNP4NjZv0z49dU=;
 b=+GuKTvJQEVpc+s+1Szm7NGglF4hpZ6mZXhrzl9w499G/5WD4hz7m2NfgbJmaIwvcLSYR0q
 9HacPVm02HyumMAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749539228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gpMx911qwrqAv1gOomUuHD02QO8sPmNP4NjZv0z49dU=;
 b=FImUI0HhZWBu9ZG1DNA/+q/4EKocp4lCNPkCB2idtxUIdGGfuqhQFyQfqeW/hlkWQLVvOi
 YJJqsLw19WtZOoHGha52mAcy/PgvyUzBOaSBnagGfA/VaMbsVfuykCI+KODOyNcSUHc80k
 41bhD3dLy8N2NF90UfvS/mY9f2jZQpI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749539228;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gpMx911qwrqAv1gOomUuHD02QO8sPmNP4NjZv0z49dU=;
 b=+GuKTvJQEVpc+s+1Szm7NGglF4hpZ6mZXhrzl9w499G/5WD4hz7m2NfgbJmaIwvcLSYR0q
 9HacPVm02HyumMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5702613964;
 Tue, 10 Jun 2025 07:07:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id D0N1E5zZR2g5fAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 07:07:08 +0000
Message-ID: <70d96543-c6c6-44d9-874c-6d5124367a41@suse.de>
Date: Tue, 10 Jun 2025 09:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/arm/hdlcd: Replace struct simplefb_format with custom
 type
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
References: <20250527094336.73524-1-tzimmermann@suse.de>
 <aEa0pQJ9FFhJgWkR@e110455-lin.cambridge.arm.com>
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
In-Reply-To: <aEa0pQJ9FFhJgWkR@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Level: 
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

Hi

Am 09.06.25 um 12:17 schrieb Liviu Dudau:
> On Tue, May 27, 2025 at 11:42:57AM +0200, Thomas Zimmermann wrote:
>> Map DRM FourCC codes to pixel descriptions with internal type struct
>> hdlcd_format. Reorder formats by preference. Avoid simplefb's struct
>> simplefb_format, which is for parsing "simple-framebuffer" DT nodes.
>>
>> The HDLCD drivers uses struct simplefb_format and its default
>> initializer SIMPLEFB_FORMATS to map DRM_FORMAT_ constants to pixel
>> descriptions. The simplefb helpers are for parsing "simple-framebuffer"
>> DT nodes and should be avoided in other context. Therefore replace
>> it in hdlcd with the custom type struct hdlcd_format and the pixel
>> descriptions from PIXEL_FORMAT_ constants.
>>
>> Plane formats exported to userspace are roughly sorted as preferred
>> by hardware and/or driver. SIMPLEFB_FORMATS currently puts 16-bit
>> formats to the top of the list. Changing to struct hdlcd_format
>> allows for reordering the format list. 32-bit formats are now the
>> preferred ones.
>>
>> This change also removes including <linux/platform_data/simplefb.h>,
>> which includes several unrelated headers, such as <linux/fb.h>.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/arm/hdlcd_crtc.c | 32 +++++++++++++++++++++++---------
>>   include/video/pixel_format.h     | 15 +++++++++++++++
>>   2 files changed, 38 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
>> index 3cfefadc7c9d..6fabe65ec0a2 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
>> @@ -11,8 +11,8 @@
>>   
>>   #include <linux/clk.h>
>>   #include <linux/of_graph.h>
>> -#include <linux/platform_data/simplefb.h>
>>   
>> +#include <video/pixel_format.h>
>>   #include <video/videomode.h>
>>   
>>   #include <drm/drm_atomic.h>
>> @@ -28,6 +28,25 @@
>>   #include "hdlcd_drv.h"
>>   #include "hdlcd_regs.h"
>>   
>> +struct hdlcd_format {
>> +	u32 fourcc;
>> +	struct pixel_format pixel;
>> +};
>> +
>> +static const struct hdlcd_format supported_formats[] = {
>> +	{ DRM_FORMAT_XRGB8888, PIXEL_FORMAT_XRGB8888 },
>> +	{ DRM_FORMAT_ARGB8888, PIXEL_FORMAT_ARGB8888 },
>> +	{ DRM_FORMAT_XBGR8888, PIXEL_FORMAT_XBGR8888 },
>> +	{ DRM_FORMAT_ABGR8888, PIXEL_FORMAT_ABGR8888 },
>> +	{ DRM_FORMAT_XRGB2101010, PIXEL_FORMAT_XRGB2101010},
>> +	{ DRM_FORMAT_ARGB2101010, PIXEL_FORMAT_ARGB2101010},
>> +	{ DRM_FORMAT_RGB565, PIXEL_FORMAT_RGB565 },
>> +	{ DRM_FORMAT_RGBA5551, PIXEL_FORMAT_RGBA5551 },
>> +	{ DRM_FORMAT_XRGB1555, PIXEL_FORMAT_XRGB1555 },
>> +	{ DRM_FORMAT_ARGB1555, PIXEL_FORMAT_ARGB1555 },
>> +	{ DRM_FORMAT_RGB888, PIXEL_FORMAT_RGB888 },
>> +};
>> +
>>   /*
>>    * The HDLCD controller is a dumb RGB streamer that gets connected to
>>    * a single HDMI transmitter or in the case of the ARM Models it gets
>> @@ -73,8 +92,6 @@ static const struct drm_crtc_funcs hdlcd_crtc_funcs = {
>>   	.disable_vblank = hdlcd_crtc_disable_vblank,
>>   };
>>   
>> -static struct simplefb_format supported_formats[] = SIMPLEFB_FORMATS;
> Sorry, I was on holiday when you've sent the patch and it fell to the bottom of the pile.

No worries.

>
>
> When I did the initial patch for HDLCD using the SIMPLEFB_FORMATS was convenient as I
> didn't had to type all the "supported" formats, even if the one carrying the alpha
> channel were ignored (HDLCD only has one plane). If we're going to move the supported
> formats in this file I would suggest trimming it down to remove all the alpha-channel
> formats as they are pointless to list as supported. If there is no other user of the
> formats added in pixel_format.h then that should slim down the patch considerably.

That's even better. I suspected that not all formats would be supported 
by hdlcd. I'll prepare an update then.

Best regards
Thomas

>
> Best regards,
> Liviu
>
>> -
>>   /*
>>    * Setup the HDLCD registers for decoding the pixels out of the framebuffer
>>    */
>> @@ -83,15 +100,12 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
>>   	unsigned int btpp;
>>   	struct hdlcd_drm_private *hdlcd = crtc_to_hdlcd_priv(crtc);
>>   	const struct drm_framebuffer *fb = crtc->primary->state->fb;
>> -	uint32_t pixel_format;
>> -	struct simplefb_format *format = NULL;
>> +	const struct pixel_format *format = NULL;
>>   	int i;
>>   
>> -	pixel_format = fb->format->format;
>> -
>>   	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
>> -		if (supported_formats[i].fourcc == pixel_format)
>> -			format = &supported_formats[i];
>> +		if (supported_formats[i].fourcc == fb->format->format)
>> +			format = &supported_formats[i].pixel;
>>   	}
>>   
>>   	if (WARN_ON(!format))
>> diff --git a/include/video/pixel_format.h b/include/video/pixel_format.h
>> index b5104b2a3a13..5ad2386e2014 100644
>> --- a/include/video/pixel_format.h
>> +++ b/include/video/pixel_format.h
>> @@ -23,6 +23,12 @@ struct pixel_format {
>>   #define PIXEL_FORMAT_XRGB1555 \
>>   	{ 16, false, { .alpha = {0, 0}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
>>   
>> +#define PIXEL_FORMAT_ARGB1555 \
>> +	{ 16, false, { .alpha = {15, 1}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
>> +
>> +#define PIXEL_FORMAT_RGBA5551 \
>> +	{ 16, false, { .alpha = {0, 1}, .red = {11, 5}, .green = {6, 5}, .blue = {1, 5} } }
>> +
>>   #define PIXEL_FORMAT_RGB565 \
>>   	{ 16, false, { .alpha = {0, 0}, .red = {11, 5}, .green = {5, 6}, .blue = {0, 5} } }
>>   
>> @@ -32,10 +38,19 @@ struct pixel_format {
>>   #define PIXEL_FORMAT_XRGB8888 \
>>   	{ 32, false, { .alpha = {0, 0}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
>>   
>> +#define PIXEL_FORMAT_ARGB8888 \
>> +	{ 32, false, { .alpha = {24, 8}, .red = {16, 8}, .green = {8, 8}, .blue = {0, 8} } }
>> +
>>   #define PIXEL_FORMAT_XBGR8888 \
>>   	{ 32, false, { .alpha = {0, 0}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
>>   
>> +#define PIXEL_FORMAT_ABGR8888 \
>> +	{ 32, false, { .alpha = {24, 8}, .red = {0, 8}, .green = {8, 8}, .blue = {16, 8} } }
>> +
>>   #define PIXEL_FORMAT_XRGB2101010 \
>>   	{ 32, false, { .alpha = {0, 0}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
>>   
>> +#define PIXEL_FORMAT_ARGB2101010 \
>> +	{ 32, false, { .alpha = {30, 1}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
>> +
>>   #endif
>> -- 
>> 2.49.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

