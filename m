Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67A83E138
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD2510FD24;
	Fri, 26 Jan 2024 18:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEE310FD24
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:23:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QEp54o014475; Fri, 26 Jan 2024 18:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=3JAH1q0z9O6KV5D0zwNvbgSsZdcHh/RDoWHSg+mbLqc=; b=ba
 fXHy3hRoXcLiKkRWYb7XZi1XjguDCYfLdDM7PvS/tvN/PQreP4imb43OtqARclzC
 msHrDm/0kAQStxRypF/OZ01IR4wY4EhqEj4KLb2V/DfJar3sVqeARFdPdZhficwA
 HUfrPTIw5nmhguNneXXFiv5hrXOLynLGklvqMAbfj2+it01gtd5+hU3WZXeiV4Ys
 7uSGb0jcKHBV1m7wq70vEOBu2Tn+yEYHqQGPQoL9SXX1vYbezZ6gjZgi53Xx4Yue
 5ZLUUHfOQMlwgkOBjnZskaHPj/fnSR5FQkNqfJK783ChWDfRmuX02nEnFqTY6XLW
 8S8OGxuv38tp7fPVid2Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv6c8hm1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 18:23:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QINRDo010776
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 18:23:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 10:23:27 -0800
Message-ID: <e1c84571-431c-a8ae-eedb-cc0306fff99b@quicinc.com>
Date: Fri, 26 Jan 2024 11:23:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/7] accel/ivpu: Gracefully shutdown NPU before reset
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
 <20240126122804.2169129-5-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240126122804.2169129-5-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C3J8-oPHoVqEbF6OQd6hAMJwKcltGAQx
