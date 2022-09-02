Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A75AB53E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 17:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9039910E88A;
	Fri,  2 Sep 2022 15:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BB110E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 15:32:30 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MK23K4qX0zDrJG;
 Fri,  2 Sep 2022 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662132749; bh=dvsW4lfMUIeI0P9/CeSvzpz3PqTQiL4OQ8xL0ZbjEaI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LSy9hzVyDGNQ3E12dKrj16adq8j7lgzmsCkpeDOVa9FBQ+L3McLt6NTDfiuJT8mvY
 bxeQpnj+aLPnRsIjpgkTzBdPqbWiNKfunqtRS2TpezsntADyJhKsODLqAynd+B2lUq
 OseWPNEzm1H+LAlk+9Di62BPKptSzYy7/J5aldxM=
X-Riseup-User-ID: 0F2BEFB6489A1DE01D49F0E691932CC87B030688AFEA86706B4D668113816B56
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MK23G36hzz1yPx;
 Fri,  2 Sep 2022 15:32:26 +0000 (UTC)
Message-ID: <1b4a8283-637f-7d18-1418-8bffefdeb879@riseup.net>
Date: Fri, 2 Sep 2022 12:32:22 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/plane_helper: Split into parameterized test
 cases
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20220831204536.348930-1-michal.winiarski@intel.com>
 <20220831204536.348930-2-michal.winiarski@intel.com>
 <8931b4b7-16d2-24c1-fb4c-fc486d1ec186@riseup.net>
 <20220902145315.qk67emni4tdt7aiq@nostramo.hardline.pl>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220902145315.qk67emni4tdt7aiq@nostramo.hardline.pl>
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/2/22 11:53, Michał Winiarski wrote:
> On Thu, Sep 01, 2022 at 09:20:55AM -0300, Maíra Canal wrote:
>> Hi Michał
>>
>> On 8/31/22 17:45, Michał Winiarski wrote:
>>> The test was constructed as a single function (test case) which checks
>>> multiple conditions, calling the function that is tested multiple times
>>> with different arguments.
>>> This usually means that it can be easily converted into multiple test
>>> cases.
>>> Split igt_check_plane_state into two parameterized test cases,
>>> drm_check_plane_state and drm_check_invalid_plane_state.
>>>
>>> Passing output:
>>> ============================================================
>>> ============== drm_plane_helper (2 subtests) ===============
>>> ================== drm_check_plane_state ===================
>>> [PASSED] clipping_simple
>>> [PASSED] clipping_rotate_reflect
>>> [PASSED] positioning_simple
>>> [PASSED] upscaling
>>> [PASSED] downscaling
>>> [PASSED] rounding1
>>> [PASSED] rounding2
>>> [PASSED] rounding3
>>> [PASSED] rounding4
>>> ============== [PASSED] drm_check_plane_state ==============
>>> ============== drm_check_invalid_plane_state ===============
>>> [PASSED] positioning_invalid
>>> [PASSED] upscaling_invalid
>>> [PASSED] downscaling_invalid
>>> ========== [PASSED] drm_check_invalid_plane_state ==========
>>> ================ [PASSED] drm_plane_helper =================
>>> ============================================================
>>> Testing complete. Ran 12 tests: passed: 12
>>>
>>> v2: Add missing EXPECT/ASSERT (Maíra)
>>>
>>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>>> ---
>>>  drivers/gpu/drm/tests/drm_plane_helper_test.c | 456 ++++++++++--------
>>>  1 file changed, 267 insertions(+), 189 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
>>> index 0bbd42d2d37b..505173b019d7 100644
>>> --- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
>>> @@ -12,59 +12,97 @@
>>>  #include <drm/drm_modes.h>
>>>  #include <drm/drm_rect.h>
>>>  
>>> -static void set_src(struct drm_plane_state *plane_state,
>>> -		    unsigned int src_x, unsigned int src_y,
>>> -		    unsigned int src_w, unsigned int src_h)
>>> +static const struct drm_crtc_state crtc_state = {
>>> +	.crtc = ZERO_SIZE_PTR,
>>> +	.enable = true,
>>> +	.active = true,
>>> +	.mode = {
>>> +		DRM_MODE("1024x768", 0, 65000, 1024, 1048,
>>> +			 1184, 1344, 0, 768, 771, 777, 806, 0,
>>> +			 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
>>> +	},
>>> +};
>>> +
>>> +struct drm_check_plane_state_test {
>>> +	const char *name;
>>> +	const char *msg;
>>> +	struct {
>>> +		unsigned int x;
>>> +		unsigned int y;
>>> +		unsigned int w;
>>> +		unsigned int h;
>>> +	} src, src_expected;
>>> +	struct {
>>> +		int x;
>>> +		int y;
>>> +		unsigned int w;
>>> +		unsigned int h;
>>> +	} crtc, crtc_expected;
>>> +	unsigned int rotation;
>>> +	int min_scale;
>>> +	int max_scale;
>>> +	bool can_position;
>>> +};
>>> +
>>> +static int drm_plane_helper_init(struct kunit *test)
>>>  {
>>> -	plane_state->src_x = src_x;
>>> -	plane_state->src_y = src_y;
>>> -	plane_state->src_w = src_w;
>>> -	plane_state->src_h = src_h;
>>> +	const struct drm_check_plane_state_test *params = test->param_value;
>>> +	struct drm_plane *plane;
>>> +	struct drm_framebuffer *fb;
>>> +	struct drm_plane_state *mock;
>>> +
>>> +	plane = kunit_kzalloc(test, sizeof(*plane), GFP_KERNEL);
>>> +	KUNIT_ASSERT_NOT_NULL(test, plane);
>>> +
>>> +	fb = kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
>>> +	KUNIT_ASSERT_NOT_NULL(test, fb);
>>> +	fb->width = 2048;
>>> +	fb->height = 2048;
>>> +
>>> +	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
>>> +	KUNIT_ASSERT_NOT_NULL(test, mock);
>>> +	mock->plane = plane;
>>> +	mock->crtc = ZERO_SIZE_PTR;
>>> +	mock->fb = fb;
>>> +	mock->rotation = params->rotation;
>>> +	mock->src_x = params->src.x;
>>> +	mock->src_y = params->src.y;
>>> +	mock->src_w = params->src.w;
>>> +	mock->src_h = params->src.h;
>>> +	mock->crtc_x = params->crtc.x;
>>> +	mock->crtc_y = params->crtc.y;
>>> +	mock->crtc_w = params->crtc.w;
>>> +	mock->crtc_h = params->crtc.h;
>>> +
>>> +	test->priv = mock;
>>> +
>>> +	return 0;
>>>  }
>>>  
>>> -static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
>>> +static void check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
>>>  			 unsigned int src_x, unsigned int src_y,
>>>  			 unsigned int src_w, unsigned int src_h)
>>>  {
>>>  	struct drm_rect expected = DRM_RECT_INIT(src_x, src_y, src_w, src_h);
>>>  
>>> -	if (plane_state->src.x1 < 0) {
>>> -		kunit_err(test,
>>> -			  "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
>>> -			  plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
>>> -		return false;
>>> -	}
>>> -	if (plane_state->src.y1 < 0) {
>>> -		kunit_err(test,
>>> -			  "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
>>> -			  plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
>>> -		return false;
>>> -	}
>>> +	KUNIT_ASSERT_GE_MSG(test, plane_state->src.x1, 0,
>>> +			    "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
>>> +			    plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
>>> +
>>> +	KUNIT_ASSERT_GE_MSG(test, plane_state->src.y1, 0,
>>> +			    "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
>>> +			    plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
>>>  
>>>  	if (plane_state->src.x1 != expected.x1 ||
>>>  	    plane_state->src.y1 != expected.y1 ||
>>>  	    drm_rect_width(&plane_state->src) != drm_rect_width(&expected) ||
>>>  	    drm_rect_height(&plane_state->src) != drm_rect_height(&expected)) {
>>> -		kunit_err(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
>>> -			  DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
>>> -
>>> -		return false;
>>> +		KUNIT_FAIL(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
>>> +			   DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
>>>  	}
>>
>> I believe it would be more KUnit-like to write:
>>
>> KUNIT_ASSERT_EQ_MSG(test, plane_state->src.x1, expected.x1,
>> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
>> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
>>
>> KUNIT_ASSERT_EQ_MSG(test, plane_state->src.y1, expected.y1,
>> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
>> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
>>
>> KUNIT_ASSERT_EQ_MSG(test, drm_rect_width(&plane_state->src),
>> 	drm_rect_width(&expected),
>> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
>> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
>>
>> KUNIT_ASSERT_EQ_MSG(test, drm_rect_height(&plane_state->src),
>> 	drm_rect_height(&expected),
>> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
>> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
>>
>> And maybe explicit in the message which coordinate failed.
> 
> All of the components (width / height / x / y) used in the check are already
> printed in the proper format (DRM_RECT_FP_FMT is widthxheight+x1+y1).
> 
> The suggested approach uses an assert, which means that it will terminate the
> test on first failed check. If we use EXPECT instead, we will just print the
> same information multiple times.
> 
> We could replace it with multiple simple expects, and drop the DRM_RECT_FP_FMT
> usage, but that would give us less information and additionally, since the
> values here are in fixed-point format, it would just be confusing, since e.g.
> for width expect with "actual=1024.000000", "expected=2048.000000" we would see
> 67108864 and 134217728 instead:
> 
> # drm_check_plane_state: ASSERTION FAILED at drivers/gpu/drm/tests/drm_plane_helper_test.c:114
> Expected drm_rect_width(&plane_state->src) == drm_rect_width(&expected), but
> drm_rect_width(&plane_state->src) == 67108864
> drm_rect_width(&expected) == 134217728
> 
> Bottom line is - it really is a compound check, we're checking if struct
> drm_rect is equal to another struct drm_rect.

In this case, KUNIT_EXPECT_MEMEQ [1] would be really useful, but is not
merged yet. Maybe in the short term, you could use:

KUNIT_ASSERT_EQ_MSG(test, 0,
	memcmp(plane_state->src, expected, sizeof(struct drm_rect)),
	"src: " DRM_RECT_FP_FMT ", expected: "
	DRM_RECT_FP_FMT, DRM_RECT_FP_ARG(&plane_state->src), 		
	DRM_RECT_FP_ARG(&expected));

Usually, this wouldn't be nice, as the assertion would just return the
memcmp error and wouldn't return the components. But, as there is a
proper way to print the components in the message, I believe this would
be a fine option.

[1]
https://lore.kernel.org/linux-kselftest/20220808125237.277126-1-mairacanal@riseup.net/

Best Regards,
- Maíra Canal

> The "KUnit-like" way would be to define a custom assert/expect, something like
> KUNIT_ASSERT_DRM_RECT_FP_EQ, but since this is just used in this single check, I
> think it would be overengineering things slightly and would end up being less
> readable.
> 
> -Michał
> 
>>
>>> -
>>> -	return true;
>>>  }
>>>  
>>> -static void set_crtc(struct drm_plane_state *plane_state,
>>> -		     int crtc_x, int crtc_y,
>>> -		     unsigned int crtc_w, unsigned int crtc_h)
>>> -{
>>> -	plane_state->crtc_x = crtc_x;
>>> -	plane_state->crtc_y = crtc_y;
>>> -	plane_state->crtc_w = crtc_w;
>>> -	plane_state->crtc_h = crtc_h;
>>> -}
>>> -
>>> -static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
>>> +static void check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
>>>  			  int crtc_x, int crtc_y,
>>>  			  unsigned int crtc_w, unsigned int crtc_h)
>>>  {
>>> @@ -74,171 +112,211 @@ static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_stat
>>>  	    plane_state->dst.y1 != expected.y1 ||
>>>  	    drm_rect_width(&plane_state->dst) != drm_rect_width(&expected) ||
>>>  	    drm_rect_height(&plane_state->dst) != drm_rect_height(&expected)) {
>>> -		kunit_err(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
>>> -			  DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
>>> -
>>> -		return false;
>>> +		KUNIT_FAIL(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
>>> +			   DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
>>>  	}
>>
>> Same goes here.
>>
>> Other than that,
>>
>> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
>>
>> Best Regards,
>> - Maíra Canal
>>
>>> +}
>>> +
>>> +static void drm_check_plane_state(struct kunit *test)
>>> +{
>>> +	const struct drm_check_plane_state_test *params = test->param_value;
>>> +	struct drm_plane_state *plane_state = test->priv;
>>>  
>>> -	return true;
>>> +	KUNIT_ASSERT_EQ_MSG(test,
>>> +			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
>>> +								params->min_scale,
>>> +								params->max_scale,
>>> +								params->can_position, false),
>>> +			    0, params->msg);
>>> +	KUNIT_EXPECT_TRUE(test, plane_state->visible);
>>> +	check_src_eq(test, plane_state, params->src_expected.x, params->src_expected.y,
>>> +		     params->src_expected.w, params->src_expected.h);
>>> +	check_crtc_eq(test, plane_state, params->crtc_expected.x, params->crtc_expected.y,
>>> +		      params->crtc_expected.w, params->crtc_expected.h);
>>>  }
>>>  
>>> -static void igt_check_plane_state(struct kunit *test)
>>> +static void drm_check_plane_state_desc(const struct drm_check_plane_state_test *t,
>>> +				       char *desc)
>>>  {
>>> -	int ret;
>>> -
>>> -	static const struct drm_crtc_state crtc_state = {
>>> -		.crtc = ZERO_SIZE_PTR,
>>> -		.enable = true,
>>> -		.active = true,
>>> -		.mode = {
>>> -			DRM_MODE("1024x768", 0, 65000, 1024, 1048, 1184, 1344, 0, 768, 771,
>>> -				 777, 806, 0, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
>>> -		},
>>> -	};
>>> -	static struct drm_plane plane = {
>>> -		.dev = NULL
>>> -	};
>>> -	static struct drm_framebuffer fb = {
>>> -		.width = 2048,
>>> -		.height = 2048
>>> -	};
>>> -	static struct drm_plane_state plane_state = {
>>> -		.plane = &plane,
>>> -		.crtc = ZERO_SIZE_PTR,
>>> -		.fb = &fb,
>>> -		.rotation = DRM_MODE_ROTATE_0
>>> -	};
>>> -
>>> -	/* Simple clipping, no scaling. */
>>> -	set_src(&plane_state, 0, 0, fb.width << 16, fb.height << 16);
>>> -	set_crtc(&plane_state, 0, 0, fb.width, fb.height);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>>> -
>>> -	/* Rotated clipping + reflection, no scaling. */
>>> -	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>>> -	plane_state.rotation = DRM_MODE_ROTATE_0;
>>> -
>>> -	/* Check whether positioning works correctly. */
>>> -	set_src(&plane_state, 0, 0, 1023 << 16, 767 << 16);
>>> -	set_crtc(&plane_state, 0, 0, 1023, 767);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_TRUE_MSG(test, ret,
>>> -			      "Should not be able to position on the crtc with can_position=false\n");
>>> -
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  true, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
>>> -
>>> -	/* Simple scaling tests. */
>>> -	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
>>> -	set_crtc(&plane_state, 0, 0, 1024, 768);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  0x8001,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_TRUE_MSG(test, ret, "Upscaling out of range should fail.\n");
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  0x8000,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>>> -
>>> -	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  0x1ffff, false, false);
>>> -	KUNIT_EXPECT_TRUE_MSG(test, ret, "Downscaling out of range should fail.\n");
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  0x20000, false, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>>> -
>>> -	/* Testing rounding errors. */
>>> -	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
>>> -	set_crtc(&plane_state, 1022, 766, 4, 4);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  0x10001,
>>> -						  true, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
>>> -
>>> -	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
>>> -	set_crtc(&plane_state, -2, -2, 1028, 772);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  0x10001,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x40002, 0x40002,
>>> -					     1024 << 16, 768 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>>> -
>>> -	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
>>> -	set_crtc(&plane_state, 1022, 766, 4, 4);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  0xffff,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  true, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	/* Should not be rounded to 0x20001, which would be upscaling. */
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
>>> -
>>> -	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
>>> -	set_crtc(&plane_state, -2, -2, 1028, 772);
>>> -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>>> -						  0xffff,
>>> -						  DRM_PLANE_NO_SCALING,
>>> -						  false, false);
>>> -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
>>> -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
>>> -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x3fffe, 0x3fffe,
>>> -					     1024 << 16, 768 << 16));
>>> -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
>>> +	sprintf(desc, "%s", t->name);
>>>  }
>>>  
>>> +static const struct drm_check_plane_state_test drm_check_plane_state_tests[] = {
>>> +	{
>>> +		.name = "clipping_simple",
>>> +		.msg = "Simple clipping check should pass",
>>> +		.src = { 0, 0,
>>> +			 2048 << 16,
>>> +			 2048 << 16 },
>>> +		.crtc = { 0, 0, 2048, 2048 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = false,
>>> +		.src_expected = { 0, 0, 1024 << 16, 768 << 16 },
>>> +		.crtc_expected = { 0, 0, 1024, 768 },
>>> +	},
>>> +	{
>>> +		.name = "clipping_rotate_reflect",
>>> +		.msg = "Rotated clipping check should pass",
>>> +		.src = { 0, 0,
>>> +			 2048 << 16,
>>> +			 2048 << 16 },
>>> +		.crtc = { 0, 0, 2048, 2048 },
>>> +		.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = false,
>>> +		.src_expected = { 0, 0, 768 << 16, 1024 << 16 },
>>> +		.crtc_expected = { 0, 0, 1024, 768 },
>>> +	},
>>> +	{
>>> +		.name = "positioning_simple",
>>> +		.msg = "Simple positioning should work",
>>> +		.src = { 0, 0, 1023 << 16, 767 << 16 },
>>> +		.crtc = { 0, 0, 1023, 767 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = true,
>>> +		.src_expected = { 0, 0, 1023 << 16, 767 << 16 },
>>> +		.crtc_expected = { 0, 0, 1023, 767 },
>>> +	},
>>> +	{
>>> +		.name = "upscaling",
>>> +		.msg = "Upscaling exactly 2x should work",
>>> +		.src = { 0, 0, 512 << 16, 384 << 16 },
>>> +		.crtc = { 0, 0, 1024, 768 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = 0x8000,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = false,
>>> +		.src_expected = { 0, 0, 512 << 16, 384 << 16 },
>>> +		.crtc_expected = { 0, 0, 1024, 768 },
>>> +	},
>>> +	{
>>> +		.name = "downscaling",
>>> +		.msg = "Should succeed with exact scaling limit",
>>> +		.src = { 0, 0, 2048 << 16, 1536 << 16 },
>>> +		.crtc = { 0, 0, 1024, 768 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = 0x20000,
>>> +		.can_position = false,
>>> +		.src_expected = { 0, 0, 2048 << 16, 1536 << 16 },
>>> +		.crtc_expected = { 0, 0, 1024, 768 },
>>> +	},
>>> +	{
>>> +		.name = "rounding1",
>>> +		.msg = "Should succeed by clipping to exact multiple",
>>> +		.src = { 0, 0, 0x40001, 0x40001 },
>>> +		.crtc = { 1022, 766, 4, 4 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = 0x10001,
>>> +		.can_position = true,
>>> +		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
>>> +		.crtc_expected = { 1022, 766, 2, 2 },
>>> +	},
>>> +	{
>>> +		.name = "rounding2",
>>> +		.msg = "Should succeed by clipping to exact multiple",
>>> +		.src = { 0x20001, 0x20001, 0x4040001, 0x3040001 },
>>> +		.crtc = { -2, -2, 1028, 772 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = 0x10001,
>>> +		.can_position = false,
>>> +		.src_expected = { 0x40002, 0x40002, 1024 << 16, 768 << 16 },
>>> +		.crtc_expected = { 0, 0, 1024, 768 },
>>> +	},
>>> +	{
>>> +		.name = "rounding3",
>>> +		.msg = "Should succeed by clipping to exact multiple",
>>> +		.src = { 0, 0, 0x3ffff, 0x3ffff },
>>> +		.crtc = { 1022, 766, 4, 4 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = 0xffff,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = true,
>>> +		/* Should not be rounded to 0x20001, which would be upscaling. */
>>> +		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
>>> +		.crtc_expected = { 1022, 766, 2, 2 },
>>> +	},
>>> +	{
>>> +		.name = "rounding4",
>>> +		.msg = "Should succeed by clipping to exact multiple",
>>> +		.src = { 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff },
>>> +		.crtc = { -2, -2, 1028, 772 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = 0xffff,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = false,
>>> +		.src_expected = { 0x3fffe, 0x3fffe, 1024 << 16, 768 << 16 },
>>> +		.crtc_expected = { 0, 0, 1024, 768 },
>>> +	},
>>> +};
>>> +
>>> +KUNIT_ARRAY_PARAM(drm_check_plane_state, drm_check_plane_state_tests, drm_check_plane_state_desc);
>>> +
>>> +static void drm_check_invalid_plane_state(struct kunit *test)
>>> +{
>>> +	const struct drm_check_plane_state_test *params = test->param_value;
>>> +	struct drm_plane_state *plane_state = test->priv;
>>> +
>>> +	KUNIT_ASSERT_LT_MSG(test,
>>> +			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
>>> +								params->min_scale,
>>> +								params->max_scale,
>>> +								params->can_position, false),
>>> +			    0, params->msg);
>>> +}
>>> +
>>> +static const struct drm_check_plane_state_test drm_check_invalid_plane_state_tests[] = {
>>> +	{
>>> +		.name = "positioning_invalid",
>>> +		.msg = "Should not be able to position on the crtc with can_position=false",
>>> +		.src = { 0, 0, 1023 << 16, 767 << 16 },
>>> +		.crtc = { 0, 0, 1023, 767 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = false,
>>> +	},
>>> +	{
>>> +		.name = "upscaling_invalid",
>>> +		.msg = "Upscaling out of range should fail",
>>> +		.src = { 0, 0, 512 << 16, 384 << 16 },
>>> +		.crtc = { 0, 0, 1024, 768 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = 0x8001,
>>> +		.max_scale = DRM_PLANE_NO_SCALING,
>>> +		.can_position = false,
>>> +	},
>>> +	{
>>> +		.name = "downscaling_invalid",
>>> +		.msg = "Downscaling out of range should fail",
>>> +		.src = { 0, 0, 2048 << 16, 1536 << 16 },
>>> +		.crtc = { 0, 0, 1024, 768 },
>>> +		.rotation = DRM_MODE_ROTATE_0,
>>> +		.min_scale = DRM_PLANE_NO_SCALING,
>>> +		.max_scale = 0x1ffff,
>>> +		.can_position = false,
>>> +	},
>>> +};
>>> +
>>> +KUNIT_ARRAY_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_tests,
>>> +		  drm_check_plane_state_desc);
>>> +
>>>  static struct kunit_case drm_plane_helper_test[] = {
>>> -	KUNIT_CASE(igt_check_plane_state),
>>> +	KUNIT_CASE_PARAM(drm_check_plane_state, drm_check_plane_state_gen_params),
>>> +	KUNIT_CASE_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_gen_params),
>>>  	{}
>>>  };
>>>  
>>>  static struct kunit_suite drm_plane_helper_test_suite = {
>>>  	.name = "drm_plane_helper",
>>> +	.init = drm_plane_helper_init,
>>>  	.test_cases = drm_plane_helper_test,
>>>  };
>>>  
