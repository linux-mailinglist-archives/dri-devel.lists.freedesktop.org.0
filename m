Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73D6F93DB
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 21:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375E910E0DB;
	Sat,  6 May 2023 19:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D758710E0DB
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6sp13KUa7bLmK1eNYCLJZqAycaYhFRegShwFazVhtNc=; b=XzyFVbdXOPq01/tklYYTs2dxt5
 NlDbAIXpGEiNNhUrCvLCycRX8AlELTkhuqzctfv7AG6O6jMowCKCx5hds8wnsblwxPzvz4mCNH+CI
 pl6BWQXFITpUzpqUFisJJqxFwHM3d6wbPP6uVhipX8q8ChQ9/29d6Vhk1nu2PLMzGynTYVwUJQs7R
 ONFFb90Xh1uVoE38FCYZ5mdPCUgLJbZ0/B3RJtb9/EwBUw7ZiqnE5EBvEFB2NU/5n/WhArJE3La0a
 bxj3nvqevCMZkUDXB2qLBcoubPtXATSfnzL65IFUVYFj/IzM0cnkR/wlqp5tLg6QSmmzp9in+Uylb
 J+uz05yw==;
Received: from [38.44.72.37] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pvNop-002jXk-4N; Sat, 06 May 2023 21:43:47 +0200
Message-ID: <71c2c2ec-81d1-f46a-eb40-1b273740de6e@igalia.com>
Date: Sat, 6 May 2023 18:43:45 -0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH] drm/vkms: Fix RGB565 pixel conversion
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
References: <20230425153353.238844-1-mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20230425153353.238844-1-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/25, Maíra Canal wrote:
> Perform the correct casting of the intermediate coefficients of the
> RGB565 pixel conversion. Currently, the pixel conversion is using s64
> for the intermediate coefficients, which is causing the IGT pixel-format
> tests to fail. So, cast the operands to s32 in order to improve the
> vkms' test coverage.
> 
> Tested with igt@kms_plane@pixel-format and igt@kms_plane@pixel-format-source-clamping.
> 
> Fixes: 89b03aeaef16 ("drm/vkms: fix 32bit compilation error by replacing macros")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 8d948c73741e..f6aeaea81902 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -88,8 +88,8 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  {
>  	u16 *pixels = (u16 *)src_pixels;
>  
> -	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> -	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> +	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> +	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>  
>  	u16 rgb_565 = le16_to_cpu(*pixels);
>  	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> @@ -97,9 +97,9 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>  	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>  
>  	out_pixel->a = (u16)0xffff;
> -	out_pixel->r = drm_fixp2int(drm_fixp_mul(fp_r, fp_rb_ratio));
> -	out_pixel->g = drm_fixp2int(drm_fixp_mul(fp_g, fp_g_ratio));
> -	out_pixel->b = drm_fixp2int(drm_fixp_mul(fp_b, fp_rb_ratio));
> +	out_pixel->r = drm_fixp2int((s32)drm_fixp_mul(fp_r, fp_rb_ratio));
> +	out_pixel->g = drm_fixp2int((s32)drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel->b = drm_fixp2int((s32)drm_fixp_mul(fp_b, fp_rb_ratio));

Hi Maíra,

First, good catch!

Instead of all casting, wouldn't it be better to implement a rounding
operation or something like drm_fixp2int_round()?

Thanks,

Melissa

>  }
>  
>  void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> @@ -208,17 +208,17 @@ static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
>  	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>  			    src_buffer->n_pixels);
>  
> -	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> -	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> +	s32 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> +	s32 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>  
>  	for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
>  		s64 fp_r = drm_int2fixp(in_pixels[x].r);
>  		s64 fp_g = drm_int2fixp(in_pixels[x].g);
>  		s64 fp_b = drm_int2fixp(in_pixels[x].b);
>  
> -		u16 r = drm_fixp2int(drm_fixp_div(fp_r, fp_rb_ratio));
> -		u16 g = drm_fixp2int(drm_fixp_div(fp_g, fp_g_ratio));
> -		u16 b = drm_fixp2int(drm_fixp_div(fp_b, fp_rb_ratio));
> +		u16 r = drm_fixp2int((s32)drm_fixp_div(fp_r, fp_rb_ratio));
> +		u16 g = drm_fixp2int((s32)drm_fixp_div(fp_g, fp_g_ratio));
> +		u16 b = drm_fixp2int((s32)drm_fixp_div(fp_b, fp_rb_ratio));
>  
>  		*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
>  	}
> -- 
> 2.40.0
> 
