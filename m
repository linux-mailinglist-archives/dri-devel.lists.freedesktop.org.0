Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB9B6C4E8F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B5110E3B6;
	Wed, 22 Mar 2023 14:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726ED10E3B6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:53:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32M42ex6012818; Wed, 22 Mar 2023 14:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Zj0Gep2DetO+00WU7tBLxt9MtXNcBtJScW83tS5zQa0=;
 b=RULIDduSw58WQIpwl9ThuthyiAoJL55x1iD1dfjfzzl+WJoGRpq650myqbrIUA4mO655
 NZYKs61GRuiXbMtfdKQkMqmEAh8aKX31ONR2YZcc0TD69moVIs67/DF4LeqLNjQJVVKV
 YuULZNts11xGTsbc3l/kS14iu4AuGfXFvPk172xRQgHosg3sRCQ/rm4BI0W4LsZ4umuB
 NpxpapsD/uMfYWudhs28vrVSZ/CHxdJAJxH0yMN0G7Hzz7N6AMPCdmaJhgAyd5qMGv7j
 6LZUz4IF2cfGm7T7qY7jS44Bs19gIDUT0zrLSncsfr3IuiScpFiVPmrp/+RLBcysCIXd Ig== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfrk0sp6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:52:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MEqvO7032745
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:52:57 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:52:56 -0700
Message-ID: <56d8982a-6d86-19d2-74ca-efede0414af7@quicinc.com>
Date: Wed, 22 Mar 2023 08:52:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/7] accel/ivpu: Fix VPU clock calculation
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-8-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230322091900.1982453-8-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rPp_mW1a-QaiqcWqtj_yWj-F9qK-j0yx
X-Proofpoint-ORIG-GUID: rPp_mW1a-QaiqcWqtj_yWj-F9qK-j0yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220106
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/2023 3:19 AM, Stanislaw Gruszka wrote:
> VPU cpu clock frequency depends on the workpoint configuration
> that was granted by the punit. Previously driver was passing
> incorrect frequency to the VPU firmware.

This looks like past tense.  I believe the preference is to use the 
present tense for commit text.  Something like "the driver calculates 
the wrong frequency because it ignores the workpoint config and this 
causes X.  Fix this by using the workpoint config in the freq calculations".

Should this have a fixes tag?  Sounds like this addresses a bug.

> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_hw_mtl.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
> index 98c8a4aa25f0..382ec127be8e 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
> @@ -29,7 +29,6 @@
>   
>   #define PLL_REF_CLK_FREQ	     (50 * 1000000)
>   #define PLL_SIMULATION_FREQ	     (10 * 1000000)
> -#define PLL_RATIO_TO_FREQ(x)	     ((x) * PLL_REF_CLK_FREQ)
>   #define PLL_DEFAULT_EPP_VALUE	     0x80
>   
>   #define TIM_SAFE_ENABLE		     0xf1d0dead
> @@ -789,6 +788,19 @@ static void ivpu_hw_mtl_wdt_disable(struct ivpu_device *vdev)
>   	REGV_WR32(MTL_VPU_CPU_SS_TIM_GEN_CONFIG, val);
>   }
>   
> +static u32 ivpu_hw_mtl_pll_to_freq(u32 ratio, u32 config)
> +{
> +	u32 pll_clock = PLL_REF_CLK_FREQ * ratio;
> +	u32 cpu_clock;
> +
> +	if ((config & 0xff) == PLL_RATIO_4_3)
> +		cpu_clock = pll_clock * 2 / 4;
> +	else
> +		cpu_clock = pll_clock * 2 / 5;
> +
> +	return cpu_clock;
> +}
> +
>   /* Register indirect accesses */
>   static u32 ivpu_hw_mtl_reg_pll_freq_get(struct ivpu_device *vdev)
>   {
> @@ -800,7 +812,7 @@ static u32 ivpu_hw_mtl_reg_pll_freq_get(struct ivpu_device *vdev)
>   	if (!ivpu_is_silicon(vdev))
>   		return PLL_SIMULATION_FREQ;
>   
> -	return PLL_RATIO_TO_FREQ(pll_curr_ratio);
> +	return ivpu_hw_mtl_pll_to_freq(pll_curr_ratio, vdev->hw->config);
>   }
>   
>   static u32 ivpu_hw_mtl_reg_telemetry_offset_get(struct ivpu_device *vdev)

