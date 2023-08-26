Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B378971D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 16:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F080610E187;
	Sat, 26 Aug 2023 14:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6617310E187
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:05:09 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RXz9J5Cxsz9sh4;
 Sat, 26 Aug 2023 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693058708; bh=JusKLvWmEB483aOPXlAjh/hOhPfwoWS2sRK7OiBj6i0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L5wmatgn5FTpn6dBwpIfBf9eu95jTsTHoEB6kuBpYDs7ZPu2cm7dV4nO8iRDZm4AN
 6aYtEj3fHQCSl1ocliHYrPks77qNkuExCwFZWAx4QmMXzhMso+5Y6m+xy4oN2IvOsH
 hCcvzlRGA7zVg41R7i64SLjYBpxaQRp2AxXTVb1g=
X-Riseup-User-ID: CC606590CB327A0B401D58937B754129583B3677A165A4E7DEC4617849E47C9A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXz924rg7zJn99;
 Sat, 26 Aug 2023 14:04:54 +0000 (UTC)
Message-ID: <6f4c9e29-c376-94c0-f8e6-9a5577c8df58@riseup.net>
Date: Sat, 26 Aug 2023 11:04:52 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 04/10] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-5-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825160725.12861-5-gcarlos@disroot.org>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos,

On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
> Add a parametrized test for the drm_framebuffer_check_src_coords function.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/drm_framebuffer.c            |  1 +
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 61 ++++++++++++++++++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index aff3746dedfb..9fbf3c85618f 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -99,6 +99,7 @@ int drm_framebuffer_check_src_coords(uint32_t src_x, uint32_t src_y,
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_framebuffer_check_src_coords);
>   
>   /**
>    * drm_mode_addfb - add an FB to the graphics configuration
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index b20871e88995..0e0e8216bbbc 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -9,11 +9,15 @@
>   
>   #include <drm/drm_device.h>
>   #include <drm/drm_mode.h>
> +#include <drm/drm_framebuffer.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_print.h>
>   
>   #include "../drm_crtc_internal.h"
>   
> +#define FB_WIDTH  800
> +#define FB_HEIGHT 600
> +
>   #define MIN_WIDTH 4
>   #define MAX_WIDTH 4096
>   #define MIN_HEIGHT 4
> @@ -423,8 +427,65 @@ static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, 0, buffer_created);
>   }
>   
> +/* Parameters for testing drm_framebuffer_check_src_coords function */
> +struct check_src_coords_case {

Could we preserve the drm_framebuffer_ prefix?

> +	const char *name; /* Description of the parameter case */
> +	const int expect; /* Expected return value by the function */

I'm not sure if those comments are needed.

> +
> +	/* Deltas to be applied on source */
> +	const uint32_t dsrc_x;
> +	const uint32_t dsrc_y;
> +	const uint32_t dsrc_w;
> +	const uint32_t dsrc_h;
> +};
> +
> +static const struct check_src_coords_case check_src_coords_cases[] = {
> +	{ .name = "Success: source fits into fb",
> +	  .expect = 0,
> +	},
> +	{ .name = "Fail: overflowing fb with x-axis coordinate",
> +	  .expect = -ENOSPC, .dsrc_x = 1,
> +	},
> +	{ .name = "Fail: overflowing fb with y-axis coordinate",
> +	  .expect = -ENOSPC, .dsrc_y = 1,
> +	},
> +	{ .name = "Fail: overflowing fb with source width",
> +	  .expect = -ENOSPC, .dsrc_w = 1,
> +	},
> +	{ .name = "Fail: overflowing fb with source height",
> +	  .expect = -ENOSPC, .dsrc_h = 1,
> +	},
> +};
> +
> +static void drm_test_framebuffer_check_src_coords(struct kunit *test)
> +{
> +	const struct check_src_coords_case *params = test->param_value;
> +	const uint32_t src_x = 0 + params->dsrc_x;
> +	const uint32_t src_y = 0 + params->dsrc_y;
> +	const uint32_t src_w = (FB_WIDTH << 16) + params->dsrc_w;
> +	const uint32_t src_h = (FB_HEIGHT << 16) + params->dsrc_h;
> +	const struct drm_framebuffer fb = {
> +		.width  = FB_WIDTH,
> +		.height = FB_HEIGHT,

Couldn't FB_WIDTH and FB_HEIGHT be tests parameters that we variate? I
would like to see edge cases like width = height = 0 and width = height
= INT_MAX.

Best Regards,
- Maíra

> +	};
> +	int ret;
> +
> +	ret = drm_framebuffer_check_src_coords(src_x, src_y, src_w, src_h, &fb);
> +	KUNIT_EXPECT_EQ(test, ret, params->expect);
> +}
> +
> +static void check_src_coords_test_to_desc(const struct check_src_coords_case *t,
> +					  char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
> +		  check_src_coords_test_to_desc);
> +
>   static struct kunit_case drm_framebuffer_tests[] = {
>   	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
> +	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
>   	{ }
>   };
