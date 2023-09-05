Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF6A792323
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 15:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFC910E50D;
	Tue,  5 Sep 2023 13:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C333010E50B;
 Tue,  5 Sep 2023 13:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693921383; x=1725457383;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B8EMitHYYRaUAeKbKQhyrNDzGAfHKZBYA0RgXGfXCj8=;
 b=QIwEU7aT0ptl9HCyR050DbeXn0Y3qUGNdBpZgMSmA12/WgmeaASqr8fj
 I+do3813ZhtSZRspCQS5Rxolwu+vV0zYghx61AZTY2C8dZqCJEJQUAS2r
 RtLYwsSPoxTrQ/tRyB8U7o8AmWD76LpkTkqgcFyWloZ4Oa0iorP9IbNUJ
 1r6q9BRSIusgLgun2xfkaix5ds37Gk9c2KL/brvCKV9J7Uf706rYMModa
 4l7fvnKikTFV+EOn37Un8WvTX5gthdEz5G5lER4KNWssb3wT09fTyFY6W
 LzDa3qIkLCgF51AicPFosicYCijL1pIaDjwRBInsCcAynT948sRVV8RNe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376718232"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="376718232"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1071974613"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="1071974613"
Received: from chenxi4-mobl1.ccr.corp.intel.com (HELO [10.249.254.154])
 ([10.249.254.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:43:01 -0700
Message-ID: <5d25d6ea-3a96-3be1-3742-7e3c1b417d14@linux.intel.com>
Date: Tue, 5 Sep 2023 15:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] [PATCH 2/3] drm/tests/drm_exec: Add a test for object
 freeing within drm_exec_fini()
Content-Language: en-US
To: Maxime Ripard <mripard@redhat.com>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
 <vz5bvqnxk5n73dxhbsps77i7aqa3nk5vnytnkszlx3ty7klaz3@gllrfksqstwu>
 <7116926a-af9a-9a14-b6df-a7f4442d90a5@linux.intel.com>
 <h4sw3wafjeuf46cvedvqy33q7rnbl7ghoango53hsewcgxnbwk@satazuly25lr>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <h4sw3wafjeuf46cvedvqy33q7rnbl7ghoango53hsewcgxnbwk@satazuly25lr>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Maxime

On 9/5/23 15:16, Maxime Ripard wrote:
> On Tue, Sep 05, 2023 at 02:32:38PM +0200, Thomas Hellström wrote:
>> Hi,
>>
>> On 9/5/23 14:05, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Tue, Sep 05, 2023 at 10:58:31AM +0200, Thomas Hellström wrote:
>>>> Check that object freeing from within drm_exec_fini() works as expected
>>>> and doesn't generate any warnings.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++++++++++
>>>>    1 file changed, 47 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
>>>> index 563949d777dd..294c25f49cc7 100644
>>>> --- a/drivers/gpu/drm/tests/drm_exec_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>>>> @@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit *test)
>>>>    	drm_gem_private_object_fini(&gobj2);
>>>>    }
>>>> +static const struct drm_gem_object_funcs put_funcs = {
>>>> +	.free = (void *)kfree,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Check that freeing objects from within drm_exec_fini()
>>>> + * behaves as expected.
>>>> + */
>>>> +static void test_early_put(struct kunit *test)
>>>> +{
>>>> +	struct drm_exec_priv *priv = test->priv;
>>>> +	struct drm_gem_object *gobj1;
>>>> +	struct drm_gem_object *gobj2;
>>>> +	struct drm_gem_object *array[2];
>>>> +	struct drm_exec exec;
>>>> +	int ret;
>>>> +
>>>> +	gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL);
>>>> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
>>>> +	if (!gobj1)
>>>> +		return;
>>>> +
>>>> +	gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL);
>>>> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
>>>> +	if (!gobj2) {
>>>> +		kfree(gobj1);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	gobj1->funcs = &put_funcs;
>>>> +	gobj2->funcs = &put_funcs;
>>>> +	array[0] = gobj1;
>>>> +	array[1] = gobj2;
>>>> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
>>>> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
>>>> +
>>>> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>>>> +	drm_exec_until_all_locked(&exec)
>>>> +		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
>>>> +					     1);
>>>> +	KUNIT_EXPECT_EQ(test, ret, 0);
>>>> +	drm_gem_object_put(gobj1);
>>>> +	drm_gem_object_put(gobj2);
>>>> +	drm_exec_fini(&exec);
>>> It doesn't look like you actually check that "freeing objects from
>>> within drm_exec_fini() behaves as expected." What is the expectation
>>> here, and how is it checked?
>> Hm. Good question, I've been manually checking dmesg for lockdep splats. Is
>> there a way to automate that?
> I'm not familiar with the drm_exec API, but judging by the code I'd
> assume you want to check that gobj1 and gobj2 are actually freed using
> kfree?

Actually not. What's important here is that the call to drm_exec_fini(), 
which puts the last references to gobj1 and gobj2 doesn't trigger any 
lockdep splats, like the one in the commit message of patch 3/3. So to 
make more sense, the test could perhaps be conditioned on 
CONFIG_DEBUG_LOCK_ALLOC. Still it would require manual checking of 
dmesg() after being run.

/Thomas



