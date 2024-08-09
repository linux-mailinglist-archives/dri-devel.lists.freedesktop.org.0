Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7B94D43F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6642D10E982;
	Fri,  9 Aug 2024 16:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="owZaomkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E8A10E980
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 16:11:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479ANXdc016248;
 Fri, 9 Aug 2024 16:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VCwmsqix3nUgjgKlv7BML5mtQPoVtynPUNxwFzPOSQ4=; b=owZaomkx5nblvY8L
 JNTA3WZlXFQK/MKbYTNI1KTl0KhpVRu9r4r2v72/gS3M+Nm8bMeTSuaeGRhYN7J5
 4BCe0ZqUWwpiqM23fu/ncOiKALdWIqo4Np6zfSoADA9MBQRr00uBesjgHe5zfSlO
 e0qDip/Cu5KFuIxB3w9LRNVQ2dXo7T/jWUOLoA4kL/qxSGyNYyDT20D2SI98icPM
 DMViRBw3iieigpFRke9W7YktS4rGQ/c7YmjY/FjRVC3w/2hx2E2Vi21/8r86rbXd
 NoE74sXliZ95lz21dNE0DIY0F6RT5AZy69gAUx1p4bDAB725xxcpRRb3dj45Sn/8
 DbNarw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vue3v9mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 16:11:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479GBike026757
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Aug 2024 16:11:44 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 09:11:43 -0700
Message-ID: <f5e9f517-77b8-998d-9bf7-d9bf4ee2fbb8@quicinc.com>
Date: Fri, 9 Aug 2024 10:11:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-2-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240805173959.3181199-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K-vjbWr7QOwYIErPq581wiJeMhsfttkQ
X-Proofpoint-ORIG-GUID: K-vjbWr7QOwYIErPq581wiJeMhsfttkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090117
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

On 8/5/2024 11:39 AM, Lizhi Hou wrote:
> AMD AI Engine forms the core of AMD NPU and can be used for accelerating
> machine learning applications.
> 
> Add the driver to support AI Engine integrated to AMD CPU.
> Only very basic functionalities are added.
>    - module and PCI device initialization
>    - firmware load
>    - power up
>    - low level hardware initialization
> 
> Co-developed-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
> Signed-off-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
> Co-developed-by: George Yang <George.Yang@amd.com>
> Signed-off-by: George Yang <George.Yang@amd.com>
> Co-developed-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   MAINTAINERS                             |   8 ++
>   drivers/accel/Kconfig                   |   1 +
>   drivers/accel/Makefile                  |   1 +
>   drivers/accel/amdxdna/Kconfig           |  15 ++
>   drivers/accel/amdxdna/Makefile          |  14 ++
>   drivers/accel/amdxdna/TODO              |   4 +
>   drivers/accel/amdxdna/aie2_pci.c        | 182 ++++++++++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h        | 144 +++++++++++++++++++
>   drivers/accel/amdxdna/aie2_psp.c        | 137 ++++++++++++++++++
>   drivers/accel/amdxdna/aie2_smu.c        | 112 +++++++++++++++
>   drivers/accel/amdxdna/amdxdna_drm.c     |  20 +++
>   drivers/accel/amdxdna/amdxdna_drm.h     |  65 +++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 118 +++++++++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  31 ++++
>   drivers/accel/amdxdna/amdxdna_sysfs.c   |  47 ++++++
>   drivers/accel/amdxdna/npu1_regs.c       |  94 ++++++++++++
>   drivers/accel/amdxdna/npu2_regs.c       | 111 +++++++++++++++
>   drivers/accel/amdxdna/npu4_regs.c       | 111 +++++++++++++++
>   drivers/accel/amdxdna/npu5_regs.c       | 111 +++++++++++++++
>   include/uapi/drm/amdxdna_accel.h        |  27 ++++
>   20 files changed, 1353 insertions(+)
>   create mode 100644 drivers/accel/amdxdna/Kconfig
>   create mode 100644 drivers/accel/amdxdna/Makefile
>   create mode 100644 drivers/accel/amdxdna/TODO
>   create mode 100644 drivers/accel/amdxdna/aie2_pci.c
>   create mode 100644 drivers/accel/amdxdna/aie2_pci.h
>   create mode 100644 drivers/accel/amdxdna/aie2_psp.c
>   create mode 100644 drivers/accel/amdxdna/aie2_smu.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
>   create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
>   create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
>   create mode 100644 drivers/accel/amdxdna/npu1_regs.c
>   create mode 100644 drivers/accel/amdxdna/npu2_regs.c
>   create mode 100644 drivers/accel/amdxdna/npu4_regs.c
>   create mode 100644 drivers/accel/amdxdna/npu5_regs.c
>   create mode 100644 include/uapi/drm/amdxdna_accel.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36d66b141352..3d2b9f1f1a07 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1146,6 +1146,14 @@ M:	Sanjay R Mehta <sanju.mehta@amd.com>
>   S:	Maintained
>   F:	drivers/spi/spi-amd.c
>   
> +AMD XDNA DRIVER
> +M:	Min Ma <min.ma@amd.com>
> +M:	Lizhi Hou <lizhi.hou@amd.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +F:	drivers/accel/amdxdna

