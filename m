Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551E9990242
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C2810E9DA;
	Fri,  4 Oct 2024 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RN4aTHyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E976110E9D3;
 Fri,  4 Oct 2024 11:43:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D91AE0004;
 Fri,  4 Oct 2024 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35IOsAFxKDYMNKBLsITBusdoM8zjKFRYrPKlnrQgWzI=;
 b=RN4aTHyp4vy/ez4e7XXGPHmxUDi+vwj+N1lVFkbMxiPn9taXRG96XJ4Kd4ozYbTV8h9t+Z
 +TaIl1YSdgI3MUmOD2K5gl1OzGvPNqkZ82tbesbYS1tNZWrCR/S+VEmBBJWKQ+oNzUl9Zt
 KGSBorGzEw1tXFmKfJEh1yCY/EA1K/oZH7IypwUrnz7lMQSpz4p628JeStT+jikJoDmzvV
 HC1q5bmAYq7YpvCJ0t6AMLyTY5c3bhUu7OE+aMiEbavXAdJINWxBmdnu86HWhH/RJo6jff
 FjGuxPS1WulGohMcQj5OLiuxxCS7rC34+C6JthP94+eh8rqAGZ1Dy/MqUJvsDA==
Date: Fri, 4 Oct 2024 13:43:27 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 21/44] drm/vkms: Add tests for CTM handling
Message-ID: <Zv_U39fUBbG0fdEL@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-22-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-22-harry.wentland@amd.com>
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

