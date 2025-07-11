Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587A0B022C9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 19:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC4910E3A9;
	Fri, 11 Jul 2025 17:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="MfxRnRrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4047810E3A9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:41:01 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56BHemug1861107;
 Fri, 11 Jul 2025 12:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752255648;
 bh=avkCSBI/cy3dHICmDxAzJXYe1H+unqcSXKS5zVohgaE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=MfxRnRrKgfCUgO2J9UsENDPiXwTOrv7M+KRQK4+WubWagVc1t8P07KW7Eqp+XtZUK
 kEbQVJRSEM/E4NEI1bAIugDacmCrpCTnuo/gdgQp7j9MAA3mc4VLjM+KuTu0R+rRO6
 ZiN1UFF5JJS6uX5fPKjBaY5Yzkevs1GL6yNSaKfk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56BHem8U533293
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 11 Jul 2025 12:40:48 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 12:40:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 12:40:47 -0500
Received: from [10.250.35.60] ([10.250.35.60])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56BHekf83588411;
 Fri, 11 Jul 2025 12:40:46 -0500
Message-ID: <7178abc9-8f92-4bba-9b50-ffdf5f8d1279@ti.com>
Date: Fri, 11 Jul 2025 12:40:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Sebastian
 Reichel <sebastian.reichel@collabora.com>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 6/6/25 1:28 AM, Tomeu Vizoso wrote:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
> 
> v2:
> - Sync the IOMMUs for the other cores when mapping and unmapping.
> 
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   drivers/accel/rocket/Makefile        |   3 +-
>   drivers/accel/rocket/rocket_device.c |   4 ++
>   drivers/accel/rocket/rocket_device.h |   2 +
>   drivers/accel/rocket/rocket_drv.c    |   7 ++-
>   drivers/accel/rocket/rocket_gem.c    | 115 +++++++++++++++++++++++++++++++++++
>   drivers/accel/rocket/rocket_gem.h    |  27 ++++++++
>   include/uapi/drm/rocket_accel.h      |  44 ++++++++++++++
>   7 files changed, 200 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> index abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96..4deef267f9e1238c4d8bd108dcc8afd9dc8b2b8f 100644
> --- a/drivers/accel/rocket/Makefile
> +++ b/drivers/accel/rocket/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
>   rocket-y := \
>   	rocket_core.o \
>   	rocket_device.o \
> -	rocket_drv.o
> +	rocket_drv.o \
> +	rocket_gem.o
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index a05c103e117e3eaa6439884b7acb6e3483296edb..5e559104741af22c528914c96e44558323ab6c89 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -4,6 +4,7 @@
>   #include <linux/array_size.h>
>   #include <linux/clk.h>
>   #include <linux/dev_printk.h>
> +#include <linux/mutex.h>
>   
>   #include "rocket_device.h"
>   
> @@ -16,10 +17,13 @@ int rocket_device_init(struct rocket_device *rdev)
>   	if (err)
>   		return err;
>   
> +	mutex_init(&rdev->iommu_lock);

devm_mutex_init() again keeps you from needing rocket_device_fini().
Same in the next patch even if you don't end up needing the iommu_lock.

Andrew
