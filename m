Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A209C6FFA9B
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAD110E5F3;
	Thu, 11 May 2023 19:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A17510E5F3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 19:41:28 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QHMhl6XKrz9sYt;
 Thu, 11 May 2023 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1683834088; bh=4h8Ra9CR8xjr0wCe3vaijr9yKD8rR42rteBbonIOJH4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lWS2UVHEQKkYK3c6wB+5tjgBISYPIOFeP7z9GCYwDf8LUOy3Y575lhB8melvFpeqq
 9TpppE9k+Aq6zgn6pEOOIHVbOjvfh+DLjAfBRnWu9ML0zSiVl0OL3sKQgb5Jc7jtyL
 6LDWA7lL5f6egBZvu7hElTcHmXqfSkmwZ5HlMvcQ=
X-Riseup-User-ID: 02092D3560BB1E5D5E5C649D56A3E80E69179BF3F63A6D204A6B53A6767813E5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QHMhj3SpvzFqgX;
 Thu, 11 May 2023 19:41:25 +0000 (UTC)
Message-ID: <87fb8f63-ae38-33eb-08ef-7410b52b4f98@riseup.net>
Date: Thu, 11 May 2023 16:41:23 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/vkms: Fix RGB565 pixel conversion
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230507202848.207608-1-mcanal@igalia.com>
 <20230507202848.207608-2-mcanal@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <20230507202848.207608-2-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8
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



On 07/05/23 17:28, Maíra Canal wrote:
> Currently, the pixel conversion isn't rounding the fixed-point values
> before assigning it to the RGB coefficients, which is causing the IGT
> pixel-format tests to fail. So, use the drm_fixp2int_round() fixed-point
> helper to round the values when assigning it to the RGB coefficients.
> 
> Tested with igt@kms_plane@pixel-format and igt@kms_plane@pixel-format-source-clamping.
> 
> Fixes: 89b03aeaef16 ("drm/vkms: fix 32bit compilation error by replacing macros")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20230425153353.238844-1-mcanal@igalia.com/T/
> 
> * Use drm_fixp2int_round() to fix the pixel conversion instead of casting
>   the values to s32 (Melissa Wen).
> 
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 8d948c73741e..b11342026485 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -97,9 +97,9 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>  
>  	out_pixel->a = (u16)0xffff;
> -	out_pixel->r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> -	out_pixel->g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> -	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> +	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> +	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>  }
>  
>  void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> @@ -216,9 +216,9 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>  		s64 fp_g = drm_int2fixp(in_pixels[x].g);
>  		s64 fp_b = drm_int2fixp(in_pixels[x].b);
>  
> -		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
> -		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> -		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> +		u16 r = drm_fixp2int_round(drm_fixp_div(fp_r, fp_rb_ratio));
> +		u16 g = drm_fixp2int_round(drm_fixp_div(fp_g, fp_g_ratio));
> +		u16 b = drm_fixp2int_round(drm_fixp_div(fp_b, fp_rb_ratio));
>  
>  		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
>  	}