X-Proofpoint-ORIG-GUID: C3J8-oPHoVqEbF6OQd6hAMJwKcltGAQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260135
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
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/2024 5:28 AM, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> Replace forceful disable of power domains with requests to disable
> TOP NOC CPU_CTRL and HOSTIF_L2CACHE through QREQN.
> 
> In case of failure retry multiple times following HAS sequence of
> checking both QACCEPN and QDENYN registers.
> 
> This fixes VPU hangs with PCODE released in January 2024 onwards.
> 
> Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_hw_37xx.c | 122 +++++++++++++++---------------
>   1 file changed, 60 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 77accd029c4a..b1a3a19c8986 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -332,28 +332,6 @@ static int ivpu_boot_top_noc_qrenqn_check(struct ivpu_device *vdev, u32 exp_val)
>   	return 0;
>   }
>   
> -static int ivpu_boot_top_noc_qacceptn_check(struct ivpu_device *vdev, u32 exp_val)
> -{
> -	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN);
> -
> -	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, CPU_CTRL, exp_val, val) ||
> -	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, HOSTIF_L2CACHE, exp_val, val))
> -		return -EIO;
> -
> -	return 0;
> -}
> -
> -static int ivpu_boot_top_noc_qdeny_check(struct ivpu_device *vdev, u32 exp_val)
> -{
> -	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY);
> -
> -	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, CPU_CTRL, exp_val, val) ||
> -	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, HOSTIF_L2CACHE, exp_val, val))
> -		return -EIO;
> -
> -	return 0;
> -}
> -
>   static int ivpu_boot_host_ss_configure(struct ivpu_device *vdev)
>   {
>   	ivpu_boot_host_ss_rst_clr_assert(vdev);
> @@ -396,37 +374,68 @@ static int ivpu_boot_host_ss_axi_enable(struct ivpu_device *vdev)
>   	return ivpu_boot_host_ss_axi_drive(vdev, true);
>   }
>   
> -static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable)
> +static int ivpu_boot_host_ss_top_noc_qacceptn_check(struct ivpu_device *vdev, bool enable, u32 mask)
> +{
> +	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN) & mask;
> +
> +	if (enable && val == mask)
> +		return 0;
> +
> +	if (!enable && val == 0)
> +		return 0;
> +
> +	ivpu_dbg(vdev, PM, "Failed qacceptn check 0x%x (mask 0x%x enable %d)\n", val, mask, enable);
> +	return -EIO;
> +}
> +
> +static int ivpu_boot_host_ss_top_noc_qdeny_check(struct ivpu_device *vdev, u32 mask)
> +{
> +	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY) & mask;
> +
> +	if (val) {
> +		ivpu_dbg(vdev, PM, "Failed qdeny check 0x%x (mask 0x%x)\n", val, mask);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable, u32 mask)
>   {
> -	int ret;
>   	u32 val;
>   
>   	val = REGV_RD32(VPU_37XX_TOP_NOC_QREQN);
> -	if (enable) {
> -		val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
> -		val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
> -	} else {
> -		val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
> -		val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
> -	}
> -	REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val);
> +	if (enable)
> +		REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val | mask);
> +	else
> +		REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val & ~mask);
>   
> -	ret = ivpu_boot_top_noc_qacceptn_check(vdev, enable ? 0x1 : 0x0);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed qacceptn check: %d\n", ret);
> -		return ret;
> -	}
> +	if (!ivpu_boot_host_ss_top_noc_qacceptn_check(vdev, enable, mask))
> +		return 0;
>   
> -	ret = ivpu_boot_top_noc_qdeny_check(vdev, 0x0);
> -	if (ret)
> -		ivpu_err(vdev, "Failed qdeny check: %d\n", ret);
> +	if (!enable && ivpu_boot_host_ss_top_noc_qdeny_check(vdev, mask))
> +		REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val | mask);
>   
> -	return ret;
> +	return -EIO;
>   }
>   
>   static int ivpu_boot_host_ss_top_noc_enable(struct ivpu_device *vdev)
>   {
> -	return ivpu_boot_host_ss_top_noc_drive(vdev, true);
> +	return ivpu_boot_host_ss_top_noc_drive(vdev, true,
> +					       VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK |
> +					       VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK);
> +}
> +
> +static int ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(struct ivpu_device *vdev)
> +{
> +	return ivpu_boot_host_ss_top_noc_drive(vdev, false,
> +					       VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK);
> +}
> +
> +static int ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(struct ivpu_device *vdev)
> +{
> +	return ivpu_boot_host_ss_top_noc_drive(vdev, false,
> +					       VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK);
>   }
>   
>   static void ivpu_boot_pwr_island_trickle_drive(struct ivpu_device *vdev, bool enable)
> @@ -510,16 +519,6 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
>   	return ret;
>   }
>   
> -static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
> -{
> -	ivpu_boot_dpu_active_drive(vdev, false);
> -	ivpu_boot_pwr_island_isolation_drive(vdev, true);
> -	ivpu_boot_pwr_island_trickle_drive(vdev, false);
> -	ivpu_boot_pwr_island_drive(vdev, false);
> -
> -	return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
> -}
> -
>   static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
>   {
>   	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
> @@ -618,19 +617,18 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>   
>   static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>   {
> -	int ret = 0;
> +	int retries = 100;
>   
> -	if (ivpu_boot_pwr_domain_disable(vdev)) {
> -		ivpu_err(vdev, "Failed to disable power domain\n");
> -		ret = -EIO;
> -	}
> +	while (ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(vdev) && --retries > 0)
> +		ivpu_warn(vdev, "Retrying to disable CPU control, retries left: %d\n", retries);
>   
> -	if (ivpu_pll_disable(vdev)) {
> -		ivpu_err(vdev, "Failed to disable PLL\n");
> -		ret = -EIO;
> -	}
> +	while (ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(vdev) && --retries > 0)
> +		ivpu_warn(vdev, "Retrying to disable HostIf L2 Cache, retries left: %d\n", retries);
>   
> -	return ret;
> +	while (ivpu_pll_disable(vdev) && --retries > 0)
> +		ivpu_warn(vdev, "Retrying to disable PLL, retries left: %d\n", retries);
> +
> +	return retries > 0 ? 0 : -EIO;

It seems weird that retries is never reset between operations.  Why is that?

