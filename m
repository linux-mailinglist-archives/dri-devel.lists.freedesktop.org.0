Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E45B0DEF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A780010E86C;
	Wed,  7 Sep 2022 20:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799010E869
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 20:16:50 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MND762HtxzDr3j;
 Wed,  7 Sep 2022 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662581810; bh=9qIcTND5cT/EIpbk+0chuOdrUjTJL+38/HlaCx4oJGk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YdWFKkv8RsfEMydlk71bEArMi1AKNpaxG+m3tqeNjNsmq7ZiBabDScOxOjPwLCjL6
 CllS0icY60vhUbdfeB5yOAMnPhj+zmVnsjcLzUWvihX8Ns+YDJ3/LPvISvCIp7g82M
 J3AHlQKwReIyey+UR9vOSw+GwL1IA907G/PT1HHY=
X-Riseup-User-ID: 3C0A5809B011FE53554C2DDF85C3F2113B8CA35B6120ED10D99795034E014EEA
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MND734Q2Zz5vh4;
 Wed,  7 Sep 2022 20:16:47 +0000 (UTC)
Message-ID: <ef8a064a-99f9-7619-62fa-27b8006f3fdf@riseup.net>
Date: Wed, 7 Sep 2022 17:16:44 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] drm/plane_helper: Print actual/expected values on
 failure
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220905183223.390891-1-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220905183223.390891-1-michal.winiarski@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 15:32, Michał Winiarski wrote:
> Currently the values are printed with debug log level.
> Adjust the log level and link the output with the test by using kunit_err.
> 
> Example output:
> foo: dst: 20x20+10+10, expected: 10x10+0+0
> foo: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_plane_helper_test.c:85
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_plane_helper_test.c | 78 +++++++++++--------
>  1 file changed, 44 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
> index be6cff0020ed..0bbd42d2d37b 100644
> --- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_rect.h>
>  
>  static void set_src(struct drm_plane_state *plane_state,
>  		    unsigned int src_x, unsigned int src_y,
> @@ -21,26 +22,32 @@ static void set_src(struct drm_plane_state *plane_state,
>  	plane_state->src_h = src_h;
>  }
>  
> -static bool check_src_eq(struct drm_plane_state *plane_state,
> +static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
>  			 unsigned int src_x, unsigned int src_y,
>  			 unsigned int src_w, unsigned int src_h)
>  {
> +	struct drm_rect expected = DRM_RECT_INIT(src_x, src_y, src_w, src_h);
> +
>  	if (plane_state->src.x1 < 0) {
> -		pr_err("src x coordinate %x should never be below 0.\n", plane_state->src.x1);
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> +		kunit_err(test,
> +			  "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
> +			  plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
>  		return false;
>  	}
>  	if (plane_state->src.y1 < 0) {
> -		pr_err("src y coordinate %x should never be below 0.\n", plane_state->src.y1);
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> +		kunit_err(test,
> +			  "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
> +			  plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
>  		return false;
>  	}
>  
> -	if (plane_state->src.x1 != src_x ||
> -	    plane_state->src.y1 != src_y ||
> -	    drm_rect_width(&plane_state->src) != src_w ||
> -	    drm_rect_height(&plane_state->src) != src_h) {
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> +	if (plane_state->src.x1 != expected.x1 ||
> +	    plane_state->src.y1 != expected.y1 ||
> +	    drm_rect_width(&plane_state->src) != drm_rect_width(&expected) ||
> +	    drm_rect_height(&plane_state->src) != drm_rect_height(&expected)) {
> +		kunit_err(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> +			  DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> +
>  		return false;
>  	}
>  
> @@ -57,15 +64,18 @@ static void set_crtc(struct drm_plane_state *plane_state,
>  	plane_state->crtc_h = crtc_h;
>  }
>  
> -static bool check_crtc_eq(struct drm_plane_state *plane_state,
> +static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
>  			  int crtc_x, int crtc_y,
>  			  unsigned int crtc_w, unsigned int crtc_h)
>  {
> -	if (plane_state->dst.x1 != crtc_x ||
> -	    plane_state->dst.y1 != crtc_y ||
> -	    drm_rect_width(&plane_state->dst) != crtc_w ||
> -	    drm_rect_height(&plane_state->dst) != crtc_h) {
> -		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> +	struct drm_rect expected = DRM_RECT_INIT(crtc_x, crtc_y, crtc_w, crtc_h);
> +
> +	if (plane_state->dst.x1 != expected.x1 ||
> +	    plane_state->dst.y1 != expected.y1 ||
> +	    drm_rect_width(&plane_state->dst) != drm_rect_width(&expected) ||
> +	    drm_rect_height(&plane_state->dst) != drm_rect_height(&expected)) {
> +		kunit_err(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
> +			  DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
>  
>  		return false;
>  	}
> @@ -109,8 +119,8 @@ static void igt_check_plane_state(struct kunit *test)
>  						  false, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1024 << 16, 768 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>  
>  	/* Rotated clipping + reflection, no scaling. */
>  	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
> @@ -120,8 +130,8 @@ static void igt_check_plane_state(struct kunit *test)
>  						  false, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 768 << 16, 1024 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>  	plane_state.rotation = DRM_MODE_ROTATE_0;
>  
>  	/* Check whether positioning works correctly. */
> @@ -140,8 +150,8 @@ static void igt_check_plane_state(struct kunit *test)
>  						  true, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1023, 767));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
>  
>  	/* Simple scaling tests. */
>  	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
> @@ -157,8 +167,8 @@ static void igt_check_plane_state(struct kunit *test)
>  						  false, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 512 << 16, 384 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>  
>  	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> @@ -170,8 +180,8 @@ static void igt_check_plane_state(struct kunit *test)
>  						  0x20000, false, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2048 << 16, 1536 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>  
>  	/* Testing rounding errors. */
>  	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
> @@ -182,8 +192,8 @@ static void igt_check_plane_state(struct kunit *test)
>  						  true, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
>  
>  	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
>  	set_crtc(&plane_state, -2, -2, 1028, 772);
> @@ -193,9 +203,9 @@ static void igt_check_plane_state(struct kunit *test)
>  						  false, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0x40002, 0x40002,
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x40002, 0x40002,
>  					     1024 << 16, 768 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>  
>  	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
>  	set_crtc(&plane_state, 1022, 766, 4, 4);
> @@ -206,8 +216,8 @@ static void igt_check_plane_state(struct kunit *test)
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>  	/* Should not be rounded to 0x20001, which would be upscaling. */
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
>  
>  	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
>  	set_crtc(&plane_state, -2, -2, 1028, 772);
> @@ -217,9 +227,9 @@ static void igt_check_plane_state(struct kunit *test)
>  						  false, false);
>  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> -	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0x3fffe, 0x3fffe,
> +	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x3fffe, 0x3fffe,
>  					     1024 << 16, 768 << 16));
> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
> +	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>  }
>  
>  static struct kunit_case drm_plane_helper_test[] = {
