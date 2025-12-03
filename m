Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C68C9E855
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCF10E353;
	Wed,  3 Dec 2025 09:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qxUMjrBq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ohYIIWIY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E9ajiiW+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VXSzlt2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ECF10E353
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 09:40:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1010336E1;
 Wed,  3 Dec 2025 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764754820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c2lIbW3OlFpKpdZDEEZyEiKg6nl4sXqMSaZihuMvgVU=;
 b=qxUMjrBqXIqNhyg4ovkPjWJn1TWiF/9WmCU2munDqD/rH0PpIlZvKgZ5pFAlvFFLdBNdNz
 rHb1yH49ftry/HBL2jzIa8qCCqCyHGULOeaIwwiH9eeqp+FxOPg/wVVshjyBefHrmxKevI
 nz5EXRC+efbydhljf10ilqz1f2rUHgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764754820;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c2lIbW3OlFpKpdZDEEZyEiKg6nl4sXqMSaZihuMvgVU=;
 b=ohYIIWIYtiwHpyRwUTfISgATz+Hadw8Ojzb5dKdSI26ASxtvs+R2YzqSV0ohUc0wXhKgSY
 7DbF/K1qHYaqe0Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764754818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c2lIbW3OlFpKpdZDEEZyEiKg6nl4sXqMSaZihuMvgVU=;
 b=E9ajiiW+laqPNneg16JX6nvifw64dmVQoSiqHIUqnUNIxcs5tG4L7eOAeacX+vaJQr0KH9
 459B3CNTMMoOlbcsRXfLgtmmJdVrul2SschNurviaPUaC/SpOgkZKQqL+cZulCw0S0f1s2
 CWtuPQFVFFTw8AQ6EzJF6Dakxc3X8es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764754818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c2lIbW3OlFpKpdZDEEZyEiKg6nl4sXqMSaZihuMvgVU=;
 b=VXSzlt2sLJKLpMbc9k2Mkkiv/ryM+ZvF+IgtzhENa+82tKA4Ybvh7scOFLQg6+zl8jez7h
 nCX0Et1EYOTBQIBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65FD73EA63;
 Wed,  3 Dec 2025 09:40:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yYQ2F4IFMGnzGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Dec 2025 09:40:18 +0000
Message-ID: <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
Date: Wed, 3 Dec 2025 10:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20251202.170626.2134482663677806825.rene@exactco.de>
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
In-Reply-To: <20251202.170626.2134482663677806825.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.27 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.17)[-0.830]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, imap1.dmz-prg2.suse.org:helo,
 exactco.de:email, gitlab.freedesktop.org:url, suse.com:url]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.27
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

Hi,

thanks for the patch.

Am 02.12.25 um 17:06 schrieb René Rebe:
> The Aspeed ast drm driver has the frame-buffer RGBX swapped on

It is XRGB.

> big-endian RISC systems. Fix by enabling byte swapping for any
> __BIG_ENDIAN config.

Is this the RISC support that Linux famously shot down? :)

Anyway, I have another BE fix for PPC64, which I didn't take. I'd rather 
merge your fix with some changes.

[1] 
https://lore.kernel.org/dri-devel/407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com/

>
> Fixes: 12fec1405dd5 ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")

I'd leave out the Fixes tag.  We never claimed that the drivers supports 
BE, so it's not really a fix.

> Signed-off-by: René Rebe <rene@exactco.de>
> ---
> Tested on Oracle T4-1 running sparc64 T2/Linux.
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 14 ++++++++++++++
>   drivers/gpu/drm/ast/ast_reg.h  |  6 ++++++
>   2 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 30b011ed0a05..155ae35470d9 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -708,6 +708,20 @@ static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
>   	ast_set_dclk_reg(ast, adjusted_mode, vmode);
>   	ast_set_crtthd_reg(ast);
>   	ast_set_sync_reg(ast, adjusted_mode, vmode);
> +
> +#ifdef __BIG_ENDIAN
> +	/* Big-endian byte-swapping */
> +	switch (ast_crtc_state->format->format) {

This function sets the display mode. But the color format can change per 
frame. So it's not the right place.

Then, we also have a cursor plane that always scans out in ARGB4444 
format. How does this change interact with the cursor? AFAIU it should 
mix up the pixels if set to 32-bit BE.

Therefore, I think we need to set the BE mode in each plane's atomic 
update before it updates the video memory. At [2], for the primary 
plane, it has to be located between the color-update code and the damage 
handling. At [3], for the cursor plane, it can be within the if-damage 
branch. The cursor update needs unconditional 16-but swapping.

[2] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-12-01-1/drivers/gpu/drm/ast/ast_mode.c?ref_type=tags#L559
[3] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-12-01-1/drivers/gpu/drm/ast/ast_cursor.c?ref_type=tags#L209

> +	case DRM_FORMAT_RGB565:
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f, 0x40);
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f, 0x80);

Where did you get these bits from? According to the docs I have, 0x80 
enables BE swapping in general and 0x40 selects 16-bit vs 32-bit swaps. 
So the 16-bit case would rather be 0xc0. But I might be wrong, as the 
docs are vague.

Did you test 16-bit output?

> +		break;
> +	default:
> +		break;
> +	}
> +#endif
>   }
>   
>   static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 30578e3b07e4..5c8c0fd2e229 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -75,4 +75,10 @@
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
>   
> +/*
> + * PCI Control
> + */
> +

No separate block please. Just put the define between  VGACRA1 and 
VGACRA3 above.

Please also add constants for setting the bits:

#define AST_IO_VGACRA2_BE_MODE        BIT(7)
#define AST_IO_VGACRA2_BE_MODE_16    BIT(6)

Best regards
Thomas

> +#define AST_IO_VGACRA2			(0xA2) /* PCI control & big-endian */
> +
>   #endif

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


