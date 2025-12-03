Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E243C9EA0B
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8CE10E1B0;
	Wed,  3 Dec 2025 10:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0rMf2n/Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bSDdy5dt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0rMf2n/Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bSDdy5dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8110E1B0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:03:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 657645BD20;
 Wed,  3 Dec 2025 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764756223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7B9yIeE3LWg0pQalhgfx0LDrUUY9Bz8pLEiRGPHzoEM=;
 b=0rMf2n/QGXPZvLnU9FOdBj3K+dOEcuhkel/pnPQFodCNgvnKgcae1ROyukPJeEJZ+cITaU
 s4lUI1htgdZa5CH8DUm4/wriGkyn0AkA0OdoWb2MetQq02HtI8do1/TDxpEDCKijTP2izw
 IGDAeT1LofWvIAwAoNQEJmuv950JSVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764756223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7B9yIeE3LWg0pQalhgfx0LDrUUY9Bz8pLEiRGPHzoEM=;
 b=bSDdy5dtcsF5Lem3fT4oxAUBOvNp1jkwje2+ejujD/UBiGUuDTCjoAwNSk9ekNDGo+De/s
 Pdm/ODSsEzoBxKBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764756223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7B9yIeE3LWg0pQalhgfx0LDrUUY9Bz8pLEiRGPHzoEM=;
 b=0rMf2n/QGXPZvLnU9FOdBj3K+dOEcuhkel/pnPQFodCNgvnKgcae1ROyukPJeEJZ+cITaU
 s4lUI1htgdZa5CH8DUm4/wriGkyn0AkA0OdoWb2MetQq02HtI8do1/TDxpEDCKijTP2izw
 IGDAeT1LofWvIAwAoNQEJmuv950JSVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764756223;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7B9yIeE3LWg0pQalhgfx0LDrUUY9Bz8pLEiRGPHzoEM=;
 b=bSDdy5dtcsF5Lem3fT4oxAUBOvNp1jkwje2+ejujD/UBiGUuDTCjoAwNSk9ekNDGo+De/s
 Pdm/ODSsEzoBxKBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36E7B3EA63;
 Wed,  3 Dec 2025 10:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lXE0DP8KMGlKLwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Dec 2025 10:03:43 +0000
Message-ID: <8d4fb419-04c0-4930-a74b-3aa0c026ce0b@suse.de>
Date: Wed, 3 Dec 2025 11:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] efi: sysfb_efi: Convert swap width and height
 quirk to a callback
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
 <20251203090706.53778-4-tvrtko.ursulin@igalia.com>
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
In-Reply-To: <20251203090706.53778-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.949]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:url,
 igalia.com:email, suse.de:mid, suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.29
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



Am 03.12.25 um 10:07 schrieb Tvrtko Ursulin:
> Convert the swapping of width and height quirk to a callback.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: linux-efi@vger.kernel.org

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/firmware/efi/sysfb_efi.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 14b61414c33a..eacf9a50eab2 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -231,6 +231,16 @@ static const struct dmi_system_id efifb_dmi_system_table[] __initconst = {
>   	{},
>   };
>   
> +static int __init efifb_swap_width_height(const struct dmi_system_id *id)
> +{
> +	swap(screen_info.lfb_width, screen_info.lfb_height);
> +	screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
> +				     screen_info.lfb_width /
> +				     BITS_PER_BYTE;
> +
> +	return 1;
> +}
> +
>   /*
>    * Some devices have a portrait LCD but advertise a landscape resolution (and
>    * pitch). We simply swap width and height for these devices so that we can
> @@ -248,6 +258,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>   			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10ICR"),
>   			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "1HCN44WW"),
>   		},
> +		.callback = efifb_swap_width_height,
>   	},
>   	{
>   		/* Lenovo MIIX 320-10ICR with 800x1280 portrait screen */
> @@ -256,6 +267,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>   			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
>   					"Lenovo MIIX 320-10ICR"),
>   		},
> +		.callback = efifb_swap_width_height,
>   	},
>   	{
>   		/* Lenovo D330 with 800x1280 or 1200x1920 portrait screen */
> @@ -264,6 +276,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>   			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
>   					"Lenovo ideapad D330-10IGM"),
>   		},
> +		.callback = efifb_swap_width_height,
>   	},
>   	{
>   		/* Lenovo IdeaPad Duet 3 10IGL5 with 1200x1920 portrait screen */
> @@ -272,6 +285,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>   			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
>   					"IdeaPad Duet 3 10IGL5"),
>   		},
> +		.callback = efifb_swap_width_height,
>   	},
>   	{
>   		/* Lenovo Yoga Book X91F / X91L */
> @@ -280,6 +294,7 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>   			/* Non exact match to match F + L versions */
>   			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
>   		},
> +		.callback = efifb_swap_width_height,
>   	},
>   	{},
>   };
> @@ -355,13 +370,8 @@ __init void sysfb_apply_efi_quirks(void)
>   	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
>   		dmi_check_system(efifb_dmi_system_table);
>   
> -	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
> -	    dmi_check_system(efifb_dmi_swap_width_height)) {
> -		swap(screen_info.lfb_width, screen_info.lfb_height);
> -		screen_info.lfb_linelength = (unsigned int)screen_info.lfb_depth *
> -					     screen_info.lfb_width /
> -					     BITS_PER_BYTE;
> -	}
> +	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI)
> +		dmi_check_system(efifb_dmi_swap_width_height);
>   }
>   
>   __init void sysfb_set_efifb_fwnode(struct platform_device *pd)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


