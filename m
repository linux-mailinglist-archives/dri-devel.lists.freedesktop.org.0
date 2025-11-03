Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA8C2E5C1
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 00:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C7410E4D6;
	Mon,  3 Nov 2025 23:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="Y5TYvio2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E401110E47C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 20:07:46 +0000 (UTC)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A3HSUl13368916; Mon, 3 Nov 2025 12:07:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=s2048-2025-q2; bh=n9Hp+W96E82ffeM9TGY/
 T64q12eMoTlbRaWkBHrOVhQ=; b=Y5TYvio2wy42a6OuNV1jizo/aQU5rL6HohWI
 OdRswHnuwgKDGg4PRZorsSwOwSWNepxL3lv6e92F0ZZiEQOO8ZMDqwElBWya7VYx
 yHZJ1Bg/rdGSvGKN1xCect7aLk4BJP3dFq0W4bRU4thNy47l/7qf6QCLDdrJWuYT
 ttchffm5fJ8azlwk2GD5NtPH33FSvCNhfhPKLPVh0Qs6M/RaBFY1LsIhyFIHXKOv
 PPwMbL4I1eFF62/08bb33eCUiaTLoRka7NFBHCCzuXtuZDc3HhRZW8A7Jd4FsCBj
 aU36aw88WsqWA0jpB+Nf9LOBQRQOfcCvornGVmHGoYNGSzpsQw==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4a6yfe2849-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 03 Nov 2025 12:07:21 -0800 (PST)
Received: from devgpu015.cco6.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Mon, 3 Nov 2025 20:07:19 +0000
Date: Mon, 3 Nov 2025 12:07:12 -0800
From: Alex Mastro <amastro@fb.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin
 Tian <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs
 <mochs@nvidia.com>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <aQkLcAxEn4qmF3c4@devgpu015.cco6.facebook.com>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Authority-Analysis: v=2.4 cv=G9QR0tk5 c=1 sm=1 tr=0 ts=69090b79 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FOH2dFAWAAAA:8 a=b_Saz7MSmFOFN_6dvx4A:9 a=CjuIK1q_8ugA:10
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: F1nk6hmysPbKhKVQa_mqqIFKqOIt2lHM
X-Proofpoint-GUID: F1nk6hmysPbKhKVQa_mqqIFKqOIt2lHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE3OSBTYWx0ZWRfX6SW28Xvycs0O
 YOKukhqpHcTfkYNeGRk02UVQnYAieNl0FPP5nyOoQsMjQfkPKcUonaa3EWc/tqdoAAQyhyOyp0d
 /JHwcN3QLYQ/+EZJhZ2InHvQ5+q0ThEzTdyBEGsfGK6Opxy38U0CpsznUzKLwU/5Eqh1l493VDE
 PyTsfwJm0au//MmeaXH4NXKBaJs6mnL334sMoj6rtJQYWDX5DKMNRtgxvcMAQid95nsgniy4DYE
 +umaq/vNBvV3b0K6HXe0s/cT+YOR8m2DkpctVf5zXXorytYnhbn1vV3nGRWxaQ24cLeCzQnNSqB
 UmVF2ZqiQwbE9Yb71RMC4EJcfgbsbmodipz9oljstvRLhQ7lzspcSOdC0w5Z4QcLNUWGre4urgV
 ZaziQQl4T7tsVkAKgmifB2A8A6gzCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_04,2025-11-03_03,2025-10-01_01
X-Mailman-Approved-At: Mon, 03 Nov 2025 23:03:10 +0000
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

On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:
> Changelog:
> v6:
>  * Fixed wrong error check from pcim_p2pdma_init().
>  * Documented pcim_p2pdma_provider() function.
>  * Improved commit messages.
>  * Added VFIO DMA-BUF selftest.
>  * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_dma_buf.
>  * Fixed error unwind when dma_buf_fd() fails.
>  * Document latest changes to p2pmem.
>  * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.
>  * Moved DMA mapping logic to DMA-BUF.
>  * Removed types patch to avoid dependencies between subsystems.
>  * Moved vfio_pci_dma_buf_move() in err_undo block.
>  * Added nvgrace patch.

Thanks Leon. Attaching a toy program which sanity tests the dma-buf export UAPI
by feeding the allocated dma-buf into an dma-buf importer (libibverbs + CX-7).
 
Tested-by: Alex Mastro <amastro@fb.com>

$ cc -Og -Wall -Wextra $(pkg-config --cflags --libs libibverbs) test_dmabuf.c -o test_dmabuf
$ ./test_dmabuf 0000:05:00.0 3 4 0 0x1000
opening 0000:05:00.0 via /dev/vfio/56
allocating dma_buf bar_idx=4, bar_offset=0x0, size=0x1000
allocated dma_buf fd=6
discovered 4 ibv devices: mlx5_0 mlx5_1 mlx5_2 mlx5_3
opened ibv device 3: mlx5_3
registered dma_buf
unregistered dma_buf
closed dma_buf fd

---
#include <fcntl.h>
#include <infiniband/verbs.h>
#include <libgen.h>
#include <linux/limits.h>
#include <linux/types.h>
#include <linux/vfio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define ensure(cond)                                                             \
	do {                                                                     \
		if (!(cond)) {                                                   \
			fprintf(stderr,                                          \
				"%s:%d Condition failed: '%s' (errno=%d: %s)\n", \
				__FILE__, __LINE__, #cond, errno,                \
				strerror(errno));                                \
			exit(EXIT_FAILURE);                                      \
		}                                                                \
	} while (0)

