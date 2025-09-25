Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAC6B9F525
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5C10E2BF;
	Thu, 25 Sep 2025 12:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dYlx8oaa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D8B10E2BF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:46:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9jEc4025075;
 Thu, 25 Sep 2025 12:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FNHO05SX2ISnbSmP3iCTPQxHrJHJuuNmq1A3PLmG1/s=; b=dYlx8oaa5hiYO6GZ
 Z6+AAC7aS5MhXQRW7Od8z/CyA6ZKWkEJI7zW4IBXVcDMiBgSbY97lxAT1qR+WGtV
 hw2IGEXTAAjxKKs/Ev44UUbUJeZImMOhcd9BrhhcbWX74+Z/bXSH2Ra9BXcbTySL
 /6oCpVzelQ/eBSfVx8xWaV8TcV9lKLOT8GPZiM7o7UqFmpmLoZUF1E3++cotMZDt
 24RKylmX0Jz5rlEBLiqAmtE03Xzig3nNkGiDbGn/SHNB0Y4Fs/0o6rRfVNUT+UnB
 x9BXO1r6lYwiTYbdSEhmYBzhTwnCnsIWpilXgyr5P7hzZfykMpWdT1KGHVBk/1Yd
 YNygiQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf0e2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 12:46:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58PCkSo5014879
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Sep 2025 12:46:28 GMT
Received: from [10.218.44.34] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 25 Sep
 2025 05:46:23 -0700
Message-ID: <43719456-cb4a-4cf9-99cd-2b97b1300c87@quicinc.com>
Date: Thu, 25 Sep 2025 18:16:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event
 interrupt support
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Mukesh Kumar Savaliya
 <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
 <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BqH7osJsGLflu6b1HESYpIrNgIhCoe6u
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d539a4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=hdYCJYuJWRfGjIhB1IAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX0w2DYUOyEQl+
 ueSU8oqvjsE5xRZJRNZ6rxVZjSf8lqF4NDlxibk0R1PBdIA8QWskmxbIbNlxuJNqhbBrUu5Q+U9
 5ZpFWI4jxssM0GkQUe/KQyFkeu7HM/7u+5P2VJjx01NIAYTLJ3N/Ll0Y+q0mY8HyLvnZQDITmbI
 VgCG2kbkCL8SyViauxnWNChQVx5Wb66uW4RyEkhF6/nEhelgAMIq0ZScTAZvm4Nd6O0IRF4L397
 iK3+eQc3bG7I5O14DvIJ7DiJgGuXJDhps/nRgXTCMzpPaH/o1SA51IHNm+WeupwmASk0kSuyvJ/
 TUK9vOQDmcOcKhOiN50xURfArHxnxUrVHNw9GW7lCICdmXgCRo80kNKme+9zxv1FcDGkO+3CZz1
 dngniYV/
X-Proofpoint-ORIG-GUID: BqH7osJsGLflu6b1HESYpIrNgIhCoe6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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


On 9/25/2025 4:58 AM, Andi Shyti wrote:
> Hi Jyothi,
>
> I'm sorry, but this is not a resend, but this is a v8. Other
> than:
>
> 1. commit log in patch 1: removed duplicate sentence
> 2. use proper types when calling geni_i2c_gpi_unmap() inside
>     geni_i2c_gpi_multi_desc_unmap()
>
> is there anything else?
>
> Please, next increase the version even for tiny changes.
Thanks Andi, I’ve raised the V8 patch as per the suggestion.
>> Jyothi Kumar Seerapu (2):
>>    dmaengine: qcom: gpi: Add GPI Block event interrupt support
> We still need Vinod's comments here...
>
>>    i2c: i2c-qcom-geni: Add Block event interrupt support
> ... and Mukesh and Viken's ack here.
>
> Thanks,
> Andi
