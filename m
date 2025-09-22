Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441AB8F261
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078210E3B9;
	Mon, 22 Sep 2025 06:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1rT6hYwN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s6ubZCVM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1rT6hYwN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s6ubZCVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783E310E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 06:31:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 283682188C;
 Mon, 22 Sep 2025 06:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758522667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bUTQHWz++ijLmMCPuOiiNXTSAdNpxGFs1jO370jC4ns=;
 b=1rT6hYwNVtq26rS/JN4b8e3z7BRZm+RDJL48WubukFtGLhuJ2zG6IG923bF9xqLk44Ci8m
 k/PKFkiIMVckVWptFSqtP55T2AvJzClRkRUn750nwEzgyZD1TR8vcYYwalPSYjE3rndBje
 f706k/HXcuRJeJWcYVQPrbVf4Gt516Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758522667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bUTQHWz++ijLmMCPuOiiNXTSAdNpxGFs1jO370jC4ns=;
 b=s6ubZCVMKmUYJgEb41Wia6JLEsYRNRw3ZF2rDhL2Y0UTaPmQM8Y+2fa1HYcJwDCMFSlljt
 Hnps4kG2nJWitsCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758522667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bUTQHWz++ijLmMCPuOiiNXTSAdNpxGFs1jO370jC4ns=;
 b=1rT6hYwNVtq26rS/JN4b8e3z7BRZm+RDJL48WubukFtGLhuJ2zG6IG923bF9xqLk44Ci8m
 k/PKFkiIMVckVWptFSqtP55T2AvJzClRkRUn750nwEzgyZD1TR8vcYYwalPSYjE3rndBje
 f706k/HXcuRJeJWcYVQPrbVf4Gt516Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758522667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bUTQHWz++ijLmMCPuOiiNXTSAdNpxGFs1jO370jC4ns=;
 b=s6ubZCVMKmUYJgEb41Wia6JLEsYRNRw3ZF2rDhL2Y0UTaPmQM8Y+2fa1HYcJwDCMFSlljt
 Hnps4kG2nJWitsCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D804C13A63;
 Mon, 22 Sep 2025 06:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JiVLMyrt0GgEbAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 06:31:06 +0000
Message-ID: <97658279-73a4-4d30-817b-6dcd47a11d6b@suse.de>
Date: Mon, 22 Sep 2025 08:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Delay the setting of fbcon_ops to fix KASAN issues
To: Zizhi Wo <wozizhi@huaweicloud.com>, deller@gmx.de, lee@kernel.org,
 jani.nikula@intel.com, oushixiong@kylinos.cn, soci@c64.rulez.org
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yangerkun@huawei.com
References: <20250905024340.337521-1-wozizhi@huaweicloud.com>
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
In-Reply-To: <20250905024340.337521-1-wozizhi@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.80 / 50.00];
 SEM_URIBL(3.50)[huaweicloud.com:email];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[huaweicloud.com,gmx.de,kernel.org,intel.com,kylinos.cn,c64.rulez.org];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[10];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -0.80
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

Am 05.09.25 um 04:43 schrieb Zizhi Wo:
> [BUG]
> Recently, we encountered a KASAN warning as follows:
>
> kasan_report+0xaf/0xe0 mm/kasan/report.c:588
> fb_pad_aligned_buffer+0x12f/0x150 drivers/video/fbdev/core/fbmem.c:116
> ccw_putcs_aligned drivers/video/fbdev/core/fbcon_ccw.c:119 [inline]
> ccw_putcs+0x9ac/0xbb0 drivers/video/fbdev/core/fbcon_ccw.c:175
> fbcon_putcs+0x329/0x3f0 drivers/video/fbdev/core/fbcon.c:1297
> do_update_region+0x3de/0x670 drivers/tty/vt/vt.c:623
> invert_screen+0x1de/0x600 drivers/tty/vt/vt.c:748
> highlight drivers/tty/vt/selection.c:57 [inline]
> clear_selection+0x5e/0x70 drivers/tty/vt/selection.c:81
> vc_do_resize+0xc8e/0xf40 drivers/tty/vt/vt.c:1206
> fbcon_modechanged+0x489/0x7a0 drivers/video/fbdev/core/fbcon.c:2705
> fbcon_set_all_vcs+0x1e0/0x600 drivers/video/fbdev/core/fbcon.c:2752
> fbcon_rotate_all drivers/video/fbdev/core/fbcon.c:250 [inline]
> ...
>
> reproduce[probabilistic, depending on the width and height of vc_font, as
> well as the value of "p" in do_update_region()]:

