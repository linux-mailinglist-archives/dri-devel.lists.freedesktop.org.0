Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DBE6ED6BC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 23:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C235410E07D;
	Mon, 24 Apr 2023 21:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C56310E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 21:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PvG+oKAwPubvNCCjizi+PV3gSjp9w6IpvV7IfYh7Tyw=; b=VIXC2vfcYXwLBdf0viDfueM3/L
 KE8cWwiXdjcMMSC1EYHeKjW0IGUIuBr47+9wqytsiOnKoGygcT1MqSZ1PXOOomRdEVG0oG8n5gsQl
 pyUe7cbGX41YlNm1tpIW1SUg7EVG1+J5k0/hXx3ONAPsmFJzhYvL6MEglEHR44CD+MDCvVFQZdXvQ
 T1BfXNyWzTyk6ppYWspSb8ErwLwMwv0/O643yRhUbkZKgC1rRVG8n1bvpAUdeHYsyUfVYFq/bMXav
 SfJV2u0yvQTb44Ju93i4uW+jwQ+Z0gzkGl7Clvb6cE1TOLknEXZD4L7C2Heys50hsKcp0GZTXKEoI
 VCHGJNFg==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pr3dt-00BGAL-5a; Mon, 24 Apr 2023 23:22:38 +0200
Message-ID: <d5ebf417-877c-494c-8db1-9d585bff9dd8@igalia.com>
Date: Mon, 24 Apr 2023 18:22:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] drm/vkms: isolate pixel conversion functionality
Content-Language: en-US
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230418130525.128733-1-mcanal@igalia.com>
 <20230418130525.128733-2-mcanal@igalia.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230418130525.128733-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 10:05, Maíra Canal wrote:
