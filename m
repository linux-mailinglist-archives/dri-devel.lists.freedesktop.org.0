Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E36D4C35
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDC110E4E1;
	Mon,  3 Apr 2023 15:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE8610E4E1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ypXobNXniR1jH5VzdT3/1qz6VGRCV9HLNkQ2pXRJM6I=; b=rZXobJKkart7rQcbdBQ+P9Sf/l
 qHXlOA2uHD4ye/Z4fNPx2l8RXa/t+HhdgANq/yVjdonIQzNjZwuFINknjfVxY49sBS+wuQ+6woPix
 pyt7JI2cpXvnclc/o0PMZbxPxsHh56angGfZCo5enoaeol6Cf4q9XjFdSezoDQ+3W/r8CCek6IA1w
 ZDW9VpcT+5sKdtG9bgtsBI+iEui94GgQ9Hx/3Q6dvVv2mieot2w7Z7/pn84w6V6uO+2SV+BGanD4x
 hmZKSRUO9getvLcFJ/Qdog7c6GQp9PzmASATi2cuz83KKn0HPus9oiVxpU4KCUYixI7yzPyhP8TkH
 exMuZTgg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pjMKk-003x7u-Ur; Mon, 03 Apr 2023 17:43:02 +0200
Message-ID: <70d513f4-1b50-ba47-a561-bf3fe54ced7a@igalia.com>
Date: Mon, 3 Apr 2023 12:42:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/5] drm/tests: Test drm_rect_calc_hscale()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230327133848.5250-1-arthurgrillo@riseup.net>
 <20230327133848.5250-3-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230327133848.5250-3-arthurgrillo@riseup.net>
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
> Insert test for the drm_rect_hscale() function, besides the test
> for the usual case it also test for the exceptions.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 57 +++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 3654c0be3d6b..c282e1cf9c30 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_rect.h>
>   
>   #include <linux/string_helpers.h>
> +#include <linux/errno.h>
>   
>   static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
>   			     const struct drm_rect *expected)
> @@ -334,12 +335,68 @@ static void drm_test_rect_intersect(struct kunit *test)
>   	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
>   }
>   
> +static void drm_test_rect_calc_hscale(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 2 << 16, 0);
> +	drm_rect_init(&dst, 0, 0, 1 << 16, 0);

What about the case that dst_w == 0?

Best Regards,
- Maíra Canal

> +
> +	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 0, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
> +}
> +
> +static void drm_test_rect_calc_hscale_out_of_range(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 10 << 16, 0);
> +	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
> +
> +	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
> +
> +	drm_rect_init(&src, 0, 0, 2 << 16, 0);
> +	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
> +
> +	scaling_factor =  drm_rect_calc_hscale(&src, &dst, 3, 5);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
> +}
> +
> +static void drm_test_rect_calc_hscale_negative_args(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, -1 << 16, 0);
> +	drm_rect_init(&dst, 0, 0, 1 << 16, 0);
> +
> +	scaling_factor = drm_rect_calc_hscale(&src, &dst, 0, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
> +
> +	drm_rect_init(&src, 0, 0, 1 << 16, 0);
> +	drm_rect_init(&dst, 0, 0, -1 << 16, 0);
> +
> +	scaling_factor = drm_rect_calc_hscale(&src, &dst, 0, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
>   	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
> +	KUNIT_CASE(drm_test_rect_calc_hscale),
> +	KUNIT_CASE(drm_test_rect_calc_hscale_out_of_range),
> +	KUNIT_CASE(drm_test_rect_calc_hscale_negative_args),
>   	{ }
>   };
>   
