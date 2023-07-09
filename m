Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5B74C6B1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 19:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD1310E116;
	Sun,  9 Jul 2023 17:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9616C10E116;
 Sun,  9 Jul 2023 17:26:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 369H8UGp025445; Sun, 9 Jul 2023 17:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TupoiFmFec+g3IViatE5xilLZwaGPG3yqkgRKmINMpw=;
 b=m1wiNcHh/+thSA9VqZlNMGb0IK+7S6m50M9HoM5bRVId+qpFUP8CgEIS9b0cxfJK0Hba
 w3uzIB+0Kbr6LcAZJab0ioIicWbzqJ59tKl0JQyHmXYaZvIWVrOxy1NTKEo0Q6imyDlK
 3qPvziTz6pLNdnTY6XNZdOo1UrGxt5LWFU+jicUv/InF5paSACEO0Oli7uFh8ldIDTvp
 0MAR/5VmrdRg0O2DjGkvNrkthdmlg4UUVL6nzHAt2kQE3WbVok02d5f9Mwq8lmafO8i9
 /WnYodMmpT/wzz1+HFOhjqWPZts0Pqzg1X/HiRDTO0hR7WttYyPG7Uis3y+WDcYlBOGk Qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rq0jphtb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jul 2023 17:26:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 369HQK71030796
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jul 2023 17:26:20 GMT
Received: from [10.110.47.185] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sun, 9 Jul
 2023 10:26:19 -0700
Message-ID: <6070d8fa-5159-d976-077d-8d1de7aa0d44@quicinc.com>
Date: Sun, 9 Jul 2023 10:26:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx() from dp_power.c
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
 <fiq6zjzptjdnktdcofyqpaqf2gmddvkschebp7imlmfxatew3x@iaptll3dzfuf>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <fiq6zjzptjdnktdcofyqpaqf2gmddvkschebp7imlmfxatew3x@iaptll3dzfuf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9y1cJf0ZSrdryUVxRxDM7SPC_0Kemwjb
X-Proofpoint-GUID: 9y1cJf0ZSrdryUVxRxDM7SPC_0Kemwjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307090164
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/2023 7:34 PM, Bjorn Andersson wrote:
> On Fri, Jul 07, 2023 at 04:52:19PM -0700, Kuogee Hsieh wrote:
>> Since both pm_runtime_resume() and pm_runtime_suspend() are not
>> populated at dp_pm_ops. Those pm_runtime_get/put() functions within
>> dp_power.c will not have any effects in addition to increase/decrease
>> power counter. Also pm_runtime_xxx() should be executed at top
>> layer.
>>
> 
> Getting/putting the runtime PM state affects the vote for the GDSC. So I
> would suggest that you move this after patch 2, to not create a gap in
> the git history of lacking GDSC votes.
> 
> Regards,
> Bjorn
> 

the mdss_dp node has rpmhpd SC7180_CX in its power domains. the parent 
device has the GDSC.

So just so that I understand this right,  the DP's vote on this will 
still count because the parent's power domain wont get collapsed till 
the child PM votes are removed too?

If so, I see your point and yes it will make sense to move this later to 
avoid the gap.

>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 5cb84ca..ed2f62a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
>>   
>>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>>   
>> -	pm_runtime_enable(power->dev);
>> -
>>   	return dp_power_clk_init(power);
>>   }
>>   
>> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
>>   	struct dp_power_private *power;
>>   
>>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>> -
>> -	pm_runtime_disable(power->dev);
>>   }
>>   
>>   int dp_power_init(struct dp_power *dp_power)
>> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
>>   
>>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>>   
>> -	pm_runtime_get_sync(power->dev);
>> -
>>   	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>> -	if (rc)
>> -		pm_runtime_put_sync(power->dev);
>>   
>>   	return rc;
>>   }
>> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>>   
>>   	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>> -	pm_runtime_put_sync(power->dev);
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.7.4
>>
