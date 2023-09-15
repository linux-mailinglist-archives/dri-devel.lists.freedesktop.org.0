Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB47A12CD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 03:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF1510E5BC;
	Fri, 15 Sep 2023 01:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E886A10E2BB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 01:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2A110402BF;
 Fri, 15 Sep 2023 03:11:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ph1OUOheECLn; Fri, 15 Sep 2023 03:11:37 +0200 (CEST)
Message-ID: <fc5e8ee4-20fa-a31a-2461-8e7b47e9cb9f@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1694740297; bh=DT+VUOOsRxop+bmlw6qkJ/Pr6cbDRxJGeZpt3LLLXCQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZD3WpKCK3TFQ6VBLERXayzjn6cNhDj5GYTiAuNZiLExy8G8Gt3qiNm8nzOgQpC04O
 Cu97rj77NraiQdiPDxPJoKj+287VTt9/NdFqYtqx8fQdPghMnwHElwQfP1YqPOXbWD
 bEaANYv85O4uJzRDISc22dVk6Psxc8UouQrBrhbIGaX4VLoVxvKEfkUA/Aeg0etK1b
 kMGcJ6GO54GcSCD/Un/RyWd9BS2NFR4Bg0u7yPNTvqXXJQmf96WTVr+uQlFDP1nifu
 dMNHiKrXUnnokJs41ZI4Fm/wukfRgQwMkRzlJelVA4+oSS8GoHWVp3XonuPEZO+Enx
 l9pAKa688QONQ==
Date: Thu, 14 Sep 2023 22:11:52 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] drm/tests: Add test for drm_framebuffer_init()
Content-Language: en-US
To: Maira Canal <mairacanal@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230825161108.13701-1-gcarlos@disroot.org>
 <e0d67231-f970-f835-6327-13e9e97a752d@riseup.net>
 <c9c08978-f42f-3653-0b07-a628c7318406@disroot.org>
 <8790dbd1-525e-faba-717f-3af1eda02a5b@riseup.net>
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <8790dbd1-525e-faba-717f-3af1eda02a5b@riseup.net>
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

Hi Maíra,

On 9/8/23 5:22 PM, Maira Canal wrote:
> Hi Carlos,
>
> On 9/4/23 14:41, Carlos wrote:
>> Hi Maíra,
>>
>> On 8/26/23 11:16, Maíra Canal wrote:
>>> Hi Carlos,
>>>
>>> On 8/25/23 13:11, Carlos Eduardo Gallo Filho wrote:
>>>> Add a single KUnit test case for the drm_framebuffer_init function.
>>>>
>>>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>>>> ---
>>>>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 52 
>>>> ++++++++++++++++++++
>>>>   1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c 
>>>> b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>>>> index 3d14d35b4c4d..50d88bf3fa65 100644
>>>> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>>>> @@ -557,8 +557,60 @@ static void drm_test_framebuffer_lookup(struct 
>>>> kunit *test)
>>>>       KUNIT_EXPECT_NULL(test, fb2);
>>>>   }
>>>>   +static void drm_test_framebuffer_init(struct kunit *test)
>>>> +{
>>>> +    struct drm_mock *mock = test->priv;
>>>> +    struct drm_device *dev = &mock->dev;
>>>> +    struct drm_device wrong_drm = { };
>>>> +    struct drm_format_info format = { };
>>>> +    struct drm_framebuffer fb1 = { .dev = dev, .format = &format };
>>>> +    struct drm_framebuffer *fb2;
>>>> +    struct drm_framebuffer_funcs funcs = { };
>>>> +    int ret;
>>>> +
>>>> +    /* Fails if fb->dev doesn't point to the drm_device passed on 
>>>> first arg */
>>>> +    fb1.dev = &wrong_drm;
>>>> +    ret = drm_framebuffer_init(dev, &fb1, &funcs);
>>>> +    KUNIT_EXPECT_EQ(test, ret, -EINVAL);
>>>> +    fb1.dev = dev;
>>>> +
>>>> +    /* Fails if fb.format isn't set */
>>>> +    fb1.format = NULL;
>>>> +    ret = drm_framebuffer_init(dev, &fb1, &funcs);
>>>> +    KUNIT_EXPECT_EQ(test, ret, -EINVAL);
>>>> +    fb1.format = &format;
>>>> +
>>>> +    ret = drm_framebuffer_init(dev, &fb1, &funcs);
>>>> +    KUNIT_EXPECT_EQ(test, ret, 0);
>>>> +
>>>> +    /*
>>>> +     * Check if fb->funcs is actually set to the 
>>>> drm_framebuffer_funcs
>>>> +     * passed to it
>>>> +     */
>>>> +    KUNIT_EXPECT_PTR_EQ(test, fb1.funcs, &funcs);
>>>> +
>>>> +    /* The fb->comm must be set to the current running process */
>>>> +    KUNIT_EXPECT_STREQ(test, fb1.comm, current->comm);
>>>> +
>>>> +    /* The fb->base must be successfully initialized */
>>>> +    KUNIT_EXPECT_EQ(test, fb1.base.id, 1);
>>>> +    KUNIT_EXPECT_EQ(test, fb1.base.type, DRM_MODE_OBJECT_FB);
>>>> +    KUNIT_EXPECT_EQ(test, kref_read(&fb1.base.refcount), 1);
>>>> +    KUNIT_EXPECT_PTR_EQ(test, fb1.base.free_cb, 
>>>> &drm_framebuffer_free);
>
> BTW I believe we should also make sure that dev->mode_config.num_fb was
> incremented by 1.
Isn't that already tested below? Since the start value for
dev->mode_config.num_fb is 0, by expecting it to be 1 seems
to test that it's being incremented by 1. Or what are you suggesting
it to let it more explicit?
>
>>>> +
>>>> +    /* Checks if the fb is really published and findable */
>>>> +    fb2 = drm_framebuffer_lookup(dev, NULL, fb1.base.id);
>>>> +    KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
>>>> +
>>>> +    /* There must be just that one fb initialized */
>>>> +    KUNIT_EXPECT_EQ(test, dev->mode_config.num_fb, 1);
>>>> +    KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.prev, 
>>>> &fb1.head);
>>>> +    KUNIT_EXPECT_PTR_EQ(test, dev->mode_config.fb_list.next, 
>>>> &fb1.head);
>>>
>>> Shouldn't we clean the framebuffer object?
>> What did you mean by "clean"? Firstly I supposed that it would be about
>> freeing some dynamically allocated frambuffer, but it's statically
>> allocated, so I believe it isn't what you are meaning. Is there some
>> collateral effect I'm not taking into account?
>
> I was talking about calling the function `drm_framebuffer_cleanup()`.
Would you explain why we should need that here? Since the drm_device
(and that fb, of course) is destroyed after the test, do we need to
worry about this?

Thanks,
Carlos

>
> Best Regards,
> - Maíra
>
>>
>> Thanks,
>> Carlos
>>
>>> Best Regards,
>>> - Maíra
>>>
>>>> +}
>>>> +
>>>>   static struct kunit_case drm_framebuffer_tests[] = {
>>>>       KUNIT_CASE(drm_test_framebuffer_cleanup),
>>>> +    KUNIT_CASE(drm_test_framebuffer_init),
>>>>       KUNIT_CASE(drm_test_framebuffer_lookup),
>>>> KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>>>> KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, 
>>>> check_src_coords_gen_params),
