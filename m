Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A08D5B61A6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 21:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F3D10E209;
	Mon, 12 Sep 2022 19:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D3210E209;
 Mon, 12 Sep 2022 19:26:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CFkXrJ032110;
 Mon, 12 Sep 2022 19:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rkNjMNHOv/NYMM/1RaZBcC4DunJrDyumUuvelfbNDUo=;
 b=gCYr3NZP7mPs0JwUmRZMSyy/bJOtb4CaIUf5/CPZywNWnqMOJpIno75gazkokHjoP50l
 X/RboO2ZHBSnCETxHVOzRzapw7FIxpPYsrTlNw7/R2PQc/eI/WtXOVNRAPHd3Wwgb8af
 iI2trXIls/di9FjMvnAKlacwTN8fmHjZZyFTFIsLF52hcTEJgk8x0Bo2l5XP/meV/sSq
 IkpKE18I8dO/TqacDtPqVFLPkPT825nGiGT60gFQ045u85adylKcvVHC2qnf4IIBPMUE
 FrpeyUFaq+sqMvtNhLE8BCqZjhE1k1RSFsc7bXzWXuyXnvj3su1vcgg4uwBC6wTftMCY Tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk43p574-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 19:26:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28CJQ4rC017147
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 19:26:04 GMT
Received: from [10.110.24.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 12 Sep
 2022 12:26:03 -0700
Message-ID: <61d591ff-c5d8-a032-9eaa-6ab4c535a679@quicinc.com>
Date: Mon, 12 Sep 2022 12:26:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 3/3] drm/msm/dp: retry 3 times if set sink to D0 poweer
 state failed
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-4-git-send-email-quic_khsieh@quicinc.com>
 <067c7bc0-4746-f714-db56-a3c9e4f25588@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <067c7bc0-4746-f714-db56-a3c9e4f25588@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9nVmejWZCrRQ_evv2KlVzd7WHkceDug0
X-Proofpoint-ORIG-GUID: 9nVmejWZCrRQ_evv2KlVzd7WHkceDug0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_13,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120065
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/12/2022 11:37 AM, Dmitry Baryshkov wrote:
> On 12/09/2022 19:23, Kuogee Hsieh wrote:
>> Bring sink out of D3 (power down) mode into D0 (normal operation) mode
>> by setting DP_SET_POWER_D0 bit to DP_SET_POWER dpcd register. This
>> patch will retry 3 times if written to DP_SET_POWER register failed.
>
> Could you please elaborate this change? Can the sink succeed in 
> reading the DP_SET_POWER, but fail writing DP_SET_POWER?

yes, there is possible since it is not only set local sink device but 
also all downstream sink devices to D0 state.

>
>>
>> Changes in v5:
>> -- split into two patches
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_link.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>> b/drivers/gpu/drm/msm/dp/dp_link.c
>> index 9d5381d..4360728 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -50,6 +50,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux 
>> *aux,
>>   {
>>       u8 value;
>>       ssize_t len;
>> +    int i;
>>         if (link->revision < 0x11)
>>           return 0;
>> @@ -61,11 +62,13 @@ static int dp_aux_link_power_up(struct drm_dp_aux 
>> *aux,
>>       value &= ~DP_SET_POWER_MASK;
>>       value |= DP_SET_POWER_D0;
>>   -    len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>> -    if (len < 0)
>> -        return len;
>> -
>> -    usleep_range(1000, 2000);
>> +    /* retry for 1ms to give the sink time to wake up */
>> +    for (i = 0; i < 3; i++) {
>> +        len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>> +        usleep_range(1000, 2000);
>> +        if (len == 1)
>> +            break;
>> +    }
>>         return 0;
>>   }
>
