Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF34A60B0F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4EF10E997;
	Fri, 14 Mar 2025 08:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kohQ+7J5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="04mBK/3L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kohQ+7J5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="04mBK/3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86910E997
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:17:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C3D02118D;
 Fri, 14 Mar 2025 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741940219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jm5lLsffcQZ17Q+pZxQSahI6cj+Ai4SV4uR5ebuFUWU=;
 b=kohQ+7J5muFu9/YSN19E6VDjab99l6NF7m15RSgi6rtKtbJah4ExCZe3JOFhwWLZrd6z/h
 cCq/bKeBAytMBAh92Ps7ehiR7hfdKaYjcsX7Cwr8GHSvp34G35qiONtBOHrXriVWMzNW1/
 U3c4dedBVqohtqalWw+zx94rfb8EXgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741940219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jm5lLsffcQZ17Q+pZxQSahI6cj+Ai4SV4uR5ebuFUWU=;
 b=04mBK/3LIAHPZGXX4OpQ6RE0KC+fzTTlq6FzHsPTJH6mwO7DhjW4+bpGE1l9+w1+YaN9qB
 e8sdmkpAqOcFitCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741940219; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jm5lLsffcQZ17Q+pZxQSahI6cj+Ai4SV4uR5ebuFUWU=;
 b=kohQ+7J5muFu9/YSN19E6VDjab99l6NF7m15RSgi6rtKtbJah4ExCZe3JOFhwWLZrd6z/h
 cCq/bKeBAytMBAh92Ps7ehiR7hfdKaYjcsX7Cwr8GHSvp34G35qiONtBOHrXriVWMzNW1/
 U3c4dedBVqohtqalWw+zx94rfb8EXgc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741940219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jm5lLsffcQZ17Q+pZxQSahI6cj+Ai4SV4uR5ebuFUWU=;
 b=04mBK/3LIAHPZGXX4OpQ6RE0KC+fzTTlq6FzHsPTJH6mwO7DhjW4+bpGE1l9+w1+YaN9qB
 e8sdmkpAqOcFitCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59F7113A31;
 Fri, 14 Mar 2025 08:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tRmsFPvl02eWOgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Mar 2025 08:16:59 +0000
Message-ID: <9aec4ef1-7428-4630-a4af-d7448a023a60@suse.de>
Date: Fri, 14 Mar 2025 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbcon: Use static attribute groups for sysfs entries
To: oushixiong1025@163.com, Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250314060941.160048-1-oushixiong1025@163.com>
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
In-Reply-To: <20250314060941.160048-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_TO(0.00)[163.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[10];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmx.de,ens-lyon.org,c64.rulez.org,linutronix.de,vger.kernel.org,lists.freedesktop.org,kylinos.cn];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Am 14.03.25 um 07:09 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Using device_create_with_groups() to simplify creation and removal.
> Same as commit 1083a7be4504 ("tty: Use static attribute groups for
> sysfs entries").
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

with minor comments below

> ---
>   drivers/video/fbdev/core/fbcon.c | 69 +++++++++-----------------------
>   1 file changed, 19 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 07d127110ca4..1d792bd11063 100644
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
> @@ -3159,7 +3158,7 @@ static const struct consw fb_con = {
>   	.con_debug_leave	= fbcon_debug_leave,
>   };
>   
> -static ssize_t store_rotate(struct device *device,
> +static ssize_t rotate_store(struct device *device,
>   			    struct device_attribute *attr, const char *buf,
>   			    size_t count)
>   {
> @@ -3181,7 +3180,7 @@ static ssize_t store_rotate(struct device *device,
>   	return count;
>   }
>   
> -static ssize_t store_rotate_all(struct device *device,
> +static ssize_t rotate_all_store(struct device *device,
>   				struct device_attribute *attr,const char *buf,
>   				size_t count)
>   {
> @@ -3203,7 +3202,7 @@ static ssize_t store_rotate_all(struct device *device,
>   	return count;
>   }
>   
> -static ssize_t show_rotate(struct device *device,
> +static ssize_t rotate_show(struct device *device,
>   			   struct device_attribute *attr,char *buf)
>   {
>   	struct fb_info *info;
> @@ -3222,7 +3221,7 @@ static ssize_t show_rotate(struct device *device,
>   	return sysfs_emit(buf, "%d\n", rotate);
>   }
>   
> -static ssize_t show_cursor_blink(struct device *device,
> +static ssize_t cursor_blink_show(struct device *device,
>   				 struct device_attribute *attr, char *buf)
>   {
>   	struct fb_info *info;
> @@ -3247,7 +3246,7 @@ static ssize_t show_cursor_blink(struct device *device,
>   	return sysfs_emit(buf, "%d\n", blink);
>   }
>   
> -static ssize_t store_cursor_blink(struct device *device,
> +static ssize_t cursor_blink_store(struct device *device,
>   				  struct device_attribute *attr,
>   				  const char *buf, size_t count)
>   {
> @@ -3281,35 +3280,18 @@ static ssize_t store_cursor_blink(struct device *device,
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
> +static DEVICE_ATTR_RW(rotate);
> +static DEVICE_ATTR_WO(rotate_all);
> +static DEVICE_ATTR_RW(cursor_blink);

Since you're changing it anyway, could you please sort these attributes 
alphabetically. So cursor blink should go first. It's easier to read then.

>   
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
> +static struct attribute *fbcon_device_attrs[] = {
> +	&dev_attr_rotate.attr,
> +	&dev_attr_rotate_all.attr,
> +	&dev_attr_cursor_blink.attr,
> +	NULL

Alphabetical sorting here as well.

Best regards
Thomas

> +};
>   
> -	return 0;
> -}
> +ATTRIBUTE_GROUPS(fbcon_device);
>   
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   static void fbcon_register_existing_fbs(struct work_struct *work)
> @@ -3367,16 +3349,16 @@ void __init fb_console_init(void)
>   	int i;
>   
>   	console_lock();
> -	fbcon_device = device_create(fb_class, NULL, MKDEV(0, 0), NULL,
> -				     "fbcon");
> +	fbcon_device = device_create_with_groups(fb_class, NULL,
> +						 MKDEV(0, 0), NULL,
> +						 fbcon_device_groups, "fbcon");
>   
>   	if (IS_ERR(fbcon_device)) {
>   		printk(KERN_WARNING "Unable to create device "
>   		       "for fbcon; errno = %ld\n",
>   		       PTR_ERR(fbcon_device));
>   		fbcon_device = NULL;
> -	} else
> -		fbcon_init_device();
> +	}
>   
>   	for (i = 0; i < MAX_NR_CONSOLES; i++)
>   		con2fb_map[i] = -1;
> @@ -3387,18 +3369,6 @@ void __init fb_console_init(void)
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
> @@ -3411,7 +3381,6 @@ void __exit fb_console_exit(void)
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

