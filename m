Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD1983F41
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CE610E5C0;
	Tue, 24 Sep 2024 07:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GCCgxqLl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JT+GuVek";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MJQESQAR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHC/8x3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEDB10E52E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:37:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BBAB1F786;
 Tue, 24 Sep 2024 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727163469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pgNRXTc1U1drtadeHCRdrQ0WBtc9hei3MiPxHYsytBM=;
 b=GCCgxqLln7ydQA8+WEzFtq+PDMewAUFamJXQzjFUyY/c0VHPHHQ7EGLr1nwssnqRBgZ7Q4
 dpkFdw9EtjvsciGH88ndk79PFKAGMI+3ep79GwD8yx3LaCKfYrqY5KHxvNjfbnHzRCfibv
 VVSsqJa7PqwJIjlP3P0jZXiAqT+oat8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727163469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pgNRXTc1U1drtadeHCRdrQ0WBtc9hei3MiPxHYsytBM=;
 b=JT+GuVekLFSoPcyC1rqUQIZeR+ZnZFui173bD7W357o3Ers8yUntG/AyBOTC4uSBdGR/W+
 gznHqt4OPD5HGqDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MJQESQAR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lHC/8x3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727163468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pgNRXTc1U1drtadeHCRdrQ0WBtc9hei3MiPxHYsytBM=;
 b=MJQESQARoFjoDD0cR+b0PGvkJVlIKC2WqcDIHqLERcP5cvmgbA35N+nPpDrvL1QDhf7Mfm
 AOh9q/US31Cbi9ATUmrNWziLk5Oj1tPlOtN+R3IUJPDOYTM+gxPN97+GIHwIpTbj/PokYo
 8dD+68yaZDCGQ4ocnYjxcuwWeH2okWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727163468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pgNRXTc1U1drtadeHCRdrQ0WBtc9hei3MiPxHYsytBM=;
 b=lHC/8x3c9JejV2h5qtUdINMvhQ0CstrK8cxdN3EcWrVnKrb6Wg7P9qW4h/BvdTB6/73JgV
 GqfxWtkiWwWGiWAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E6F813AA8;
 Tue, 24 Sep 2024 07:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IaYuBkxs8mbWZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:37:48 +0000
Message-ID: <e22a5407-549e-4bf2-9102-a9efbcec1b4b@suse.de>
Date: Tue, 24 Sep 2024 09:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] fbcon: fbcon_is_inactive() -> fbcon_is_active()
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-5-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240923155749.30846-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BBAB1F786
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de];
 FREEMAIL_CC(0.00)[gmx.de,ffwll.ch,lists.freedesktop.org];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.51
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



