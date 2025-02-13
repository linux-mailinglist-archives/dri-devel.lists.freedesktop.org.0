Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B1A3360B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 04:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846C810E9DC;
	Thu, 13 Feb 2025 03:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e/FAwqdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3ED10E9D8;
 Thu, 13 Feb 2025 03:24:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CLSU3A030642;
 Thu, 13 Feb 2025 03:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IoDBnBveHbXkdQl+RWjF5XUN6mrpWr/oxCaro/fZcyo=; b=e/FAwqdX9scNW8E9
 R4TuKr7zRLysaMRb34aAPm2WRXFtZp/AkNLzr2WZF+fEb2hxO+g3Eux1uVjTx9DP
 q0SC0SuXMTQhLI8b1owlp8+mJhxP6M5Tic6KaKnUTGxhLOcMMwtYTsJzGwytHKkJ
 TnUocT/V7zhMIwYbl4cJspMw+Oe6c32Hd8nLr5xoFfIvp0U12BAz1W4GuEWnjEjg
 GoL0YGWO7+FWgep1AMJVcDWDQjQx9vKf5uUlCaUa6+SrjSAn1memrO2pVC+sAP9/
 I5BSxGHOm+SqWWe1a0r9MXlFzkPBVYhK0NUDlzk6Xj/w12HNDUoXbLktYtyj8ZqY
 WFkglg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9pvpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 03:23:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D3NwZP025988
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 03:23:58 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 19:23:56 -0800
Message-ID: <244931ee-acaa-4973-bb8e-aa4c6c1609f0@quicinc.com>
Date: Wed, 12 Feb 2025 19:23:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "James A. MacInnes"
 <james.a.macinnes@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, "Rob
 Clark" <robdclark@chromium.org>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
 <5yli2sqw5hxoinlaguxjq2lleez7p4qjkwvexrgn7uphnu44ws@trlvdrpep5uv>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5yli2sqw5hxoinlaguxjq2lleez7p4qjkwvexrgn7uphnu44ws@trlvdrpep5uv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: m_fdmR81NqWzdNyDNF_pmVfEUnjxa9is
X-Proofpoint-GUID: m_fdmR81NqWzdNyDNF_pmVfEUnjxa9is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_01,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130025
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/12/2025 4:04 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
>> Type-C DisplayPort inoperable due to incorrect porch settings.
>> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Unfortunately I don't know enough details to comment on this change.
> Maybe Abhinav can check it. I can only notice that msm-4.14 disables
> programmable_fetch_config for non-DSI calls. Would disabling that call
> for DP interface fix your issue?
> 

Yes, this piece of timing adjustment matches what we have even without 
widebus.

I do agree about the programmable fetch that it is enabled only on DSI 
even on the latest kernels.

698 	if (phys_enc->hw_intf->cap->type == INTF_DSI)
699 		programmable_fetch_config(phys_enc, &timing_params);

We can try if that works.

>>
>> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
>> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index abd6600046cb..a21addc4794f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -94,17 +94,21 @@ static void drm_mode_to_intf_timing_params(
>>   		timing->vsync_polarity = 0;
>>   	}
>>   
>> -	/* for DP/EDP, Shift timings to align it to bottom right */
>> -	if (phys_enc->hw_intf->cap->type == INTF_DP) {
>> +	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
>> +
>> +	/*
>> +	 *  For DP/EDP, Shift timings to align it to bottom right.
>> +	 *  wide_bus_en is set for everything excluding SDM845 &
>> +	 *  porch changes cause DisplayPort failure and HDMI tearing.
>> +	 */
>> +	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
>>   		timing->h_back_porch += timing->h_front_porch;
>>   		timing->h_front_porch = 0;
>>   		timing->v_back_porch += timing->v_front_porch;
>>   		timing->v_front_porch = 0;
>>   	}
>>   
>> -	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> -	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
>> -
>>   	/*
>>   	 * for DP, divide the horizonal parameters by 2 when
>>   	 * widebus is enabled
>>
>> -- 
>> 2.43.0
>>
> 

