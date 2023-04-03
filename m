Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F166D4C58
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095DF10E4DC;
	Mon,  3 Apr 2023 15:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E2610E4DC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4WCrq7Wt2klx1Jqo/a66qrPax/eTU9aAC3go2287yHA=; b=kUUz9669FyfcEHp9YQEwuBICJz
 6duDcJx3CzSqhba+8ssLnfSsgtFAqBRyuvCv7RY+zCOGGUFZmzUu79yrw9g3E4p9iUA074mSIWnJU
 Dn2QGiIFSmwfbEhWdcC5ZcTF5Umeg/TpQ+OJssvUWdkOpzAePABIlqkbX4C1cibbtjHCNXCE1mn1e
 hw5lWMCAuQ+dmHM1CJfYEzj3YM5BXoBLZXt5cIsJ9UAoH+QyvIjoGjMyPSZQiuH7KrZt4Btun8RVH
 aqLeCKE3BsuTsekOf65NIxSUb5+eMZRdEnPysKY25Wz3zaSRYVSflGfJ13JI752uP0wdQ1uw5byx6
 jvtzWvGw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pjMOg-003xHa-SN; Mon, 03 Apr 2023 17:47:06 +0200
Message-ID: <d03a4110-5bcb-7a3a-873e-efb9acf3c1ef@igalia.com>
Date: Mon, 3 Apr 2023 12:47:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/5] drm/tests: Test drm_rect_calc_vscale()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230327133848.5250-1-arthurgrillo@riseup.net>
 <20230327133848.5250-4-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230327133848.5250-4-arthurgrillo@riseup.net>
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
> Insert test for the drm_rect_vscale() function, besides the test
> for the usual case it also test for the exceptions.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 56 +++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index c282e1cf9c30..a14da86ef435 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -388,6 +388,59 @@ static void drm_test_rect_calc_hscale_negative_args(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
>   }
>   
> +static void drm_test_rect_calc_vscale(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 0, 2 << 16);
> +	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
> +

What about the case that dst_h == 0?

Best Regards,
- Maíra Canal

> +	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 0, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, 2);
> +}
> +
> +static void drm_test_rect_calc_vscale_out_of_range(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 0, 10 << 16);
> +	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
> +
> +	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 3, 5);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
> +
> +	drm_rect_init(&src, 0, 0, 0, 2 << 16);
> +	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
> +
> +	scaling_factor =  drm_rect_calc_vscale(&src, &dst, 3, 5);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -ERANGE);
> +}
> +
> +static void drm_test_rect_calc_vscale_negative_args(struct kunit *test)
> +{
> +	struct drm_rect src, dst;
> +	int scaling_factor;
> +
> +	drm_rect_init(&src, 0, 0, 0, -1 << 16);
> +	drm_rect_init(&dst, 0, 0, 0, 1 << 16);
> +
> +	scaling_factor = drm_rect_calc_vscale(&src, &dst, 0, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
> +
> +	drm_rect_init(&src, 0, 0, 0, 1 << 16);
> +	drm_rect_init(&dst, 0, 0, 0, -1 << 16);
> +
> +	scaling_factor = drm_rect_calc_vscale(&src, &dst, 0, INT_MAX);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
> @@ -397,6 +450,9 @@ static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_calc_hscale),
>   	KUNIT_CASE(drm_test_rect_calc_hscale_out_of_range),
>   	KUNIT_CASE(drm_test_rect_calc_hscale_negative_args),
> +	KUNIT_CASE(drm_test_rect_calc_vscale),
> +	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
> +	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
>   	{ }
>   };
>   