On 03/10/24 - 16:01, Harry Wentland wrote:
> A whole slew of tests for CTM handling that greatly helped in
> debugging the CTM code. The extent of tests might seem a bit
> silly but they're fast and might someday help save someone
> else's day when debugging this.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> 
> v6:
>  - update reference values since we're now rounding
> 
> v5:
>  - Make apply_3x4_matrix static
> 
> v4:
>  - Comment on origin of bt709_enc matrix (Pekka)
>  - Use full opaque alpha (Pekka)
>  - Add additional check for Y < 0xffff (Pekka)
>  - Remove unused code (Pekka)
>  - Rename red, green, blue to Y, U, V where applicable
> 
>  drivers/gpu/drm/vkms/tests/vkms_color_test.c | 250 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c         |   3 +-
>  drivers/gpu/drm/vkms/vkms_composer.h         |   1 +
>  3 files changed, 253 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> index c36e67c7909e..d5eb1e4e9b67 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -187,11 +187,261 @@ static void vkms_color_srgb_inv_srgb(struct kunit *test)
>  	}
>  }
> 
> +#define FIXPT_HALF        (DRM_FIXED_ONE >> 1)
> +#define FIXPT_QUARTER     (DRM_FIXED_ONE >> 2)
> +
> +const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
> +	FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
> +	FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
> +	FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
> +} };
> +
> +static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
> +{
> +	struct pixel_argb_s32 ref, out;
> +
> +	/* full white */
> +	ref.a = 0xffff;
> +	ref.r = 0xffff;
> +	ref.g = 0xffff;
> +	ref.b = 0xffff;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* full black */
> +	ref.a = 0xffff;
> +	ref.r = 0x0;
> +	ref.g = 0x0;
> +	ref.b = 0x0;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* 50% grey */
> +	ref.a = 0xffff;
> +	ref.r = 0x8000;
> +	ref.g = 0x8000;
> +	ref.b = 0x8000;
> +
> +	memcpy(&out, &ref, sizeof(out));
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +
> +	/* full red to 50% desat */
> +	ref.a = 0xffff;
> +	ref.r = 0x8000;
> +	ref.g = 0x4000;
> +	ref.b = 0x4000;
> +
> +	out.a = 0xffff;
> +	out.r = 0xffff;
> +	out.g = 0x0;
> +	out.b = 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
> +
> +	KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
> +}
> +
> +/*
> + * BT.709 encoding matrix
> + *
> + * Values printed from within IGT when converting
> + * igt_matrix_3x4_bt709_enc to the fixed-point format expected
> + * by DRM/KMS.
> + */
> +const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
> +	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
> +	0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
> +	0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
> +} };
> +
> +static void vkms_color_ctm_3x4_bt709(struct kunit *test)
> +{
> +	struct pixel_argb_s32 out;
> +
> +	/* full white to bt709 */
> +	out.a = 0xffff;
> +	out.r = 0xffff;
> +	out.g = 0xffff;
> +	out.b = 0xffff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 255 */
> +	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x10000);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* full black to bt709 */
> +	out.a = 0xffff;
> +	out.r = 0x0;
> +	out.g = 0x0;
> +	out.b = 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 0 */
> +	KUNIT_EXPECT_LT(test, out.r, 0x100);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* gray to bt709 */
> +	out.a = 0xffff;
> +	out.r = 0x7fff;
> +	out.g = 0x7fff;
> +	out.b = 0x7fff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 127 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x7e00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x8000);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* == red 255 - bt709 enc == */
> +	out.a = 0xffff;
> +	out.r = 0xffff;
> +	out.g = 0x0;
> +	out.b = 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 54 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x3500);
> +	KUNIT_EXPECT_LT(test, out.r, 0x3700);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 157 */
> +	KUNIT_EXPECT_GT(test, out.b, 0x9C00);
> +	KUNIT_EXPECT_LT(test, out.b, 0x9E00);
> +
> +
> +	/* == green 255 - bt709 enc == */
> +	out.a = 0xffff;
> +	out.r = 0x0;
> +	out.g = 0xffff;
> +	out.b = 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 182 */
> +	KUNIT_EXPECT_GT(test, out.r, 0xB500);
> +	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x0100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* == blue 255 - bt709 enc == */
> +	out.a = 0xffff;
> +	out.r = 0x0;
> +	out.g = 0x0;
> +	out.b = 0xffff;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 18 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x1100);
> +	KUNIT_EXPECT_LT(test, out.r, 0x1300);
> +
> +	/* U 111 */
> +	KUNIT_EXPECT_GT(test, out.g, 0x6E00);
> +	KUNIT_EXPECT_LT(test, out.g, 0x7000);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x0100);
> +
> +	/* == red 140 - bt709 enc == */
> +	out.a = 0xffff;
> +	out.r = 0x8c8c;
> +	out.g = 0x0;
> +	out.b = 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x1D00);
> +	KUNIT_EXPECT_LT(test, out.r, 0x1F00);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
> +
> +	/* V 87 */
> +	KUNIT_EXPECT_GT(test, out.b, 0x5600);
> +	KUNIT_EXPECT_LT(test, out.b, 0x5800);
> +
> +	/* == green 140 - bt709 enc == */
> +	out.a = 0xffff;
> +	out.r = 0x0;
> +	out.g = 0x8c8c;
> +	out.b = 0x0;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x6400);
> +	KUNIT_EXPECT_LT(test, out.r, 0x6600);
> +
> +	/* U 0 */
> +	KUNIT_EXPECT_LT(test, out.g, 0x100);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
> +
> +
> +	/* == blue 140 - bt709 enc == */
> +	out.a = 0xffff;
> +	out.r = 0x0;
> +	out.g = 0x0;
> +	out.b = 0x8c8c;
> +
> +	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_enc);
> +
> +	/* Y 30 */
> +	KUNIT_EXPECT_GT(test, out.r, 0x900);
> +	KUNIT_EXPECT_LT(test, out.r, 0xB00);
> +
> +	/* U 61 */
> +	KUNIT_EXPECT_GT(test, out.g, 0x3C00);
> +	KUNIT_EXPECT_LT(test, out.g, 0x3E00);
> +
> +	/* V 0 */
> +	KUNIT_EXPECT_LT(test, out.b, 0x100);
> +
> +}
> +
>  static struct kunit_case vkms_color_test_cases[] = {
>  	KUNIT_CASE(vkms_color_test_get_lut_index),
>  	KUNIT_CASE(vkms_color_test_lerp),
>  	KUNIT_CASE(vkms_color_test_linear),
>  	KUNIT_CASE(vkms_color_srgb_inv_srgb),
> +	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
> +	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
>  	{}
>  };
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index c8b9b9d7f78f..daee7d56abb7 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,7 +159,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
> 
> -static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
> +VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
>  {
>  	s64 rf, gf, bf;
>  	s64 r, g, b;
> @@ -187,6 +187,7 @@ static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_colo
>  	pixel->g = drm_fixp2int_round(gf);
>  	pixel->b = drm_fixp2int_round(bf);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(apply_3x4_matrix);
> 
>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>  {
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> index 67ae09913460..afef65a5c3ba 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.h
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -21,6 +21,7 @@ u16 lerp_u16(u16 a, u16 b, s64 t);
>  s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
>  u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
>  			       enum lut_channel channel);
> +void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
>  #endif
> 
>  #endif /* _VKMS_COMPOSER_H_ */
> --
> 2.46.2
> 
