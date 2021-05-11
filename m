Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6837A0E6
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 09:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E0A6E9DF;
	Tue, 11 May 2021 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A836E9DD;
 Tue, 11 May 2021 07:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIJEm2yoZMZ3XHFTxYqz8+ND/d8akxmsGrSiMnyeY+FzKojmP2+Ov0T37vf2Gf8VeuW3K93ck3E821CRZdGyj85nxi+yGMSnS01S8SBRJeVBXeOPm5COhUcDR/8mXTaYv9XP73Np7YeRHMBCNX7mPInccb995O3vH5Wd5GBjZHSSTsEQfKhv6KtHqTDrnpTJFupLr9uOnvOOy71H2SkHY6EsGuiNIEjRLkDqlBpSyqY7MwwMWtww7Op26lIAoZj274IoE+FTJDCqv6NwB+2sQPTBbNvV01oxIhEiesQO4yCxOucVpXIadOOTrVqoZ3bHH3aCivxJqHuF7i1Cglua7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWQYCIUXZIophVmH6COICMBbiguR7/KkY2O3nw67tdE=;
 b=FlfBh8BX38l5h48bfeyieFzV/V0WQbTSWF93g1BBLAwkQqX6FsBBCxVHC5V07A0prtmplCmC0IwMYiTqaTxizrbxZgYZhLWqrh21ZddiTmXlQ5qVXYW+lhhzomOHCQjp+De89hnBDsP3p0fda2ipRmVps8DvCNEX+SlhmyZPkxAG1ORPSiOeoOHtxACRasht/5VezUGiH5648OIOMq9iFpl3KNtcM0A4vAdYzV6Y7sVr4C8PUV5H1NVFslnNzoiqxO3k+OxqRbcrEK3SpMuXWOvmB3k3GsT/CctQ9/8VCubMpCzichyc87Ky/bT1N00WFBrS0aPfkuQpfKtBClkfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWQYCIUXZIophVmH6COICMBbiguR7/KkY2O3nw67tdE=;
 b=U3evGhHGOpexRVRDTVCptFDLf+G7htu8peDr3MAVG1Bca8KUjP++XIniPlLKLW0TVHpROTrSnECyvo+oU9HYpnsPMMSrLpKt2u25jvHHBFqR5zf1WRUxAJ8wCwuBOFNCorm0iC8W6Kv3zO+6XC17CIrBBBxA7vqDsitH/cTj6K4=
Authentication-Results: lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 07:35:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 07:35:28 +0000
Subject: Re: [PATCH] drm/ttm: use dma_alloc_pages for the page pool
To: Christoph Hellwig <hch@lst.de>, Huang Rui <ray.huang@amd.com>
References: <20210511060514.3956745-1-hch@lst.de>
 <20210511060514.3956745-2-hch@lst.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d2a72848-8273-d0b6-0250-3fe88122246a@amd.com>
