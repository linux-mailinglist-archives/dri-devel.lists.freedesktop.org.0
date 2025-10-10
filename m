Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CDDBCC375
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFC110EB92;
	Fri, 10 Oct 2025 08:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MlJFNKnR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VRwlNs9r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MlJFNKnR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VRwlNs9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162BB10EB96
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 08:49:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDA39222F3;
 Fri, 10 Oct 2025 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760086197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G2YPFH36RFW1KsX05nepgyydyvLRnC9H/eJhuwKUFkY=;
 b=MlJFNKnR4fYc26sPNoio8OTamZFf6721D/A5KeMo4eH3FqTv6xIFBz8lb3h1IXLPqw1J+b
 YiAdC8TSeRxm1wUKi45GebbpG+/5yKCJ/yghxfUpUHwG4hj8XbIh2dL0kgMVwEHOC+tDau
 VX5YfBMLk2NhAXj9YLEsCnEBraEmb6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760086197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G2YPFH36RFW1KsX05nepgyydyvLRnC9H/eJhuwKUFkY=;
 b=VRwlNs9rY+/7Fr7INQCa7CofEHu6MFFDlkKCOT/FzyHlk/7takXwcclKEfCNYh0Y10lW8a
 AIS/egbN2rY5yiAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760086197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G2YPFH36RFW1KsX05nepgyydyvLRnC9H/eJhuwKUFkY=;
 b=MlJFNKnR4fYc26sPNoio8OTamZFf6721D/A5KeMo4eH3FqTv6xIFBz8lb3h1IXLPqw1J+b
 YiAdC8TSeRxm1wUKi45GebbpG+/5yKCJ/yghxfUpUHwG4hj8XbIh2dL0kgMVwEHOC+tDau
 VX5YfBMLk2NhAXj9YLEsCnEBraEmb6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760086197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=G2YPFH36RFW1KsX05nepgyydyvLRnC9H/eJhuwKUFkY=;
 b=VRwlNs9rY+/7Fr7INQCa7CofEHu6MFFDlkKCOT/FzyHlk/7takXwcclKEfCNYh0Y10lW8a
 AIS/egbN2rY5yiAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BC7713A40;
 Fri, 10 Oct 2025 08:49:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8tbKHLXI6GiETAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Oct 2025 08:49:57 +0000
Message-ID: <79871b84-de1f-461e-b4b0-8fa49fbd74ef@suse.de>
Date: Fri, 10 Oct 2025 10:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbcon: Set fb_display[i]->mode to NULL when the mode
 is released
To: Quanmin Yan <yanquanmin1@huawei.com>
Cc: simona@ffwll.ch, deller@gmx.de, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wangkefeng.wang@huawei.com, zuoze1@huawei.com, sunnanyong@huawei.com
References: <20251010081659.3609082-1-yanquanmin1@huawei.com>
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
In-Reply-To: <20251010081659.3609082-1-yanquanmin1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org,huawei.com];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 TO_DN_SOME(0.00)[]
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



