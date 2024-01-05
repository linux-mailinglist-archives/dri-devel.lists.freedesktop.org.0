Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D808256A7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 16:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE5E10E61A;
	Fri,  5 Jan 2024 15:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C510E61A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 15:32:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405EdfkO002977; Fri, 5 Jan 2024 15:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Lk01dOx/h9bvgnuMkHTMyoU7B2/nNSucp2e42aTwcpw=; b=Dh
 Nb7p+e6H6ejEH2qQ/T2TWSqqFlDToELaTeduFhcqzzecpFIVOL9G4LJIMO6t2992
 FRZ/o0I7SSxZHRL17OqG14pVF5cSKVMkTN+x/0qsPf78sSr9GgZ5CWBwBMmgigiS
 PHPPFXJ3iAjP4Ev54KoOOpJdH6WEIddXzOFwh9H6R0JIJTKMxJPZXfNbU5VD3T59
 gb4cP5KNNoQEsKKcCL0AdiMqhLCs85YEGXLKHhPmHJ+H5j3LEuF+Pim4N+4aYKKk
 3t2Cfpq1LKDlVPCje95n8GiEQox8mxo8gAhltJBi9ZyMroQSy5AIzpY3mZX/nfJO
 +KaU0ZQ4BWpLgkMBtSaA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve96qsbp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 15:32:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405FWAQo005523
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 15:32:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 07:32:09 -0800
Message-ID: <c1817603-e789-35e6-d1f0-ae243f71af24@quicinc.com>
Date: Fri, 5 Jan 2024 08:32:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 03/10] accel/ivpu: Add debug prints for MMU map/unmap
 operations
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-4-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240105112218.351265-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xsDAVlIZMFf704e_rpFHY2oDPhpj07Ik
X-Proofpoint-GUID: xsDAVlIZMFf704e_rpFHY2oDPhpj07Ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401050128
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
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> It is common need to be able to  see IOVA/physical to VPU addresses

Errant double space between "to" and "see"

> mappings. Especially when debugging different kind of memory related
> issues. Lack of such logs forces user to modify and recompile KMD manually.
> 
> This commit adds those logs under MMU debug mask which can be turned on
> dynamically with module param during KMD load.
As far as I understand, the preference is to not expose any kind of raw 
addresses as it is seen as a security issue, and usually the addresses 
don't have any real value to someone reading logs, etc.  I beleive I 
picked this up from GregKH.

However, this commit text suggests there is value, and I see that one 
needs to be root to enable this which could probably be considered a 
sufficent gate to avoiding the data getting into the wrong hands.

Is it possible to provide more details as a justification for this? 
Perhaps an example of a past issue where this data was necessary for debug?

> 
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.h         | 1 +
>   drivers/accel/ivpu/ivpu_mmu_context.c | 9 +++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index ebc4b84f27b2..9b6e336626e3 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -56,6 +56,7 @@
>   #define IVPU_DBG_JSM	 BIT(10)
>   #define IVPU_DBG_KREF	 BIT(11)
>   #define IVPU_DBG_RPM	 BIT(12)
> +#define IVPU_DBG_MMU_MAP BIT(13)
>   
>   #define ivpu_err(vdev, fmt, ...) \
>   	drm_err(&(vdev)->drm, "%s(): " fmt, __func__, ##__VA_ARGS__)
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index 12a8c09d4547..fe6161299236 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -355,6 +355,9 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   		dma_addr_t dma_addr = sg_dma_address(sg) - sg->offset;
>   		size_t size = sg_dma_len(sg) + sg->offset;
>   
> +		ivpu_dbg(vdev, MMU_MAP, "Map ctx: %u dma_addr: 0x%llx vpu_addr: 0x%llx size: %lu\n",
> +			 ctx->id, dma_addr, vpu_addr, size);
> +
>   		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
>   		if (ret) {
>   			ivpu_err(vdev, "Failed to map context pages\n");
> @@ -366,6 +369,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   
>   	/* Ensure page table modifications are flushed from wc buffers to memory */
>   	wmb();
> +

This looks like an unrelated whitespace change (although I see it pairs 
with the whitespace change below).

>   	mutex_unlock(&ctx->lock);
>   
>   	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
> @@ -388,14 +392,19 @@ ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
>   	mutex_lock(&ctx->lock);
>   
>   	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		dma_addr_t dma_addr = sg_dma_address(sg) - sg->offset;
>   		size_t size = sg_dma_len(sg) + sg->offset;
>   
> +		ivpu_dbg(vdev, MMU_MAP, "Unmap ctx: %u dma_addr: 0x%llx vpu_addr: 0x%llx size: %lu\n",
> +			 ctx->id, dma_addr, vpu_addr, size);
> +
>   		ivpu_mmu_context_unmap_pages(ctx, vpu_addr, size);
>   		vpu_addr += size;
>   	}
>   
>   	/* Ensure page table modifications are flushed from wc buffers to memory */
>   	wmb();
> +

This looks like an unrelated whitespace change.

>   	mutex_unlock(&ctx->lock);
>   
>   	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);

