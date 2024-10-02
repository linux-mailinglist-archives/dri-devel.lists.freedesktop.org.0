Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55998CBE0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 06:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F061F10E340;
	Wed,  2 Oct 2024 04:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="DpaoBx7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D5910E340
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 04:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=3mV/2WjxRRRUIs1CehjNUqqU9MqWUP30n90PrOz0OD4=; b=DpaoBx7yQsJ3hHSpsb2twNlXUf
 Ag1t7Du40nQG707Im4/fexSHICom+RzDtmeLBD6Wye9DaVS5zfO1l45sQ3qc3zh5y5PMfxYNTKUw0
 1RhUhO4yhtHXgGA3uw2tsRuRNN8oU76EElLW0GVzUM3lLowPb1D4mtViNKz16hLkiP6ZI3dbXvb6+
 16p3rQZndXPskLZ/EEN23nx+yIJpSJYxH82v9o7rg3r4HPsLlcsjFooTPXltbSxEv8mjDpiPXRAPl
 /J6fAIbUSTfkwb7rRWlQnOyDkUMrim9n7lyOF2tZq6jF/YIN8SjsMo7HLpgYzdpQWZVlyfJA+82jb
 oSx7J7ew==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1svqZM-00000003QUH-3M4S; Wed, 02 Oct 2024 04:02:34 +0000
Message-ID: <ccb8b317-2d35-4113-a5bf-1d55f146b375@infradead.org>
Date: Tue, 1 Oct 2024 21:02:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/15] drm/vkms: Re-introduce line-per-line
 composition algorithm
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, arthurgrillo@riseup.net,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
 <20240930-yuv-v11-8-4b1a26bcfc96@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240930-yuv-v11-8-4b1a26bcfc96@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/30/24 8:31 AM, Louis Chauvet wrote:
