Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65C8C28EB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 18:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA82110EEC6;
	Fri, 10 May 2024 16:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SNH5zCZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA11610EEC6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 16:46:32 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADUlbm003593;
 Fri, 10 May 2024 16:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=W+UDV+O3HAFm/oqboELRpFvgTxN7hvoJVnl7vnUx/tk=; b=SN
 H5zCZyPmJNM7hf5cgOQFg3YaFQTeEdrz6CYgUiaynI5OdcOFgtSM77cJ0+SzvoF+
 MoABBl8SBMfoAMPftk6EtiurZoQ8VlCzvwPGpf2923UPuylZnquiIoCSIiRqU513
 UhKY0NJAWG8yb043i2R37LPnlQmSdHlZI1v/PFZoRgfT6Z2LPtMEakKlPA/vkRUG
 bWOMTMDOkIG8wRPqUka6VwdQ0yQusyn2PjFn0lHXlBOna2k7e2GrbkcEniGC+U2G
 bheKV6cW9bavSOEn3ZCNYZI+U5l/wdvSUnZsNSR661lbtgD4U/A90l3CMD2PvdwZ
 hiB38QoFszQsAP1SCOuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w1233r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:46:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AGkUVg031602
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 16:46:30 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 09:46:29 -0700
Message-ID: <77e6e704-b377-347b-9ce8-858a36a0b269@quicinc.com>
Date: Fri, 10 May 2024 10:46:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 08/12] accel/ivpu: Add NPU profiling support
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132106.2387464-9-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240508132106.2387464-9-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KwhjBhxs24EvJl7HiKrWNLOqG5mAbGjq
X-Proofpoint-ORIG-GUID: KwhjBhxs24EvJl7HiKrWNLOqG5mAbGjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405100121
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

On 5/8/2024 7:21 AM, Jacek Lawrynowicz wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> Implement time based Metric Streamer profiling UAPI.
> 
> This is a generic mechanism allowing user mode tools to sample
> NPU metrics. These metrics are defined by the FW and transparent to
> the driver.
> 
> The user space can check for this feature by checking
> DRM_IVPU_CAP_METRIC_STREAMER driver capability.
> 
> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/Makefile       |   3 +-
>   drivers/accel/ivpu/ivpu_drv.c     |  14 +-
>   drivers/accel/ivpu/ivpu_drv.h     |   3 +
>   drivers/accel/ivpu/ivpu_jsm_msg.c |  98 ++++++++++
>   drivers/accel/ivpu/ivpu_jsm_msg.h |   8 +-
>   drivers/accel/ivpu/ivpu_ms.c      | 309 ++++++++++++++++++++++++++++++
>   drivers/accel/ivpu/ivpu_ms.h      |  36 ++++
>   drivers/accel/ivpu/ivpu_pm.c      |   4 +
>   include/uapi/drm/ivpu_accel.h     |  69 ++++++-
>   9 files changed, 540 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/accel/ivpu/ivpu_ms.c
>   create mode 100644 drivers/accel/ivpu/ivpu_ms.h
> 
> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
> index 95ff7ad16338..726cf8f28ea3 100644
> --- a/drivers/accel/ivpu/Makefile
> +++ b/drivers/accel/ivpu/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -# Copyright (C) 2023 Intel Corporation
> +# Copyright (C) 2022-2024 Intel Corporation

Are you sure this is correct?  Seems odd to be adding 2022 in addition 
to 2024 at this point.

-Jeff
