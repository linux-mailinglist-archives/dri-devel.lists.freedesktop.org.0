Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02B85B78F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E75910E2B8;
	Tue, 20 Feb 2024 09:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0899cbzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8bmM7uRZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0899cbzS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8bmM7uRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282D110E2D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:32:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 897051FD96;
 Tue, 20 Feb 2024 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708421537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zzgYhOfxb06/w+cXYAhOxmJZ0JOI83uVn0KgfN34fKM=;
 b=0899cbzSSyFMJQYbjyR/xJrC2+uTO2m4uMhvnu8S7bwWzsbTIihmNjr2b/odo4jT+ZKd/c
 DtPAQaGr9/0ugb78kh+z7/GxpemAQrVsftnGdgP3pLLBZfEjirJX76corYc2lbLvu17VYP
 rKKDp4utks1CepaUaonBIfMBGBneHPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708421537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zzgYhOfxb06/w+cXYAhOxmJZ0JOI83uVn0KgfN34fKM=;
 b=8bmM7uRZVEddlZrHKrMBwhZ9zsrrkYjP9XzTXNC7+zVDRnJhEWEApdwDBukS97QCHmnO7H
 dJsWBlE9hzKnpnBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708421537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zzgYhOfxb06/w+cXYAhOxmJZ0JOI83uVn0KgfN34fKM=;
 b=0899cbzSSyFMJQYbjyR/xJrC2+uTO2m4uMhvnu8S7bwWzsbTIihmNjr2b/odo4jT+ZKd/c
 DtPAQaGr9/0ugb78kh+z7/GxpemAQrVsftnGdgP3pLLBZfEjirJX76corYc2lbLvu17VYP
 rKKDp4utks1CepaUaonBIfMBGBneHPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708421537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zzgYhOfxb06/w+cXYAhOxmJZ0JOI83uVn0KgfN34fKM=;
 b=8bmM7uRZVEddlZrHKrMBwhZ9zsrrkYjP9XzTXNC7+zVDRnJhEWEApdwDBukS97QCHmnO7H
 dJsWBlE9hzKnpnBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F72E139EF;
 Tue, 20 Feb 2024 09:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 5T73DaFx1GWVaAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Feb 2024 09:32:17 +0000
Message-ID: <56475919-7aaf-47d6-8803-ef9c7673857b@suse.de>
Date: Tue, 20 Feb 2024 10:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/omapdrm: Fix console with deferred ops
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20240219142001.19727-1-tony@atomide.com>
 <20240219142001.19727-2-tony@atomide.com>
 <7ab37c2e-8a28-4ada-a72e-96112b708b06@suse.de>
 <20240220085655.GO5299@atomide.com>
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
In-Reply-To: <20240220085655.GO5299@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,bootlin.com:url];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,ravnborg.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.09
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

Am 20.02.24 um 09:56 schrieb Tony Lindgren:
> * Thomas Zimmermann <tzimmermann@suse.de> [240219 16:43]:
>> Am 19.02.24 um 15:19 schrieb Tony Lindgren:
>>> --- a/drivers/gpu/drm/omapdrm/Kconfig
>>> +++ b/drivers/gpu/drm/omapdrm/Kconfig
>>> @@ -5,6 +5,7 @@ config DRM_OMAP
>>>    	depends on ARCH_OMAP2PLUS
>>>    	select DRM_KMS_HELPER
>>>    	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
>>> +	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
>> Anything named _IOMEM_ is for framebuffer's in I/O memory space. Just keep
>> DMAMEM_HELPERS with the few changes below.
> Oh right, yes omapdrm is operating on memory.

With the latest kernels, you should see a warning if helpers operate on 
the wrong type of memory. [1][2]

[1] 
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/video/fbdev/core/fb_io_fops.c#L16
[2] 
https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/video/fbdev/core/fb_sys_fops.c#L26

