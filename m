Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0A7990FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10FD10E0FB;
	Fri,  8 Sep 2023 20:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE97D10E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:30:09 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Rj75Y3XlkzDqMF;
 Fri,  8 Sep 2023 20:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1694205009; bh=gDzKMyE9VlLQ32iC39cf3aQDH2SMeHU+7iQRmkRvjpc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JHwUQeA92F88HF06Yp6W91Y9M1vaqZddJFg+mj3duw4HKIMjlSHcuyuSf4XsddwN7
 rr6Ma4Htks1IshjzqbGapzAWZ4hY8gTznb7OMwhkfaXmo1DVSupEMdV4aVC9z0SO6l
 cYayDUbgzazBg41GYqSICFGT225zHCNN/LZci43I=
X-Riseup-User-ID: 31F36F2EB33F649AE717090F4B5CE1EEE65A9A35B213FD3E976C591591ADEB0B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rj75F4lTjzJnCB;
 Fri,  8 Sep 2023 20:29:53 +0000 (UTC)
Message-ID: <9a128eff-df0f-49fb-d57f-3389a1e2ff62@riseup.net>
Date: Fri, 8 Sep 2023 17:29:54 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 03/10] drm/tests: Add test case for
 drm_internal_framebuffer_create()
Content-Language: en-US
To: Carlos <gcarlos@disroot.org>, dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-4-gcarlos@disroot.org>
 <59f0c24e-6483-3242-2af8-a2fac5697425@riseup.net>
 <3a1a7cf0-a6b5-a49c-d2d5-70b98dac2090@disroot.org>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <3a1a7cf0-a6b5-a49c-d2d5-70b98dac2090@disroot.org>
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

On 9/4/23 13:57, Carlos wrote:
> Hi Maíra,
> 
> On 8/26/23 10:58, Maíra Canal wrote:
>> Hi Carlos,
>>
>> On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
>>> Introduce a test to cover the creation of framebuffer with
>>> modifier on a device that doesn't support it.
>>>
>>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>>> ---
>>>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c 
>>> b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>>> index aeaf2331f9cc..b20871e88995 100644
>>> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>>> @@ -396,7 +396,35 @@ static void drm_framebuffer_test_to_desc(const 
>>> struct drm_framebuffer_test *t, c
>>>   KUNIT_ARRAY_PARAM(drm_framebuffer_create, 
>>> drm_framebuffer_create_cases,
>>>             drm_framebuffer_test_to_desc);
>>>   +/*
>>> + * This test is very similar to drm_test_framebuffer_create, except 
>>> that it
>>> + * set mock->mode_config.fb_modifiers_not_supported member to 1, 
>>> covering
>>> + * the case of trying to create a framebuffer with modifiers without 
>>> the
>>> + * device really supporting it.
>>> + */
>>> +static void drm_test_framebuffer_modifiers_not_supported(struct 
>>> kunit *test)
>>> +{
>>> +    struct drm_mock *mock = test->priv;
>>> +    struct drm_device *dev = &mock->dev;
>>> +    int buffer_created = 0;
>>> +
>>> +    /* A valid cmd with modifier */
>>> +    struct drm_mode_fb_cmd2 cmd = {
>>> +        .width = MAX_WIDTH, .height = MAX_HEIGHT,
>>> +        .pixel_format = DRM_FORMAT_ABGR8888, .handles = { 1, 0, 0 },
>>> +        .offsets = { UINT_MAX / 2, 0, 0 }, .pitches = { 4 * 
>>> MAX_WIDTH, 0, 0 },
>>> +        .flags = DRM_MODE_FB_MODIFIERS,
>>> +    };
>>> +
>>> +    mock->private = &buffer_created;
>>> +    dev->mode_config.fb_modifiers_not_supported = 1;
>>> +
>>> +    drm_internal_framebuffer_create(dev, &cmd, NULL);
>>> +    KUNIT_EXPECT_EQ(test, 0, buffer_created);
>>> +}
>>> +
>>>   static struct kunit_case drm_framebuffer_tests[] = {
>>> +    KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>>
>> Could we preserve alphabetical order?
>>
> I've see a lot of other tests files with this ordered by every KUNIT_CASE()
> coming before KUNIT_CASE_PARAM(), with each set ordered among themselves.
> Did younoticed that or are you suggesting ordering it even so? Or maybe
> you're referring about another unordered thing that I didn't noticed?

Actually, I was suggesting to keep the alphabetical order related to the
tests naming. So, drm_test_framebuffer_create would come ahead of
drm_test_framebuffer_modifiers_not_supported.


Best Regards,
- Maíra

> 
> Thanks,
> Carlos
> 
>> Best Regards,
>> - Maíra
>>
>>> KUNIT_CASE_PARAM(drm_test_framebuffer_create, 
>>> drm_framebuffer_create_gen_params),
>>>       { }
>>>   };
