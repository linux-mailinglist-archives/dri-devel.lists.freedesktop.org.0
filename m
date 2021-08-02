Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072973DD2A7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 11:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429F96E4E6;
	Mon,  2 Aug 2021 09:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E046E4DD;
 Mon,  2 Aug 2021 09:10:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="200620650"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="200620650"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:10:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="520432643"
Received: from mariaf7x-mobl.amr.corp.intel.com (HELO [10.252.52.214])
 ([10.252.52.214])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:10:50 -0700
Subject: Re: [PATCH] drm: Fix oops in damage self-tests by mocking damage
 property
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210730095251.4343-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <36b978e8-e0e0-48dd-385e-f3da7727ce4c@linux.intel.com>
Date: Mon, 2 Aug 2021 11:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210730095251.4343-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Op 30-07-2021 om 11:52 schreef Daniel Vetter:
> I've added a new check to make sure that drivers which insepct the
> damage property have it set up correctly, but somehow missed that this
> borke the damage selftest in the CI result noise.
>
> Fix it up by mocking enough of drm_device and drm_plane so we can call
> drm_plane_enable_fb_damage_clips() to make the new check happy.
>
> Since there's a lot of duplicated mock code already copy-pasted into
> each test I've also refactored this a bit to trim it down.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Fixes: c7fcbf251397 ("drm/plane: check that fb_damage is set up when used")
> Cc: José Roberto de Souza <jose.souza@intel.com> (v1)
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  .../drm/selftests/test-drm_damage_helper.c    | 287 +++++-------------
>  1 file changed, 71 insertions(+), 216 deletions(-)
>
> diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> index 9d2bcdf8bc29..1b585c13e042 100644
> --- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
> @@ -6,9 +6,37 @@
>  #define pr_fmt(fmt) "drm_damage_helper: " fmt
>  
>  #include <drm/drm_damage_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_drv.h>
>  
>  #include "test-drm_modeset_common.h"
>  
> +struct drm_driver mock_driver;
> +struct drm_device mock_device;
> +struct drm_object_properties mock_obj_props;
> +struct drm_plane mock_plane;
> +struct drm_property mock_prop;
> +
> +static void mock_setup(struct drm_plane_state *state)
> +{
> +	static bool setup_done = false;
> +
> +	state->plane = &mock_plane;
> +
> +	if (setup_done)
> +		return;
> +
> +	/* just enough so that drm_plane_enable_fb_damage_clips() works */
> +	mock_device.driver = &mock_driver;
> +	mock_device.mode_config.prop_fb_damage_clips = &mock_prop;
> +	mock_plane.dev = &mock_device;
> +	mock_plane.base.properties = &mock_obj_props;
> +	mock_prop.base.id = 1; /* 0 is an invalid id */
> +	mock_prop.dev = &mock_device;
> +
> +	drm_plane_enable_fb_damage_clips(&mock_plane);
> +}
> +
>  static void set_plane_src(struct drm_plane_state *state, int x1, int y1, int x2,
>  			  int y2)
>  {
> @@ -70,23 +98,29 @@ static bool check_damage_clip(struct drm_plane_state *state, struct drm_rect *r,
>  	return true;
>  }
>  
> +const struct drm_framebuffer fb = {
> +	.width = 2048,
> +	.height = 2048
> +};
> +
> +/* common mocked structs many tests need */
> +#define MOCK_VARIABLES() \
> +	struct drm_plane_state old_state; \
> +	struct drm_plane_state state = { \
> +		.crtc = ZERO_SIZE_PTR, \
> +		.fb = (struct drm_framebuffer *) &fb, \
> +		.visible = true, \
> +	}; \
> +	mock_setup(&old_state); \
> +	mock_setup(&state);
> +
>  int igt_damage_iter_no_damage(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src same as fb size. */
>  	set_plane_src(&old_state, 0, 0, fb.width << 16, fb.height << 16);
> @@ -104,20 +138,10 @@ int igt_damage_iter_no_damage(void *ignored)
>  int igt_damage_iter_no_damage_fractional_src(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src has fractional part. */
>  	set_plane_src(&old_state, 0x3fffe, 0x3fffe,
> @@ -137,20 +161,10 @@ int igt_damage_iter_no_damage_fractional_src(void *ignored)
>  int igt_damage_iter_no_damage_src_moved(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src moved since old plane state. */
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
> @@ -169,20 +183,10 @@ int igt_damage_iter_no_damage_src_moved(void *ignored)
>  int igt_damage_iter_no_damage_fractional_src_moved(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src has fractional part and it moved since old plane state. */
>  	set_plane_src(&old_state, 0x3fffe, 0x3fffe,
> @@ -202,20 +206,14 @@ int igt_damage_iter_no_damage_fractional_src_moved(void *ignored)
>  int igt_damage_iter_no_damage_not_visible(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> +	MOCK_VARIABLES();
>  
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = false,
> -	};
> +	state.visible = false;
> +
> +	mock_setup(&old_state);
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -231,19 +229,12 @@ int igt_damage_iter_no_damage_not_visible(void *ignored)
>  int igt_damage_iter_no_damage_no_crtc(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> +	MOCK_VARIABLES();
>  
> -	struct drm_plane_state state = {
> -		.crtc = 0,
> -		.fb = &fb,
> -	};
> +	state.crtc = NULL;
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -268,6 +259,8 @@ int igt_damage_iter_no_damage_no_fb(void *ignored)
>  		.fb = 0,
>  	};
>  
> +	mock_setup(&old_state);
> +
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
>  	drm_atomic_helper_damage_iter_init(&iter, &old_state, &state);
> @@ -282,22 +275,12 @@ int igt_damage_iter_no_damage_no_fb(void *ignored)
>  int igt_damage_iter_simple_damage(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -318,22 +301,12 @@ int igt_damage_iter_simple_damage(void *ignored)
>  int igt_damage_iter_single_damage(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -353,22 +326,12 @@ int igt_damage_iter_single_damage(void *ignored)
>  int igt_damage_iter_single_damage_intersect_src(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -389,22 +352,12 @@ int igt_damage_iter_single_damage_intersect_src(void *ignored)
>  int igt_damage_iter_single_damage_outside_src(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -424,22 +377,12 @@ int igt_damage_iter_single_damage_outside_src(void *ignored)
>  int igt_damage_iter_single_damage_fractional_src(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src has fractional part. */
>  	set_plane_src(&old_state, 0x40002, 0x40002,
> @@ -462,22 +405,12 @@ int igt_damage_iter_single_damage_fractional_src(void *ignored)
>  int igt_damage_iter_single_damage_intersect_fractional_src(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src has fractional part. */
>  	set_plane_src(&old_state, 0x40002, 0x40002,
> @@ -501,22 +434,12 @@ int igt_damage_iter_single_damage_intersect_fractional_src(void *ignored)
>  int igt_damage_iter_single_damage_outside_fractional_src(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src has fractional part. */
>  	set_plane_src(&old_state, 0x40002, 0x40002,
> @@ -539,22 +462,12 @@ int igt_damage_iter_single_damage_outside_fractional_src(void *ignored)
>  int igt_damage_iter_single_damage_src_moved(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src moved since old plane state. */
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
> @@ -576,22 +489,12 @@ int igt_damage_iter_single_damage_src_moved(void *ignored)
>  int igt_damage_iter_single_damage_fractional_src_moved(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage;
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	/* Plane src with fractional part moved since old plane state. */
>  	set_plane_src(&old_state, 0x3fffe, 0x3fffe,
> @@ -615,22 +518,12 @@ int igt_damage_iter_single_damage_fractional_src_moved(void *ignored)
>  int igt_damage_iter_damage(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage[2];
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -656,22 +549,12 @@ int igt_damage_iter_damage(void *ignored)
>  int igt_damage_iter_damage_one_intersect(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage[2];
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0x40002, 0x40002,
>  		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
> @@ -699,22 +582,12 @@ int igt_damage_iter_damage_one_intersect(void *ignored)
>  int igt_damage_iter_damage_one_outside(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage[2];
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0, 0, 1024 << 16, 768 << 16);
>  	set_plane_src(&state, 0, 0, 1024 << 16, 768 << 16);
> @@ -736,22 +609,12 @@ int igt_damage_iter_damage_one_outside(void *ignored)
>  int igt_damage_iter_damage_src_moved(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage[2];
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> -
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = true,
> -	};
> +	MOCK_VARIABLES();
>  
>  	set_plane_src(&old_state, 0x40002, 0x40002,
>  		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));
> @@ -775,22 +638,14 @@ int igt_damage_iter_damage_src_moved(void *ignored)
>  int igt_damage_iter_damage_not_visible(void *ignored)
>  {
>  	struct drm_atomic_helper_damage_iter iter;
> -	struct drm_plane_state old_state;
>  	struct drm_property_blob damage_blob;
>  	struct drm_mode_rect damage[2];
>  	struct drm_rect clip;
>  	uint32_t num_hits = 0;
>  
> -	struct drm_framebuffer fb = {
> -		.width = 2048,
> -		.height = 2048
> -	};
> +	MOCK_VARIABLES();
>  
> -	struct drm_plane_state state = {
> -		.crtc = ZERO_SIZE_PTR,
> -		.fb = &fb,
> -		.visible = false,
> -	};
> +	state.visible = false;
>  
>  	set_plane_src(&old_state, 0x40002, 0x40002,
>  		      0x40002 + (1024 << 16), 0x40002 + (768 << 16));

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

