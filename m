Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD26CD3A019
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6F10E1C0;
	Mon, 19 Jan 2026 07:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dzm4UbI7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BbPYsdkl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xqKJWbB7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXymW59z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F1B10E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:38:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E12405BCFD;
 Mon, 19 Jan 2026 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768808313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KFJ54nMOhx8mffPk51jzPOExhgvMSATvxIPYY1eHHYk=;
 b=dzm4UbI7tvUjfeNa0O+zlfzGtN6hsdqZmMQqdxTinfdEjk8VK0tGsipRZnXIEBW9vpEnqa
 /5pR6SQdoPvOt8MxtGj1Zh1C/1g6B2aEYXdIc0wEf5fziPSzP3hmnYNrit/oZHLl+Q466t
 WpajPfV9t3YrazRXdp4wI8yx3+zwbBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768808313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KFJ54nMOhx8mffPk51jzPOExhgvMSATvxIPYY1eHHYk=;
 b=BbPYsdklfOsdb9VsbiMzqvwqrpP1+H7ZyHpqyYVIOPV1QypCCnUYigmnI2nG/FLvC9FKIE
 c0mXrRqvSCN7vgBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768808312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KFJ54nMOhx8mffPk51jzPOExhgvMSATvxIPYY1eHHYk=;
 b=xqKJWbB7XEe7Kt+oGeYNop182tnYGztB5d8/APNjfoN/YQJORiC946dUoknNFO4ELOTwh0
 jXOCjZJr5XBUTnIvXLfN9c/h9zK3tNo7hyQHHmLVr8mUVc2xxsmQ9ieD81qXJpV8Jb/Jm/
 SRCWgErxS9uHBUEkg7TSPVqpNMUJsG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768808312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KFJ54nMOhx8mffPk51jzPOExhgvMSATvxIPYY1eHHYk=;
 b=nXymW59zb9Fnc1Vv9HYLwWI2+aYLZn5k/vh/FWKoZqgROysB5Ztkd/KHsxi0bBPzG7YMhg
 zgm3hHXSVQBDdRCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E2053EA63;
 Mon, 19 Jan 2026 07:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 12QtJXjfbWm7ZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jan 2026 07:38:32 +0000
Message-ID: <5bc62c51-308c-483f-a92d-29354f2deeac@suse.de>
Date: Mon, 19 Jan 2026 08:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: sys_fillrect: Add bounds checking to prevent
 vmalloc-out-of-bounds
To: Osama Abdelkader <osama.abdelkader@gmail.com>,
 Zsolt Kajtar <soci@c64.rulez.org>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com
References: <20260118001852.70173-1-osama.abdelkader@gmail.com>
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
In-Reply-To: <20260118001852.70173-1-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,c64.rulez.org,ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 TAGGED_RCPT(0.00)[7a63ce155648954e749b]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.com:url]
X-Spam-Level: 
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

Hi,

thanks for the patch.

Am 18.01.26 um 01:18 schrieb Osama Abdelkader:
> The sys_fillrect function was missing bounds validation, which could lead
> to vmalloc-out-of-bounds writes when the rectangle coordinates extend
> beyond the framebuffer's virtual resolution. This was detected by KASAN
> and reported by syzkaller.
>
> Add validation to:
> 1. Check that width and height are non-zero
> 2. Verify that dx and dy are within virtual resolution bounds
> 3. Clip the rectangle dimensions to fit within virtual resolution if needed

This is rather a problem with the caller of the fillrect helper and 
affects all drivers and all implementations of fb_fillrect. Clipping 
should happen in the fbcon functions before invoking ->fb_con.

Best regards
Thomas

>
> This follows the same pattern used in other framebuffer drivers like
> pm2fb_fillrect.
>
> Reported-by: syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>   drivers/video/fbdev/core/sysfillrect.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
> index 12eea3e424bb..73fc322ff8fd 100644
> --- a/drivers/video/fbdev/core/sysfillrect.c
> +++ b/drivers/video/fbdev/core/sysfillrect.c
> @@ -7,6 +7,7 @@
>   #include <linux/module.h>
>   #include <linux/fb.h>
>   #include <linux/bitrev.h>
> +#include <linux/string.h>
>   #include <asm/types.h>
>   
>   #ifdef CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
> @@ -18,10 +19,28 @@
>   
>   void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
>   {
> +	struct fb_fillrect modded;
> +	int vxres, vyres;
> +
>   	if (!(p->flags & FBINFO_VIRTFB))
>   		fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
>   
> -	fb_fillrect(p, rect);
> +	vxres = p->var.xres_virtual;
> +	vyres = p->var.yres_virtual;
> +
> +	/* Validate and clip rectangle to virtual resolution */
> +	if (!rect->width || !rect->height ||
> +	    rect->dx >= vxres || rect->dy >= vyres)
> +		return;
> +
> +	memcpy(&modded, rect, sizeof(struct fb_fillrect));
> +
> +	if (modded.dx + modded.width > vxres)
> +		modded.width = vxres - modded.dx;
> +	if (modded.dy + modded.height > vyres)
> +		modded.height = vyres - modded.dy;
> +
> +	fb_fillrect(p, &modded);
>   }
>   EXPORT_SYMBOL(sys_fillrect);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


