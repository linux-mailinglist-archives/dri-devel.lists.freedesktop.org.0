Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF999024A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5967710E9E6;
	Fri,  4 Oct 2024 11:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XbgUmWNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC56410E9D0;
 Fri,  4 Oct 2024 11:43:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69A8E40002;
 Fri,  4 Oct 2024 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IFd++HRTwyxcJDhWil0PVxY+hT5Tc0F5JJCFAR4sl+o=;
 b=XbgUmWNW/K6PwXjt0FWa8CBzc0cHGCPy9meG5SdypR9dMIgoo4iKyClDenvY8uDPXtiRzU
 e3TgFKARSoU/VXw17eEdszwzEaajh30tFGQmpPiFd1I1/qtZhF/tNAUa2U55axIukOWQ0H
 E0aqaXKc3WRZXAMGCKIjunHjJebTtx42zQ3UcJxPsF7hru8pErw78DiENMJZR+yVk0T/aM
 oIFqswQvEI9yvvE357Gq/UGfnLjUVNCpX9epnfpgIrnCvMYPq4xpwc0ed0M0MlOj1wvK/G
 3k9S4t4PWdNMDnOJjU82kGX1NDrQkdvSZWtmqaXh9HZys/j8fnYC6cMgmf5ZPg==
Date: Fri, 4 Oct 2024 13:43:30 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 15/44] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <Zv_U4iN2Dofjk5s-@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-16-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-16-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 03/10/24 - 16:00, Harry Wentland wrote:

checkpatch: commit description - Add an appropriate one

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_color_test.c | 38 +++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_composer.c         | 15 ++------
>  drivers/gpu/drm/vkms/vkms_composer.h         | 13 +++++++
>  3 files changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> index efe139978860..c36e67c7909e 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_mode.h>
>  #include "../vkms_drv.h"
>  #include "../vkms_composer.h"
> +#include "../vkms_luts.h"
>  
>  #define TEST_LUT_SIZE 16
>  
> @@ -36,7 +37,6 @@ const struct vkms_color_lut test_linear_lut = {
>  	.channel_value2index_ratio = 0xf000fll
>  };
>  
> -
>  static void vkms_color_test_get_lut_index(struct kunit *test)
>  {
>  	int i;
> @@ -45,6 +45,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
>  
>  	for (i = 0; i < TEST_LUT_SIZE; i++)
>  		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_eotf, 0x0)), 0x0);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x0)), 0x0);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x101)), 0x1);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0x202)), 0x2);
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x0)), 0x0);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x101)), 0x1);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_inv_eotf, 0x202)), 0x2);
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xfefe)), 0xfe);
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&srgb_eotf, 0xffff)), 0xff);
>  }
>  
>  static void vkms_color_test_lerp(struct kunit *test)
> @@ -153,9 +166,32 @@ static void vkms_color_test_lerp(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
>  }
>  
> +static void vkms_color_test_linear(struct kunit *test)
> +{
> +	for (int i = 0; i < LUT_SIZE; i++) {
> +		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);

checkpatch: Missing a blank line after declarations

> +		KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(linear, 0x101), i);
> +	}
> +}
> +
> +static void vkms_color_srgb_inv_srgb(struct kunit *test)
> +{
> +	u16 srgb, final;
> +
> +	for (int i = 0; i < LUT_SIZE; i++) {
> +		srgb = apply_lut_to_channel_value(&srgb_eotf, i * 0x101, LUT_RED);
> +		final = apply_lut_to_channel_value(&srgb_inv_eotf, srgb, LUT_RED);
> +
> +		KUNIT_EXPECT_GE(test, final / 0x101, i-1);
> +		KUNIT_EXPECT_LE(test, final / 0x101, i+1);

checkpatch: spaces preferred around that '-/+' (ctx:VxV)

> +	}
> +}
> +
>  static struct kunit_case vkms_color_test_cases[] = {
>  	KUNIT_CASE(vkms_color_test_get_lut_index),
>  	KUNIT_CASE(vkms_color_test_lerp),
> +	KUNIT_CASE(vkms_color_test_linear),
> +	KUNIT_CASE(vkms_color_srgb_inv_srgb),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index a35466e68237..b4aaad2bf45f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -113,18 +113,7 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
>  }
>  EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
>  
> -/*
> - * This enum is related to the positions of the variables inside
> - * `struct drm_color_lut`, so the order of both needs to be the same.
> - */
> -enum lut_channel {
> -	LUT_RED = 0,
> -	LUT_GREEN,
> -	LUT_BLUE,
> -	LUT_RESERVED
> -};
> -
> -static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
> +VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
>  				      enum lut_channel channel)

checkpatch: Alignment should match open parenthesis

>  {
>  	s64 lut_index = get_lut_index(lut, channel_value);
> @@ -150,6 +139,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>  	return lerp_u16(floor_channel_value, ceil_channel_value,
>  			lut_index & DRM_FIXED_DECIMAL_MASK);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
> +
>  
>  static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
>  {
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> index 9316a053e7d7..67ae09913460 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.h
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -5,9 +5,22 @@
>  
>  #include <kunit/visibility.h>
>  
> +/*
> + * This enum is related to the positions of the variables inside
> + * `struct drm_color_lut`, so the order of both needs to be the same.
> + */
> +enum lut_channel {
> +	LUT_RED = 0,
> +	LUT_GREEN,
> +	LUT_BLUE,
> +	LUT_RESERVED
> +};
> +

Can you declare this enum here in your previous patch, so you don't have 
to move it here?

With or without this and the checkpatch warning fixed:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

>  #if IS_ENABLED(CONFIG_KUNIT)
>  u16 lerp_u16(u16 a, u16 b, s64 t);
>  s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
> +u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
> +			       enum lut_channel channel);
>  #endif
>  
>  #endif /* _VKMS_COMPOSER_H_ */
> -- 
> 2.46.2
> 
