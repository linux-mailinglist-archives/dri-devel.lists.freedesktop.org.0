Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C65C87914
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6488510E0BE;
	Wed, 26 Nov 2025 00:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="W+AKvPIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053510E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 00:18:44 +0000 (UTC)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APKA97n1087396; Tue, 25 Nov 2025 16:18:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=qGBFfom64ubwAcHLmi0kGY4idgptPgMMsGDiFpmxSnI=; b=W+AKvPIcq+Gs
 i3tYYc6MNSXntK0NmrX6mDMiJh2f1He+waI1tJUFw9eep8toqFOiXcXgv1d9N8HG
 PGdbn6/fGl6qS46R20vtpCyrMHLj0wH4JK9pXWvIXkrNgijhiczlYtlomrwOthSj
 zml1ieuFYLYIUzuWZ91PR3D7DWCyaUSc0LCurvPCQxAzzat402xRMP4oyeWdz0ty
 1EYyma4UMfnDB7SWN7UNyv49rng7qo94JM/vlLrbdULgh6NjCeHD1lakMZtk49rg
 EGdIyMsuzoL8EN2ERVeIEmaZ0+aXHHcjPKQINfA5NEORkyA0TfReyUgtpSsOkjBL
 M3cSvkYsxQ==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ank8qsk46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 Nov 2025 16:18:10 -0800 (PST)
Received: from devgpu015.cco6.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 00:18:08 +0000
Date: Tue, 25 Nov 2025 16:18:03 -0800
From: Alex Mastro <amastro@fb.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Alex
 Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
X-Originating-IP: [2620:10d:c085:108::4]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMCBTYWx0ZWRfX4aU+4yoxvGRI
 fn5uIgo4phoyJLcsXRpkIiEbPHjmDvXjee+0hL5hZTnMf7KiIbVFpuPgNNxmzJnPoXlqYrYFVCb
 EPyFD9HoNuq9bFWOWGD9jm+tH6jYX1bWvVVFfP7wmtxUCfM6nyWp9RhEW4F3WyT2gvOl06d0Lit
 II5EZrklZ4kZ6ZccZ6uI5fnA2fhf1sXF7BU/xkJ1DrQkkrbuth2BkU2ET85sZ92FJE5mmeSgTwT
 8QOBncjhE4/DUMlusLJDyljY4I1YOkD69BDnY6LZhPAqbK1Ws3OXJ/OhGSqPOvK63g6mktQG9A/
 4TjZvhvYG6pYNypXlNsc0JrFDrM/97nZlDYVEtn7wlUXLxFDOXnHdS+vQBslO6M76Dlb+/Whxi6
 97TQYdVHP7oL0xprhG3cL4XfcOc0nA==
X-Proofpoint-ORIG-GUID: 5DCeEKEPh0Lq0c0QeLIVINEpDK6-Nmfl
X-Proofpoint-GUID: 5DCeEKEPh0Lq0c0QeLIVINEpDK6-Nmfl
X-Authority-Analysis: v=2.4 cv=VfT6/Vp9 c=1 sm=1 tr=0 ts=69264742 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=3j4BkbkPAAAA:8 a=qThf3vN7FU90BnacfoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
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

