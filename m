Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41281AEB91A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0B810EA42;
	Fri, 27 Jun 2025 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fRGRLh9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3510EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZxTDbjevz/s8ed6JYDK5Hej6tuv/X5UfNcOppd24Ps=; b=fRGRLh9rhgiJ7CkPDYnIVzUZPv
 TqV3igLzmJGxwSzwOz0Ysrfu3Cjq27M4Lzc8vF6Q4auWy7GSYOSR5A75eObtFg3sB+WljG3DfyecN
 IZGzE3PFgBCCHOtp/XDePeNwfEJGuEHBYCp594PcAq3kxzTc2cJ555ceStOCv3NmZHgImRSHsgLl0
 TNWcwDCrI1tKFUBM7hNB2Von0tjkX+Ztr2Ka21pLhygJSxqtEucCbYY5tHVAMpjfspjdY1e8wz0CO
 U0ImxPRUbDIN+2lhdemX/W7xbEp4SKtevQf+f/1v/lpGTMtOuuUXSG/+nGzZ8spMxgfItnkP7ivvP
 Q51CuJiA==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uV9Ht-009Pxr-FX; Fri, 27 Jun 2025 15:38:41 +0200
Message-ID: <0f6d0cd2-8b1f-4401-87ef-9bc6f9eff720@igalia.com>
Date: Fri, 27 Jun 2025 10:38:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] drm/vkms: Change YUV helpers to support u16 inputs
 for conversion
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
 <20250627-b4-new-color-formats-v5-6-94452f119c72@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-6-94452f119c72@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Louis,

On 27/06/25 06:12, Louis Chauvet wrote:
> Some YUV format uses 16 bit values, so change the helper function for
> conversion to support those new formats.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>> ---
>   drivers/gpu/drm/vkms/tests/vkms_format_test.c | 139 +++++++++++++-------------
>   drivers/gpu/drm/vkms/vkms_formats.c           |  22 ++--
>   drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
>   3 files changed, 84 insertions(+), 81 deletions(-)
> 

[...]

>   
>   /*
> - * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
> + * vkms_format_test_yuv_u16_to_argb_u16 - Testing the conversion between YUV
>    * colors to ARGB colors in VKMS
>    *
>    * This test will use the functions get_conversion_matrix_to_argb_u16 and
>    * argb_u16_from_yuv888 to convert YUV colors (stored in

s/argb_u16_from_yuv888/argb_u16_from_yuv161616

> - * yuv_u8_to_argb_u16_cases) into ARGB colors.
> + * yuv_u16_to_argb_u16_cases) into ARGB colors.
>    *
>    * The conversion between YUV and RGB is not totally reversible, so there may be
>    * some difference between the expected value and the result.
>    * In addition, there may be some rounding error as the input color is 8 bits

 From what I understand the input color now is 16 bits as well. Please,
update the comment.

Sorry, I missed those nits in the first review. Apart from that,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

>    * and output color is 16 bits.
>    */
> -static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
> +static void vkms_format_test_yuv_u16_to_argb_u16(struct kunit *test)
>   {
> -	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
> +	const struct yuv_u16_to_argb_u16_case *param = test->param_value;
>   	struct pixel_argb_u16 argb;
>   
>   	for (size_t i = 0; i < param->n_colors; i++) {
> @@ -236,7 +236,8 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
>   		get_conversion_matrix_to_argb_u16
>   			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
>   
> -		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
> +		argb = argb_u16_from_yuv161616(&matrix, color->yuv.y, color->yuv.u,
> +					       color->yuv.v);
>   
>   		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 0x1ff,
>   				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
> @@ -253,19 +254,19 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
>   	}
>   }
>   
> -static void vkms_format_test_yuv_u8_to_argb_u16_case_desc(struct yuv_u8_to_argb_u16_case *t,
> -							  char *desc)
> +static void vkms_format_test_yuv_u16_to_argb_u16_case_desc(struct yuv_u16_to_argb_u16_case *t,
> +							   char *desc)
>   {
>   	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s - %s",
>   		 drm_get_color_encoding_name(t->encoding), drm_get_color_range_name(t->range));
>   }
>   
> -KUNIT_ARRAY_PARAM(yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_cases,
> -		  vkms_format_test_yuv_u8_to_argb_u16_case_desc
> +KUNIT_ARRAY_PARAM(yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_cases,
> +		  vkms_format_test_yuv_u16_to_argb_u16_case_desc
>   );
>   
>   static struct kunit_case vkms_format_test_cases[] = {
> -	KUNIT_CASE_PARAM(vkms_format_test_yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_gen_params),
> +	KUNIT_CASE_PARAM(vkms_format_test_yuv_u16_to_argb_u16, yuv_u16_to_argb_u16_gen_params),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 5b50e8622521..03eb73f4caef 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -269,16 +269,17 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
>   	return out_pixel;
>   }
>   
> -VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> -							    const struct conversion_matrix *matrix)
> +VISIBLE_IF_KUNIT
> +struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
> +					      u16 y, u16 channel_1, u16 channel_2)
>   {
>   	u16 r, g, b;
>   	s64 fp_y, fp_channel_1, fp_channel_2;
>   	s64 fp_r, fp_g, fp_b;
>   
> -	fp_y = drm_int2fixp(((int)y - matrix->y_offset) * 257);
> -	fp_channel_1 = drm_int2fixp(((int)channel_1 - 128) * 257);
> -	fp_channel_2 = drm_int2fixp(((int)channel_2 - 128) * 257);
> +	fp_y = drm_int2fixp((int)y - matrix->y_offset * 257);
> +	fp_channel_1 = drm_int2fixp((int)channel_1 - 128 * 257);
> +	fp_channel_2 = drm_int2fixp((int)channel_2 - 128 * 257);
>   
>   	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
>   	       drm_fixp_mul(matrix->matrix[0][1], fp_channel_1) +
> @@ -300,7 +301,7 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
>   
>   	return argb_u16_from_u16161616(0xffff, r, g, b);
>   }
> -EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
> +EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv161616);
>   
>   /**
>    * READ_LINE() - Generic generator for a read_line function which can be used for format with one
> @@ -492,8 +493,8 @@ static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int
>   	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
>   
>   	for (int i = 0; i < count; i++) {
> -		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
> -						  conversion_matrix);
> +		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
> +						     uv_plane[0] * 257, uv_plane[1] * 257);
>   		out_pixel += 1;
>   		y_plane += step_y;
>   		if ((i + subsampling_offset + 1) % subsampling == 0)
> @@ -537,8 +538,9 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
>   	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
>   
>   	for (int i = 0; i < count; i++) {
> -		*out_pixel = argb_u16_from_yuv888(*y_plane, *channel_1_plane, *channel_2_plane,
> -						  conversion_matrix);
> +		*out_pixel = argb_u16_from_yuv161616(conversion_matrix,
> +						     *y_plane * 257, *channel_1_plane * 257,
> +						     *channel_2_plane * 257);
>   		out_pixel += 1;
>   		y_plane += step_y;
>   		if ((i + subsampling_offset + 1) % subsampling == 0) {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index b4fe62ab9c65..eeb208cdd6b1 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -14,8 +14,8 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
>   				       struct conversion_matrix *matrix);
>   
>   #if IS_ENABLED(CONFIG_KUNIT)
> -struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> -					   const struct conversion_matrix *matrix);
> +struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
> +					      u16 y, u16 channel_1, u16 channel_2);
>   #endif
>   
>   #endif /* _VKMS_FORMATS_H_ */
> 

