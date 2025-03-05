Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64212A5012D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14010E29B;
	Wed,  5 Mar 2025 13:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xu/9qv6R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Tk9Rin5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xu/9qv6R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Tk9Rin5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285A210E29B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:57:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6368211A0;
 Wed,  5 Mar 2025 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741183024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTnDHL5YJ0HDpBxPL0hM7J8YAxYeprvi3CyWYIY1kSY=;
 b=xu/9qv6RPFZV3YWTznTzJlA84tCKVEcQDPaa9+ZVXD9pwf/6Rq2ahSvOUcMgARNOqGTOKS
 jBzAX2Q06cNV4090jaL1dLuCLcYpKU3mxIljOa0NI3zDs2AnHIoIUtCw66D3UIL2yBYDTA
 KxnKn2YvrjKn4JPCuJbtCAzLQTebHNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741183024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTnDHL5YJ0HDpBxPL0hM7J8YAxYeprvi3CyWYIY1kSY=;
 b=4Tk9Rin5clgy6+6sidc+5BmDI6c9f3MgVuMNeAktdsjRgogxmqn/1wGEhwFpXQLoZVzMgn
 rAUVyPr6YtYGgdCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741183024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTnDHL5YJ0HDpBxPL0hM7J8YAxYeprvi3CyWYIY1kSY=;
 b=xu/9qv6RPFZV3YWTznTzJlA84tCKVEcQDPaa9+ZVXD9pwf/6Rq2ahSvOUcMgARNOqGTOKS
 jBzAX2Q06cNV4090jaL1dLuCLcYpKU3mxIljOa0NI3zDs2AnHIoIUtCw66D3UIL2yBYDTA
 KxnKn2YvrjKn4JPCuJbtCAzLQTebHNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741183024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTnDHL5YJ0HDpBxPL0hM7J8YAxYeprvi3CyWYIY1kSY=;
 b=4Tk9Rin5clgy6+6sidc+5BmDI6c9f3MgVuMNeAktdsjRgogxmqn/1wGEhwFpXQLoZVzMgn
 rAUVyPr6YtYGgdCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7D021366F;
 Wed,  5 Mar 2025 13:57:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aKKiJzBYyGciRwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:57:04 +0000
Message-ID: <7706a441-1664-4fe3-8b45-2f8f266ceeb4@suse.de>
Date: Wed, 5 Mar 2025 14:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/ast: Remove vram_fb_available from struct
 ast_device
To: jfalempe@redhat.com, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305134401.60609-1-tzimmermann@suse.de>
 <20250305134401.60609-7-tzimmermann@suse.de>
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
In-Reply-To: <20250305134401.60609-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
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



Am 05.03.25 um 14:35 schrieb Thomas Zimmermann:
> Helpers compute the offset and size of the available framebuffer
> memory. Remove the obsolete field vram_fb_available from struct
> ast_device. Also define the cursor-signature size next to its only
> user.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_cursor.c | 15 ++-------------
>   drivers/gpu/drm/ast/ast_drv.h    |  4 ----
>   drivers/gpu/drm/ast/ast_mm.c     |  1 -
>   3 files changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 05e297f30b4e..f48207a45359 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -37,6 +37,7 @@
>    */
>   
>   /* define for signature structure */
> +#define AST_HWC_SIGNATURE_SIZE		SZ_32
>   #define AST_HWC_SIGNATURE_CHECKSUM	0x00
>   #define AST_HWC_SIGNATURE_SizeX		0x04
>   #define AST_HWC_SIGNATURE_SizeY		0x08
> @@ -294,20 +295,10 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	long offset;
>   	int ret;
>   
> -	/*
> -	 * Allocate backing storage for cursors. The BOs are permanently
> -	 * pinned to the top end of the VRAM.
> -	 */
> -
> -	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);

There's a bug here, as size if now uninitialized. will be fixed in the 
next iteration.

> -
> -	if (ast->vram_fb_available < size)
> -		return -ENOMEM;
> -
> -	vaddr = ast->vram + ast->vram_fb_available - size;
>   	offset = ast_cursor_vram_offset(ast);
>   	if (offset < 0)
>   		return offset;
> +	vaddr = ast->vram + offset;
>   
>   	ret = ast_plane_init(dev, ast_plane, vaddr, offset, size,
>   			     0x01, &ast_cursor_plane_funcs,
> @@ -320,7 +311,5 @@ int ast_cursor_plane_init(struct ast_device *ast)
>   	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
>   	drm_plane_enable_fb_damage_clips(cursor_plane);
>   
> -	ast->vram_fb_available -= size;
> -
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ec9ec77260e9..d9da2328d46b 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -112,12 +112,9 @@ enum ast_config_mode {
>   
>   #define AST_MAX_HWC_WIDTH	64
>   #define AST_MAX_HWC_HEIGHT	64
> -
>   #define AST_HWC_PITCH		(AST_MAX_HWC_WIDTH * SZ_2)
>   #define AST_HWC_SIZE		(AST_MAX_HWC_HEIGHT * AST_HWC_PITCH)
>   
> -#define AST_HWC_SIGNATURE_SIZE	32
> -
>   /*
>    * Planes
>    */
> @@ -183,7 +180,6 @@ struct ast_device {
>   	void __iomem	*vram;
>   	unsigned long	vram_base;
>   	unsigned long	vram_size;
> -	unsigned long	vram_fb_available;
>   
>   	struct mutex modeset_lock; /* Protects access to modeset I/O registers in ioregs */
>   
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 3d03ef556d0a..0bc140319464 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -92,7 +92,6 @@ int ast_mm_init(struct ast_device *ast)
>   
>   	ast->vram_base = base;
>   	ast->vram_size = vram_size;
> -	ast->vram_fb_available = vram_size;
>   
>   	return 0;
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

