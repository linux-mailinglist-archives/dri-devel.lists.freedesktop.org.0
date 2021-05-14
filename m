Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75EA380C14
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288E6EEA2;
	Fri, 14 May 2021 14:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6676EEA0;
 Fri, 14 May 2021 14:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOx5e9AZ9tUt+a83BucoYMc4MQYkSRMWVhUIyxcDhd88Ug+RkKMByZL/FSVTKFEwwt0EHDfGjEZzMEFL5tyM51kNjZw1O2eWOCe0bCDEaJn8vlHfRn8BV2+sLc2x2ccp4ToHrLIgRHVT4Z9MuilkMADm+RqEVB1ZtwfamgjcJdf1z4Bhb0eKOI+UOpvcw2ukET4XiY3hzsS7D2bQcu832PeoP804rOj/QIpKkyw/WjL4rREjct7DsbeaMxaRTtnx+hQr3gfAV7tVhhn0HjdJ020w3hs2/ALICQpvPjV/fIuqQKd06Zqjb4gq5Y7gxqw/797O5z5lu/JpikTH3SHpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT0ldU1B7bih1e5V+zKMR6R6hc5bD44K417gCfRtA4g=;
 b=c5GDCPGa6Imv4Mm+0Y1DVY+UeEqeqrUGl+MgLn3nGr4V2/psD38wGHbPTEG/YDNhbOoWT0h17Wor/pHyBmKyBt6Be7bTB4zMP6NxxPzIBmI1lisS2gn9YabHCyvrNrfbwNJ7zJ3vcsApeO3tUusfSjapAFZOA5to+faEaxXTxVLCjghl7sRdGH5b0NYpiFokQ3pEyTHrEifDStGVHUu6E2BEYvF91iz+J6uvhk39TJlQCk+1FoyDaMkJhW6S+n9UTIrlZazgieyyJraDQf1I8P01CKTuiyfi5AH3fS1KzH0HPKnbJb8C0ovwiGtL5pY+AOH9MvaPzTl0hVbZVovcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT0ldU1B7bih1e5V+zKMR6R6hc5bD44K417gCfRtA4g=;
 b=1rxwbsVsYmWMFE+kRIoNmaCpVOYuGKF8mpWSqkuzgvEX0o/asMW7Mii1UHsrAUfTxvscdeEK8eJwO/8N/QOrY7y26hq90qNushdbpzVFfPmllHaNJ8K6dJbGs74bC2cZPb1ZPPsu+o4n4ZdwjDVTfjh7PT7PNkmUXKw4qgp8630=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2654.namprd12.prod.outlook.com (2603:10b6:805:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 14:42:34 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 14:42:34 +0000
Subject: Re: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-17-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <5e2f2b3a-78bd-38e6-8cc1-d138fb4ddaa3@amd.com>
Date: Fri, 14 May 2021 10:42:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210512142648.666476-17-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [207.107.137.243]
X-ClientProxiedBy: YQBPR0101CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::23) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.30.117.98] (207.107.137.243) by
 YQBPR0101CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Fri, 14 May 2021 14:42:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a22603f5-7046-4068-ed02-08d916e682d8
