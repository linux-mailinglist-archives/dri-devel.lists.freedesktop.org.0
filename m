Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F4A966996
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 21:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82FC10EAEC;
	Fri, 30 Aug 2024 19:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NBVQq2Xm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDD310EAEC;
 Fri, 30 Aug 2024 19:28:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFs9pU007623;
 Fri, 30 Aug 2024 19:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AcgT/476k0Npq3t+XDPm9gRME2dYfkE+YwdTSedGxfM=; b=NBVQq2XmO1T80xD0
 lrzAfHq8uxs4OttkoFKa6Nz7VFluOxR1KNkLjJH3SFIanKis5LswUg/d2dhPsJ0S
 yehHo2jbFyOSdUOyZMoVs5UeFlif6t/iBdgHruqYR3AfwReZT10Z1KBvkg6xwZnV
 HOypFbYF4wEoiCfukXW0udKWssveK3FYqa5KILDS50iRBw9tiwFHkOu6v6QSozkr
 v4f21Qic/Laq7joYGgu8Z2+W4EmfC2OYB+2eeI9IMYppGrItLY2/XrI3+KqCaG/f
 aBn0zXF6d9V9EeInL/ve7Kvunmvvt7F4bUc787dl3kbWCqevfLxrRBc3ls7k5xnO
 0p7XjQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0hyy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 19:28:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UJSDUB028485
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 19:28:13 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 12:28:13 -0700
Message-ID: <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
Date: Fri, 30 Aug 2024 12:28:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
 <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OhV9OyGasRv82lbgtaFTungIP973zmVg
X-Proofpoint-ORIG-GUID: OhV9OyGasRv82lbgtaFTungIP973zmVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300149
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



On 8/30/2024 10:18 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
>> Add support for allocating the concurrent writeback mux as part of the
>> WB allocation
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
>>   2 files changed, 32 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index c17d2d356f7a..c43cb55fe1d2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -1,5 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    */
>>   
>>   #ifndef _DPU_HW_MDSS_H
>> @@ -352,6 +354,7 @@ struct dpu_mdss_color {
>>   #define DPU_DBG_MASK_DSPP     (1 << 10)
>>   #define DPU_DBG_MASK_DSC      (1 << 11)
>>   #define DPU_DBG_MASK_CDM      (1 << 12)
>> +#define DPU_DBG_MASK_CWB      (1 << 13)
>>   
>>   /**
>>    * struct dpu_hw_tear_check - Struct contains parameters to configure
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index bc99b04eae3a..738e9a081b10 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -1,9 +1,10 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>> +#include <drm/drm_managed.h>
>>   #include "msm_drv.h"
>>   #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
>>   #include "dpu_kms.h"
>> @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
>>   		void __iomem *mmio)
>>   {
>>   	int rc, i;
>> +	struct dpu_hw_blk_reg_map *cwb_reg_map;
>>   
>>   	if (!rm || !cat || !mmio) {
>>   		DPU_ERROR("invalid kms\n");
>> @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
>>   		rm->hw_intf[intf->id - INTF_0] = hw;
>>   	}
>>   
>> +	if (cat->cwb_count > 0) {
>> +		cwb_reg_map = drmm_kzalloc(dev,
>> +				sizeof(*cwb_reg_map) * cat->cwb_count,
>> +				GFP_KERNEL);
> 
> Please move CWB block pointers to dpu_rm. There is no need to allocate a
> separate array.

Hi Dmitry,

Sorry, I'm not sure what you mean here. Can you clarify your comment?

This is just allocating an array of the CWB register addresses so that 
the hw_wb block can use it to configure the CWB mux registers.

Thanks,

Jessica Zhang

> 
>> +
>> +		if (!cwb_reg_map) {
>> +			DPU_ERROR("failed cwb object creation\n");
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +
>> +
>> +	for (i = 0; i < cat->cwb_count; i++) {
>> +		struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
>> +
>> +		cwb->blk_addr = mmio + cat->cwb[i].base;
>> +		cwb->log_mask = DPU_DBG_MASK_CWB;
>> +	}
>> +
>>   	for (i = 0; i < cat->wb_count; i++) {
>>   		struct dpu_hw_wb *hw;
>>   		const struct dpu_wb_cfg *wb = &cat->wb[i];
>>   
>> -		hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
>> +		if (cat->cwb)
>> +			hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
>> +					cat->mdss_ver, cwb_reg_map);
>> +		else
>> +			hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
>> +
>>   		if (IS_ERR(hw)) {
>>   			rc = PTR_ERR(hw);
>>   			DPU_ERROR("failed wb object creation: err %d\n", rc);
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry
