Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623C69C3F16
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBA810E4AB;
	Mon, 11 Nov 2024 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sUkIpZ1J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="evgYRd1H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sUkIpZ1J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="evgYRd1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD43410E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 13:03:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D30C1F38F;
 Mon, 11 Nov 2024 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731330196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YsxhrNQuYAS+iLKtd4Nf7NpFsM7AxPC5I2nvD34xyNY=;
 b=sUkIpZ1J0wUviJY/3/47SjDKmXN9CvMbBSgUHKrr9TWwG8rgVnTa9QpMi8ZvgA5fQbLU3t
 rjHPGjt9nN5jy7bfi7MTZE4AO/app5Z5vsGrATmmpgGAuMtPIOFr4YwK7dCVkUTg0roT96
 yXDldd5T5fcd2MhIpDwTjvTeHv4t9b4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731330196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YsxhrNQuYAS+iLKtd4Nf7NpFsM7AxPC5I2nvD34xyNY=;
 b=evgYRd1HPQ4Qvq4hd3LSPrnueYArPiOOPrTQS75oAFK5SYNarEuqVZ/D85mGq585Ph1Rz3
 lw8YItQC9XAmP+DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731330196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YsxhrNQuYAS+iLKtd4Nf7NpFsM7AxPC5I2nvD34xyNY=;
 b=sUkIpZ1J0wUviJY/3/47SjDKmXN9CvMbBSgUHKrr9TWwG8rgVnTa9QpMi8ZvgA5fQbLU3t
 rjHPGjt9nN5jy7bfi7MTZE4AO/app5Z5vsGrATmmpgGAuMtPIOFr4YwK7dCVkUTg0roT96
 yXDldd5T5fcd2MhIpDwTjvTeHv4t9b4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731330196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YsxhrNQuYAS+iLKtd4Nf7NpFsM7AxPC5I2nvD34xyNY=;
 b=evgYRd1HPQ4Qvq4hd3LSPrnueYArPiOOPrTQS75oAFK5SYNarEuqVZ/D85mGq585Ph1Rz3
 lw8YItQC9XAmP+DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25318137FB;
 Mon, 11 Nov 2024 13:03:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nzThB5QAMmcITAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Nov 2024 13:03:16 +0000
Message-ID: <eba7d719-1e44-4459-9562-a32d3e86be0c@suse.de>
Date: Mon, 11 Nov 2024 14:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] drm/panic: Move drawing functions to drm_draw
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241108082025.1004653-1-jfalempe@redhat.com>
 <20241108082025.1004653-2-jfalempe@redhat.com>
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
In-Reply-To: <20241108082025.1004653-2-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,linutronix.de,igalia.com,verizon.net,linaro.org,suse.com,lists.freedesktop.org,vger.kernel.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
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


Am 08.11.24 um 09:10 schrieb Jocelyn Falempe:
> Move the color conversions, blit and fill functions to drm_draw.c,
> so that they can be re-used by drm_log.
> drm_draw is internal to the drm subsystem, and shouldn't be used by
> gpu drivers.

Just a remark on this patch: I don't like the proliferation of drawing 
APIs. We have this one, we have the format helpers, the vkms code. And 
there's drawing code in fbdev as well. At some point, we will require a 
solution to this problem.

Best regards
Thomas

