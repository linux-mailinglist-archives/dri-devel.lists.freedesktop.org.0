Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F79F3E7E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9146B10E7EB;
	Mon, 16 Dec 2024 23:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Yr8B3m0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E730A10E7EA;
 Mon, 16 Dec 2024 23:55:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGI0MZF022402;
 Mon, 16 Dec 2024 23:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w6PlaskUebzUlUBlgTkvIOZxMomq8R/80Ab8NqGyejU=; b=Yr8B3m0HTef0iPcZ
 LuTQJeAVCQdBXO/4uf9J4GHEdOkrxE+J8PZ0xXYUW0ONv7CGVEgiU4aSn1AMK1eq
 ul9kwYXn1uekDWVoTSfcK/OWk/JZQ4qTcmpau5Z0wHY5MZLyYfVo9esInKNghyYa
 RMakNdtNqt5FTusOQMaHVSD3M3cFkl8f8vxe66MdZzSWJ2hYtO4eTtDXIt9BScLU
 74FIeZx3ZVNO7STwUdD6XJC47IB3xYXBVVadk86Fd84nIqoiD59T8LxwReVsKUnm
 W7lIvRg6w2oU1YV5Yc5unFaavOue2dzDM+0YTIav1zIRNQ8+M6YtFEeHdY9tBclq
 v5GSOg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgrra8w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 23:55:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGNtQm2016591
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 23:55:26 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 15:55:25 -0800
Message-ID: <8c5aaa04-3209-40f2-9ba4-a1d6ae00fbf7@quicinc.com>
Date: Mon, 16 Dec 2024 15:55:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct LM pairing for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
 <54edef24-b27a-4d79-aff1-672d4e65b5a3@quicinc.com>
 <55dalo6ecncyceb6wmu7nm6hco4vixxox5grelykkdw5q6yjys@tac57c5nowsd>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <55dalo6ecncyceb6wmu7nm6hco4vixxox5grelykkdw5q6yjys@tac57c5nowsd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: byDHheK6OIT6RwUC3YdGiBI52V0FNrcR
X-Proofpoint-GUID: byDHheK6OIT6RwUC3YdGiBI52V0FNrcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160195
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



On 12/16/2024 2:23 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 11:26:37AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/16/2024 12:20 AM, Dmitry Baryshkov wrote:
>>> According to the vendor devicetree on SM6150 LM_0 is paired with LM_2
>>> rather than LM_1. Correct pairing indices.
>>>
>>> Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>>> index 621a2140f675fa28b3a7fcd8573e59b306cd6832..81eb274cc7000a3b70b0f6650088ddcd24648eab 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>>> @@ -116,20 +116,20 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
>>>    		.sblk = &sdm845_lm_sblk,
>>>    		.pingpong = PINGPONG_0,
>>>    		.dspp = DSPP_0,
>>> -		.lm_pair = LM_1,
>>> +		.lm_pair = LM_2,
>>>    	}, {
>>>    		.name = "lm_1", .id = LM_1,
>>>    		.base = 0x45000, .len = 0x320,
>>>    		.features = MIXER_QCM2290_MASK,
>>>    		.sblk = &sdm845_lm_sblk,
>>>    		.pingpong = PINGPONG_1,
>>> -		.lm_pair = LM_0,
>>>    	}, {
>>>    		.name = "lm_2", .id = LM_2,
>>>    		.base = 0x46000, .len = 0x320,
>>>    		.features = MIXER_QCM2290_MASK,
>>>    		.sblk = &sdm845_lm_sblk,
>>>    		.pingpong = PINGPONG_2,
>>> +		.lm_pair = LM_0,
>>>    	},
>>>    };
>>
>> Have a basic question here. We check the peer only if we will have more than
>> one LM needed in the topology but sm6150 does not have 3dmux, so the number
>> of LMs will not go beyond one.
>>
>> 318 		/* Valid primary mixer found, find matching peers */
>> 319 		if (lm_count < reqs->topology.num_lm) {
>>
>> It seems like this fix will be unused or does not really matter.
>>
>> Downstream has a different implementation for lm_pair, its used even to
>> decide the LM pair for CWB mux. Upstream has a simpler implementation of
>> just doing that in the code of using ODD LMs for ODD CWB muxes and even LMs
>> for even CWB muxes. So fix is okay but not needed.
> 
> So which topology is supposed to work with LM_0 / LM_2 pair?
> 

Since there is no 3dmux, none of the LMs can really have a "pair" in 
this chipset.

This chipset has one DSI, one DP controller (which supports MST). So I 
think the only possibility is single LM case for DSI and single LM case 
for DP SST OR single LM case for DSI and 2 stream DP MST (which will use 
2 LMs - one for each stream) . But even that can only do low resolutions 
as even the MAX mdp clk is low on these.

> I'd still prefer to land the fix for the sake of catalog having the
> correct data.
> 

the lm_pair left over in the downstream DT is for CWB mux because even 
LMs can goto even CWBs. So only LM_0 and LM_2 can goto CWB_0 and are 
hence a pair for CWB_0. But this has no relevance to upstream code.

Dropping lm_pair would be more accurate for this chipset since it will 
always goto single lm case.

         else if (!dpu_kms->catalog->caps->has_3d_merge)
                 topology.num_lm = 1;

>>
>>>
>>> ---
>>> base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
>>> change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0
>>>
>>> Best regards,
> 
