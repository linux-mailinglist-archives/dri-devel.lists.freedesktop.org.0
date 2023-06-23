Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8CE73BDF9
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532C10E696;
	Fri, 23 Jun 2023 17:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC1110E694;
 Fri, 23 Jun 2023 17:41:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NH0US1000662; Fri, 23 Jun 2023 17:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vbccG3sKe3AZFrTNQpv9NS/+Ov7edvQzpdJW4wnPrTM=;
 b=FQCLFaXWN7MoqNOeAbAJ6K+o9reE5pxk2tr5SUXlkONPeyeAKYvIMrdLKtWACMTvD6Au
 b3b+HyUbYvWmEYrdvOL2MEZjvWazPdx2OTIPlSmkWMvu0vFkXoe4q6xsfcZIjNvpRDQZ
 Zr9AkqbljOlbhXMCNe/T+7U1/UnsIcCuZKOapgrstS0XXMN5IC15sBMV3LmSPgtKqOSc
 FR96H1dlOLMMeyuMr9YYqiEJPD7iTUfPmEOukD5zk5jZG9aMKcZK5WvjgHBoxvjSTGYa
 gYPV18Z75l59+1nvEgEwD11QuFsYRdu9iwh35ARZKTmZPOQI2M290AniquX1O7srDLC2 SA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc0sk69vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 17:41:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NHfeAH016356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 17:41:40 GMT
Received: from [10.110.6.30] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 10:41:39 -0700
Message-ID: <dc38d253-54aa-b4c1-499a-3d66f8c305c4@quicinc.com>
Date: Fri, 23 Jun 2023 10:41:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <d98ddf40-c4b5-56a4-c444-2d87712a6ebd@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d98ddf40-c4b5-56a4-c444-2d87712a6ebd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: V4oUbbhhE3xZJ0qwC06O4Oto_FPVHaPG
X-Proofpoint-ORIG-GUID: V4oUbbhhE3xZJ0qwC06O4Oto_FPVHaPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_08,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230157
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



On 6/23/2023 4:25 AM, Dmitry Baryshkov wrote:
> On 23/06/2023 08:47, Abhinav Kumar wrote:
>>
>>
>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
>>> This includes the common block itself, enc subblocks and some empty
>>> space around. Change that to pass 0x4 instead, the length of common
>>> register block itself.
>>>
>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant 
>>> chipsets")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> There is no need of a fixes tag for this.
>>
>> This is not a bug but was intentional.
> 
> We have other subblocks which are not dumped withoyt Ryan's patchset. So 
> this declaration should be corrected.
> 

As registers were not contiguous, some of them had to be missed but the 
goal was to cover as much as possible with the len of the main blk.

Some registers had to take a hit till we dumped sub-blocks.

>>
>> Till we added sub-block parsing support we had to dump the whole block.
>>
>> And hence I would suggest this change should be merged after the 
>> sub-block parsing change otherwise we wont have full register dumps 
>> for DSC.
> 
> No, the order should be opposite: this is merged first, then subblocks 
> dumping can use block->len in all the cases.
> 

Please stop pushing changes in the middle of an ongoing series. If you 
really wanted this, we could have expanded the sub-block series to fix 
this too or you could have discussed with the authors that you were 
going to push this in parallel.

Instead of helping developers, it sometimes offends them to receive 
patches in the middle of an ongoing series.


>>
>> Also, please add :
>>
>> Suggested-by: Ryan McCann <quic_rmccann@quicinc.com>
> 

+			/* For now, pass in a length of 0 because the DSC_BLK register space
+			 * overlaps with the sblks' register space.
+			 *
+			 * TODO: Pass in a length of 0 t0 DSC_BLK_1_2 in the HW catalog where
+			 * applicable.

The comment reports and tells what to do.

I thought of suggesting to add both first.
> More likely:
> 
> Reported-by: Ryan McCann <quic_rmccann@quicinc.com>
> 
>>
>>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
>>>   5 files changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> index 8da424eaee6a..6edf323f381f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> @@ -159,10 +159,10 @@ static const struct dpu_merge_3d_cfg 
>>> sm8350_merge_3d[] = {
>>>    * its own different sub block address.
>>>    */
>>>   static const struct dpu_dsc_cfg sm8350_dsc[] = {
>>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>>   };
>>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> index 900fee410e11..5354003aa8be 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> @@ -104,7 +104,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>>   /* NOTE: sc7280 only has one DSC hard slice encoder */
>>>   static const struct dpu_dsc_cfg sc7280_dsc[] = {
>>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>>   };
>>>   static const struct dpu_wb_cfg sc7280_wb[] = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> index f6ce6b090f71..1d374abec1fd 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> @@ -148,12 +148,12 @@ static const struct dpu_merge_3d_cfg 
>>> sc8280xp_merge_3d[] = {
>>>    * its own different sub block address.
>>>    */
>>>   static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>> -    DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x4, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x4, 0, dsc_sblk_1),
>>>   };
>>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for 
>>> now */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> index 8d13c369213c..79447d8cab05 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> @@ -167,10 +167,10 @@ static const struct dpu_merge_3d_cfg 
>>> sm8450_merge_3d[] = {
>>>    * its own different sub block address.
>>>    */
>>>   static const struct dpu_dsc_cfg sm8450_dsc[] = {
>>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>>   };
>>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> index f17b9a7fee85..26e3c28003f7 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> @@ -171,10 +171,10 @@ static const struct dpu_merge_3d_cfg 
>>> sm8550_merge_3d[] = {
>>>    * its own different sub block address.
>>>    */
>>>   static const struct dpu_dsc_cfg sm8550_dsc[] = {
>>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>>   };
>>>   static const struct dpu_intf_cfg sm8550_intf[] = {
> 
