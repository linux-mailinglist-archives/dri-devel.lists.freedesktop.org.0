Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB59B340E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 15:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E91910E4D8;
	Mon, 28 Oct 2024 14:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="pEF6pON2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEC910E4D7;
 Mon, 28 Oct 2024 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1730127226; x=1730732026; i=friedrich.vock@gmx.de;
 bh=STUU9owkaaMERJZ2AXTBH+gorsSTFfmO6SNkJBMaIzo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pEF6pON2HRo3yZqSsDiSgFwCDYa/cj3JbLuXV2sy+J4HFnRaprrNwtQAkcRk3DHC
 hpdVQ5dJnqDlYuoPB2Ns0ZiGWK8sbmhBY71IfCyTD35t8RhgoyrU1FjyEadQabv8f
 3B1JcFiKsNQlQtF2qLjZQBt/DSHNfsNSR5orhKCKEtoRUEu3IMBGJ2Y60shPhWLJ3
 f6PUolsKNi6kkxTcHCIBkj4V4g1gZ3yws1RZSZGGY5rrMve/rKBm4joQFglXMQIfn
 25Z5obZus/TabDocDgvYR/Sl0QbrKLHcqfz9hu0Bokg7wUKnee+pauW6o8yZAyN1g
 u48bkkPdAYIWwyfADQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpap-1tj8uz2EAR-00hiM6; Mon, 28
 Oct 2024 15:53:46 +0100
Message-ID: <91125995-3a33-4971-a581-e6e24ccf0b47@gmx.de>
Date: Mon, 28 Oct 2024 15:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Friedrich Vock <friedrich.vock@gmx.de>
Subject: Re: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maxime Ripard <mripard@kernel.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pziIyt1R1k7EKHH++g4jENSEZPOXW7R1TbVzy/qL3Zt98EPFb/G
 UC1KNhpaWA6w8z+bwt12+Qk//PMsVk3DIkrgEIY9gaH0vDt1qEoCTPmSTTT1xwLXVYolhlx
 WB0gak4Qrl8MQX9HXG3C1I+irUhwr7JXtRKwWf3CfT4frSacG452+1/izgReGQkW9ml+0CG
 9crfjeEX9Xj9dRI1NL4lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8dbEG3fUhP4=;fxXBKRd5JJFlZZ1+V+ksAOp+vkm
 bENoHSpcoHX3DKO2PGcL8WMXxuVBA9SNCzlWl6wDnW310Fj9G+Rt8oHZFhbFUQ2lLOvCavLyg
 l+FyMM+N7KAMVniya9kXLcX99bljQjpPzdUq17SuhyvNUff6qdc/U1zZKcL4q88WNFOjAomlU
 lJ5cC/hs9p2zwDnkPQuJlTFDI1CwbmIQRot7YkcZuxiCeEv4EKCQyOv/5+NDA3OcCFmvA9L+b
 B/1W8ZRbFCd+/va6Uo5OG0nBG11vn7ZV9IeSu501VEZ/G+/+qr/SAhLP0T8MSh/el5ejgJofq
 yiCZPkAey9jpD25tPNZMVgTuTREO2oxf7Oz3Av35zDvGD4cBlckXjL1to21kKe/+NmjJl7U0l
 ZuvWK9mDyxzYmxuul/AkRNMttQVRSXpq7d7aaCIZ0j5+d3hl4X4yorC2V6E9/VTd8LLvfODXN
 nPsgYB536LSliT7zIW4zR8i1Chhmpl3GgFXMq2pi5LXJngVuxdU/n/A+uQaR1podFqEiLeToe
 tpPuiqZ3V7ysGy9SVHfhfD8+W7ELrkY1FcbNn8MjV37YBDQXclNJbjtuBxnfUAdPFUzQTlchq
 KqWrQdfXlHKELzq431RtkM4i00Vn1LDhWJuSNRsgIY1t8DSVcB1t2Q3kIgyMNvFGGEZO8tCvQ
 Shu8UsyaRN7tModJJHwALmXMS6pTu5VAX+/3QTwZ9wsOQ/gVQOjPgXwLC1KeExVWR4UZnXb1w
 UI2KSA77xLCVAgCx78A5U2G499j8viQz4kyA+cB+94ntczKEdEW4A4dSief9vk+gtQykVLSfL
 2g2yzKOqlWOq8+VGULRpP8/A==
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

