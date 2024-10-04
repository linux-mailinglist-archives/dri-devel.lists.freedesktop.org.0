Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59950990A61
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B7D10E15C;
	Fri,  4 Oct 2024 17:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SxH5/v3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19B10E15C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 17:50:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AXd14012742;
 Fri, 4 Oct 2024 17:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kYC3/otrx6wZfYYsfKEqO9HhEkosQLQun98tsAVzUl4=; b=SxH5/v3zv+2XluhK
 5eJtQUIWGQhe6v+gjEPV3ewa5Pztj7I80Hd86k6OHFIrly3LDlboPVsBp4Hv4e8p
 clKH2iWayqjA9ggbgxFq/pdpfIN0YA3t7LuJ6MS1RB9xQZsZGu6OKPrIFJFWXLYZ
 RB//BlxkdTBBFGoU8ODOgrTM3WIkqSfPPhodZny87ayWHiKeBSFXOd3N6O5Hnfow
 0XtBf6jycaWnd5KUxTqztcV/4s5xsW4ZyX+qMr2aepC/sxyooM18CHdoK1cWnSs7
 yZ6zCDCWyO4fqkDxIWGfprBbRhMt8AmFy935MJk9wL505VgDE1HJAcJTcOEy0vlF
 QS9wFQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kauff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 17:50:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494HoW2Y019311
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 17:50:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:50:31 -0700
Message-ID: <c1f92388-bd94-ebc2-dd59-0434a3fa63a6@quicinc.com>
Date: Fri, 4 Oct 2024 11:50:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 05/11] accel/amdxdna: Add hardware context
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-6-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-6-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X-JDjG1V8kxyHiMPqmbi2sb6y3IiSBTn
X-Proofpoint-ORIG-GUID: X-JDjG1V8kxyHiMPqmbi2sb6y3IiSBTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040123
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

On 9/11/2024 12:05 PM, Lizhi Hou wrote:
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> new file mode 100644
> index 000000000000..52a71661f887
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/amdxdna_accel.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +#include <linux/types.h>
> +
> +#include "amdxdna_ctx.h"
> +#include "amdxdna_mailbox.h"
> +#include "amdxdna_pci_drv.h"
> +#include "aie2_pci.h"
> +#include "aie2_solver.h"

Alphabetical order?

<snip>
> +/**
> + * struct amdxdna_drm_create_hwctx - Create hardware context.
> + * @ext: MBZ.
> + * @ext_flags: MBZ.
> + * @qos_p: Address of QoS info.
> + * @umq_bo: BO handle for user mode queue(UMQ).
> + * @log_buf_bo: BO handle for log buffer.
> + * @max_opc: Maximum operations per cycle.
> + * @num_tiles: Number of AIE tiles.
> + * @mem_size: Size of AIE tile memory.
> + * @umq_doorbell: Returned offset of doorbell associated with UMQ.
> + * @handle: Returned hardware context handle.
> + * @pad: MBZ.

You specify must be zero, but I don't see that checked anywhere.

> + */
> +struct amdxdna_drm_create_hwctx {
> +	__u64 ext;
> +	__u64 ext_flags;
> +	__u64 qos_p;
> +	__u32 umq_bo;
> +	__u32 log_buf_bo;
> +	__u32 max_opc;
> +	__u32 num_tiles;
> +	__u32 mem_size;
> +	__u32 umq_doorbell;
> +	__u32 handle;
> +	__u32 pad;
> +};
