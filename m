Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30860243868
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 12:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465A96E991;
	Thu, 13 Aug 2020 10:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D196E1F1;
 Thu, 13 Aug 2020 10:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMpORAcxHMV0FafWYD6eC4FOaae1mauovmog7ytO5vCeawDkjCMa6SHtJ2uNayVq/nU+V7ooeuDoKZ7Pv7zPiQaHFmn9SmOYZIsK7z21udR4s5nNgypOIF3iUC1dxa6TZEgT0umw063u0L0sFahrIsu+5VFc1Q/G0MlxQKzvvHsPpG6zhaRvfRVXlWVN95aE18wvg9v+T4lvnHIEatGiQ5vnjtewze1cP0ff68UyKyv01/PKBZQRibBHpZESBAcjhB+BilFdJ4BpMVelmYENy4THxG2dNG5Ydvtcp13qR/Woz1RwvCzKsTQQ0gBSolYvgTYvYDWiDnRGPYvjz/prHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5d70p1z0+mYwE6LpqD+dNQRMQ7TFTm73C7W2adEQFM=;
 b=UqVOuXSqVrmfFthib79C/6Zda1TxkEruS7c6T0ggxC+qcb4Rkf+FmRhxbD8cgZTQ+uzfTVHcy3FZ0z3vq4X2mOBIvTE2eepcp3xkPUUi3lnO7BnrjwlpYS6dDAcc+k79ypHejvdIAp/sauO6WW92oUj9QbuJJMpTelUj+rDy6L3K1STfkcwrrrMh3E14n2Bj8QswgYQeB1yAN1MgShncNnf2TveHLosf1Xcoo/9roSw0VbAbsVbDYKxf3ARvPJzcP+zL0+NjGMxcsbclf+2dWsxJw1Ed/H+s2vleT7spogjd+hR3Vcjqpwe5ezwlMPBU2SXUJCSnz+1VzunLgNdm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5d70p1z0+mYwE6LpqD+dNQRMQ7TFTm73C7W2adEQFM=;
 b=VQQqDqt2BeYDO28/UWatoY2WtRArzgc0DX/ue1POaoXrBGGN2H7fY6567ZwWOWSnDgQBM2L0ormkenMSrR9m0HbVH2Oki2cosT/6rFhk/xWlST/gCOrYsFaLHyOnIsEgypYDpjXNjTdnyU7d6W0MayvJCPunF5QdJ3YBQBeYcJ0=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Thu, 13 Aug
 2020 10:23:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Thu, 13 Aug 2020
 10:23:11 +0000