> Re-introduce a line-by-line composition algorithm for each pixel format.
> This allows more performance by not requiring an indirection per pixel
> read. This patch is focused on readability of the code.
> 
> Line-by-line composition was introduced by [1] but rewritten back to
> pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> on performance, and it was merged.
> 
> This patch is almost a revert of [2], but in addition efforts have been
> made to increase readability and maintainability of the rotation handling.
> The blend function is now divided in two parts:
> - Transformation of coordinates from the output referential to the source
> referential
> - Line conversion and blending
> 
> Most of the complexity of the rotation management is avoided by using
> drm_rect_* helpers. The remaining complexity is around the clipping, to
> avoid reading/writing outside source/destination buffers.
> 
> The pixel conversion is now done line-by-line, so the read_pixel_t was
> replaced with read_pixel_line_t callback. This way the indirection is only
> required once per line and per plane, instead of once per pixel and per
> plane.
> 
> The read_line_t callbacks are very similar for most pixel format, but it
> is required to avoid performance impact. Some helpers for color
> conversion were introduced to avoid code repetition:
> - *_to_argb_u16: perform colors conversion. They should be inlined by the
>   compiler, and they are used to avoid repetition between multiple variants
>   of the same format (argb/xrgb and maybe in the future for formats like
>   bgr formats).
> 
> This new algorithm was tested with:
> - kms_plane (for color conversions)
> - kms_rotation_crc (for rotations of planes)
> - kms_cursor_crc (for translations of planes)
> - kms_rotation (for all rotations and formats combinations) [3]
> The performance gain was mesured with kms_fb_stress [4] with some
> modification to fix the writeback format.
> 
> The performance improvement is around 5 to 10%.
> 
> [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
>      new formats")
>      https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
> [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
>      functionality")
>      https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
> [3]: https://lore.kernel.org/igt-dev/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com/
> [4]: https://lore.kernel.org/all/20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 234 ++++++++++++++++++++++++++++-------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  28 +++--
>  drivers/gpu/drm/vkms/vkms_formats.c  | 224 ++++++++++++++++++++-------------
>  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
>  5 files changed, 344 insertions(+), 149 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 4ebeaf58fa75..76d4aa8a0ef6 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -29,8 +29,8 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>   * @x_start: The start offset
>   * @pixel_count: The number of pixels to blend
>   *
> - * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@x_start+@pixel_count in
> - * output_buffer.
> + * The pixels @x_start..@x_start+@pixel_count in stage_buffer are blended at
> + * @x_start..@x_start+@pixel_count in output_buffer.

with "- 1" somewhere?

>   *
>   * The current DRM assumption is that pixel color values have been already
>   * pre-multiplied with the alpha channel values. See more
> @@ -41,7 +41,7 @@ static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
>  				struct line_buffer *output_buffer, int x_start, int pixel_count)
>  {
>  	struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
> -	const struct pixel_argb_u16 *in = stage_buffer->pixels;
> +	const struct pixel_argb_u16 *in = &stage_buffer->pixels[x_start];
>  
>  	for (int i = 0; i < pixel_count; i++) {
>  		out[i].a = (u16)0xffff;
> @@ -51,33 +51,6 @@ static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
>  	}
>  }
>  
> -static int get_y_pos(struct vkms_frame_info *frame_info, int y)
> -{
> -	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> -		return drm_rect_height(&frame_info->rotated) - y - 1;
> -
> -	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
> -	case DRM_MODE_ROTATE_90:
> -		return frame_info->rotated.x2 - y - 1;
> -	case DRM_MODE_ROTATE_270:
> -		return y + frame_info->rotated.x1;
> -	default:
> -		return y;
> -	}
> -}
> -
> -static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> -{
> -	if (drm_rotation_90_or_270(frame_info->rotation)) {
> -		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
> -			return true;
> -	} else {
> -		if (pos >= frame_info->rotated.y1 && pos < frame_info->rotated.y2)
> -			return true;
> -	}
> -
> -	return false;
> -}
>  
>  static void fill_background(const struct pixel_argb_u16 *background_color,
>  			    struct line_buffer *output_buffer)
> @@ -203,6 +176,182 @@ static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
>  	return READ_LEFT_TO_RIGHT;
>  }
>  
> +/**
> + * clamp_line_coordinates() - Compute and clamp the coordinate to read and write during the blend
> + * process.
> + *
> + * @direction: direction of the reading
> + * @current_plane: current plane blended
> + * @src_line: source line of the reading. Only the top-left coordinate is used. This rectangle
> + * must be rotated and have a shape of 1*pixel_count if @direction is vertical and a shape of
> + * pixel_count*1 if @direction is horizontal.
> + * @src_x_start: x start coordinate for the line reading
> + * @src_y_start: y start coordinate for the line reading
> + * @dst_x_start: x coordinate to blend the read line
> + * @pixel_count: number of pixels to blend
> + *
> + * This function is mainly a safety net to avoid reading outside the source buffer. As the
> + * userspace should never ask to read outside the source plane, all the cases covered here should
> + * be dead code.
> + */
> +static void clamp_line_coordinates(enum pixel_read_direction direction,
> +				   const struct vkms_plane_state *current_plane,
> +				   const struct drm_rect *src_line, int *src_x_start,
> +				   int *src_y_start, int *dst_x_start, int *pixel_count)
> +{
> +	/* By default the start points are correct */
> +	*src_x_start = src_line->x1;
> +	*src_y_start = src_line->y1;
> +	*dst_x_start = current_plane->frame_info->dst.x1;
> +
> +	/* Get the correct number of pixel to blend, it depends of the direction */
> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +	case READ_RIGHT_TO_LEFT:
> +		*pixel_count = drm_rect_width(src_line);
> +		break;
> +	case READ_BOTTOM_TO_TOP:
> +	case READ_TOP_TO_BOTTOM:
> +		*pixel_count = drm_rect_height(src_line);
> +		break;
> +	}
> +
> +	/*
> +	 * Clamp the coordinates to avoid reading outside the buffer
> +	 *
> +	 * This is mainly a security to avoid reading outside the buffer, the userspace should

	                  a security check to avoid

> +	 * never request to read outside the source buffer.
> +	 */

