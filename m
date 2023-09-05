Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FD17922AC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 14:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A2510E4D1;
	Tue,  5 Sep 2023 12:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3951310E4D1;
 Tue,  5 Sep 2023 12:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693917164; x=1725453164;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n2mhV4VNjGycYKGCjbcPq/0PRvd+ydIi1PpdqTBsHsE=;
 b=ZNQRjY24fk+U3eU/k2F+Z7776J+Q0oR1F84jj7ENX4hEzP3fBzhf0iVI
 vTryIEj0tYRtB2MSsPCWCmKo8GXfuYa2BxcDBnph3nJBdW+7cJuM1K002
 LFARrVLzOC08u57gJpS0y6pAsLlKGjYaD6YEA2qWU8Pf2MgO//i9aSGLx
 MVKav5hP5MRDq/9ObcAyEO5q+J2p+AySieXAKSJxQ3n6gB2H3HjHZzmhC
 D1LY+pMcfOwcSb5lREI9i8Le7BGqnTtEKYGvPdLsmXwmj3UoPkYTg57rN
 G3IbSKiP66LyL2dB8gQ32lVh+h5NSp0hrxQlx372axVTzGxPfIlean2Hr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="380591909"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="380591909"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="770318174"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="770318174"
Received: from chenxi4-mobl1.ccr.corp.intel.com (HELO [10.249.254.154])
 ([10.249.254.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:32:41 -0700
Message-ID: <7116926a-af9a-9a14-b6df-a7f4442d90a5@linux.intel.com>
Date: Tue, 5 Sep 2023 14:32:38 +0200
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <vz5bvqnxk5n73dxhbsps77i7aqa3nk5vnytnkszlx3ty7klaz3@gllrfksqstwu>
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

Hi,

On 9/5/23 14:05, Maxime Ripard wrote:
> Hi,
>
> On Tue, Sep 05, 2023 at 10:58:31AM +0200, Thomas Hellström wrote:
>> Check that object freeing from within drm_exec_fini() works as expected
>> and doesn't generate any warnings.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
>> index 563949d777dd..294c25f49cc7 100644
>> --- a/drivers/gpu/drm/tests/drm_exec_test.c
>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>> @@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit *test)
>>   	drm_gem_private_object_fini(&gobj2);
>>   }
>>   
>> +static const struct drm_gem_object_funcs put_funcs = {
>> +	.free = (void *)kfree,
>> +};
>> +
>> +/*
>> + * Check that freeing objects from within drm_exec_fini()
>> + * behaves as expected.
>> + */
>> +static void test_early_put(struct kunit *test)
>> +{
>> +	struct drm_exec_priv *priv = test->priv;
>> +	struct drm_gem_object *gobj1;
>> +	struct drm_gem_object *gobj2;
>> +	struct drm_gem_object *array[2];
>> +	struct drm_exec exec;
>> +	int ret;
>> +
>> +	gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL);
>> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
>> +	if (!gobj1)
>> +		return;
>> +
>> +	gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL);
>> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
>> +	if (!gobj2) {
>> +		kfree(gobj1);
>> +		return;
>> +	}
>> +
>> +	gobj1->funcs = &put_funcs;
>> +	gobj2->funcs = &put_funcs;
>> +	array[0] = gobj1;
>> +	array[1] = gobj2;
>> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
>> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
>> +
>> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>> +	drm_exec_until_all_locked(&exec)
>> +		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
>> +					     1);
>> +	KUNIT_EXPECT_EQ(test, ret, 0);
>> +	drm_gem_object_put(gobj1);
>> +	drm_gem_object_put(gobj2);
>> +	drm_exec_fini(&exec);
> It doesn't look like you actually check that "freeing objects from
> within drm_exec_fini() behaves as expected." What is the expectation
> here, and how is it checked?

Hm. Good question, I've been manually checking dmesg for lockdep splats. 
Is there a way to automate that?

/Thomas



> Maxime
