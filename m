Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBCA8610B5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3F810E083;
	Fri, 23 Feb 2024 11:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o8NUzKQV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B2gBiYXQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bMl4K6kj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uSUCBM76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3301F10E083
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:46:25 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBF991FBDE;
 Fri, 23 Feb 2024 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708688783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cl7hNsX9xSzLc/5Zj7TtIDs8nuBCJtgQpvkLQFShB1A=;
 b=o8NUzKQVRqFSj6xZwow81fGNTV/8RxJuUfQOOMeYzW/6UKAA2eyqEOZ7aM+JFN8crE7emf
 +qnOQD99WbtuSJUPp+H9LZF58r+qx+RLS38ldU7P5nYoEEVpoI0LT9/Wzjio0Ke0paIytn
 PeO44SzFTP2d9xA1Db8h30aiZXtC9SA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708688783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cl7hNsX9xSzLc/5Zj7TtIDs8nuBCJtgQpvkLQFShB1A=;
 b=B2gBiYXQ3PVVwStARXnY2ehOyhiBdKXrhmj3L4HqEvIeKD1XRl5G3ISVJTHCXyPNstDOE1
 ppzgfeheH2Jt8WCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708688782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cl7hNsX9xSzLc/5Zj7TtIDs8nuBCJtgQpvkLQFShB1A=;
 b=bMl4K6kjRY47tlLgioBToR8G2F9n6Umpd2kYNFVWgw4jv7CBdAp9QfSlwTjlEIDeqUaVF2
 cD68JMVw3jwnfoxtu6OlkUMhq0UL4FW06YOMMTmVvl4Fwebm6gAmdCpXzsb9SajB2niR6B
 qN8aXAhU4J5eoFgk2MgWsvkyJp0mYEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708688782;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cl7hNsX9xSzLc/5Zj7TtIDs8nuBCJtgQpvkLQFShB1A=;
 b=uSUCBM76ckOn/PEYX/CldOYfPs7BVP6l0BZA7QIKVSac0EQcoBpWrvaemuBB4nk5d9LjH7
 CAxTgGov//YiqsDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 667B313776;
 Fri, 23 Feb 2024 11:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 7W62Fo6F2GWOYgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Feb 2024 11:46:22 +0000
Message-ID: <9309d4bd-f08b-4f63-90d9-b0595b48bfce@suse.de>
Date: Fri, 23 Feb 2024 12:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
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
In-Reply-To: <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bMl4K6kj;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uSUCBM76
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.00 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLt1fi5xebg1jyd5esdscga99p)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[bootlin.com,gmail.com,riseup.net,ffwll.ch,linux.intel.com,kernel.org,lwn.net];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,riseup.net:email,bootlin.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Score: -3.00
X-Rspamd-Queue-Id: CBF991FBDE
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



