Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5EF26A8C5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B926E884;
	Tue, 15 Sep 2020 15:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939276E0E2;
 Tue, 15 Sep 2020 15:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNyu3se6nj5CdwqB2Ba5/f3rzi1dpALcbMnf7q4gC/qnEj7CVxLG0CQvjgBxZJKL0CKLezMPElHJa1EW43BmLYkr7c/XvCsVjIevV8RrVVtwVM7FuMaqw5u02u+OZLw0aNaBR5KDjcQMYtW13NxhoxJ2CXiUJs8jZXapZ2WFa0xOfLWCI2GxhG7bwKGOLIbfewdda24lu0kAwuss1AvVQtwAyiO3ZF+E2naJHzlkdSiIwR23QxY10jotW1pfjxq7R2akBUNZEy26Qm0l0HZG7b1rF/W3DkmppeDdJKQpfOxhba0DnSHf1P3+kM2zx61kZkImkeRwLq/CmE1REHJZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN4LXhsMN/CwF8Z3fqwL1YBenN/Iqkt5Gd+NvDDo/s4=;
 b=RGoUt2FwJ+nPaI6aTs+uwZzDFMXe/QxIEUnYpJSIatpp8plt+FcScZLBn+lnOfq9oXFSNrpVLM7Wc5N8j5VSN+owUwiaaE7EX4hq2Aje8D985hw2u/b/Qz+nMEFq0uAXchKG6YeZKKodY9YSJeVY2FnPPpnYoxxUGA9a5w/tTeVUvdpn6hpgxB1VQvYKKgmf+QReMItq3uQRt6pMH/iBSmgv0o2dyjUlv0Ph1lRKjq5ltymrxfsq5JQamVKlxr8UhK9THey5YjwV6fBGG8EtWUKTnq6MH8cov8E9y9GIr8X+PG3sojxJhfDpjJG5FDEyOwcM3G7Wq18hwlcbdwIAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN4LXhsMN/CwF8Z3fqwL1YBenN/Iqkt5Gd+NvDDo/s4=;
 b=2TKpXBO1kaOmOlL5BbbKKYUwkHs3+SRgzEIHSu2lYIOUwrjgoLsarsaTGHkbA5KRb2TaDe8qsbZJYx82KRslzcZ5g/tlbfLAH8R4TIvvq8IaqFnRcCcL3YFzO8M9MlE7MyacTGaIZ1pZz5Ai2Xl793j+9iolnhRLeUkZrrNq1qs=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 15:25:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 15:25:41 +0000
