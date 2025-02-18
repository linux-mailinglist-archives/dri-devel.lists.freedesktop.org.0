Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B0A3A1AA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 16:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87D89D8E;
	Tue, 18 Feb 2025 15:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CyP0oiKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0292489D8E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 15:48:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IBUkTm007902;
 Tue, 18 Feb 2025 15:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 778Usg+Zwh/0/N/+R3l2c/Gvca+e1sfQLqjWGOk1IDI=; b=CyP0oiKvb4QWDKM6
 Zqh49rTCVZDutGl7sD1JAxTQSW+mGC1kkeNCYJKN65VypaoG55V6AH6nOXiTzrsg
 2JYNiNZbUojbHwos1ed6ihdRepwZlacvzk9orYR6VOSvVmE485dLiL3jEemHKQ2v
 lYxnOwvYA9HMsDoQJorR1CYa4Q3FgoR03RScMATyCftxnU4IXvkmvoxnFSkasxpK
 06MyOp1on0wSOxkZtDLTLPDzh+TZM0hcso9yq5B4nDia5YKpF82Ow4uDqbILLKVO
 Ee+WOxxSOTBj9cEPliaGvySlXuLldN2F6LdNUQ02OH1XBUUUWmQUClGYrQRmE8MK
 5KL4zQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7wwb1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 15:48:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IFmq5O025141
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 15:48:52 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 07:48:52 -0800
Message-ID: <3cefa73f-6340-31e2-bc8d-53f7cfbf63ba@quicinc.com>
Date: Tue, 18 Feb 2025 08:48:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/6] accel/ivpu: Prevent runtime suspend during context
 abort work
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>, Andrzej
 Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-3-jacek.lawrynowicz@linux.intel.com>
 <794746b9-6b17-df7c-24a4-abde7701d041@quicinc.com>
 <437dd773-2372-46e7-bb56-6200ec054074@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <437dd773-2372-46e7-bb56-6200ec054074@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: I5j_ekFvkmi-sBBJduwI_16PsTpbN-Vn
X-Proofpoint-ORIG-GUID: I5j_ekFvkmi-sBBJduwI_16PsTpbN-Vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180115
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

On 2/17/2025 8:33 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 2/14/2025 5:49 PM, Jeffrey Hugo wrote:
>> On 2/4/2025 1:46 AM, Jacek Lawrynowicz wrote:
>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>
>>> Increment the runtime PM counter when entering
>>> ivpu_context_abort_work_fn() to prevent the device
>>> from suspending while the function is executing.
>>
>> Why should suspend be prevented during the abort fn?
> 
> ivpu_context_abort_work_fn() executes a pair of reset/resume engine IPC commands that always have to be paired.
> Suspend/resume between them cases related FW state to be lost and resume engine then fails.

This feels like relevant information that should be included in the 
commit text as justification for making this change.

Assuming such an update,
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
