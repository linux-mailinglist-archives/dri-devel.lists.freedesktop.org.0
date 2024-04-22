Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39FA8AD346
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 19:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06AA10E6F1;
	Mon, 22 Apr 2024 17:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WpJf0AwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368E910EA7B;
 Mon, 22 Apr 2024 17:23:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M9bGIv004777;
 Mon, 22 Apr 2024 17:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=VRd+FqoZJAkqncCjwp7KhsDNB5TkvPIXDmBsNGsOv6c=; b=Wp
 Jf0AwFPnpDZtLCIsOfhqetGbQHanZZX1VmZkjR/oWj/D+1I7nAEXWSQWoY1Dbd6r
 ham4ZCYwyB/JI3FaTPfPlVzlgUaEsJIHmZxEK0kiX3d0ojhN4dxpZmiWj6he3Uku
 kbxHUW437UemFOZcXBzUIGg6mK9NONnCSPcfQFtCTT4fAh5pkQbZCBlm8aP9tnA3
 RlOoDTHgdGoCm7zgGo/VPFb1ixZ3FIR0l9AGPcb6KxIdhATXePNkoo8oKA2SDeSa
 b6C58Cidgnf3SNZHDPCX1IUuEYXnHh2+M9eNLkga+n0yoKufVy4j7wSCCexlP5tb
 0YfIlS1bZBCdzsjqvcTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnne295jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 17:23:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHNJWe005527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 17:23:19 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:23:19 -0700
Message-ID: <7daeeaba-a33d-bf05-1371-d9b5fa0bf0a5@quicinc.com>
Date: Mon, 22 Apr 2024 10:23:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm: don't clean up priv->kms prematurely
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-1-96a70f64fa85@linaro.org>
 <67fbd629-3e80-b706-83a3-7baff3efd6c1@quicinc.com>
 <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <n7eet54g72usmuh4hdz6yce3i4ieweu4orgd7gewu7y53ejucc@dzmq2a2wdxkc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Gik2XTWn6sjBZbjbXowMENMblUen81bD
X-Proofpoint-ORIG-GUID: Gik2XTWn6sjBZbjbXowMENMblUen81bD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=740 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220072
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



On 4/21/2024 3:35 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 20, 2024 at 04:02:00PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
>>> MSM display drivers provide kms structure allocated during probe().
>>> Don't clean up priv->kms field in case of an error. Otherwise probe
>>> functions might fail after KMS probe deferral.
>>>
>>
>> So just to understand this more, this will happen when master component
>> probe (dpu) succeeded but other sub-component probe (dsi) deferred?
>>
>> Because if master component probe itself deferred it will allocate priv->kms
>> again isnt it and we will not even hit here.
> 
> Master probing succeeds (so priv->kms is set), then kms_init fails at
> runtime, during binding of the master device. This results in probe
> deferral from the last component's component_add() function and reprobe
> attempt when possible (once the next device is added or probed). However
> as priv->kms is NULL, probe crashes.
> 
>>
>>> Fixes: a2ab5d5bb6b1 ("drm/msm: allow passing struct msm_kms to msm_drv_probe()")

Actually, Is this Fixes tag correct?

OR is this one better

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")


>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_kms.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>>> index af6a6fcb1173..6749f0fbca96 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.c
>>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>>> @@ -244,7 +244,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>>    	ret = priv->kms_init(ddev);
>>>    	if (ret) {
>>>    		DRM_DEV_ERROR(dev, "failed to load kms\n");
>>> -		priv->kms = NULL;
>>>    		return ret;
>>>    	}
>>>
> 
