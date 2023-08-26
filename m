Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D7789727
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 16:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E7210E18D;
	Sat, 26 Aug 2023 14:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106410E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 14:06:46 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RXzCB2zTTzDqm0;
 Sat, 26 Aug 2023 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1693058806; bh=OTa5q2QApZXvFkfgwGKgOc+bObgWJVl7G1lbM3lEFRQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QseDOvuRoG4ov/kJzkoZ8paEKhhYG0I16ECj50xvlcBPtbLb83LwstlXZ7B4izJcl
 ISUtBpy5QlDIpeplMosTSSkI55dFbQyEuCTxnqivHqbZKehr+242M6xomVJQdNXXx/
 y/Nivr7sGvS2SoSLln4E74iwTpdD6MfstGdzsWFE=
X-Riseup-User-ID: 9E20D27799A7CD622577380FCD3AC4639E7B4E9CAA5D59D034BBF24EA0E86F72
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RXzC72JrRzJqBv;
 Sat, 26 Aug 2023 14:06:43 +0000 (UTC)
Message-ID: <b78cc390-3d2f-1f02-23e1-7f94d38d03a4@riseup.net>
Date: Sat, 26 Aug 2023 11:06:41 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 05/10] drm/tests: Add test for drm_framebuffer_cleanup()
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-6-gcarlos@disroot.org>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230825160725.12861-6-gcarlos@disroot.org>
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
> Add a single KUnit test case for the drm_framebuffer_cleanup function.
> 
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
> ---
>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 49 ++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> index 0e0e8216bbbc..16d9cf4bed88 100644
> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
> @@ -370,6 +370,9 @@ static int drm_framebuffer_test_init(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
>   	dev = &mock->dev;
>   
> +	mutex_init(&dev->mode_config.fb_lock);

What about drmm_mutex_init()?

Best Regards,
- Maíra

> +	INIT_LIST_HEAD(&dev->mode_config.fb_list);
> +	dev->mode_config.num_fb = 0;
>   	dev->mode_config.min_width = MIN_WIDTH;
>   	dev->mode_config.max_width = MAX_WIDTH;
>   	dev->mode_config.min_height = MIN_HEIGHT;
> @@ -380,6 +383,14 @@ static int drm_framebuffer_test_init(struct kunit *test)
>   	return 0;
>   }
>   
> +static void drm_framebuffer_test_exit(struct kunit *test)
> +{
> +	struct drm_mock *mock = test->priv;
> +	struct drm_device *dev = &mock->dev;
> +
> +	mutex_destroy(&dev->mode_config.fb_lock);
> +}
> +
>   static void drm_test_framebuffer_create(struct kunit *test)
>   {
>   	const struct drm_framebuffer_test *params = test->param_value;
> @@ -483,7 +494,44 @@ static void check_src_coords_test_to_desc(const struct check_src_coords_case *t,
>   KUNIT_ARRAY_PARAM(check_src_coords, check_src_coords_cases,
>   		  check_src_coords_test_to_desc);
>   
> +static void drm_test_framebuffer_cleanup(struct kunit *test)
> +{
> +	struct drm_mock *mock = test->priv;
> +	struct drm_device *dev = &mock->dev;
> +	struct list_head *fb_list = &dev->mode_config.fb_list;
> +	struct drm_framebuffer fb1 = { .dev = dev };
> +	struct drm_framebuffer fb2 = { .dev = dev };
> +
> +	/* This must result on [fb_list] -> fb1 -> fb2 */
> +	list_add_tail(&fb1.head, fb_list);
> +	list_add_tail(&fb2.head, fb_list);
> +	dev->mode_config.num_fb = 2;
> +
> +	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb1.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb1.head.prev, fb_list);
> +	KUNIT_ASSERT_PTR_EQ(test, fb1.head.next, &fb2.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, &fb1.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
> +
> +	drm_framebuffer_cleanup(&fb1);
> +
> +	/* Now [fb_list] -> fb2 */
> +	KUNIT_ASSERT_PTR_EQ(test, fb_list->prev, &fb2.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb_list->next, &fb2.head);
> +	KUNIT_ASSERT_PTR_EQ(test, fb2.head.prev, fb_list);
> +	KUNIT_ASSERT_PTR_EQ(test, fb2.head.next, fb_list);
> +	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 1);
> +
> +	drm_framebuffer_cleanup(&fb2);
> +
> +	/* Now fb_list is empty */
> +	KUNIT_ASSERT_TRUE(test, list_empty(fb_list));
> +	KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
> +}
> +
>   static struct kunit_case drm_framebuffer_tests[] = {
> +	KUNIT_CASE(drm_test_framebuffer_cleanup),
>   	KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>   	KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, check_src_coords_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_framebuffer_create, drm_framebuffer_create_gen_params),
> @@ -493,6 +541,7 @@ static struct kunit_case drm_framebuffer_tests[] = {
>   static struct kunit_suite drm_framebuffer_test_suite = {
>   	.name = "drm_framebuffer",
>   	.init = drm_framebuffer_test_init,
> +	.exit = drm_framebuffer_test_exit,
>   	.test_cases = drm_framebuffer_tests,
>   };
>   
