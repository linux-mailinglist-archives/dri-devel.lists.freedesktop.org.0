Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09036A3A1BA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 16:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B9B10E028;
	Tue, 18 Feb 2025 15:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l2tStews";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CFF10E028
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 15:52:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IDSbeb031995;
 Tue, 18 Feb 2025 15:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 45Ya7b/B6eoXvn0f0RDYLUORkpYbRqtkzKFfh57DZNA=; b=l2tStewsfKw7f779
 iHnAKV1G7nfZ7MUoByzKk3Z2XNdRZz2o/gY8WVYpqCxOHwDd07O+tGDEXOLCkzOH
 8Wd4S8yI5/kEHKur5FQyKEuALWV0JpVOkz6sTEOW6Ormlq2QFKSfyndMTNYgRuZp
 s0zQQDC3saoZKFni5ml/0mX6GBpt5yrWA4QrFoBgi3tba+W87gbVC3RoSu0pkUCr
 T+5fjZVTAu0uA+FbOLC21byJoYn0OUwenCNvEh5jsVNLmAyxHxxtDzpPR9RKSngJ
 NrA+IxJaNHffGHnsYuSZQEi9Q4iLmukrzU9gidvbQsvXycSis90vFbsmWaGrV5BM
 k58JFg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7wwbcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 15:52:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IFqjmJ011585
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 15:52:45 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 07:52:45 -0800
Message-ID: <0e3d1b36-b8e0-f473-0cb8-0d1eaea5e3a2@quicinc.com>
Date: Tue, 18 Feb 2025 08:52:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/6] accel/ivpu: Add missing locks around mmu queues
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>, Andrzej
 Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-2-jacek.lawrynowicz@linux.intel.com>
 <8b7ef8c3-788e-bf2a-c393-a627397f6e3f@quicinc.com>
 <f97d2306-d03b-47f6-836c-c9057e526490@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <f97d2306-d03b-47f6-836c-c9057e526490@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ClxFFN_2fNhNkdurwPUxRlcHD8005jEL
X-Proofpoint-ORIG-GUID: ClxFFN_2fNhNkdurwPUxRlcHD8005jEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=808 spamscore=0 adultscore=0 mlxscore=0
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

On 2/17/2025 8:26 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 2/14/2025 5:41 PM, Jeffrey Hugo wrote:
>> On 2/4/2025 1:46 AM, Jacek Lawrynowicz wrote:
>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>
>>> Multiple threads were accessing mmu cmd queue simultaneously
>>> causing sporadic failures in ivpu_mmu_cmdq_sync() function.
>>> Protect critical code with mmu mutex.
>>
>> Describe a scenario in which this can occur? The two functions this patch modify cannot run concurrently from what I can tell.
> 
> Functions from this diff are called in bottom IRQ handler when memory faults are detected.
> The CMDQ is also accessed from IOCTLs when mapping/unmapping buffers in NPU MMU (ivpu_mmu_invalidate_tlb()).

Ah.  Ok.  I think pointing that out in the commit text would be very 
helpful.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
