Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F5905C39
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 21:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904F710E8F2;
	Wed, 12 Jun 2024 19:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="baG+frdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5C410E8F3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1718221456; x=1718826256; i=friedrich.vock@gmx.de;
 bh=kCfiqnjt/bPpXo7/vLfDlRT2K8nIqWSIueiTsisVfDw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=baG+frdoosFnvTxPbHzfzQXGnPEjs06W5BMELQSX2U5pS2OuHpvlVS1SPSota9yX
 sKX+ksSQH8NkL89Kw26LT357DCLBwBlZNW1Nbl+GFjVFxJcfNpfFuzTBa31giqnAc
 2+5uNOwsJm0tpagv/frLp0KERyOC0nYQ3TnlhO43bGIIU2e+n3cLViaQQkwKNTUHf
 aOEVI5M8NDLj4UHRqUfbfv753qXNMVxb9wJpXZ+vZyvIqMPlqD01RJZVeogbmrSwW
 NnjlDslw7jiSfQkuLpQCMQZNqGD8JG20uo1+iSSRMc4Xl6xZfvAtmtqCa0Jy6Uqyv
 gZIc/MVdmXcs2ugjpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79yG-1sTJme1Vts-00rStL; Wed, 12
 Jun 2024 21:44:16 +0200
Message-ID: <e9eab3c2-1cef-41fb-8bf0-a477dd319b3e@gmx.de>
Date: Wed, 12 Jun 2024 21:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] accel/rocket: Add IOCTLs for synchronizing memory
 accesses
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-9-060e48eea250@tomeuvizoso.net>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <20240612-6-10-rocket-v1-9-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:64DUXvbzAN1e0DJGDaKyj19kGaJ5itxcBVlwNjoBR1NCoP/PVJc
 LR8OCxdh8f3hHQYVvZRUq/0AtWehfwq/DfBbIjIxBJkiV5m9neTUJK/VniXP5d3GyAoRzkt
 brmhK+jcsSl1GxwGNJwGx3BtNshKU11ZaKxfMfGNbbgegvWMn835A8CVxFUrFIt2WAvm+pk
 eg+qphqG0j+/7c+I67hzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xqFTV1fLAB0=;gEPUI9P8h5BeEFETfNN/eaNzGT8
 uVIizXC/BBnWEf17hM+iiIfojeJ7VDbd6rccMh7S1t6D64UY4/RVT4MvQAfZn+L7MDDr0KRxl
 6C7yaxSGhiq4cbEG8qZLTSdyNg3Y8BVe6SBlsTx0yiOqntBACulQRshB0DZ6Y3EzqRg0cDhjo
 deijmxJ2cz3D8uG610wgseu9aNGsAU7k7OY2qlQQuDkXDGxOOt+VzVz7IWSo/VBw6WnloLtf/
 uFqJO5pXaziYjiLJmDxWKMEAtAzZocGn3MEd3RU5AnWFx72+cKlJSvl5m+bGS/AoleixcLArj
 YfxiCBowV/T8gRx788MLKchiHNcjFVcLJWG/lC6LPPcA854CsfjPmTgGvPEaCH+OpUjqCrRi7
 gJJDV0P08utfN+XdC86mWMFIIZKlPfMUB88sZVaIIyQDIPsI+ex5bMPXTfHIPj2x4oMPXnT/B
 qxRQoN5ajZYE3d4gpuPJQIg7yJUYMwVdwNxLjpPMz3xjWDzbLoNbZO8ZyvkulcVy+mhtydtJH
 e4Ozh3UOhEF3ViFJFk2Gho6VYmMt+uKzOxsa8Ry81bDzYw+rjFQbMXCHPI8uRCcXv0uOiIIEV
 B0VQye55RU6c9U0bMwOS1GjkNm9TTtOCZgo7gRW3ti3gMabuhG4+Lde+iA+aZLm3vx8dVSmbg
 cSzJaD+EzM0gMmAyTcUeEasBDz+uUuW5Lx7mx3EQMtgJu9lj1UWI2zoSEYVa5/epn11VZsGNK
 J8gk/DU53fvyykxxjRNrEo7ChGlh9Jbn3tDmZdj+9kWnqVdlhr6tbGkYto0LUBl7Vj/xRWLy0
 KpLqenWI/+Q2UBn15v7fM8rhyWgq/dlsma6T3+I1heKOE=
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