On 23.10.24 09:52, Maarten Lankhorst wrote:
> The initial version was based roughly on the rdma and misc cgroup
> controllers, with a lot of the accounting code borrowed from rdma.
>
> The current version is a complete rewrite with page counter; it uses
> the same min/low/max semantics as the memory cgroup as a result.
>
> There's a small mismatch as TTM uses u64, and page_counter long pages.
> In practice it's not a problem. 32-bits systems don't really come with
>> =3D4GB cards and as long as we're consistently wrong with units, it's
> fine. The device page size may not be in the same units as kernel page
> size, and each region might also have a different page size (VRAM vs GAR=
T
> for example).
>
> The interface is simple:
> - populate dev_cgroup_try_charge->regions[..] name and size for each act=
ive
>    region, set num_regions accordingly.
> - Call (dev,drmm)_cgroup_register_device()
> - Use dev_cgroup_try_charge to check if you can allocate a chunk of memo=
ry,
>    use dev_cgroup__uncharge when freeing it. This may return an error co=
de,
>    or -EAGAIN when the cgroup limit is reached. In that case a reference
>    to the limiting pool is returned.
> - The limiting cs can be used as compare function for
>    dev_cgroup_state_evict_valuable.
> - After having evicted enough, drop reference to limiting cs with
>    dev_cgroup_pool_state_put.
>
> This API allows you to limit device resources with cgroups.
> You can see the supported cards in /sys/fs/cgroup/dev.region.capacity
> You need to echo +dev to cgroup.subtree_control, and then you can
> partition memory.
>
> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> Co-developed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst |  51 ++
>   Documentation/core-api/cgroup.rst       |   9 +
>   Documentation/core-api/index.rst        |   1 +
>   Documentation/gpu/drm-compute.rst       |  54 ++
>   include/linux/cgroup_dev.h              |  91 +++
>   include/linux/cgroup_subsys.h           |   4 +
>   include/linux/page_counter.h            |   2 +-
>   init/Kconfig                            |   7 +
>   kernel/cgroup/Makefile                  |   1 +
>   kernel/cgroup/dev.c                     | 893 ++++++++++++++++++++++++
>   mm/page_counter.c                       |   4 +-
>   11 files changed, 1114 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/core-api/cgroup.rst
>   create mode 100644 Documentation/gpu/drm-compute.rst
>   create mode 100644 include/linux/cgroup_dev.h
>   create mode 100644 kernel/cgroup/dev.c
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/adm=
in-guide/cgroup-v2.rst
> index 69af2173555fb..e8fe79244af9c 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2612,6 +2612,57 @@ RDMA Interface Files
>   	  mlx4_0 hca_handle=3D1 hca_object=3D20
>   	  ocrdma1 hca_handle=3D1 hca_object=3D23
>
> +DEV
> +----
> +
> +The "dev" controller regulates the distribution and accounting of
> +device resources, currently only memory regions. Because each memory
> +region may have its own page size, which does not have to be equal
> +to the system page size. the units are in bytes.
> +
> +DEV Interface Files
> +~~~~~~~~~~~~~~~~~~~~
> +
> +  dev.region.max, dev.region.min, dev.region.low
> +	A readwrite nested-keyed file that exists for all the cgroups
> +	except root that describes current configured resource limit
> +	for a device.
> +
> +	Lines are keyed by device name and are not ordered.
> +	Each line contains space separated resource name and its configured
> +	limit that can be distributed.
> +
> +	The following nested keys are defined.
> +
> +	  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	  *	 	Maximum amount of bytes that allocatable in this region
> +	  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +	An example for xe follows::
> +
> +	  drm/0000:03:00.0 vram0=3D1073741824 stolen=3Dmax
> +
> +	The semantics are the same as for the memory cgroup controller, and ar=
e
> +	calculated in the same way.
> +
> +  dev.region.capacity
> +	A read-only file that describes maximum region capacity.
> +	It only exists on the root cgroup. Not all memory can be
> +	allocated by cgroups, as the kernel reserves some for
> +	internal use.
> +
> +	An example for xe follows::
> +
> +	  drm/0000:03:00.0 vram0=3D8514437120 stolen=3D67108864
> +
> +  dev.region.current
> +	A read-only file that describes current resource usage.
> +	It exists for all the cgroup except root.
> +
> +	An example for xe follows::
> +
> +	  drm/0000:03:00.0 vram0=3D12550144 stolen=3D8650752
> +
>   HugeTLB
>   -------
>
> diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-api/=
cgroup.rst
> new file mode 100644
> index 0000000000000..475b32255bd68
> --- /dev/null
> +++ b/Documentation/core-api/cgroup.rst
> @@ -0,0 +1,9 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Cgroup Kernel APIs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Device Cgroup API (devcg)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +.. kernel-doc:: kernel/cgroup/dev.c
> +   :export:
> +
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/i=
ndex.rst
> index 6a875743dd4b7..dbd6c4f9a6313 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -108,6 +108,7 @@ more memory-management documentation in Documentatio=
n/mm/index.rst.
>      dma-isa-lpc
>      swiotlb
>      mm-api
> +   cgroup
>      genalloc
>      pin_user_pages
>      boot-time-mm
> diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/drm-c=
ompute.rst
> new file mode 100644
> index 0000000000000..116270976ef7a
> --- /dev/null
> +++ b/Documentation/gpu/drm-compute.rst
> @@ -0,0 +1,54 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Long running workloads and compute
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Long running workloads (compute) are workloads that will not complete i=
n 10
> +seconds. (The time let the user wait before he reaches for the power bu=
tton).
> +This means that other techniques need to be used to manage those worklo=
ads,
> +that cannot use fences.
> +
> +Some hardware may schedule compute jobs, and have no way to pre-empt th=
em, or
> +have their memory swapped out from them. Or they simply want their work=
load
> +not to be preempted or swapped out at all.
> +
> +This means that it differs from what is described in driver-api/dma-buf=
.rst.
> +
> +As with normal compute jobs, dma-fence may not be used at all. In this =
case,
> +not even to force preemption. The driver with is simply forced to unmap=
 a BO
