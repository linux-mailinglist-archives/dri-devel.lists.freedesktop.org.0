Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118E908FDF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B532E10EDCB;
	Fri, 14 Jun 2024 16:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="N8UMwKhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B28B10EDDA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:16:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EC9sac008273;
 Fri, 14 Jun 2024 16:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zTt7+YQQ2Pk2DAbxyPCzoJhqvIx0ktXqVVN0BIYO1uE=; b=N8UMwKhim6X3LKrd
 tpL2GD5Od+Ontw/hR91pptXWBb+2c+rKSuGDHORpJRzjLbSDFwK+B96i+U+Memo7
 QxyXXfN1F6995/cyacnfXJLvgDGmIm83GV4HdfE0TGX71tb+6sD8HKoj/PKEbdBV
 4E29iWkm509TB5P5jrkybeEB9UGDzDhj61gUCpYDhGh4uQW6Dx0HYb+uPgiMvV7n
 AcCQeyH/eSZFhpOrezhEQ92x5tjeuABrlSPcl8c3ovWGi1jBWp+A5INZioUjOrEV
 zirRP2JZZPscAs/npCiB+BvQ2qVC9+ypOQhjG4QKX7RTjPMGrM5Uz+w/Cxg0mIXX
 qjCZww==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q2a9ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 16:16:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45EGGas6020348
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 16:16:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 09:16:35 -0700
Message-ID: <8f93c724-3c86-c0f4-3a84-8a72817e684c@quicinc.com>
Date: Fri, 14 Jun 2024 10:16:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
Content-Language: en-US
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
CC: <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1m__RdTIPJBhTLZa62Iktl88QY5c9Bp8
X-Proofpoint-ORIG-GUID: 1m__RdTIPJBhTLZa62Iktl88QY5c9Bp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_13,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406140109
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

On 6/12/2024 7:52 AM, Tomeu Vizoso wrote:
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
> 
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
> 
> This commit adds just hardware initialization and power management.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   MAINTAINERS                             |    8 +
>   drivers/accel/Kconfig                   |    1 +
>   drivers/accel/Makefile                  |    1 +
>   drivers/accel/rocket/Kconfig            |   13 +
>   drivers/accel/rocket/Makefile           |    8 +
>   drivers/accel/rocket/rocket_core.c      |  149 ++
>   drivers/accel/rocket/rocket_core.h      |   32 +
>   drivers/accel/rocket/rocket_device.c    |   37 +
>   drivers/accel/rocket/rocket_device.h    |   38 +
>   drivers/accel/rocket/rocket_drv.c       |  221 ++
>   drivers/accel/rocket/rocket_drv.h       |   13 +
>   drivers/accel/rocket/rocket_registers.h | 4449 +++++++++++++++++++++++++++++++
>   include/uapi/drm/rocket_accel.h         |   19 +
>   13 files changed, 4989 insertions(+)

How about something in Documentation?

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aacccb376c28..5a42ee39e2e6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6731,6 +6731,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/accel/ivpu/
>   F:	include/uapi/drm/ivpu_accel.h
>   
> +DRM ACCEL DRIVER FOR ROCKCHIP NPU
> +M:	Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/accel/rocket/
> +F:	include/uapi/drm/rocket_accel.h
> +
>   DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
>   M:	Oded Gabbay <ogabbay@kernel.org>
>   L:	dri-devel@lists.freedesktop.org
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index 64065fb8922b..8f79eea29e29 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -27,5 +27,6 @@ menuconfig DRM_ACCEL
>   source "drivers/accel/habanalabs/Kconfig"
>   source "drivers/accel/ivpu/Kconfig"
>   source "drivers/accel/qaic/Kconfig"
> +source "drivers/accel/rocket/Kconfig"
>   
>   endif
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index ab3df932937f..117844f94fc9 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -3,3 +3,4 @@
>   obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>   obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>   obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
> new file mode 100644
> index 000000000000..d50eaabb42cb
> --- /dev/null
> +++ b/drivers/accel/rocket/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config DRM_ACCEL_ROCKET
> +       tristate "Rocket (DRM support for Rockchip NPUs)"
> +       depends on DRM
> +       depends on ARM64 || COMPILE_TEST
> +       depends on MMU
> +       select DRM_SCHED
> +       select IOMMU_SUPPORT
> +       select IOMMU_IO_PGTABLE_LPAE
> +       select DRM_GEM_SHMEM_HELPER
> +       help
> +         DRM driver for Rockchip NPUs.

This is way too short.  At a minimum what is the module called?

> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> new file mode 100644
> index 000000000000..73a7280d260c
> --- /dev/null
> +++ b/drivers/accel/rocket/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
> +
> +rocket-y := \
> +	rocket_core.o \
> +	rocket_device.o \
> +	rocket_drv.o
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
> new file mode 100644
> index 000000000000..d6680b00fb2f
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <asm-generic/delay.h>

Really? You need to go down into the asm specific headers?  That seems 
wrong.

> +#include <linux/err.h>
> +#include <linux/clk.h>

"c" comes before "e" in the English alphabet.

> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset.h>
> +
> +#include "rocket_core.h"
> +#include "rocket_device.h"
> +#include "rocket_registers.h"
> +
> +static int rocket_clk_init(struct rocket_core *core)
> +{
> +	struct rocket_device *rdev = core->dev;
> +	int err;
> +
> +	core->a_clk = devm_clk_get_enabled(rdev->dev, rdev->comp->clocks_a_names[core->index]);
> +	if (IS_ERR(core->a_clk)) {
> +		err = PTR_ERR(core->a_clk);
> +		dev_err(rdev->dev, "devm_clk_get_enabled failed %d for core %d\n", err, core->index);
> +		return err;
> +	}
> +
> +	core->h_clk = devm_clk_get_enabled(rdev->dev, rdev->comp->clocks_h_names[core->index]);
> +	if (IS_ERR(core->h_clk)) {
> +		err = PTR_ERR(core->h_clk);
> +		dev_err(rdev->dev, "devm_clk_get_enabled failed %d for core %d\n", err, core->index);
> +		clk_disable_unprepare(core->a_clk);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rocket_reset_init(struct rocket_core *core)
> +{
> +	struct rocket_device *rdev = core->dev;
> +	struct reset_control *a_reset = NULL;
> +	struct reset_control *h_reset = NULL;
> +
> +	a_reset = devm_reset_control_get(
> +		rdev->dev,
> +		rdev->comp->resets_a_names[core->index]);

This fits on one line, why break it up?

> +	if (IS_ERR(a_reset))
> +		return PTR_ERR(a_reset);
> +
> +	core->a_reset = a_reset;
> +
> +	h_reset = devm_reset_control_get(
> +		rdev->dev,
> +		rdev->comp->resets_h_names[core->index]);

Same comment.

> +	if (IS_ERR(h_reset))
> +		return PTR_ERR(h_reset);
> +
> +	core->h_reset = h_reset;
> +
> +	return 0;
> +}
> +
> +static int rocket_pmdomain_init(struct rocket_core *core)
> +{
> +	struct rocket_device *rdev = core->dev;
> +	const char *pm_domain_name = rdev->comp->pm_domain_names[core->index];

Seems a bit weird to break reverse christmas tree.

> +	int err = 0;
> +
> +	core->pm_domain = dev_pm_domain_attach_by_name(rdev->dev, pm_domain_name);
> +	if (IS_ERR_OR_NULL(core->pm_domain)) {
> +		err = PTR_ERR(core->pm_domain) ? : -ENODATA;
> +		core->pm_domain = NULL;
> +		dev_err(rdev->dev,
> +			"failed to get pm-domain %s(%d): %d\n",
> +			pm_domain_name, core->index, err);
> +		return err;
> +	}
> +
> +	core->pm_domain_link = device_link_add(rdev->dev,
> +			core->pm_domain,
> +			DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
> +	if (!core->pm_domain_link) {
> +		dev_err(core->pm_domain, "adding device link failed!\n");
> +		dev_pm_domain_detach(core->pm_domain, true);
> +		return -ENODEV;
> +	}
> +
> +	return err;
> +}
> +
> +static void rocket_pmdomain_fini(struct rocket_core *core)
> +{
> +	dev_pm_domain_detach(core->pm_domain, true);
> +}
> +
> +int rocket_core_init(struct rocket_core *core)
> +{
> +	struct rocket_device *rdev = core->dev;
> +	uint32_t version;
> +	int err = 0;
> +
> +	err = rocket_clk_init(core);
> +	if (err) {
> +		dev_err(rdev->dev, "clk init failed %d\n", err);
> +		return err;
> +	}
> +
> +	err = rocket_reset_init(core);
> +	if (err) {
> +		dev_err(rdev->dev, "reset init failed %d\n", err);
> +		return err;
> +	}
> +
> +	err = rocket_pmdomain_init(core);
> +	if (err < 0)
> +		return err;
> +
> +	core->iomem = devm_platform_ioremap_resource(rdev->pdev, core->index);
> +	if (IS_ERR(core->iomem)) {
> +		err = PTR_ERR(core->iomem);
> +		goto out_pm_domain;
> +	}
> +
> +	version = rocket_read(core, REG_PC_VERSION) + (rocket_read(core, REG_PC_VERSION_NUM) & 0xffff);
> +	dev_info(rdev->dev, "Rockchip NPU core %d version: %d\n", core->index, version);

A properly working driver should be silent by default.

> +
> +	return 0;
> +
> +out_pm_domain:
> +	rocket_pmdomain_fini(core);
> +	return err;
> +}
> +
> +void rocket_core_fini(struct rocket_core *core)
> +{
> +	rocket_pmdomain_fini(core);
> +}
> +
> +void rocket_core_reset(struct rocket_core *core)
> +{
> +	reset_control_assert(core->a_reset);
> +	reset_control_assert(core->h_reset);
> +
> +	udelay(10);

Why?

> +
> +	reset_control_deassert(core->a_reset);
> +	reset_control_deassert(core->h_reset);
> +}
> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
> new file mode 100644
> index 000000000000..e5d4c848c9f4
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_CORE_H__
> +#define __ROCKET_CORE_H__
> +
> +#include <linux/mutex_types.h>
> +#include <asm/io.h>
> +#include <asm-generic/io.h>

Again, asm specific includes?

> +#define rocket_read(core, reg) readl((core)->iomem + (reg))
> +#define rocket_write(core, reg, value) writel(value, (core)->iomem + (reg))
> +
> +struct rocket_core {
> +	struct rocket_device *dev;
> +	unsigned int index;
> +
> +	struct reset_control *a_reset;
> +	struct reset_control *h_reset;
> +	void __iomem *iomem;
> +	int irq;

What does pahole say about this?

> +	struct clk *a_clk;
> +	struct clk *h_clk;
> +	struct device *pm_domain;
> +	struct device_link *pm_domain_link;
> +};
> +
> +int rocket_core_init(struct rocket_core *core);
> +void rocket_core_fini(struct rocket_core *core);
> +void rocket_core_reset(struct rocket_core *core);
> +
> +#endif
> \ No newline at end of file
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> new file mode 100644
> index 000000000000..3bd23f22d06a
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "rocket_drv.h"
> +#include "rocket_device.h"
> +
> +int rocket_device_init(struct rocket_device *rdev)
> +{
> +	int core, err;
> +
> +	rdev->clk_npu = devm_clk_get_enabled(rdev->dev, "clk_npu");
> +	rdev->pclk = devm_clk_get_enabled(rdev->dev, "pclk");
> +
> +	for (core = 0; core < rdev->comp->num_cores; core++) {
> +		rdev->cores[core].dev = rdev;
> +		rdev->cores[core].index = core;
> +
> +		err = rocket_core_init(&rdev->cores[core]);
> +		if (err) {
> +			rocket_device_fini(rdev);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +void rocket_device_fini(struct rocket_device *rdev)
> +{
> +	int core;
> +
> +	for (core = 0; core < rdev->comp->num_cores; core++)
> +		rocket_core_fini(&rdev->cores[core]);
> +}
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> new file mode 100644
> index 000000000000..6765d944a2c8
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DEVICE_H__
> +#define __ROCKET_DEVICE_H__
> +
> +#include "rocket_core.h"
> +
> +#define MAX_NUM_CORES 3
> +
> +struct rocket_compatible {
> +	int num_cores;
> +	const char * const *resets_a_names;
> +	const char * const *resets_h_names;
> +	const char * const *clocks_a_names;
> +	const char * const *clocks_h_names;
> +	const char * const *pm_domain_names;
> +	const char * const *irq_names;
> +};
> +
> +struct rocket_device {
> +	struct device *dev;
> +	struct drm_device *ddev;
> +	struct platform_device *pdev;
> +
> +	const struct rocket_compatible *comp;
> +
> +	struct rocket_core cores[MAX_NUM_CORES];
> +
> +	struct clk *clk_npu;
> +	struct clk *pclk;
> +};
> +
> +int rocket_device_init(struct rocket_device *rdev);
> +void rocket_device_fini(struct rocket_device *rdev);
> +void rocket_device_reset(struct rocket_device *rdev);
> +
> +#endif
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> new file mode 100644
> index 000000000000..e339c337fcf9
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include "linux/clk.h"
> +#include "linux/dma-mapping.h"

Use of "" includes can't be right...

> +#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_accel.h>

Broken alphabetical order.

> +#include <drm/drm_gem.h>
> +
> +#include "rocket_drv.h"
> +#include "rocket_device.h"
> +
> +static const char * const rk3588_pm_domains[] = { "npu0", "npu1", "npu2" };
> +static const char * const rk3588_resets_a[] = { "srst_a0", "srst_a1", "srst_a2" };
> +static const char * const rk3588_resets_h[] = { "srst_h0", "srst_h1", "srst_h2" };
> +static const char * const rk3588_clocks_a[] = { "aclk0", "aclk1", "aclk2" };
> +static const char * const rk3588_clocks_h[] = { "hclk0", "hclk1", "hclk2" };
> +static const char * const rk3588_irqs[] = { "npu0_irq", "npu1_irq", "npu2_irq" };
> +static const struct rocket_compatible rk3588_data = {
> +	.num_cores = ARRAY_SIZE(rk3588_pm_domains),
> +	.pm_domain_names = rk3588_pm_domains,
> +	.resets_a_names = rk3588_resets_a,
> +	.resets_h_names = rk3588_resets_h,
> +	.clocks_a_names = rk3588_clocks_a,
> +	.clocks_h_names = rk3588_clocks_h,
> +	.irq_names = rk3588_irqs,
> +};
> +
> +static int
> +rocket_open(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = dev->dev_private;
> +	struct rocket_file_priv *rocket_priv;
> +
> +	rocket_priv = kzalloc(sizeof(*rocket_priv), GFP_KERNEL);
> +	if (!rocket_priv)
> +		return -ENOMEM;
> +
> +	rocket_priv->rdev = rdev;
> +	file->driver_priv = rocket_priv;
> +
> +	return 0;
> +}
> +
> +static void
> +rocket_postclose(struct drm_device *dev, struct drm_file *file)
> +{
> +	struct rocket_file_priv *rocket_priv = file->driver_priv;
> +
> +	kfree(rocket_priv);
> +}
> +
> +static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
> +#define ROCKET_IOCTL(n, func) \
> +	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
> +};
> +
> +static const struct file_operations rocket_drm_driver_fops = {
> +	.owner = THIS_MODULE,

This is weird.  I'd expect a use of DEFINE_DRM_ACCEL_FOPS()
Are you sure you need to explictly set .owner?  Thats been stripped out 
of the kernel as far as I've seen.

> +	DRM_ACCEL_FOPS,
> +};
> +
> +/*
> + * Rocket driver version:
> + * - 1.0 - initial interface
> + */
> +static const struct drm_driver rocket_drm_driver = {
> +	.driver_features	= DRIVER_COMPUTE_ACCEL,
> +	.open			= rocket_open,
> +	.postclose		= rocket_postclose,
> +	.ioctls			= rocket_drm_driver_ioctls,
> +	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
> +	.fops			= &rocket_drm_driver_fops,
> +	.name			= "rocket",
> +	.desc			= "rocket DRM",
> +	.date			= "20240521",
> +	.major			= 1,
> +	.minor			= 0,

Major, minor has been deprecated.  Pretty sure the data is being phased 
out right now if it hasn't been already.

> +};
> +
> +static int rocket_probe(struct platform_device *pdev)
> +{
> +	struct rocket_device *rdev;
> +	struct drm_device *ddev;
> +	int err;
> +
> +	BUILD_BUG_ON(rk3588_data.num_cores > MAX_NUM_CORES);
> +
> +	rdev = devm_kzalloc(&pdev->dev, sizeof(*rdev), GFP_KERNEL);
> +	if (!rdev)
> +		return -ENOMEM;
> +
> +	rdev->pdev = pdev;
> +	rdev->dev = &pdev->dev;
> +
> +	platform_set_drvdata(pdev, rdev);
> +
> +	rdev->comp = of_device_get_match_data(&pdev->dev);
> +	if (!rdev->comp)
> +		return -ENODEV;
> +
> +	/* Allocate and initialize the DRM device. */

Doesn't seem like this comment provides any value since it just 
reiterates what the code is.

> +	ddev = drm_dev_alloc(&rocket_drm_driver, &pdev->dev);

Why not devm_drm_dev_alloc()?

> +	if (IS_ERR(ddev))
> +		return PTR_ERR(ddev);
> +
> +	ddev->dev_private = rdev;
> +	rdev->ddev = ddev;
> +
> +	err = dma_set_mask_and_coherent(rdev->ddev->dev, DMA_BIT_MASK(40));
> +	if (err)
> +		goto err_drm_dev;
> +
> +	err = rocket_device_init(rdev);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Fatal error during NPU init\n");

Isn't there an EPROBE_DEFER helper for this usecase?

> +		goto err_drm_dev;
> +	}
> +
> +	pm_runtime_use_autosuspend(rdev->dev);
> +	pm_runtime_set_autosuspend_delay(rdev->dev, 50); /* ~3 frames */
> +	pm_runtime_set_active(rdev->dev);
> +	pm_runtime_enable(rdev->dev);
> +	pm_runtime_mark_last_busy(rdev->dev);
> +
> +	/*
> +	 * Register the DRM device with the core and the connectors with
> +	 * sysfs
> +	 */

Another no-value comment.

> +	err = drm_dev_register(ddev, 0);
> +	if (err < 0)
> +		goto err_pm_runtime;
> +
> +	return 0;
> +
> +err_pm_runtime:
> +	pm_runtime_disable(rdev->dev);
> +	rocket_device_fini(rdev);
> +	pm_runtime_set_suspended(rdev->dev);
> +err_drm_dev:
> +	drm_dev_put(ddev);
> +	return err;
> +}
> +
> +static void rocket_remove(struct platform_device *pdev)
> +{
> +	struct rocket_device *rdev = platform_get_drvdata(pdev);
> +	struct drm_device *ddev = rdev->ddev;
> +
> +	drm_dev_unregister(ddev);
> +
> +	pm_runtime_disable(rdev->dev);
> +	rocket_device_fini(rdev);
> +	pm_runtime_set_suspended(rdev->dev);
> +
> +	drm_dev_put(ddev);
> +}
> +
> +static const struct of_device_id dt_match[] = {
> +	{ .compatible = "rockchip,rk3588-rknn", .data = &rk3588_data, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dt_match);
> +
> +static int rocket_device_runtime_resume(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +	int core;
> +
> +	clk_prepare_enable(rdev->clk_npu);
> +	clk_prepare_enable(rdev->pclk);
> +
> +	for (core = 0; core < rdev->comp->num_cores; core++) {
> +		clk_prepare_enable(rdev->cores[core].a_clk);
> +		clk_prepare_enable(rdev->cores[core].h_clk);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rocket_device_runtime_suspend(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +	int core;
> +
> +	for (core = 0; core < rdev->comp->num_cores; core++) {
> +		clk_disable_unprepare(rdev->cores[core].a_clk);
> +		clk_disable_unprepare(rdev->cores[core].h_clk);
> +	}
> +
> +	clk_disable_unprepare(rdev->pclk);
> +	clk_disable_unprepare(rdev->clk_npu);
> +
> +	return 0;
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
> +	RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver rocket_driver = {
> +	.probe = rocket_probe,
> +	.remove_new = rocket_remove,
> +	.driver	 = {
> +		.name = "rocket",
> +		.pm = pm_ptr(&rocket_pm_ops),
> +		.of_match_table = dt_match,
> +	},
> +};
> +module_platform_driver(rocket_driver);
> +
> +MODULE_LICENSE("GPL v2");

"GPL v2" is invalid.  Did you run checkpatch?

> +MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
> +MODULE_AUTHOR("Tomeu Vizoso");
> diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
> new file mode 100644
> index 000000000000..e1d9407c46d7
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_drv.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_DRV_H__
> +#define __ROCKET_DRV_H__
> +
> +#include <linux/io.h>

Why?  Doesn't look like this file uses this.  However, no include for 
struct rocket_device either...

> +
> +struct rocket_file_priv {
> +       struct rocket_device *rdev;
> +};
> +
> +#endif
> diff --git a/drivers/accel/rocket/rocket_registers.h b/drivers/accel/rocket/rocket_registers.h
> new file mode 100644
> index 000000000000..9043fa922db5
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_registers.h
> @@ -0,0 +1,4449 @@
> +#ifndef REGISTERS_XML
> +#define REGISTERS_XML
> +
> +/* Autogenerated file, DO NOT EDIT manually!
> +
> +This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> +http://gitlab.freedesktop.org/mesa/mesa/
> +git clone https://gitlab.freedesktop.org/mesa/mesa.git
> +
> +The rules-ng-ng source files this header was generated from are:
> +
> +- /home/tomeu/src/mesa/src/gallium/drivers/rocket/registers.xml (  60076 bytes, from Wed Jun 12 10:02:25 2024)
> +
> +Copyright (C) 2024-2024 by the following authors:

Just checking, is the date range autogenerated?  2024-2024 is not 
correct per anything I've seen...

> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
> new file mode 100644
> index 000000000000..7a179731ffe4
> --- /dev/null
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Tomeu Vizoso

Why the copyright symbol?

> + */
> +#ifndef _ROCKET_DRM_H_
> +#define _ROCKET_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ROCKET_DRM_H_ */
> 

Eh, feels like this could/should be moved later in the series since 
there is no content.
