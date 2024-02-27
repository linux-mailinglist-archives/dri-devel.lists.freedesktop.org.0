Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8553868ED8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3918A10E433;
	Tue, 27 Feb 2024 11:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CmGh9HIv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vdmp/aZ7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CmGh9HIv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vdmp/aZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D413910E433
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:34:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4111A222B2;
 Tue, 27 Feb 2024 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tAdwtJgErkyqRMnETFdn7U9Hd2GLdabzPlwGdd+ipUU=;
 b=CmGh9HIv2CXBLMeaObEYs0MwzkMOANECl8eQDItHY1I/AvpHvg9KxgV0ch9olr+1Btq9O5
 kaa88lm1kGmuv56IDw9X1CtfIhNjCq2QeKfvSoq8iCAXY6QvNOto3zyaoR1FxBgQFZOZFa
 waBGfmawjw5l4+gp+7uv6i2zkP/iiUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tAdwtJgErkyqRMnETFdn7U9Hd2GLdabzPlwGdd+ipUU=;
 b=Vdmp/aZ7hbp0EgFOk0daczWTVFQvXqPcLNcWCYUuBfLT1Z2PyjJlfqOUwGfkOA0qHEBwYG
 J677IZw/E+nUeQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709033669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tAdwtJgErkyqRMnETFdn7U9Hd2GLdabzPlwGdd+ipUU=;
 b=CmGh9HIv2CXBLMeaObEYs0MwzkMOANECl8eQDItHY1I/AvpHvg9KxgV0ch9olr+1Btq9O5
 kaa88lm1kGmuv56IDw9X1CtfIhNjCq2QeKfvSoq8iCAXY6QvNOto3zyaoR1FxBgQFZOZFa
 waBGfmawjw5l4+gp+7uv6i2zkP/iiUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709033669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tAdwtJgErkyqRMnETFdn7U9Hd2GLdabzPlwGdd+ipUU=;
 b=Vdmp/aZ7hbp0EgFOk0daczWTVFQvXqPcLNcWCYUuBfLT1Z2PyjJlfqOUwGfkOA0qHEBwYG
 J677IZw/E+nUeQCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E5F8713216;
 Tue, 27 Feb 2024 11:34:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 4WO9NsTI3WUZUAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:34:28 +0000
Message-ID: <fe31468c-8f84-4e02-a0c1-6429e4630d86@suse.de>
Date: Tue, 27 Feb 2024 12:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Fixes for omapdrm console
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20240225064700.48035-1-tony@atomide.com>
 <43fc93f1-d602-47ae-98e5-ee6be4ea5192@ideasonboard.com>
 <42255362-4720-414e-b442-f98355e92968@ideasonboard.com>
 <ab0b8471-97a6-479a-88aa-9bb25e91fb8a@suse.de>
 <20240226112549.GU5299@atomide.com> <20240227070624.GB52537@atomide.com>
 <7d98a0cd-e6d5-460d-8b91-35fa340736dd@suse.de>
 <20240227080146.GW5299@atomide.com>
 <587d60ae-221b-4c02-9891-17dc608009d3@suse.de>
 <20240227094651.GX5299@atomide.com> <20240227101934.GC52537@atomide.com>
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
In-Reply-To: <20240227101934.GC52537@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[11];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[ideasonboard.com,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,gmx.de,redhat.com,ravnborg.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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

Am 27.02.24 um 11:19 schrieb Tony Lindgren:
> * Tony Lindgren <tony@atomide.com> [240227 11:47]:
>> * Thomas Zimmermann <tzimmermann@suse.de> [240227 09:16]:
>>> I just realized the fb_deferred_io_mmap() is already exported. So please use
>>> it instead of duplicating the code in omapdrm.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.7/source/drivers/video/fbdev/core/fb_defio.c#L237
>> Yeah I have now:
>>
>> static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>> {
>> 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>
>> 	return fb_deferred_io_mmap(info, vma);
>> }
>>
>>> I also noticed that omapdrm does not yet select the correct Kconfig symbols.
>>> That can be fixed by
>>>
>>>   1) creating Kconfig FB_DMAMEM_HELPERS_DEFERRED that are similar to their
>>> SYSMEM equivalent at [2]. The tokens should look like this
>>>
>>> configFB_DMAMEM_HELPERS_DEFERRED  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS_DEFERRED>
>>> bool
>>> depends onFB_CORE  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_CORE>
>>> selectFB_DEFERRED_IO  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_DEFERRED_IO>
>>> selectFB_DMAMEM_HELPERS  <https://elixir.bootlin.com/linux/latest/K/ident/CONFIG_FB_SYSMEM_HELPERS>
>> OK
>>
>>>    2) and selecting it instead of FB_DMAMEM_HELPERS under omapdrm's Kconfig
>>> symbol.
>> OK
> So here's what I have now, does that look OK?

