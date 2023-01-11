Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B36666EF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 00:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FDD10E825;
	Wed, 11 Jan 2023 23:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96FA10E825;
 Wed, 11 Jan 2023 23:04:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BMP1Qw022472; Wed, 11 Jan 2023 23:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jkuwI+skdrZdGL2ZVoUMisaPlFY2+xhJF0gdQLyrI0E=;
 b=HtP1EtsfsJMfF4FZiTBzpt0C2Id5t+lHrNItwcVLeJvSrLCWVAnqrb+Z0J/R0dZ3aZKa
 pyGsT55AuHrXKa65Uafv2MlF2PDqjW5K4b3Hxbgm/iV0ELrbsD4jRbbIJa9dz9tXXUmZ
 sb6xpsWx6uWKTz+dwOavrTfrgB2Upsa2U+dLqO9tdxSFHYloAEKK/leSYzaQhqmvGXCL
 Ncw8H8l0m10xY3p3igeLY+CsTZK2ZlaDMj8f3B3XLwUvWWkV3YXJ5tTdJIJcZgWuS+kH
 Rft7JZxUIk+qQPDKF5Z1Wd4pM80ee/5VemFRNpd6dHRALT0z6fWsbi5szSKXEcTOeLMz jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1k6a2dk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 23:03:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30BN3wWe022313
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 23:03:58 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 15:03:57 -0800
Message-ID: <8264b319-d852-b3fa-5af5-2fd0e5fe83b4@quicinc.com>
Date: Wed, 11 Jan 2023 15:03:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dsi: implement opp table based
 check for dsi_mgr_bridge_mode_valid()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230111225257.7510-1-quic_abhinavk@quicinc.com>
 <20230111225257.7510-2-quic_abhinavk@quicinc.com>
 <2304c252-354a-f214-3f89-7797110fc416@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2304c252-354a-f214-3f89-7797110fc416@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6Azl-M_k_kmBhr1NPanft-xLsOYv-YaD
X-Proofpoint-GUID: 6Azl-M_k_kmBhr1NPanft-xLsOYv-YaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_10,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110169
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
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 2:56 PM, Dmitry Baryshkov wrote:
> On 12/01/2023 00:52, Abhinav Kumar wrote:
>> Currently there is no protection against a user trying to set
>> an unsupported mode on DSI. Implement a check based on the opp
>> table whether the byte clock for the mode can be supported by
>> validating whether an opp table entry exists.
>>
>> For devices which have not added opp table support yet, skip
>> this check otherwise it will break bootup on those devices.
>>
>> changes in v2:
>>     - drop dev_pm_opp_get_opp_table() usage
>>
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
>> Reported-by: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> index 3a1417397283..c4c24dabfd6f 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>> @@ -450,6 +450,31 @@ static enum drm_mode_status 
>> dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>       int id = dsi_mgr_bridge_get_id(bridge);
>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>       struct mipi_dsi_host *host = msm_dsi->host;
>> +    struct platform_device *pdev = msm_dsi->pdev;
>> +    struct dev_pm_opp *opp;
>> +    unsigned long byte_clk_rate;
>> +
>> +    byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
>> +
>> +    /*
>> +     * If dev_pm_opp_find_freq_ceil() returns -EINVAL, its a bad
>> +     * pointer being passed, so treat as an error and return MODE_ERROR
>> +     *
>> +     * If dev_pm_opp_find_freq_ceil() returns -ERANGE, no clock
>> +     * was found matching the byte_clk, so return MODE_CLOCK_RANGE
>> +     *
>> +     * If dev_pm_opp_find_freq_ceil() returns -ENODEV, don't treat
>> +     * it as an error as it could mean opp table is not implemented
>> +     */
> 
> I'd say, too lengthy and verbose.
> 
hmmm .... just wanted to document the basis of the policy, I can make it 
shorter.

>> +    opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
>> +    if (IS_ERR(opp)) {
>> +        if (PTR_ERR(opp) == -EINVAL)
>> +            return MODE_ERROR;
>> +        else if (PTR_ERR(opp) == -ERANGE)
>> +            return MODE_CLOCK_RANGE;
> 
> I think the logic should be quite opposite. Ignore -ENODEV, handle 
> -ERANGE and return MODE_ERROR for all other errors. In your code you are 
> ignoring not only -ENODEV, but all other possible errors which can be 
> added in future.
> 

Atm, those were the only ones handled but you are right.

this is better.

if (IS_ERR(opp)) {
	if (PTR_ERR(opp) == -ERANGE)
		return MODE_CLOCK_RANGE;
	else
		return MODE_ERROR;
} else {
	dev_pm_opp_put(opp);
}

>> +    } else {
>> +        dev_pm_opp_put(opp);
>> +    }
>>       return msm_dsi_host_check_dsc(host, mode);
>>   }
> 