X-MS-TrafficTypeDiagnostic: SN6PR12MB2654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB265418A6ACFBC7BCFF2F2876EA509@SN6PR12MB2654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60r88BoGFMeZ25PDBxFRlkL53oAbmLiaKAfaTD2DQ9BkYaOec70ym1h66ZeFS+pf59S0ftkS5s4QxN62E8Tv5UGixpAfrCXlrb3CtKoYsS8S3nZyDN0LTfj5RNJp4us1faTfLTacCIXtxOdNERChZC/w8NqBS+NW7L4Hxhpj00XBwBjNlluNImGieiTCdEItLCT0UhdQuXMPGL93Q0dSSsdclOsDG4KULRafCpOlVHTjUtV5LH5f5NYmoLhEWAPZ1SNkfKMK42I19rIoqdEdYyD4vyQ8IbAOLuq+/x6TIeAWffIAJswjy8+CW/8v+1XwPdQ9tM6JjFM2rYeATDeIbQLxOiia6Hx9S8qai/5BLkOzE1STRjd9wg9Jn9v47qA+v0QMUEIk2HQLqqm9mxXURiH5kCF/k86GroybHoOCIHQwUvIP7Ad363r3N4Ad8H5783x+tYVlEO3Tkms9bLDBc7CsZ1nmGN1Qq63HiZ7HJkDuRhZYDrF35rLyLAydd5KeDQ1EfuDe8Oz7P2bfWy6Gtw2lZ4WwbLGEkONrLSDivChMPy913P60DXpjuYBZcjOKUF2wyIldnW8vEfvoi26FdBcp4w9wn5xJ55C1QKfGyIs97aQk3X5tzTNc/AZfiAu8PEB3hGpOU7upioAKMAE5XN4gVAPgdlMPyitaH98XvOesJcx4oK8UGbzCKtM5C6TAIjVfgkppvAO24Rn5A6uewktjHhXcqH2VwRqdqV9p9vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(31696002)(6486002)(5660300002)(86362001)(8936002)(316002)(8676002)(2906002)(38350700002)(26005)(38100700002)(83380400001)(52116002)(36756003)(66556008)(4326008)(16576012)(44832011)(956004)(66946007)(53546011)(478600001)(66476007)(2616005)(186003)(6636002)(16526019)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUhESjVuRjZoSWJTUk1kMTB5bGhvTnpHZVpJZnVJeTNZUGxCSWozVVF4T0li?=
 =?utf-8?B?TDJmN1cvaGFOUUo3eFk0UmliR29TSXRDblllcFJwQnRrRU52M1BYZmRUTS8x?=
 =?utf-8?B?SlRrcWtVbkZkWWJ0S3U2VVFpMEJQQ3kzVHhRZzlBN3V2TUJaYkcwbElPSHRm?=
 =?utf-8?B?SzlrZ1NLd3RnSTM5V3EzeGh4YmloTjJCSGN4SjMzMWFWNk5ibkhmNFcxN24v?=
 =?utf-8?B?dE8ycThuU0tZSHM2VzdYMnBnZ0RwWVcxWXJoeXQwNGk5VmQ2YlRFN2Fzc1VD?=
 =?utf-8?B?Tlg4SWpqRnRBL2FPcjBpcXFnLytWbEx4a3pyaXJXQlFoNlhGd2JDWTJpTUlW?=
 =?utf-8?B?U1Zrd3d3Q3BRWi9GR2dEamRyRDlKa0FjdGpHTzcwaXFMOTlTR0xSSC9wM1Ji?=
 =?utf-8?B?WWU4YTV4cWJmV3g0SFFZMjUwbGY2ak9iYVFSZmRhQm0yK2kvQU1GUEFlUm1r?=
 =?utf-8?B?OVpBM0s5MlhNN3JqU0dZNVREVFZoK1J3MXhMTXl3djBKOXdPTzRqLy9XMVFt?=
 =?utf-8?B?a0dJMUFYcnlyY2U3b0dFMzFKMy93anl3MUlIRVMyR01XMGtRcEJ6ZHRER3l1?=
 =?utf-8?B?WEFUbG1yMVRka0hVdnl2anZVaGhsbEhiVnI4R2U1MmgzTnJ2T3ozYlN1enEw?=
 =?utf-8?B?VnVsODU1OEhaYkk4c1Q3am5yVzdkaDJKK1NjRi9jMzdtWFQ0Y0hZNzZwcTRE?=
 =?utf-8?B?RzRoYVg5MDd0UCs2bWR3M2FiUGtGcVNLdnpMQjZBZmlIZWpmU2JYRUR6cjNT?=
 =?utf-8?B?VG1JTm1keVAwYW1NV24zVlBNQXFlR2FRdGY3SkNHdGFlRUk2YU1PMFhkOUZB?=
 =?utf-8?B?N3ppSGExT29hSnU4VG94a0E3VnRmdFZCSEowMHJLemtTY1NhQ1VOdG5nWERT?=
 =?utf-8?B?MnQ4M2RaRHAyZTFHYmRrV2s4cDE5L2JCUHFzS29Qcld5M1F0UzJKMDlSN3RI?=
 =?utf-8?B?Ly9UcHpQeG9zR0lWa21rVWFGVWM2Wno2dEJ6QnpYM1dlT2tLNWltNFR3ZFpQ?=
 =?utf-8?B?M2s0ZUNCWVJJYldwSlRrS2tsL0dROGM2STBzT0VzSXFXSmRycGFGNE9ocm5P?=
 =?utf-8?B?Q1FGOW1WMnhVOERLK1N3Q2g3TXVyVloyNVdkcytxcEh5aE5iZU5CdEtyZ2tW?=
 =?utf-8?B?SkhvNlZSN0ZXM0ZPT0hBT1NaSG5HVzhwNlR4UEtLREVhakZHNndBMmxDQk9r?=
 =?utf-8?B?bjRSK1ZtMEpZbUtLUHNJT2F2d04xWUJ6MFFPVlNpT0swbFhaRm5GcHJqN1A5?=
 =?utf-8?B?SThvUFp5YzNoTno0cXcxZ1d6SWt3bkFadFFObGlsZEJKdmN2SzM1RGdCZUhm?=
 =?utf-8?B?Wm5SdUZQb0FoejJpeWQ0cnlFenhTRHdXWWpaNFVjNWJ4cEJxSGFyTzdZU1NF?=
 =?utf-8?B?V2ZJYjNMQ1h4L1lKMU05bVdYTkxzdjFMR2YrR2RHREZ2MlZJUldBdFVtZEVX?=
 =?utf-8?B?UXRCZG5udCtnajFhNldOM245b29yNzhReTFXL1RnT0M1RGUzYmYvMXNKWmN0?=
 =?utf-8?B?Q1FjYXp4eTBDcE1maEVLV2M3WGxSRjdSREhJWTlZdHo4eUtEYzV6WG9qck5K?=
 =?utf-8?B?YjE5RDgweW02U1FUY29wbFhKOGJiNlI2RjNWMlBwbG5iS1FnbkJkbzJjU1hm?=
 =?utf-8?B?L3NHd2tWaG5mSnZhZkl2WmMweGdkalAzYWlPUVNWZ2lUMTBBRmtZaWpsWGpQ?=
 =?utf-8?B?NC9LUFhXb0h3ekFFdmVjdWJ0dXg1Wi9rUkFzN1lUbEJpVy9BTjdSa1pzcytC?=
 =?utf-8?Q?072AHaErbmzJahGUFsrmyDm0JxRAm68+bwVzS7Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22603f5-7046-4068-ed02-08d916e682d8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:42:34.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsDVdXYfSNP+Sk8v3p3IzcxFoOGXDA1uR/lCGFNq3YHhR79K3f+yTSo4dlcE9NXQ2l2B1KLRXdZde3uf43sjxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2654
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping

