Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BBF751DBF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311C810E660;
	Thu, 13 Jul 2023 09:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4210E660;
 Thu, 13 Jul 2023 09:51:39 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R1qYG1D5nzNm9H;
 Thu, 13 Jul 2023 17:48:18 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:51:34 +0800
Subject: Re: [PATCH v2 3/3] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
 <20230713020556.1956639-4-cuigaosheng1@huawei.com>
 <ZK-72h3fVj6PlGB0@e110455-lin.cambridge.arm.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <c37832f4-9957-1d7e-01f9-ee7fbdf569a1@huawei.com>
Date: Thu, 13 Jul 2023 17:51:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ZK-72h3fVj6PlGB0@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

Thanks for taking time to review this patch.

Maybe we can submit another separate patch to fix ERR_CAST(st), because I'm not
sure which commit should be used as a fixes-tag.

Also, Maybe we should fix ERR_CAST(st) in komeda_pipeline_get_state_and_set_crtc()
and komeda_component_get_state_and_set_user(), please make another separate patch.

Let me know if there's anything I can do, thanks for your work again!

Gaosheng,

On 2023/7/13 16:54, Liviu Dudau wrote:
> Hello,
>
> On Thu, Jul 13, 2023 at 10:05:56AM +0800, Gaosheng Cui wrote:
>> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
>> use IS_ERR() to check the return value.
> While reviewing the change I've realised that komeda_pipeline_get_state_and_set_crtc()
> is also mishandling the return value from komeda_pipeline_get_state(). If IS_ERR(st) is
> true it should use return ERR_CAST(st), following the same pattern as komeda_pipeline_get_state().
>
> If you don't want to update this patch I can send a separate patch. Otherwise,
> the change looks good to me.
>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>
> Best regards,
> Liviu
>
>
>> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
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
>>   		return NULL;
>>   
>>   	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
>> -- 
>> 2.25.1
>>
