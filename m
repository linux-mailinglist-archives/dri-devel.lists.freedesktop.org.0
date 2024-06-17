Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37A90ACF6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4A10E367;
	Mon, 17 Jun 2024 11:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vup28Lq0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7nSk4AmQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vup28Lq0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7nSk4AmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8CB10E363
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:30:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AD777380DF;
 Mon, 17 Jun 2024 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718623834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=35T6Lbygzo99p8cpzRF+8zLNEX9o24w4/w6FrwnW0rU=;
 b=Vup28Lq0UCHNSy31GUUc6uJ47xwBN6174UVcikNf8C56E/RchibynN3XX8A4ENSa6goX/2
 DeSrkHv4YuLOCJbTflSvNVi6PKpuJjaOkizHB2/GpCuUjL8PjpthLLmh0sstN2SA+Gi1cu
 AU0UbrTGidmIW5cziN5tQhom+PlclDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718623834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=35T6Lbygzo99p8cpzRF+8zLNEX9o24w4/w6FrwnW0rU=;
 b=7nSk4AmQCnXSxWJoqq9jHFNdTT5Dxn4yPxTfr3Nn/hPwITEQB2NlNMJUS7cIsZzQn8P+rc
 c+tWW+gdbWmxmXAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718623834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=35T6Lbygzo99p8cpzRF+8zLNEX9o24w4/w6FrwnW0rU=;
 b=Vup28Lq0UCHNSy31GUUc6uJ47xwBN6174UVcikNf8C56E/RchibynN3XX8A4ENSa6goX/2
 DeSrkHv4YuLOCJbTflSvNVi6PKpuJjaOkizHB2/GpCuUjL8PjpthLLmh0sstN2SA+Gi1cu
 AU0UbrTGidmIW5cziN5tQhom+PlclDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718623834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=35T6Lbygzo99p8cpzRF+8zLNEX9o24w4/w6FrwnW0rU=;
 b=7nSk4AmQCnXSxWJoqq9jHFNdTT5Dxn4yPxTfr3Nn/hPwITEQB2NlNMJUS7cIsZzQn8P+rc
 c+tWW+gdbWmxmXAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C42313AAA;
 Mon, 17 Jun 2024 11:30:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zp4ZHVoecGZMHQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jun 2024 11:30:34 +0000
Message-ID: <f42169dc-ebcd-4df9-8119-3dbac28746de@suse.de>
Date: Mon, 17 Jun 2024 13:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: vesafb: Detect VGA compatibility from screen
 info's VESA attributes
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240617110725.23330-1-tzimmermann@suse.de>
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
In-Reply-To: <20240617110725.23330-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmx.de,ravnborg.org,redhat.com,zytor.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_NONE(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
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



Am 17.06.24 um 13:06 schrieb Thomas Zimmermann:
> Test the vesa_attributes field in struct screen_info for compatibility
> with VGA hardware. Vesafb currently tests bit 1 in screen_info's
> capabilities field, It sets the framebuffer address size and is
> unrelated to VGA.
>
> Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
> the mode's attributes field signals VGA compatibility. The mode is
> compatible with VGA hardware if the bit is clear. In that case, the
> driver can access VGA state of the VBE's underlying hardware. The
> vesafb driver uses this feature to program the color LUT in palette
> modes. Without, colors might be incorrect.
>
> The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
> incorrect logo colors in x86_64"). It incorrectly stores the mode
> attributes in the screen_info's capabilities field and updates vesafb
> accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support for
> the new x86 setup code") fixed the screen_info, but did not update vesafb.
> Color output still tends to work, because bit 1 in capabilities is
> usually 0.
>
> Besides fixing the bug in vesafb, this commit introduces a helper that
> reads the correct bit from screen_info.
>
> v2:
> - clarify comment on non-VGA modes (Helge)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup code")
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: <stable@vger.kernel.org> # v2.6.23+
> ---
>   drivers/video/fbdev/vesafb.c |  2 +-
>   include/linux/screen_info.h  | 10 ++++++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index 8ab64ae4cad3e..5a161750a3aee 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device *dev)
>   	if (si->orig_video_isVGA != VIDEO_TYPE_VLFB)
>   		return -ENODEV;
>   
> -	vga_compat = (si->capabilities & 2) ? 0 : 1;
> +	vga_compat = !__screen_info_vbe_mode_nonvga(si);
>   	vesafb_fix.smem_start = si->lfb_base;
>   	vesafb_defined.bits_per_pixel = si->lfb_depth;
>   	if (15 == vesafb_defined.bits_per_pixel)
> diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
> index 75303c126285a..d21f8e4e9f4a4 100644
> --- a/include/linux/screen_info.h
> +++ b/include/linux/screen_info.h
> @@ -49,6 +49,16 @@ static inline u64 __screen_info_lfb_size(const struct screen_info *si, unsigned
>   	return lfb_size;
>   }
>   
> +static inline bool __screen_info_vbe_mode_nonvga(const struct screen_info *si)
> +{
> +	/*
> +	 * VESA modes typically run on VGA hardware. Set bit 5 signal that this

'signals'

> +	 * is not the case. Drivers can then not make use of VGA resources. See
> +	 * Sec 4.4 of the VBE 2.0 spec.
> +	 */
> +	return si->vesa_attributes & BIT(5);
> +}
> +
>   static inline unsigned int __screen_info_video_type(unsigned int type)
>   {
>   	switch (type) {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

