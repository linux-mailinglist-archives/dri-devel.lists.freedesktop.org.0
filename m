Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8993F864
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 16:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A721210E3FE;
	Mon, 29 Jul 2024 14:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="caa3XgGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CD610E3FE;
 Mon, 29 Jul 2024 14:40:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAKjsC000633;
 Mon, 29 Jul 2024 14:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xHMB3TmsExJZYf6ASsTzPCkN
 xehCRJLMBmMI14RE/xo=; b=caa3XgGtjBgyWU1YjINatimkmzlSoYVowb1Ga3kE
 LU+u1z6DZH+esqs2l9Qgiy85if3UspPyRBV77w1nrJt73NItVe8xSSwWqK2hKaMh
 z3wo0By4reoWrvND+u00hfcUpiNdDFa/aTnJtPgZyBnx6Pevdl3Xo/utNcmwRtgo
 j6m5ilYL2+V+pg0UrEowO62KLhjSygW3zv2IlEqwt1WZwlJFD7FaXPBl2WMEdIfI
 DjwkKfrY68PWCNpho7iJpMqbmr86Bd6aFjvKHy+3JkFAl4YrIfI0mkZyMmsGsgJO
 QrOF1AHHqvVvmcOuDO+cMeoRs47+18eUucDGxDiPzWBWkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2kmdp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 14:40:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46TEeJAb007298
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 14:40:19 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 07:40:14 -0700
Date: Mon, 29 Jul 2024 20:10:10 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Elliot Berman <quic_eberman@quicinc.com>
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
Message-ID: <20240729144010.yj2anp253qgqsuna@hu-akhilpo-hyd.qualcomm.com>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
 <8e2ebc97-f455-4f41-81da-af56263e6cf6@linaro.org>
 <87607d2c-a4b1-4923-ba9f-9cfc56a0aa38@kernel.org>
 <aaf74e25-ba24-454c-8bc1-c2b079d549e3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aaf74e25-ba24-454c-8bc1-c2b079d549e3@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pkp9BHs2kNXQ7wplHmUEY4Eti-5alllV
X-Proofpoint-GUID: pkp9BHs2kNXQ7wplHmUEY4Eti-5alllV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=679
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290098
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

On Mon, Jul 29, 2024 at 02:40:30PM +0200, Konrad Dybcio wrote:
> 
> 
> On 29.07.2024 2:13 PM, Konrad Dybcio wrote:
> > On 16.07.2024 1:56 PM, Konrad Dybcio wrote:
> >> On 15.07.2024 10:04 PM, Akhil P Oommen wrote:
> >>> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
> >>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
> >>>> abstracted through SMEM, instead of being directly available in a fuse.
> >>>>
> >>>> Add support for SMEM-based speed binning, which includes getting
> >>>> "feature code" and "product code" from said source and parsing them
> >>>> to form something that lets us match OPPs against.
> >>>>
> >>>> Due to the product code being ignored in the context of Adreno on
> >>>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >> [...]
> >>
> >>>>  
> >>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> >>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
> >>>>  		speedbin = 0xffff;
> >>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> >>>> +	adreno_gpu->speedbin = speedbin;
> >>> There are some chipsets which uses both Speedbin and Socinfo data for
> >>> SKU detection [1].
> >> 0_0
> >>
> >>
> >>> We don't need to worry about that logic for now. But
> >>> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
> >>> It will be difficult when we have to expose both to userspace.
> >>>
> >>> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
> >>> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
> >>> so I think we can use the rest of the 16 bits for SKU_ID. And within that
> >>> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
> >>> reserved for future PCODE.
> >> Right, sounds reasonable. Hopefully nothing overflows..
> > +CC Elliot
> > 
> > Would you know whether these sizes ^ are going to be sufficient for
> > the foreseeable future?
> 
> Also Akhil, 12 + 8 > 16.. did you mean 8 bits for both P and FCODE? Or
> 12 for FCODE and 4 for PCODE?

Sorry, "8 bits" was a typo. You are right, 12 bits for Fcode and 4 bits for PCODE.

-Akhil

> 
> Konrad
