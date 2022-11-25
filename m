Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271886383BF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 07:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CEB10E700;
	Fri, 25 Nov 2022 06:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B1F10E6FD;
 Fri, 25 Nov 2022 06:05:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AP50kUP032652; Fri, 25 Nov 2022 06:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=95nu3QZwoiCm+Mik9Bjpaa1JAMoaDGnyaT/b8apUHYA=;
 b=WLc2B0kpr12ZAA0Hk1Uj/oORduNjzHLOXO3z/pFZo+U+GytOyLLmLk2GcGAc0tWgUlFG
 UFPD9bSK8mzXdleG2zqEV+FtfJ7gw2eXwQ9Zm8L5L+j4/g95FvtFHY02A+tVT2GauF/R
 NKNNqzHMiJdrl1unKvNmS1ORdeMm4beevshlj2z3Ll700LUM4wQUV9OLMS8cXn9g52FJ
 jR0pNitr2w3KHm4bkzLNBW62CoViZVNygqX9qZHqFM76Pncyenwz6R9iYMycJCmzBCVH
 vxQvGCnPoOpqFnGT7HlE0fKMXYi5xZHVpDGYm4rWCoFvE5+JBjN4/4LnaLzkrPiWJNND IQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m21mbbc2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 06:05:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AP65Ruf027697
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 06:05:27 GMT
Received: from [10.216.38.33] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 24 Nov
 2022 22:05:19 -0800
Message-ID: <6753d5a3-e46b-2cf1-c807-333093ff3fdf@quicinc.com>
Date: Thu, 24 Nov 2022 22:05:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 03/12] drm/msm/dpu: Refactor sc7280_pp
 location
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>, Robert Foss
 <robert.foss@linaro.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <quic_kalyant@quicinc.com>,
 <swboyd@chromium.org>, <angelogioacchino.delregno@somainline.org>,
 <loic.poulain@linaro.org>, <quic_khsieh@quicinc.com>,
 <quic_vpolimer@quicinc.com>, <vkoul@kernel.org>,
 <dianders@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, <vinod.koul@linaro.org>,
 <quic_jesszhan@quicinc.com>, <andersson@kernel.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-4-robert.foss@linaro.org>
 <d85a5d66-d54b-29cb-3ced-69c75f6f7802@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d85a5d66-d54b-29cb-3ced-69c75f6f7802@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dy2vjxEGi9Y89OT7Lgm1pPSd_OzBv1mD
X-Proofpoint-GUID: dy2vjxEGi9Y89OT7Lgm1pPSd_OzBv1mD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_02,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250049
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



On 11/15/2022 5:33 AM, Konrad Dybcio wrote:
> 
> 
> On 15/11/2022 14:30, Robert Foss wrote:
>> The sc7280_pp declaration is not located by the other _pp
>> declarations, but rather hidden around the _merge_3d
>> declarations. Let's fix this to avoid confusion.
>>
>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> This is already merged.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=1a5b5372e3b0a4cc65a0cbb724b1b0859f4ac63c 
> 
> 
> Konrad

Its part of linux-next but a PR hasnt been sent with it.

That being said, since this particular change has been taken separately, 
this series should now be rebased without this change and addressing 
some of the other comments given by konrad.

>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 4dac90ee5b8a..8f2d634f7b6b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -1294,6 +1294,13 @@ static const struct dpu_pingpong_cfg 
>> sm8150_pp[] = {
>>               -1),
>>   };
>> +static const struct dpu_pingpong_cfg sc7280_pp[] = {
>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> +    PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> +};
>> +
>>   static struct dpu_pingpong_cfg qcm2290_pp[] = {
>>       PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
>>           DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> @@ -1352,13 +1359,6 @@ static const struct dpu_merge_3d_cfg 
>> sm8450_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
>>   };
>> -static const struct dpu_pingpong_cfg sc7280_pp[] = {
>> -    PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> -    PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, 
>> -1),
>> -};
>> -
>>   /*************************************************************
>>    * DSC sub blocks config
>>    *************************************************************/
