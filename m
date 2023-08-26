Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E788078973B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 16:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6E610E18F;
	Sat, 26 Aug 2023 14:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C2610E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:16:36 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RXzQW6DTvz9sXW;
 Sat, 26 Aug 2023 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693059395; bh=akNpmDSrsf7ldymK7sOTkwHiGr+Vk4PlGk1r7s8TsKE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=btVrHEwnS4eIIf3+v4aq11eB1Rg7M6u9Mi62E3FYNU/gFazTK2uAq6x79rvX3j2Om
 9YM387sjBx423+jd/ObjZt2WHPpAt03hrN2qInKnYS5HDts3JTp1xWwvghJaDp70TX
 OiA2gSEKE+t/dO8ystnx2F608+LX+lRkSunukqwI=
X-Riseup-User-ID: A10225CA138378BFEF24414255CFCA5F4FDF803FC6599270D1C3C328884C03EE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXzQS42C2zJnsh;
 Sat, 26 Aug 2023 14:16:32 +0000 (UTC)
Message-ID: <e0d67231-f970-f835-6327-13e9e97a752d@riseup.net>
Date: Sat, 26 Aug 2023 11:16:30 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] drm/tests: Add test for drm_framebuffer_init()
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825161108.13701-1-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825161108.13701-1-gcarlos@disroot.org>
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

On 8/25/23 13:11, Carlos Eduardo Gallo Filho wrote:
> Add a single KUnit test case for the drm_framebuffer_init function.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 52 ++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index 3d14d35b4c4d..50d88bf3fa65 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -557,8 +557,60 @@ static void drm_test_framebuffer_lookup(struct kunit *test)
>   	KUNIT_EXPECT_NULL(test, fb2);
>   }
>   
> +static void drm_test_framebuffer_init(struct kunit *test)
> +{
> +	struct drm_mock *mock = test->priv;
> +	struct drm_device *dev = &mock->dev;
> +	struct drm_device wrong_drm = { };
> +	struct drm_format_info format = { };
> +	struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
> +	struct drm_framebuffer *fb2;
> +	struct drm_framebuffer_funcs funcs = { };
> +	int ret;
> +
> +	/* Fails if fb->dev doesn't point to the drm_device passed on first arg */
> +	fb1.dev = &wrong_drm;
> +	ret = drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +	fb1.dev = dev;
> +
> +	/* Fails if fb.format isn't set */
> +	fb1.format = NULL;
> +	ret = drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
> +	fb1.format = &format;
> +
> +	ret = drm_framebuffer_init(dev, &fb1, &funcs);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	/*
> +	 * Check if fb->funcs is actually set to the drm_framebuffer_funcs
> +	 * passed to it
> +	 */
> +	KUNIT_EXPECT_PTR_EQ(test, fb1.funcs, &funcs);
> +
> +	/* The fb->comm must be set to the current running process */
> +	KUNIT_EXPECT_STREQ(test, fb1.comm, current->comm);
> +
> +	/* The fb->base must be successfully initialized */
> +	KUNIT_EXPECT_EQ(test, fb1.base.id, 1);
> +	KUNIT_EXPECT_EQ(test, fb1.base.type, DRM_MODE_OBJECT_FB);
> +	KUNIT_EXPECT_EQ(test, kref_read(&fb1.base.refcount), 1);
> +	KUNIT_EXPECT_PTR_EQ(test, fb1.base.free_cb, &drm_framebuffer_free);
> +
> +	/* Checks if the fb is really published and findable */
> +	fb2 = drm_framebuffer_lookup(dev, NULL, fb1.base.id);
> +	KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
> +
> +	/* There must be just that one fb initialized */
> +	KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
> +	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, &fb1.head);
> +	KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, &fb1.head);

Shouldn't we clean the framebuffer object?

Best Regards,
- Maíra

> +}
> +
>   static struct kunit_case drm_framebuffer_tests[] = {
>   	KUNIT_CASE(drm_test_framebuffer_cleanup),
> +	KUNIT_CASE(drm_test_framebuffer_init),
>   	KUNIT_CASE(drm_test_framebuffer_lookup),
>   	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>   	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