Looks good. You can add

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

to the final patch.

Best regards
Thomas

>
> Regards,
>
> Tony
>
> 8< -------------------------
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -4,7 +4,7 @@ config DRM_OMAP
>   	depends on DRM && OF
>   	depends on ARCH_OMAP2PLUS
>   	select DRM_KMS_HELPER
> -	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
> +	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	select VIDEOMODE_HELPERS
>   	select HDMI
>   	default n
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
>   	omap_gem_roll(bo, fbi->var.yoffset * npages);
>   }
>   
> +FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(omap_fbdev,
> +				   drm_fb_helper_damage_range,
> +				   drm_fb_helper_damage_area)
> +
>   static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
>   		struct fb_info *fbi)
>   {
> @@ -78,11 +82,9 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
>   
>   static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>   {
> -	struct drm_fb_helper *helper = info->par;
> -	struct drm_framebuffer *fb = helper->fb;
> -	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
> +	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>   
> -	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
> +	return fb_deferred_io_mmap(info, vma);
>   }
>   
>   static void omap_fbdev_fb_destroy(struct fb_info *info)
> @@ -94,6 +96,7 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   
>   	DBG();
>   
> +	fb_deferred_io_cleanup(info);
>   	drm_fb_helper_fini(helper);
>   
>   	omap_gem_unpin(bo);
> @@ -104,15 +107,19 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   	kfree(fbdev);
>   }
>   
> +/*
> + * For now, we cannot use FB_DEFAULT_DEFERRED_OPS and fb_deferred_io_mmap()
> + * because we use write-combine.
> + */
>   static const struct fb_ops omap_fb_ops = {
>   	.owner = THIS_MODULE,
> -	__FB_DEFAULT_DMAMEM_OPS_RDWR,
> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
>   	.fb_check_var	= drm_fb_helper_check_var,
>   	.fb_set_par	= drm_fb_helper_set_par,
>   	.fb_setcmap	= drm_fb_helper_setcmap,
>   	.fb_blank	= drm_fb_helper_blank,
>   	.fb_pan_display = omap_fbdev_pan_display,
> -	__FB_DEFAULT_DMAMEM_OPS_DRAW,
> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
>   	.fb_ioctl	= drm_fb_helper_ioctl,
>   	.fb_mmap	= omap_fbdev_fb_mmap,
>   	.fb_destroy	= omap_fbdev_fb_destroy,
> @@ -213,6 +220,15 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   	fbi->fix.smem_start = dma_addr;
>   	fbi->fix.smem_len = bo->size;
>   
> +	/* deferred I/O */
> +	helper->fbdefio.delay = HZ / 20;
> +	helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> +
> +	fbi->fbdefio = &helper->fbdefio;
> +	ret = fb_deferred_io_init(fbi);
> +	if (ret)
> +		goto fail;
> +
>   	/* if we have DMM, then we can use it for scrolling by just
>   	 * shuffling pages around in DMM rather than doing sw blit.
>   	 */
> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
> --- a/drivers/video/fbdev/core/Kconfig
> +++ b/drivers/video/fbdev/core/Kconfig
> @@ -144,6 +144,12 @@ config FB_DMAMEM_HELPERS
>   	select FB_SYS_IMAGEBLIT
>   	select FB_SYSMEM_FOPS
>   
> +config FB_DMAMEM_HELPERS_DEFERRED
> +	bool
> +	depends on FB_CORE
> +	select FB_DEFERRED_IO
> +	select FB_DMAMEM_HELPERS
> +
>   config FB_IOMEM_FOPS
>   	tristate
>   	depends on FB_CORE
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -686,6 +686,10 @@ extern int fb_deferred_io_fsync(struct file *file, loff_t start,
>   	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
>   	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
>   
> +#define FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(__prefix, __damage_range, __damage_area) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
> +	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
> +
>   /*
>    * Initializes struct fb_ops for deferred I/O.
>    */

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

