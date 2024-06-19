Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286DB90F6A3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 21:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00F110ED9B;
	Wed, 19 Jun 2024 19:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LnMG/7xy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2115610ED98;
 Wed, 19 Jun 2024 19:02:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9oJD7016022;
 Wed, 19 Jun 2024 19:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mqzCLWM8qCmcQ6o9VlwqlL+syqQt0w2+jEo/T5jNNic=; b=LnMG/7xyYwDAshaH
 Zvf5NYlDx3OHXoHS8M+4uOMaJN7tslFQT3O+0plYLljYEQtSkGxSPjDrrcCwmpSt
 ynmndreq4IyCNaWZUHtJp987mkLUEekQjPc1C4q+BptrwwcHRDA91rZvJOU3Cwij
 Q5YlEKLLOE8yMh28Hp3SNaEMUm3/9OnHNmmyrccIaIQnwOwdx962/jD6qb8XHaXE
 HsDAsyrX9GZKwV70K+xyjc8O2excmGfKIM2pW51Wh06sVt1EO77kUTlwb2N89hYo
 rtYwe9vf6/Gz05hAQqzCDWQ+OzlyuIiWW6CFpPso2iK8tITx2sK5dtiCTGId6yPI
 isf5lw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja52gxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 19:02:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45JJ28AL014987
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 19:02:08 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 12:02:02 -0700
Message-ID: <b2e301c9-8723-0b26-5aa3-e78ac53dff9a@quicinc.com>
Date: Wed, 19 Jun 2024 12:02:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: support setting the TE source
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
 <cu3iicchkdmpkm6fttqv42hw2zfa2bs4wk6xsbeu5m4poav4s5@l7kbg43sfzrb>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <cu3iicchkdmpkm6fttqv42hw2zfa2bs4wk6xsbeu5m4poav4s5@l7kbg43sfzrb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UoE7gosjoL2pNiW5_1i2qaq6yI7DPbfL
X-Proofpoint-GUID: UoE7gosjoL2pNiW5_1i2qaq6yI7DPbfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190144
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



On 6/13/2024 11:14 AM, Marijn Suijten wrote:
> On 2024-06-13 20:05:10, Dmitry Baryshkov wrote:
>> Make the DPU driver use the TE source specified in the DT. If none is
>> specified, the driver defaults to the first GPIO (mdp_vsync0).
> 
> mdp_vsync_p?
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 44 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index e9991f3756d4..6fcb3cf4a382 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -505,6 +505,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>>   		dpu_kms_wait_for_commit_done(kms, crtc);
>>   }
>>   
>> +static const char *dpu_vsync_sources[] = {
>> +	[DPU_VSYNC_SOURCE_GPIO_0] = "mdp_vsync_p",
>> +	[DPU_VSYNC_SOURCE_GPIO_1] = "mdp_vsync_s",
>> +	[DPU_VSYNC_SOURCE_GPIO_2] = "mdp_vsync_e",
>> +	[DPU_VSYNC_SOURCE_INTF_0] = "mdp_intf0",
>> +	[DPU_VSYNC_SOURCE_INTF_1] = "mdp_intf1",
>> +	[DPU_VSYNC_SOURCE_INTF_2] = "mdp_intf2",
>> +	[DPU_VSYNC_SOURCE_INTF_3] = "mdp_intf3",
>> +	[DPU_VSYNC_SOURCE_WD_TIMER_0] = "timer0",
>> +	[DPU_VSYNC_SOURCE_WD_TIMER_1] = "timer1",
>> +	[DPU_VSYNC_SOURCE_WD_TIMER_2] = "timer2",
>> +	[DPU_VSYNC_SOURCE_WD_TIMER_3] = "timer3",
>> +	[DPU_VSYNC_SOURCE_WD_TIMER_4] = "timer4",
>> +};
>> +
>> +static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
>> +				     struct msm_dsi *dsi)
>> +{
>> +	const char *te_source = msm_dsi_get_te_source(dsi);
> 
> Just checking: if the TE source is different and one has dual-DSI, it must be
> set on both controllers?
> 

If we use dual-dsi (in NON-bonded mode), then yes we will have two TE 
sources - one for each controller.

>> +	int i;
>> +
>> +	if (!te_source) {
>> +		info->vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
>> +		return 0;
>> +	}
>> +
>> +	/* we can not use match_string since dpu_vsync_sources is a sparse array */
> 
> Instead of having gaps in the array, you could also store both the vsync_source
> and name as the array elements?
> 

Yes, there is a gap because the DPU_VSYNC_* macros have a gap.

Can you pls explain your suggestion to remove the gap a little more?
I didnt follow this part very well.

>> +	for (i = 0; i < ARRAY_SIZE(dpu_vsync_sources); i++) {
>> +		if (dpu_vsync_sources[i] &&
>> +		    !strcmp(dpu_vsync_sources[i], te_source)) {
>> +			info->vsync_source = i;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>>   static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>   				    struct msm_drm_private *priv,
>>   				    struct dpu_kms *dpu_kms)
>> @@ -543,7 +581,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>   
>>   		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
>>   
>> -		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
>> +		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
>> +		if (rc) {
>> +			DPU_ERROR("failed to identify TE source for dsi display\n");
>> +			return rc;
>> +		}
>>   
>>   		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
>>   		if (IS_ERR(encoder)) {
>>
>> -- 
>> 2.39.2
>>