> Currently, the pixel conversion functions repeat the same loop to
> iterate the rows. Instead of repeating the same code for each pixel
> format, create a function to wrap the loop and isolate the pixel
> conversion functionality.
> 
> Suggested-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Applied to drm/drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/vkms/vkms_composer.c |   4 +-
>   drivers/gpu/drm/vkms/vkms_drv.h      |   4 +-
>   drivers/gpu/drm/vkms/vkms_formats.c  | 125 +++++++++++----------------
>   drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>   drivers/gpu/drm/vkms/vkms_plane.c    |   2 +-
>   5 files changed, 56 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 8e53fa80742b..80164e79af00 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -99,7 +99,7 @@ static void blend(struct vkms_writeback_job *wb,
>   			if (!check_y_limit(plane[i]->frame_info, y))
>   				continue;
>   
> -			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
> +			vkms_compose_row(stage_buffer, plane[i], y);
>   			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>   					    output_buffer);
>   		}
> @@ -118,7 +118,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
>   	u32 n_active_planes = crtc_state->num_active_planes;
>   
>   	for (size_t i = 0; i < n_active_planes; i++)
> -		if (!planes[i]->plane_read)
> +		if (!planes[i]->pixel_read)
>   			return -1;
>   
>   	if (active_wb && !active_wb->wb_write)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 4a248567efb2..f152d54baf76 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -56,8 +56,7 @@ struct vkms_writeback_job {
>   struct vkms_plane_state {
>   	struct drm_shadow_plane_state base;
>   	struct vkms_frame_info *frame_info;
> -	void (*plane_read)(struct line_buffer *buffer,
> -			   const struct vkms_frame_info *frame_info, int y);
> +	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
>   };
>   
>   struct vkms_plane {
> @@ -155,6 +154,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>   /* Composer Support */
>   void vkms_composer_worker(struct work_struct *work);
>   void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
>   
>   /* Writeback */
>   int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index d4950688b3f1..8d948c73741e 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -42,100 +42,75 @@ static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y
>   	return packed_pixels_addr(frame_info, x_src, y_src);
>   }
>   
> -static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> -				 const struct vkms_frame_info *frame_info, int y)
> +static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		/*
> -		 * The 257 is the "conversion ratio". This number is obtained by the
> -		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> -		 * the best color value in a pixel format with more possibilities.
> -		 * A similar idea applies to others RGB color conversions.
> -		 */
> -		out_pixels[x].a = (u16)src_pixels[3] * 257;
> -		out_pixels[x].r = (u16)src_pixels[2] * 257;
> -		out_pixels[x].g = (u16)src_pixels[1] * 257;
> -		out_pixels[x].b = (u16)src_pixels[0] * 257;
> -	}
> +	/*
> +	 * The 257 is the "conversion ratio". This number is obtained by the
> +	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> +	 * the best color value in a pixel format with more possibilities.
> +	 * A similar idea applies to others RGB color conversions.
> +	 */
> +	out_pixel->a = (u16)src_pixels[3] * 257;
> +	out_pixel->r = (u16)src_pixels[2] * 257;
> +	out_pixel->g = (u16)src_pixels[1] * 257;
> +	out_pixel->b = (u16)src_pixels[0] * 257;
>   }
>   
> -static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> -				 const struct vkms_frame_info *frame_info, int y)
> +static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = (u16)src_pixels[2] * 257;
> -		out_pixels[x].g = (u16)src_pixels[1] * 257;
> -		out_pixels[x].b = (u16)src_pixels[0] * 257;
> -	}
> +	out_pixel->a = (u16)0xffff;
> +	out_pixel->r = (u16)src_pixels[2] * 257;
> +	out_pixel->g = (u16)src_pixels[1] * 257;
> +	out_pixel->b = (u16)src_pixels[0] * 257;
>   }
>   
> -static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
> -				     const struct vkms_frame_info *frame_info,
> -				     int y)
> +static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u16 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> +	u16 *pixels = (u16 *)src_pixels;
>   
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		out_pixels[x].a = le16_to_cpu(src_pixels[3]);
> -		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
> -		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
> -		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
> -	}
> +	out_pixel->a = le16_to_cpu(pixels[3]);
> +	out_pixel->r = le16_to_cpu(pixels[2]);
> +	out_pixel->g = le16_to_cpu(pixels[1]);
> +	out_pixel->b = le16_to_cpu(pixels[0]);
>   }
>   
> -static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
> -				     const struct vkms_frame_info *frame_info,
> -				     int y)
> +static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u16 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> +	u16 *pixels = (u16 *)src_pixels;
>   
> -	for (size_t x = 0; x < x_limit; x++, src_pixels += 4) {
> -		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = le16_to_cpu(src_pixels[2]);
> -		out_pixels[x].g = le16_to_cpu(src_pixels[1]);
> -		out_pixels[x].b = le16_to_cpu(src_pixels[0]);
> -	}
> +	out_pixel->a = (u16)0xffff;
> +	out_pixel->r = le16_to_cpu(pixels[2]);
> +	out_pixel->g = le16_to_cpu(pixels[1]);
> +	out_pixel->b = le16_to_cpu(pixels[0]);
>   }
>   
> -static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
> -			       const struct vkms_frame_info *frame_info, int y)
> +static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	u16 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> -			       stage_buffer->n_pixels);
> +	u16 *pixels = (u16 *)src_pixels;
>   
>   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>   
> -	for (size_t x = 0; x < x_limit; x++, src_pixels++) {
> -		u16 rgb_565 = le16_to_cpu(*src_pixels);
> -		s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> -		s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> -		s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> +	u16 rgb_565 = le16_to_cpu(*pixels);
> +	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> +	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> +	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>   
> -		out_pixels[x].a = (u16)0xffff;
> -		out_pixels[x].r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> -		out_pixels[x].g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> -		out_pixels[x].b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> -	}
> +	out_pixel->a = (u16)0xffff;
> +	out_pixel->r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> +	out_pixel->g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> +}
> +
> +void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> +{
> +	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> +	struct vkms_frame_info *frame_info = plane->frame_info;
> +	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> +	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
> +
> +	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp)
> +		plane->pixel_read(src_pixels, &out_pixels[x]);
>   }
>   
>   /*
> @@ -249,7 +224,7 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>   	}
>   }
>   
> -void *get_frame_to_line_function(u32 format)
> +void *get_pixel_conversion_function(u32 format)
>   {
>   	switch (format) {
>   	case DRM_FORMAT_ARGB8888:
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 43b7c1979018..c5b113495d0c 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,7 +5,7 @@
>   
>   #include "vkms_drv.h"
>   
> -void *get_frame_to_line_function(u32 format);
> +void *get_pixel_conversion_function(u32 format);
>   
>   void *get_line_to_frame_function(u32 format);
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index c41cec7dcb70..0a23875900ec 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -123,7 +123,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   	frame_info->offset = fb->offsets[0];
>   	frame_info->pitch = fb->pitches[0];
>   	frame_info->cpp = fb->format->cpp[0];
> -	vkms_plane_state->plane_read = get_frame_to_line_function(fmt);
> +	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
>   }
>   
>   static int vkms_plane_atomic_check(struct drm_plane *plane,
