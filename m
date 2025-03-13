Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D2A5F41A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB75110E22C;
	Thu, 13 Mar 2025 12:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LGp2Wrd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0A10E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:20:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9Q5HT023241;
 Thu, 13 Mar 2025 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fDU8c74Q4bDPD4cXlM5fRCqP8qjtAceNigyKKmnZJuw=; b=LGp2Wrd3RM3qpfZh
 MmtyydncBM/h6hX+2FhFnIYjoYb7DcDNQ5Vdrl5ZgrNviN8DY2b9sIUkJWaJ2cmV
 ROWlRX9aSTlMqZN+AEhSRpLdzgctb5Yk6lVbB3zjccQpT6FJ7ZUEvjpLGN3FTack
 lroSbDFR+/uVEby93e0jTpIlLkGsL4+hkLZ6v9xrHOLS9s/By2lrnkRS6zeKmMuG
 TtfezUkeyxo1bv4utG/SSkrmPFDrUVrm8yki8okj0FXl/zLViEUDP+w22d4IWoKF
 b4PLbFRf+O5CC9DBEDsiBhqsmPdgdn16TdeeWdxux1oXN+Q1EbLNLYh4iAP+edG8
 T2ys+A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mnspq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 12:20:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DCKNal020388
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 12:20:23 GMT
Received: from [10.218.15.14] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 05:20:18 -0700
Message-ID: <c402bdae-04b0-4745-b4c9-f12298cd7a05@quicinc.com>
Date: Thu, 13 Mar 2025 17:50:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
To: Vinod Koul <vkoul@kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
 <quic_vtanuku@quicinc.com>
References: <20250212120536.28879-1-quic_jseerapu@quicinc.com>
 <20250212120536.28879-2-quic_jseerapu@quicinc.com> <Z89TC7fKzmmeu6tW@vaman>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <Z89TC7fKzmmeu6tW@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pmnVupMtP4qZ34e0cWtkVzg1kvtB_MB7
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d2cd87 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=llsIEhTl_2UyQBK4H_sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pmnVupMtP4qZ34e0cWtkVzg1kvtB_MB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130097
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

Hi Vinod, Thanks for the review comments.

On 3/11/2025 2:30 AM, Vinod Koul wrote:
> On 12-02-25, 17:35, Jyothi Kumar Seerapu wrote:
>> GSI hardware generates an interrupt for each transfer completion.
>> For multiple messages within a single transfer, this results in
>> N interrupts for N messages, leading to significant software
>> interrupt latency.
>>
>> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
>> Enabling BEI instructs the GSI hardware to prevent interrupt generation
>> and BEI is disabled when an interrupt is necessary.
>>
>> When using BEI, consider splitting a single multi-message transfer into
>> chunks of 8 messages internally and so interrupts are not expected for
>> the first 7 message completions, only the last message triggers
>> an interrupt, indicating the completion of 8 messages.
>>
>> This BEI mechanism enhances overall transfer efficiency.
> 
> That sounds good but I dont like the idea that we add a custom interface
> for this. Please use DMA_PREP_INTERRUPT instead. Adding this flag should
> trigger N interrupts, absence of this should lead to Block events only
> 
The DMA_PREP_INTERRUPT flag in DMA operations is used to indicate that 
an interrupt should be generated once the DMA transfer is completed.
However, this flag itself does not block interrupt generation at the GPI 
DMA hardware level. The GPI DMA hardware can still raise interrupts even 
in the absence of the DMA_PREP_INTERRUPT flag.

To block interrupts at the GPI DMA hardware level, we need to use the 
Block Event Interrupt (BEI) bit (as explained in the commit log).
As an example : for 100 transfers, we only want to receive one interrupt 
at the 100th transfer. This helps us significantly reduce latencies, as 
handling back-to-back 100 interrupts can take a few milliseconds.

Hope this explains it well. Please let me know if there are any other 
concerns or feedback.