Which font sizes trigger the bug?

> 1) echo 2 > /sys/devices/virtual/graphics/fbcon/rotate_all
> 2) echo 3 > /sys/devices/virtual/graphics/fbcon/rotate_all
>
> [CAUSE]
> The root cause is that fbcon_modechanged() first sets the current rotate's
> corresponding ops. Subsequently, during vc_resize(), it may trigger
> clear_selection(), and in fbcon_putcs->ccw_putcs[rotate=3], this can result
> in an out-of-bounds access to "src". This happens because ops->fontbuffer
> is reallocated in fbcon_rotate_font():
> 1) When rotate=2, its size is (width + 7) / 8 * height
> 2) When rotate=3, its size is (height + 7) / 8 * width
>
> And the call to fbcon_rotate_font() occurs after clear_selection(). In
> other words, the fontbuffer is allocated using the size calculated from the
> previous rotation[2], but before reallocating it with the new size,
> con_putcs is already using the new rotation[3]:

We recently reworked the way rotation callbacks are set. [1] Does the 
bug still happen with [1] applied?

[1] https://patchwork.freedesktop.org/series/153056/#rev2

Best regards
Thomas

>
> rotate_all_store
>   fbcon_rotate_all
>    fbcon_set_all_vcs
>     fbcon_modechanged
>     ...
>      fbcon_set_rotate
>       fbcon_rotate_ccw
>        ops->putcs = ccw_putcs // set rotate 3 ops
>      vc_resize
>      ...
>       clear_selection
>        highlight
>        ...
>         do_update_region
> 	fbcon_putcs
> 	 ccw_putcs_aligned
> 	  src = ops->fontbuffer + (scr_readw(s--) & charmask)*cellsize
> 	  fb_pad_aligned_buffer----[src KASAN!!!]
>         update_screen
>          redraw_screen
> 	 fbcon_switch
> 	  fbcon_rotate_font
> 	   dst = kmalloc_array(len, d_cellsize, GFP_KERNEL)
> 	   ops->fontbuffer = dst
>
> [FIX]
> Considering that when the rotation changes, clear_selection() should clear
> the previously selected region and not consider the new rotation yet.
> Therefore, the assignment to fbcon_ops for the newly set rotate can be
> postponed to fbcon_rotate_font(), since the fontbuffer is regenerated
> there. To avoid affecting other code paths, fbcon_set_rotate() will
> temporarily continue assigning fbcon_ops based on cur_rotate not rotate.
>
> Signed-off-by: Zizhi Wo <wozizhi@huaweicloud.com>
> ---
>   drivers/video/fbdev/core/fbcon_rotate.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon_rotate.c b/drivers/video/fbdev/core/fbcon_rotate.c
> index ec3c883400f7..d76446da24d4 100644
> --- a/drivers/video/fbdev/core/fbcon_rotate.c
> +++ b/drivers/video/fbdev/core/fbcon_rotate.c
> @@ -70,6 +70,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
>   			src += s_cellsize;
>   			dst += d_cellsize;
>   		}
> +		fbcon_rotate_ud(ops);
>   		break;
>   	case FB_ROTATE_CW:
>   		for (i = len; i--; ) {
> @@ -78,6 +79,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
>   			src += s_cellsize;
>   			dst += d_cellsize;
>   		}
> +		fbcon_rotate_cw(ops);
>   		break;
>   	case FB_ROTATE_CCW:
>   		for (i = len; i--; ) {
> @@ -86,6 +88,7 @@ static int fbcon_rotate_font(struct fb_info *info, struct vc_data *vc)
>   			src += s_cellsize;
>   			dst += d_cellsize;
>   		}
> +		fbcon_rotate_ccw(ops);
>   		break;
>   	}
>   
> @@ -97,7 +100,7 @@ void fbcon_set_rotate(struct fbcon_ops *ops)
>   {
>   	ops->rotate_font = fbcon_rotate_font;
>   
> -	switch(ops->rotate) {
> +	switch (ops->cur_rotate) {
>   	case FB_ROTATE_CW:
>   		fbcon_rotate_cw(ops);
>   		break;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


