Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05989395AE2
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE246E91B;
	Mon, 31 May 2021 12:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031E6E91B;
 Mon, 31 May 2021 12:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnb7LCdb/UMxfnPWE8x8kRaCz9wiSzIC9SKLnJnLhRuGG7K6qeOOrZaiwlbgvAe/zu2xLdT/vFB7TaR0+Hg1PZubpgKe4WKDswiJ/8FUGcrmdH1EhtDhEuTGsIRl03S9D9+2zJHJQWtZ7xeExvp/aKAflQ7HNPjOKHUK52PluUKynlJkGkYk2xZkGdveENeT4PGFRIwFr1xzcbua8QiQ0NV8nXquKA0uyjSTmbF3MTMNarCn9BsKLjCT8zjaZJKmYkRH477EVyvEcJ2NgQyZNv0hICBcZTMVUY6UNUAt4VPc8QLRFnY5R66jW2Irjv7GWUJ2m5o356IN5QlSdgPHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4xKbShWB1BgK2sWWMs0zLBJ75VFXOmUL9frKUU1oxI=;
 b=NvOYw0GSto00l79/xg6UqEAoe6cXsWn9VuxAL15ewS4xh5a+LqFwlKkSzEepyHXksUb6KI0ZiieS7eplLvYxRQu7VM9wSIlZWzXCoyTnnAS1e3TjYU8xB8kFwBeUiWYa4bHQt83u8mVqECgNBVjitPeNnhc1r9o0PswXeXRlyriiVjdnUSPhONuQpsfd0UdhegnqSmk1qjIIXOD45qbJq7aVaopeoIh888xmsBZomhwiXS/FjYOLIC58b48DfI8FiIpsSwnhc1bmioPf324qY+R8FLMG0dx0au3xMuw68ZNcHplTro4QVKEx0MjnoXNYbYsz+c39c74CyfFVLU7hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4xKbShWB1BgK2sWWMs0zLBJ75VFXOmUL9frKUU1oxI=;
 b=OkVOXxyz/+getB+K4T+isOgPseoOwWP5zN5qlxGeaf3mRQbOmiKtOl8ziadhWNJjtKDM+upu73lII1C7iuptGCeF3KSEzT61VIJqtrvIzftD4t4xtnqpCxkaGBcv0orOIIyMFRaoJf+uULyIbB5RsGkF5d0Wr/rxcdQcLCo9Aew=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3694.namprd12.prod.outlook.com (2603:10b6:208:165::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 12:49:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 12:49:04 +0000
Subject: Re: [PATCH v2 3/3] drm/amdgpu: allow temporary GTT allocation under
 memory pressure
To: Lang Yu <Lang.Yu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210531082241.4254-1-Lang.Yu@amd.com>
 <20210531082241.4254-3-Lang.Yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e2e9acf8-5094-10de-549b-51852236b69b@amd.com>
Date: Mon, 31 May 2021 14:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210531082241.4254-3-Lang.Yu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b94:4956:bad4:7c81]
X-ClientProxiedBy: AM4PR0302CA0026.eurprd03.prod.outlook.com
 (2603:10a6:205:2::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81]
 (2a02:908:1252:fb60:b94:4956:bad4:7c81) by
 AM4PR0302CA0026.eurprd03.prod.outlook.com (2603:10a6:205:2::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 12:49:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc13ac18-1a30-45e2-2e7b-08d92432783a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB369490A0CB8BA74CA887C5F7833F9@MN2PR12MB3694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrsqFAKa9Rxo1PrKTJb53HXHlC5ZU27fWPBlWmGPzj+LA7ySa75xGTtQ98Fu3Sq8lH+vSx8XSKcIC6VN7jX1/pCi4CL6oA5zskzIkIr0tQnXBupX2RWBhRq82cV6tGyenQTI+FsEVfwahHpANuc7G+uzseCTE8Nii+kY4Kbby6pLFXRKJiXnVAPJaGK85djL3YOm0febr4hYo+m3tr97zfiAdMf22LtU3xL9U9SqGn6bXocPMFoRWC77ZqLvm5OhdwXAHwk0G6nVIo2zRmlhCtTdlGMZ7JJfpZsBXosDcxohMQIjbRms/T0eRrny2qaBisEkuIVFKS0Oh6Tq1rhVX2p8BulUPGaofx1iYUxH7Xbiz82RoqAEzCERfrk5EoMffN3B2/4bnXDFMOlTuJcmWWQgg/WqmzuOM4k3figysLTIUY+SCFwYOJZLajtexGWp73GEnyTkqCzXYGhbz3kpoCg8mxCU3tRKlhDnu4FJqPaiOSDgsmaOiemPWM/dn8OLlovKNFH8UG90fSX4lKUO99vFH3dl6LqMSZ+XNN634HQR4VY+nyo6su78ff1/NTkbXZv+FGQQIttG09+hj+z30wXh5HJa/RBZwnfyTztifyKfvZCuq7XTi7OcM3DOQZI7XzyqPmIDBlzaR2SqpDVfCzQTXigypoQOFFtz/M0jU5T+xaPnm500bdvDgaJdJxTW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(83380400001)(6666004)(8936002)(16526019)(36756003)(86362001)(54906003)(2616005)(31696002)(6486002)(66476007)(66556008)(5660300002)(2906002)(31686004)(66946007)(186003)(8676002)(38100700002)(316002)(4326008)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djl6OHQybkN6dFVIcXN1eC9IemFTclRBUExONkY2Qmp3Rm5JZVhRWWoyNUNB?=
 =?utf-8?B?MmovMmFJTjNlWkY2aGgvZ2paNTFZckJVZXVBaGwyNGZBYk5HYkh5RU9yL3NM?=
 =?utf-8?B?T1JQc2J3OXNWcG1sYTFNaU15ZGZqcE1VRkpHZ0ZXcnBZekFHNTJ5RXdyNDVY?=
 =?utf-8?B?TUtSSVpmSEJ2TEloTXlzSmt3d0NwQjVHN21VcFpZRDlLVzJ2YUs4REU0bVpp?=
 =?utf-8?B?TDhoWGZRb3dtbEFwdGJmRG1oTEdWSHZIblpGRjVHQ3lpMnNPMDFTQTVJUUJ1?=
 =?utf-8?B?Ni9JOUJzMkRNa3ZNSnpIV3JXUHJMSlF1cllkQnhxcEpnNEtZWUtMVGFiSWJt?=
 =?utf-8?B?dlJ0S0xTYXY3R0ZhSFFBNDRDcVZHNHNpMjdIZ2JsUXZEZUs3YlAvVy9FVkU4?=
 =?utf-8?B?bDU4VHM3b2lBSFhwempjdmEyS04wWEFQRkFxSno4Zk04OUoxLy9zTGNEOTZv?=
 =?utf-8?B?Q0FTcTdtVU9YVlVXenRJVWg2RkgxSGo4bWNEOTBJVHhKZzdvYTRCN2tsVThL?=
 =?utf-8?B?RXUrcDNGZjAwdEVwN2swWGxSMnBaOXdHTlBVWTFCaG1ycm42ZHk2KzRlMkp6?=
 =?utf-8?B?dkZxY0xrdkRLUFVzTXBkUWVYazdhMVdXN010dE8vTi8wNDJJZk1aaEJBOElT?=
 =?utf-8?B?VkxUV0RQQWtWSDRac3RwSmVWZXkrMUZnOXJEOE1qNk01T1FzbEM2TXYySndu?=
 =?utf-8?B?c0lZN095dFZpRE91M0p0N2dyc2xyOU1rN0RKM2Erd3k0SU92WTdGMi90Ykdp?=
 =?utf-8?B?UTJOSy9UcHNPQXM2VlY3ZlpRMzBPeS9zTzIyZDhQc2FReThWRFFIbnJyU1VR?=
 =?utf-8?B?a3cwNkxHUEJrazNhazBFK0dNY0t1Mi9RMzg1dmxqQ0xIWjU0bUttd1NISUk1?=
 =?utf-8?B?MzZOVnljUG5uWTV2cVZQcUlCTGZSbDhlc0d6QlY5clNzMWV6cmJFQUM4bGtK?=
 =?utf-8?B?K1hhdm1FZzhYcWhYMUgydnNlTXlUNFgxYlY1eUtFUUVuNXJmWTBlMkFmRXov?=
 =?utf-8?B?RFFiZWQ3d080a0o3d0pPZUJJZXRSUzZHR1dXbDgzd3hsNUtRS2Iwb0VweERn?=
 =?utf-8?B?MjZXZVhiT0RDcERIUWU2alRyZWZIOUtWVlYyZGw0TVRrc3E2Tm00ZjBTNU92?=
 =?utf-8?B?V1BIbWRrQW1JTFhpSm9rRmdnc3pKc0pHbHg3S3l1bVc1a0hBTjhURWwyUVVm?=
 =?utf-8?B?d241dS9qSGRNVGtkQ3dzWXZQV2NaQ2FIbDk3azB0WW5OWkV5N2NKcjA2MU5C?=
 =?utf-8?B?Q2cxc2JlMEhTTGFsWTRJMHVyZFI2TlRkS1lReTRWMHgwa0U0eWwrTjArT2xa?=
 =?utf-8?B?bnJxNHJjZXRINUVKU09mZGQ5Yjc1SVAzUW5QSDlZelVsMUx2TzFERUtFKzNC?=
 =?utf-8?B?Wk5zaHlJalIrWEZxVWVoeWNCS3JGNjVsaGt2cHAweU84RFdocmFjT240dlUz?=
 =?utf-8?B?RmhadVY4cHE4bHJmUnRsK2xXWFloOHp2SVdkVEo3cG9yaDU4S1Zhb29kd2xp?=
 =?utf-8?B?aktldzk0MW5VRDV0SDFWU0JsTmdSOEU2V3hLUzJXTmw3UG0xenhvbHk3UktD?=
 =?utf-8?B?N1V6Rm5OVlZRemVQUWpRTmRiU3BoMkxjYjRjQW5UZnI4WkpFYVl6THJBK0Fz?=
 =?utf-8?B?emJsRlRXRDc2QkJReEZ2M0swUGpMUDZMSlNhaVRKbXBpN0djWmVoTjhTb2tW?=
 =?utf-8?B?WFN3NlhsSU5NUTZ6bGVGUktNMkxveGVITjdkcS80RmxkZmNDeHI0elBFRHdn?=
 =?utf-8?B?UFY0NU1WWDZsUVFDdG1kbEx1NlNYdkUxd3ZCUlRMVCt3Y0dRdGdvVDZOS1FI?=
 =?utf-8?B?QkcveTVJTk1LdWdPc2liZjJCcmJRNVVySncyeWkzS3pZN1p2NlZaMWRKR05x?=
 =?utf-8?Q?dEvml83TD2X9N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc13ac18-1a30-45e2-2e7b-08d92432783a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 12:49:04.0225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw258VHovGmV21zJGqgxTVxU5PJ+5yuZZYT6ICz+IQk1eQl0lCA7fR1uxnEIxs4Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6?= <thomas_os@shipmail.org>,
 Huang Rui <ray.huang@amd.com>, Marek Olsak <Marek.Olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On which branch are you working? I have problems applying that one to 
amd-staging-drm-next.

Christian.

Am 31.05.21 um 10:22 schrieb Lang Yu:
> Currently, we have a limitted GTT memory size and need a bounce buffer
> when doing buffer migration between VRAM and SYSTEM domain.
>
> The problem is under GTT memory pressure we can't do buffer migration
> between VRAM and SYSTEM domain. But in some cases we really need that.
> Eespecially when validating a VRAM backing store BO which resides in
> SYSTEM domain.
>
> To solve the problem, we allow temporary GTT allocation under memory
> pressure and do the following:
>
> 1. Change mgr->available into mgr->used (invert the value).
> 2. Always account all GTT BOs to the used space.
> 3. Only when it is not a temporary allocation bail out.
>
> v2: still account temporary GTT allocations
>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 27 ++++++++++-----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  4 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 +-
>   3 files changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 8860545344c7..393f55f412b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -111,14 +111,11 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	struct amdgpu_gtt_node *node;
>   	int r;
>   
> -	spin_lock(&mgr->lock);
> -	if ((&tbo->mem == mem || tbo->mem.mem_type != TTM_PL_TT) &&
> -	    atomic64_read(&mgr->available) < mem->num_pages) {
> -		spin_unlock(&mgr->lock);
> +	if ((atomic64_add_return(mem->num_pages, &mgr->used) > man->size) &&
> +		!(mem->placement & TTM_PL_FLAG_TEMPORARY)) {
> +		atomic64_sub(mem->num_pages, &mgr->used);
>   		return -ENOSPC;
>   	}
> -	atomic64_sub(mem->num_pages, &mgr->available);
> -	spin_unlock(&mgr->lock);
>   
>   	if (!place->lpfn) {
>   		mem->mm_node = NULL;
> @@ -152,7 +149,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	kfree(node);
>   
>   err_out:
> -	atomic64_add(mem->num_pages, &mgr->available);
> +	atomic64_sub(mem->num_pages, &mgr->used);
>   
>   	return r;
>   }
> @@ -178,7 +175,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   		kfree(node);
>   	}
>   
> -	atomic64_add(mem->num_pages, &mgr->available);
> +	atomic64_sub(mem->num_pages, &mgr->used);
>   }
>   
>   /**
> @@ -191,9 +188,8 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> -	s64 result = man->size - atomic64_read(&mgr->available);
>   
> -	return (result > 0 ? result : 0) * PAGE_SIZE;
> +	return atomic64_read(&mgr->used) * PAGE_SIZE;
>   }
>   
>   /**
> @@ -234,14 +230,17 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
>   				 struct drm_printer *printer)
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> +	uint64_t used, used_pages;
>   
>   	spin_lock(&mgr->lock);
>   	drm_mm_print(&mgr->mm, printer);
>   	spin_unlock(&mgr->lock);
>   
> -	drm_printf(printer, "man size:%llu pages, gtt available:%lld pages, usage:%lluMB\n",
> -		   man->size, (u64)atomic64_read(&mgr->available),
> -		   amdgpu_gtt_mgr_usage(man) >> 20);
> +	used = amdgpu_gtt_mgr_usage(man);
> +	used_pages = used/PAGE_SIZE;
> +
> +	drm_printf(printer, "man size:%llu pages,  gtt available:%lld pages, usage:%lluMB\n",
> +		man->size, used_pages > man->size ? 0 : man->size - used_pages, used >> 20);
>   }
>   
>   static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
> @@ -274,7 +273,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>   	drm_mm_init(&mgr->mm, start, size);
>   	spin_lock_init(&mgr->lock);
> -	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
> +	atomic64_set(&mgr->used, 0);
>   
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c0aef327292a..129d39392859 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -152,9 +152,11 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   			abo->placements[0].lpfn = 0;
>   			abo->placement.busy_placement = &abo->placements[1];
>   			abo->placement.num_busy_placement = 1;
> +			abo->placements[1].flags |= TTM_PL_FLAG_TEMPORARY;
>   		} else {
>   			/* Move to GTT memory */
>   			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
> +			abo->placements[0].flags |= TTM_PL_FLAG_TEMPORARY;
>   		}
>   		break;
>   	case TTM_PL_TT:
> @@ -538,7 +540,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>   			hop->fpfn = 0;
>   			hop->lpfn = 0;
>   			hop->mem_type = TTM_PL_TT;
> -			hop->flags = 0;
> +			hop->flags |= TTM_PL_FLAG_TEMPORARY;
>   			return -EMULTIHOP;
>   		}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 2877a924086f..26b67af00550 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -52,7 +52,7 @@ struct amdgpu_gtt_mgr {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
>   	spinlock_t lock;
> -	atomic64_t available;
> +	atomic64_t used;
>   };
>   
>   struct amdgpu_preempt_mgr {

