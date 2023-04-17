Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803006E4E1D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3C910E2E3;
	Mon, 17 Apr 2023 16:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15DC10E2E3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 16:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BW+VK43zmBa86V48m1yFtx4dRQXajV2mxr4X2vpvyBg=; b=ek6bWV6T1wAsorI1E/hk0mwbNo
 cgSbKsM9coXrwP6EP71MErkVFfplvQm1dQgGqt4PyBXbfetBsIFZFj6EhdDjba5toCkmKUevOK7bd
 PvrfGJ4Awi9lKhiW278cinWxOzavYG2tS4Gx/azpEM1A+9K/euhD/v0qVArwgXW/00b8a9Qg/gifC
 2gYQ8OKzpakvHdvhDpQWOuDOLiyv5qin7R7WYSDU4/R+Q0CAQ3yeol3IErCC25Iqt4XM8UWCwPLxs
 lX54kypuZelCW+77tOx4/3YoFA96+pZry0nnCs/We5jDF/lvpWTuFW/AFKyp1zxIPyvFHGLpOV15h
 dBva6MvA==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1poRZi-003VFp-Vu; Mon, 17 Apr 2023 18:19:31 +0200
Message-ID: <42f92ab1-742a-373c-3076-94ebbbfbc700@igalia.com>
Date: Mon, 17 Apr 2023 13:19:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/5] drm/tests: Add test cases for
 drm_rect_calc_vscale()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230406115338.36228-1-arthurgrillo@riseup.net>
 <20230406115338.36228-4-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230406115338.36228-4-arthurgrillo@riseup.net>
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, maxime@cerno.tech, andrealmeid@riseup.net,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/23 08:53, Arthur Grillo wrote:
> Insert parameterized test for the drm_rect_calc_vscale() to ensure
> correctness and prevent future regressions. Besides the test for the
> usual case, tests the exceptions.
> 
> It uses the same struct from drm_rect_calc_hscale().
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 59 +++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 44150545c1bc..a1fd9b2c5128 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -414,6 +414,64 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>   }
>   
> +static const struct drm_rect_scale_case drm_rect_vscale_cases[] = {
> +	{
> +		.name = "normal use",
> +		.src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = 2,
> +	},
> +	{
> +		.name = "out of max range",
> +		.src = DRM_RECT_INIT(0, 0, 0, 10 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
> +		.min_range = 3, .max_range = 5,
> +		.expected_scaling_factor = -ERANGE,
> +	},
> +	{
> +		.name = "out of min range",
> +		.src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
> +		.min_range = 3, .max_range = 5,
> +		.expected_scaling_factor = -ERANGE,
> +	},
> +	{
> +		.name = "zero dst height",
> +		.src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 0, 0 << 16),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = 0,
> +	},
> +	{
> +		.name = "negative src height",
> +		.src = DRM_RECT_INIT(0, 0, 0, -(1 << 16)),
> +		.dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = -EINVAL,
> +	},
> +	{
> +		.name = "negative dst height",
> +		.src = DRM_RECT_INIT(0, 0, 0, 1 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 0, -(1 << 16)),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = -EINVAL,
> +	},
> +};
> +

Would it possible to use the same parameter array for vscale and hscale?

Best Regards,
- Maíra Canal

> +KUNIT_ARRAY_PARAM(drm_rect_vscale, drm_rect_vscale_cases, drm_rect_scale_case_desc);
> +
> +static void drm_test_rect_calc_vscale(struct kunit *test)
> +{
> +	const struct drm_rect_scale_case *params = test->param_value;
> +	int scaling_factor;
> +
> +	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
> +					      params->min_range, params->max_range);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
> @@ -421,6 +479,7 @@ static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
>   	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_vscale_gen_params),
>   	{ }
>   };
>   