> +from the long compute job's address space on unbind immediately, not ev=
en
> +waiting for the workload to complete. Effectively this terminates the w=
orkload
> +when there is no hardware support to recover.
> +
> +Since this is undesirable, there need to be mitigations to prevent a wo=
rkload
> +from being terminated. There are several possible approach, all with th=
eir
> +advantages and drawbacks.
> +
> +The first approach you will likely try is to pin all buffers used by co=
mpute.
> +This guarantees that the job will run uninterrupted, but also allows a =
very
> +denial of service attack by pinning as much memory as possible, hogging=
 the
> +all GPU memory, and possibly a huge chunk of CPU memory.
> +
> +A second approach that will work slightly better on its own is adding a=
n option
> +not to evict when creating a new job (any kind). If all of userspace op=
ts in
> +to this flag, it would prevent cooperating userspace from forced termin=
ating
> +older compute jobs to start a new one.
> +
> +If job preemption and recoverable pagefaults are not available, those a=
re the
> +only approaches possible. So even with those, you want a separate way o=
f
> +controlling resources. The standard kernel way of doing so is cgroups.
> +
> +This creates a third option, using cgroups to prevent eviction. Both GP=
U and
> +driver-allocated CPU memory would be accounted to the correct cgroup, a=
nd
> +eviction would be made cgroup aware. This allows the GPU to be partitio=
ned
> +into cgroups, that will allow jobs to run next to each other without
> +interference.
> +
> +The interface to the cgroup would be similar to the current CPU memory
> +interface, with similar semantics for min/low/high/max, if eviction can
> +be made cgroup aware. For now only max is implemented.
> +
> +What should be noted is that each memory region (tiled memory for examp=
le)
> +should have its own accounting, using $card key0 =3D value0 key1 =3D va=
lue1.
> +
> +The key is set to the regionid set by the driver, for example "tile0".
> +For the value of $card, we use drmGetUnique().
> diff --git a/include/linux/cgroup_dev.h b/include/linux/cgroup_dev.h
> new file mode 100644
> index 0000000000000..c6311d1d3ce48
> --- /dev/null
> +++ b/include/linux/cgroup_dev.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _CGROUP_DEV_H
> +#define _CGROUP_DEV_H
> +
> +#include <linux/types.h>
> +#include <linux/llist.h>
> +
> +struct dev_cgroup_pool_state;
> +
> +/*
> + * Use 8 as max, because of N^2 lookup when setting things, can be bump=
ed if needed
> + * Identical to TTM_NUM_MEM_TYPES to allow simplifying that code.
> + */
> +#define DEVICE_CGROUP_MAX_REGIONS 8
> +
> +/* Public definition of cgroup device, should not be modified after _re=
gister() */
> +struct dev_cgroup_device {
> +	struct {
> +		u64 size;
> +		const char *name;
> +	} regions[DEVICE_CGROUP_MAX_REGIONS];
> +
> +	int num_regions;
> +
> +	/* used by cgroups, do not use */
> +	void *priv;
> +};
> +
> +#if IS_ENABLED(CONFIG_CGROUP_DEV)
> +int dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
> +			       const char *name);
> +void dev_cgroup_unregister_device(struct dev_cgroup_device *cgdev);
> +int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
> +			  u32 index, u64 size,
> +			  struct dev_cgroup_pool_state **ret_pool,
> +			  struct dev_cgroup_pool_state **ret_limit_pool);
> +void dev_cgroup_uncharge(struct dev_cgroup_pool_state *pool,
> +			 u32 index, u64 size);
> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, int=
 index,
