Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FF62678B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 07:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C27610E008;
	Sat, 12 Nov 2022 06:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01AE10E008;
 Sat, 12 Nov 2022 06:50:07 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N8R5D4dKFzHvm6;
 Sat, 12 Nov 2022 14:49:36 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 14:50:03 +0800
Subject: Re: [PATCH 3/5] drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in
 msm_icc_get()
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-4-cuigaosheng1@huawei.com>
 <20221111100218.6h47vtyu67ovda3d@SoMainline.org>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <6b4e25fb-635a-bb8d-d06e-f1765f22f9f5@huawei.com>
Date: Sat, 12 Nov 2022 14:50:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20221111100218.6h47vtyu67ovda3d@SoMainline.org>
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
Cc: emma@anholt.net, quic_akhilpo@quicinc.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 angelogioacchino.delregno@somainline.org, mihail.atanassov@arm.com,
 sam@ravnborg.org, james.qian.wang@arm.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, sean@poorly.run, vladimir.lypak@gmail.com,
 dianders@chromium.org, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> NAK. This path should be returned if it is NON-NULL, otherwise we defer
> to of_icc_get() on the parent device.  See the code-comment below.

Thanks for taking time to review this patch, how do you think of the following changes:
  
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c 
> b/drivers/gpu/drm/msm/msm_io_utils.c index d02cd29ce829..a112d8c74d59 
> 100644 --- a/drivers/gpu/drm/msm/msm_io_utils.c +++ 
> b/drivers/gpu/drm/msm/msm_io_utils.c @@ -133,7 +133,7 @@ struct 
> icc_path *msm_icc_get(struct device *dev, const char *name) struct 
> icc_path *path; path = of_icc_get(dev, name); - if (path) + if 
> (!IS_ERR_OR_NULL(path)) return path; 

Looking forward to your reply, thanks again!

On 2022/11/11 18:02, Marijn Suijten wrote:
> On 2022-11-10 17:44:43, Gaosheng Cui wrote:
>> The of_icc_get() function returns NULL or error pointers on error path,
>> so we should use IS_ERR_OR_NULL() to check the return value.
>>
>> Fixes: 5ccdcecaf8f7 ("drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   drivers/gpu/drm/msm/msm_io_utils.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
>> index d02cd29ce829..950083b2f092 100644
>> --- a/drivers/gpu/drm/msm/msm_io_utils.c
>> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>> @@ -133,7 +133,7 @@ struct icc_path *msm_icc_get(struct device *dev, const char *name)
>>   	struct icc_path *path;
>>   
>>   	path = of_icc_get(dev, name);
>> -	if (path)
>> +	if (IS_ERR_OR_NULL(path))
> NAK. This path should be returned if it is NON-NULL, otherwise we defer
> to of_icc_get() on the parent device.  See the code-comment below.
>
> - Marijn
>
>>   		return path;
>>   
>>   	/*
>> -- 
>> 2.25.1
>>
> .
