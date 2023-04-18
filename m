Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E16E56BD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 03:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEF110E667;
	Tue, 18 Apr 2023 01:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087B110E667
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:42:39 +0000 (UTC)
Received: from fews01-sea.riseup.net (unknown [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Q0mrM6DSBzDqBT;
 Tue, 18 Apr 2023 01:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1681782159; bh=2NRvdxv54ASeqKR/KS8QsT3STghybVwVijzqGLeyxX0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hyY3Vdcqov9QaV9+F90WUejQcnVUOPA3uq5iWU292MR8+8HFVMZSjQf/PwQJIsmr8
 4lcBY/nQFX6/nlZaf7w4qn0cVlX474LY+anRWGBGJSzd+3NhfhacYEj1mAkjoVTsBQ
 L9u2AZrayxuuPDm0lm0Bbf9bGiN9mdzri8dYkoZI=
X-Riseup-User-ID: 8F12492A9E8D016AF4B4C5E42204EDFA513D7C45075174F450FF3A3CEA0B7EAB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Q0mrG3c4fzJqVp;
 Tue, 18 Apr 2023 01:42:22 +0000 (UTC)
Message-ID: <a46b79c0-d134-6123-280e-c75a5f108e39@riseup.net>
Date: Mon, 17 Apr 2023 22:42:19 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/5] drm/tests: Add test cases for
 drm_rect_calc_vscale()
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
References: <20230406115338.36228-1-arthurgrillo@riseup.net>
 <20230406115338.36228-4-arthurgrillo@riseup.net>
 <42f92ab1-742a-373c-3076-94ebbbfbc700@igalia.com>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <42f92ab1-742a-373c-3076-94ebbbfbc700@igalia.com>
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, maxime@cerno.tech, andrealmeid@riseup.net,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/04/23 13:19, Maíra Canal wrote:
> On 4/6/23 08:53, Arthur Grillo wrote:
>> Insert parameterized test for the drm_rect_calc_vscale() to ensure
>> correctness and prevent future regressions. Besides the test for the
>> usual case, tests the exceptions.
>>
>> It uses the same struct from drm_rect_calc_hscale().
>>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>   drivers/gpu/drm/tests/drm_rect_test.c | 59 +++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
>> index 44150545c1bc..a1fd9b2c5128 100644
>> --- a/drivers/gpu/drm/tests/drm_rect_test.c
>> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
>> @@ -414,6 +414,64 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
>>       KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>>   }
>>   +static const struct drm_rect_scale_case drm_rect_vscale_cases[] = {
>> +    {
>> +        .name = "normal use",
>> +        .src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
>> +        .dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
>> +        .min_range = 0, .max_range = INT_MAX,
>> +        .expected_scaling_factor = 2,
>> +    },
>> +    {
>> +        .name = "out of max range",
>> +        .src = DRM_RECT_INIT(0, 0, 0, 10 << 16),
>> +        .dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
>> +        .min_range = 3, .max_range = 5,
>> +        .expected_scaling_factor = -ERANGE,
>> +    },
>> +    {
>> +        .name = "out of min range",
>> +        .src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
>> +        .dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
>> +        .min_range = 3, .max_range = 5,
>> +        .expected_scaling_factor = -ERANGE,
>> +    },
>> +    {
>> +        .name = "zero dst height",
>> +        .src = DRM_RECT_INIT(0, 0, 0, 2 << 16),
>> +        .dst = DRM_RECT_INIT(0, 0, 0, 0 << 16),
>> +        .min_range = 0, .max_range = INT_MAX,
>> +        .expected_scaling_factor = 0,
>> +    },
>> +    {
>> +        .name = "negative src height",
>> +        .src = DRM_RECT_INIT(0, 0, 0, -(1 << 16)),
>> +        .dst = DRM_RECT_INIT(0, 0, 0, 1 << 16),
>> +        .min_range = 0, .max_range = INT_MAX,
>> +        .expected_scaling_factor = -EINVAL,
>> +    },
>> +    {
>> +        .name = "negative dst height",
>> +        .src = DRM_RECT_INIT(0, 0, 0, 1 << 16),
>> +        .dst = DRM_RECT_INIT(0, 0, 0, -(1 << 16)),
>> +        .min_range = 0, .max_range = INT_MAX,
>> +        .expected_scaling_factor = -EINVAL,
>> +    },
>> +};
>> +
> 
> Would it possible to use the same parameter array for vscale and hscale?
> 
> Best Regards,
> - Maíra Canal
> 

Instead of having drm_rect directly, I could create an src and dst
length. Or maybe have drm_rects that increase on both sizes.

Regards,
~Arthur Grillo

>> +KUNIT_ARRAY_PARAM(drm_rect_vscale, drm_rect_vscale_cases, drm_rect_scale_case_desc);
>> +
>> +static void drm_test_rect_calc_vscale(struct kunit *test)
>> +{
>> +    const struct drm_rect_scale_case *params = test->param_value;
>> +    int scaling_factor;
>> +
>> +    scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
>> +                          params->min_range, params->max_range);
>> +
>> +    KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>> +}
>> +
>>   static struct kunit_case drm_rect_tests[] = {
>>       KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>>       KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>> @@ -421,6 +479,7 @@ static struct kunit_case drm_rect_tests[] = {
>>       KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
>>       KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
>>       KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
>> +    KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_vscale_gen_params),
>>       { }
>>   };
>>   
