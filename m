Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C4948281
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B736610E27B;
	Mon,  5 Aug 2024 19:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HmzuzdBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516010E27B;
 Mon,  5 Aug 2024 19:43:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475BNYII020526;
 Mon, 5 Aug 2024 19:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 attQVIBIxzTwHkSz76LnAFli44sQxnHrM0v7u7wBFOo=; b=HmzuzdBZGW+nCeUK
 618w3fbMPJZmvtLHikvNooC1DgJI0c8dD1B/nePRtDc7FPNWG8zLY26UfpfSTK+X
 s4fh93lUv/5wrqjxuWkADxiDBuEW93GJWV2+/qMyvF7UuDFoUMxm+qx5vezqda8H
 kY3u8GyrnhJZLmirfOe8QEyVSJKnQC44+ptRTqFpOZ/faUaIWP8/a9B7Pi+g8oVL
 g8qsQyny6Jh4/6ycCgRa2G/72J5d0Zmds1QsuPISwY7IHoKkPZQRLe9vpZqTC6u+
 tN/znkUCyljSvIWPA+t6RqgDQmckMrh2NIar6eLzXDtjtpT1z08QEu9VMfGdnw5I
 ygxZFw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scs2w0r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 19:43:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 475JhhrS008940
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Aug 2024 19:43:43 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 12:43:40 -0700
Message-ID: <2fee3ea7-31e4-48ea-980d-a4e6bc78834d@quicinc.com>
Date: Mon, 5 Aug 2024 12:43:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
 <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
 <CAA8EJpp2pg1FyrE8ftxGduHUnX=nsu=Zg_mwCrkcdqJqMJZjDw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp2pg1FyrE8ftxGduHUnX=nsu=Zg_mwCrkcdqJqMJZjDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ra3EWBx3y-z1k3jrPiXPPOl-N0VPqR_W
X-Proofpoint-GUID: ra3EWBx3y-z1k3jrPiXPPOl-N0VPqR_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050139
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



On 7/31/2024 5:34 PM, Dmitry Baryshkov wrote:
> On Wed, 31 Jul 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
>>> YUV formats require only CSC to be enabled. Even decimated formats
>>> should not require scaler. Relax the requirement and don't check for the
>>> scaler block while checking if YUV format can be enabled.
>>>
>>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
>>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 1c3a2657450c..148bd79bdcef 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>>>        min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>
>>>        if (MSM_FORMAT_IS_YUV(fmt) &&
>>> -         (!pipe->sspp->cap->sblk->scaler_blk.len ||
>>> -          !pipe->sspp->cap->sblk->csc_blk.len)) {
>>> +         !pipe->sspp->cap->sblk->csc_blk.len) {
>>>                DPU_DEBUG_PLANE(pdpu,
>>> -                             "plane doesn't have scaler/csc for yuv\n");
>>> +                             "plane doesn't have csc for yuv\n");
>>>                return -EINVAL;
>>>        }
>>>
>>
>> Change seems fine, but one question, is there a chipset in the catalog
>> with a Vig SSPP which has only csc but not scaler? Even qcm2290 has
>> neither scaler nor csc
>>
>> So was this just a code-walkthrough fix or was there any issue hit due
>> to this?
> 
> Just a code walkthrough.
> 

Alright,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
> 
