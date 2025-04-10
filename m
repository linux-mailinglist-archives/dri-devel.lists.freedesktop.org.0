Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CFA83A92
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D097B10E790;
	Thu, 10 Apr 2025 07:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zAesnMe/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTT9CyR2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G0D60ttC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rn4to1af";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C510310E790
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:16:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6648E1F385;
 Thu, 10 Apr 2025 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744269401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ry6hvSUeSNi6nna2kXuGgO6wVOEKFUoNiIQx2xE48z8=;
 b=zAesnMe/GnnBPNlS4hwrWtwsh1oO5frG3jDcT+hOCKE6TXLWnhR/+XqXf5fvVuC87ixgZs
 5402w8ek88FX0+inzJ+00Rk0z/Tt0CvvATfGBGXD3A+uMA/cmy7l5aEYSPLuSE88SFiFOM
 7Rf+FE+pYSt50sqcfpGpq48NLhJmdxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744269401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ry6hvSUeSNi6nna2kXuGgO6wVOEKFUoNiIQx2xE48z8=;
 b=hTT9CyR2yuuETmZlZOlFotpXGnkdm6T0N3W5BL2TrVFFmmZFwTl9RQV/vpW0BdHjOdg5w2
 T8gFTghCseEF+KBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744269400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ry6hvSUeSNi6nna2kXuGgO6wVOEKFUoNiIQx2xE48z8=;
 b=G0D60ttCwOobF2K+UJlRauNoRXLH2TMd9dKcr3dqCgk9u/GumRw6y8tKGb7uJGOpdW3NIj
 Db3VYcBd9Tm/Hqv/MOfizyWxihpU2a/LCuUdEC2pEFERWVNl5neAQ4YHSxlyQVADO6pydM
 HdybA5xPww9WRvT6DvX7or0U4scuEwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744269400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ry6hvSUeSNi6nna2kXuGgO6wVOEKFUoNiIQx2xE48z8=;
 b=rn4to1afrCreBkGYli9/M9NP71JqcvpIhtDbvc0Vdcl/pmtuz4mOkLY2ydEDZ31d8GARZB
 qENU9F1FY0EGpAAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32FBC13886;
 Thu, 10 Apr 2025 07:16:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BH8XC1hw92ejdgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 07:16:40 +0000
Message-ID: <38b8ad74-584c-4d43-b062-4b52ab98bf8d@suse.de>
Date: Thu, 10 Apr 2025 09:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sysfb: efidrm: Avoid clang -Wsometimes-uninitialized
 in efidrm_device_create()
To: Nathan Chancellor <nathan@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250409-efidrm-avoid-uninit-screen_info-warning-v1-1-67babb19d831@kernel.org>
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
In-Reply-To: <20250409-efidrm-avoid-uninit-screen_info-warning-v1-1-67babb19d831@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
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

thanks for the fix.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

with a remark below.

Am 09.04.25 um 21:03 schrieb Nathan Chancellor:
> Clang warns (or errors with CONFIG_WERROR=y):
>
>    drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      353 |         else if (mem_flags & EFI_MEMORY_WB)
>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/sysfb/efidrm.c:356:7: note: uninitialized use occurs here
>      356 |         if (!screen_base)
>          |              ^~~~~~~~~~~
>    drivers/gpu/drm/sysfb/efidrm.c:353:7: note: remove the 'if' if its condition is always true
>      353 |         else if (mem_flags & EFI_MEMORY_WB)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      354 |                 screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
>    drivers/gpu/drm/sysfb/efidrm.c:261:27: note: initialize the variable 'screen_base' to silence this warning
>      261 |         void __iomem *screen_base;
>          |                                  ^
>          |                                   = NULL
>
> efidrm_get_mem_flags() can only return a mask that has at least one of
> the tested values set so the else case is impossible but clang's static
> analysis runs before inlining so it cannot know that.

Right, the variable mem_flags should always be set and thus screen_info 
should be mapped. I never got this error with gcc.

>
> Initialize screen_base to NULL and add a defensive print in case
> mem_flags were ever returned without one of the four valid values.
>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/sysfb/efidrm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
> index af90064a4c04..7d820f42956b 100644
> --- a/drivers/gpu/drm/sysfb/efidrm.c
> +++ b/drivers/gpu/drm/sysfb/efidrm.c
> @@ -258,7 +258,7 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>   	struct drm_sysfb_device *sysfb;
>   	struct drm_device *dev;
>   	struct resource *mem = NULL;
> -	void __iomem *screen_base;
> +	void __iomem *screen_base = NULL;
>   	struct drm_plane *primary_plane;
>   	struct drm_crtc *crtc;
>   	struct drm_encoder *encoder;
> @@ -353,6 +353,8 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>   	else if (mem_flags & EFI_MEMORY_WB)
>   		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
>   					    MEMREMAP_WB);
> +	else
> +		drm_warn(dev, "unhandled mem_flags: 0x%llx\n", mem_flags);


This message should be  something like drm_err("invalid mem_flags ..."). 
It's really a driver bug.

Would you send an update?

Best regards
Thomas

>   	if (!screen_base)
>   		return ERR_PTR(-ENOMEM);
>   	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
>
> ---
> base-commit: e8bf4a1bdaeadb28d13b9a2bcfd5910fda06eede
> change-id: 20250409-efidrm-avoid-uninit-screen_info-warning-d62ef67ce3c5
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

