Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0D576EAB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4A710EEDD;
	Sat, 16 Jul 2022 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2060.outbound.protection.outlook.com [40.107.96.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0676B10E13D;
 Fri, 15 Jul 2022 14:31:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEWBIFp9mJDhMvs/dEDLul2alEsVejhTLbp2zh4JVokPwxk1UEt/IB6Gt7gEMppjW3XdKD32trgixOG7kOtoIX+eDwiIPdYMBUMmBU6DWXqTP6PBRNoTaXpKBxIbqC4x8UtIn9HAA41aQVI4s9p9BfPxJoF4eIO3EcaRiLPkTuK74IiDizrdOW9fCx+aUkXnof5AkODneZeklSvfwoWIly9wvLK8GhgWk9thL44DNnsq7k3evsEYgIlk5Odd65OaJ3aPK7GZOq6cEQjFNwL4dtLHaZnzjrJO3n7H64+6DZOqbcSls9jzpa8NEMABbaO0BIHAWDEw015vNfNLtI/7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlj+IRENMihQsC2SuhAZyPI5G3hq3L04mA9G1ctIYws=;
 b=LZEoi35sWEHWm4IXbiFuIPH46osk4eHxKa3NscH+MOCuTHavszTxx3h7a2PgRhPofL31vf6ab4XUpMi/gJPAmV9bXAQnxWV670YZnIElXQ2PSq0O7TYvza9ntdYZrjw6nKh4ax8ayRlcfEq40rsg4jvjXrjE6dTBbQHSj/3bdVVwAxbYNEwvTU9pWG28DRR7nd3A8Ee6UGpS3OsURNLAXnwdX+FPM5a5Xyz8JW/HaNQjWpGx4lDhg48mc8zml77Z55coYfaYs3AXVo4WpflrrtYBrVjKxPpdnMq32bMKLP0KxqDmzrw++gTX+VtAPWggOi4jivRdO0Yz0Bc5kIrvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlj+IRENMihQsC2SuhAZyPI5G3hq3L04mA9G1ctIYws=;
 b=Ly+MpjXUYgbb3zqp6P9TZemFAAjG10ADmM5Rd7J7SEM6LCpxc+WNCkuDfP6jou6CxZwtZmQxersN/VLaFN+IIkZS/0rB593oCtG+fwKHR2SUTCGKiRcr3fE+YB+iqKwExxFXR1YyRCyEjkRVP0kwOTha6WRtZZu4cCdNI8Qoo6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1495.namprd12.prod.outlook.com (2603:10b6:910:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Fri, 15 Jul
 2022 13:46:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 13:46:31 +0000
Message-ID: <bff87b62-2bf4-7945-5bac-29207382115e@amd.com>
Date: Fri, 15 Jul 2022 15:46:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amdgpu: Fix for drm buddy memory corruption
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220714101214.7620-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220714101214.7620-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c1079ff-9fc1-4c9c-dc64-08da66686ca1
X-MS-TrafficTypeDiagnostic: CY4PR12MB1495:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQwHdW3MWnpZWAhJ6IQFANvGQ2DBpTJYDgadQAUALFrLyONIy9+xU5fRDvL2J0vO7IuURoUy/JEuYxxZZcve+y6eF6Jrt3VzdzOwYgypQkistHIP91vi9T8CiNGHPYtTlT2mnXJs3xxnM+ThWZSizgRXK1iaq1xvtfaa4OxwrmVM5ZYTWLMQLpA5ScHpmSNaozFCs39rKlhLWuDq8C3QeriPIs5JZ5FdMjEyrR70lm4uzaMKHbQD+FPRrY1aqEPFkMg2P1ATV1sQL08eNAwwHZl81PByubRe3VoLhlg/KBmwvpAPxil+HtKqE8xfsMFhJghiy3IWzrQxQNGjq0uvBNwc7JZ3jmX6mcKiQRY3YPF4Q7yeBWmgiRnLDn8EEmA7GsX2gTAj4m1G4Vt9LwUEaypI7hEJJ0aVwQoBJ++oLdUtHr3LxiZIKtTX2v+Z1qKFZy7qQgRk23LwC7pQviAzXfaR3T9uH+jyRh+Kvp9WCoMBgYma3Fc3Xh08ej977Gip5zTnyLphyCS2waIrbcNSoNhcqEdi9yt0B+94Hz6GGCbZJTIqTVp5fGeN0fwK2WUui9SL9e2/3xzlRQgBkOyBFBkgriBuK1pg0xJfkcrZ6fh3xirGkww3A4FfpGrk4iGL4ZDmOtZOtf6JKGM85sX6cTrAjif6c09cE0mrgRN/Bey1m55IKddRDYOWM8fIo+RJ2uJ1ybD4YPcliQbEL9qBnHN9rl40M3c68YVFGerun7XGx8Jk/0sHWTJ1RM83zz1TvJVn9eryUj7mooBOR3cKtTe+Hh+k6Et+6zIl8cOEGJXXkNJB+V6vbCqCm2+IhgkJtxK6nyw8E4JMaP1bXbe7CBCE4yGNsgjJ9lWHmPAQAYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(6506007)(41300700001)(6666004)(478600001)(6486002)(186003)(83380400001)(66574015)(6512007)(2616005)(2906002)(5660300002)(316002)(8936002)(4326008)(8676002)(66556008)(66946007)(66476007)(36756003)(86362001)(38100700002)(31686004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0kvOUhCdnVyckx6bnVtMFUweEM3bjdKYTdtV1p2WEhaRE8yVVdqeStIVEFK?=
 =?utf-8?B?UlFjaGpaaGVKVEhnZmRFOVVENVI0UGhpSGxPc25NV3RUZGRudThzMzBUWGpD?=
 =?utf-8?B?SHRRVWJTdXRhbjJHWjlsNXFHYkxRUWw4VWl3Y1c5KzRoTGgyS1JUTFphNSt5?=
 =?utf-8?B?eTl5aHhDL0kwTmZ1R1JBTU1XbnllY05oK2ZieHp6cThaSUQ5TWFMV09YWjNI?=
 =?utf-8?B?bkdqa2lyYzYyeUUwRVNMcitHdnlZakJxTVU4OHhVYkZTUUpKTGtZR1RBWE1y?=
 =?utf-8?B?dm4yUVBEeS9jMkdYdHhSL25mM1MxdWIrbElwVEp1SDYxYzZHNFNpbHExa3dh?=
 =?utf-8?B?SjRQS05wRmYxOStNMDJqTzhxcEk2b2hkb2MvaTl6eDhzb3B2cHl1eDdYR0JR?=
 =?utf-8?B?dmx4RlRyMmpmU2VPakQ0Y0M3RklKU2pnZ1hVMTJnblU4V21CN0F0OHNoS25y?=
 =?utf-8?B?YUUvdlBWeVpDQm9CS2w3dnBrYW81WmhyemJLNjN3NkpSQk5CUExYZytKcXBP?=
 =?utf-8?B?d0E3Q2taeTEwYkVGQndFM2dtWnRrUkNxUnRRS1pTY2p1NStjdVIyUUlYUnBJ?=
 =?utf-8?B?VS9JbFllenJ0VGlYYi80RDEzQktQMGR5VXYxTU83emlYU0pYZjBWZ0tRemVI?=
 =?utf-8?B?bWVteDNrQ3ZmWVoyeFhXS0x4WTVOQ3BJYUpVSFl1S0E4K0FzNXk3dTliZlNS?=
 =?utf-8?B?K2xHWkN4QjRCRFNtaW9md1RVNkU0R3M5Z0xIQWYzZnZkejNld2txQlFCWE9J?=
 =?utf-8?B?RTgzZVhhVnNyZk5lRXpBSWFuN0orSUgvWmNOYzBaQmpubXI4V1VFTXJTdHEx?=
 =?utf-8?B?Qkx5UUFVcWlTK1pxRVhEeml6dmM2cDk2dzdMNzR6UThwQWJVTE9ZZkdYOGFM?=
 =?utf-8?B?YTM3dS8rV1MyWk44ZVVoMEh3bXdza1YyNkt2L3BCVjlERTdkSU1za2U5R1dP?=
 =?utf-8?B?SS9HZy9WL29IWmpNQUt5M1ZjcGZqVUhtU2w3dTAwUHYrSUFVVmtId2JoeC91?=
 =?utf-8?B?STB0U0s3UXMzL3hWMVM0RUJ2R3ZYWEdvSGVvV2NXK3FlZkhJWFptbEIzS1dk?=
 =?utf-8?B?WmhYUkx6UGRGVlR4THJRc1F4cUdzaFZ6V3gvQ0R5YzBTZnZFUVUwZlVXNTBu?=
 =?utf-8?B?RkNob3FuRGgwZXc1NHNoSkFPNVQ0WTRIcGhBZFFFbmFyOXhuTVNtUU9SenVR?=
 =?utf-8?B?Qk1RMHZ1RndldmFWbURZZ2dxbldxWWFWQ2V4WjFVaXZxZHVjZm1tekprNVMy?=
 =?utf-8?B?RTEzRFdZV1RkVkR1eUdvV2VaWW1RWGNPeWwrR0MrRkFJNVAvUm5KYkhVUkNT?=
 =?utf-8?B?MU16QW8vbW9TWklvNUxiUkhoaWtHdGt0R3Vsam8xZjJkL21PSlpkdkVOOFY3?=
 =?utf-8?B?WFE4VFF3Zy9yelVYVE1WWjk0QWNNWVpHcnlFNTBBbDlnK0VCWmxudUhMZDFM?=
 =?utf-8?B?SWVjV2MwQm9PTWQwVFptVFZ0WDZyeVhMa243cmM0QVh6c0xQTTk4Z3ZDV1JH?=
 =?utf-8?B?SWplUjJvQUhDSFdrUnROU1V0N1B6cDBLd1pNN1k3ampnRG91RDNuaGRrMFB4?=
 =?utf-8?B?ZXNhcTE3R0h0aHJMOVJ6OFNSLzdqdkVmTEc2UlFEamh4MTFuVlhhTmRpTXRZ?=
 =?utf-8?B?YmRUSkh2eFlCbmhjNG5XMGoxeW5MWmJ1TnlvQnRURkVLaTZSTnhNbytkVndk?=
 =?utf-8?B?anJZemlQN3dzSWNzMElpL2VoNW1zb3M3Q09rUEh2V3BaK1BvL3lUTG9NY3k0?=
 =?utf-8?B?Y2czQ2poVEsrWGtoQWM0dGphUTRVWkVxa1NCdTR5ZDVINWhCaDdnWmMvejh3?=
 =?utf-8?B?dGVzT0RXOHFLc2pkcXdra255am93VE03bzNib0ZOYkp1cHczRTd1MHhLZVcv?=
 =?utf-8?B?aWRaL2RtMmxKNzdsK252U25nazJuZXZMVFRPSE1hdXdlamtiVVZKM24xWGJ5?=
 =?utf-8?B?NEt6cTJzV0pRQzVjM05SV0p3dTVkZ04wSHhkUXZCazBPNUE2MlJuSkRJcCtI?=
 =?utf-8?B?enlqcXl1TU1KdGtsMkNpTFZuS3ZmL1AvVjdaZ0pVREVDNWRZYWpuYWZzUzZ6?=
 =?utf-8?B?WHl4UTB5ZWFMekJJY2xFTmEweUtCL0JTNTBMU210UG1oZ0Z3R1pKL29DU2J6?=
 =?utf-8?B?eS91WVFpK0pGU2ZDU3NmRm5jZ1Rya3RUcUtueTVJQmp3bXoxNFZCV3V4elp2?=
 =?utf-8?Q?8U0G2n3N1pCl193/0eWw7C2QgGMWhznNPhfcudsgYQ3u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1079ff-9fc1-4c9c-dc64-08da66686ca1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:46:31.3087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPDV/oGlXsMFjUes9S375SfhuPjgMz0RPRk2RIIhBZzSnR5AoiM0zkJpOjxQo697
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1495
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.22 um 12:12 schrieb Arunpravin Paneer Selvam:
> User reported gpu page fault when running graphics applications
> and in some cases garbaged graphics are observed as soon as X
> starts. This patch fixes all the issues.
>
> Fixed the typecast issue for fpfn and lpfn variables, thus
> preventing the overflow problem which resolves the memory
> corruption.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Reported-by: Mike Lothian <mike@fireburn.co.uk>
> Tested-by: Mike Lothian <mike@fireburn.co.uk>

Reviewed-by: Christian König <christian.koenig@amd.com>

I've re-applied the patches to drm-misc-next, solved the conflict in 
drm-tip and then pushed this to drm-misc-next-fixes.

With a little bit of luck everything should now be in place, but fingers 
crossed.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 16 ++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 49e4092f447f..34d789054ec8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -366,11 +366,11 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	unsigned long pages_per_block;
>   	int r;
>   
> -	lpfn = place->lpfn << PAGE_SHIFT;
> +	lpfn = (u64)place->lpfn << PAGE_SHIFT;
>   	if (!lpfn)
>   		lpfn = man->size;
>   
> -	fpfn = place->fpfn << PAGE_SHIFT;
> +	fpfn = (u64)place->fpfn << PAGE_SHIFT;
>   
>   	max_bytes = adev->gmc.mc_vram_size;
>   	if (tbo->type != ttm_bo_type_kernel)
> @@ -410,12 +410,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		/* Allocate blocks in desired range */
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> -	remaining_size = vres->base.num_pages << PAGE_SHIFT;
> +	remaining_size = (u64)vres->base.num_pages << PAGE_SHIFT;
>   
>   	mutex_lock(&mgr->lock);
>   	while (remaining_size) {
>   		if (tbo->page_alignment)
> -			min_block_size = tbo->page_alignment << PAGE_SHIFT;
> +			min_block_size = (u64)tbo->page_alignment << PAGE_SHIFT;
>   		else
>   			min_block_size = mgr->default_page_size;
>   
> @@ -424,12 +424,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		/* Limit maximum size to 2GiB due to SG table limitations */
>   		size = min(remaining_size, 2ULL << 30);
>   
> -		if (size >= pages_per_block << PAGE_SHIFT)
> -			min_block_size = pages_per_block << PAGE_SHIFT;
> +		if (size >= (u64)pages_per_block << PAGE_SHIFT)
> +			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
>   
>   		cur_size = size;
>   
> -		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
> +		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
>   			/*
>   			 * Except for actual range allocation, modify the size and
>   			 * min_block_size conforming to continuous flag enablement
> @@ -469,7 +469,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		LIST_HEAD(temp);
>   
>   		trim_list = &vres->blocks;
> -		original_size = vres->base.num_pages << PAGE_SHIFT;
> +		original_size = (u64)vres->base.num_pages << PAGE_SHIFT;
>   
>   		/*
>   		 * If size value is rounded up to min_block_size, trim the last
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index 9a2db87186c7..bef0f561ba60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -50,7 +50,7 @@ static inline u64 amdgpu_vram_mgr_block_start(struct drm_buddy_block *block)
>   
>   static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>   {
> -	return PAGE_SIZE << drm_buddy_block_order(block);
> +	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
>   }
>   
>   static inline struct drm_buddy_block *

