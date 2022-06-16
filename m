Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE354E662
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 17:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A606E10E47B;
	Thu, 16 Jun 2022 15:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00F10E47B;
 Thu, 16 Jun 2022 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655394573; x=1686930573;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cO4Iax8qycFqwMSRIuxL+xQyN5XpAc9XiJSxFVbdZHk=;
 b=uvmwAIbodR/bSbc7JySS7VmHOpXIll1GI8pOn8fMFHFUnpTS0WLd4l9u
 5KRJ0j5P5qdsQnIcRckVz8m0kpKVifO2X1EC6AIE66caqJQ3Kki1iPR2L
 /y3JVy0GNabQnPMJ3REvNnkLO1sxRnT0tOdYZG100R5mS8eNXX6926/du A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2022 08:49:31 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 08:49:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 08:49:30 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 16 Jun
 2022 08:49:28 -0700
Message-ID: <c3be3596-5f62-88c7-6545-dc0b52228017@quicinc.com>
Date: Thu, 16 Jun 2022 08:49:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: set preferred mode for writeback
 connector
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1655335395-16159-1-git-send-email-quic_abhinavk@quicinc.com>
 <253d0390-8a90-c16f-41b4-99ad03b781c8@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <253d0390-8a90-c16f-41b4-99ad03b781c8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/16/2022 1:36 AM, Dmitry Baryshkov wrote:
> On 16/06/2022 02:23, Abhinav Kumar wrote:
>> After [1] was merged to IGT, we use either the first supported
>> mode in the list OR the preferred mode to determine the primary
>> plane to use for the sub-test due to the IGT API [2].
>>
>> Since writeback does not set any preferred mode, this was
>> selecting 4k as that was the first entry in the list.
>>
>> We use maxlinewidth to add the list of supported modes for
>> the writeback connector which is the right thing to do, however
>> since we do not have dual-SSPP support yet for DPU, this fails
>> the bandwidth check in dpu_core_perf_crtc_check().
>>
>> Till we have dual-SSPP support, workaround this mismatch between
>> the list of supported modes and maxlinewidth limited modes by
>> marking 640x480 as the preferred mode for DPU writeback because
>> kms_writeback tests 640x480 mode only [3].
> 
> Telling that we support modes up to 4k, failing to set 4k mode and then 
> using the preferred mode to force IGT to lower resolution sounds like a 
> hack.
> 
> As adding wide dual-SSPP support will take some time. I'd suggest 
> dropping support for 4k modes for now and using DEFAULT_DPU_LINE_WIDTH 
> instead (or hw_wb->caps->maxlinewidth). A comment in the source code 
> that the check should be removed/modified once dual-SSPP is supported 
> would be helpful.
> 
Yes, I am planning to drop this one and use max_mixerwidth instead as i 
posted on IRC.
> 
>> [1]: https://patchwork.freedesktop.org/patch/486441/
>> [2]: 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L1562 
>>
>> [3]: 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L68 
>>
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Any Fixes tags?
Yes, will add it in the new patch.
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> index 399115e4e217..104cc59d6466 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> @@ -10,9 +10,14 @@ static int dpu_wb_conn_get_modes(struct 
>> drm_connector *connector)
>>       struct drm_device *dev = connector->dev;
>>       struct msm_drm_private *priv = dev->dev_private;
>>       struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>> +    int count;
>> -    return drm_add_modes_noedid(connector, 
>> dpu_kms->catalog->caps->max_linewidth,
>> +    count = drm_add_modes_noedid(connector, 
>> dpu_kms->catalog->caps->max_linewidth,
>>               dev->mode_config.max_height);
>> +
>> +    drm_set_preferred_mode(connector, 640, 480);
>> +
>> +    return count;
>>   }
>>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> 
> 
