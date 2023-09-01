Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B77901BD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 20:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E6A10E06F;
	Fri,  1 Sep 2023 18:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7024710E06F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 18:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0B3E741602;
 Fri,  1 Sep 2023 20:01:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PBIyA61i6m5; Fri,  1 Sep 2023 20:01:33 +0200 (CEST)
Message-ID: <038253c0-d617-500f-74ca-6fab087c85cd@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1693591293; bh=6k9Efd2XTuN08LuDfHaC5ZllyTMj3iNcht9FFfaBwRg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bka7dg338Uy1rh230PfVJsq5s8Ms0CaE2zcl5VLd4OZ7VpfHSbYIyByTMV5S4mkNu
 nViRqK8iUe0HHt5j9OHN7SOCJ328AM0OMEXhGeVKCsWYHzweLZq4oQhTp73urJ5097
 4INEeM6bHhQ9nfcipPVCO4Dwt8dXUQWG64zGOt8JJlAmigz3UjyDKQx3gjhGZ+FfZt
 wnIz5NSm99OYBAWvtOW9x4YCCzfc5CVD5biWu81HVwHgx+ibnDL8yDYugy5CxnoBx4
 zWZNxw47V5EmnNvBX1M3PhXtBBAj3CiGV0/mAQQ6jQrEiwrp004gQ3DXJeOtjo7grn
 JDwx/24AYNVaA==
Date: Fri, 1 Sep 2023 15:01:40 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] drm/tests: Stop using deprecated dev_private member
 on drm_framebuffer tests
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-2-gcarlos@disroot.org>
 <43022720-5401-9da0-4483-1acf1d953b74@riseup.net>
Content-Language: en-US
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <43022720-5401-9da0-4483-1acf1d953b74@riseup.net>
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

Hi Maíra, thanks for reviewing!

On 8/26/23 10:53 AM, Maíra Canal wrote:
> Hi Carlos,
>
> On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
>> The dev_private member of drm_device is deprecated and its use should
>> be avoided. Stop using it by embedding the drm_device onto a mock struct
>> with a void pointer like dev_private, using it instead.
>>
>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>> ---
>>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 29 +++++++++++++-------
>>   1 file changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c 
>> b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> index f759d9f3b76e..173d42b145ed 100644
>> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> @@ -317,11 +317,17 @@ static const struct drm_framebuffer_test 
>> drm_framebuffer_create_cases[] = {
>>   },
>>   };
>>   +struct drm_mock {
>> +    struct drm_device dev;
>> +    void *private;
>> +};
>
> Could we call it drm_device_mock or maybe drm_framebuffer_mock? I
> believe that drm_mock its a bit generic.
I could agree that it's a bit generic. Exclusively for this patch,
drm_device_mock could be a good candidate, but later in this patchset
I use that same struct to allocate a drm_file mock too, so I think
that the name must at least fit well to it too. In that case I would
prefer naming it drm_framebuffer_mock, but doesn't it looks like a
name for a drm_framebuffer mock, which isn't the case? I'm trying to
figure out another name to it but I'm not able to do that.
> Also, wouldn't be better to create a `int buffer_created` variable
> instead of creating a `void *private`?

Again, I could agree with that for this patch only, but the
`void *private` is used in that way in some other tests from this
series too. Anyway, I noticed that all but one test is using it to
"return" integer (boolean, to be honest) values from mocked
functions, except by the fb_create_addfb2_mock function on patch 9,
that use it to return a reference to a drm_framebuffer. So, in that
case,do you think it would be better to have explicitly some boolean on
the struct instead of this void pointer? If so, should I keep that void
pointer for fb_create_addfb2_mock use or should I replace it to a
drm_framebuffer pointer?

By the way, I guess that having a void pointer on a general purpose
struct like that would let further tests to adapt it to its own use,
but I don't really know if it worth the effort.

Thanks,
Carlos

> Best Regards,
> - Maíra
>
>> +
>>   static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
>>                             struct drm_file *file_priv,
>>                             const struct drm_mode_fb_cmd2 *mode_cmd)
>>   {
>> -    int *buffer_created = dev->dev_private;
>> +    struct drm_mock *mock = container_of(dev, typeof(*mock), dev);
>> +    int *buffer_created = mock->private;
>>       *buffer_created = 1;
>>       return ERR_PTR(-EINVAL);
>>   }
>> @@ -332,16 +338,18 @@ static struct drm_mode_config_funcs 
>> mock_config_funcs = {
>>     static int drm_framebuffer_test_init(struct kunit *test)
>>   {
>> -    struct drm_device *mock;
>> +    struct drm_mock *mock;
>> +    struct drm_device *dev;
>>         mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
>>       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
>> +    dev = &mock->dev;
>>   -    mock->mode_config.min_width = MIN_WIDTH;
>> -    mock->mode_config.max_width = MAX_WIDTH;
>> -    mock->mode_config.min_height = MIN_HEIGHT;
>> -    mock->mode_config.max_height = MAX_HEIGHT;
>> -    mock->mode_config.funcs = &mock_config_funcs;
>> +    dev->mode_config.min_width = MIN_WIDTH;
>> +    dev->mode_config.max_width = MAX_WIDTH;
>> +    dev->mode_config.min_height = MIN_HEIGHT;
>> +    dev->mode_config.max_height = MAX_HEIGHT;
>> +    dev->mode_config.funcs = &mock_config_funcs;
>>         test->priv = mock;
>>       return 0;
>> @@ -350,11 +358,12 @@ static int drm_framebuffer_test_init(struct 
>> kunit *test)
>>   static void drm_test_framebuffer_create(struct kunit *test)
>>   {
>>       const struct drm_framebuffer_test *params = test->param_value;
>> -    struct drm_device *mock = test->priv;
>> +    struct drm_mock *mock = test->priv;
>> +    struct drm_device *dev = &mock->dev;
>>       int buffer_created = 0;
>>   -    mock->dev_private = &buffer_created;
>> -    drm_internal_framebuffer_create(mock, &params->cmd, NULL);
>> +    mock->private = &buffer_created;
>> +    drm_internal_framebuffer_create(dev, &params->cmd, NULL);
>>       KUNIT_EXPECT_EQ(test, params->buffer_created, buffer_created);
>>   }
