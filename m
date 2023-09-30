Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55C7B418C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 17:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A956E10E167;
	Sat, 30 Sep 2023 15:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3DF10E167
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 15:17:12 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RyW6H75ZczDqPT;
 Sat, 30 Sep 2023 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1696087032; bh=mGwncjVvn9Q1n/4UOt+Ol5PIuRTFGIsgWcj//XGPdsE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dKhv/SglRatkezq55mUaVG16r47J1XbLIdRTWYY6QL2h7ez7SM2CjR+umTlxsiqUF
 AoaIUO5c+W5l/0tz1/6AoE5N5gIh2XgIiZ2Uc+9WUWJXOKkVQ8WwFNG00J97E8wIoJ
 sH10kOGQnghB7nJcsPq/Q2R87b6Lof/1hBFJIElg=
X-Riseup-User-ID: 3D6AA3F460CEDC86DC6B980F97D48256B19F6D666D86D7FF3B661C6FAC750E61
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RyW6D4ZJZzJnCB;
 Sat, 30 Sep 2023 15:17:08 +0000 (UTC)
Message-ID: <091e1c1c-3c96-5888-56c4-ec726e3f2bde@riseup.net>
Date: Sat, 30 Sep 2023 12:17:06 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/tests: Fix kunit_release_action ctx argument
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
 <20230920-kunit-kasan-fixes-v1-1-1a0fc261832d@riseup.net>
 <771e3ddf-aa15-5ff9-9689-ec0e02bc803a@riseup.net>
 <8aab614e-1624-413d-693a-5934be6cdf8e@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <8aab614e-1624-413d-693a-5934be6cdf8e@riseup.net>
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
Cc: tales.aparecida@gmail.com, andrealmeid@riseup.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 9/27/23 19:52, Arthur Grillo wrote:
> 
> 
> On 27/09/23 19:47, Maira Canal wrote:
>> Hi Arthur,
>>
>> On 9/20/23 03:11, Arthur Grillo wrote:
>>> The kunit_action_platform_driver_unregister is added with
>>> &fake_platform_driver as ctx, but the kunit_release_action is called
>>> pdev as ctx. Fix that by replacing it with &fake_platform_driver.
>>>
>>> Fixes: 4f2b0b583baa ("drm/tests: helpers: Switch to kunit actions")
>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>>
>> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
>>
>> Do you need me to apply this patch to drm-misc-fixes?
> 
> Yes, please do, if possible.

Applied to drm-misc/drm-misc-fixes!

Thanks,
- Maíra

> 
> Thanks,
> ~Arthur Grillo
> 
>>
>> Best Regards,
>> - Maíra
>>
>>> ---
>>>    drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>>> index 3d624ff2f651..3150dbc647ee 100644
>>> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
>>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>>> @@ -118,7 +118,7 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
>>>          kunit_release_action(test,
>>>                     kunit_action_platform_driver_unregister,
>>> -                 pdev);
>>> +                 &fake_platform_driver);
>>>    }
>>>    EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
>>>   
