Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DF6DE750
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26AF10E1BD;
	Tue, 11 Apr 2023 22:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FC310E04B;
 Tue, 11 Apr 2023 22:32:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BMStLg031622; Tue, 11 Apr 2023 22:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Mr6GXrTuhEUBqy88mYBuWY/Dl14Q3Lg1h/xPDdKoBic=;
 b=DSx6Qagq+IjlIrVsPz1QRaG/poZCRzj9KiWQGbhXV3aKF8I3CdzgKfFLprUtoG1TAPRD
 usM46d7Mtd4fxWB27WSRsZqQacY08oFl6lREsz9zg5BxDzXLj8N2NwovOxdgAvB4Jtft
 /mSs6fbE3Rl7zmgy+Hauy27Mv/NTRthjEhuu/CUZY5hogmC1nqcjna9SpOPwXUi8227X
 6D9nedbvMA/ta+7xr+TR6qF/t8Cgx1TMsVBItAyZjY4pfxfNjbFQ0gG0jXOvNOHoTNQV
 88EfluutGNxFTQbJaGlj/rHCM/U1X789ECBEl10XM0LXHZ580TV6elI9PDkPUi1eXg61 Sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pw3cehrmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 22:32:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33BMW7cX015787
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 22:32:07 GMT
Received: from [10.110.115.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 11 Apr
 2023 15:32:06 -0700
Message-ID: <96416911-bca3-b007-b036-1c4463e83aaa@quicinc.com>
Date: Tue, 11 Apr 2023 15:32:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DSC range checking during
 resource reservation
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
 <qvgbm3wimai3jytnikbcixipvwqn2uywqpg4mn6mjh5atergfx@wa4edsrp7y22>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <qvgbm3wimai3jytnikbcixipvwqn2uywqpg4mn6mjh5atergfx@wa4edsrp7y22>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xsU1Py_vZuZpRTn7y_nnQww8idMIm17b
X-Proofpoint-GUID: xsU1Py_vZuZpRTn7y_nnQww8idMIm17b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_16,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110202
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, andersson@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn

On 4/11/2023 3:24 PM, Marijn Suijten wrote:
> Again, don't forget to include previous reviewers in cc, please :)
> 
> On 2023-04-11 14:09:40, Kuogee Hsieh wrote:
>> Perform DSC range checking to make sure correct DSC is requested before
>> reserve resource for it.
> 
> This isn't performing any range checking for resource reservations /
> requests: this is only validating the constants written in our catalog
> and seems rather useless.  It isn't fixing any real bug either, so the
> Fixes: tag below seems extraneous.
> 
> Given prior comments from Abhinav that "the kernel should be trusted",
> we should remove this validation for all the other blocks instead.
> 

The purpose of this check is that today all our blocks in RM use the 
DSC_* enum as the size.

struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];

If the device tree ends up with more DSC blocks than the DSC_* enum, how 
can we avoid this issue today? Not because its a bug in device tree but 
how many static number of DSCs are hard-coded in RM.

And like you said, this is not specific to DSC. Such checks are present 
for other blocks too.

>> Fixes: c985d7bb64ff ("drm/msm/disp/dpu1: Add DSC support in RM")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index f4dda88..95e58f1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
>> @@ -250,6 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>>   		struct dpu_hw_dsc *hw;
>>   		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>>   
>> +		if (dsc->id < DSC_0 || dsc->id >= DSC_MAX) {
>> +			DPU_ERROR("skip dsc %d with invalid id\n", dsc->id);
>> +			continue;
>> +		}
>> +
>>   		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
>>   		if (IS_ERR_OR_NULL(hw)) {
>>   			rc = PTR_ERR(hw);
>> @@ -557,8 +563,10 @@ static int _dpu_rm_make_reservation(
>>   	}
>>   
>>   	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
>> -	if (ret)
>> +	if (ret) {
>> +		DPU_ERROR("unable to find appropriate DSC\n");
> 
> This, while a nice addition, should go in a different patch.
> 
> Thanks!
> 
> - Marijn
> 
>>   		return ret;
>> +	}
>>   
>>   	return ret;
>>   }
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