>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>
> v5:
>   * Export drm_draw symbols, so they can be used if drm_client_lib is built as module.
>
> v6:
>   * rebase and solve conflict with "drm/panic: Add ABGR2101010 support"
>   
>   drivers/gpu/drm/Kconfig     |   5 +
>   drivers/gpu/drm/Makefile    |   1 +
>   drivers/gpu/drm/drm_draw.c  | 233 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_draw.h  |  56 ++++++++
>   drivers/gpu/drm/drm_panic.c | 257 ++++--------------------------------
>   5 files changed, 318 insertions(+), 234 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_draw.c
>   create mode 100644 drivers/gpu/drm/drm_draw.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 5504721007cc1..3f16dca0b6643 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -102,10 +102,15 @@ config DRM_KMS_HELPER
>   	help
>   	  CRTC helpers for KMS drivers.
>   
> +config DRM_DRAW
> +	bool
> +	depends on DRM
> +
>   config DRM_PANIC
>   	bool "Display a user-friendly message when a kernel panic occurs"
>   	depends on DRM
>   	select FONT_SUPPORT
> +	select DRM_DRAW
>   	help
>   	  Enable a drm panic handler, which will display a user-friendly message
>   	  when a kernel panic occurs. It's useful when using a user-space
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 463afad1b5ca6..68a0a679a7b93 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -91,6 +91,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
>   	drm_privacy_screen_x86.o
>   drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>   drm-$(CONFIG_DRM_PANIC) += drm_panic.o
> +drm-$(CONFIG_DRM_DRAW) += drm_draw.o
>   drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
>   obj-$(CONFIG_DRM)	+= drm.o
>   
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> new file mode 100644
> index 0000000000000..0fadbf4d9e235
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/*
> + * Copyright (c) 2023 Red Hat.
> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/iosys-map.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_fourcc.h>
> +
> +#include "drm_draw.h"
> +
> +/*
> + * Conversions from xrgb8888
> + */
> +
> +static u16 convert_xrgb8888_to_rgb565(u32 pix)
> +{
> +	return ((pix & 0x00F80000) >> 8) |
> +	       ((pix & 0x0000FC00) >> 5) |
> +	       ((pix & 0x000000F8) >> 3);
> +}
> +
> +static u16 convert_xrgb8888_to_rgba5551(u32 pix)
> +{
> +	return ((pix & 0x00f80000) >> 8) |
> +	       ((pix & 0x0000f800) >> 5) |
> +	       ((pix & 0x000000f8) >> 2) |
> +	       BIT(0); /* set alpha bit */
> +}
> +
> +static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
> +{
> +	return ((pix & 0x00f80000) >> 9) |
> +	       ((pix & 0x0000f800) >> 6) |
> +	       ((pix & 0x000000f8) >> 3);
> +}
> +
> +static u16 convert_xrgb8888_to_argb1555(u32 pix)
> +{
> +	return BIT(15) | /* set alpha bit */
> +	       ((pix & 0x00f80000) >> 9) |
> +	       ((pix & 0x0000f800) >> 6) |
> +	       ((pix & 0x000000f8) >> 3);
> +}
> +
> +static u32 convert_xrgb8888_to_argb8888(u32 pix)
> +{
> +	return pix | GENMASK(31, 24); /* fill alpha bits */
> +}
> +
> +static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
> +{
> +	return ((pix & 0x00ff0000) >> 16) <<  0 |
> +	       ((pix & 0x0000ff00) >>  8) <<  8 |
> +	       ((pix & 0x000000ff) >>  0) << 16 |
> +	       ((pix & 0xff000000) >> 24) << 24;
> +}
> +
> +static u32 convert_xrgb8888_to_abgr8888(u32 pix)
> +{
> +	return ((pix & 0x00ff0000) >> 16) <<  0 |
> +	       ((pix & 0x0000ff00) >>  8) <<  8 |
> +	       ((pix & 0x000000ff) >>  0) << 16 |
> +	       GENMASK(31, 24); /* fill alpha bits */
> +}
> +
> +static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
> +{
> +	pix = ((pix & 0x000000FF) << 2) |
> +	      ((pix & 0x0000FF00) << 4) |
> +	      ((pix & 0x00FF0000) << 6);
> +	return pix | ((pix >> 8) & 0x00300C03);
> +}
> +
> +static u32 convert_xrgb8888_to_argb2101010(u32 pix)
> +{
> +	pix = ((pix & 0x000000FF) << 2) |
> +	      ((pix & 0x0000FF00) << 4) |
> +	      ((pix & 0x00FF0000) << 6);
> +	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> +}
> +
> +static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
> +{
> +	pix = ((pix & 0x00FF0000) >> 14) |
> +	      ((pix & 0x0000FF00) << 4) |
> +	      ((pix & 0x000000FF) << 22);
> +	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> +}
> +
> +/**
> + * drm_draw_color_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> + * @color: input color, in xrgb8888 format
> + * @format: output format
> + *
> + * Returns:
> + * Color in the format specified, casted to u32.
> + * Or 0 if the format is not supported.
> + */
> +u32 drm_draw_color_from_xrgb8888(u32 color, u32 format)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +		return convert_xrgb8888_to_rgb565(color);
> +	case DRM_FORMAT_RGBA5551:
> +		return convert_xrgb8888_to_rgba5551(color);
> +	case DRM_FORMAT_XRGB1555:
> +		return convert_xrgb8888_to_xrgb1555(color);
> +	case DRM_FORMAT_ARGB1555:
> +		return convert_xrgb8888_to_argb1555(color);
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_XRGB8888:
> +		return color;
> +	case DRM_FORMAT_ARGB8888:
> +		return convert_xrgb8888_to_argb8888(color);
> +	case DRM_FORMAT_XBGR8888:
> +		return convert_xrgb8888_to_xbgr8888(color);
> +	case DRM_FORMAT_ABGR8888:
> +		return convert_xrgb8888_to_abgr8888(color);
> +	case DRM_FORMAT_XRGB2101010:
> +		return convert_xrgb8888_to_xrgb2101010(color);
> +	case DRM_FORMAT_ARGB2101010:
> +		return convert_xrgb8888_to_argb2101010(color);
> +	case DRM_FORMAT_ABGR2101010:
> +		return convert_xrgb8888_to_abgr2101010(color);
> +	default:
> +		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
> +		return 0;
> +	}
> +}
> +EXPORT_SYMBOL(drm_draw_color_from_xrgb8888);
> +
> +/*
> + * Blit functions
> + */
> +void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,
> +		     const u8 *sbuf8, unsigned int spitch,
> +		     unsigned int height, unsigned int width,
> +		     unsigned int scale, u16 fg16)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++)
> +		for (x = 0; x < width; x++)
> +			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
> +				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, fg16);
> +}
> +EXPORT_SYMBOL(drm_draw_blit16);
> +
> +void drm_draw_blit24(struct iosys_map *dmap, unsigned int dpitch,
> +		     const u8 *sbuf8, unsigned int spitch,
> +		     unsigned int height, unsigned int width,
> +		     unsigned int scale, u32 fg32)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++) {
> +		for (x = 0; x < width; x++) {
> +			u32 off = y * dpitch + x * 3;
> +
> +			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
> +				/* write blue-green-red to output in little endianness */
> +				iosys_map_wr(dmap, off, u8, (fg32 & 0x000000FF) >> 0);
> +				iosys_map_wr(dmap, off + 1, u8, (fg32 & 0x0000FF00) >> 8);
> +				iosys_map_wr(dmap, off + 2, u8, (fg32 & 0x00FF0000) >> 16);
> +			}
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_draw_blit24);
> +
> +void drm_draw_blit32(struct iosys_map *dmap, unsigned int dpitch,
> +		     const u8 *sbuf8, unsigned int spitch,
> +		     unsigned int height, unsigned int width,
> +		     unsigned int scale, u32 fg32)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++)
> +		for (x = 0; x < width; x++)
> +			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
> +				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, fg32);
> +}
> +EXPORT_SYMBOL(drm_draw_blit32);
> +
> +/*
> + * Fill functions
> + */
> +void drm_draw_fill16(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u16 color)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++)
> +		for (x = 0; x < width; x++)
> +			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
> +}
> +EXPORT_SYMBOL(drm_draw_fill16);
> +
> +void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u16 color)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++) {
> +		for (x = 0; x < width; x++) {
> +			unsigned int off = y * dpitch + x * 3;
> +
> +			/* write blue-green-red to output in little endianness */
> +			iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
> +			iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
> +			iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_draw_fill24);
> +
> +void drm_draw_fill32(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u32 color)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++)
> +		for (x = 0; x < width; x++)
> +			iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
> +}
> +EXPORT_SYMBOL(drm_draw_fill32);
> diff --git a/drivers/gpu/drm/drm_draw.h b/drivers/gpu/drm/drm_draw.h
> new file mode 100644
> index 0000000000000..b14752e4c4acf
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_draw.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/*
> + * Copyright (c) 2023 Red Hat.
> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
> + */
> +
> +#ifndef __DRM_DRAW_H__
> +#define __DRM_DRAW_H__
> +
> +#include <linux/font.h>
> +#include <linux/types.h>
> +
> +struct iosys_map;
> +
> +/* check if the pixel at coord x,y is 1 (foreground) or 0 (background) */
> +static inline bool drm_draw_is_pixel_fg(const u8 *sbuf8, unsigned int spitch, int x, int y)
> +{
> +	return (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) != 0;
> +}
> +
> +static inline const u8 *drm_draw_get_char_bitmap(const struct font_desc *font,
> +						 char c, size_t font_pitch)
> +{
> +	return font->data + (c * font->height) * font_pitch;
> +}
> +
> +u32 drm_draw_color_from_xrgb8888(u32 color, u32 format);
> +
> +void drm_draw_blit16(struct iosys_map *dmap, unsigned int dpitch,
> +		     const u8 *sbuf8, unsigned int spitch,
> +		     unsigned int height, unsigned int width,
> +		     unsigned int scale, u16 fg16);
> +
> +void drm_draw_blit24(struct iosys_map *dmap, unsigned int dpitch,
> +		     const u8 *sbuf8, unsigned int spitch,
> +		     unsigned int height, unsigned int width,
> +		     unsigned int scale, u32 fg32);
> +
> +void drm_draw_blit32(struct iosys_map *dmap, unsigned int dpitch,
> +		     const u8 *sbuf8, unsigned int spitch,
> +		     unsigned int height, unsigned int width,
> +		     unsigned int scale, u32 fg32);
> +
> +void drm_draw_fill16(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u16 color);
> +
> +void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u16 color);
> +
> +void drm_draw_fill32(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u32 color);
> +
> +#endif /* __DRM_DRAW_H__ */
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 0a9ecc1380d2a..27fe83cfc854b 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -31,6 +31,7 @@
>   #include <drm/drm_rect.h>
>   
>   #include "drm_crtc_internal.h"
> +#include "drm_draw.h"
>   
>   MODULE_AUTHOR("Jocelyn Falempe");
>   MODULE_DESCRIPTION("DRM panic handler");
> @@ -139,181 +140,8 @@ device_initcall(drm_panic_setup_logo);
>   #endif
>   
>   /*
> - * Color conversion
> + *  Blit & Fill functions
>    */
> -
> -static u16 convert_xrgb8888_to_rgb565(u32 pix)
> -{
> -	return ((pix & 0x00F80000) >> 8) |
> -	       ((pix & 0x0000FC00) >> 5) |
> -	       ((pix & 0x000000F8) >> 3);
> -}
> -
> -static u16 convert_xrgb8888_to_rgba5551(u32 pix)
> -{
> -	return ((pix & 0x00f80000) >> 8) |
> -	       ((pix & 0x0000f800) >> 5) |
> -	       ((pix & 0x000000f8) >> 2) |
> -	       BIT(0); /* set alpha bit */
> -}
> -
> -static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
> -{
> -	return ((pix & 0x00f80000) >> 9) |
> -	       ((pix & 0x0000f800) >> 6) |
> -	       ((pix & 0x000000f8) >> 3);
> -}
> -
> -static u16 convert_xrgb8888_to_argb1555(u32 pix)
> -{
> -	return BIT(15) | /* set alpha bit */
> -	       ((pix & 0x00f80000) >> 9) |
> -	       ((pix & 0x0000f800) >> 6) |
> -	       ((pix & 0x000000f8) >> 3);
> -}
> -
> -static u32 convert_xrgb8888_to_argb8888(u32 pix)
> -{
> -	return pix | GENMASK(31, 24); /* fill alpha bits */
> -}
> -
> -static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
> -{
> -	return ((pix & 0x00ff0000) >> 16) <<  0 |
> -	       ((pix & 0x0000ff00) >>  8) <<  8 |
> -	       ((pix & 0x000000ff) >>  0) << 16 |
> -	       ((pix & 0xff000000) >> 24) << 24;
> -}
> -
> -static u32 convert_xrgb8888_to_abgr8888(u32 pix)
> -{
> -	return ((pix & 0x00ff0000) >> 16) <<  0 |
> -	       ((pix & 0x0000ff00) >>  8) <<  8 |
> -	       ((pix & 0x000000ff) >>  0) << 16 |
> -	       GENMASK(31, 24); /* fill alpha bits */
> -}
> -
> -static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
> -{
> -	pix = ((pix & 0x000000FF) << 2) |
> -	      ((pix & 0x0000FF00) << 4) |
> -	      ((pix & 0x00FF0000) << 6);
> -	return pix | ((pix >> 8) & 0x00300C03);
> -}
> -
> -static u32 convert_xrgb8888_to_argb2101010(u32 pix)
> -{
> -	pix = ((pix & 0x000000FF) << 2) |
> -	      ((pix & 0x0000FF00) << 4) |
> -	      ((pix & 0x00FF0000) << 6);
> -	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> -}
> -
> -static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
> -{
> -	pix = ((pix & 0x00FF0000) >> 14) |
> -	      ((pix & 0x0000FF00) << 4) |
> -	      ((pix & 0x000000FF) << 22);
> -	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> -}
> -
> -/*
> - * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
> - * @color: input color, in xrgb8888 format
> - * @format: output format
> - *
> - * Returns:
> - * Color in the format specified, casted to u32.
> - * Or 0 if the format is not supported.
> - */
> -static u32 convert_from_xrgb8888(u32 color, u32 format)
> -{
> -	switch (format) {
> -	case DRM_FORMAT_RGB565:
> -		return convert_xrgb8888_to_rgb565(color);
> -	case DRM_FORMAT_RGBA5551:
> -		return convert_xrgb8888_to_rgba5551(color);
> -	case DRM_FORMAT_XRGB1555:
> -		return convert_xrgb8888_to_xrgb1555(color);
> -	case DRM_FORMAT_ARGB1555:
> -		return convert_xrgb8888_to_argb1555(color);
> -	case DRM_FORMAT_RGB888:
> -	case DRM_FORMAT_XRGB8888:
> -		return color;
> -	case DRM_FORMAT_ARGB8888:
> -		return convert_xrgb8888_to_argb8888(color);
> -	case DRM_FORMAT_XBGR8888:
> -		return convert_xrgb8888_to_xbgr8888(color);
> -	case DRM_FORMAT_ABGR8888:
> -		return convert_xrgb8888_to_abgr8888(color);
> -	case DRM_FORMAT_XRGB2101010:
> -		return convert_xrgb8888_to_xrgb2101010(color);
> -	case DRM_FORMAT_ARGB2101010:
> -		return convert_xrgb8888_to_argb2101010(color);
> -	case DRM_FORMAT_ABGR2101010:
> -		return convert_xrgb8888_to_abgr2101010(color);
> -	default:
> -		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
> -		return 0;
> -	}
> -}
> -
> -/*
> - * Blit & Fill
> - */
> -/* check if the pixel at coord x,y is 1 (foreground) or 0 (background) */
> -static bool drm_panic_is_pixel_fg(const u8 *sbuf8, unsigned int spitch, int x, int y)
> -{
> -	return (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) != 0;
> -}
> -
> -static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
> -			     const u8 *sbuf8, unsigned int spitch,
> -			     unsigned int height, unsigned int width,
> -			     unsigned int scale, u16 fg16)
> -{
> -	unsigned int y, x;
> -
> -	for (y = 0; y < height; y++)
> -		for (x = 0; x < width; x++)
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
> -				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, fg16);
> -}
> -
> -static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
> -			     const u8 *sbuf8, unsigned int spitch,
> -			     unsigned int height, unsigned int width,
> -			     unsigned int scale, u32 fg32)
> -{
> -	unsigned int y, x;
> -
> -	for (y = 0; y < height; y++) {
> -		for (x = 0; x < width; x++) {
> -			u32 off = y * dpitch + x * 3;
> -
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
> -				/* write blue-green-red to output in little endianness */
> -				iosys_map_wr(dmap, off, u8, (fg32 & 0x000000FF) >> 0);
> -				iosys_map_wr(dmap, off + 1, u8, (fg32 & 0x0000FF00) >> 8);
> -				iosys_map_wr(dmap, off + 2, u8, (fg32 & 0x00FF0000) >> 16);
> -			}
> -		}
> -	}
> -}
> -
> -static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
> -			     const u8 *sbuf8, unsigned int spitch,
> -			     unsigned int height, unsigned int width,
> -			     unsigned int scale, u32 fg32)
> -{
> -	unsigned int y, x;
> -
> -	for (y = 0; y < height; y++)
> -		for (x = 0; x < width; x++)
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
> -				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, fg32);
> -}
> -
>   static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   				 const u8 *sbuf8, unsigned int spitch, unsigned int scale,
>   				 u32 fg_color)
> @@ -322,7 +150,7 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
>   
>   	for (y = 0; y < drm_rect_height(clip); y++)
>   		for (x = 0; x < drm_rect_width(clip); x++)
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
> +			if (drm_draw_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
>   				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
>   }
>   
> @@ -354,15 +182,15 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   
>   	switch (sb->format->cpp[0]) {
>   	case 2:
> -		drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
> +		drm_draw_blit16(&map, sb->pitch[0], sbuf8, spitch,
>   				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
>   	break;
>   	case 3:
> -		drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
> +		drm_draw_blit24(&map, sb->pitch[0], sbuf8, spitch,
>   				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
>   	break;
>   	case 4:
> -		drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
> +		drm_draw_blit32(&map, sb->pitch[0], sbuf8, spitch,
>   				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
>   	break;
>   	default:
> @@ -370,46 +198,6 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   	}
>   }
>   
> -static void drm_panic_fill16(struct iosys_map *dmap, unsigned int dpitch,
> -			     unsigned int height, unsigned int width,
> -			     u16 color)
> -{
> -	unsigned int y, x;
> -
> -	for (y = 0; y < height; y++)
> -		for (x = 0; x < width; x++)
> -			iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
> -}
> -
> -static void drm_panic_fill24(struct iosys_map *dmap, unsigned int dpitch,
> -			     unsigned int height, unsigned int width,
> -			     u32 color)
> -{
> -	unsigned int y, x;
> -
> -	for (y = 0; y < height; y++) {
> -		for (x = 0; x < width; x++) {
> -			unsigned int off = y * dpitch + x * 3;
> -
> -			/* write blue-green-red to output in little endianness */
> -			iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
> -			iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
> -			iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
> -		}
> -	}
> -}
> -
> -static void drm_panic_fill32(struct iosys_map *dmap, unsigned int dpitch,
> -			     unsigned int height, unsigned int width,
> -			     u32 color)
> -{
> -	unsigned int y, x;
> -
> -	for (y = 0; y < height; y++)
> -		for (x = 0; x < width; x++)
> -			iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
> -}
> -
>   static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
>   				 struct drm_rect *clip,
>   				 u32 color)
> @@ -442,15 +230,15 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   
>   	switch (sb->format->cpp[0]) {
>   	case 2:
> -		drm_panic_fill16(&map, sb->pitch[0], drm_rect_height(clip),
> +		drm_draw_fill16(&map, sb->pitch[0], drm_rect_height(clip),
>   				 drm_rect_width(clip), color);
>   	break;
>   	case 3:
> -		drm_panic_fill24(&map, sb->pitch[0], drm_rect_height(clip),
> +		drm_draw_fill24(&map, sb->pitch[0], drm_rect_height(clip),
>   				 drm_rect_width(clip), color);
>   	break;
>   	case 4:
> -		drm_panic_fill32(&map, sb->pitch[0], drm_rect_height(clip),
> +		drm_draw_fill32(&map, sb->pitch[0], drm_rect_height(clip),
>   				 drm_rect_width(clip), color);
>   	break;
>   	default:
> @@ -458,11 +246,6 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   	}
>   }
>   
> -static const u8 *get_char_bitmap(const struct font_desc *font, char c, size_t font_pitch)
> -{
> -	return font->data + (c * font->height) * font_pitch;
> -}
> -
>   static unsigned int get_max_line_len(const struct drm_panic_line *lines, int len)
>   {
>   	int i;
> @@ -501,7 +284,7 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
>   			rec.x1 += (drm_rect_width(clip) - (line_len * font->width)) / 2;
>   
>   		for (j = 0; j < line_len; j++) {
> -			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
> +			src = drm_draw_get_char_bitmap(font, msg[i].txt[j], font_pitch);
>   			rec.x2 = rec.x1 + font->width;
>   			drm_panic_blit(sb, &rec, src, font_pitch, 1, color);
>   			rec.x1 += font->width;
> @@ -533,8 +316,10 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
>   
>   static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   {
> -	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
> -	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
> +	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
> +						    sb->format->format);
> +	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
> +						    sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg;
>   	unsigned int msg_width, msg_height;
> @@ -600,8 +385,10 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
>    */
>   static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
>   {
> -	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
> -	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
> +	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
> +						    sb->format->format);
> +	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
> +						    sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	struct kmsg_dump_iter iter;
> @@ -791,8 +578,10 @@ static int drm_panic_get_qr_code(u8 **qr_image)
>    */
>   static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
>   {
> -	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
> -	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
> +	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
> +						    sb->format->format);
> +	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
> +						    sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
>   	unsigned int max_qr_size, scale;
> @@ -878,7 +667,7 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   {
>   	if (format->num_planes != 1)
>   		return false;
> -	return convert_from_xrgb8888(0xffffff, format->format) != 0;
> +	return drm_draw_color_from_xrgb8888(0xffffff, format->format) != 0;
>   }
>   
>   static void draw_panic_dispatch(struct drm_scanout_buffer *sb)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

