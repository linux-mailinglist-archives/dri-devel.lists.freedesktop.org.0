Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F261A513B1F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 19:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9703310E961;
	Thu, 28 Apr 2022 17:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9D710E961;
 Thu, 28 Apr 2022 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651168239; x=1682704239;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YxhDw5hji39ZPEoEywi63scy2Fs/i+DDswaqHMU96cM=;
 b=gpLaGSB/NyBM1ER950V7hBfeZoWdA/R+g3J/+3BpAtm268QEV6tg2i8K
 FaN9a+XfOEnxbpXjKjlsQJ6iuGiLjkFrs7/c0XAlYonyQ9i6l/OojjONE
 Xj910k1EWVZOBtTi+RA4f8wXjigqb7u5zaDY9FXP9wegHNoyyv7dbWbpe 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Apr 2022 10:50:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 10:50:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Apr 2022 10:50:37 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 28 Apr
 2022 10:50:35 -0700
Message-ID: <dd0f0d52-05a4-df49-630e-e6d2a9749b24@quicinc.com>
Date: Thu, 28 Apr 2022 10:50:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: remove unused refcount for encoder_phys_wb
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1651160067-26431-1-git-send-email-quic_abhinavk@quicinc.com>
 <c1f46c3a-4b89-3d6d-06af-242b859f1cab@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c1f46c3a-4b89-3d6d-06af-242b859f1cab@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/28/2022 8:58 AM, Dmitry Baryshkov wrote:
> On 28/04/2022 18:34, Abhinav Kumar wrote:
>> Remove the unused local variable refcount for encoder_phys_wb
>> as the one part of wb_enc is used directly.
>>
>> Fixes: 0ce51f19453e ("drm/msm/dpu: introduce the dpu_encoder_phys_* 
>> for writeback")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index cb5c7da53c29..904124a3477e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -407,9 +407,6 @@ static void dpu_encoder_phys_wb_irq_ctrl(
>>       struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
>>       int ret = 0;
>> -    int refcount;
>> -
>> -    refcount = atomic_read(&wb_enc->wbirq_refcount);
>>       if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1) {
>>           dpu_core_irq_register_callback(phys->dpu_kms,
> 
> As I glanced onto this function, it seems you miss updating `ret` here. 
> Could you please fix that too?
> 

Yes, we dont need ret here, its a void function.
So we dont need to handle the if (ret) cases as we would never hit them.

I will update this and post v2. I have re-tested this too.
> 
