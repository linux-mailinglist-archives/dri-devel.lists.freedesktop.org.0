Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C5789707
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 15:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A18610E0CD;
	Sat, 26 Aug 2023 13:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0392510E0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 13:54:14 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RXywk0HyDzDqfM;
 Sat, 26 Aug 2023 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693058054; bh=L7bkuc7SpsAXeAcOaFsZBXHMCaJ8XTsCWqK2UzEtSxU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BXGLpZXyoUKS6AZh0w+3mBgCbLkdYemMS73J2EcKpd3KXPUWFATwP/fMptqg3rj1D
 D4KKtAg/MIbBnt/d+GWSCT4c8oumo/QmMnNYVQeLo/IlRxyT86DKZNg6x5ZnBbppvJ
 nNBWSGozp3keN42oi2ajDq0f0duYxsZ+vHKbTEHY=
X-Riseup-User-ID: A02EBE18E8B8ECE9520EB9B41C8566E1B11D92E2951F8D32CFC1A6F5ABEBDD6B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXywR3CBCzJp1C;
 Sat, 26 Aug 2023 13:53:59 +0000 (UTC)
Message-ID: <43022720-5401-9da0-4483-1acf1d953b74@riseup.net>
Date: Sat, 26 Aug 2023 10:53:55 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] drm/tests: Stop using deprecated dev_private member
 on drm_framebuffer tests
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-2-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825160725.12861-2-gcarlos@disroot.org>
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
> The dev_private member of drm_device is deprecated and its use should
> be avoided. Stop using it by embedding the drm_device onto a mock struct
> with a void pointer like dev_private, using it instead.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 29 +++++++++++++-------
>   1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index f759d9f3b76e..173d42b145ed 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -317,11 +317,17 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
>   },
>   };
>   
> +struct drm_mock {
> +	struct drm_device dev;
> +	void *private;
> +};

Could we call it drm_device_mock or maybe drm_framebuffer_mock? I
believe that drm_mock its a bit generic.

Also, wouldn't be better to create a `int buffer_created` variable
instead of creating a `void *private`?

Best Regards,
- Maíra

> +
>   static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
>   					      struct drm_file *file_priv,
>   					      const struct drm_mode_fb_cmd2 *mode_cmd)
>   {
> -	int *buffer_created = dev->dev_private;
> +	struct drm_mock *mock = container_of(dev, typeof(*mock), dev);
> +	int *buffer_created = mock->private;
>   	*buffer_created = 1;
>   	return ERR_PTR(-EINVAL);
>   }
> @@ -332,16 +338,18 @@ static struct drm_mode_config_funcs mock_config_funcs = {
>   
>   static int drm_framebuffer_test_init(struct kunit *test)
>   {
> -	struct drm_device *mock;
> +	struct drm_mock *mock;
> +	struct drm_device *dev;
>   
>   	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
> +	dev = &mock->dev;
>   
> -	mock->mode_config.min_width = MIN_WIDTH;
> -	mock->mode_config.max_width = MAX_WIDTH;
> -	mock->mode_config.min_height = MIN_HEIGHT;
> -	mock->mode_config.max_height = MAX_HEIGHT;
> -	mock->mode_config.funcs = &mock_config_funcs;
> +	dev->mode_config.min_width = MIN_WIDTH;
> +	dev->mode_config.max_width = MAX_WIDTH;
> +	dev->mode_config.min_height = MIN_HEIGHT;
> +	dev->mode_config.max_height = MAX_HEIGHT;
> +	dev->mode_config.funcs = &mock_config_funcs;
>   
>   	test->priv = mock;
>   	return 0;
> @@ -350,11 +358,12 @@ static int drm_framebuffer_test_init(struct kunit *test)
>   static void drm_test_framebuffer_create(struct kunit *test)
>   {
>   	const struct drm_framebuffer_test *params = test->param_value;
> -	struct drm_device *mock = test->priv;
> +	struct drm_mock *mock = test->priv;
> +	struct drm_device *dev = &mock->dev;
>   	int buffer_created = 0;
>   
> -	mock->dev_private = &buffer_created;
> -	drm_internal_framebuffer_create(mock, &params->cmd, NULL);
> +	mock->private = &buffer_created;
> +	drm_internal_framebuffer_create(dev, &params->cmd, NULL);
>   	KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
>   }
>   
