Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6075F93C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 16:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1746910E31E;
	Mon, 24 Jul 2023 14:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7339289CAD;
 Mon, 24 Jul 2023 14:05:01 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R8hhZ6vmBzVjqv;
 Mon, 24 Jul 2023 22:03:26 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:04:57 +0800
Subject: Re: [PATCH v3 3/3] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20230714014820.2186203-1-cuigaosheng1@huawei.com>
 <20230714014820.2186203-4-cuigaosheng1@huawei.com>
 <ZLpc4Yt39SjbGA-T@e110455-lin.cambridge.arm.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <5e4a5fe8-3695-c4d0-d81d-9766fc938243@huawei.com>
Date: Mon, 24 Jul 2023 22:04:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ZLpc4Yt39SjbGA-T@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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
Cc: neil.armstrong@linaro.org, quic_eberman@quicinc.com, sam@ravnborg.org,
 quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 james.qian.wang@arm.com, angelogioacchino.delregno@somainline.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> If you're going to update the other patches to use IS_ERR_OR_NULL() please do so
> here too. You can keep my R-b for that change.

Thanks for taking time to review the patch.

I have update the patch set and add this change to v5.

On 2023/7/21 18:24, Liviu Dudau wrote:
> Hi Gaosheng,
>
> On Fri, Jul 14, 2023 at 09:48:20AM +0800, Gaosheng Cui wrote:
>> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
>> use IS_ERR() to check the return value.
>>
>> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
>> index 3276a3e82c62..e9c92439398d 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
>> @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
>>   	u32 avail_scalers;
>>   
>>   	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
>> -	if (!pipe_st)
>> +	if (IS_ERR(pipe_st))
> If you're going to update the other patches to use IS_ERR_OR_NULL() please do so
> here too. You can keep my R-b for that change.
>
> Best regards,
> Liviu
>
>>   		return NULL;
>>   
>>   	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
>> -- 
>> 2.25.1
>>
