Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F395B565
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA92610E976;
	Thu, 22 Aug 2024 12:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DczE7k/H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iGKUdVGY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DczE7k/H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iGKUdVGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6A110E971
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 12:48:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3F9F201C9;
 Thu, 22 Aug 2024 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724330906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jIYJjy9NFzOE8ry/O1Sw0b0V7M7s7U2iu6xhANbkL8=;
 b=DczE7k/Hmu41o6T4lopyOwqF+iYyoqwDJ1tuL0D/14e79FKhTfaisPm+IOulXPQdVtjz67
 Q1Rl/Coqm6v77HseA/SI17+8xwnBRZyUD9t6NpMEJvrJIFapfzdf3r+1WQ8HcqWqLUvRhD
 PVgAF86m6eDNPd67A6qzaPG4Yhuyzbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724330906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jIYJjy9NFzOE8ry/O1Sw0b0V7M7s7U2iu6xhANbkL8=;
 b=iGKUdVGYlOgtT2zjcOKbQgSLsgpvNaVkmRxEwbHt316nemmgJZ8tVHrZObEQl19JqHtjvv
 OlgAUMHsD0QIvTBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724330906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jIYJjy9NFzOE8ry/O1Sw0b0V7M7s7U2iu6xhANbkL8=;
 b=DczE7k/Hmu41o6T4lopyOwqF+iYyoqwDJ1tuL0D/14e79FKhTfaisPm+IOulXPQdVtjz67
 Q1Rl/Coqm6v77HseA/SI17+8xwnBRZyUD9t6NpMEJvrJIFapfzdf3r+1WQ8HcqWqLUvRhD
 PVgAF86m6eDNPd67A6qzaPG4Yhuyzbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724330906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/jIYJjy9NFzOE8ry/O1Sw0b0V7M7s7U2iu6xhANbkL8=;
 b=iGKUdVGYlOgtT2zjcOKbQgSLsgpvNaVkmRxEwbHt316nemmgJZ8tVHrZObEQl19JqHtjvv
 OlgAUMHsD0QIvTBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83A03139D3;
 Thu, 22 Aug 2024 12:48:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id b39gHpkzx2aeQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Aug 2024 12:48:25 +0000
Message-ID: <0dc75dad-c9ab-4797-81cf-07d607309902@suse.de>
Date: Thu, 22 Aug 2024 14:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] drm/panic: Add integer scaling to blit()
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240822073852.562286-1-jfalempe@redhat.com>
 <20240822073852.562286-2-jfalempe@redhat.com>
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
In-Reply-To: <20240822073852.562286-2-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,protonmail.com,proton.me,samsung.com,google.com,vger.kernel.org,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[18];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo]
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



Am 22.08.24 um 09:33 schrieb Jocelyn Falempe:
> Add a parameter to the blit function, to upscale the image.
> This is necessary to draw a QR code, otherwise, the pixels are
> usually too small to be readable by most QR code reader.
> It can also be used later for drawing fonts on high DPI display.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_panic.c | 33 +++++++++++++++++++--------------
>   1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index eff4598e2fc73..0a047152f88b8 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -257,20 +257,20 @@ static bool drm_panic_is_pixel_fg(const u8 *sbuf8, unsigned int spitch, int x, i
>   static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
>   			     const u8 *sbuf8, unsigned int spitch,
>   			     unsigned int height, unsigned int width,
> -			     u16 fg16)
> +			     unsigned int scale, u16 fg16)
>   {
>   	unsigned int y, x;
>   
>   	for (y = 0; y < height; y++)
>   		for (x = 0; x < width; x++)
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
> +			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
>   				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, fg16);
>   }
>   
>   static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
>   			     const u8 *sbuf8, unsigned int spitch,
>   			     unsigned int height, unsigned int width,
> -			     u32 fg32)
> +			     unsigned int scale, u32 fg32)
>   {
>   	unsigned int y, x;
>   
> @@ -278,7 +278,7 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
>   		for (x = 0; x < width; x++) {
>   			u32 off = y * dpitch + x * 3;
>   
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y)) {
> +			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
>   				/* write blue-green-red to output in little endianness */
>   				iosys_map_wr(dmap, off, u8, (fg32 & 0x000000FF) >> 0);
>   				iosys_map_wr(dmap, off + 1, u8, (fg32 & 0x0000FF00) >> 8);
> @@ -291,24 +291,25 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
>   static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
>   			     const u8 *sbuf8, unsigned int spitch,
>   			     unsigned int height, unsigned int width,
> -			     u32 fg32)
> +			     unsigned int scale, u32 fg32)
>   {
>   	unsigned int y, x;
>   
>   	for (y = 0; y < height; y++)
>   		for (x = 0; x < width; x++)
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
> +			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
>   				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, fg32);
>   }
>   
>   static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
> -				 const u8 *sbuf8, unsigned int spitch, u32 fg_color)
> +				 const u8 *sbuf8, unsigned int spitch, unsigned int scale,
> +				 u32 fg_color)
>   {
>   	unsigned int y, x;
>   
>   	for (y = 0; y < drm_rect_height(clip); y++)
>   		for (x = 0; x < drm_rect_width(clip); x++)
> -			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
> +			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
>   				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
>   }
>   
> @@ -318,18 +319,22 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
>    * @clip: destination rectangle
>    * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
>    * @spitch: source pitch in bytes
> + * @scale: integer scale, source buffer is scale time smaller than destination
> + *         rectangle
>    * @fg_color: foreground color, in destination format
>    *
>    * This can be used to draw a font character, which is a monochrome image, to a
>    * framebuffer in other supported format.
>    */
>   static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
> -			   const u8 *sbuf8, unsigned int spitch, u32 fg_color)
> +			   const u8 *sbuf8, unsigned int spitch,
> +			   unsigned int scale, u32 fg_color)
> +
>   {
>   	struct iosys_map map;
>   
>   	if (sb->set_pixel)
> -		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
> +		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, scale, fg_color);
>   
>   	map = sb->map[0];
>   	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
> @@ -337,15 +342,15 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   	switch (sb->format->cpp[0]) {
>   	case 2:
>   		drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
> -				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
> +				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
>   	break;
>   	case 3:
>   		drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
> -				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
> +				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
>   	break;
>   	case 4:
>   		drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
> -				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
> +				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
>   	break;
>   	default:
>   		WARN_ONCE(1, "Can't blit with pixel width %d\n", sb->format->cpp[0]);
> @@ -485,7 +490,7 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
>   		for (j = 0; j < line_len; j++) {
>   			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
>   			rec.x2 = rec.x1 + font->width;
> -			drm_panic_blit(sb, &rec, src, font_pitch, color);
> +			drm_panic_blit(sb, &rec, src, font_pitch, 1, color);
>   			rec.x1 += font->width;
>   		}
>   	}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