Andrey

On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
> Access to those must be prevented post pci_remove
> 
> v6: Drop BOs list, unampping VRAM BAR is enough.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>   3 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f7cca25c0fa0..73cbc3c7453f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
> +{
> +	/* Clear all CPU mappings pointing to this device */
> +	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
> +
> +	/* Unmap all mapped bars - Doorbell, registers and VRAM */
> +	amdgpu_device_doorbell_fini(adev);
> +
> +	iounmap(adev->rmmio);
> +	adev->rmmio = NULL;
> +	if (adev->mman.aper_base_kaddr)
> +		iounmap(adev->mman.aper_base_kaddr);
> +	adev->mman.aper_base_kaddr = NULL;
> +
> +	/* Memory manager related */
> +	arch_phys_wc_del(adev->gmc.vram_mtrr);
> +	arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
> +}
> +
>   /**
>    * amdgpu_device_fini - tear down the driver
>    *
> @@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   	amdgpu_device_ip_fini_early(adev);
>   
>   	amdgpu_gart_dummy_page_fini(adev);
> +
> +	amdgpu_device_unmap_mmio(adev);
>   }
>   
>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> @@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	}
>   	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>   		vga_client_register(adev->pdev, NULL, NULL, NULL);
> -	iounmap(adev->rmmio);
> -	adev->rmmio = NULL;
> -	amdgpu_device_doorbell_fini(adev);
>   
>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
>   		amdgpu_pmu_fini(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 0adffcace326..882fb49f3c41 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>   		return -ENOMEM;
>   	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
>   	INIT_LIST_HEAD(&bo->shadow_list);
> +
>   	bo->vm_bo = NULL;
>   	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
>   		bp->domain;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 0d54e70278ca..58ad2fecc9e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>   	amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>   	amdgpu_ttm_fw_reserve_vram_fini(adev);
>   
> -	if (adev->mman.aper_base_kaddr)
> -		iounmap(adev->mman.aper_base_kaddr);
> -	adev->mman.aper_base_kaddr = NULL;
> -
>   	amdgpu_vram_mgr_fini(adev);
>   	amdgpu_gtt_mgr_fini(adev);
>   	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
> 