Date: Tue, 11 May 2021 09:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210511060514.3956745-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c3ab:ee01:d547:2c4e]
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c3ab:ee01:d547:2c4e]
 (2a02:908:1252:fb60:c3ab:ee01:d547:2c4e) by
 FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.20 via Frontend Transport; Tue, 11 May 2021 07:35:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4037da95-8951-4db5-24e4-08d9144f5931
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440E5FBD262B519AFC6906483539@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Odqj/jfDT5TOVgLqObndv3+WO04BV08fvSdH2OPR5CgMdvLIA6Fd2LA1J31/wJecf5VM6PhOzPYg8xuTv8baH+0g+Q9/Rm+eOfURKibM2It6oLCkIIs/fdMBkYbz3dV1+4dcwWPmD5Zs+siYP7k/mhHasBhyFkD6BMMY/3zBk0fWAMd7v9ZG5seyjNkWNTHqtKzD/5C3GSGWSUfR4oC3YoS26gP76wUOTicufBY1cODkLsKBBJWYszYCOdZ50uDFFqstwau9+w5P8glS/G7pK3Sl7s4za3U6mM79doTu9S2PyievLNzgAl6YkFzNrdJXvfVnLfQz0xO3KWqGMONgm/X/DtgvLH+UKbNw9jCeQi+o3eKxaTY7VXj9rD52mCTWFaBbD7VbKzdk+HCo3F/MESoea3KaAcfx0QZnOjIz38JmOAL1IqvmH45BD4Ro5oi9lW9pIxTSDkBNbHfmdGpAC/SAUtS+7ZQNzSjcQXSc9o8ahWzK4Jw+XyIWfcWomMlt6aBAWraVS9jf1eyr6w4d7B2XeJV7vaLaZO+ALLaM6uWRBkedgGrWr+B1U7jAfkWTuzboD3eeQILfXCfvveDcvAiE9YPpcKV345L5LerD1drvU1pk1hr1uyozyuD2a64QYwLUAkDvAk9wZIXieos/PZFF0lSmfx36ms/PDNMXnSS4C/4r0nIuBfIwXnyO60Bu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(66476007)(2906002)(6636002)(8676002)(36756003)(6666004)(8936002)(52116002)(83380400001)(66556008)(31686004)(31696002)(38100700002)(16526019)(5660300002)(186003)(86362001)(6486002)(30864003)(2616005)(66946007)(110136005)(54906003)(478600001)(316002)(7416002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWQ3WjZQUnhkMXNWMXIycmIvMnhIOHQrendTV2NuZHl5T05CbTJCMkFvYUpW?=
 =?utf-8?B?R056bTJXeC9uaFBlMFhySmh0MzBQS1hLcE1Rb1p4TFk3MnRodzc0QjVOODYx?=
 =?utf-8?B?UGhWMFl2bzNXaW14Zld0bU53bHdIeWY4TU1pb2NkWE0vL3hIazYzVnVZZ3Bm?=
 =?utf-8?B?NS80emg4R1JFQThOZ0EzM3BwaXNkM0Frb2pUZ0hzVkFOempVMExkV0FrSUNk?=
 =?utf-8?B?cDdxVmFrQTVraVdjV2lBNjNScWdRODBuSDY2RENlbXVWRTNqMWFxQVBlNnJV?=
 =?utf-8?B?bUhUc0Z1TmJPUm5IUzhkVVdYR0l5TGsxdVpYWW5qY1hhTHdKZUx3MlVndGlT?=
 =?utf-8?B?VjQ1b0JURWpwb1pxRTVOTncvREtCWWJpdTVRYURTaDlUaXV6aFlRaTA2MWJv?=
 =?utf-8?B?NldMOExIYmdycnIyWGwrQnJnak5WTWtmd2FJU0ZXdFM2VVZ2cHdNTlhmQTVM?=
 =?utf-8?B?bWVlSGxYOUtWUGtmdmZZNldyYjQybnVKVm80V3pkS3NiVVV6bVIwWFBJQ1pU?=
 =?utf-8?B?NjB0Ri82cXI0ckZXWG9FQkI3VElhU0dVU2lpUmtNM2ROYmF2NE1hQTVDWkFj?=
 =?utf-8?B?azFjK0FncnpOUlVNNW9qWmkzanFhazlWazdGRGtVSVdJNS9GVzJObG5BYjlD?=
 =?utf-8?B?bjVidm1MTlI3SndNWmlLRjZ0SXFWTUh5cDJjTTdLWHNEcVZmb3Eyd1JGN1FZ?=
 =?utf-8?B?M29nNnRZUWwyWUJQN29MYjlBVVVJbnVWRi9lMFV2OUdDdlYxdmZqOVF1Q3dE?=
 =?utf-8?B?QkJ2bTVrcHpublhNNjJOQ05ieWt5ckNkOWUwVHNSWGNZNWticzg1NTJXTXox?=
 =?utf-8?B?TGlkT0NOSHJodnZzL1g5TXVEME1YVU5pZG1YbG9Dbi9SdUFRNHcrTVB0RnF1?=
 =?utf-8?B?L3ZZd3RPUGFpbXVjRDB0VTJISWNSaUF1aXd6SlpUdTBuSTk2eUd1SjVGYWhD?=
 =?utf-8?B?RlJzeGpsTGR2RnlzN3NOM28yMzI1NGo2OW95QzNqUlVhem9WSVNmK2srSmt0?=
 =?utf-8?B?WmJvNkQ5YUFpd3dFSVNLcW5zVmhHSENFWi9EUEVkUURHVm9uUmhFRzdpR1l2?=
 =?utf-8?B?Sjl4MW81VHdNOWsyb0JJTzlVb00vUEFWV3RSeEZ1NFNvOFBWU0x6Yk4ycXUx?=
 =?utf-8?B?WFNXSVFTUmdvdnYvZjllWU8xODdDYU12cXkzaDM1SjIvZGZqNVRPSFRyRnUy?=
 =?utf-8?B?V2FiZnVPYkhHOFNoQysrcTQrVTFQdWM5eFpXMkk1bTFPYnpERXNkb08wb3JI?=
 =?utf-8?B?L1Iva1NZcXV6TEl0ak9zbU5BRlB0NCt6RCs2S0JYdlJKTWVRWGU3aWhHWm5T?=
 =?utf-8?B?K0E5aHJCbU1zS3Q4SGxVQ1pjamhyWEc0NTg1Z1Q2emI1c0hyYzBwblRQcWJr?=
 =?utf-8?B?NDZHaExQeVQzd0lJZnJGSENiSko0aUNUdlVVZkczZkFQMDJkNytuaWF3YWZ6?=
 =?utf-8?B?NXVFWXUzZUcyR0RTaXo1K09Tc3R3ajFEVGlYdFlsWjlza2R5WWxqUWFWbjB6?=
 =?utf-8?B?VVgxVTE3RmdqcFhjZzhpNFNDV1ZadUlUMUNuM3dRZENpeEJWY2l6NCtqV1JD?=
 =?utf-8?B?RW9nWHlNamJ3cFpFeFR5TzhSaS85YW1tTTBYcE4rc2k2dHhPNEZNbWlnNWRE?=
 =?utf-8?B?dEt0NjBrOTRxMmN4TW5KMFg2TVd3V3ZCWW5TMnc1elE2WEQ4NmlhNG9TWkdQ?=
 =?utf-8?B?VFJTZTlRWXBxa2JSV2I2L2REMDJXRmhHbHB3Y0ZZVVhjTUlxSXdBbTNlVldh?=
 =?utf-8?B?SUVnaTd5SCtpbzZvVzArM3AwVHFpTjBUVkNVN2xGVU9DQTNrRlJmcmlZZUp5?=
 =?utf-8?B?K3l5d05EWHBPNTZPYjlJWU1xV1NaUEtaUDU0ZDFreGF2UXJDTWtJTVQvd3ox?=
 =?utf-8?Q?Dn7w8ptz8vqu2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4037da95-8951-4db5-24e4-08d9144f5931
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 07:35:28.4958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRu115o0vQVZRYM6L28HkJ1KKdxKHNHPrZkp31YUIC/UjguFYbJ+hkc72Sb5mWXI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.21 um 08:05 schrieb Christoph Hellwig:
> Use the dma_alloc_pages allocator for the TTM pool allocator.
> This allocator is a front end to the page allocator which takes the
> DMA mask of the device into account, thus offering the best of both
> worlds of the two existing allocator versions.  This conversion also
> removes the ugly layering violation where the TTM pool assumes what
> kind of virtual address dma_alloc_attrs can return.

Oh yes please. But please split that up into multiple patches.

At least one switching from dma_alloc_attrs() to dma_alloc_pages() 
separately.

We certainly going to need the drm_need_swiotlb() for userptr support 
(unless we add some approach for drivers to opt out of swiotlb).

Then while I really want to get rid of GFP_DMA32 as well I'm not 100% 
sure if we can handle this without the flag.

And last we need something better to store the DMA address and order 
than allocating a separate memory object for each page.

Christian.

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   4 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c   |   1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c   |   1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   |   1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   |   1 -
>   drivers/gpu/drm/drm_cache.c             |  31 -----
>   drivers/gpu/drm/drm_gem_vram_helper.c   |   3 +-
>   drivers/gpu/drm/nouveau/nouveau_ttm.c   |   8 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c           |   3 +-
>   drivers/gpu/drm/radeon/radeon.h         |   1 -
>   drivers/gpu/drm/radeon/radeon_device.c  |   1 -
>   drivers/gpu/drm/radeon/radeon_ttm.c     |   4 +-
>   drivers/gpu/drm/ttm/ttm_device.c        |   7 +-
>   drivers/gpu/drm/ttm/ttm_pool.c          | 178 ++++--------------------
>   drivers/gpu/drm/ttm/ttm_tt.c            |  25 +---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |   4 +-
>   include/drm/drm_cache.h                 |   1 -
>   include/drm/ttm/ttm_device.h            |   3 +-
>   include/drm/ttm/ttm_pool.h              |   9 +-
>   20 files changed, 41 insertions(+), 246 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index dc3a69296321b3..5f40527eeef1ff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -819,7 +819,6 @@ struct amdgpu_device {
>   	int				usec_timeout;
>   	const struct amdgpu_asic_funcs	*asic_funcs;
>   	bool				shutdown;
> -	bool				need_swiotlb;
>   	bool				accel_working;
>   	struct notifier_block		acpi_nb;
>   	struct amdgpu_i2c_chan		*i2c_bus[AMDGPU_MAX_I2C_BUS];
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3bef0432cac2f7..9bf17b44cba6fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1705,9 +1705,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>   	/* No others user of address space so set it to 0 */
>   	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
>   			       adev_to_drm(adev)->anon_inode->i_mapping,
> -			       adev_to_drm(adev)->vma_offset_manager,
> -			       adev->need_swiotlb,
> -			       dma_addressing_limited(adev->dev));
> +			       adev_to_drm(adev)->vma_offset_manager);
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> index 405d6ad09022ca..2d4fa754513033 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -846,7 +846,6 @@ static int gmc_v6_0_sw_init(void *handle)
>   		dev_warn(adev->dev, "No suitable DMA available.\n");
>   		return r;
>   	}
> -	adev->need_swiotlb = drm_need_swiotlb(44);
>   
>   	r = gmc_v6_0_init_microcode(adev);
>   	if (r) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index 210ada2289ec9c..a504db24f4c2a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -1025,7 +1025,6 @@ static int gmc_v7_0_sw_init(void *handle)
>   		pr_warn("No suitable DMA available\n");
>   		return r;
>   	}
> -	adev->need_swiotlb = drm_need_swiotlb(40);
>   
>   	r = gmc_v7_0_init_microcode(adev);
>   	if (r) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index e4f27b3f28fb58..42e7b1eb84b3bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1141,7 +1141,6 @@ static int gmc_v8_0_sw_init(void *handle)
>   		pr_warn("No suitable DMA available\n");
>   		return r;
>   	}
> -	adev->need_swiotlb = drm_need_swiotlb(40);
>   
>   	r = gmc_v8_0_init_microcode(adev);
>   	if (r) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 455bb91060d0bc..f74784b3423740 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1548,7 +1548,6 @@ static int gmc_v9_0_sw_init(void *handle)
>   		printk(KERN_WARNING "amdgpu: No suitable DMA available.\n");
>   		return r;
>   	}
> -	adev->need_swiotlb = drm_need_swiotlb(44);
>   
>   	if (adev->gmc.xgmi.supported) {
>   		r = adev->gfxhub.funcs->get_xgmi_info(adev);
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 79a50ef1250fd1..7e6eb4b33d0069 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -178,34 +178,3 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>   #endif
>   }
>   EXPORT_SYMBOL(drm_clflush_virt_range);
> -
> -bool drm_need_swiotlb(int dma_bits)
> -{
> -	struct resource *tmp;
> -	resource_size_t max_iomem = 0;
> -
> -	/*
> -	 * Xen paravirtual hosts require swiotlb regardless of requested dma
> -	 * transfer size.
> -	 *
> -	 * NOTE: Really, what it requires is use of the dma_alloc_coherent
> -	 *       allocator used in ttm_dma_populate() instead of
> -	 *       ttm_populate_and_map_pages(), which bounce buffers so much in
> -	 *       Xen it leads to swiotlb buffer exhaustion.
> -	 */
> -	if (xen_pv_domain())
> -		return true;
> -
> -	/*
> -	 * Enforce dma_alloc_coherent when memory encryption is active as well
> -	 * for the same reasons as for Xen paravirtual hosts.
> -	 */
> -	if (mem_encrypt_active())
> -		return true;
> -
> -	for (tmp = iomem_resource.child; tmp; tmp = tmp->sibling)
> -		max_iomem = max(max_iomem,  tmp->end);
> -
> -	return max_iomem > ((u64)1 << dma_bits);
> -}
> -EXPORT_SYMBOL(drm_need_swiotlb);
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 2b7c3a07956d59..6ce93d2d84d0e9 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1034,8 +1034,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
>   
>   	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
>   				 dev->anon_inode->i_mapping,
> -				 dev->vma_offset_manager,
> -				 false, true);
> +				 dev->vma_offset_manager);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index e8b506a6685b56..4876a637933980 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -285,7 +285,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>   	struct nvkm_pci *pci = device->pci;
>   	struct nvif_mmu *mmu = &drm->client.mmu;
>   	struct drm_device *dev = drm->dev;
> -	bool need_swiotlb = false;
>   	int typei, ret;
>   
>   	ret = nouveau_ttm_init_host(drm, 0);
> @@ -320,14 +319,9 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>   		drm->agp.cma = pci->agp.cma;
>   	}
>   
> -#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
> -	need_swiotlb = is_swiotlb_active();
> -#endif
> -
>   	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
>   				  dev->anon_inode->i_mapping,
> -				  dev->vma_offset_manager, need_swiotlb,
> -				  drm->client.mmu.dmabits <= 32);
> +				  dev->vma_offset_manager);
>   	if (ret) {
>   		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
>   		return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 47afe95d04a1a7..823eb562ba3d53 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -186,8 +186,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
>   	/* No others user of address space so set it to 0 */
>   	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
>   			    qdev->ddev.anon_inode->i_mapping,
> -			    qdev->ddev.vma_offset_manager,
> -			    false, false);
> +			    qdev->ddev.vma_offset_manager);
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 42281fce552e6e..7d41302c55886d 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2379,7 +2379,6 @@ struct radeon_device {
>   	struct radeon_wb		wb;
>   	struct radeon_dummy_page	dummy_page;
>   	bool				shutdown;
> -	bool				need_swiotlb;
>   	bool				accel_working;
>   	bool				fastfb_working; /* IGP feature*/
>   	bool				needs_reset, in_reset;
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index cc445c4cba2e3d..3efdb5fb55ad57 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1385,7 +1385,6 @@ int radeon_device_init(struct radeon_device *rdev,
>   		pr_warn("radeon: No suitable DMA available\n");
>   		return r;
>   	}
> -	rdev->need_swiotlb = drm_need_swiotlb(dma_bits);
>   
>   	/* Registers mapping */
>   	/* TODO: block userspace mapping of io register */
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 380b3007fd0b0d..28334f86eaa24a 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -717,9 +717,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
>   	/* No others user of address space so set it to 0 */
>   	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
>   			       rdev->ddev->anon_inode->i_mapping,
> -			       rdev->ddev->vma_offset_manager,
> -			       rdev->need_swiotlb,
> -			       dma_addressing_limited(&rdev->pdev->dev));
> +			       rdev->ddev->vma_offset_manager);
>   	if (r) {
>   		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>   		return r;
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 510e3e001dabe0..289aab652486ef 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -198,8 +198,6 @@ static void ttm_device_delayed_workqueue(struct work_struct *work)
>    * @dev: The core kernel device pointer for DMA mappings and allocations.
>    * @mapping: The address space to use for this bo.
>    * @vma_manager: A pointer to a vma manager.
> - * @use_dma_alloc: If coherent DMA allocation API should be used.
> - * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
>    *
>    * Initializes a struct ttm_device:
>    * Returns:
> @@ -207,8 +205,7 @@ static void ttm_device_delayed_workqueue(struct work_struct *work)
>    */
>   int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   		    struct device *dev, struct address_space *mapping,
> -		    struct drm_vma_offset_manager *vma_manager,
> -		    bool use_dma_alloc, bool use_dma32)
> +		    struct drm_vma_offset_manager *vma_manager)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	int ret;
> @@ -223,7 +220,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	bdev->funcs = funcs;
>   
>   	ttm_init_sysman(bdev);
> -	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> +	ttm_pool_init(&bdev->pool, dev);
>   
>   	bdev->vma_manager = vma_manager;
>   	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index cb38b1a17b0985..51b6585e54470c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -50,11 +50,10 @@
>    * struct ttm_pool_dma - Helper object for coherent DMA mappings
>    *
>    * @addr: original DMA address returned for the mapping
> - * @vaddr: original vaddr return for the mapping and order in the lower bits
>    */
>   struct ttm_pool_dma {
>   	dma_addr_t addr;
> -	unsigned long vaddr;
> +	unsigned int order;
>   };
>   
>   static unsigned long page_pool_size;
> @@ -64,12 +63,6 @@ module_param(page_pool_size, ulong, 0644);
>   
>   static atomic_long_t allocated_pages;
>   
> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> -
> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> -
>   static struct mutex shrinker_lock;
>   static struct list_head shrinker_list;
>   static struct shrinker mm_shrinker;
> @@ -78,10 +71,8 @@ static struct shrinker mm_shrinker;
>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   					unsigned int order)
>   {
> -	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>   	struct ttm_pool_dma *dma;
>   	struct page *p;
> -	void *vaddr;
>   
>   	/* Don't set the __GFP_COMP flag for higher order allocations.
>   	 * Mapping pages directly into an userspace process and calling
> @@ -91,34 +82,16 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>   			__GFP_KSWAPD_RECLAIM;
>   
> -	if (!pool->use_dma_alloc) {
> -		p = alloc_pages(gfp_flags, order);
> -		if (p)
> -			p->private = order;
> -		return p;
> -	}
> -
>   	dma = kmalloc(sizeof(*dma), GFP_KERNEL);
>   	if (!dma)
>   		return NULL;
>   
> -	if (order)
> -		attr |= DMA_ATTR_NO_WARN;
> -
> -	vaddr = dma_alloc_attrs(pool->dev, (1ULL << order) * PAGE_SIZE,
> -				&dma->addr, gfp_flags, attr);
> -	if (!vaddr)
> +	p = dma_alloc_pages(pool->dev, (1ULL << order) * PAGE_SIZE,
> +				&dma->addr, DMA_BIDIRECTIONAL, gfp_flags);
> +	if (!p)
>   		goto error_free;
>   
> -	/* TODO: This is an illegal abuse of the DMA API, but we need to rework
> -	 * TTM page fault handling and extend the DMA API to clean this up.
> -	 */
> -	if (is_vmalloc_addr(vaddr))
> -		p = vmalloc_to_page(vaddr);
> -	else
> -		p = virt_to_page(vaddr);
> -
> -	dma->vaddr = (unsigned long)vaddr | order;
> +	dma->order = order;
>   	p->private = (unsigned long)dma;
>   	return p;
>   
> @@ -131,9 +104,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   			       unsigned int order, struct page *p)
>   {
> -	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>   	struct ttm_pool_dma *dma;
> -	void *vaddr;
>   
>   #ifdef CONFIG_X86
>   	/* We don't care that set_pages_wb is inefficient here. This is only
> @@ -143,18 +114,14 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>   		set_pages_wb(p, 1 << order);
>   #endif
>   
> -	if (!pool || !pool->use_dma_alloc) {
> +	if (!pool) {
>   		__free_pages(p, order);
>   		return;
>   	}
>   
> -	if (order)
> -		attr |= DMA_ATTR_NO_WARN;
> -
>   	dma = (void *)p->private;
> -	vaddr = (void *)(dma->vaddr & PAGE_MASK);
> -	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dma->addr,
> -		       attr);
> +	dma_free_pages(pool->dev, (1UL << order) * PAGE_SIZE, p, dma->addr,
> +			DMA_BIDIRECTIONAL);
>   	kfree(dma);
>   }
>   
> @@ -184,20 +151,12 @@ static int ttm_pool_apply_caching(struct page **first, struct page **last,
>   static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
>   			struct page *p, dma_addr_t **dma_addr)
>   {
> -	dma_addr_t addr;
> +	struct ttm_pool_dma *dma = (void *)p->private;
> +	dma_addr_t addr = dma->addr;
>   	unsigned int i;
>   
> -	if (pool->use_dma_alloc) {
> -		struct ttm_pool_dma *dma = (void *)p->private;
> -
> -		addr = dma->addr;
> -	} else {
> -		size_t size = (1ULL << order) * PAGE_SIZE;
> -
> -		addr = dma_map_page(pool->dev, p, 0, size, DMA_BIDIRECTIONAL);
> -		if (dma_mapping_error(pool->dev, addr))
> -			return -EFAULT;
> -	}
> +	dma_sync_single_for_device(pool->dev, addr,
> +			(1ULL << dma->order) * PAGE_SIZE, DMA_BIDIRECTIONAL);
>   
>   	for (i = 1 << order; i ; --i) {
>   		*(*dma_addr)++ = addr;
> @@ -211,12 +170,8 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
>   static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>   			   unsigned int num_pages)
>   {
> -	/* Unmapped while freeing the page */
> -	if (pool->use_dma_alloc)
> -		return;
> -
> -	dma_unmap_page(pool->dev, dma_addr, (long)num_pages << PAGE_SHIFT,
> -		       DMA_BIDIRECTIONAL);
> +	dma_sync_single_for_cpu(pool->dev, dma_addr, num_pages * PAGE_SIZE,
> +				DMA_BIDIRECTIONAL);
>   }
>   
>   /* Give pages into a specific pool_type */
> @@ -286,27 +241,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>   						  enum ttm_caching caching,
>   						  unsigned int order)
>   {
> -	if (pool->use_dma_alloc)
> -		return &pool->caching[caching].orders[order];
> -
> -#ifdef CONFIG_X86
> -	switch (caching) {
> -	case ttm_write_combined:
> -		if (pool->use_dma32)
> -			return &global_dma32_write_combined[order];
> -
> -		return &global_write_combined[order];
> -	case ttm_uncached:
> -		if (pool->use_dma32)
> -			return &global_dma32_uncached[order];
> -
> -		return &global_uncached[order];
> -	default:
> -		break;
> -	}
> -#endif
> -
> -	return NULL;
> +	return &pool->caching[caching].orders[order];
>   }
>   
>   /* Free pages using the global shrinker list */
> @@ -336,13 +271,9 @@ static unsigned int ttm_pool_shrink(void)
>   /* Return the allocation order based for a page */
>   static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>   {
> -	if (pool->use_dma_alloc) {
> -		struct ttm_pool_dma *dma = (void *)p->private;
> +	struct ttm_pool_dma *dma = (void *)p->private;
>   
> -		return dma->vaddr & ~PAGE_MASK;
> -	}
> -
> -	return p->private;
> +	return dma->order;
>   }
>   
>   /**
> @@ -364,7 +295,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	dma_addr_t *dma_addr = tt->dma_address;
>   	struct page **caching = tt->pages;
>   	struct page **pages = tt->pages;
> -	gfp_t gfp_flags = GFP_USER;
> +	gfp_t gfp_flags = GFP_HIGHUSER;
>   	unsigned int i, order;
>   	struct page *p;
>   	int r;
> @@ -378,11 +309,6 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	if (ctx->gfp_retry_mayfail)
>   		gfp_flags |= __GFP_RETRY_MAYFAIL;
>   
> -	if (pool->use_dma32)
> -		gfp_flags |= GFP_DMA32;
> -	else
> -		gfp_flags |= GFP_HIGHUSER;
> -
>   	for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		bool apply_caching = false;
> @@ -489,28 +415,20 @@ EXPORT_SYMBOL(ttm_pool_free);
>    *
>    * @pool: the pool to initialize
>    * @dev: device for DMA allocations and mappings
> - * @use_dma_alloc: true if coherent DMA alloc should be used
> - * @use_dma32: true if GFP_DMA32 should be used
>    *
>    * Initialize the pool and its pool types.
>    */
> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   bool use_dma_alloc, bool use_dma32)
> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev)
>   {
>   	unsigned int i, j;
>   
> -	WARN_ON(!dev && use_dma_alloc);
> +	WARN_ON(!dev);
>   
>   	pool->dev = dev;
> -	pool->use_dma_alloc = use_dma_alloc;
> -	pool->use_dma32 = use_dma32;
> -
> -	if (use_dma_alloc) {
> -		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < MAX_ORDER; ++j)
> -				ttm_pool_type_init(&pool->caching[i].orders[j],
> -						   pool, i, j);
> -	}
> +	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +		for (j = 0; j < MAX_ORDER; ++j)
> +			ttm_pool_type_init(&pool->caching[i].orders[j], pool, i,
> +					   j);
>   }
>   
>   /**
> @@ -525,11 +443,9 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   {
>   	unsigned int i, j;
>   
> -	if (pool->use_dma_alloc) {
> -		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < MAX_ORDER; ++j)
> -				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> -	}
> +	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +		for (j = 0; j < MAX_ORDER; ++j)
> +			ttm_pool_type_fini(&pool->caching[i].orders[j]);
>   }
>   
>   /* As long as pages are available make sure to release at least one */
> @@ -603,18 +519,6 @@ static void ttm_pool_debugfs_footer(struct seq_file *m)
>   static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
>   {
>   	ttm_pool_debugfs_header(m);
> -
> -	mutex_lock(&shrinker_lock);
> -	seq_puts(m, "wc\t:");
> -	ttm_pool_debugfs_orders(global_write_combined, m);
> -	seq_puts(m, "uc\t:");
> -	ttm_pool_debugfs_orders(global_uncached, m);
> -	seq_puts(m, "wc 32\t:");
> -	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
> -	seq_puts(m, "uc 32\t:");
> -	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> -	mutex_unlock(&shrinker_lock);
> -
>   	ttm_pool_debugfs_footer(m);
>   
>   	return 0;
> @@ -633,11 +537,6 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>   {
>   	unsigned int i;
>   
> -	if (!pool->use_dma_alloc) {
> -		seq_puts(m, "unused\n");
> -		return 0;
> -	}
> -
>   	ttm_pool_debugfs_header(m);
>   
>   	mutex_lock(&shrinker_lock);
> @@ -688,25 +587,12 @@ DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_shrink);
>    */
>   int ttm_pool_mgr_init(unsigned long num_pages)
>   {
> -	unsigned int i;
> -
>   	if (!page_pool_size)
>   		page_pool_size = num_pages;
>   
>   	mutex_init(&shrinker_lock);
>   	INIT_LIST_HEAD(&shrinker_list);
>   
> -	for (i = 0; i < MAX_ORDER; ++i) {
> -		ttm_pool_type_init(&global_write_combined[i], NULL,
> -				   ttm_write_combined, i);
> -		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> -
> -		ttm_pool_type_init(&global_dma32_write_combined[i], NULL,
> -				   ttm_write_combined, i);
> -		ttm_pool_type_init(&global_dma32_uncached[i], NULL,
> -				   ttm_uncached, i);
> -	}
> -
>   #ifdef CONFIG_DEBUG_FS
>   	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>   			    &ttm_pool_debugfs_globals_fops);
> @@ -727,16 +613,6 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>    */
>   void ttm_pool_mgr_fini(void)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < MAX_ORDER; ++i) {
> -		ttm_pool_type_fini(&global_write_combined[i]);
> -		ttm_pool_type_fini(&global_uncached[i]);
> -
> -		ttm_pool_type_fini(&global_dma32_write_combined[i]);
> -		ttm_pool_type_fini(&global_dma32_uncached[i]);
> -	}
> -
>   	unregister_shrinker(&mm_shrinker);
>   	WARN_ON(!list_empty(&shrinker_list));
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index a1a25410ec742d..d8f30ce4c65655 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -51,7 +51,6 @@ MODULE_PARM_DESC(dma32_pages_limit, "Limit for the allocated DMA32 pages");
>   module_param_named(dma32_pages_limit, ttm_dma32_pages_limit, ulong, 0644);
>   
>   static atomic_long_t ttm_pages_allocated;
> -static atomic_long_t ttm_dma32_pages_allocated;
>   
>   /*
>    * Allocates a ttm structure for the given BO.
> @@ -317,17 +316,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG))
>   		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> -			atomic_long_add(ttm->num_pages,
> -					&ttm_dma32_pages_allocated);
> -	}
> -
> -	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
> -	       atomic_long_read(&ttm_dma32_pages_allocated) >
> -	       ttm_dma32_pages_limit) {
>   
> +	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit) {
>   		ret = ttm_global_swapout(ctx, GFP_KERNEL);
>   		if (ret == 0)
>   			break;
> @@ -355,12 +347,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	return 0;
>   
>   error:
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG))
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> -			atomic_long_sub(ttm->num_pages,
> -					&ttm_dma32_pages_allocated);
> -	}
>   	return ret;
>   }
>   EXPORT_SYMBOL(ttm_tt_populate);
> @@ -390,13 +378,8 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	else
>   		ttm_pool_free(&bdev->pool, ttm);
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG))
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> -		if (bdev->pool.use_dma32)
> -			atomic_long_sub(ttm->num_pages,
> -					&ttm_dma32_pages_allocated);
> -	}
> -
>   	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>   }
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 399f70d340eb5b..0c5783651ae187 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -881,9 +881,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   	ret = ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
>   			      dev_priv->drm.dev,
>   			      dev_priv->drm.anon_inode->i_mapping,
> -			      &dev_priv->vma_manager,
> -			      dev_priv->map_mode == vmw_dma_alloc_coherent,
> -			      false);
> +			      &dev_priv->vma_manager);
>   	if (unlikely(ret != 0)) {
>   		DRM_ERROR("Failed initializing TTM buffer object driver.\n");
>   		goto out_no_bdev;
> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
> index e9ad4863d91568..c3122588811731 100644
> --- a/include/drm/drm_cache.h
> +++ b/include/drm/drm_cache.h
> @@ -38,7 +38,6 @@
>   void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
>   void drm_clflush_sg(struct sg_table *st);
>   void drm_clflush_virt_range(void *addr, unsigned long length);
> -bool drm_need_swiotlb(int dma_bits);
>   
>   
>   static inline bool drm_arch_can_wc_memory(void)
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 7c8f87bd52d383..8b5281b982b7da 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -310,8 +310,7 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>   
>   int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   		    struct device *dev, struct address_space *mapping,
> -		    struct drm_vma_offset_manager *vma_manager,
> -		    bool use_dma_alloc, bool use_dma32);
> +		    struct drm_vma_offset_manager *vma_manager);
>   void ttm_device_fini(struct ttm_device *bdev);
>   
>   #endif
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 4321728bdd11f8..7c7800c934e272 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -60,16 +60,10 @@ struct ttm_pool_type {
>   /**
>    * ttm_pool - Pool for all caching and orders
>    *
> - * @use_dma_alloc: if coherent DMA allocations should be used
> - * @use_dma32: if GFP_DMA32 should be used
>    * @caching: pools for each caching/order
>    */
>   struct ttm_pool {
>   	struct device *dev;
> -
> -	bool use_dma_alloc;
> -	bool use_dma32;
> -
>   	struct {
>   		struct ttm_pool_type orders[MAX_ORDER];
>   	} caching[TTM_NUM_CACHING_TYPES];
> @@ -79,8 +73,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   		   struct ttm_operation_ctx *ctx);
>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>   
> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> -		   bool use_dma_alloc, bool use_dma32);
> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev);
>   void ttm_pool_fini(struct ttm_pool *pool);
>   
>   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);

