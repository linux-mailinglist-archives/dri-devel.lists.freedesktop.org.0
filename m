Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A7983F20
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679E10E551;
	Tue, 24 Sep 2024 07:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HaBeY5iP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nu6x+ME3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HaBeY5iP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nu6x+ME3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840F310E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:34:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 235241F788;
 Tue, 24 Sep 2024 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727163244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BuUgM+nSj2ieY/juDfmjRkUs/UL49RufP58jQn43z10=;
 b=HaBeY5iPe4mSdA8srycBshjAUArQ/ChUm3/bCkoxmcj2LapyMRfJF6tEHAUy4W8oMdg+Jb
 o43YFRbA3/mp05Ads/AXQzpsymR/gMu0rj0ejepaGKwUTjQrFDENEgGCMd96CqXdXeUcQ9
 iv6N64tvDGzRmyit4+D1hHaCnrPeoU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727163244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BuUgM+nSj2ieY/juDfmjRkUs/UL49RufP58jQn43z10=;
 b=Nu6x+ME3qGF4xCtrPbVAKqx8ON9TeJDq/R3T3qx946G9Ud2cFC4YqyZtEggq4Mv82uSfT0
 W5BworQ5FzB5hMDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727163244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BuUgM+nSj2ieY/juDfmjRkUs/UL49RufP58jQn43z10=;
 b=HaBeY5iPe4mSdA8srycBshjAUArQ/ChUm3/bCkoxmcj2LapyMRfJF6tEHAUy4W8oMdg+Jb
 o43YFRbA3/mp05Ads/AXQzpsymR/gMu0rj0ejepaGKwUTjQrFDENEgGCMd96CqXdXeUcQ9
 iv6N64tvDGzRmyit4+D1hHaCnrPeoU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727163244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BuUgM+nSj2ieY/juDfmjRkUs/UL49RufP58jQn43z10=;
 b=Nu6x+ME3qGF4xCtrPbVAKqx8ON9TeJDq/R3T3qx946G9Ud2cFC4YqyZtEggq4Mv82uSfT0
 W5BworQ5FzB5hMDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EDF4713AA8;
 Tue, 24 Sep 2024 07:34:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TjhEOGtr8mbbZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:34:03 +0000
Message-ID: <17ba01d7-d3f6-4204-b4b2-215f6e2e15a2@suse.de>
Date: Tue, 24 Sep 2024 09:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] fbcon: Add sysfs attributes before registering the
 device
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-3-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240923155749.30846-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmx.de,ffwll.ch,lists.freedesktop.org];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:mid, suse.de:email]
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



