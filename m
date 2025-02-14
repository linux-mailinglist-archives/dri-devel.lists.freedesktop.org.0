Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AAFA35B9D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2D710E230;
	Fri, 14 Feb 2025 10:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SZ5HfWC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9110A10E230
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739529306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSZbvcQYo0JTBGlMdXOMglRx59ps87sk4nj9PMwU+5g=;
 b=SZ5HfWC1FRNuv/64DetIfe6Puczxs71muA4eR4pNtmpAbs+rUxAMcn1PvhrtWN68gnfEN6
 5uayNpzmKYS5fGqnbQ4zzWZXewgTU7Xr+WJrFXDc4oraFkRjAfmVMGepNfr44F7hX5k7fQ
 TszGw3L4AgMzFsAq5kzgBfRJIJHfuWM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-HKoX9hS3Nbmjlpj5GbtCpA-1; Fri, 14 Feb 2025 05:35:04 -0500
X-MC-Unique: HKoX9hS3Nbmjlpj5GbtCpA-1
X-Mimecast-MFC-AGG-ID: HKoX9hS3Nbmjlpj5GbtCpA_1739529304
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43935bcec0aso15559015e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739529303; x=1740134103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wSZbvcQYo0JTBGlMdXOMglRx59ps87sk4nj9PMwU+5g=;
 b=Lf1/DmaYGDy4vVeFr7pi33g2gZkb7FdHjFnp5D8sOAom46q6CYG5K+N078ChlmE4oa
 4pTa7vXmEPwIK7W30xTuEzmyjEShHRJvsM9V0scWtuPOrI8m6LNTC9QNIpSx1sMuiSLe
 e04e8kQuU9tN+lH0ImJTQHIK5BK/MeKN2coArcXYrNitb22M4zw/OOILn8sFyZl3ZA1Q
 oin+VAHuxC/gVAWbdny2BltFsNGlRXOeMA7w21FD5Jp5z8WVOU+goLm4ZneJgUFThPNp
 1/MSYFOWulCI6QKwtOE9yR0d+NqJgv6Srsj+YS7yEFQikCLhAC5GperXHY9CGC+FSH56
 WNHw==
X-Gm-Message-State: AOJu0YyI6v6pBimFdUjxQIrupq1yU7xkhJirLxprB5y0CZfXbucbBE3O
 LMkRztrr+p8XMdLzOMVmDJm6OSHYjJ5w5GvbTofIzf77JIKhd8DgoRlGsd+8DPocPgcOeGX8s2S
 c8QQZbl+ogkiT7NBm/NfvF487mSaY8kJ8CXZfodxT4dzI0AgzwAc0PGtBogtXkPOy7Q==
X-Gm-Gg: ASbGncvegkE0u2DFKJV2ynwS+duVivo9FZwFunRSCiPxV1mXRhg7oHjwxFdee/MceAM
 ND6U75WGsVtO5PDqy2HdVgADJ1lrBafnnrYTWtlju/KATt6jtpBR3f1V52BQvnM5LH6oUHgo3Rk
 /BA1nvZfwVo7EkcFiUvMVA2WC0sNZfCgEYQSMScIU171LUVJU7EA69OCCKwCNEu+Js2mDvwZYW7
 fFao/zzsIFMYGdIsHQ/DdyfuqyRp/Wq22ZDpnLiQ9kah2Rc7uoaEhjuIefMWzjDnEKKHS00sx3i
 oZwfe/a2A0s2Dpu/Q+C2dh/fy5tM+/hlRFj8XrUBmd6y
X-Received: by 2002:a05:600c:1c15:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-43960190d1emr96678005e9.13.1739529303437; 
 Fri, 14 Feb 2025 02:35:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhFM52iHa8/u1VRmRpReM5OhvCEC9hy1LW/FAnmlbL47MuIWhciWY5xYvNqGp5/+0y9SexSg==
X-Received: by 2002:a05:600c:1c15:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-43960190d1emr96677415e9.13.1739529302956; 
 Fri, 14 Feb 2025 02:35:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccd51sm4264290f8f.29.2025.02.14.02.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 02:35:02 -0800 (PST)
