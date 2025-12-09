Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C331ECAF1F0
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 08:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6C310E1BC;
	Tue,  9 Dec 2025 07:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="JhhxlY6Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HrF34AZM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JhhxlY6Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HrF34AZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1FD10E1BC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 07:25:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A0A85BD97;
 Tue,  9 Dec 2025 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765265140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5e9b4/51wBGJvfBnQarXioyoalwwpsbM4BtlHsk8JeM=;
 b=JhhxlY6YTb8wGIKVsELWxhc6rMmCzMSEGAW/mypKi8LO/0nhaHFojugSeu7z1MW14hnbe6
 JEYu09Po0xlksKtNqQQ/vZvPv4SQJLzXqN2tXW0aaIHSCAgJiyhBmA1cnTFkEU1wCgZYIW
 2iGmj7BtWg3IMqD00ztW2BtyqzIOeso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765265140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5e9b4/51wBGJvfBnQarXioyoalwwpsbM4BtlHsk8JeM=;
 b=HrF34AZMxlVAfrZXVT17cSwfIJlCVssYU3VP20xQVDp2r68m7rk1t2HUQwydSQue+6a+wB
 /XIxOP7YU0m81rDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765265140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5e9b4/51wBGJvfBnQarXioyoalwwpsbM4BtlHsk8JeM=;
 b=JhhxlY6YTb8wGIKVsELWxhc6rMmCzMSEGAW/mypKi8LO/0nhaHFojugSeu7z1MW14hnbe6
 JEYu09Po0xlksKtNqQQ/vZvPv4SQJLzXqN2tXW0aaIHSCAgJiyhBmA1cnTFkEU1wCgZYIW
 2iGmj7BtWg3IMqD00ztW2BtyqzIOeso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765265140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5e9b4/51wBGJvfBnQarXioyoalwwpsbM4BtlHsk8JeM=;
 b=HrF34AZMxlVAfrZXVT17cSwfIJlCVssYU3VP20xQVDp2r68m7rk1t2HUQwydSQue+6a+wB
 /XIxOP7YU0m81rDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C473E3EA63;
 Tue,  9 Dec 2025 07:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iFmFLvPON2nSRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 07:25:39 +0000
Message-ID: <329423e8-d778-4f30-904a-825b1be72ce2@suse.de>
Date: Tue, 9 Dec 2025 08:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fbtft: Make sysfs and dev_*() logging conditional on
 FB_DEVICE
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <20251209042744.7875-2-chintanlike@gmail.com>
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
In-Reply-To: <20251209042744.7875-2-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmx.de,linuxfoundation.org];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, suse.com:url, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 09.12.25 um 05:27 schrieb Chintan Patel:
> The fbtft core and sysfs implementation unconditionally dereference
> fb_info->dev and register sysfs attributes. When FB_DEVICE=n, these
> fields are unavailable, leading to build failures.
>
> This patch wraps all sysfs attribute creation/removal and dev_dbg/dev_info
> logging in #ifdef CONFIG_FB_DEVICE, with pr_*() fallbacks for the
> non-FB_DEVICE case. This makes fbtft fully buildable when FB_DEVICE is
> disabled.
>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>   drivers/staging/fbtft/fbtft-core.c  | 20 ++++++++++++++++++--
>   drivers/staging/fbtft/fbtft-sysfs.c |  8 ++++++++
>   2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 9e7b84071174..dc967bdeabe8 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -365,9 +365,14 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>   	unsigned int val;
>   	int ret = 1;
>   
> +#ifdef CONFIG_FB_DEVICE
>   	dev_dbg(info->dev,

Rather use fb_dbg() [1] and similar helpers for logging. They only need 
the info pointer and do the correct output by themselves.

[1] https://elixir.bootlin.com/linux/v6.18/source/include/linux/fb.h#L895

>   		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>   		__func__, regno, red, green, blue, transp);
> +#else
> +	pr_debug("%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
> +		 __func__, regno, red, green, blue, transp);
> +#endif
>   
>   	switch (info->fix.visual) {
>   	case FB_VISUAL_TRUECOLOR:
> @@ -391,8 +396,11 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>   	struct fbtft_par *par = info->par;
>   	int ret = -EINVAL;
>   
> -	dev_dbg(info->dev, "%s(blank=%d)\n",
> -		__func__, blank);
> +#ifdef CONFIG_FB_DEVICE
> +	dev_dbg(info->dev, "%s(blank=%d)\n", __func__, blank);
> +#else
> +	pr_debug("%s(blank=%d)\n", __func__, blank);
> +#endif
>   
>   	if (!par->fbtftops.blank)
>   		return ret;
> @@ -793,6 +801,8 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>   	if (spi)
>   		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>   			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
> +
> +#ifdef CONFIG_FB_DEVICE
>   	dev_info(fb_info->dev,

Same here with fb_info().

Best regards
Thomas

>   		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>   		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> @@ -804,6 +814,12 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>   		fb_info->bl_dev->props.power = BACKLIGHT_POWER_ON;
>   		fb_info->bl_dev->ops->update_status(fb_info->bl_dev);
>   	}
> +#else
> +	pr_info("%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> +		fb_info->fix.smem_len >> 10, text1,
> +		HZ / fb_info->fbdefio->delay, text2);
> +#endif
>   
>   	return 0;
>   
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
> index e45c90a03a90..944f74f592d0 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -89,6 +89,7 @@ int fbtft_gamma_parse_str(struct fbtft_par *par, u32 *curves,
>   	return ret;
>   }
>   
> +#ifdef CONFIG_FB_DEVICE
>   static ssize_t
>   sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
>   {
> @@ -145,6 +146,7 @@ static ssize_t show_gamma_curve(struct device *device,
>   static struct device_attribute gamma_device_attrs[] = {
>   	__ATTR(gamma, 0660, show_gamma_curve, store_gamma_curve),
>   };
> +#endif
>   
>   void fbtft_expand_debug_value(unsigned long *debug)
>   {
> @@ -173,6 +175,7 @@ void fbtft_expand_debug_value(unsigned long *debug)
>   	}
>   }
>   
> +#ifdef CONFIG_FB_DEVICE
>   static ssize_t store_debug(struct device *device,
>   			   struct device_attribute *attr,
>   			   const char *buf, size_t count)
> @@ -200,17 +203,22 @@ static ssize_t show_debug(struct device *device,
>   
>   static struct device_attribute debug_device_attr =
>   	__ATTR(debug, 0660, show_debug, store_debug);
> +#endif
>   
>   void fbtft_sysfs_init(struct fbtft_par *par)
>   {
> +#ifdef CONFIG_FB_DEVICE
>   	device_create_file(par->info->dev, &debug_device_attr);
>   	if (par->gamma.curves && par->fbtftops.set_gamma)
>   		device_create_file(par->info->dev, &gamma_device_attrs[0]);
> +#endif
>   }
>   
>   void fbtft_sysfs_exit(struct fbtft_par *par)
>   {
> +#ifdef CONFIG_FB_DEVICE
>   	device_remove_file(par->info->dev, &debug_device_attr);
>   	if (par->gamma.curves && par->fbtftops.set_gamma)
>   		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
> +#endif
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


