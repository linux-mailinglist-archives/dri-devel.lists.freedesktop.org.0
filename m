Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11E7B0F21
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 00:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D3610E5C6;
	Wed, 27 Sep 2023 22:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67B810E5C2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 22:52:31 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RwsM31pWJzDr9m;
 Wed, 27 Sep 2023 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695855151; bh=gAs/bpzfBIjWnBIn0sI/kTwrsBLHFTgASUwIJke5YlI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SDBi4d31fFqOHUrYoudL3nnJQJv5dSYKGgOibtFdubeuwhO9SdRUDZxlnlHCtsLfx
 /itxIhmQJjQZlSAJhj85PyTiXFqqciznXCqzt+fOZrcxZ6v8q7Qt6jIhMaLtbVbWwy
 pYIklW/ISyyZRi6KwdK5KPebPUAFWQt0eLdeTVdw=
X-Riseup-User-ID: 1488B78AAF2C0972EEFDBA6A7A506CA056319624C69903D5ED22FEC43F308F29
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RwsM00GL4zJq90;
 Wed, 27 Sep 2023 22:52:27 +0000 (UTC)
Message-ID: <8aab614e-1624-413d-693a-5934be6cdf8e@riseup.net>
Date: Wed, 27 Sep 2023 19:52:25 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm/tests: Fix kunit_release_action ctx argument
To: Maira Canal <mairacanal@riseup.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
 <20230920-kunit-kasan-fixes-v1-1-1a0fc261832d@riseup.net>
 <771e3ddf-aa15-5ff9-9689-ec0e02bc803a@riseup.net>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <771e3ddf-aa15-5ff9-9689-ec0e02bc803a@riseup.net>
Content-Type: text/plain; charset=UTF-8
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



On 27/09/23 19:47, Maira Canal wrote:
> Hi Arthur,
> 
> On 9/20/23 03:11, Arthur Grillo wrote:
>> The kunit_action_platform_driver_unregister is added with
>> &fake_platform_driver as ctx, but the kunit_release_action is called
>> pdev as ctx. Fix that by replacing it with &fake_platform_driver.
>>
>> Fixes: 4f2b0b583baa ("drm/tests: helpers: Switch to kunit actions")
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
> 
> Do you need me to apply this patch to drm-misc-fixes?

Yes, please do, if possible.

Thanks,
~Arthur Grillo

> 
> Best Regards,
> - Maíra
> 
>> ---
>>   drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> index 3d624ff2f651..3150dbc647ee 100644
>> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> @@ -118,7 +118,7 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
>>         kunit_release_action(test,
>>                    kunit_action_platform_driver_unregister,
>> -                 pdev);
>> +                 &fake_platform_driver);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
>>  
