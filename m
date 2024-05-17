Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4A98C8327
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 11:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FECC10E202;
	Fri, 17 May 2024 09:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TRvuZVO3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1QP8NRn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y9wj49UB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ak3a9cl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD20910E497
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 09:17:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D50437310;
 Fri, 17 May 2024 09:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715937439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FUzCOKw8mun7sZIgFhlHHQZpTWJyZNr+767TPUTXGBU=;
 b=TRvuZVO3azIlaC4eWpSm1c1SKx2r0VYVn2opdMmhjq/eTUB0ZDVpEYhkHb0/JZbuvVMK11
 iFKDvaLyGMlKJzyeArOEPM4JF9zP7/8Wxy+iNGThjPp7UmwrTg5rpiB+lZioopJp33Dltv
 jnW+RnJx9l+9oNUGWBzzDh9egv0TYMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715937439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FUzCOKw8mun7sZIgFhlHHQZpTWJyZNr+767TPUTXGBU=;
 b=K1QP8NRnBx1YHdetztcHRS+mrDLM+aWy0l1rntIpis0r1I9SFd0j++lo9j28PNXg81lRuJ
 aFMPv09NMmo0wuBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715937438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FUzCOKw8mun7sZIgFhlHHQZpTWJyZNr+767TPUTXGBU=;
 b=Y9wj49UBzMsk/klZjx1jUa8u+LZarwfznTELydTt4tu9d5UC1nWTDWFKlarjKemh/ZbEB9
 DV77u4P9F3aqJAnlDaFu+USssr68OyGfEGulv1qupR8H187f7WprPDiS2hmRilyJ5rxYWA
 jZkeyDnEO7YYSyjnoE2jwXyUt+tD/94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715937438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FUzCOKw8mun7sZIgFhlHHQZpTWJyZNr+767TPUTXGBU=;
 b=Ak3a9cl//yxleHFMGzk9pgWKSLQt8GySCpq6ic7zyT4BzbnhcxCE67oFANoQWuUDivw6a4
 bpFwyG3BsBbyewBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFB0813991;
 Fri, 17 May 2024 09:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mlwwOZ0gR2YdFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 May 2024 09:17:17 +0000
Message-ID: <8e82a1e7-b2b3-4417-9e02-197d0e0dbd5e@suse.de>
Date: Fri, 17 May 2024 11:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Revert "drm/mgag200: Add a workaround for low-latency"
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240516161751.479558-1-jfalempe@redhat.com>
 <20240516161751.479558-2-jfalempe@redhat.com>
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
In-Reply-To: <20240516161751.479558-2-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.29
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



Am 16.05.24 um 18:17 schrieb Jocelyn Falempe:
> This reverts commit bfa4437fd3938ae2e186e7664b2db65bb8775670.
>
> This workaround doesn't work reliably on all servers.
> I'll replace it with an option to disable Write-Combine,
> which has more impact on performance, but fix the latency
> issue on all hardware.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/mgag200/Kconfig        | 12 ------------
>   drivers/gpu/drm/mgag200/mgag200_drv.c  | 17 -----------------
>   drivers/gpu/drm/mgag200/mgag200_mode.c |  8 --------
>   3 files changed, 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
> index 5e4d48df4854c..b28c5e4828f47 100644
> --- a/drivers/gpu/drm/mgag200/Kconfig
> +++ b/drivers/gpu/drm/mgag200/Kconfig
> @@ -11,15 +11,3 @@ config DRM_MGAG200
>   	 MGA G200 desktop chips and the server variants. It requires 0.3.0
>   	 of the modesetting userspace driver, and a version of mga driver
>   	 that will fail on KMS enabled devices.
> -
> -config DRM_MGAG200_IOBURST_WORKAROUND
> -	bool "Disable buffer caching"
> -	depends on DRM_MGAG200 && PREEMPT_RT && X86
> -	help
> -	  Enable a workaround to avoid I/O bursts within the mgag200 driver at
> -	  the expense of overall display performance.
> -	  It restores the <v5.10 behavior, by mapping the framebuffer in system
> -	  RAM as Write-Combining, and flushing the cache after each write.
> -	  This is only useful on x86_64 if you want to run processes with
> -	  deterministic latency.
> -	  If unsure, say N.
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 65f2ed18b31c5..3883f25ca4d8b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -84,20 +84,6 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
>   	return offset - 65536;
>   }
>   
> -#if defined(CONFIG_DRM_MGAG200_IOBURST_WORKAROUND)
> -static struct drm_gem_object *mgag200_create_object(struct drm_device *dev, size_t size)
> -{
> -	struct drm_gem_shmem_object *shmem;
> -
> -	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
> -	if (!shmem)
> -		return NULL;
> -
> -	shmem->map_wc = true;
> -	return &shmem->base;
> -}
> -#endif
> -
>   /*
>    * DRM driver
>    */
> @@ -113,9 +99,6 @@ static const struct drm_driver mgag200_driver = {
>   	.major = DRIVER_MAJOR,
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
> -#if defined(CONFIG_DRM_MGAG200_IOBURST_WORKAROUND)
> -	.gem_create_object = mgag200_create_object,
> -#endif
>   	DRM_GEM_SHMEM_DRIVER_OPS,
>   };
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index fc54851d3384d..d3d820f7a77d7 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -13,7 +13,6 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_cache.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_format_helper.h>
> @@ -438,13 +437,6 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
>   	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
> -
> -	/* Flushing the cache greatly improves latency on x86_64 */
> -#if defined(CONFIG_DRM_MGAG200_IOBURST_WORKAROUND)
> -	if (!vmap->is_iomem)
> -		drm_clflush_virt_range(vmap->vaddr + clip->y1 * fb->pitches[0],
> -				       drm_rect_height(clip) * fb->pitches[0]);
> -#endif
>   }
>   
>   /*

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

