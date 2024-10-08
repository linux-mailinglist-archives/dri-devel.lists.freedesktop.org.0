Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AA995316
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 17:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A46310E0F2;
	Tue,  8 Oct 2024 15:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mCC8goXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE6F10E0F2;
 Tue,  8 Oct 2024 15:16:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4987d8CH022365;
 Tue, 8 Oct 2024 15:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CUUUppPKv/gk3AtUzBkoKJ4dh/9TbDofAqfWC3so4Ys=; b=mCC8goXqPIpDVuXZ
 DIDRSr0XUWUJ6kHxxK0VTlDTMVNiQwb+Uo9ciLCtRO7kaEp5By4OkounPwDbL2S8
 n/qY84NKnhKC9keXJ4incEksXSuwfOMU2iCwUc3IMJuihWTkQQr81Q6urMQ3ENzo
 ZSj90oAhMWFKvgVR5v9p4HJg9v977WImcF7ka/0LTlFIiCDherFCTyp88DUuShZi
 4AG2YKupjZpCbJV7WHH/o9C5zZipZZDb1epPlJn7Iu0YG1V3pf1ARhum5CQuVFDy
 bo84nSLPUKQjYcTbFHQ5xkspePiRY6i4aEeVazchtlTkYex0rY+qpmqyvI6ob3oB
 PDTHmQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaeu34j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 15:16:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498FGe0L018295
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Oct 2024 15:16:40 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 08:16:40 -0700
Message-ID: <1df3fcee-4854-4c55-b8ae-20c9f0ea2d78@quicinc.com>
Date: Tue, 8 Oct 2024 08:16:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
To: Harry Wentland <harry.wentland@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Arthur Grillo
 <arthurgrillo@riseup.net>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-4-harry.wentland@amd.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241003200129.1732122-4-harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PRdPYJcP1dRrK9yaSbnAbmPOc5HuzMA7
X-Proofpoint-GUID: PRdPYJcP1dRrK9yaSbnAbmPOc5HuzMA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=949 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080097
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

On 10/3/24 13:00, Harry Wentland wrote:
> Debugging LUT math is much easier when we can unit test
...
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> new file mode 100644
> index 000000000000..efe139978860
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -0,0 +1,168 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <kunit/test.h>
...
> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_LICENSE("GPL");

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning when built with make W=1. Please add the missing
MODULE_DESCRIPTION()

/jeff



