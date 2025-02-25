Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86983A43D4B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E524510E628;
	Tue, 25 Feb 2025 11:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iPJRcUFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A0E10E621;
 Tue, 25 Feb 2025 11:19:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 968E1431BA;
 Tue, 25 Feb 2025 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740482390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCydCBho4iXsxX99Uhg4iYALrVCECn/VH1BaLmL4QoA=;
 b=iPJRcUFtEAEGxqnVGOpa/5ChsOU2YgiBDApb4Mn0IcBKJPT9V9M2YLa4mAiRCstt8yP7o0
 dZARKKYqNsztIhcnNyzTxUZj6yJdeyO5c/jFT4pt3bGkDp3eEI3pAvEXlUq9Iof6bHytku
 idALbH7VL7N4y5MnyjnB/aKE30zDzaopIUgOZm7dTG8izG6EPal/hBCYO9ozouMUCycZBz
 BcDdr/qFSuIOXKECK9e9kL05o9O86tFiholl+aQe4OyZtnfBtFaYxnZ0iZqtCQ3l2wV5Iz
 MRfr0DzFaiGP6FwDzZFDTb0Yq09e0zOPeaAoUfBzynXBu6GOo7tQfS3t+xEUCQ==
Date: Tue, 25 Feb 2025 12:19:48 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 15/45] drm/vkms: Add kunit tests for linear and sRGB LUTs
Message-ID: <cf3528d1-9e56-4fe2-beb1-de7cb9c172f3@bootlin.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-16-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220043410.416867-16-alex.hung@amd.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghlvgigrdhhuhhnghesrghmugdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeifrgihlhgrnhguqdguvghvv
 ghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohephhgrrhhrhidrfigvnhhtlhgrnhgusegrmhgurdgtohhm
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



Le 20/12/2024 à 05:33, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Two tests are added to VKMS LUT handling:
> - linear
> - inv_srgb
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v7:
>   - Fix checkpatch warnings (Louis Chauvet)
>    - Adde a commit messages
>    - Fix code styles by adding and removing spaces (new lines, tabs and so on)
> 
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c | 39 +++++++++++++++++++-
>   drivers/gpu/drm/vkms/vkms_composer.c         | 17 ++-------
>   drivers/gpu/drm/vkms/vkms_composer.h         | 13 +++++++
>   3 files changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> index b53beaac2703..d765c5eb5d88 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_mode.h>
>   #include "../vkms_drv.h"
>   #include "../vkms_composer.h"
> +#include "../vkms_luts.h"
>   
>   #define TEST_LUT_SIZE 16
>   
> @@ -36,7 +37,6 @@ static const struct vkms_color_lut test_linear_lut = {
>   	.channel_value2index_ratio = 0xf000fll
>   };
>   
> -
>   static void vkms_color_test_get_lut_index(struct kunit *test)
>   {
>   	s64 lut_index;
> @@ -49,6 +49,19 @@ static void vkms_color_test_get_lut_index(struct kunit *test)
>   		lut_index = get_lut_index(&test_linear_lut, test_linear_array[i].red);
>   		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(lut_index), i);
>   	}
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

Did you see the kernel bot warning? I think you can simply add 
EXPORT_SYMBOL_IF_KUNIT(srgb_eotf) in vkms_lut.h.

>   }
>   
>   static void vkms_color_test_lerp(struct kunit *test)
> @@ -155,9 +168,33 @@ static void vkms_color_test_lerp(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
>   }
>   
> +static void vkms_color_test_linear(struct kunit *test)
> +{
> +	for (int i = 0; i < LUT_SIZE; i++) {
> +		int linear = apply_lut_to_channel_value(&linear_eotf, i * 0x101, LUT_RED);
> +
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
> +		KUNIT_EXPECT_GE(test, final / 0x101, i - 1);
> +		KUNIT_EXPECT_LE(test, final / 0x101, i + 1);
> +	}
> +}
> +
>   static struct kunit_case vkms_color_test_cases[] = {
>   	KUNIT_CASE(vkms_color_test_get_lut_index),
>   	KUNIT_CASE(vkms_color_test_lerp),
> +	KUNIT_CASE(vkms_color_test_linear),
> +	KUNIT_CASE(vkms_color_srgb_inv_srgb),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 983654540ee5..ee3cfe153d8f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -113,19 +113,8 @@ VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel
>   }
>   EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
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
> -				      enum lut_channel channel)
> +VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
> +						enum lut_channel channel)
>   {
>   	s64 lut_index = get_lut_index(lut, channel_value);
>   	u16 *floor_lut_value, *ceil_lut_value;
> @@ -150,6 +139,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>   	return lerp_u16(floor_channel_value, ceil_channel_value,
>   			lut_index & DRM_FIXED_DECIMAL_MASK);
>   }
> +EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
> +
>   
>   static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
>   {
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> index 9316a053e7d7..67ae09913460 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.h
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -5,9 +5,22 @@
>   
>   #include <kunit/visibility.h>
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
>   #if IS_ENABLED(CONFIG_KUNIT)
>   u16 lerp_u16(u16 a, u16 b, s64 t);
>   s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
> +u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
> +			       enum lut_channel channel);
>   #endif
>   
>   #endif /* _VKMS_COMPOSER_H_ */

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