Message-ID: <02c2167a-9d86-4660-bf96-8de6b5f48c8e@redhat.com>
Date: Fri, 14 Feb 2025 11:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/ast: cursor: Move format conversion to shared
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250213163845.118207-1-tzimmermann@suse.de>
 <20250213163845.118207-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250213163845.118207-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _C9NJ6Ek3_rkTrK3CEQTHxpeLh4PYDeLC_v5KpzQJIw_1739529304
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13/02/2025 17:25, Thomas Zimmermann wrote:
> User-space cursor-image data is encoded in ARBG8888, while hardware
> supports ARGB4444. Implement the format conversion as part of the
> format-helper framework, so that other drivers can benefit.
> 
> This allows to respect the damage area of the cursor update. In
> previous code, all cursor image data had to be converted on each
> update. Now, only the changed areas require an update. The hardware
> image is always updated completely, as it is required for the
> checksum update.

Hum, for a 64x64 cursor size, I don't see much benefit to handle damage 
area (And I'm not sure userspace actually change only parts of the cursor).

> 
> The format-conversion helper still contains the old implementation's
> optimization of writing 2 output pixels at the same time.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.h       |  4 +-
>   drivers/gpu/drm/ast/ast_mode.c      | 71 +++++++----------------------
>   drivers/gpu/drm/drm_format_helper.c | 69 ++++++++++++++++++++++++++++
>   include/drm/drm_format_helper.h     |  3 ++
>   4 files changed, 92 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index d3115b31b032..973abd0cbd42 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -113,7 +113,9 @@ enum ast_config_mode {
>   #define AST_MAX_HWC_WIDTH	64
>   #define AST_MAX_HWC_HEIGHT	64
>   
> -#define AST_HWC_SIZE		(AST_MAX_HWC_WIDTH * AST_MAX_HWC_HEIGHT * 2)
> +#define AST_HWC_PITCH		(AST_MAX_HWC_WIDTH * SZ_2)
> +#define AST_HWC_SIZE		(AST_MAX_HWC_HEIGHT * AST_HWC_PITCH)
> +
>   #define AST_HWC_SIGNATURE_SIZE	32
>   
>   /* define for signature structure */
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 974f4eb46bc3..ed00275d6418 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -657,61 +657,16 @@ static u32 ast_cursor_calculate_checksum(const u8 *src, unsigned int width, unsi
>   	return csum;
>   }
>   
> -static void ast_update_cursor_image(u8 __iomem *dst, const u8 *src, u8 *tmp, int width, int height)
> +static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
> +				 unsigned int width, unsigned int height)
>   {
> -	union {
> -		u32 ul;
> -		u8 b[4];
> -	} srcdata32[2], data32;
> -	union {
> -		u16 us;
> -		u8 b[2];
> -	} data16;
> +	u8 __iomem *dst = ast->cursor_plane.base.vaddr;
>   	u32 csum = 0;
> -	s32 alpha_dst_delta, last_alpha_dst_delta;
> -	u8 *dstxor;
> -	const u8 *srcxor;
> -	int i, j;
> -	u32 per_pixel_copy, two_pixel_copy;
>   
> -	alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
> -	last_alpha_dst_delta = alpha_dst_delta - (width << 1);
> -
> -	srcxor = src;
> -	dstxor = tmp + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - height) * alpha_dst_delta;
> -	per_pixel_copy = width & 1;
> -	two_pixel_copy = width >> 1;
> -
> -	for (j = 0; j < height; j++) {
> -		for (i = 0; i < two_pixel_copy; i++) {
> -			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
> -			srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
> -			data32.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
> -			data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
> -			data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
> -			data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
> -			memcpy(dstxor, &data32, 4);
> -
> -			dstxor += 4;
> -			srcxor += 8;
> -		}
> -
> -		for (i = 0; i < per_pixel_copy; i++) {
> -			srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
> -			data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
> -			data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
> -			memcpy(dstxor, &data16, 2);
> -
> -			dstxor += 2;
> -			srcxor += 4;
> -		}
> -		dstxor += last_alpha_dst_delta;
> -	}
> -
> -	csum = ast_cursor_calculate_checksum(tmp, width, height);
> +	csum = ast_cursor_calculate_checksum(src, width, height);
>   
>   	/* write pixel data */
> -	memcpy_toio(dst, tmp, AST_HWC_SIZE);
> +	memcpy_toio(dst, src, AST_HWC_SIZE);
>   
>   	/* write checksum + signature */
>   	dst += AST_HWC_SIZE;
> @@ -800,9 +755,7 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   	struct drm_framebuffer *fb = plane_state->fb;
>   	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>   	struct ast_device *ast = to_ast_device(plane->dev);
> -	struct iosys_map src_map = shadow_plane_state->data[0];
>   	struct drm_rect damage;
> -	const u8 *src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
>   	u64 dst_off = ast_plane->offset;
>   	u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping abstraction properly */
>   	u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
> @@ -816,8 +769,18 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   	 */
>   
>   	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
> -		ast_update_cursor_image(dst, src, ast_cursor_plane->argb4444,
> -					fb->width, fb->height);
> +		u8 *argb4444 = ast_cursor_plane->argb4444;
> +		struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
> +			IOSYS_MAP_INIT_VADDR(argb4444),
> +		};
> +		unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> +			AST_HWC_PITCH,
> +		};
> +
> +		drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
> +					    shadow_plane_state->data, fb, &damage,
> +					    &shadow_plane_state->fmtcnv_state);
> +		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
>   		ast_set_cursor_base(ast, dst_off);
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b1be458ed4dd..ecb278b63e8c 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -978,6 +978,75 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
>   }
>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>   
> +static void drm_fb_argb8888_to_argb4444_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +{
> +	unsigned int pixels2 = pixels & ~GENMASK_ULL(0, 0);
> +	__le32 *dbuf32 = dbuf;
> +	__le16 *dbuf16 = dbuf + pixels2 * sizeof(*dbuf16);
> +	const __le32 *sbuf32 = sbuf;
> +	unsigned int x;
> +	u32 val32;
> +	u16 val16;
> +	u32 pix[2];
> +
> +	for (x = 0; x < pixels2; x += 2, ++dbuf32) {
> +		pix[0] = le32_to_cpu(sbuf32[x]);
> +		pix[1] = le32_to_cpu(sbuf32[x + 1]);
> +		val32 = ((pix[0] & 0xf0000000) >> 16) |
> +			((pix[0] & 0x00f00000) >> 12) |
> +			((pix[0] & 0x0000f000) >> 8) |
> +			((pix[0] & 0x000000f0) >> 4) |
> +			((pix[1] & 0xf0000000) >> 0) |
> +			((pix[1] & 0x00f00000) << 4) |
> +			((pix[1] & 0x0000f000) << 8) |
> +			((pix[1] & 0x000000f0) << 12);
> +		*dbuf32 = cpu_to_le32(val32);
> +	}
> +	for (; x < pixels; x++) {
> +		pix[0] = le32_to_cpu(sbuf32[x]);
> +		val16 = ((pix[0] & 0xf0000000) >> 16) |
> +			((pix[0] & 0x00f00000) >> 12) |
> +			((pix[0] & 0x0000f000) >> 8) |
> +			((pix[0] & 0x000000f0) >> 4);
> +		dbuf16[x] = cpu_to_le16(val16);
> +	}
> +}
> +
> +/**
> + * drm_fb_argb8888_to_argb4444 - Convert ARGB8888 to ARGB4444 clip buffer
> + * @dst: Array of ARGB4444 destination buffers
> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
> + *             within @dst; can be NULL if scanlines are stored next to each other.
> + * @src: Array of ARGB8888 source buffer
> + * @fb: DRM framebuffer
> + * @clip: Clip rectangle area to copy
> + * @state: Transform and conversion state
> + *
> + * This function copies parts of a framebuffer to display memory and converts
> + * the color format during the process. The parameters @dst, @dst_pitch and
> + * @src refer to arrays. Each array must have at least as many entries as
> + * there are planes in @fb's format. Each entry stores the value for the
> + * format's respective color plane at the same index.
> + *
> + * This function does not apply clipping on @dst (i.e. the destination is at the
> + * top-left corner).
> + *
> + * Drivers can use this function for ARGB4444 devices that don't support
> + * ARGB8888 natively.
> + */
> +void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state)
> +{
> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		2,
> +	};
> +
> +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
> +		    drm_fb_argb8888_to_argb4444_line);
> +}
> +EXPORT_SYMBOL(drm_fb_argb8888_to_argb4444);
> +
>   /**
>    * drm_fb_blit - Copy parts of a framebuffer to display memory
>    * @dst:	Array of display-memory addresses to copy to
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 428d81afe215..a1347e47e9d5 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -110,6 +110,9 @@ void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *d
>   void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
>   			      const struct iosys_map *src, const struct drm_framebuffer *fb,
>   			      const struct drm_rect *clip, struct drm_format_conv_state *state);
> +void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_pitch,
> +				 const struct iosys_map *src, const struct drm_framebuffer *fb,
> +				 const struct drm_rect *clip, struct drm_format_conv_state *state);
>   
>   int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
>   		const struct iosys_map *src, const struct drm_framebuffer *fb,