Subject: Re: [PATCH 01/20] drm/amdgpu: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5c1b3cab-1898-46df-2c5c-23ab6cbfbb7a@amd.com>
Date: Thu, 13 Aug 2020 12:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200813083644.31711-2-tzimmermann@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0006.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0902CA0006.eurprd09.prod.outlook.com (2603:10a6:200:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Thu, 13 Aug 2020 10:22:59 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7da2b8ff-f250-4ef7-e07a-08d83f72e13b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB439126E18A24AA25323C27C483430@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HpXdaVQG6OTf3wHHtNUJPNnsExENvYkyT36bF/pujtCdwWu9Ysp1tN113hoF1oDauCb7KGOwPVIzJRdY4hmLaB0Cyn8Le/W7ZfPoUlDLbwZ1mDjEA+KlAMX04oKln5lufO8aRj9JF+f4mVFpoQYDwhc8zz5bpv13PCX20XM/OjFv9AAV3NtKmH9EhZzg0WAnVG3taA8TrNHQWsds18h1tjosBin5Dwo7i7gUo76G54UQQY3fiLW58hhR9BpBMCZFrJCbhq4uN5zL6cBY+PbkDd/lNJxkiYEur6DardRwZ1YDJGnafc7d+0gWxKiqUiA5H4+YkTqr1AiBxCCdTs5ptx4qg7IuTlxf9fots7rhwjuwnHCePhb6ghOJhbJeo0cdZAUfupWFs4N5Y7AxOrmiLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(31696002)(31686004)(8936002)(186003)(36756003)(8676002)(16526019)(83380400001)(4326008)(6666004)(478600001)(66476007)(66556008)(316002)(2616005)(86362001)(1191002)(6486002)(7366002)(52116002)(2906002)(5660300002)(7416002)(66946007)(7406005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vobiv4pdDBK5riRmjjAL5is/azUOXM9JojvNAXqJ3qpJn/9v56XKlLTTrulZIamhVAJAtnjPMRLqwOOMGpuVobaFrI3fOJ4Tq9JFtvXYBA9TN6ypfkTR0sHfYSCtjPd+PqBK03IXdRcjPJjtGYYuK9ILWlbIOQ79bnPhL6rNuMeSLKB+NoAabak/1SPxTirOie6rLr7jYWC5KxWT6Bow0UjYMAk0PtcoeKIj9wdzJ0twGJo9IjQi3A/Ih6zyDpNJMaQ5E9C2DAX5P+4aXY9ioRhsZipNpoqzJ1Bj27vTiKzqsyFM+GFYTfIA5DO4AxiTwTX6uAj62HOUoKyANW6AHhDf5fsmJ5FX6SqF3l0d4lWDZ9nTLk5+M4l88IY1BwXqp9cSUhJy1JegtoCJO9CjvEhxIx+FHgTCIgnzHxqfhmNMVKFetUX3P70oPJ5QseBzvEmxuZ3GApGqmo3B/8m6pEz5QChN4ZfacuoUrbfeQWDK/zmDPN8ptPgquBHqmTWx6KPmA7lsEN0OFbQm0T8rafdcDXznwcw+m0FUsvGC1U4dfuwjaHggS5XZXzOcmJ3bF4Z+BL37o1YtzZiPLhqYdE9dFWm2CGTnjaIxH0elisTvB+8Nkj2MF5I4KKfJ3Jg7xTgGqTC2gLn2CWPn7GBxdqR0NdTdMgX1Ej4WbiB79+7JmLqFxAIvTNBUUmIX7dzgyBDsTj3nZfx4CUzEOpxOAw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da2b8ff-f250-4ef7-e07a-08d83f72e13b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 10:23:11.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rZeJdjgRJ8PWC+bhaeYlETIRMrt0Vlxtm9XtafckKw05MJ93DurLF2aMG/y6o3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.08.20 um 10:36 schrieb Thomas Zimmermann:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 81a79760ca61..51525b8774c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1468,19 +1468,13 @@ static struct drm_driver kms_driver = {
>   	.lastclose = amdgpu_driver_lastclose_kms,
>   	.irq_handler = amdgpu_irq_handler,
>   	.ioctls = amdgpu_ioctls_kms,
> -	.gem_free_object_unlocked = amdgpu_gem_object_free,
> -	.gem_open_object = amdgpu_gem_object_open,
> -	.gem_close_object = amdgpu_gem_object_close,
>   	.dumb_create = amdgpu_mode_dumb_create,
>   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
>   	.fops = &amdgpu_driver_kms_fops,
>   
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = amdgpu_gem_prime_export,
>   	.gem_prime_import = amdgpu_gem_prime_import,
> -	.gem_prime_vmap = amdgpu_gem_prime_vmap,
> -	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
>   	.gem_prime_mmap = amdgpu_gem_prime_mmap,
>   
>   	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 43f4966331dd..ca2b79f94e99 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -36,6 +36,7 @@
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_cache.h>
>   #include "amdgpu.h"
> +#include "amdgpu_dma_buf.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
>   
> @@ -510,6 +511,15 @@ bool amdgpu_bo_support_uswc(u64 bo_flags)
>   #endif
>   }
>   
> +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
> +	.free = amdgpu_gem_object_free,
> +	.open = amdgpu_gem_object_open,
> +	.close = amdgpu_gem_object_close,
> +	.export = amdgpu_gem_prime_export,
> +	.vmap = amdgpu_gem_prime_vmap,
> +	.vunmap = amdgpu_gem_prime_vunmap,
> +};
> +

Wrong file, this belongs into amdgpu_gem.c

>   static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   			       struct amdgpu_bo_param *bp,
>   			       struct amdgpu_bo **bo_ptr)
> @@ -552,6 +562,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   	bo = kzalloc(sizeof(struct amdgpu_bo), GFP_KERNEL);
>   	if (bo == NULL)
>   		return -ENOMEM;
> +
> +	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;

And this should probably go into amdgpu_gem_object_create().

Apart from that looks like a good idea to me.

Christian.

>   	drm_gem_private_object_init(adev->ddev, &bo->tbo.base, size);
>   	INIT_LIST_HEAD(&bo->shadow_list);
>   	bo->vm_bo = NULL;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