>
>>>    	select VIDEOMODE_HELPERS
>>>    	select HDMI
>>>    	default n
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
>>> @@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
>>>    	omap_gem_roll(bo, fbi->var.yoffset * npages);
>>>    }
>>> +FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(omap_fbdev,
>>> +				  drm_fb_helper_damage_range,
>>> +				  drm_fb_helper_damage_area)
>>> +
>> Please create FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() by duplicating
>> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS() in <linux/fb.h>
> OK
>
>>>    static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
>>>    		struct fb_info *fbi)
>>>    {
>>> @@ -106,13 +110,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>>>    static const struct fb_ops omap_fb_ops = {
>>>    	.owner = THIS_MODULE,
>>> -	__FB_DEFAULT_DMAMEM_OPS_RDWR,
>>> +	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
>>>    	.fb_check_var	= drm_fb_helper_check_var,
>>>    	.fb_set_par	= drm_fb_helper_set_par,
>>>    	.fb_setcmap	= drm_fb_helper_setcmap,
>>>    	.fb_blank	= drm_fb_helper_blank,
>>>    	.fb_pan_display = omap_fbdev_pan_display,
>>> -	__FB_DEFAULT_DMAMEM_OPS_DRAW,
>>> +	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
>>>    	.fb_ioctl	= drm_fb_helper_ioctl,
>>>    	.fb_mmap	= omap_fbdev_fb_mmap,
>> The write and draw callbacks track the written pages and flush them to the
>> backbuffer. But mmap is a problem here, because mmap needs to do this as
>> well. You'd have to use fb_deferred_io_mmap() here and call
>> fb_deferred_io_init() in omap's fbdev init. See the generic fbdev in
>> drm_fbdev_generic() for a working example. But IDK whether that works easily
>> for omap's DMA memory. You have to mmap and track memory pages (i.e., struct
>> page).
> The following test patch works for me.. Not sure about the tracking though.

I know that i915 doesn't track mmap'ed pages correctly and I've see 
systems that do not update the framebuffer. IDK how/why this works with 
omapdrm.

> Do you mean that tracking needs to be implemented if fb_deferred_io_mmap()
> did not work?

omap_fbdev_fb_mmap() appears to mmap the DMA memory pages directly to 
userspace. So the fb_dirty callback won't be invoked when userspace 
writes to this framebuffer memory.

To implement tracking, you'd need to set fb_mmap to 
fb_deferred_io_mmap(). If you init omap_fb_ops with 
FB_DEFAULT_DEFERRED_OPS(), [3] you'd get that automatically. 
fb_deferred_io_mmap() sets up the tracking whenever userspaces writes to 
a mapped page.   You also need to init the write-back mechanisms that 
calls fb_dirty for the tracked pages. You should be able to duplicate 
the code from [4] into omapdrm.

Best regards
Thomas

[3] https://elixir.bootlin.com/linux/latest/source/include/linux/fb.h#L704
[4] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fbdev_generic.c#L119

>
>> The easy solution is to clear the fb_mmap callback and mmap() will thne not
>> be available to userspace.
> Sounds like that would break things for userspace.

Yes, probably.

>
> Regards,
>
> Tony
>
> 8< ------------------------
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
> @@ -80,9 +84,13 @@ static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>   {
>   	struct drm_fb_helper *helper = info->par;
>   	struct drm_framebuffer *fb = helper->fb;
> -	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
> +	struct drm_gem_object *bo;
>   
> -	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
> +	bo = drm_gem_fb_get_obj(fb, 0);
> +	if (!bo)
> +		return -EINVAL;
> +
> +	return fb_deferred_io_mmap(info, vma);
>   }
>   
>   static void omap_fbdev_fb_destroy(struct fb_info *info)
> @@ -94,6 +102,7 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   
>   	DBG();
>   
> +	fb_deferred_io_cleanup(info);
>   	drm_fb_helper_fini(helper);
>   
>   	omap_gem_unpin(bo);
> @@ -106,13 +115,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   
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
> @@ -213,6 +222,15 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
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

