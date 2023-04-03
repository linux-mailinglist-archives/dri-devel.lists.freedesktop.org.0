Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7043B6D4C00
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A81910E173;
	Mon,  3 Apr 2023 15:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8B10E173
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L7r22CE1oD2M49A0QCmy+by/YFqM2fwQjcHJLjyWPFU=; b=bvnOMDDBa7kdYS265M6NoRNPR9
 J8hzoGVgw1iPF2fEXWw+RHPve4zmmyzM8vp1MDjfA+PfVW+4HE6yRQP00tHxwMC9iXf/o0GxE0tbN
 tRiE4K+LVe3f6oamuAJuabqhZSvgG/IQo6PhNEBujcSl4HdLRO/V/FUc9M4Y/JQhEBmwKO1NNlxrh
 jTle98oK7/FqXi3cE5EcYAH1FUF02oW8qW94mOLNbyznoNgcRgivSh9HgWe8mmmzU4ibjod2UUS+T
 6KKYWz+FM3Izw79mesBjqFhZWLpk+a/bRwo0DYUzlm3SBkHnjN6eyjgulXkaHYRbGumCDQI4ZJrxs
 ERKy75cQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pjMBt-003wfI-S8; Mon, 03 Apr 2023 17:33:53 +0200
Message-ID: <c1c52ce1-a1db-c4d5-5638-d8e1c2a60c31@igalia.com>
Date: Mon, 3 Apr 2023 12:33:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/5] drm/tests: Test drm_rect_intersect()
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230327133848.5250-1-arthurgrillo@riseup.net>
 <20230327133848.5250-2-arthurgrillo@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230327133848.5250-2-arthurgrillo@riseup.net>
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

Hi Arthur,

On 3/27/23 10:38, Arthur Grillo wrote:
> Insert test for the drm_rect_intersect() function, it also create a
> helper for comparing drm_rects more easily.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 139 ++++++++++++++++++++++++++
>   1 file changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index e9809ea32696..3654c0be3d6b 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -9,6 +9,17 @@
>   
>   #include <drm/drm_rect.h>
>   
> +#include <linux/string_helpers.h>

Is this include really needed? I was able to compile without it.

> +
> +static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
> +			     const struct drm_rect *expected)
> +{
> +	KUNIT_EXPECT_EQ(test, r->x1, expected->x1);

Maybe it would be nice to have a message here that shows the current x1
and the expected x1. Same for the other dimensions.

> +	KUNIT_EXPECT_EQ(test, r->y1, expected->y1);
> +	KUNIT_EXPECT_EQ(test, drm_rect_width(r), drm_rect_width(expected));
> +	KUNIT_EXPECT_EQ(test, drm_rect_height(r), drm_rect_height(expected));
> +}
> +
>   static void drm_test_rect_clip_scaled_div_by_zero(struct kunit *test)
>   {
>   	struct drm_rect src, dst, clip;
> @@ -196,11 +207,139 @@ static void drm_test_rect_clip_scaled_signed_vs_unsigned(struct kunit *test)
>   	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
>   }
>   
> +struct drm_rect_intersect_case {
> +	const char *description;
> +	struct drm_rect r1, r2;
> +	bool should_be_visible;
> +	struct drm_rect expected_intersection;
> +};
> +
> +static const struct drm_rect_intersect_case drm_rect_intersect_cases[] = {
> +	{
> +		.description = "top-left X bottom-right",
> +		.r1 = DRM_RECT_INIT(1, 1, 2, 2),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
> +	},
> +	{
> +		.description = "top-right X bottom-left",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(1, -1, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "bottom-left X top-right",
> +		.r1 = DRM_RECT_INIT(1, -1, 2, 2),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "bottom-right X top-left",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(1, 1, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
> +	},
> +	{
> +		.description = "right X left",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 1),
> +		.r2 = DRM_RECT_INIT(1, 0, 3, 1),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "left X right",
> +		.r1 = DRM_RECT_INIT(1, 0, 3, 1),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 1),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "up X bottom",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 2),
> +		.r2 = DRM_RECT_INIT(0, -1, 1, 3),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(0, 0, 1, 2),
> +	},
> +	{
> +		.description = "bottom X up",
> +		.r1 = DRM_RECT_INIT(0, -1, 1, 3),
> +		.r2 = DRM_RECT_INIT(0, 0, 1, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(0, 0, 1, 2),
> +	},
> +	{
> +		.description = "touching corner",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
> +		.r2 = DRM_RECT_INIT(1, 1, 2, 2),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 0, 0),
> +	},
> +	{
> +		.description = "touching side",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
> +		.r2 = DRM_RECT_INIT(1, 0, 1, 1),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 0, 1),
> +	},
> +	{
> +		.description = "equal rects",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(0, 0, 2, 2),
> +	},
> +	{
> +		.description = "inside another",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(1, 1, 1, 1),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
> +	},
> +	{
> +		.description = "far away",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
> +		.r2 = DRM_RECT_INIT(3, 6, 1, 1),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(3, 6, -2, -5),
> +	},
> +};

What happens if width = height = 0? It would be nice to have a test
case for this scenario.

> +
> +static void drm_rect_intersect_case_desc(const struct drm_rect_intersect_case *t, char *desc)
> +{
> +	if (!t->description)
> +		snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> +			 DRM_RECT_FMT " X " DRM_RECT_FMT,
> +			 DRM_RECT_ARG(&t->r1), DRM_RECT_ARG(&t->r2));

Is this conditional clause really needed? All parameters have
description.

> +	else
> +		snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> +			 "%s: " DRM_RECT_FMT " X " DRM_RECT_FMT,
> +			 t->description, DRM_RECT_ARG(&t->r1), DRM_RECT_ARG(&t->r2));
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_rect_intersect, drm_rect_intersect_cases, drm_rect_intersect_case_desc);
> +
> +static void drm_test_rect_intersect(struct kunit *test)
> +{
> +	const struct drm_rect_intersect_case *params = test->param_value;
> +	struct drm_rect r1_aux = params->r1;

Does this variable needs to exist? I guess you could just use params->r1.

Best Regards,
- Maíra Canal

> +	bool visible;
> +
> +	visible = drm_rect_intersect(&r1_aux, &params->r2);
> +
> +	KUNIT_EXPECT_EQ(test, visible, params->should_be_visible);
> +	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
> +	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
>   	{ }
>   };
>   