Trailing "/"?

> +F:	include/uapi/drm/amdxdna_accel.h

T: ?

> +
>   AMD XGBE DRIVER
>   M:	"Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
>   L:	netdev@vger.kernel.org

> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> new file mode 100644
> index 000000000000..3660967c00e6
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/amd-iommu.h>
> +#include <linux/errno.h>
> +#include <linux/firmware.h>
> +#include <linux/iommu.h>

You are clearly missing linux/pci.h and I suspect many more.

> +
> +#include "aie2_pci.h"
> +
> +static void aie2_hw_stop(struct amdxdna_dev *xdna)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> +	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
> +
> +	aie2_psp_stop(ndev->psp_hdl);
> +	aie2_smu_fini(ndev);
> +	pci_clear_master(pdev);
> +	pci_disable_device(pdev);

pci_clear_master() is redundant with pci_disable_device(), no?

> +}
> +
> +static int aie2_hw_start(struct amdxdna_dev *xdna)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> +	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
> +	int ret;
> +
> +	ret = pci_enable_device(pdev);
> +	if (ret) {
> +		XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
> +		return ret;
> +	}
> +	pci_set_master(pdev);
> +
> +	ret = aie2_smu_init(ndev);
> +	if (ret) {
> +		XDNA_ERR(xdna, "failed to init smu, ret %d", ret);
> +		goto disable_dev;
> +	}
> +
> +	ret = aie2_psp_start(ndev->psp_hdl);
> +	if (ret) {
> +		XDNA_ERR(xdna, "failed to start psp, ret %d", ret);
> +		goto fini_smu;
> +	}
> +
> +	return 0;
> +
> +fini_smu:
> +	aie2_smu_fini(ndev);
> +disable_dev:
> +	pci_disable_device(pdev);
> +	pci_clear_master(pdev);

Again, clear_master appears redundant

> +
> +	return ret;
> +}
> +
> +static int aie2_init(struct amdxdna_dev *xdna)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> +	struct amdxdna_dev_hdl *ndev;
> +	struct psp_config psp_conf;
> +	const struct firmware *fw;
> +	void __iomem * const *tbl;

Is there an extra "*" here?

> +	int i, bars, nvec, ret;
> +
> +	ndev = devm_kzalloc(&pdev->dev, sizeof(*ndev), GFP_KERNEL);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->priv = xdna->dev_info->dev_priv;
> +	ndev->xdna = xdna;
> +
> +	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
> +	if (ret) {
> +		XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
> +			 ndev->priv->fw_path, ret);
> +		return ret;
> +	}
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		XDNA_ERR(xdna, "pcim enable device failed, ret %d", ret);
> +		goto release_fw;
> +	}
> +
> +	bars = pci_select_bars(pdev, IORESOURCE_MEM);
> +	for (i = 0; i < PSP_MAX_REGS; i++) {
> +		if (!(BIT(PSP_REG_BAR(ndev, i)) && bars)) {
> +			XDNA_ERR(xdna, "does not get pci bar%d",
> +				 PSP_REG_BAR(ndev, i));
> +			ret = -EINVAL;
> +			goto release_fw;
> +		}
> +	}
> +
> +	ret = pcim_iomap_regions(pdev, bars, "amdxdna-npu");
> +	if (ret) {
> +		XDNA_ERR(xdna, "map regions failed, ret %d", ret);
> +		goto release_fw;
> +	}
> +
> +	tbl = pcim_iomap_table(pdev);
> +	if (!tbl) {
> +		XDNA_ERR(xdna, "Cannot get iomap table");
> +		ret = -ENOMEM;
> +		goto release_fw;
> +	}
> +	ndev->sram_base = tbl[xdna->dev_info->sram_bar];
> +	ndev->smu_base = tbl[xdna->dev_info->smu_bar];

