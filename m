Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D94AA5C88
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BF110E343;
	Thu,  1 May 2025 09:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HYVYiDSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92F10E069;
 Thu,  1 May 2025 09:17:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5413oFrh031394;
 Thu, 1 May 2025 09:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hNb1dl3k0K+rbG/BUE8UZ57J0ajZ81B0ROyGlfaeqBI=; b=HYVYiDSS9NHc2xot
 8V1WxCFNYeJrhVrQ/xICepbLqOoqOVpcVRK8NZ7F1KU2tyYFe55+GnRSIlRB1HQm
 mQzQ7rugMw4nS25nFMRWLitP2qk97pgMejEhxca6mbtbq50x59Y6FiyyklzTEvcW
 rvvBGq0RA2KwJqub54fGqMfD+WWGw0XgfKnmo7RqWna6Gfmjmxaf94LhsP+mc6k1
 hNrM7abUliFiaNlsklInhY/DTOYyQ9I3jvmjNOs1PcaH+SqCQcF+iXmYZXPvojfw
 6ndhg96sRG/Eg8FvjFPV2l5grdGKNaNm7vgWedTcycf4gdcBIIwFqlWKRhLdK+d9
 NZos0A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1vvue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 May 2025 09:17:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5419HUc5015257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 May 2025 09:17:30 GMT
Received: from [10.216.32.231] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 May 2025
 02:17:25 -0700
Message-ID: <3de5d4f0-606e-48b5-b3f5-d7acf726d0ee@quicinc.com>
Date: Thu, 1 May 2025 14:47:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
 <c6cff2a7-4497-44b3-a019-60e3c6034d4f@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <c6cff2a7-4497-44b3-a019-60e3c6034d4f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68133c2b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=egTsXL45pzzUbfgsQh0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA3MCBTYWx0ZWRfX5jLRlGnSk/Mx
 M+VM9128DOCfSEWouU13szJGqFe9OLsvyu60hnds8BTruCnCdo8G9XugGnAbtVeLsHWblNBD+XU
 DWd2Alk2yZqEE3n8VH5Ll2swuHULak/jaHx+w8HnBBQUT3y4JBdTN6WH7apTwiCsKfs/VjGYkmi
 VNIiZmPeQ5qJ9cKcegTmxspQMk86SBFEo7YBQH1Jns9x+vJdJSoEzxtD9l5T6l5NI2oB1bpbDDn
 iLLioZZxLHsl6azkkDwQEoAgyp9f/PyBtohEtUE9Aq1a/BHOXQzLbzVynbtIcOsugxqK6Epu8o5
 IsmojkuXV6d9Fap9tO0j/fXr96bATtaUmmdqFXVeeaM7nk8dvALarMwXWe/viQPvqPhCvBrZrLA
 s7vgohspwzOju+eZwVUiY+DbraudljuDZfz6mPSxPfr5z6fi1LopRsppQ0ritjb8Ff4k6+9l
X-Proofpoint-GUID: hIRcUUZtDzD6m2PKlExzGT_a9w5TezNA
X-Proofpoint-ORIG-GUID: hIRcUUZtDzD6m2PKlExzGT_a9w5TezNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010070
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

On 4/25/2025 2:35 PM, Konrad Dybcio wrote:
> On 7/15/24 10:04 PM, Akhil P Oommen wrote:
>> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>
>>> Add support for SMEM-based speed binning, which includes getting
>>> "feature code" and "product code" from said source and parsing them
>>> to form something that lets us match OPPs against.
>>>
>>> Due to the product code being ignored in the context of Adreno on
>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
> 
> [...]
> 
>>>  
>>>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>> @@ -1102,9 +1136,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>  			devm_pm_opp_set_clkname(dev, "core");
>>>  	}
>>>  
>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>  		speedbin = 0xffff;
>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>> +	adreno_gpu->speedbin = speedbin;
>>
>> There are some chipsets which uses both Speedbin and Socinfo data for
>> SKU detection [1]. We don't need to worry about that logic for now. But
>> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
>> It will be difficult when we have to expose both to userspace.
>>
>> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
>> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
>> so I think we can use the rest of the 16 bits for SKU_ID. And within that
>> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
>> reserved for future PCODE.
> 
> So I revisited this patchset and had another thought - maybe we could just
> extend the speedbin bitfield to cover [63:32] and worry about filling these
> higher bits in the future, when adding the platforms you mentioned?

Sorry for the late response, I needed sometime to think this through.

My concern is about mixing speedbin and socinfo in the same UABI. It
will be complicated to handle this correctly later. We have to track the
set of chipsets which exposes socinfo data via speedbin fields and those
do not. I think it is be simpler to handle this correctly from the start.

If you are worried about breaking backward compatibility with Mesa, we
can probably use a separate property for socinfo data which can be
implemented later? Just don't expose socinfo via speedbin UABI.

> 
> Do we still have plans to use *both* SMEM and fuse encoding on them?

It is better to keep that option open since there are chipsets using
both production. And there will be for foreseeable future because
automotive team stick with fuse register and mobile team stick with
socinfo data.

-Akhil

> 
> Konrad

