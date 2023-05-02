Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897316F4B59
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 22:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6F310E08E;
	Tue,  2 May 2023 20:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C9710E082;
 Tue,  2 May 2023 20:28:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342JurL9011028; Tue, 2 May 2023 20:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bNSfF3fp8GOd4MX5IVX2LFeM5Oveea86k3zpUubxvG0=;
 b=VtXNFBspPlpx5Dx1l8HuPNfMZcGj3r+8cugJWww5TJfURpbtB6CD3OzD0Tv9MKYSE4B1
 Dr3urx8Z37nmEHFWcNOD3/MKSmQWrJUIsf7YlVxvyMxiRA2rhkxD6vpDhwIjGeZzuK03
 WACiTdjzmpHc8zQs46dX7R9Q4qDnsWTCQECZoaov6vqKuuqaIT6IEfqM+LyPRlejegGS
 MI037egkcabfNAvKtpcEAzhD34C3Tffb/R7E6CSRjVUHPqUYC3tIulf4p+NRcHy3k/fq
 RVnzk12jQFUgb7yJPDd4dweH0UbWNuOWfZmW/Wt527em1uDqTMDy9U/st6g0Pcik7nRS Gg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qan8gjq1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 20:27:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 342KRvub011320
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 20:27:57 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 13:27:56 -0700
Message-ID: <2fc36ced-039d-edc8-1695-6c79e196610e@quicinc.com>
Date: Tue, 2 May 2023 13:27:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/7] drm/msm/dpu: merge dpu_encoder_init() and
 dpu_encoder_setup()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-2-dmitry.baryshkov@linaro.org>
 <0d09f4ea-8778-d61d-feea-c0b3a2a6ebe4@quicinc.com>
 <048b40fb-b4d0-2b33-9e97-dddec1405269@linaro.org>
 <ee9da7d9-44a7-eb99-679b-c968fdb9ef6a@quicinc.com>
 <657391b8-7a87-6fcb-44d8-de505718f351@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <657391b8-7a87-6fcb-44d8-de505718f351@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: D8yCcLJMr64KaOjWRVKXZ_ToMa4AIu-d
X-Proofpoint-ORIG-GUID: D8yCcLJMr64KaOjWRVKXZ_ToMa4AIu-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=807 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020174
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/1/2023 2:27 PM, Dmitry Baryshkov wrote:
> On 02/05/2023 00:22, Abhinav Kumar wrote:
>>
>>
>> On 5/1/2023 1:45 PM, Dmitry Baryshkov wrote:
>>> On 01/05/2023 22:58, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>>>> There is no reason to split the dpu_encoder interface into separate
>>>>> _init() and _setup() phases. Merge them into a single function.
>>>>>
>>>>
>>>> I think the reason for having this split was to pass a valid encoder 
>>>> to the interface_modeset_init() and then do the rest of encoder 
>>>> initialization after modeset_init().
>>>>
>>>> Looking at the current code, one issue i am seeing is that you will 
>>>> now initialize the dpu_encoder's msm_display_info along with 
>>>> dpu_encoder_init().
>>>>
>>>> Most of it is fine but in the case of bonded_dsi(), I see an issue.
>>>>
>>>> The info.num_of_h_tiles++ happens after the modeset_init() of the 
>>>> second dsi but now it has been moved earlier.
>>>>
>>>> If for some reason, msm_dsi_modeset_init() fails for the second DSI, 
>>>> num_of_h_tiles will still be 2 now.
>>>
>>> If msm_dsi_modeset_init() fails, the function will err out and fail 
>>> dpu_kms initialization. So it's not important, what is the value of 
>>> num_h_tiles in this case.
>>>
>>
>> But I still feel the msm_display_info should be saved in the dpu 
>> encoder after the modeset_init() and not before. That way if some 
>> display interface specific init is done in the modeset_init(), we save 
>> the info after that.
> 
> Up to now we have been using 'poll' model, e.g. we specifically asked 
> for the DSC info from the DSI host rather than making msm_dsi set it. So 
> far I don't see a good reason why this should be changed.
> 

Ok got it, so my concern came from the fact that we individually poll 
each feature today but lets say the number of features keeps growing we 
will have to combine them all into xxx_xxx_get_disp_info() which fills 
up all the fields of the display_info in one go.

But yes, as long as we do that before calling dpu_encoder_init() it 
should be fine.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