Doesn't this throw a sparse error from directly accessing memory marked 
iomem?

> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	if (ret) {
> +		XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
> +		goto release_fw;
> +	}
> +
> +	nvec = pci_msix_vec_count(pdev);

This feels weird.  Can your device advertise variable number of MSI-X 
vectors?  It only works if all of the vectors are used?

> +	if (nvec <= 0) {
> +		XDNA_ERR(xdna, "does not get number of interrupt vector");
> +		ret = -EINVAL;
> +		goto release_fw;
> +	}
> +
> +	ret = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSIX);
> +	if (ret < 0) {
> +		XDNA_ERR(xdna, "failed to alloc irq vectors, ret %d", ret);
> +		goto release_fw;
> +	}
> +
> +	ret = iommu_dev_enable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Enable PASID failed, ret %d", ret);
> +		goto free_irq;
> +	}
> +
> +	psp_conf.fw_size = fw->size;
> +	psp_conf.fw_buf = fw->data;
> +	for (i = 0; i < PSP_MAX_REGS; i++)
> +		psp_conf.psp_regs[i] = tbl[PSP_REG_BAR(ndev, i)] + PSP_REG_OFF(ndev, i);
> +	ndev->psp_hdl = aie2m_psp_create(&pdev->dev, &psp_conf);
> +	if (!ndev->psp_hdl) {
> +		XDNA_ERR(xdna, "failed to create psp");
> +		ret = -ENOMEM;
> +		goto disable_sva;
> +	}
> +	xdna->dev_handle = ndev;
> +
> +	ret = aie2_hw_start(xdna);
> +	if (ret) {
> +		XDNA_ERR(xdna, "start npu failed, ret %d", ret);
> +		goto disable_sva;
> +	}
> +
> +	release_firmware(fw);
> +	return 0;
> +
> +disable_sva:
> +	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
> +free_irq:
> +	pci_free_irq_vectors(pdev);
> +release_fw:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
> +static void aie2_fini(struct amdxdna_dev *xdna)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> +
> +	aie2_hw_stop(xdna);
> +	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
> +	pci_free_irq_vectors(pdev);
> +}
> +
> +const struct amdxdna_dev_ops aie2_ops = {
> +	.init           = aie2_init,
> +	.fini           = aie2_fini,
> +};
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> new file mode 100644
> index 000000000000..984bf65b7a2b
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AIE2_PCI_H_
> +#define _AIE2_PCI_H_
> +
> +#include <linux/device.h>
> +#include <linux/iopoll.h>
> +#include <linux/io.h>
> +
> +#include "amdxdna_pci_drv.h"
> +
> +#define AIE2_INTERVAL	20000	/* us */
> +#define AIE2_TIMEOUT	1000000	/* us */
> +
> +/* Firmware determines device memory base address and size */
> +#define AIE2_DEVM_BASE	0x4000000
> +#define AIE2_DEVM_SIZE	(48 * 1024 * 1024)

I'd expect to see some SZ_ macros used here

> +
> +#define NDEV2PDEV(ndev) \
> +	(to_pci_dev((ndev)->xdna->ddev.dev))
> +
> +#define AIE2_SRAM_OFF(ndev, addr) \
> +	((addr) - (ndev)->priv->sram_dev_addr)
> +#define AIE2_MBOX_OFF(ndev, addr) \
> +	((addr) - (ndev)->priv->mbox_dev_addr)
> +
> +#define PSP_REG_BAR(ndev, idx) \
> +	((ndev)->priv->psp_regs_off[(idx)].bar_idx)
> +#define PSP_REG_OFF(ndev, idx) \
> +	((ndev)->priv->psp_regs_off[(idx)].offset)
> +#define SRAM_REG_OFF(ndev, idx) \
> +	((ndev)->priv->sram_offs[(idx)].offset)

Really looks like these 6 macros can all fit on a single line, why split 
them up?

