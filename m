Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F14CDD4B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 20:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3200113358;
	Fri,  4 Mar 2022 19:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9D1113355;
 Fri,  4 Mar 2022 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646421759; x=1677957759;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UBESVlzmGH+/Gac4srZ64vERJW8ASdnCOUV8oAcRbY0=;
 b=dA4CKrcFtPmJKoaNsFVVEkJdx/kkUCCuNE72I1NS5AVU024+bpBWL0Yt
 e9YzVLrtE8/4FNaqi3Sa7s3aMMd5Cdqb/vFUMj+KlYvrK8xS+kVnLOKRx
 Bw7o0lU0m7pM9kfvEp2i1UHi5JRiMz37EZKnwjJ3nBeShKOh8CQ4uQJiC c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Mar 2022 11:22:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 11:22:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 4 Mar 2022 11:22:37 -0800
Received: from [10.216.41.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 4 Mar 2022
 11:22:29 -0800
Message-ID: <b1740f38-81f2-32d3-e900-30f6e2ad970b@quicinc.com>
Date: Sat, 5 Mar 2022 00:52:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1 07/10] drm/msm/adreno: Retry on gpu resume failure
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Bjorn
 Andersson" <bjorn.andersson@linaro.org>
References: <1646242056-2456-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220302225551.v1.7.I55e39e28375b64455d1605f67453d5e91b0c2710@changeid>
 <373491a2-0fa5-0326-29cd-1650f86202d4@collabora.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <373491a2-0fa5-0326-29cd-1650f86202d4@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 Martin Botka <martin.botka@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/2022 2:51 PM, AngeloGioacchino Del Regno wrote:
> Il 02/03/22 18:27, Akhil P Oommen ha scritto:
>> Retry infinitely on resume failure because there is nothing much we can
>> do if GPU is not ON. Also, this helps us to avoid checking for the
>> return value of pm_runtime_get() to see if GPU is ON.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c 
>> b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 89cfd84..abcc553 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -603,8 +603,16 @@ static const struct of_device_id dt_match[] = {
>>   static int adreno_resume(struct device *dev)
>>   {
>>       struct msm_gpu *gpu = dev_to_gpu(dev);
>> +    int ret;
>> +
>> +    /* What hope do we have for the future if we can't turn ON gpu */
>
> Hello Akhil,
>
> the hope for the future would be to at least not lock up everything with
> an infinite loop, so, please change this to have a limited amount of 
> retries.
>
> My guess would be that a maximum of 10 is already a lot of retries, but
> feel free to choose an appropriate number.

Thanks for the feedback, Angelo. I will revisit this.

-Akhil.
>
> Regards,
> Angelo
>
>> +    while (true) {
>> +        ret = gpu->funcs->pm_resume(gpu);
>> +        if (!ret)
>> +            break;
>> +    }
>>   -    return gpu->funcs->pm_resume(gpu);
>> +    return 0;
>>   }
>>     static int active_submits(struct msm_gpu *gpu)
>
>

