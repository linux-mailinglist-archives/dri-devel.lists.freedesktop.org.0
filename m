Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21827D2E3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 17:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1206E4E3;
	Tue, 29 Sep 2020 15:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68DC6E488;
 Tue, 29 Sep 2020 15:35:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCeEQgCpwFbMt9Ut7StnkqEJI88NmsYt6RWuL4M+qVaI4pf7RxVUEg4KFC+i5xFW1/qf3Qu7Tv6W96kbJMsRPE0+soaDdBLWMsRaFOPEmV7su1oZzmJoHJbq0U2yWEF/DS5fVsacZcI6dsUzqLOPtFPjt2TVpe+7jQJkq7Yws3Zp1Z5gytHKrYeOVo2Um1RkK1tI4Vrn/gm4PjBRY6tQwf5gFnqjZbua6B0N10eCiQFgkQRD2rdVU4tVGZOqn1hX4ZVIwChZS1i+VTz8smlqZi93YL2K4SZNbuZlLSn+hyAnR+/8oF63vvx4+aqrSi0dm25vmvR6PwNL8MvNo4mfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju9ytlC3PEvMSd+W5egJQ5uOSMVZssTWQs1Oko2De6k=;
 b=R+1ZyOp7wyj/h4ESpcP/kQtqLipiUru1S7EQKOK47H9S5Ua6UrX9sUSSkNObVUHHlKmCfpcbMLGrnTwPPSv2CBCmEgE0A49r4h15ktetjNY8ETWTuRp92DkGXdkTP86ogDvHKhpdWrL8qsOh6EDVizxEQmgSq7HeXtQvr74rfqDXEOJmDg9GemjaEI/spkYYZF1zQT9SkUPZYScph6vqvMrCE4OEmLGKx+MPXfqrqozzWB/G49KsPRb6bqECJkd1D1UNuXouAVUyg8+KNo7ySaNf1j/eKn7cBJK/7er3PA2lyyv3KwO+RSILBkIGnND0s7N7K7enq34cCTIO4vMyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju9ytlC3PEvMSd+W5egJQ5uOSMVZssTWQs1Oko2De6k=;
 b=x3ECmjA4MYmkpV7I+irD7C1GTLBGr4kBmeXoLiSae3yLyVVXBNqAiC+k568wj0Q/qbvc46KxCO5opfaB1GL8G/39fNOa7ykKmPePadgoC3UkrBqRcX/5KwaJNR1sS2S+xk/N5o7WjkI5RJg0+np+2uKnPOZJpEsm5z7tCrCDCFI=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 15:35:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 15:35:45 +0000
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
Date: Tue, 29 Sep 2020 17:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200929151437.19717-3-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.14 via Frontend Transport; Tue, 29 Sep 2020 15:35:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c529fcd8-bed7-4c69-b34a-08d8648d54bf
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38388DEAAA691518AF637C2883320@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3krDVIfFcjVTMVXvyeIOLttWbphZc92nAU+lVeWLNQuH655CyezATODFQee4nEtXFn+dSn5RYtOORxUKYpT+2lRX15kgiiCdizu68bOizZRxEsU/eLWS7x17rQKrIm3Lx+qILUgIDUowRxe/GWswYSzRG9sbYarbIqhidqcDBdXxbNJcftZGi9aCM8ZxmuuV1a7Bi/7s1W9x8m7XZjDiwvJR1s8vQmsVdDd55MNv5W7n9Hm5Xf0+5XfwzZq6vvxZyab+mkCeM+LevyfFqP1yFrOTCLVGIwg87aVc032azFmwS4+8gUay0i4j61/ILJeCW2JeOlSmxmo3/YrySRIjg8Iuzqq40jDT1miWc9m9a8uMsn+rZw1nzHBw4TkZeROEXueyyeThPd2vAhxE4wp+tT5GCC4REqfDp1FunBA0woKftm9455MIctl6SKaz+9Cm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(6666004)(7416002)(7406005)(36756003)(31696002)(478600001)(6486002)(5660300002)(66476007)(86362001)(4326008)(66556008)(66946007)(8676002)(2906002)(316002)(16526019)(186003)(83380400001)(52116002)(31686004)(8936002)(2616005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qs2y5/iFY6MylDTntvJqcHSPxxQNn9Pi6s89WySDm5nZZq9Zfi+hq3CzAuVv2QPTvNoXN/nfnYNjy2nCYdNRoC8PY+stTVMurzJFOuXE71e11pUhPfxvB89bvALgjodcuGoPpxAaTSP2RarCvvhJpQNMW9uuBbQ5afEtqCYJslQ/mr/1KMG5ZF8vwDu40BVvTzmX8o0wGAFQo6DmpGzS0zyV0EB3rEf4+JtUXZIiwWR8uTAi3DPDLKY+g/qQP+rDdM422SCOj+xbrAIYI/crymN7ZdGS5ueF929Lad4GjiV7JgHlM5yfY+FCOxRqQeSS84vHxPOM64FGpU3Qtu5fRyBDWY4wnoHUsN7occY4J/W+4JxfihZErcFZ3TheFhWlnLxWUnsvbmraoiN7WHKh4yuyFMtmuvmQ2AHs1QD9vmLTVZrKX6S0agt1oSsQPWj6brCe3WrqXF/6wDfn79Klvgaa7pVsh96B2Q9DmNPik0UG+BOA+OKoFYyfSk+Z5ts4FCcpKx9VIzqNwvNVF2RcAIB5TpnNbrqpvyjdCp10N/5dPvQpGNiHSejHfSUgHoeFsRd/2A8GJv8IikHqMtmqJ1t7c9jEE13GFFEDp85QktFpq1B8BrxZ7WxvUf0lou5r1cEAQzkSIGtC6HZI9dE92aeRJ311MeH8lmU5HCWtoJveJx54ic/+yiLJ9bIzi7QiQqWExwExPwW15LsUxhNZpg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c529fcd8-bed7-4c69-b34a-08d8648d54bf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 15:35:45.0829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVoMbhegp5DAxOASZ/64obyU3fjd+Qay3enQe2qZ7Ua1aIyoMW2Lj/SnVxZO58zs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> The new helper ttm_kmap_obj_to_dma_buf() extracts address and location
> from and instance of TTM's kmap_obj and initializes struct dma_buf_map
> with these values. Helpful for TTM-based drivers.

We could completely drop that if we use the same structure inside TTM as 
well.

Additional to that which driver is going to use this?

Regards,
Christian.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
>   include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
>   2 files changed, 44 insertions(+)
>
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index c96a25d571c8..62d89f05a801 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -34,6 +34,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_hashtab.h>
>   #include <drm/drm_vma_manager.h>
> +#include <linux/dma-buf-map.h>
>   #include <linux/kref.h>
>   #include <linux/list.h>
>   #include <linux/wait.h>
> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo_kmap_obj *map,
>   	return map->virtual;
>   }
>   
> +/**
> + * ttm_kmap_obj_to_dma_buf_map
> + *
> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> + * @map: Returns the mapping as struct dma_buf_map
> + *
> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the memory
> + * is not mapped, the returned mapping is initialized to NULL.
> + */
> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kmap_obj *kmap,
> +					       struct dma_buf_map *map)
> +{
> +	bool is_iomem;
> +	void *vaddr = ttm_kmap_obj_virtual(kmap, &is_iomem);
> +
> +	if (!vaddr)
> +		dma_buf_map_clear(map);
> +	else if (is_iomem)
> +		dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *)vaddr);
> +	else
> +		dma_buf_map_set_vaddr(map, vaddr);
> +}
> +
>   /**
>    * ttm_bo_kmap
>    *
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index fd1aba545fdf..2e8bbecb5091 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -45,6 +45,12 @@
>    *
>    *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>    *
> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> + *
> + * .. code-block:: c
> + *
> + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> + *
>    * Test if a mapping is valid with either dma_buf_map_is_set() or
>    * dma_buf_map_is_null().
>    *
> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
>   	map->is_iomem = false;
>   }
>   
> +/**
> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to an address in I/O memory
> + * @map:		The dma-buf mapping structure
> + * @vaddr_iomem:	An I/O-memory address
> + *
> + * Sets the address and the I/O-memory flag.
> + */
> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> +					       void __iomem *vaddr_iomem)
> +{
> +	map->vaddr_iomem = vaddr_iomem;
> +	map->is_iomem = true;
> +}
> +
>   /**
>    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
>    * @lhs:	The dma-buf mapping structure

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