#ifndef VFIO_DEVICE_FEATURE_DMA_BUF
#define VFIO_DEVICE_FEATURE_DMA_BUF 11

struct vfio_region_dma_range {
	__u64 offset;
	__u64 length;
};

struct vfio_device_feature_dma_buf {
	__u32 region_index;
	__u32 open_flags;
	__u32 flags;
	__u32 nr_ranges;
	struct vfio_region_dma_range dma_ranges[];
};
#endif

static uint32_t group_for_bdf(const char *bdf)
{
	char path[PATH_MAX];
	char link[PATH_MAX];
	int ret;

	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/iommu_group",
		 bdf);
	ret = readlink(path, link, sizeof(link));
	ensure(ret > 0);

	const char *filename = basename(link);
	ensure(filename);

	return strtoul(filename, NULL, 0);
}

int main(int argc, char **argv)
{
	int ret;

	if (argc != 6) {
		printf("usage: %s <vfio_bdf> <ibv_device_idx> <bar_idx> <bar_offset> <size>\n",
		       argv[0]);
		printf("example: %s 0000:05:00.0 3 2 0x20000 0x1000\n",
		       argv[0]);
		return 1;
	}

	const char *bdf = argv[1];
	uint32_t ibv_idx = strtoul(argv[2], NULL, 0);
	uint32_t bar_idx = strtoul(argv[3], NULL, 0);
	uint64_t bar_offs = strtoull(argv[4], NULL, 0);
	uint64_t dmabuf_len = strtoull(argv[5], NULL, 0);

	uint32_t group_num = group_for_bdf(bdf);
	char group_path[PATH_MAX];
	snprintf(group_path, sizeof(group_path), "/dev/vfio/%u", group_num);

	int container_fd = open("/dev/vfio/vfio", O_RDWR);
	ensure(container_fd >= 0);

	printf("opening %s via %s\n", bdf, group_path);
	int group_fd = open(group_path, O_RDWR);
	ensure(group_fd >= 0);

	ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container_fd);
	ensure(!ret);

	ret = ioctl(container_fd, VFIO_SET_IOMMU, VFIO_TYPE1v2_IOMMU);
	ensure(!ret);

	int device_fd = ioctl(group_fd, VFIO_GROUP_GET_DEVICE_FD, bdf);
	ensure(device_fd >= 0);

	uint8_t buf[sizeof(struct vfio_device_feature) +
		    sizeof(struct vfio_device_feature_dma_buf) +
		    sizeof(struct vfio_region_dma_range)]
		__attribute__((aligned(32)));

	struct vfio_device_feature *ft = (struct vfio_device_feature *)buf;
	*ft = (struct vfio_device_feature){
		.argsz = sizeof(buf),
		.flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_BUF,
	};

	struct vfio_device_feature_dma_buf *ft_dma_buf =
		(struct vfio_device_feature_dma_buf *)ft->data;
	*ft_dma_buf = (struct vfio_device_feature_dma_buf){
		.region_index = bar_idx,
		.open_flags = O_RDWR,
		.nr_ranges = 1,
	};

	ft_dma_buf->dma_ranges[0] = (struct vfio_region_dma_range){
		.length = dmabuf_len,
		.offset = bar_offs,
	};

	printf("allocating dma_buf bar_idx=%u, bar_offset=0x%lx, size=0x%lx\n",
	       bar_idx, bar_offs, dmabuf_len);
	int dmabuf_fd = ioctl(device_fd, VFIO_DEVICE_FEATURE, buf);
	ensure(dmabuf_fd >= 0);
	printf("allocated dma_buf fd=%d\n", dmabuf_fd);

	int num;
	struct ibv_device **devs = ibv_get_device_list(&num);
	ensure(devs && num > 0);
	printf("discovered %d ibv devices:", num);
	for (int i = 0; i < num; i++) {
		printf(" %s", ibv_get_device_name(devs[i]));
	}
	printf("\n");
	ensure(ibv_idx < (uint32_t)num);

	struct ibv_context *ctx = ibv_open_device(devs[ibv_idx]);
	ensure(ctx);
	printf("opened ibv device %d: %s\n", ibv_idx,
	       ibv_get_device_name(devs[ibv_idx]));

	struct ibv_pd *pd = ibv_alloc_pd(ctx);
	ensure(pd);

	uint64_t offset = 0;
	uint64_t iova = 0;
	int access = IBV_ACCESS_LOCAL_WRITE | IBV_ACCESS_REMOTE_READ |
		     IBV_ACCESS_REMOTE_WRITE;

	struct ibv_mr *mr = ibv_reg_dmabuf_mr(pd, offset, dmabuf_len, iova,
					      dmabuf_fd, access);
	ensure(mr);
	printf("registered dma_buf\n");

	ret = ibv_dereg_mr(mr);
	ensure(!ret);
	printf("unregistered dma_buf\n");

	ret = close(dmabuf_fd);
	ensure(!ret);
	printf("closed dma_buf fd\n");

	return 0;
}
---
