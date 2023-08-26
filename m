Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D651078970D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 15:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA9410E0E5;
	Sat, 26 Aug 2023 13:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBADB10E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 13:58:24 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RXz1X1nTfzDqNj;
 Sat, 26 Aug 2023 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693058304; bh=9gWRnmtspJTE+4Dl8ikhA5ssthrDcwfJ8Q5ZJkSObT8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MSiHQH/xOVuF/g9WYC/I9SXNkpLrw179ji3XtALBrnizqRQSzzGbZoMyds8ebLNfE
 w5giSebVJsnxiX45TLDsqbrscNCjQgdGf82CSdcwvjHZEmyquDIPbb0j65qdergH5y
 TiWfIAQ7L6VGuexLhStAy86wUPwVDBNZBKs4fSkw=
X-Riseup-User-ID: B09C6D3F3B76B610E07D49F860B319EE9EC9563A161B9CE2C3E25FB472881C26
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXz1T284jzJq70;
 Sat, 26 Aug 2023 13:58:21 +0000 (UTC)
Message-ID: <59f0c24e-6483-3242-2af8-a2fac5697425@riseup.net>
Date: Sat, 26 Aug 2023 10:58:19 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 03/10] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-4-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825160725.12861-4-gcarlos@disroot.org>
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
> Introduce a test to cover the creation of framebuffer with
> modifier on a device that doesn't support it.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index aeaf2331f9cc..b20871e88995 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -396,7 +396,35 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
>   KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
>   		  drm_framebuffer_test_to_desc);
>   
> +/*
> + * This test is very similar to drm_test_framebuffer_create, except that it
> + * set mock->mode_config.fb_modifiers_not_supported member to 1, covering
> + * the case of trying to create a framebuffer with modifiers without the
> + * device really supporting it.
> + */
> +static void drm_test_framebuffer_modifiers_not_supported(struct kunit *test)
> +{
> +	struct drm_mock *mock = test->priv;
> +	struct drm_device *dev = &mock->dev;
> +	int buffer_created = 0;
> +
> +	/* A valid cmd with modifier */
> +	struct drm_mode_fb_cmd2 cmd = {
> +		.width = MAX_WIDTH, .height = MAX_HEIGHT,
> +		.pixel_format = DRM_FORMAT_ABGR8888, .handles = { 1, 0, 0 },
> +		.offsets = { UINT_MAX / 2, 0, 0 }, .pitches = { 4 * MAX_WIDTH, 0, 0 },
> +		.flags = DRM_MODE_FB_MODIFIERS,
> +	};
> +
> +	mock->private = &buffer_created;
> +	dev->mode_config.fb_modifiers_not_supported = 1;
> +
> +	drm_internal_framebuffer_create(dev, &cmd, NULL);
> +	KUNIT_EXPECT_EQ(test, 0, buffer_created);
> +}
> +
>   static struct kunit_case drm_framebuffer_tests[] = {
> +	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),

Could we preserve alphabetical order?

Best Regards,
- Maíra

>   	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
>   	{ }
>   };
