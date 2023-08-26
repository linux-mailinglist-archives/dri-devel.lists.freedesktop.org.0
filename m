Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166DD789739
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 16:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD23510E18E;
	Sat, 26 Aug 2023 14:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F40F10E18E
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:13:56 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RXzMR5ryvz9sh4;
 Sat, 26 Aug 2023 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693059236; bh=5fzuW7alyfxAGyy31W9QIFYaOhNx/h9dz+YJCeLWrss=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GZ+x3xt1KacMUzTGMjuNismxyoHuDDff1n6imqHJtjI3xFjOTKRtoo+kfHI+F+ILX
 TcZptUQUnIqXsh52+itJTfkVnGhOk2SnDwT+TBqTAiDE3xmNH37IGBNbNo04Mdsquu
 XJDRUlF5Tw/m7zllhiR9p3hifyioiaCi3tod7Nnw=
X-Riseup-User-ID: C8E2CA47E64784FFE8ECA7076E52AC1555010198D2B21CD9C90CA72C50E937BB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXzMN5gwgzJqBc;
 Sat, 26 Aug 2023 14:13:52 +0000 (UTC)
Message-ID: <4501ea3a-071a-47ee-5887-8e1e78e84282@riseup.net>
Date: Sat, 26 Aug 2023 11:13:51 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 06/10] drm/tests: Add test for drm_framebuffer_lookup()
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-7-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825160725.12861-7-gcarlos@disroot.org>
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
> Add a single KUnit test case for the drm_framebuffer_lookup function.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index 16d9cf4bed88..3d14d35b4c4d 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -8,6 +8,7 @@
>   #include <kunit/test.h>
>   
>   #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_mode.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_fourcc.h>
> @@ -370,6 +371,10 @@ static int drm_framebuffer_test_init(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
>   	dev = &mock->dev;
>   
> +	dev->driver = kunit_kzalloc(test, sizeof(*dev->driver), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev->driver);
> +
> +	idr_init_base(&dev->mode_config.object_idr, 1);

Shouldn't we start to use drm_framebuffer_init()?

Best Regards,
- Maíra

>   	mutex_init(&dev->mode_config.fb_lock);
>   	INIT_LIST_HEAD(&dev->mode_config.fb_list);
>   	dev->mode_config.num_fb = 0;
> @@ -530,8 +535,31 @@ static void drm_test_framebuffer_cleanup(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
>   }
>   
> +static void drm_test_framebuffer_lookup(struct kunit *test)
> +{
> +	struct drm_mock *mock = test->priv;
> +	struct drm_device *dev = &mock->dev;
> +	struct drm_framebuffer fb1 = { };
> +	struct drm_framebuffer *fb2;
> +	uint32_t id = 0;
> +	int ret;
> +
> +	ret = drm_mode_object_add(dev, &fb1.base, DRM_MODE_OBJECT_FB);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	id = fb1.base.id;
> +
> +	/* Looking for fb1 */
> +	fb2 = drm_framebuffer_lookup(dev, NULL, id);
> +	KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
> +
> +	/* Looking for an inexistent framebuffer */
> +	fb2 = drm_framebuffer_lookup(dev, NULL, id + 1);
> +	KUNIT_EXPECT_NULL(test, fb2);
> +}
> +
>   static struct kunit_case drm_framebuffer_tests[] = {
>   	KUNIT_CASE(drm_test_framebuffer_cleanup),
> +	KUNIT_CASE(drm_test_framebuffer_lookup),
>   	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>   	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