> +				     struct dev_cgroup_pool_state *limit_pool,
> +				     struct dev_cgroup_pool_state *test_pool,
> +				     bool ignore_low, bool *ret_hit_low);
> +
> +void dev_cgroup_pool_state_put(struct dev_cgroup_pool_state *pool);
> +#else
> +static inline int
> +dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
> +			   const char *name)
> +{
> +	return 0;
> +}
> +
> +static inline void dev_cgroup_unregister_device(struct dev_cgroup_devic=
e *cgdev)
> +{
> +}
> +
> +static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
> +				     u32 index, u64 size,
> +				     struct dev_cgroup_pool_state **ret_pool,
> +				     struct dev_cgroup_pool_state **ret_limit_pool);
> +{
> +	*ret_pool =3D NULL;
> +
> +	if (ret_limit_pool)
> +		*ret_limit_pool =3D NULL;
> +
> +	return 0;
> +}
> +
> +static inline void dev_cgroup_uncharge(struct dev_cgroup_pool_state *po=
ol,
> +				       u32 index, u64 size)
> +{ }
> +
> +static inline
> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, int=
 index,
> +				     struct dev_cgroup_pool_state *limit_pool,
> +				     struct dev_cgroup_pool_state *test_pool,
> +				     bool ignore_low, bool *ret_hit_low)
> +{
> +	return true;
> +}
> +
> +static inline void dev_cgroup_pool_state_put(struct dev_cgroup_pool_sta=
te *pool)
> +{ }
> +
> +#endif
> +#endif	/* _CGROUP_DEV_H */
> diff --git a/include/linux/cgroup_subsys.h b/include/linux/cgroup_subsys=
.h
> index 4452354872307..898340cfe5843 100644
> --- a/include/linux/cgroup_subsys.h
> +++ b/include/linux/cgroup_subsys.h
> @@ -65,6 +65,10 @@ SUBSYS(rdma)
>   SUBSYS(misc)
>   #endif
>
> +#if IS_ENABLED(CONFIG_CGROUP_DEV)
> +SUBSYS(dev)
> +#endif
> +
>   /*
>    * The following subsystems are not supported on the default hierarchy=
.
>    */
> diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
> index 79dbd8bc35a72..d75376a1694ee 100644
> --- a/include/linux/page_counter.h
> +++ b/include/linux/page_counter.h
> @@ -96,7 +96,7 @@ static inline void page_counter_reset_watermark(struct=
 page_counter *counter)
