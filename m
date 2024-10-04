Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639B990A32
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB5810EA4F;
	Fri,  4 Oct 2024 17:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fURdZFdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D74A10EA4F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 17:34:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AKV7Q032546;
 Fri, 4 Oct 2024 17:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MT2GkEwZKuwrpu/ZRjc96KiAeaiilTh4HoBXYCpv8WU=; b=fURdZFdbZyZsNFiy
 kpelqV9/aXdrCW80aky5rSz9O0yzbTx0vMO7TVera00ZbPgnKuAoRZSnf2my8uLE
 LBiqc23JN/G89sjH3hELb+vuIFHlnv97jHDqRdt9CnQaUJdZ7L7pJUID0tCE2YYu
 u8jZRBXB3mc9VGZ4Mxfdg1Zu5YVJ+BhyltYdem6P2EBjS1mn79ynjlj3pxsxOgH0
 dPFjyvgnWSVQR4YwI/fPbUvZBimtkTdpf+DxXBZ0kL9GhOE4fq3st7AIzb4sT2Ma
 ns/Cr0nDmGcYZ+/x/pAvoE0Tjv8Qwd947R9vkHEXjUZy3u94RLp/9e5Q3QWNljKI
 PyByrQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f2ts9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 17:34:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494HYDAI017938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 17:34:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:34:12 -0700
Message-ID: <86c8f688-eea3-ff95-5ae5-2e4da32b7edb@quicinc.com>
Date: Fri, 4 Oct 2024 11:34:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 03/11] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>,
 George Yang <George.Yang@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-4-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-4-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pq6_GxgSWdVfz9auUSD_XKmOQEBUVoBk
X-Proofpoint-ORIG-GUID: pq6_GxgSWdVfz9auUSD_XKmOQEBUVoBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040120
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
> +struct create_ctx_req {
> +	__u32	aie_type;
> +	__u8	start_col;
> +	__u8	num_col;
> +	__u16	reserved;
> +	__u8	num_cq_pairs_requested;
> +	__u8	reserved1;
> +	__u16	pasid;
> +	__u32	pad[2];
> +	__u32	sec_comm_target_type;
> +	__u32     context_priority;

Alignment

> +} __packed;
> +
> +struct create_ctx_resp {
> +	enum aie2_msg_status	status;
> +	__u32			context_id;
> +	__u16			msix_id;
> +	__u8			num_cq_pairs_allocated;
> +	__u8			reserved;
> +	struct cq_pair		cq_pair[MAX_CQ_PAIRS];
> +} __packed;
> +
> +struct destroy_ctx_req {
> +	__u32	context_id;
> +} __packed;
> +
> +struct destroy_ctx_resp {
> +	enum aie2_msg_status	status;
> +} __packed;
> +
> +struct execute_buffer_req {
> +	__u32	cu_idx;
> +	__u32	payload[19];
> +} __packed;
> +
> +struct exec_dpu_req {
> +	__u64	inst_buf_addr;
> +	__u32     inst_size;
> +	__u32     inst_prop_cnt;
> +	__u32     cu_idx;

Alignment

> +	__u32	payload[35];
> +} __packed;
> +
> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
> index c87ca322e206..ac5296f4f2ae 100644
> --- a/drivers/accel/amdxdna/aie2_psp.c
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -8,6 +8,8 @@
>   #include <drm/drm_print.h>
>   #include <linux/iopoll.h>
>   
> +#include "amdxdna_mailbox.h"
> +#include "amdxdna_pci_drv.h"
>   #include "aie2_pci.h"

Doesn't look like alphabetical order to me.  Also similar instances in 
the *_regs.c files below

>   
>   #define PSP_STATUS_READY	BIT(31)


