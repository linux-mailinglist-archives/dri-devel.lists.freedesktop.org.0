Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E78FB3E2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E73010E488;
	Tue,  4 Jun 2024 13:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KmVmPJq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FE510E488
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:34:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4549Z73C016553;
 Tue, 4 Jun 2024 13:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0jLLALqVjeVkMMFDpHFOvuM2e8qb7uiNDJQSP8rJQr4=; b=KmVmPJq2ve0blTRm
 li6vKgX3qkuUC0EKIW5Qe/KSGd3cJ0duLDkUXaWmDkkv01koWULxZ7jm4Zqep0oV
 NxtlHoFB0bcmL9uBS82+4d1De8oRKkGfYDnkBAZJ2R+EF9nRPKiaWmFM7FBy16YF
 8kbFGeLNd+adz7EBPh3ekdJDJTuIXbVq685j/k0jVJqcoLBThoBU5/opdW/JNshD
 9gDvFw+n+ObaJt+LbsOkgJvASUjdVnSqciR4nOpeev1PsEHkOxTyILFMwX17AdJM
 rveoBzf8N8E5vcntVHxnaf3LZH3kbv0XDHgsZN5vusFQvoxrRNv4zpRQRzRVVElW
 fIkG0g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw59pkkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jun 2024 13:34:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454DYejQ013553
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Jun 2024 13:34:40 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 06:34:40 -0700
Message-ID: <fef1ab0d-2454-4c8f-8057-b43e6fed7072@quicinc.com>
Date: Tue, 4 Jun 2024 06:34:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] wifi: ath11k: Use iommu_paging_domain_alloc()
Content-Language: en-US
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
CC: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Alex
 Williamson <alex.williamson@redhat.com>, <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, <iommu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-13-baolu.lu@linux.intel.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240604015134.164206-13-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2pYV50EsBSx6DhkRfDuE1hUfut1Z7Ulg
X-Proofpoint-ORIG-GUID: 2pYV50EsBSx6DhkRfDuE1hUfut1Z7Ulg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_05,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040108
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

On 6/3/24 18:51, Lu Baolu wrote:
> An iommu domain is allocated in ath11k_ahb_fw_resources_init() and is
> attached to ab_ahb->fw.dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/ahb.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index ca0f17ddebba..a469647719f9 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1001,10 +1001,10 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>   
>   	ab_ahb->fw.dev = &pdev->dev;
>   
> -	iommu_dom = iommu_domain_alloc(&platform_bus_type);
> -	if (!iommu_dom) {
> +	iommu_dom = iommu_paging_domain_alloc(ab_ahb->fw.dev);
> +	if (IS_ERR(iommu_dom)) {
>   		ath11k_err(ab, "failed to allocate iommu domain\n");
> -		ret = -ENOMEM;
> +		ret = PTR_ERR(iommu_dom);
>   		goto err_unregister;
>   	}
>   

