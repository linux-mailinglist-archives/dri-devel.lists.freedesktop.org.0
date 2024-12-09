Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EB9EA00F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 21:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80D410E534;
	Mon,  9 Dec 2024 20:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CQdVpgKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D9410E0D2;
 Mon,  9 Dec 2024 20:07:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Glrlu027354;
 Mon, 9 Dec 2024 20:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fzQmFeVYCaS8lgQUAEQvHPV0BQLNqOHfmCuqpkodPfY=; b=CQdVpgKrXVdA9bzS
 Z2304VHAVUeZDzNA8zPqX0lGMtPO1gV2ooq2Svnf10eupkY7OYGOdXLFQ2ifXw3A
 djh2ufW5uh3SCNkwcXVUpGI6kZbFQ0oOUu59TnICQjftEKRPVbSNDXn8ODkkVBdl
 /HzUdZPzHxLkao7SzZwWHAIiBwffnPhrKZPN/nfcFJLLAgnIRVLvmXno2mRQFSZ+
 dahrMar15sGsGAHKLaxFP13Uh3jE4wOImuKAdtbDfyqiYNUxasRdVdLoh6WCa9a1
 4+7A0BE6Ne0NE4gJK8zOxNBtEIPZ2EDo3RYCXvU6zwNRJPDbItBtPndTvlioDy+P
 CVpmIg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetp7yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 20:07:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9K7W2i031958
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 20:07:32 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 12:07:29 -0800
Message-ID: <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com>
Date: Mon, 9 Dec 2024 12:07:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
 <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RohcquaB-qGyBMHrlSThfVuIjiJj97GH
X-Proofpoint-ORIG-GUID: RohcquaB-qGyBMHrlSThfVuIjiJj97GH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=756
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090156
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



On 12/7/2024 9:29 PM, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
>> On chipsets such as QCS615, there is no 3dmux present. In such
>> a case, a layer exceeding the max_mixer_width cannot be split,
>> hence cannot be supported.
>>
>> Filter out the modes which exceed the max_mixer_width when there
>> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
>> to return failure for such modes.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>> Note: this was only compile tested, so its pending validation on QCS615
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>   	int i;
>>   
>> +	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
>> +	 * before even checking the width after the split
>> +	 */
>> +	if (!dpu_kms->catalog->caps->has_3d_merge
>> +	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>> +		return -E2BIG;
> 
> Is it the same as checking that there are LMs which support
> DPU_MIXER_SOURCESPLIT ?
> 

DPU_MIXER_SOURCESPLIT tells whether we can have more than one SSPP in 
the same blend stage.

494 	if (test_bit(DPU_MIXER_SOURCESPLIT,
495 		&ctx->mixer_hw_caps->features))
496 		pipes_per_stage = PIPES_PER_STAGE;
497 	else
498 		pipes_per_stage = 1;

That is different from this one. Here we are checking if we can actually 
blend two LM outputs using the 3dmux (so its post blend).

>> +
>>   	for (i = 0; i < cstate->num_mixers; i++) {
>>   		struct drm_rect *r = &cstate->lm_bounds[i];
>>   		r->x1 = crtc_split_width * i;
>> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   {
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>   
>> +	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>> +	 * split the large layer into 2 LMs, filter out such modes
>> +	 */
>> +	if (!dpu_kms->catalog->caps->has_3d_merge
>> +	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>> +		return MODE_BAD;
> 
> This can be more specific, like MODE_BAD_HVALUE.
> 

Yes for sure, will fix this up.

>>   	/*
>>   	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>>   	 */
>>
>> ---
>> base-commit: af2ea8ab7a546b430726183458da0a173d331272
>> change-id: 20241206-no_3dmux-521a55ea0669
>>
>> Best regards,
>> -- 
>> Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
> 
