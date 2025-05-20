Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A344CABD8C3
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 15:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CA110E4AB;
	Tue, 20 May 2025 13:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ic323Jp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uvwfVruy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ic323Jp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uvwfVruy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E45C10E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 13:04:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F8DD206EB;
 Tue, 20 May 2025 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747746277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aoa4owdDkMNuo4sf7rn6DI1L1+1vIZIYWS2/SXMMrrU=;
 b=Ic323Jp9mhAVGO24Fpr0vCQAW1CK0CWnveqcipDPNKwMUlmLdrkFQ480fHtT927xmBB4EG
 64Xoqh5yp9MdecK5bG1flV1a2DnWtssO34UnF+xbvtrR38Wl3WXDHt1kfPT3W1AjBjviJa
 JZmBgRSGPD7n0MPsco5tZRDxbbksyh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747746277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aoa4owdDkMNuo4sf7rn6DI1L1+1vIZIYWS2/SXMMrrU=;
 b=uvwfVruyBiInWdtkhXSgZ8q41G8W9uFWlH+CxYO7Wl02owCIvFYlaOnc0zGmoERKKAZTfq
 p8Tc0VmGJ+C3kYCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747746277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aoa4owdDkMNuo4sf7rn6DI1L1+1vIZIYWS2/SXMMrrU=;
 b=Ic323Jp9mhAVGO24Fpr0vCQAW1CK0CWnveqcipDPNKwMUlmLdrkFQ480fHtT927xmBB4EG
 64Xoqh5yp9MdecK5bG1flV1a2DnWtssO34UnF+xbvtrR38Wl3WXDHt1kfPT3W1AjBjviJa
 JZmBgRSGPD7n0MPsco5tZRDxbbksyh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747746277;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aoa4owdDkMNuo4sf7rn6DI1L1+1vIZIYWS2/SXMMrrU=;
 b=uvwfVruyBiInWdtkhXSgZ8q41G8W9uFWlH+CxYO7Wl02owCIvFYlaOnc0zGmoERKKAZTfq
 p8Tc0VmGJ+C3kYCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB38D13888;
 Tue, 20 May 2025 13:04:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UPErNOR9LGiIEAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 13:04:36 +0000
Message-ID: <07088966-73f4-4b5d-898d-b596dede53e4@suse.de>
Date: Tue, 20 May 2025 15:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sitronix: Fix broken backwards-compatibility layer
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
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
In-Reply-To: <1682cd80989f9ab98a7a9910a086a3a4d9769cc6.1747744752.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spamd-Result: default: False [0.20 / 50.00]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[renesas];
 FREEMAIL_TO(0.00)[glider.be,gmail.com,redhat.com,linux.intel.com,kernel.org,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
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

Am 20.05.25 um 14:40 schrieb Geert Uytterhoeven:
> When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
> the old symbols were kept, aiming to provide a seamless migration path
> when running "make olddefconfig" or "make oldconfig".
>
> However, the old compatibility symbols are not visible.  Hence unless
> they are selected by another symbol (which they are not), they can never
> be enabled, and no backwards compatibility is provided.
>
> Fix this by making them visible, and inverting the selection logic.
> Add comments to make it clear why there are two symbols with the same
> description.

These symbols were only meant for variants of 'make oldconfig' to pick 
up th enew symbols. They where never for being selected manually.

Best regards
Thomas

>
> Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> arch/arm/configs/davinci_all_defconfig must be updated after this has
> hit upstream.
> ---
>   drivers/gpu/drm/sitronix/Kconfig | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
> index c069d0d417753bcf..8b3565b8eca3918e 100644
> --- a/drivers/gpu/drm/sitronix/Kconfig
> +++ b/drivers/gpu/drm/sitronix/Kconfig
> @@ -10,9 +10,11 @@ config DRM_ST7571_I2C
>   
>   	  if M is selected the module will be called st7571-i2c.
>   
> +# To be removed once all users have updated their (def)configs
>   config TINYDRM_ST7586
> -	tristate
> -	default n
> +	tristate "DRM support for Sitronix ST7586 display panels"
> +	depends on DRM && SPI
> +	select DRM_ST7586
>   
>   config DRM_ST7586
>   	tristate "DRM support for Sitronix ST7586 display panels"
> @@ -21,16 +23,17 @@ config DRM_ST7586
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_DMA_HELPER
>   	select DRM_MIPI_DBI
> -	default TINYDRM_ST7586
>   	help
>   	  DRM driver for the following Sitronix ST7586 panels:
>   	  * LEGO MINDSTORMS EV3
>   
>   	  If M is selected the module will be called st7586.
>   
> +# To be removed once all users have updated their (def)configs
>   config TINYDRM_ST7735R
> -	tristate
> -	default n
> +	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
> +	depends on DRM && SPI
> +	select DRM_ST7735R
>   
>   config DRM_ST7735R
>   	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
> @@ -40,7 +43,6 @@ config DRM_ST7735R
>   	select DRM_GEM_DMA_HELPER
>   	select DRM_MIPI_DBI
>   	select BACKLIGHT_CLASS_DEVICE
> -	default TINYDRM_ST7735R
>   	help
>   	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
>   	  LCDs:

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