Subject: Re: [PATCH v2 00/21] Convert all remaining drivers to GEM object
 functions
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
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
References: <20200915145958.19993-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b527fde4-b456-6683-4a9e-0f7dcf1525be@amd.com>
Date: Tue, 15 Sep 2020 17:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.9 via Frontend Transport; Tue, 15 Sep 2020 15:25:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c40dd76-f213-4adf-5db9-08d8598b9a92
X-MS-TrafficTypeDiagnostic: MN2PR12MB3679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367978B9C270066D448D8B2383200@MN2PR12MB3679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bq6iy9bdQwcv25HsoU+7zOgpdOsz9268Kepixksd+89M4pAGYvL2U00gir/fXpn79u2mpaOj3Ztv+B9CpTIw9h3qqfj52LnFvapiNawzK6Azx2R/1eHC+PJR0vpWlnnncCMfTyc8yg5UU7MsqoZqSnaNL+dgVFShuhN+VeHZp9URoa7Q5Zvs4yiLRLyB/oQrXmGSgvgDODrkqkUQS3jaQ01ax8JEAxZ2GByQF2q59FZ6kjUIgUHePow2DMmheD5MBZ5KZd6QCHvcOztJGkqzWXc/tNU6f9iIMsFcq31rFcSS35wR3BsAo4aOBbwbO2Ktt3iDKImkfyuvGs9vcGaX3U0HJV4N0NfueRSgOSut6Gndb9gmQ8V9koBc+Iuy3ehQV23I94+wH59fPWkG5DOwDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(8936002)(2906002)(186003)(86362001)(6486002)(16526019)(31696002)(478600001)(31686004)(36756003)(316002)(83380400001)(6666004)(4326008)(1191002)(66476007)(7406005)(5660300002)(2616005)(66946007)(7416002)(8676002)(66556008)(7366002)(52116002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: jgFurlY0qyhWsliElO8ws55Sd+CZT5oiKQ5+9yJlBKp5v33Gqa/MTH091WNx8kNqPD9e7/RpesjeJgk+Pz2x1dWiBhH7GVo1xSJsvqcoLJrCBMZbyWn8NNsHxo/qk+3GlCWKvqQz92Vkg16oiNjVfUGYVMp085ZL2yOoLBJRvBIXvkkmQgzxw5DQi0K0B2sWEKvs8zsrnohmXg/VKGcm9F5eSW+OaPaR4pLYvh37Us1NKPjcXGmiM0oJs7H8rUbVq9vzyvzFN2G1bRHlK4Bajsxa+/vdF3BmZqIfQ+mMSaVwKmvkaq82WgEosVWpLjCRHyn2b+AmuL+RPKhJSxLpojrOt2b6A7rzDtD/1unvl9hiO1LpEOfkEXtRM3W6jVSekgWbYQPU9M6eGR1XBSPvfQ4R19pTPotiryvtvAjnC+Txv5TaJG+M/FLzV085CHI51EBABE72/3WBVcqKeoLeT/GdGRxoS+xEEno1h3NcpdScW3ty04Cb56erF4fxL9E2igpaVBjp7aaLgCx0+Mpa4tCaLPFOEle/bCmX27J/dr2MusMMHnNt56Q8c/f8hiBMH3wnAqIi+KI9YX5sJ6sqx9pIl7F2BocctuWA3YLRufoovVknCmbVgGxoLHG+RAmEMNT/UwsxaBffLhaWeujD2R7cQtRWTyhY+k1Bg21E5e85AbUw4sdJ/MLcO98kXpJf0VGvMuLyHUkcKebRv1vTCg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c40dd76-f213-4adf-5db9-08d8598b9a92
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 15:25:40.7761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFw3xZeIByu8QMQSyCPTzQs9gUitereUl70S9WrhOTsl4SQkqE38/cz4fLDGQS3s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
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

Added my rb to the amdgpu and radeon patches.

Should we pick those up through the amd branches or do you want to push 
everything to drm-misc-next?

I think the later since this should result in much merge clash.

Christian.

Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
> The GEM and PRIME related callbacks in struct drm_driver are deprecated in
> favor of GEM object functions in struct drm_gem_object_funcs. This patchset
> converts the remaining drivers to object functions and removes most of the
> obsolete interfaces.
>
> Patches #1 to #16 and #18 to #19 convert DRM drivers to GEM object functions,
> one by one. Each patch moves existing callbacks from struct drm_driver to an
> instance of struct drm_gem_object_funcs, and sets these funcs when the GEM
> object is initialized. The expection is .gem_prime_mmap. There are different
> ways of how drivers implement the callback, and moving it to GEM object
> functions requires a closer review for each.
>
> Patch #17 fixes virtgpu to use GEM object functions where possible. The
> driver recently introduced a function for one of the deprecated callbacks.
>
> Patch #20 converts xlnx to CMA helper macros. There's no apparent reason
> why the driver does the GEM setup on it's own. Using CMA helper macros
> adds GEM object functions implicitly.
>
> With most of the GEM and PRIME moved to GEM object functions, related code
> in struct drm_driver and in the DRM core/helpers is being removed by patch
> #21.
>
> Further testing is welcome. I tested the drivers for which I have HW
> available. These are gma500, i915, nouveau, radeon and vc4. The console,
> Weston and Xorg apparently work with the patches applied.
>
> v2:
> 	* moved code in amdgpu and radeon
> 	* made several functions static in various drivers
> 	* updated TODO-list item
> 	* fix virtgpu
>
> Thomas Zimmermann (21):
>    drm/amdgpu: Introduce GEM object functions
>    drm/armada: Introduce GEM object functions
>    drm/etnaviv: Introduce GEM object functions
>    drm/exynos: Introduce GEM object functions
>    drm/gma500: Introduce GEM object functions
>    drm/i915: Introduce GEM object functions
>    drm/mediatek: Introduce GEM object functions
>    drm/msm: Introduce GEM object funcs
>    drm/nouveau: Introduce GEM object functions
>    drm/omapdrm: Introduce GEM object functions
>    drm/pl111: Introduce GEM object functions
>    drm/radeon: Introduce GEM object functions
>    drm/rockchip: Convert to drm_gem_object_funcs
>    drm/tegra: Introduce GEM object functions
>    drm/vc4: Introduce GEM object functions
>    drm/vgem: Introduce GEM object functions
>    drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
>    drm/vkms: Introduce GEM object functions
>    drm/xen: Introduce GEM object functions
>    drm/xlnx: Initialize DRM driver instance with CMA helper macro
>    drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
>
>   Documentation/gpu/todo.rst                    |  7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 23 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h       |  5 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  1 +
>   drivers/gpu/drm/armada/armada_drv.c           |  3 -
>   drivers/gpu/drm/armada/armada_gem.c           | 12 ++-
>   drivers/gpu/drm/armada/armada_gem.h           |  2 -
>   drivers/gpu/drm/drm_gem.c                     | 35 ++------
>   drivers/gpu/drm/drm_gem_cma_helper.c          |  6 +-
>   drivers/gpu/drm/drm_prime.c                   | 17 ++--
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 13 ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 19 ++++-
>   drivers/gpu/drm/exynos/exynos_drm_drv.c       | 10 ---
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++
>   drivers/gpu/drm/gma500/framebuffer.c          |  2 +
>   drivers/gpu/drm/gma500/gem.c                  | 18 +++-
>   drivers/gpu/drm/gma500/gem.h                  |  3 +
>   drivers/gpu/drm/gma500/psb_drv.c              |  9 --
>   drivers/gpu/drm/gma500/psb_drv.h              |  2 -
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 -
>   drivers/gpu/drm/i915/i915_drv.c               |  4 -
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 --
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 11 +++
>   drivers/gpu/drm/msm/msm_drv.c                 | 13 ---
>   drivers/gpu/drm/msm/msm_drv.h                 |  1 -
>   drivers/gpu/drm/msm/msm_gem.c                 | 19 ++++-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 --
>   drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 +++
>   drivers/gpu/drm/nouveau/nouveau_gem.h         |  2 +
>   drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +
>   drivers/gpu/drm/omapdrm/omap_drv.c            |  9 --
>   drivers/gpu/drm/omapdrm/omap_gem.c            | 18 +++-
>   drivers/gpu/drm/omapdrm/omap_gem.h            |  2 -
>   drivers/gpu/drm/pl111/pl111_drv.c             |  5 +-
>   drivers/gpu/drm/radeon/radeon_drv.c           | 23 +----
>   drivers/gpu/drm/radeon/radeon_gem.c           | 31 ++++++-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  5 --
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 10 +++
>   drivers/gpu/drm/tegra/drm.c                   |  4 -
>   drivers/gpu/drm/tegra/gem.c                   |  8 ++
>   drivers/gpu/drm/vc4/vc4_bo.c                  | 21 ++++-
>   drivers/gpu/drm/vc4/vc4_drv.c                 | 12 ---
>   drivers/gpu/drm/vc4/vc4_drv.h                 |  1 -
>   drivers/gpu/drm/vgem/vgem_drv.c               | 21 +++--
>   drivers/gpu/drm/virtio/virtgpu_drv.c          |  1 -
>   drivers/gpu/drm/virtio/virtgpu_object.c       |  1 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  8 --
>   drivers/gpu/drm/vkms/vkms_gem.c               | 13 +++
>   drivers/gpu/drm/xen/xen_drm_front.c           | 44 ++++------
>   drivers/gpu/drm/xen/xen_drm_front.h           |  2 +
>   drivers/gpu/drm/xen/xen_drm_front_gem.c       | 15 ++++
>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 14 +--
>   include/drm/drm_drv.h                         | 85 +------------------
>   57 files changed, 319 insertions(+), 349 deletions(-)
>
> --
> 2.28.0
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
