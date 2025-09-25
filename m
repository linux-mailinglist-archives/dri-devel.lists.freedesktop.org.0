Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FAAB9F56D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6386B10E905;
	Thu, 25 Sep 2025 12:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dgi6Fn1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22A410E901
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:48:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9bnMt021499;
 Thu, 25 Sep 2025 12:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o510Fb8XtBpx7FUmnXq1m1GqNxBgGDUyOQkQA7J+m3Y=; b=dgi6Fn1N+2DFp4cg
 bwN0teZyvHryCNXjx5I2Mn1rfhD4WRgYSioMRaH9N97bNjeTwPb/hXnl2HLJGcdV
 o6bu43L3MwRgJVrPorxGw8XHuUlM6D6wIM7oatmhptfQEUgBv4hj9KoUOTtCt+ah
 1+2xzUO6fG/ilKigVxfAc6FIVK3s+dGqQv5TXcemAnELJ0oRINcvhvn5CHbOwBb7
 mvIQTTtWDeqE3Lwvd/RvtKY3qMjO6Xjj5of3dmb8S29i/eeL+eqZQRVH8zDlexWS
 vdIIRpBdNZJwlCrKzJ4PuMLccbJ2N8qiItQ0W3uPtk8uPcb6vQcncwTnTbQ0wuIU
 +IwuHA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budafpbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 12:48:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58PCm75r019900
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 12:48:07 GMT
Received: from [10.218.44.34] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 25 Sep
 2025 05:48:03 -0700
Message-ID: <dc6e47e0-519a-4e1a-89c8-27864b42454d@quicinc.com>
Date: Thu, 25 Sep 2025 18:18:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event
 interrupt support
Content-Language: en-US
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Andi Shyti
 <andi.shyti@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
 <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
 <41adeb71-f68f-4f50-a85f-5c7dfb5d587a@oss.qualcomm.com>
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <41adeb71-f68f-4f50-a85f-5c7dfb5d587a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rs0VIGYEq7Nrp45k9raCkOQYByysubEo
X-Proofpoint-ORIG-GUID: rs0VIGYEq7Nrp45k9raCkOQYByysubEo
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d53a08 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=QM6AdQsIbM4PHFq6hpEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXz9xmRXFb45lV
 XV85SbGACAS4l/i++wlOjZkLYBUddEqdLrVzROc322k1mMnTJfNDDo7VxggzaPAR7/Gvljd2OOz
 VJezMl2mIiV6Nz/nKxE4O/5uhNUhQPiiYkfzBURMAh9vRcLa0+RjMfo65jnbgV75w+Uby/7y+eO
 jRMpVT1Yn0DJTy95Jk1r+VLX8L+X/lT21hde7Gxgp8Gs7utP8HzrcMrae/kHge3d4bWivtGeXLk
 ZQt1g2hVRgUcFxcOqiM+XAQ9yzNAkZ0Xr/VvjTmXRBf96sWiymfKKORlaoHiSncibL7nGMNUg/d
 pPmLjuKF4ydOZX6vxHvvQKr3MG9EevAdtWurFqHv6t7V1hoRlJUQ6DD6x0/IrBmQnxgjr8CcsO5
 VSXTrNQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
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


On 9/25/2025 4:10 PM, Mukesh Savaliya wrote:
>
>
> On 9/25/2025 4:58 AM, Andi Shyti wrote:
>> Hi Jyothi,
>>
>> I'm sorry, but this is not a resend, but this is a v8. Other
>> than:
>>
>> 1. commit log in patch 1: removed duplicate sentence
>> 2. use proper types when calling geni_i2c_gpi_unmap() inside
>>     geni_i2c_gpi_multi_desc_unmap()
>>
>> is there anything else?
>>
>> Please, next increase the version even for tiny changes.
>>
>>> Jyothi Kumar Seerapu (2):
>>>    dmaengine: qcom: gpi: Add GPI Block event interrupt support
>>
>> We still need Vinod's comments here...
>>
>>>    i2c: i2c-qcom-geni: Add Block event interrupt support
>>
>> ... and Mukesh and Viken's ack here.
>>
>
> Sure, I shall Ack it once your comments are addressed.


Thanks Mukesh, I have raised V8 patch, please review it.

>
>> Thanks,
>> Andi
>