Am 10.10.25 um 10:16 schrieb Quanmin Yan:
> Recently, we discovered the following issue through syzkaller:
>
> BUG: KASAN: slab-use-after-free in fb_mode_is_equal+0x285/0x2f0
> Read of size 4 at addr ff11000001b3c69c by task syz.xxx
> ...
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0xab/0xe0
>   print_address_description.constprop.0+0x2c/0x390
>   print_report+0xb9/0x280
>   kasan_report+0xb8/0xf0
>   fb_mode_is_equal+0x285/0x2f0
>   fbcon_mode_deleted+0x129/0x180
>   fb_set_var+0xe7f/0x11d0
>   do_fb_ioctl+0x6a0/0x750
>   fb_ioctl+0xe0/0x140
>   __x64_sys_ioctl+0x193/0x210
>   do_syscall_64+0x5f/0x9c0
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Based on experimentation and analysis, during framebuffer unregistration,
> only the memory of fb_info->modelist is freed, without setting the
> corresponding fb_display[i]->mode to NULL for the freed modes. This leads
> to UAF issues during subsequent accesses. Here's an example of reproduction
> steps:
> 1. With /dev/fb0 already registered in the system, load a kernel module
>     to register a new device /dev/fb1;
> 2. Set fb1's mode to the global fb_display[] array (via FBIOPUT_CON2FBMAP);
> 3. Switch console from fb to VGA (to allow normal rmmod of the ko);
> 4. Unload the kernel module, at this point fb1's modelist is freed, leaving
>     a wild pointer in fb_display[];
> 5. Trigger the bug via system calls through fb0 attempting to delete a mode
>     from fb0.
>
> Add a check in do_unregister_framebuffer(): if the mode to be freed exists
> in fb_display[], set the corresponding mode pointer to NULL.
>
> Signed-off-by: Quanmin Yan <yanquanmin1@huawei.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for fixing the bug.

> ---
>
> Changes from v1
> (https://lore.kernel.org/all/20250923110608.3385083-1-yanquanmin1@huawei.com/)
> - Focus on fixing the issue specifically in the framebuffer unregistration
>    path, as other paths do not encounter this problem.
> - Adjusted according to Thomas's suggestions.
>
>   drivers/video/fbdev/core/fbcon.c | 19 +++++++++++++++++++
>   drivers/video/fbdev/core/fbmem.c |  1 +
>   include/linux/fbcon.h            |  2 ++
>   3 files changed, 22 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 96cc9b389246..9bd3c3814b5c 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2810,6 +2810,25 @@ int fbcon_mode_deleted(struct fb_info *info,
>   	return found;
>   }
>   
> +static void fbcon_delete_mode(struct fb_videomode *m)
> +{
> +	struct fbcon_display *p;
> +
> +	for (int i = first_fb_vc; i <= last_fb_vc; i++) {
> +		p = &fb_display[i];
> +		if (p->mode == m)
> +			p->mode = NULL;
> +	}
> +}
> +
> +void fbcon_delete_modelist(struct list_head *head)
> +{
> +	struct fb_modelist *modelist;
> +
> +	list_for_each_entry(modelist, head, list)
> +		fbcon_delete_mode(&modelist->mode);
> +}
> +
>   #ifdef CONFIG_VT_HW_CONSOLE_BINDING
>   static void fbcon_unbind(void)
>   {
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 53f1719b1ae1..eff757ebbed1 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -544,6 +544,7 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
>   		fb_info->pixmap.addr = NULL;
>   	}
>   
> +	fbcon_delete_modelist(&fb_info->modelist);
>   	fb_destroy_modelist(&fb_info->modelist);
>   	registered_fb[fb_info->node] = NULL;
>   	num_registered_fb--;
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index 81f0e698acbf..f206370060e1 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -18,6 +18,7 @@ void fbcon_suspended(struct fb_info *info);
>   void fbcon_resumed(struct fb_info *info);
>   int fbcon_mode_deleted(struct fb_info *info,
>   		       struct fb_videomode *mode);
> +void fbcon_delete_modelist(struct list_head *head);
>   void fbcon_new_modelist(struct fb_info *info);
>   void fbcon_get_requirement(struct fb_info *info,
>   			   struct fb_blit_caps *caps);
> @@ -38,6 +39,7 @@ static inline void fbcon_suspended(struct fb_info *info) {}
>   static inline void fbcon_resumed(struct fb_info *info) {}
>   static inline int fbcon_mode_deleted(struct fb_info *info,
>   				     struct fb_videomode *mode) { return 0; }
> +static inline void fbcon_delete_modelist(struct list_head *head) {}
>   static inline void fbcon_new_modelist(struct fb_info *info) {}
>   static inline void fbcon_get_requirement(struct fb_info *info,
>   					 struct fb_blit_caps *caps) {}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