> +
> +#define SMU_REG(ndev, idx) \
> +({ \
> +	typeof(ndev) _ndev = ndev; \
> +	((_ndev)->smu_base + (_ndev)->priv->smu_regs_off[(idx)].offset); \
> +})
> +#define SRAM_GET_ADDR(ndev, idx) \
> +({ \
> +	typeof(ndev) _ndev = ndev; \
> +	((_ndev)->sram_base + SRAM_REG_OFF((_ndev), (idx))); \
> +})
> +
> +#define SMU_MPNPUCLK_FREQ_MAX(ndev) \
> +	((ndev)->priv->smu_mpnpuclk_freq_max)
> +#define SMU_HCLK_FREQ_MAX(ndev) \
> +	((ndev)->priv->smu_hclk_freq_max)
> +
> +enum aie2_smu_reg_idx {
> +	SMU_CMD_REG = 0,
> +	SMU_ARG_REG,
> +	SMU_INTR_REG,
> +	SMU_RESP_REG,
> +	SMU_OUT_REG,
> +	SMU_MAX_REGS /* Kepp this at the end */

"keep"

> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
> new file mode 100644
> index 000000000000..c24207c252a1
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/firmware.h>
> +#include <linux/iopoll.h>
> +#include <linux/slab.h>
> +#include "aie2_pci.h"
> +
> +#define PSP_STATUS_READY	BIT(31)
> +
> +/* PSP commands */
> +#define PSP_VALIDATE		1
> +#define PSP_START		2
> +#define PSP_RELEASE_TMR		3
> +
> +/* PSP special arguments */
> +#define PSP_START_COPY_FW	1
> +
> +/* PSP response error code */
> +#define PSP_ERROR_CANCEL	0xFFFF0002
> +#define PSP_ERROR_BAD_STATE	0xFFFF0007
> +
> +#define PSP_FW_ALIGN		0x10000
> +#define PSP_POLL_INTERVAL	20000	/* us */
> +#define PSP_POLL_TIMEOUT	1000000	/* us */
> +
> +#define PSP_REG(p, reg) \
> +	((p)->psp_regs[reg])

This is not valid with __iomem

> +struct psp_device *aie2m_psp_create(struct device *dev, struct psp_config *conf)
> +{
> +	struct psp_device *psp;
> +	u64 offset;
> +
> +	psp = devm_kzalloc(dev, sizeof(*psp), GFP_KERNEL);
> +	if (!psp)
> +		return NULL;
> +
> +	psp->dev = dev;
> +	memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
> +
> +	psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
> +	psp->fw_buffer = devm_kmalloc(psp->dev, psp->fw_buf_sz, GFP_KERNEL);

Feels like this (and a bunch of other instances I haven't commented on) 
should be drmm_* allocs.

> +	if (!psp->fw_buffer) {
> +		dev_err(psp->dev, "no memory for fw buffer");
> +		return NULL;
> +	}
> +
> +	psp->fw_paddr = virt_to_phys(psp->fw_buffer);

I'm pretty sure virt_to_phys() is always wrong

> +	offset = ALIGN(psp->fw_paddr, PSP_FW_ALIGN) - psp->fw_paddr;
> +	psp->fw_paddr += offset;
> +	memcpy(psp->fw_buffer + offset, conf->fw_buf, conf->fw_size);
> +
> +	return psp;
> +}
> diff --git a/drivers/accel/amdxdna/amdxdna_drm.c b/drivers/accel/amdxdna/amdxdna_drm.c
> new file mode 100644
> index 000000000000..91e4f9c9dac9
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_drm.c

What is the point of this file?  Seems like all of this could just be in 
amdxdna_pci_drv.c

> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_accel.h>
> +
> +#include "amdxdna_drm.h"
> +
> +DEFINE_DRM_ACCEL_FOPS(amdxdna_fops);
> +
> +const struct drm_driver amdxdna_drm_drv = {
> +	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> +	.fops = &amdxdna_fops,
> +	.name = "amdxdna_accel_driver",
> +	.desc = "AMD XDNA DRM implementation",
> +	.major = AMDXDNA_DRIVER_MAJOR,
> +	.minor = AMDXDNA_DRIVER_MINOR,

These are deprecated.  You should drop them

> +};
> diff --git a/drivers/accel/amdxdna/amdxdna_drm.h b/drivers/accel/amdxdna/amdxdna_drm.h
> new file mode 100644
> index 000000000000..2b18bcbdc23e
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_drm.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AMDXDNA_DRM_H_
> +#define _AMDXDNA_DRM_H_
> +
> +#include <drm/amdxdna_accel.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_file.h>
> +
> +#define XDNA_INFO(xdna, fmt, args...)	drm_info(&(xdna)->ddev, fmt, ##args)
> +#define XDNA_WARN(xdna, fmt, args...)	drm_warn(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
> +#define XDNA_ERR(xdna, fmt, args...)	drm_err(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
> +#define XDNA_DBG(xdna, fmt, args...)	drm_dbg(&(xdna)->ddev, fmt, ##args)
> +#define XDNA_INFO_ONCE(xdna, fmt, args...) drm_info_once(&(xdna)->ddev, fmt, ##args)
> +
> +#define to_xdna_dev(drm_dev) \
> +	((struct amdxdna_dev *)container_of(drm_dev, struct amdxdna_dev, ddev))
> +
> +extern const struct drm_driver amdxdna_drm_drv;
> +
> +struct amdxdna_dev;
> +
> +/*
> + * struct amdxdna_dev_ops - Device hardware operation callbacks
> + */
> +struct amdxdna_dev_ops {
> +	int (*init)(struct amdxdna_dev *xdna);
> +	void (*fini)(struct amdxdna_dev *xdna);
> +};
> +
> +/*
> + * struct amdxdna_dev_info - Device hardware information
> + * Record device static information, like reg, mbox, PSP, SMU bar index,

The last "," is weird

> + */
> +struct amdxdna_dev_info {
> +	int				reg_bar;
> +	int				mbox_bar;
> +	int				sram_bar;
> +	int				psp_bar;
> +	int				smu_bar;
> +	int				device_type;
> +	int				first_col;
> +	u32				dev_mem_buf_shift;
> +	u64				dev_mem_base;
> +	size_t				dev_mem_size;
> +	char				*vbnv;
> +	const struct amdxdna_dev_priv	*dev_priv;
> +	const struct amdxdna_dev_ops	*ops;
> +};
> +
> +struct amdxdna_dev {
> +	struct drm_device		ddev;
> +	struct amdxdna_dev_hdl		*dev_handle;
> +	const struct amdxdna_dev_info	*dev_info;
> +
> +	struct mutex			dev_lock; /* per device lock */
> +};
> +
> +#endif /* _AMDXDNA_DRM_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> new file mode 100644
> index 000000000000..7d0cfd918b0e
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/module.h>
> +
> +#include "amdxdna_pci_drv.h"
> +
> +/*
> + *  There are platforms which share the same PCI device ID
> + *  but have different PCI revision IDs. So, let the PCI class
> + *  determine the probe and later use the (device_id, rev_id)
> + *  pair as a key to select the devices.
> + */

Huh?  So, VID == AMD, DID == 0x17f0, rev == 0x1 is a completely 
different device?  That feels like a PCIe spec violation...

> +static const struct pci_device_id pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_ANY_ID),
> +		.class = PCI_CLASS_SP_OTHER << 8,

Weird.  I would have expected the Accelerator class to be used

> +		.class_mask = 0xFFFF00,
> +	},
> +	{0}
> +};
> +
> +MODULE_DEVICE_TABLE(pci, pci_ids);
> +
> +static const struct amdxdna_device_id amdxdna_ids[] = {
> +	{ 0x1502, 0x0,  &dev_npu1_info },
> +	{ 0x17f0, 0x0,  &dev_npu2_info },
> +	{ 0x17f0, 0x10, &dev_npu4_info },
> +	{ 0x17f0, 0x11, &dev_npu5_info },
> +	{0}
> +};
> +

> +module_pci_driver(amdxdna_pci_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
> +MODULE_VERSION("0.1");

This is redundant with the kernel version, no?  How are you going to 
have different module versions for the same kernel version?

> +MODULE_DESCRIPTION("amdxdna driver");
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> new file mode 100644
> index 000000000000..1b699464150e
> --- /dev/null
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _UAPI_AMDXDNA_ACCEL_H_
> +#define _UAPI_AMDXDNA_ACCEL_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define AMDXDNA_DRIVER_MAJOR	1
> +#define AMDXDNA_DRIVER_MINOR	0

Drop these.

> +
> +enum amdxdna_device_type {
> +	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
> +	AMDXDNA_DEV_TYPE_KMQ,
> +};
> +
> +#if defined(__cplusplus)
> +} /* extern c end */
> +#endif
> +
> +#endif /* _UAPI_AMDXDNA_ACCEL_H_ */

