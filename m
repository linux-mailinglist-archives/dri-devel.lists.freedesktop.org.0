Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E7AC7B93
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 12:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB56910E1B6;
	Thu, 29 May 2025 10:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="atpQsjmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAF210E113;
 Thu, 29 May 2025 10:07:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2QIIa027807;
 Thu, 29 May 2025 10:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8Fx6lB7jeW4rq1dXgAopityNCSRSO3hA77NMQIJ+icU=; b=atpQsjmtnhgVQCFd
 DUr0kJGnI/fYC3LNZBrD5AB9/z6Hjksu1FY8xphvRzHsDnVqBu0G3Qyyb4GDaj6G
 Wa+F21zw6egBZGtXAdEOJ5aG3/o+QmDwwASXSsSqj1QATBPLI9SfMDDUlPuBAd/2
 5jFVZ6Rd9Methv/qibZUPlNwAr6oPxauuQjVlMlSEdNnoivh8SOTJfqMO8aLah8N
 Tm+A7xlc0hQ3jQoBrfd1iyHdtvEh28EvFDgYWbqnfDpvBDxUsWgtbB1Iz1fBpavG
 y0i8WmQ5Vj6U8rxJh4BP9+tOWQHU1AzNYRZUzRWeWkTuVlThY8PWvBPuvnoTqq3J
 hp7Szw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992qcfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 May 2025 10:06:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54TA6uGw022933
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 May 2025 10:06:56 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 29 May
 2025 03:06:50 -0700
Message-ID: <7fbcdb9e-ab47-49a6-9d82-4238b51feed0@quicinc.com>
Date: Thu, 29 May 2025 18:06:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/45] drm/msm/dp: fix the intf_type of MST interfaces
To: Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Tanmay Shah
 <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com>
 <da2aviya67nogkkkhsbvqcgo3gvmk7uv5vb2dbdemzh6xonoo5@oqtgwgwgshmr>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <da2aviya67nogkkkhsbvqcgo3gvmk7uv5vb2dbdemzh6xonoo5@oqtgwgwgshmr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5NyBTYWx0ZWRfX17yX0qKnmDBV
 gEzv2uhDmyU6lY/u4jFNK2Msr3zHmvrIQA/7p7w0UWWtaKhPPyq+h3PjDSWL5Vpm6inEocp3CVS
 3urO/2pjANp9kbgKz0QhnGT7ymK6QCa2VpDn73mLKZHplV5McZSwFhrvJAiDRKss/sU81UaHWhm
 ukbN1vmJEQM1JGbVHw4Giaj9Xjra9C9zA7Cqrgy9d6dM/19k/+pYtje2LJLsPnc+f15Gx7Jj94H
 1ccgUOxqIHz5oL0qPIgH//G8I4ru6A0/624zq9CUcPS3FANaXRZjO7o1maK4d2Fs6w6x6P0/TSi
 sU54W4Kmj4/BeKep80dH2DQHAu3VInYEciQjWQNklIHA6rKPlXomctKSEdC8MOFfoBKUM4NkMWx
 fsqzzDzkC8PEXBsfuBRQmJ6/fVCbzbqnIGon3ASGRGLI3k7QmFSD34Sp2XHEaVFkBIlp/yPT
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683831c1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ESzBY4nlxePsqxZlfqsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1he8KrgLtmMK3fyHvdxtwYMupjDEKa0S
X-Proofpoint-ORIG-GUID: 1he8KrgLtmMK3fyHvdxtwYMupjDEKa0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290097
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



On 2025/1/7 8:55, Bjorn Andersson wrote:
> On Thu, Dec 05, 2024 at 08:31:34PM -0800, Abhinav Kumar wrote:
>> Interface type of MST interfaces is currently INTF_NONE.
>> Fix this to INTF_DP.
>>
> 
> Wouldn't it make sense to introduce this later in the series, once the
> implementation would actually handle this case? Or could/should we have
> left these INTF_DP from the start?
> 
> Regards,
> Bjorn
> 
Yes, it's better to place this patch at the end of the series, once the 
platform is already capable of handling MST.

>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>> index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..2509e28e3d6b582cd837c6aea167b3f4ad877383 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
>> @@ -375,7 +375,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   		.name = "intf_3", .id = INTF_3,
>>   		.base = 0x37000, .len = 0x280,
>>   		.features = INTF_SC7280_MASK,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>>   		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
>> @@ -393,7 +393,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   		.name = "intf_6", .id = INTF_6,
>>   		.base = 0x3A000, .len = 0x280,
>>   		.features = INTF_SC7280_MASK,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>>   		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>> @@ -402,7 +402,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   		.name = "intf_7", .id = INTF_7,
>>   		.base = 0x3b000, .len = 0x280,
>>   		.features = INTF_SC7280_MASK,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>>   		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
>> @@ -411,7 +411,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>>   		.name = "intf_8", .id = INTF_8,
>>   		.base = 0x3c000, .len = 0x280,
>>   		.features = INTF_SC7280_MASK,
>> -		.type = INTF_NONE,
>> +		.type = INTF_DP,
>>   		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
>>   		.prog_fetch_lines_worst_case = 24,
>>   		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>>
>> -- 
>> 2.34.1
>>