Am 23.09.24 um 17:57 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Invert fbcon_is_inactive() into fbcon_is_active(). Much easier
> on the poor brain when you don't have to do dobule negations
> all over the place.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/core/fbcon.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index eb30aa872371..2a78cca3e9de 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -281,12 +281,12 @@ static bool fbcon_skip_panic(struct fb_info *info)
>   #endif
>   }
>   
> -static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
> +static inline int fbcon_is_active(struct vc_data *vc, struct fb_info *info)
>   {
>   	struct fbcon_ops *ops = info->fbcon_par;
>   
> -	return (info->state != FBINFO_STATE_RUNNING ||
> -		vc->vc_mode != KD_TEXT || ops->graphics || fbcon_skip_panic(info));
> +	return info->state == FBINFO_STATE_RUNNING &&
> +		vc->vc_mode == KD_TEXT && !ops->graphics && !fbcon_skip_panic(info);
>   }
>   
>   static int get_color(struct vc_data *vc, struct fb_info *info,
> @@ -1253,7 +1253,7 @@ static void __fbcon_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
>   	struct fbcon_display *p = &fb_display[vc->vc_num];
>   	u_int y_break;
>   
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return;
>   
>   	if (!height || !width)
> @@ -1295,7 +1295,7 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
>   	struct fbcon_display *p = &fb_display[vc->vc_num];
>   	struct fbcon_ops *ops = info->fbcon_par;
>   
> -	if (!fbcon_is_inactive(vc, info))
> +	if (fbcon_is_active(vc, info))
>   		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
>   			   get_color(vc, info, scr_readw(s), 1),
>   			   get_color(vc, info, scr_readw(s), 0));
> @@ -1306,7 +1306,7 @@ static void fbcon_clear_margins(struct vc_data *vc, int bottom_only)
>   	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
>   	struct fbcon_ops *ops = info->fbcon_par;
>   
> -	if (!fbcon_is_inactive(vc, info))
> +	if (fbcon_is_active(vc, info))
>   		ops->clear_margins(vc, info, margin_color, bottom_only);
>   }
>   
> @@ -1318,7 +1318,7 @@ static void fbcon_cursor(struct vc_data *vc, bool enable)
>   
>   	ops->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
>   
> -	if (fbcon_is_inactive(vc, info) || vc->vc_deccm != 1)
> +	if (!fbcon_is_active(vc, info) || vc->vc_deccm != 1)
>   		return;
>   
>   	if (vc->vc_cursor_type & CUR_SW)
> @@ -1724,7 +1724,7 @@ static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
>   	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
>   	struct fbcon_display *p = &fb_display[vc->vc_num];
>   
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return;
>   
>   	if (!width || !height)
> @@ -1748,7 +1748,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>   	struct fbcon_display *p = &fb_display[vc->vc_num];
>   	int scroll_partial = info->flags & FBINFO_PARTIAL_PAN_OK;
>   
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return true;
>   
>   	fbcon_cursor(vc, false);
> @@ -2132,7 +2132,7 @@ static bool fbcon_switch(struct vc_data *vc)
>   			fbcon_del_cursor_work(old_info);
>   	}
>   
> -	if (fbcon_is_inactive(vc, info) ||
> +	if (!fbcon_is_active(vc, info) ||
>   	    ops->blank_state != FB_BLANK_UNBLANK)
>   		fbcon_del_cursor_work(info);
>   	else
> @@ -2172,7 +2172,7 @@ static bool fbcon_switch(struct vc_data *vc)
>   	scrollback_max = 0;
>   	scrollback_current = 0;
>   
> -	if (!fbcon_is_inactive(vc, info)) {
> +	if (fbcon_is_active(vc, info)) {
>   	    ops->var.xoffset = ops->var.yoffset = p->yscroll = 0;
>   	    ops->update_start(info);
>   	}
> @@ -2228,7 +2228,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
>   		}
>   	}
>   
> - 	if (!fbcon_is_inactive(vc, info)) {
> +	if (fbcon_is_active(vc, info)) {
>   		if (ops->blank_state != blank) {
>   			ops->blank_state = blank;
>   			fbcon_cursor(vc, !blank);
> @@ -2242,7 +2242,7 @@ static bool fbcon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
>   			update_screen(vc);
>   	}
>   
> -	if (mode_switch || fbcon_is_inactive(vc, info) ||
> +	if (mode_switch || !fbcon_is_active(vc, info) ||
>   	    ops->blank_state != FB_BLANK_UNBLANK)
>   		fbcon_del_cursor_work(info);
>   	else
> @@ -2572,7 +2572,7 @@ static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table)
>   	int i, j, k, depth;
>   	u8 val;
>   
> -	if (fbcon_is_inactive(vc, info))
> +	if (!fbcon_is_active(vc, info))
>   		return;
>   
>   	if (!con_is_visible(vc))
> @@ -2672,7 +2672,7 @@ static void fbcon_modechanged(struct fb_info *info)
>   		scrollback_max = 0;
>   		scrollback_current = 0;
>   
> -		if (!fbcon_is_inactive(vc, info)) {
> +		if (fbcon_is_active(vc, info)) {
>   		    ops->var.xoffset = ops->var.yoffset = p->yscroll = 0;
>   		    ops->update_start(info);
>   		}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

