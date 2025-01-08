Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8BA06995
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 00:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C0110E092;
	Wed,  8 Jan 2025 23:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="B/fe4x3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E417510E971;
 Wed,  8 Jan 2025 23:41:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508JsehX017399;
 Wed, 8 Jan 2025 23:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UFsrE6vhX1PZrq0qLvy4LKF/eCeRlAc7e7f74Vt1w10=; b=B/fe4x3bhxAweZzd
 9yoBlGS/gtonCFrrMvlVKNmSUNcrSoU/FGT3mGzS7N7mdapWhKUi2RC0srNZB87M
 SZTgtSIRmqbkrjbpPumR/8eUZUI332x0iACZYFDKqnL19HA9rS0iwts/1LQvBg6E
 0SDzZfeCXksPNE3M9nG2fSa74dvrxkEyBogGBMi6AmN+GjNl3dqAht1geWM0uFmk
 6O/9C8B+plrrzkNmTMXFF9zjwq2nkxJ2P4Y6l19msk0GZzEZ22T3mRhFYb6xxV6J
 6/yXdE4Dq9sIoOt5TU1HCH6bi73TVY4bQNf4jMjBNATc1trVpt8zxD4/qDIRWm9f
 d8u+vQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441yxfge00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 23:41:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Nf8le019978
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 23:41:08 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 15:41:08 -0800
Message-ID: <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
Date: Wed, 8 Jan 2025 15:41:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jun Nie
 <jun.nie@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pyMOUFmsfgHlToR0dnDDRq_ViYiSFPgN
X-Proofpoint-GUID: pyMOUFmsfgHlToR0dnDDRq_ViYiSFPgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080194
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



On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
>> decide right side of a pair per last bit, in case of multiple
>> mixer pairs.
> 
> Proper English sentences, please. Also describe why, not what.

Hi Jun,

Can we also add a note in the commit message on why the last bit check 
works?

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>   {
>>   	struct dpu_crtc_state *crtc_state;
>> -	int lm_idx, lm_horiz_position;
>> +	int lm_idx;
>>   
>>   	crtc_state = to_dpu_crtc_state(crtc->state);
>>   
>> -	lm_horiz_position = 0;
>>   	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
>>   		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
>>   		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
>> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>   
>>   		cfg.out_width = drm_rect_width(lm_roi);
>>   		cfg.out_height = drm_rect_height(lm_roi);
>> -		cfg.right_mixer = lm_horiz_position++;
>> +		cfg.right_mixer = lm_idx & 0x1;
>>   		cfg.flags = 0;
>>   		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
>>   	}
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