On 12.06.24 15:53, Tomeu Vizoso wrote:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
>
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
>
> Initially based on the same IOCTLs from the Etnaviv driver.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   drivers/accel/rocket/rocket_drv.c |  2 ++
>   drivers/accel/rocket/rocket_gem.c | 68 +++++++++++++++++++++++++++++++=
++++++++
>   drivers/accel/rocket/rocket_gem.h |  7 +++-
>   include/uapi/drm/rocket_accel.h   | 20 +++++++++++-
>   4 files changed, 95 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/ro=
cket_drv.c
> index adcb9a685dd8..d41a4f4b330d 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -73,6 +73,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_i=
octls[] =3D {
>   	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
>
>   	ROCKET_IOCTL(CREATE_BO, create_bo),
> +	ROCKET_IOCTL(PREP_BO, prep_bo),
> +	ROCKET_IOCTL(FINI_BO, fini_bo),
>   	ROCKET_IOCTL(SUBMIT, submit),
>   };
>
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/ro=
cket_gem.c
> index e10eb886f150..afacdf91491e 100644
> --- a/drivers/accel/rocket/rocket_gem.c
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -2,7 +2,9 @@
>   /* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
>
>   #include <drm/drm_device.h>
> +#include <drm/drm_utils.h>
>   #include <drm/rocket_accel.h>
> +#include <linux/dma-mapping.h>
>
>   #include "rocket_gem.h"
>
> @@ -66,3 +68,69 @@ int rocket_ioctl_create_bo(struct drm_device *dev, vo=
id *data, struct drm_file *
>
>   	return ret;
>   }
> +
> +static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
> +{
> +	if (op & ROCKET_PREP_READ)
> +		return DMA_FROM_DEVICE;
> +	else if (op & ROCKET_PREP_WRITE)
> +		return DMA_TO_DEVICE;
> +	else
> +		return DMA_BIDIRECTIONAL;

Drive-by comment: This logic looks incorrect to me? If op =3D=3D
ROCKET_PREP_READ | ROCKET_PREP_WRITE, this code will return
DMA_FROM_DEVICE when it should return DMA_BIDIRECTIONAL.

The logic would work if it was inverted:
if (!(op & ROCKET_PREP_WRITE))
	return DMA_FROM_DEVICE;
else if (!(op & ROCKET_PREP_READ))
	return DMA_TO_DEVICE;
else
	return DMA_BIDIRECTIONAL;

Thanks,
Friedrich

> +}
> +
> +int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm=
_file *file)
> +{
> +	struct drm_rocket_prep_bo *args =3D data;
> +	unsigned long timeout =3D drm_timeout_abs_to_jiffies(args->timeout_ns)=
;
> +	struct drm_gem_object *gem_obj;
> +	struct drm_gem_shmem_object *shmem_obj;
> +	bool write =3D !!(args->op & ROCKET_PREP_WRITE);
> +	long ret =3D 0;
> +
> +	if (args->op & ~(ROCKET_PREP_READ | ROCKET_PREP_WRITE))
> +		return -EINVAL;
> +
> +	gem_obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	ret =3D dma_resv_wait_timeout(gem_obj->resv, dma_resv_usage_rw(write),
> +				    true, timeout);
> +	if (!ret)
> +		ret =3D timeout ? -ETIMEDOUT : -EBUSY;
> +
> +	shmem_obj =3D &to_rocket_bo(gem_obj)->base;
> +
> +	dma_sync_sgtable_for_cpu(dev->dev, shmem_obj->sgt, rocket_op_to_dma_di=
r(args->op));
> +	to_rocket_bo(gem_obj)->last_cpu_prep_op =3D args->op;
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return ret;
> +}
> +
> +int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm=
_file *file)
> +{
> +	struct drm_rocket_fini_bo *args =3D data;
> +	struct drm_gem_object *gem_obj;
> +	struct rocket_gem_object *rkt_obj;
> +	struct drm_gem_shmem_object *shmem_obj;
> +
> +	gem_obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	rkt_obj =3D to_rocket_bo(gem_obj);
> +	shmem_obj =3D &rkt_obj->base;
> +
> +	WARN_ON(rkt_obj->last_cpu_prep_op =3D=3D 0);
> +
> +	dma_sync_sgtable_for_device(dev->dev, shmem_obj->sgt,
> +				    rocket_op_to_dma_dir(rkt_obj->last_cpu_prep_op));
> +	rkt_obj->last_cpu_prep_op =3D 0;
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/ro=
cket_gem.h
> index 2cb294f25c19..9b1c485ec600 100644
> --- a/drivers/accel/rocket/rocket_gem.h
> +++ b/drivers/accel/rocket/rocket_gem.h
> @@ -13,16 +13,21 @@ struct rocket_gem_object {
>   	struct mutex mutex;
>   	size_t size;
>   	u32 offset;
> +	u32 last_cpu_prep_op;
>   };
>
>   struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev=
, size_t size);
>
>   int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct =
drm_file *file);
>
> +int rocket_ioctl_prep_bo(struct drm_device *dev, void *data, struct drm=
_file *file);
> +
> +int rocket_ioctl_fini_bo(struct drm_device *dev, void *data, struct drm=
_file *file);
> +
>   static inline
>   struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
>   {
>   	return container_of(to_drm_gem_shmem_obj(obj), struct rocket_gem_obje=
ct, base);
>   }
>
> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_a=
ccel.h
> index 888c9413e4cd..1539af0af4fe 100644
> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -12,9 +12,13 @@ extern "C" {
>   #endif
>
>   #define DRM_ROCKET_CREATE_BO			0x00
> -#define DRM_ROCKET_SUBMIT			0x01
> +#define DRM_ROCKET_PREP_BO			0x01
> +#define DRM_ROCKET_FINI_BO			0x02
> +#define DRM_ROCKET_SUBMIT			0x03
>
>   #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_RO=
CKET_CREATE_BO, struct drm_rocket_create_bo)
> +#define DRM_IOCTL_ROCKET_PREP_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET=
_PREP_BO, struct drm_rocket_prep_bo)
> +#define DRM_IOCTL_ROCKET_FINI_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET=
_FINI_BO, struct drm_rocket_fini_bo)
>   #define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKE=
T_SUBMIT, struct drm_rocket_submit)
>
>   /**
> @@ -38,6 +42,20 @@ struct drm_rocket_create_bo {
>   	__u64 offset;
>   };
>
> +#define ROCKET_PREP_READ        0x01
> +#define ROCKET_PREP_WRITE       0x02
> +
> +struct drm_rocket_prep_bo {
> +	__u32 handle;		/* in */
> +	__u32 op;		/* in, mask of ROCKET_PREP_x */
> +	__s64 timeout_ns;	/* in */
> +};
> +
> +struct drm_rocket_fini_bo {
> +	__u32 handle;		/* in */
> +	__u32 flags;		/* in, placeholder for now, no defined values */
> +};
> +
>   /**
>    * struct drm_rocket_task - A task to be run on the NPU
>    *
>