Am 23.02.24 um 12:37 schrieb Louis Chauvet:
> From: Arthur Grillo <arthurgrillo@riseup.net>
>
> Add support to the YUV formats bellow:
>
> - NV12
> - NV16
> - NV24
> - NV21
> - NV61
> - NV42
> - YUV420
> - YUV422
> - YUV444
> - YVU420
> - YVU422
> - YVU444
>
> The conversion matrices of each encoding and range were obtained by
> rounding the values of the original conversion matrices multiplied by
> 2^8. This is done to avoid the use of fixed point operations.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
> callbacks for yuv formats]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
>   drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
>   drivers/gpu/drm/vkms/vkms_formats.c  | 289 +++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
>   drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
>   5 files changed, 295 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index e555bf9c1aee..54fc5161d565 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -312,7 +312,7 @@ static void blend(struct vkms_writeback_job *wb,
>   			 * buffer [1]
>   			 */
>   			current_plane->pixel_read_line(
> -				current_plane->frame_info,
> +				current_plane,
>   				x_start,
>   				y_start,
>   				direction,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index ccc5be009f15..a4f6456cb971 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -75,6 +75,8 @@ enum pixel_read_direction {
>   	READ_RIGHT
>   };
>   
> +struct vkms_plane_state;
> +
>   /**
>   <<<<<<< HEAD

Noise

>    * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> @@ -87,8 +89,8 @@ enum pixel_read_direction {
>    * @out_pixel: Pointer where to write the pixel value. Pixels will be written between x_start and
>    *  x_end.
>    */
> -typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, int x_start, int y_start, enum
> -	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
> +typedef void (*pixel_read_line_t)(struct vkms_plane_state *frame_info, int x_start, int y_start,
> +	enum pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
>   
>   /**
>    * vkms_plane_state - Driver specific plane state
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 46daea6d3ee9..515c80866a58 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -33,7 +33,8 @@ static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int
>   	 */
>   	return fb->offsets[plane_index] +
>   	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
> -	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
> +	       (x / drm_format_info_block_height(format, plane_index)) *
> +	       format->char_per_block[plane_index];
>   }
>   
>   /**
> @@ -84,6 +85,32 @@ static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_direction di
>   	}
>   }
>   
> +/**
> + * get_subsampling() - Get the subsampling value on a specific direction
> + */
> +static int get_subsampling(const struct drm_format_info *format,
> +			   enum pixel_read_direction direction)
> +{
> +	if (direction == READ_LEFT || direction == READ_RIGHT)
> +		return format->hsub;
> +	else if (direction == READ_DOWN || direction == READ_UP)
> +		return format->vsub;
> +	return 1;
> +}
> +
> +/**
> + * get_subsampling_offset() - Get the subsampling offset to use when incrementing the pixel counter
> + */
> +static int get_subsampling_offset(const struct drm_format_info *format,
> +				  enum pixel_read_direction direction, int x_start, int y_start)
> +{
> +	if (direction == READ_RIGHT || direction == READ_LEFT)
> +		return x_start;
> +	else if (direction == READ_DOWN || direction == READ_UP)
> +		return y_start;
> +	return 0;
> +}
> +
>   
>   /*
>    * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
> @@ -130,6 +157,87 @@ static void RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u16 *pixe
>   	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>   }
>   
> +static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r, u8 *g, u8 *b)
> +{
> +	s32 y_16, cb_16, cr_16;
> +	s32 r_16, g_16, b_16;
> +
> +	y_16 = y - y_offset;
> +	cb_16 = cb - 128;
> +	cr_16 = cr - 128;
> +
> +	r_16 = m[0][0] * y_16 + m[0][1] * cb_16 + m[0][2] * cr_16;
> +	g_16 = m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
> +	b_16 = m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
> +
> +	*r = clamp(r_16, 0, 0xffff) >> 8;
> +	*g = clamp(g_16, 0, 0xffff) >> 8;
> +	*b = clamp(b_16, 0, 0xffff) >> 8;
> +}
> +
> +static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
> +			       enum drm_color_encoding encoding, enum drm_color_range range)
> +{
> +	static const s16 bt601_full[3][3] = {
> +		{ 256, 0,   359 },
> +		{ 256, -88, -183 },
> +		{ 256, 454, 0 },
> +	};
> +	static const s16 bt601[3][3] = {
> +		{ 298, 0,    409 },
> +		{ 298, -100, -208 },
> +		{ 298, 516,  0 },
> +	};
> +	static const s16 rec709_full[3][3] = {
> +		{ 256, 0,   408 },
> +		{ 256, -48, -120 },
> +		{ 256, 476, 0 },
> +	};
> +	static const s16 rec709[3][3] = {
> +		{ 298, 0,   459 },
> +		{ 298, -55, -136 },
> +		{ 298, 541, 0 },
> +	};
> +	static const s16 bt2020_full[3][3] = {
> +		{ 256, 0,   377 },
> +		{ 256, -42, -146 },
> +		{ 256, 482, 0 },
> +	};
> +	static const s16 bt2020[3][3] = {
> +		{ 298, 0,   430 },
> +		{ 298, -48, -167 },
> +		{ 298, 548, 0 },
> +	};
> +
> +	u8 r = 0;
> +	u8 g = 0;
> +	u8 b = 0;
> +	bool full = range == DRM_COLOR_YCBCR_FULL_RANGE;
> +	unsigned int y_offset = full ? 0 : 16;
> +
> +	switch (encoding) {
> +	case DRM_COLOR_YCBCR_BT601:
> +		ycbcr2rgb(full ? bt601_full : bt601,
> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> +		break;
> +	case DRM_COLOR_YCBCR_BT709:
> +		ycbcr2rgb(full ? rec709_full : rec709,
> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> +		break;
> +	case DRM_COLOR_YCBCR_BT2020:
> +		ycbcr2rgb(full ? bt2020_full : bt2020,
> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> +		break;
> +	default:
> +		pr_warn_once("Not supported color encoding\n");
> +		break;
> +	}
> +
> +	argb_u16->r = r * 257;
> +	argb_u16->g = g * 257;
> +	argb_u16->b = b * 257;
> +}
> +
>   /*
>    * The following functions are read_line function for each pixel format supported by VKMS.
>    *
> @@ -142,13 +250,13 @@ static void RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u16 *pixe
>    * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
>    */
>   
> -static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +static void ARGB8888_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
>   			       enum pixel_read_direction direction, int count,
>   			       struct pixel_argb_u16 out_pixel[])
>   {
> -	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
>   
> -	int step = get_step_1x1(frame_info->fb, direction, 0);
> +	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
>   
>   	while (count) {
>   		u8 *px = (u8 *)src_pixels;
> @@ -160,13 +268,13 @@ static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x_start,
>   	}
>   }
>   
> -static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +static void XRGB8888_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
>   			       enum pixel_read_direction direction, int count,
>   			       struct pixel_argb_u16 out_pixel[])
>   {
> -	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
>   
> -	int step = get_step_1x1(frame_info->fb, direction, 0);
> +	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
>   
>   	while (count) {
>   		u8 *px = (u8 *)src_pixels;
> @@ -178,13 +286,13 @@ static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x_start,
>   	}
>   }
>   
> -static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +static void ARGB16161616_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
>   				   enum pixel_read_direction direction, int count,
>   				   struct pixel_argb_u16 out_pixel[])
>   {
> -	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
>   
> -	int step = get_step_1x1(frame_info->fb, direction, 0);
> +	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
>   
>   	while (count) {
>   		u16 *px = (u16 *)src_pixels;
> @@ -196,13 +304,13 @@ static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, int x_sta
>   	}
>   }
>   
> -static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +static void XRGB16161616_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
>   				   enum pixel_read_direction direction, int count,
>   				   struct pixel_argb_u16 out_pixel[])
>   {
> -	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
>   
> -	int step = get_step_1x1(frame_info->fb, direction, 0);
> +	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
>   
>   	while (count) {
>   		u16 *px = (u16 *)src_pixels;
> @@ -214,13 +322,13 @@ static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, int x_sta
>   	}
>   }
>   
> -static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +static void RGB565_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
>   			     enum pixel_read_direction direction, int count,
>   			     struct pixel_argb_u16 out_pixel[])
>   {
> -	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +	u8 *src_pixels = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
>   
> -	int step = get_step_1x1(frame_info->fb, direction, 0);
> +	int step = get_step_1x1(plane->frame_info->fb, direction, 0);
>   
>   	while (count) {
>   		u16 *px = (u16 *)src_pixels;
> @@ -232,6 +340,139 @@ static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_start, in
>   	}
>   }
>   
> +static void semi_planar_yuv_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
> +				      enum pixel_read_direction direction, int count,
> +				      struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
> +	u8 *uv_plane = packed_pixels_addr(plane->frame_info,
> +					  x_start / plane->frame_info->fb->format->hsub,
> +					  y_start / plane->frame_info->fb->format->vsub,
> +					  1);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_uv = get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> +	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
> +							x_start, y_start); // 0
> +
> +	for (int i = 0; i < count; i++) {
> +		yuv_u8.y = y_plane[0];
> +		yuv_u8.u = uv_plane[0];
> +		yuv_u8.v = uv_plane[1];
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel += 1;
> +		y_plane += step_y;
> +		if ((i + subsampling_offset + 1) % subsampling == 0)
> +			uv_plane += step_uv;
> +	}
> +}
> +
> +static void semi_planar_yvu_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
> +				      enum pixel_read_direction direction, int count,
> +				      struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
> +	u8 *vu_plane = packed_pixels_addr(plane->frame_info,
> +					  x_start / plane->frame_info->fb->format->hsub,
> +					  y_start / plane->frame_info->fb->format->vsub,
> +					  1);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_vu = get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> +	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
> +							x_start, y_start);
> +	for (int i = 0; i < count; i++) {
> +		yuv_u8.y = y_plane[0];
> +		yuv_u8.u = vu_plane[1];
> +		yuv_u8.v = vu_plane[0];
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel += 1;
> +		y_plane += step_y;
> +		if ((i + subsampling_offset + 1) % subsampling == 0)
> +			vu_plane += step_vu;
> +	}
> +}
> +
> +static void planar_yuv_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
> +				 enum pixel_read_direction direction, int count,
> +				 struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
> +	u8 *u_plane = packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 1);
> +	u8 *v_plane = packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 2);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_u = get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int step_v = get_step_1x1(plane->frame_info->fb, direction, 2);
> +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> +	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
> +							x_start, y_start);
> +
> +	for (int i = 0; i < count; i++) {
> +		yuv_u8.y = *y_plane;
> +		yuv_u8.u = *u_plane;
> +		yuv_u8.v = *v_plane;
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel += 1;
> +		y_plane += step_y;
> +		if ((i + subsampling_offset + 1) % subsampling == 0) {
> +			u_plane += step_u;
> +			v_plane += step_v;
> +		}
> +	}
> +}
> +
> +static void planar_yvu_read_line(struct vkms_plane_state *plane, int x_start, int y_start,
> +				 enum pixel_read_direction direction, int count,
> +				 struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *y_plane = packed_pixels_addr(plane->frame_info, x_start, y_start, 0);
> +	u8 *v_plane = packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 1);
> +	u8 *u_plane = packed_pixels_addr(plane->frame_info,
> +					 x_start / plane->frame_info->fb->format->hsub,
> +					 y_start / plane->frame_info->fb->format->vsub,
> +					 2);
> +	struct pixel_yuv_u8 yuv_u8;
> +	int step_y = get_step_1x1(plane->frame_info->fb, direction, 0);
> +	int step_u = get_step_1x1(plane->frame_info->fb, direction, 1);
> +	int step_v = get_step_1x1(plane->frame_info->fb, direction, 2);
> +	int subsampling = get_subsampling(plane->frame_info->fb->format, direction);
> +	int subsampling_offset = get_subsampling_offset(plane->frame_info->fb->format, direction,
> +							x_start, y_start);
> +
> +	for (int i = 0; i < count; i++) {
> +		yuv_u8.y = *y_plane;
> +		yuv_u8.u = *u_plane;
> +		yuv_u8.v = *v_plane;
> +
> +		yuv_u8_to_argb_u16(out_pixel, &yuv_u8, plane->base.base.color_encoding,
> +				   plane->base.base.color_range);
> +		out_pixel += 1;
> +		y_plane += step_y;
> +		if ((i + subsampling_offset + 1) % subsampling == 0) {
> +			u_plane += step_u;
> +			v_plane += step_v;
> +		}
> +	}
> +}
> +
>   /*
>    * The following functions take one argb_u16 pixel and convert it to a specific format. The
>    * result is stored in @dst_pixels.
> @@ -344,6 +585,22 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   		return &XRGB16161616_read_line;
>   	case DRM_FORMAT_RGB565:
>   		return &RGB565_read_line;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV24:
> +		return &semi_planar_yuv_read_line;
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_NV42:
> +		return &semi_planar_yvu_read_line;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +		return &planar_yuv_read_line;
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
> +		return &planar_yvu_read_line;
>   	default:
>   		return (pixel_read_line_t)NULL;
>   	}
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 8d2bef95ff79..5a3a9e1328d8 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -9,4 +9,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format);
>   
>   pixel_write_t get_pixel_write_function(u32 format);
>   
> +struct pixel_yuv_u8 {
> +	u8 y, u, v;
> +};
> +
>   #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 58c1c74742b5..427ca67c60ce 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -17,7 +17,19 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_XRGB16161616,
>   	DRM_FORMAT_ARGB16161616,
> -	DRM_FORMAT_RGB565
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV16,
> +	DRM_FORMAT_NV24,
> +	DRM_FORMAT_NV21,
> +	DRM_FORMAT_NV61,
> +	DRM_FORMAT_NV42,
> +	DRM_FORMAT_YUV420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YVU444
>   };
>   
>   static struct drm_plane_state *
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