Am 23.09.24 um 17:57 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Currently fbcon adds the attributes after registering the device,
> which means the attributes may not be there by the time udev
> gets the ADD uevent. Fix the race by switching over to
> device_create_with_groups().
>
> With this one can reliably turn off the power wasting cursor
> blink with a udev rule such as:
> ACTION=="add", SUBSYSTEM=="graphics", TEST=="cursor_blink", ATTR{cursor_blink}="0"
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/core/fbcon.c | 73 +++++++++-----------------------
>   1 file changed, 19 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 8936fa79b9e0..bbe332572ca7 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -160,7 +160,6 @@ static int info_idx = -1;
>   
>   /* console rotation */
>   static int initial_rotation = -1;
> -static int fbcon_has_sysfs;
>   static int margin_color;
>   
>   static const struct consw fb_con;
> @@ -188,8 +187,6 @@ static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
>   static void fbcon_modechanged(struct fb_info *info);
>   static void fbcon_set_all_vcs(struct fb_info *info);
>   
> -static struct device *fbcon_device;
> -
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
>   static inline void fbcon_set_rotation(struct fb_info *info)
>   {
> @@ -3151,7 +3148,7 @@ static const struct consw fb_con = {
>   	.con_debug_leave	= fbcon_debug_leave,
>   };
>   
> -static ssize_t store_rotate(struct device *device,
> +static ssize_t rotate_store(struct device *device,
>   			    struct device_attribute *attr, const char *buf,
>   			    size_t count)
>   {
> @@ -3173,7 +3170,7 @@ static ssize_t store_rotate(struct device *device,
>   	return count;
>   }
>   
> -static ssize_t store_rotate_all(struct device *device,
> +static ssize_t rotate_all_store(struct device *device,
>   				struct device_attribute *attr,const char *buf,
>   				size_t count)
>   {
> @@ -3195,7 +3192,7 @@ static ssize_t store_rotate_all(struct device *device,
>   	return count;
>   }
>   
> -static ssize_t show_rotate(struct device *device,
> +static ssize_t rotate_show(struct device *device,
>   			   struct device_attribute *attr,char *buf)
>   {
>   	struct fb_info *info;
> @@ -3214,13 +3211,13 @@ static ssize_t show_rotate(struct device *device,
>   	return sysfs_emit(buf, "%d\n", rotate);
>   }
>   
> -static ssize_t show_cursor_blink(struct device *device,
> +static ssize_t cursor_blink_show(struct device *device,
>   				 struct device_attribute *attr, char *buf)
>   {
>   	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
>   }
>   
> -static ssize_t store_cursor_blink(struct device *device,
> +static ssize_t cursor_blink_store(struct device *device,
>   				  struct device_attribute *attr,
>   				  const char *buf, size_t count)
>   {
> @@ -3253,35 +3250,17 @@ static ssize_t store_cursor_blink(struct device *device,
>   	return count;
>   }
>   
> -static struct device_attribute device_attrs[] = {
> -	__ATTR(rotate, S_IRUGO|S_IWUSR, show_rotate, store_rotate),
> -	__ATTR(rotate_all, S_IWUSR, NULL, store_rotate_all),
> -	__ATTR(cursor_blink, S_IRUGO|S_IWUSR, show_cursor_blink,
> -	       store_cursor_blink),
> -};
> -
> -static int fbcon_init_device(void)
> -{
> -	int i, error = 0;
> -
> -	fbcon_has_sysfs = 1;
> -
> -	for (i = 0; i < ARRAY_SIZE(device_attrs); i++) {
> -		error = device_create_file(fbcon_device, &device_attrs[i]);
> -
> -		if (error)
> -			break;
> -	}
> -
> -	if (error) {
> -		while (--i >= 0)
> -			device_remove_file(fbcon_device, &device_attrs[i]);
> -
> -		fbcon_has_sysfs = 0;
> -	}
> +static DEVICE_ATTR_RW(rotate);
> +static DEVICE_ATTR_WO(rotate_all);
> +static DEVICE_ATTR_RW(cursor_blink);
>   
> -	return 0;
> -}
> +static struct attribute *device_attrs[] = {
> +	&dev_attr_rotate.attr,
> +	&dev_attr_rotate_all.attr,
> +	&dev_attr_cursor_blink.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(device);
>   
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   static void fbcon_register_existing_fbs(struct work_struct *work)
> @@ -3336,19 +3315,18 @@ static void fbcon_start(void)
>   
>   void __init fb_console_init(void)
>   {
> +	struct device *fbcon_device;
>   	int i;
>   
>   	console_lock();
> -	fbcon_device = device_create(fb_class, NULL, MKDEV(0, 0), NULL,
> -				     "fbcon");
>   
> +	fbcon_device = device_create_with_groups(fb_class, NULL, MKDEV(0, 0),
> +						 NULL, device_groups, "fbcon");
>   	if (IS_ERR(fbcon_device)) {
>   		printk(KERN_WARNING "Unable to create device "
>   		       "for fbcon; errno = %ld\n",
>   		       PTR_ERR(fbcon_device));
> -		fbcon_device = NULL;
> -	} else
> -		fbcon_init_device();
> +	}
>   
>   	for (i = 0; i < MAX_NR_CONSOLES; i++)
>   		con2fb_map[i] = -1;
> @@ -3359,18 +3337,6 @@ void __init fb_console_init(void)
>   
>   #ifdef MODULE
>   
> -static void __exit fbcon_deinit_device(void)
> -{
> -	int i;
> -
> -	if (fbcon_has_sysfs) {
> -		for (i = 0; i < ARRAY_SIZE(device_attrs); i++)
> -			device_remove_file(fbcon_device, &device_attrs[i]);
> -
> -		fbcon_has_sysfs = 0;
> -	}
> -}
> -
>   void __exit fb_console_exit(void)
>   {
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> @@ -3383,7 +3349,6 @@ void __exit fb_console_exit(void)
>   #endif
>   
>   	console_lock();
> -	fbcon_deinit_device();
>   	device_destroy(fb_class, MKDEV(0, 0));
>   
>   	do_unregister_con_driver(&fb_con);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

