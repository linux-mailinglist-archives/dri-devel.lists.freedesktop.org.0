Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8C59EE49
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4B510FD10;
	Tue, 23 Aug 2022 21:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442F10FABE;
 Tue, 23 Aug 2022 21:37:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NLJFxY025675;
 Tue, 23 Aug 2022 21:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CI3JVAQRIsqISCbm0ZqMNusQmEhT/CFUtIlZncrDFzo=;
 b=Dn0ZksBK6X7uThbhvDZb8VelfJoE+0Imdg8jxY6VKXuL2PFlg9a3Oi/GE658Ecl+OGLr
 meuV9rOd+7o69XQOX3LPB8u94ZxeiQ3bZRJ5je3tSkk7K94lgyTutdXvYNMxX5ngFlwY
 hLCEP7sJ6PeJVRuoJ668wOBqw+JddBiGe52N0Sg+Z7NuXn0z04bhoBXLGB9eVH2pB82n
 VZd/ampze5gSAPrZPzJ04x/pSoVhv+YhSL5jALxteKT1mPzzO20iyNOLPaiTQvUaU+6L
 nAkJO4tWXunE0RJNJFc0dB7yPFSH2f7s0rQXtFFY/FNewD7cD3W6t2v/nYZ0lOiIUSca 9g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52ppru0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 21:37:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NLb0rZ020259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 21:37:00 GMT
Received: from [10.216.10.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 14:36:56 -0700
Message-ID: <8d3c8ae2-f342-b38c-e0d2-9abd357703f5@quicinc.com>
Date: Wed, 24 Aug 2022 03:06:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2] drm/msm/iommu: optimize map/unmap
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20220823163719.90399-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220823163719.90399-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dMz0F2sAxj2jjy5LIvUIlQhoynsXnLK6
X-Proofpoint-GUID: dMz0F2sAxj2jjy5LIvUIlQhoynsXnLK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_09,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230081
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/2022 10:07 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Using map_pages/unmap_pages cuts down on the # of pgtable walks needed
> in the process of finding where to insert/remove an entry.  The end
> result is ~5-10x faster than mapping a single page at a time.
>
> v2: Rename iommu_pgsize(), drop obsolete comments, fix error handling
>      in msm_iommu_pagetable_map()
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 101 +++++++++++++++++++++++++++-----
>   1 file changed, 86 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index a54ed354578b..5577cea7c009 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -21,6 +21,7 @@ struct msm_iommu_pagetable {
>   	struct msm_mmu base;
>   	struct msm_mmu *parent;
>   	struct io_pgtable_ops *pgtbl_ops;
> +	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
>   	phys_addr_t ttbr;
>   	u32 asid;
>   };
> @@ -29,23 +30,84 @@ static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
>   	return container_of(mmu, struct msm_iommu_pagetable, base);
>   }
>   
> +/* based on iommu_pgsize() in iommu.c: */
> +static size_t calc_pgsize(struct msm_iommu_pagetable *pagetable,
> +			   unsigned long iova, phys_addr_t paddr,
> +			   size_t size, size_t *count)
> +{
> +	unsigned int pgsize_idx, pgsize_idx_next;
> +	unsigned long pgsizes;
> +	size_t offset, pgsize, pgsize_next;
> +	unsigned long addr_merge = paddr | iova;
> +
> +	/* Page sizes supported by the hardware and small enough for @size */
> +	pgsizes = pagetable->pgsize_bitmap & GENMASK(__fls(size), 0);
> +
> +	/* Constrain the page sizes further based on the maximum alignment */
> +	if (likely(addr_merge))
> +		pgsizes &= GENMASK(__ffs(addr_merge), 0);
> +
> +	/* Make sure we have at least one suitable page size */
> +	BUG_ON(!pgsizes);
> +
> +	/* Pick the biggest page size remaining */
> +	pgsize_idx = __fls(pgsizes);
> +	pgsize = BIT(pgsize_idx);
> +	if (!count)
> +		return pgsize;
> +
> +	/* Find the next biggest support page size, if it exists */
> +	pgsizes = pagetable->pgsize_bitmap & ~GENMASK(pgsize_idx, 0);
> +	if (!pgsizes)
> +		goto out_set_count;
> +
> +	pgsize_idx_next = __ffs(pgsizes);
> +	pgsize_next = BIT(pgsize_idx_next);
> +
> +	/*
> +	 * There's no point trying a bigger page size unless the virtual
> +	 * and physical addresses are similarly offset within the larger page.
> +	 */
> +	if ((iova ^ paddr) & (pgsize_next - 1))
> +		goto out_set_count;
> +
> +	/* Calculate the offset to the next page size alignment boundary */
> +	offset = pgsize_next - (addr_merge & (pgsize_next - 1));
> +
> +	/*
> +	 * If size is big enough to accommodate the larger page, reduce
> +	 * the number of smaller pages.
> +	 */
> +	if (offset + pgsize_next <= size)
> +		size = offset;
> +
> +out_set_count:
> +	*count = size >> pgsize_idx;
> +	return pgsize;
> +}
> +
Can we keep this in iommu driver? Seems useful to other drivers too.  
Perhaps implement an sg friendly version of iopgtble ops, like 
unmap_sg() maybe!

-Akhil.
>   static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
>   		size_t size)
>   {
>   	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
>   	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> -	size_t unmapped = 0;
>   
> -	/* Unmap the block one page at a time */
>   	while (size) {
> -		unmapped += ops->unmap(ops, iova, 4096, NULL);
> -		iova += 4096;
> -		size -= 4096;
> +		size_t unmapped, pgsize, count;
> +
> +		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
> +
> +		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
> +		if (!unmapped)
> +			break;
> +
> +		iova += unmapped;
> +		size -= unmapped;
>   	}
>   
>   	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
>   
> -	return (unmapped == size) ? 0 : -EINVAL;
> +	return (size == 0) ? 0 : -EINVAL;
>   }
>   
>   static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> @@ -54,7 +116,6 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
>   	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
>   	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
>   	struct scatterlist *sg;
> -	size_t mapped = 0;
>   	u64 addr = iova;
>   	unsigned int i;
>   
> @@ -62,17 +123,26 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
>   		size_t size = sg->length;
>   		phys_addr_t phys = sg_phys(sg);
>   
> -		/* Map the block one page at a time */
>   		while (size) {
> -			if (ops->map(ops, addr, phys, 4096, prot, GFP_KERNEL)) {
> -				msm_iommu_pagetable_unmap(mmu, iova, mapped);
> +			size_t pgsize, count, mapped = 0;
> +			int ret;
> +
> +			pgsize = calc_pgsize(pagetable, addr, phys, size, &count);
> +
> +			ret = ops->map_pages(ops, addr, phys, pgsize, count,
> +					     prot, GFP_KERNEL, &mapped);
> +
> +			/* map_pages could fail after mapping some of the pages,
> +			 * so update the counters before error handling.
> +			 */
> +			phys += mapped;
> +			addr += mapped;
> +			size -= mapped;
> +
> +			if (ret) {
> +				msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
>   				return -EINVAL;
>   			}
> -
> -			phys += 4096;
> -			addr += 4096;
> -			size -= 4096;
> -			mapped += 4096;
>   		}
>   	}
>   
> @@ -207,6 +277,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>   
>   	/* Needed later for TLB flush */
>   	pagetable->parent = parent;
> +	pagetable->pgsize_bitmap = ttbr0_cfg.pgsize_bitmap;
>   	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
>   
>   	/*

