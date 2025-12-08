Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F6CACC58
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F62610E407;
	Mon,  8 Dec 2025 09:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bGrxRVzC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S+cJpsAO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mXhqTeVI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dsci+OsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441DE10E407
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:58:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3002336DE;
 Mon,  8 Dec 2025 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765187881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tiyqyyRIufoiicXo4/TLfw0nlqeugsiEaNQU5FdAtAs=;
 b=bGrxRVzCtOXvBsvqfCF1VpEB0APwnii70t8jw7D3PsBNVvZ0mShXa3FRsArNhFeFI3CRBp
 073y+xcLwMsEz4/L4eNDHEfdsSlbV4I8SOYfRCmwUrZKqdsWw3Jmj5Tz1XALdxwupnwCq3
 K8rcoBfpfPbJAHpO+jzV+IuvWDBifrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765187881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tiyqyyRIufoiicXo4/TLfw0nlqeugsiEaNQU5FdAtAs=;
 b=S+cJpsAONOwJJoLzLK5PdWdAWDjLfxzvXQ+5entzQcc0ypDyISSEVPMe/kQz6l0qDvp3pj
 HUEcDfbhu+lsVgAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765187879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tiyqyyRIufoiicXo4/TLfw0nlqeugsiEaNQU5FdAtAs=;
 b=mXhqTeVIwM/hOzjwoFhStzL2RtuNEvS1xAYRW41lDWSwl00wPwFOCfKZ2JQiTqFzX+SSmU
 efHiFCCalBZnKg3tjVuGapTOGbKBCu2DD49FaYOaSVfwwUAVX+9JCSuPx/5wafTSX3bvaM
 Vf8j1N68uKH0tdx3b3g50oHqA1Qrd6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765187879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tiyqyyRIufoiicXo4/TLfw0nlqeugsiEaNQU5FdAtAs=;
 b=Dsci+OsWwlH4V3amJMQN1FwGB2jA31qdJV7Z1xah2igm2yx5dVZnRDHdefZNOHxImnTBlK
 FUjt8mB5mWommkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A52F53EA63;
 Mon,  8 Dec 2025 09:57:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fJYnJiehNmlBOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 09:57:59 +0000
Message-ID: <bccdbb15-6b91-4dc1-a9fd-7184da1c9f2d@suse.de>
Date: Mon, 8 Dec 2025 10:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on
 Valve Steam Deck
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Ard Biesheuvel <ardb@kernel.org>,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
References: <20251205153611.93297-1-tvrtko.ursulin@igalia.com>
 <20251205153611.93297-5-tvrtko.ursulin@igalia.com>
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
In-Reply-To: <20251205153611.93297-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.953]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,igalia.com:email,suse.com:url,imap1.dmz-prg2.suse.org:helo];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, imap1.dmz-prg2.suse.org:helo,
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

Hi

Am 05.12.25 um 16:36 schrieb Tvrtko Ursulin:
> Valve Steam Deck has a 800x1280 portrait screen installed in a landscape
> orientation. The firmware offers a software rotated 1280x800 mode which

"software-rotated"

comma before 'which'

> GRUB can be made to switch to when displaying a boot menu. If this mode
> was selected frame buffer drivers will see this fake mode and fbcon
> rendering will be corrupted.
>
> Lets therefore add a selective quirk inside the current "swap with and

"Let us" or "Let's"

> height" handling, which will detect this exact mode and fix it up back to
> the native one.
>
> This will allow the DRM based frame buffer drivers to detect the correct

"DRM-based framebuffer"

> mode and, apply the existing panel orientation quirk, and render the

No 'and' after mode

> console in landscape mode with no corruption.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: linux-efi@vger.kernel.org
> Tested-by: Melissa Wen <mwen@igalia.com> # v3

With typos fixed:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for fixing this.

Best regards
Thomas

> ---
>   drivers/firmware/efi/sysfb_efi.c | 47 ++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
> index 5c54f42d5fef..db28e11d1eb7 100644
> --- a/drivers/firmware/efi/sysfb_efi.c
> +++ b/drivers/firmware/efi/sysfb_efi.c
> @@ -242,6 +242,33 @@ static int __init efifb_swap_width_height(const struct dmi_system_id *id)
>   	return 1;
>   }
>   
> +struct efifb_mode_fixup {
> +	unsigned int width;
> +	unsigned int height;
> +	unsigned int linelength;
> +};
> +
> +static int __init
> +efifb_check_and_swap_width_height(const struct dmi_system_id *id)
> +{
> +	const struct efifb_mode_fixup *data = id->driver_data;
> +
> +	if (data->width == screen_info.lfb_width &&
> +	    data->height == screen_info.lfb_height) {
> +		swap(screen_info.lfb_width, screen_info.lfb_height);
> +		screen_info.lfb_linelength = data->linelength;
> +		screen_info.lfb_size = data->linelength * data->width;
> +	}
> +
> +	return 1;
> +}
> +
> +static const struct efifb_mode_fixup efifb_steamdeck_mode_fixup __initconst = {
> +	.width = 1280,
> +	.height = 800,
> +	.linelength = 3328,
> +};
> +
>   /*
>    * Some devices have a portrait LCD but advertise a landscape resolution (and
>    * pitch). We simply swap width and height for these devices so that we can
> @@ -297,6 +324,26 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
>   		},
>   		.callback = efifb_swap_width_height,
>   	},
> +	{
> +		/* Valve Steam Deck (Jupiter) */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.callback = efifb_check_and_swap_width_height,
> +		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
> +	},
> +	{
> +		/* Valve Steam Deck (Galileo) */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> +		},
> +		.callback = efifb_check_and_swap_width_height,
> +		.driver_data = (void *)&efifb_steamdeck_mode_fixup,
> +	},
>   	{},
>   };
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