>   	counter->watermark =3D usage;
>   }
>
> -#ifdef CONFIG_MEMCG
> +#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DEVICE)
>   void page_counter_calculate_protection(struct page_counter *root,
>   				       struct page_counter *counter,
>   				       bool recursive_protection);
> diff --git a/init/Kconfig b/init/Kconfig
> index 530a382ee0feb..2da595facd97f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1123,6 +1123,13 @@ config CGROUP_RDMA
>   	  Attaching processes with active RDMA resources to the cgroup
>   	  hierarchy is allowed even if can cross the hierarchy's limit.
>
> +config CGROUP_DEV
> +	bool "Device controller"
> +	help
> +	  Provides the device subsystem controller.
> +
> +	  ...
> +
>   config CGROUP_FREEZER
>   	bool "Freezer controller"
>   	help
> diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
> index a5c9359d516f8..441d346fdc51f 100644
> --- a/kernel/cgroup/Makefile
> +++ b/kernel/cgroup/Makefile
> @@ -7,4 +7,5 @@ obj-$(CONFIG_CGROUP_RDMA) +=3D rdma.o
>   obj-$(CONFIG_CPUSETS) +=3D cpuset.o
>   obj-$(CONFIG_CPUSETS_V1) +=3D cpuset-v1.o
>   obj-$(CONFIG_CGROUP_MISC) +=3D misc.o
> +obj-$(CONFIG_CGROUP_DEV) +=3D dev.o
>   obj-$(CONFIG_CGROUP_DEBUG) +=3D debug.o
> diff --git a/kernel/cgroup/dev.c b/kernel/cgroup/dev.c
> new file mode 100644
> index 0000000000000..e422ccbfbc444
> --- /dev/null
> +++ b/kernel/cgroup/dev.c
> @@ -0,0 +1,893 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2023-2024 Intel Corporation (Maarten Lankhorst <dev@lankho=
rst.se>)
> + * Copyright 2024 Red Hat (Maxime Ripard <mripard@kernel.org>)
> + * Partially based on the rdma and misc controllers, which bear the fol=
lowing copyrights:
> + *
> + * Copyright 2020 Google LLC
> + * Copyright (C) 2016 Parav Pandit <pandit.parav@gmail.com>
> + */
> +
> +#include <linux/cgroup.h>
> +#include <linux/cgroup_dev.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/page_counter.h>
> +#include <linux/parser.h>
> +#include <linux/slab.h>
> +
> +struct devcg_device {
> +	/**
> +	 * @ref: References keeping the device alive.
> +	 * Keeps the device reference alive after a succesful RCU lookup.
> +	 */
> +	struct kref ref;
> +
> +	/** @rcu: RCU head for freeing */
> +	struct rcu_head rcu;
> +
> +	/**
> +	 * @dev_node: Linked into &devcg_devices list.
> +	 * Protected by RCU and global spinlock.
> +	 */
> +	struct list_head dev_node;
> +
> +	/**
> +	 * @pools: List of pools linked to this device.
> +	 * Protected by global spinlock only
> +	 */
> +	struct list_head pools;
> +
> +	/**
> +	 * @base: Copy of the struct passed on register.
> +	 * A copy is made to prevent lifetime issues. devcg_device may
> +	 * be kept alive when changing cgroups values concurrently through
> +	 * rcu lookups.
> +	 */
> +	struct dev_cgroup_device base;
> +
> +	/** @name: Name describing the node, set by dev_cgroup_register_device=
 */
> +	const char *name;
> +
> +	/**
> +	 * @unregistered: Whether the device is unregistered by its caller.
> +	 * No new pools should be added to the device afterwards.
> +	 */
> +	bool unregistered;
> +};
> +
> +struct devcg_state {
> +	struct cgroup_subsys_state css;
> +
> +	struct list_head pools;
> +};
> +
> +struct dev_cgroup_pool_state {
> +	struct devcg_device *device;
> +	struct devcg_state *cs;
> +
> +	/* css node, RCU protected against device teardown */
> +	struct list_head	css_node;
> +
> +	/* dev node, no RCU protection required */
> +	struct list_head	dev_node;
> +
> +	int num_res, inited;
> +	struct rcu_head rcu;
> +
> +	struct devcg_pool_res {
> +		struct page_counter cnt;
> +	} resources[];
> +};
> +
> +/*
> + * 3 operations require locking protection:
> + * - Registering and unregistering device to/from list, requires global=
 lock.
> + * - Adding a dev_cgroup_pool_state to a CSS, removing when CSS is free=
d.
> + * - Adding a dev_cgroup_pool_state to a device list.
> + *
> + * Since for the most common operations RCU provides enough protection,=
 I
> + * do not think more granular locking makes sense. Most protection is o=
ffered
> + * by RCU and the lockless operating page_counter.
> + */
> +static DEFINE_SPINLOCK(devcg_lock);
> +static LIST_HEAD(devcg_devices);
> +
> +static inline struct devcg_state *
> +css_to_devcs(struct cgroup_subsys_state *css)
> +{
> +	return container_of(css, struct devcg_state, css);
> +}
> +
> +static inline struct devcg_state *get_current_devcs(void)
> +{
> +	return css_to_devcs(task_get_css(current, dev_cgrp_id));
> +}
> +
> +static struct devcg_state *parent_devcs(struct devcg_state *cg)
> +{
> +	return cg->css.parent ? css_to_devcs(cg->css.parent) : NULL;
> +}
> +
> +static void free_cg_pool(struct dev_cgroup_pool_state *pool)
> +{
> +	list_del(&pool->dev_node);
> +	kfree(pool);
> +}
> +
> +static void
> +set_resource_min(struct dev_cgroup_pool_state *pool, int i, u64 val)
> +{
> +	page_counter_set_min(&pool->resources[i].cnt, val);
> +}
> +
> +static void
> +set_resource_low(struct dev_cgroup_pool_state *pool, int i, u64 val)
> +{
> +	page_counter_set_low(&pool->resources[i].cnt, val);
> +}
> +
> +static void
> +set_resource_max(struct dev_cgroup_pool_state *pool, int i, u64 val)
> +{
> +	page_counter_set_max(&pool->resources[i].cnt, val);
> +}
> +
> +static u64 get_resource_low(struct dev_cgroup_pool_state *pool, int idx=
)
> +{
> +	return pool ? READ_ONCE(pool->resources[idx].cnt.low) : 0;
> +}
> +
> +static u64 get_resource_min(struct dev_cgroup_pool_state *pool, int idx=
)
> +{
> +	return pool ? READ_ONCE(pool->resources[idx].cnt.min) : 0;
> +}
> +
> +static u64 get_resource_max(struct dev_cgroup_pool_state *pool, int idx=
)
> +{
> +	return pool ? READ_ONCE(pool->resources[idx].cnt.max) : PAGE_COUNTER_M=
AX;
> +}
> +
> +static u64 get_resource_current(struct dev_cgroup_pool_state *pool, int=
 idx)
