Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DD28C28F9
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9277610E758;
	Fri, 10 May 2024 16:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BGJlCPZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E261810E85D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:55:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AE94FR000365;
 Fri, 10 May 2024 16:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=AqTkPMAOUPd59As1vNtWnebyqM5vJ6ujfME/KvQ5HU4=; b=BG
 JlCPZAoGeUFpOKvl+4XzlEKBZbj5fGX9QAqy8+8HFkkRI83FMPCvNv5LgFp+n5MQ
 yEHxklT1FKdlMCJPJhiSVa3YFMcTlbvCHXS4tVA7t0o4x62oYGo2XdfIgqS/zRFF
 8keGIQe5Lp29hkg/UbX4lervnvO5fiiyCF6HT1xkAEu9hRktvpbSjVPSMoa1ovxN
 0xG2O+1RG0LNs0MWTE/gnp49cyK71w5BG77lgZ+5u9n6wA1dSj5fPQedcijS2pU/
 VOcph4JdHq43QzDBeqqMPwwU5meLi8WDwxsHItb1yUd//JtAbS8T9ae0uj4yKG3w
 ERE5geVxBu+IqNDyalYw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w2a1cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:55:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AGtQ8O009472
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:55:26 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 09:55:26 -0700
Message-ID: <aad0fac7-279a-0b40-569e-73acf8b77db2@quicinc.com>
Date: Fri, 10 May 2024 10:55:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 12/12] accel/ivpu: Share NPU busy time in sysfs
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132931.2388996-1-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240508132931.2388996-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bNtsx_obLPr-xj0aL418Bl-sGr8--qFh
X-Proofpoint-GUID: bNtsx_obLPr-xj0aL418Bl-sGr8--qFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=904 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100122
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

On 5/8/2024 7:29 AM, Jacek Lawrynowicz wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> The driver tracks the time spent by NPU executing jobs
> and shares it through sysfs `npu_busy_time_us` file.
> It can be then used by user space applications to monitor device
> utilization.
> 
> NPU is considered 'busy' starting with a first job submitted
> to firmware and ending when there is no more jobs pending/executing.
> 
> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

This feels like something that would normally be handled by perf. Why 
not use that mechanism?

-Jeff
