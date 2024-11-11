Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D755A9C3F35
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 14:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F5F10E4B7;
	Mon, 11 Nov 2024 13:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fuyyZSeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kt2rFKpv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fuyyZSeE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kt2rFKpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9071110E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 13:06:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 112B421998;
 Mon, 11 Nov 2024 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731330380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zXNdSC4JdP5TzxYNAbSv5qOWVgtz+EqaCf+42JmXw1E=;
 b=fuyyZSeEFthO6hzNMG3M4I2QIHlbTl2ceZ2/OJPwPurKO3WbH/SaYtOxqw8kx2es4/FXGs
 5u6HhBdGqyxkBUdHE3kiL5oK6MxJysjt+l8p+WVMBceVuCqBwy1yxfdD5BZ+wmi1Cf4+g6
 W/3YT+9UappWXkpV2dvwW/d7eucmKqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731330380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zXNdSC4JdP5TzxYNAbSv5qOWVgtz+EqaCf+42JmXw1E=;
 b=Kt2rFKpv3/XFktHpn97B8t+mlQI8IkrlVySRDsz0Pw7C2jWkyk131xpqMXTjpA/EZdHX89
 FfDO2lTCi34KKaCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fuyyZSeE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Kt2rFKpv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731330380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zXNdSC4JdP5TzxYNAbSv5qOWVgtz+EqaCf+42JmXw1E=;
 b=fuyyZSeEFthO6hzNMG3M4I2QIHlbTl2ceZ2/OJPwPurKO3WbH/SaYtOxqw8kx2es4/FXGs
 5u6HhBdGqyxkBUdHE3kiL5oK6MxJysjt+l8p+WVMBceVuCqBwy1yxfdD5BZ+wmi1Cf4+g6
 W/3YT+9UappWXkpV2dvwW/d7eucmKqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731330380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zXNdSC4JdP5TzxYNAbSv5qOWVgtz+EqaCf+42JmXw1E=;
 b=Kt2rFKpv3/XFktHpn97B8t+mlQI8IkrlVySRDsz0Pw7C2jWkyk131xpqMXTjpA/EZdHX89
 FfDO2lTCi34KKaCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6602137FB;
 Mon, 11 Nov 2024 13:06:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /sMmJ0sBMmfoTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Nov 2024 13:06:19 +0000
Message-ID: <6a1bc758-e66a-4067-80d3-82fe3ba357e5@suse.de>
Date: Mon, 11 Nov 2024 14:06:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/log: Add integer scaling support
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241108082025.1004653-1-jfalempe@redhat.com>
 <20241108082025.1004653-8-jfalempe@redhat.com>
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
In-Reply-To: <20241108082025.1004653-8-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 112B421998
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,linutronix.de,igalia.com,verizon.net,linaro.org,suse.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi


Am 08.11.24 um 09:10 schrieb Jocelyn Falempe:
> Add a module parameter, to increase the font size for HiDPI screen.
> Even with CONFIG_FONT_TER16x32, it can still be a bit small to read.
> In this case, adding drm_log.scale=2 to your kernel command line will
> double the character size.

Can't we have larger fonts instead?

Best regards
Thomas

>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>
> v5:
>   * Change scale parameter to unsigned int (Jani Nikula)
>
>   drivers/gpu/drm/drm_log.c | 27 ++++++++++++++++++---------
>   1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
> index e6900c6b96436..4dc7be2288ab7 100644
> --- a/drivers/gpu/drm/drm_log.c
> +++ b/drivers/gpu/drm/drm_log.c
> @@ -25,6 +25,10 @@ MODULE_AUTHOR("Jocelyn Falempe");
>   MODULE_DESCRIPTION("DRM boot logger");
>   MODULE_LICENSE("GPL");
>   
> +static unsigned int scale = 1;
> +module_param(scale, uint, 0444);
> +MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 1");
> +
>   /**
>    * DOC: overview
>    *
> @@ -38,6 +42,8 @@ struct drm_log_scanout {
>   	const struct font_desc *font;
>   	u32 rows;
>   	u32 columns;
> +	u32 scaled_font_h;
> +	u32 scaled_font_w;
>   	u32 line;
>   	u32 format;
>   	u32 px_width;
> @@ -66,7 +72,7 @@ static struct drm_log *console_to_drm_log(struct console *con)
>   
>   static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>   			 const u8 *src, unsigned int src_pitch,
> -			 u32 height, u32 width, u32 scale, u32 px_width, u32 color)
> +			 u32 height, u32 width, u32 px_width, u32 color)
>   {
>   	switch (px_width) {
>   	case 2:
> @@ -86,7 +92,7 @@ static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>   static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
>   {
>   	struct drm_framebuffer *fb = scanout->buffer->fb;
> -	unsigned long height = scanout->font->height;
> +	unsigned long height = scanout->scaled_font_h;
>   	struct iosys_map map;
>   	struct drm_rect r = DRM_RECT_INIT(0, line * height, fb->width, height);
>   
> @@ -106,8 +112,8 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
>   	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
>   	const u8 *src;
>   	u32 px_width = fb->format->cpp[0];
> -	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * font->height,
> -					  fb->width, (scanout->line + 1) * font->height);
> +	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * scanout->scaled_font_h,
> +					  fb->width, (scanout->line + 1) * scanout->scaled_font_h);
>   	u32 i;
>   
>   	if (drm_client_buffer_vmap_local(scanout->buffer, &map))
> @@ -117,9 +123,10 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
>   	for (i = 0; i < len && i < scanout->columns; i++) {
>   		u32 color = (i < prefix_len) ? scanout->prefix_color : scanout->front_color;
>   		src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
> -		drm_log_blit(&map, fb->pitches[0], src, font_pitch, font->height, font->width,
> -			     1, px_width, color);
> -		iosys_map_incr(&map, font->width * px_width);
> +		drm_log_blit(&map, fb->pitches[0], src, font_pitch,
> +			     scanout->scaled_font_h, scanout->scaled_font_w,
> +			     px_width, color);
> +		iosys_map_incr(&map, scanout->scaled_font_w * px_width);
>   	}
>   
>   	scanout->line++;
> @@ -204,8 +211,10 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
>   		return -ENOMEM;
>   	}
>   	mode_set->fb = scanout->buffer->fb;
> -	scanout->rows = height / scanout->font->height;
> -	scanout->columns = width / scanout->font->width;
> +	scanout->scaled_font_h = scanout->font->height * scale;
> +	scanout->scaled_font_w = scanout->font->width * scale;
> +	scanout->rows = height / scanout->scaled_font_h;
> +	scanout->columns = width / scanout->scaled_font_w;
>   	scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, format);
>   	scanout->prefix_color = drm_draw_color_from_xrgb8888(0x4e9a06, format);
>   	return 0;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