> +{
> +	return pool ? page_counter_read(&pool->resources[idx].cnt) : 0;
> +}
> +
> +static void reset_all_resource_limits(struct dev_cgroup_pool_state *rpo=
ol)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < rpool->num_res; i++) {
> +		set_resource_min(rpool, i, 0);
> +		set_resource_low(rpool, i, 0);
> +		set_resource_max(rpool, i, PAGE_COUNTER_MAX);
> +	}
> +}
> +
> +static void devcs_offline(struct cgroup_subsys_state *css)
> +{
> +	struct devcg_state *devcs =3D css_to_devcs(css);
> +	struct dev_cgroup_pool_state *pool;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(pool, &devcs->pools, css_node)
> +		reset_all_resource_limits(pool);
> +	rcu_read_unlock();
> +}
> +
> +static void devcs_free(struct cgroup_subsys_state *css)
> +{
> +	struct devcg_state *devcs =3D css_to_devcs(css);
> +	struct dev_cgroup_pool_state *pool, *next;
> +
> +	spin_lock(&devcg_lock);
> +	list_for_each_entry_safe(pool, next, &devcs->pools, css_node) {
> +		/*
> +		 *The pool is dead and all references are 0,
> +		 * no need for RCU protection with list_del_rcu or freeing.
> +		 */
> +		list_del(&pool->css_node);
> +		free_cg_pool(pool);
> +	}
> +	spin_unlock(&devcg_lock);
> +
> +	kfree(devcs);
> +}
> +
> +static struct cgroup_subsys_state *
> +devcs_alloc(struct cgroup_subsys_state *parent_css)
> +{
> +	struct devcg_state *devcs =3D kzalloc(sizeof(*devcs), GFP_KERNEL);
> +	if (!devcs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_LIST_HEAD(&devcs->pools);
> +	return &devcs->css;
> +}
> +
> +static struct dev_cgroup_pool_state *
> +find_cg_pool_locked(struct devcg_state *devcs, struct devcg_device *dev=
)
> +{
> +	struct dev_cgroup_pool_state *pool;
> +
> +	list_for_each_entry_rcu(pool, &devcs->pools, css_node, spin_is_locked(=
&devcg_lock))
> +		if (pool->device =3D=3D dev)
> +			return pool;
> +
> +	return NULL;
> +}
> +
> +static struct dev_cgroup_pool_state *pool_parent(struct dev_cgroup_pool=
_state *pool)
> +{
> +	if (!pool->resources[0].cnt.parent)
> +		return NULL;
> +
> +	return container_of(pool->resources[0].cnt.parent, typeof(*pool), reso=
urces[0].cnt);
> +}
> +
> +/**
> + * dev_cgroup_state_evict_valuable() - Check if we should evict from te=
st_pool
> + * @dev: &dev_cgroup_device
> + * @index: The index number of the region being tested.
> + * @limit_pool: The pool for which we hit limits
> + * @test_pool: The pool for which to test
> + * @ignore_low: Whether we have to respect low watermarks.
> + * @ret_hit_low: Pointer to whether it makes sense to consider low wate=
rmark.
> + *
> + * This function returns true if we can evict from @test_pool, false if=
 not.
> + * When returning false and @ignore_low is false, @ret_hit_low may
> + * be set to true to indicate this function can be retried with @ignore=
_low
> + * set to true.
> + *
> + * Return: bool
> + */
> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, int=
 index,
> +				     struct dev_cgroup_pool_state *limit_pool,
> +				     struct dev_cgroup_pool_state *test_pool,
> +				     bool ignore_low, bool *ret_hit_low)
> +{
> +	struct dev_cgroup_pool_state *pool =3D test_pool;
> +	struct page_counter *climit, *ctest;
> +	u64 used, min, low;
> +
> +	/* Can always evict from current pool, despite limits */
> +	if (limit_pool =3D=3D test_pool)
> +		return true;
> +
> +	if (limit_pool) {
> +		if (!parent_devcs(limit_pool->cs))
> +			return true;
> +
> +		for (pool =3D test_pool; pool && limit_pool !=3D pool; pool =3D pool_=
parent(pool))
> +			{}
> +
> +		if (!pool)
> +			return false;
> +	} else {
> +		/*
> +		 * If there is no cgroup limiting memory usage, use the root
> +		 * cgroup instead for limit calculations.
> +		 */
> +		for (limit_pool =3D test_pool; pool_parent(limit_pool); limit_pool =
=3D pool_parent(limit_pool))
> +			{}
> +	}
> +
> +	climit =3D &limit_pool->resources[index].cnt;
> +	ctest =3D &test_pool->resources[index].cnt;
> +
> +	page_counter_calculate_protection(climit, ctest, true);

I realized we can't do this. As the documentation for
page_counter_calculate_protection states:

> WARNING: This function is not stateless! It can only be used as part
>          of a top-down tree iteration, not for isolated queries.

I authored a fix with [1], though I'm not super happy with having to
iterate through the entire (sub-)hierarchy like this every time we
consider eviction. If anyone has a better idea, feel free to propose it.

This branch also contains another idea [2][3] I've been playing around
with. Essentially, what I'm trying to solve is TTM preferring to use
system memory over evicting VRAM, even if the new VRAM allocation would
be protected from eviction by low/min memory protection. In my testing,
it leads to a better experience to try evicting unprotected allocations
immediately in that case. I'm fine with this being follow-up work, but
given that the patchset is still in a rather early stage I thought I'd
pitch this now.

Thanks,
Friedrich

[1] https://gitlab.freedesktop.org/pixelcluster/linux/-/commit/1adc35adc2a=
7d05260275d69f139450c8af5dc3b
[2] https://gitlab.freedesktop.org/pixelcluster/linux/-/commit/3d2cdd25d62=
c539d80055d615bd0912e5907f639
[3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commit/54446cc696f=
b8b2cab27b3dcc992a6738f5392ad
