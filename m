Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9662984F4C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 02:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F4810E919;
	Wed, 25 Sep 2024 00:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Hvl+sjDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB1710E919;
 Wed, 25 Sep 2024 00:05:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OGs4ch017527;
 Wed, 25 Sep 2024 00:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zPJxe2OPadzaV17xl7gIFMYVBq8ss1vsUuTpAX3apgs=; b=Hvl+sjDYNJty06s7
 TvBeK9Pwo6LkwxtYKP+ewSBYDwjEcGRg8TXRQjvFlybhKC+T4ofjKoBHo8YgJS6U
 HWd0Q7oEYLzFZkXcbWNZrbznppLMdaKF0yi1bj4G+tm5nTC8JV/d+E7ZWC84b58T
 2xFQxJQrMLL/QqnejBfF3rH8fkSTtJae2lYuHrQZdOMBvPf0FzTxMUuKm0AB95DG
 PGhOizsHi7TlS9G6Hk71L8jHa/xR6K580+8ew38YrsfkwwAvmx/NUHdACvfHrmFu
 hQU5lTr/A50VFT4ULodpOhrEuJedTfJOd9kbUaXyGAbQvNgJnH3IugLQKOq2uVTi
 elsb7A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2t5rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 00:05:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P05jR1009999
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 00:05:45 GMT
Received: from [10.110.96.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 17:05:44 -0700
Message-ID: <75297d0d-528a-4152-b35f-ba41fbf914dc@quicinc.com>
Date: Tue, 24 Sep 2024 17:05:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/22] drm/msm/dpu: Require modeset if clone mode
 status changes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-14-7849f900e863@quicinc.com>
 <yjfe5wajajeqmcp65kbvcttzgkrsfv5rhkbvqvioqx3rwdn6g6@2h2byk2l2imy>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <yjfe5wajajeqmcp65kbvcttzgkrsfv5rhkbvqvioqx3rwdn6g6@2h2byk2l2imy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7bq2vPeCBsdLzf9SQFioK2W3MFlo4xFA
X-Proofpoint-ORIG-GUID: 7bq2vPeCBsdLzf9SQFioK2W3MFlo4xFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240168
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



On 9/24/2024 4:25 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 24, 2024 at 03:59:30PM GMT, Jessica Zhang wrote:
>> If the clone mode enabled status is changing, a modeset needs to happen
>> so that the resources can be reassigned
> 
> Sima's comment regarding crtc_state->mode_changed seems to be ignored...
> 

Not ignored. One of us has to take that up. There is a broader cleanup 
required for that.

We can sync up on how to tackle this : whether it needs to be in this 
series or push another one cleaning up all the instances.

>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index a7850bf844db..f20e44e9fc05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1268,6 +1268,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>   {
>>   	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>>   									  crtc);
>> +	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
>> +									      crtc);
>>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>>   
>> @@ -1279,6 +1281,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>   	int rc = 0;
>>   
>>   	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>> +	bool clone_mode_requested = drm_crtc_in_clone_mode(old_crtc_state);
>> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>>   
>>   	/* there might be cases where encoder needs a modeset too */
>>   	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
>> @@ -1286,6 +1290,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>   			crtc_state->mode_changed = true;
>>   	}
>>   
>> +	if ((clone_mode_requested && !clone_mode_enabled) ||
>> +	    (!clone_mode_requested && clone_mode_enabled))
>> +		crtc_state->mode_changed = true;
>> +
>>   	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>   		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>>   		if (rc < 0)
>>
>> -- 
>> 2.34.1
>>
> 