On Thu, Nov 20, 2025 at 11:28:25AM +0200, Leon Romanovsky wrote:
> +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> +					 dma_addr_t addr)
> +{
> +	unsigned int len, nents;
> +	int i;
> +
> +	nents = DIV_ROUND_UP(length, UINT_MAX);
> +	for (i = 0; i < nents; i++) {
> +		len = min_t(size_t, length, UINT_MAX);
> +		length -= len;
> +		/*
> +		 * DMABUF abuses scatterlist to create a scatterlist
> +		 * that does not have any CPU list, only the DMA list.
> +		 * Always set the page related values to NULL to ensure
> +		 * importers can't use it. The phys_addr based DMA API
> +		 * does not require the CPU list for mapping or unmapping.
> +		 */
> +		sg_set_page(sgl, NULL, 0, 0);
> +		sg_dma_address(sgl) = addr + i * UINT_MAX;

(i * UINT_MAX) happens in 32-bit before being promoted to dma_addr_t for
addition with addr. Overflows for i >=2 when length >= 8 GiB. Needs a cast:

		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;

Discovered this while debugging why dma-buf import was failing for
an 8 GiB dma-buf using my earlier toy program [1]. It was surfaced by
ib_umem_find_best_pgsz() returning 0 due to malformed scatterlist, which bubbles
up as an EINVAL.

$ ./test_dmabuf 0000:05:00.0 3 4 0 0x200000000
opening 0000:05:00.0 via /dev/vfio/56
allocating dma_buf bar_idx=4, bar_offset=0x0, size=0x200000000
allocated dma_buf fd=6
discovered 4 ibv devices: mlx5_0 mlx5_1 mlx5_2 mlx5_3
opened ibv device 3: mlx5_3
test_dmabuf.c:154 Condition failed: 'mr' (errno=22: Invalid argument)

$ sudo retsnoop -e mlx5_ib_reg_user_mr_dmabuf -a 'mlx5*' -a 'ib_umem*' -a '*umr*' -a 'vfio_pci*' -a 'dma_buf_*' -x EINVAL -T
Receiving data...
13:56:22.257907 -> 13:56:22.258275 TID/PID 948895/948895 (test_dmabuf/test_dmabuf):
FUNCTION CALLS                                 RESULT                 DURATION
--------------------------------------------   --------------------  ---------
→ mlx5_ib_reg_user_mr_dmabuf
    ↔ mlx5r_umr_resource_init                  [0]                     2.224us
    → ib_umem_dmabuf_get
        → ib_umem_dmabuf_get_with_dma_device
            ↔ dma_buf_get                      [0xff11012a6a098c00]    0.972us
            → dma_buf_dynamic_attach
                ↔ vfio_pci_dma_buf_attach      [0]                     2.003us
            ← dma_buf_dynamic_attach           [0xff1100012793e400]   10.566us
        ← ib_umem_dmabuf_get_with_dma_device   [0xff110127a6c74480]   15.794us
    ← ib_umem_dmabuf_get                       [0xff110127a6c74480]   25.258us
    → mlx5_ib_init_dmabuf_mr
        → ib_umem_dmabuf_map_pages
            → dma_buf_map_attachment
                → vfio_pci_dma_buf_map
                    ↔ dma_buf_map              [0xff1100012977f700]    4.918us
                ← vfio_pci_dma_buf_map         [0xff1100012977f700]    8.362us
            ← dma_buf_map_attachment           [0xff1100012977f700]   10.956us
        ← ib_umem_dmabuf_map_pages             [0]                    17.336us
        ↔ ib_umem_find_best_pgsz               [0]                     6.280us
        → ib_umem_dmabuf_unmap_pages
            → dma_buf_unmap_attachment
                → vfio_pci_dma_buf_unmap
                    ↔ dma_buf_unmap            [void]                  2.023us
                ← vfio_pci_dma_buf_unmap       [void]                  6.700us
            ← dma_buf_unmap_attachment         [void]                  8.142us
        ← ib_umem_dmabuf_unmap_pages           [void]                 14.953us
    ← mlx5_ib_init_dmabuf_mr                   [-EINVAL]              67.272us
    → mlx5r_umr_revoke_mr
        → mlx5r_umr_post_send_wait
            → mlx5r_umr_post_send
                ↔ mlx5r_begin_wqe              [0]                     1.703us
                ↔ mlx5r_finish_wqe             [void]                  1.633us
                ↔ mlx5r_ring_db                [void]                  1.312us
            ← mlx5r_umr_post_send              [0]                    27.451us
        ← mlx5r_umr_post_send_wait             [0]                   126.541us
    ← mlx5r_umr_revoke_mr                      [0]                   141.925us
    → ib_umem_release
        → ib_umem_dmabuf_release
            ↔ ib_umem_dmabuf_revoke            [void]                  1.582us
            ↔ dma_buf_detach                   [void]                  3.765us
            ↔ dma_buf_put                      [void]                  0.531us
        ← ib_umem_dmabuf_release               [void]                 23.315us
    ← ib_umem_release                          [void]                 40.301us
← mlx5_ib_reg_user_mr_dmabuf                   [-EINVAL]             363.280us

[1] https://lore.kernel.org/all/aQkLcAxEn4qmF3c4@devgpu015.cco6.facebook.com/

Alex
