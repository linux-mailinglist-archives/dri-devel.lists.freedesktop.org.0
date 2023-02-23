Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5E6A0729
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 12:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290B10EB15;
	Thu, 23 Feb 2023 11:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9359A10E4CC;
 Thu, 23 Feb 2023 11:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbyfC8Y1k6fbtPHLoIPvOzUCCitl7HoEl6Di66hT6fAEpJYFPSEZ87RyUOQiCD+7xIDxiPcoSG93Dr04grg0rSlJzmdF8GreT5jsQQ5tbv1BX4rLayFVk4OHa8beS1TFGDoBRlpDuw0yi0vUjxO1m3lId5EKMbnd6UHJMs5qmvK4gtWZ02lGBXpu839EJA4EB/fL7TP0YWiwTo+WPjmByF4JkdNCmCaBRo7jsPHoRtq7ml4TwrY6CsNaEcm7YuIQBR1IT2KzED3m4zJXuWHdZnL1gJiyaTEcGZwWiY+enzqrLpIE8PPLyeCJ7kFZ3mUpucQjgQXDAS9bSwJUrOiWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIfYu7XRc4DuSrdIIXA5K6YyFkkxEJ2YZGS0l1b2qTk=;
 b=WRWMD2BgHCsaqYh8ytPn/j/qIslNxUt6oWxWwXa/HSOONyqQ7bpzIpKXzXz+QmpFt8Ej7ti9Xd+hb+AS0baGkCu9VUXEilDSPTa4xU0Z2Y5So5XpPvET8MAzvBlkaCtEymgEtk6d6zLd+K/8TChIN/l8bI5QiJcAwkO5+f+Tsw0dTABRuuHKgmW54jgwI/2v+5PZU8YJXj/exJ0itv0mfpFRtgGsJJzu6kgmdp5A7Vtk4GdrW5eoH21+gEv+qUk6QomJF6Uzd27/HzdlaQTHxXn9SWaKMzMx/jYz6EZmaFB+sanhHWGU67FQyQwE0RJbGBzR+jTXWFjtJxqWYG82RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIfYu7XRc4DuSrdIIXA5K6YyFkkxEJ2YZGS0l1b2qTk=;
 b=rmP9znA2ObuaEUIhC4cH7CGGNvEgQTPZd1q38rf8HyAafmmN6FdNvKOspVIS2Bqqrk8yKXtS7gg2m/s2NZ+E1V6Kk0abkDFfSSpnM6YVT/2Dr0Knv9c9VZtbxJ1I5vLxcpExo6OKLngYxXS/iE9yFi5kY2VCs+VuMsTKN/5UZ8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 11:16:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 11:16:00 +0000
Message-ID: <204ae1e9-de6f-0ab0-6d49-b6451168a384@amd.com>
Date: Thu, 23 Feb 2023 12:15:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] drm/amd: Convert amdgpu to use suballocation helper.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230223105747.4719-1-thomas.hellstrom@linux.intel.com>
 <20230223105747.4719-3-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230223105747.4719-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c2048c-fe71-4171-59f1-08db158f582f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X3GxaHcDdZCmMU64xYBc5XlMeqRXloB2Mz7snQxZikduZxdniQxUW2ZZojo1rjAKGYLcvHCyiCGEdPjXQDVJQUo6XKuNviSjj7M1htszECdps6FOFcbtqnAoVl7OYAofbRxfIBXu223eSnf4/k+s4BgyNXwT4rJnzD+vsTy8cApxBY4pB656YFn+9UkfIsupprCYWLuuI5ycf7vblBUOLn5gseD3VAkQnz8zLcD2eatW8eCdIlPJ5SZaJGJFj/vnn0g//6xXT8CXnRS6I6HP09rOhKx3KoYDbqLDy9tWcSZX1yx4e5bLbC2J50Xh5L4+OcMGjo2hlUpcH0J3dhzcZVVjX1/1+1xeNY3WMpDU/q2eF17l7bBhbu9DlcV0sdQ38yUzYq/BVZZH1jDuU4alekGEvBWofOfP6XTozYvN2f0mwzKxXmKLA1FdU4IDkFEqJTipeCwwiujg4/xl7+51tzptioRPsKyHcYfN/Rhp6h5fCuPKtH8iQeruXNTt12WtamS74qL5hwaSF0tnCgnzRJXXFzWZCQh7a1vWXzSMBfFi0eV3gxCHVhMRsxwF5OxT/QchMQxS7qf9Av6BLpk1v28liup5++52q9AoxZg2CtaP9ybmJ6ur2iY9Wqyo5O90OhX933UPhp1k4VSENYN5n8sj8QCHOOhMMp0tlLI08Z+xL2NnGjcq6P+6nwFlcdtXX+rQPn4CTmwPwXaeyXX+NV13KTWN2h9Fw8xhOXaRcw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199018)(2616005)(2906002)(36756003)(66574015)(66946007)(5660300002)(41300700001)(66476007)(4326008)(66556008)(8676002)(8936002)(30864003)(83380400001)(478600001)(186003)(26005)(6512007)(6506007)(38100700002)(31686004)(6486002)(6666004)(31696002)(316002)(86362001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmViYVNVNk5PdVlDV1JROW9STU9vcjdBUGwzZm9kNFZhNXpQTDQvcTVkOTJB?=
 =?utf-8?B?VjBaZlVOWTZqSXQySUE1WE5INVRUUHpDaFBkcWhxV2g3bmg4NkhGRnp2RUVy?=
 =?utf-8?B?WlVCT1NnRDNqb2R0VUYyU0ZMNllORi93S1ZsWVU2OFJPOHF0Wlo5OU1VK24r?=
 =?utf-8?B?cSszb2NGak1zV0NkekFYMUZ4dkY3UVhpeWRZWXg2YXNPL2FJeVhxQXFCOVBL?=
 =?utf-8?B?RDFXUmlsQXo1T3E1WHZuZGQ5V042LytSNi92ODRPSjdpb1V6VmFUZEF0eHE0?=
 =?utf-8?B?eWJOQ1puY0VDdTJZS2FYczJYYTZTRzVhUndheng1NjJxVHI1ckV6ZXFHL2hi?=
 =?utf-8?B?cHZCWkt1ODdLRHBqMU40ZnRZNTFCTXhTQ0N1VU9Bd2lRYUFJQjdReHBrY25w?=
 =?utf-8?B?RXovbUZ4VzB2YXlibVRRNm9BODExTTdWcmROWThDWjJIaHl4UHlKUWorbVpW?=
 =?utf-8?B?VFhGVi9vQlNnYWFyOW5KbXFYSTdDRDJlQ3VHdWdhbml4UzBORW9sbFJRVjRy?=
 =?utf-8?B?Z2p5dUNBYjVwZXlQUFozK0hNRUx2K29zSmkvdEtwaXRQQlZpNEhvYnJYQ2Vj?=
 =?utf-8?B?Ky9pQ2k4UVFqbFBGb0k4aWpjV2VkNUV5LzVaZExYVisrYnlnVHIyOUpXY293?=
 =?utf-8?B?Z3lncC9aZXZFcnY5ZytHZTdRK1ZPSWtIckVxNVdUcm9QWjE1a0pObmdvOTMz?=
 =?utf-8?B?YjlSd3UrZmlLT25pcDFxeFJFNDFKclNlRzFuWVNoUnBNZENlcUV4NXk5N0Vp?=
 =?utf-8?B?WExDRjFpRFgvOTZXenlaK3NBcTRPYWFVVVBzR0hLSG5ML1RRSTFxajBzMmds?=
 =?utf-8?B?M0I0bXg3dWR0M0FoVm9XZGNTS2dmSkN3QnBra2hsd2ZXZDNwL0VMNGMxYncx?=
 =?utf-8?B?RmVJWDFlZnErRlhCNXRuV0w0SmNjbDZBU29JWTlRNW4xRElWQnYzT3lTM29E?=
 =?utf-8?B?dGRNNEx4V1RqR2Q2WGxBVnBMTmZwZDZ0UkIwTENDcG80MlFlZ0tBcldyMEY5?=
 =?utf-8?B?QjdBcHI3TXZER2YyNHUvNEtzOUhkUjBneWVjcmg3Nnc1cU5vamZrbWNWRER5?=
 =?utf-8?B?aDZ2UE54dXE0OVVRZWdxT2RhdGo1eXZIY2lQSmpFVGJ0QjNDTHYyRlZCUXo5?=
 =?utf-8?B?NXdRV1Nud1BaRzlZci96eHUxRURrUHh4bXUxbmV0TmUwQlQ5Y0lrNUdnSzZU?=
 =?utf-8?B?QTljTkkvdlFJekorQks4KzN1NmdtazBud0NycEh4eFRRbVJJWnM1cEYxYjJw?=
 =?utf-8?B?eUJiTnZwVlU4MVlrSENLM0NJTldNdzNVZEtmckFDRHNIZ1RWSW1ZNUhmNEgx?=
 =?utf-8?B?WkpGR293U1l3bjBSRit5V0ZjZzQzby9JZk5EZXZETjhlNXpmd2M4dGlvQXFo?=
 =?utf-8?B?MXF5NitxM0cwSXdWN0xxUnkwWmYxYU9oY0NSTnlodHFtRkh1WS9uTVNFVWdt?=
 =?utf-8?B?NEp3MEk3SFdNc0pucE1tNTdRRHRjdnFWN2d2a0dGL2Z2TldEZE56eCtYdUNk?=
 =?utf-8?B?UTkxWDN1SHRzcUlGaUhabzVTUVFnaFVQbWIrdUgrcXZXSzJCNEJoT3VZazdP?=
 =?utf-8?B?OFBvYWYrQXhXMlVaN1VlNDU4VVFNY2p1T2FWbHBPc0RPSnBvckFHZ0xaaGRa?=
 =?utf-8?B?TGxNajVwbXZwTU4xaU5RRCs1ZU9DTzF6WFdSUSszMytoQlJBbWtBZjRWV2dk?=
 =?utf-8?B?SVlTRTZlc2ZDc1FKN2VtdThQb2s5YnlQZE5yUTdoOTJWZ2IyazFyTWZiS3BI?=
 =?utf-8?B?VnRyaUQvN0FUMTV6b1BOK2tiTzRFNEU4M2labnBDWHRsQ2NFL2VDalhkeUZv?=
 =?utf-8?B?MkZsblNJdVIvRU9YYUtYeVdrY2RIWmN0YmJ1a2p3VHp2T1llQ21iWmhFMDdX?=
 =?utf-8?B?b1BQYnpQOVZHY0ZhYjYwTFJUUVpGOFVQMlZnS0x2VVNyKzVIYUEzK0V3V0t6?=
 =?utf-8?B?aVlpWENOT1JpQXhINmhJTzhqTExGd1ZkRW5UczAyNWdJRW9tcVFsNlNEUGVR?=
 =?utf-8?B?Q3NoUFE3Q2pka3k1WkZTMUhLS3k0RURoTEc0dkRXMW1xaHZSLzFlVjlnUm00?=
 =?utf-8?B?MEUzR2VvbTdNMkM5L3pZSVBIWkhuNDFmOC84SzlRZlFXZnJoSElxODRxRDRK?=
 =?utf-8?Q?l7w0KAwDLZJ7+q7n7Q6r5Fmku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c2048c-fe71-4171-59f1-08db158f582f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:16:00.8468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXEWwaaPUmToi8a3Mk1VR6BO1j3b4eN6t920GnDO/SflpPUL7KmIc+9JXWKppvWo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.02.23 um 11:57 schrieb Thomas Hellström:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Now that we have a generic suballocation helper, Use it in amdgpu.
> For lines that get moved or changed, also fix up pre-existing style issues.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/Kconfig                    |   1 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 ++-------------------
>   7 files changed, 46 insertions(+), 337 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 8fbe57407c60..73ddfdf3a894 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -77,6 +77,7 @@ config DRM_KUNIT_TEST
>   	select DRM_DISPLAY_HELPER
>   	select DRM_LIB_RANDOM
>   	select DRM_KMS_HELPER
> +	select DRM_SUBALLOC_HELPER
>   	select DRM_BUDDY
>   	select DRM_EXPORT_FOR_TESTS if m
>   	select DRM_KUNIT_TEST_HELPERS

This looks like it's misplaced, apart from that the patch looks good to me.

Regards,
Christian.

> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 5341b6b242c3..0ed12171450b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -18,6 +18,7 @@ config DRM_AMDGPU
>   	select BACKLIGHT_CLASS_DEVICE
>   	select INTERVAL_TREE
>   	select DRM_BUDDY
> +	select DRM_SUBALLOC_HELPER
>   	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
>   	# ACPI_VIDEO's dependencies must also be selected.
>   	select INPUT if ACPI
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 164141bc8b4a..dda88090f044 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -424,29 +424,11 @@ struct amdgpu_clock {
>    * alignment).
>    */
>   
> -#define AMDGPU_SA_NUM_FENCE_LISTS	32
> -
>   struct amdgpu_sa_manager {
> -	wait_queue_head_t	wq;
> -	struct amdgpu_bo	*bo;
> -	struct list_head	*hole;
> -	struct list_head	flist[AMDGPU_SA_NUM_FENCE_LISTS];
> -	struct list_head	olist;
> -	unsigned		size;
> -	uint64_t		gpu_addr;
> -	void			*cpu_ptr;
> -	uint32_t		domain;
> -	uint32_t		align;
> -};
> -
> -/* sub-allocation buffer */
> -struct amdgpu_sa_bo {
> -	struct list_head		olist;
> -	struct list_head		flist;
> -	struct amdgpu_sa_manager	*manager;
> -	unsigned			soffset;
> -	unsigned			eoffset;
> -	struct dma_fence	        *fence;
> +	struct drm_suballoc_manager	base;
> +	struct amdgpu_bo		*bo;
> +	uint64_t			gpu_addr;
> +	void				*cpu_ptr;
>   };
>   
>   int amdgpu_fence_slab_init(void);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> index bcccc348dbe2..df7eb0b7c4b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -69,7 +69,7 @@ int amdgpu_ib_get(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   
>   	if (size) {
>   		r = amdgpu_sa_bo_new(&adev->ib_pools[pool_type],
> -				      &ib->sa_bo, size, 256);
> +				     &ib->sa_bo, size);
>   		if (r) {
>   			dev_err(adev->dev, "failed to get a new IB (%d)\n", r);
>   			return r;
> @@ -309,8 +309,7 @@ int amdgpu_ib_pool_init(struct amdgpu_device *adev)
>   
>   	for (i = 0; i < AMDGPU_IB_POOL_MAX; i++) {
>   		r = amdgpu_sa_bo_manager_init(adev, &adev->ib_pools[i],
> -					      AMDGPU_IB_POOL_SIZE,
> -					      AMDGPU_GPU_PAGE_SIZE,
> +					      AMDGPU_IB_POOL_SIZE, 256,
>   					      AMDGPU_GEM_DOMAIN_GTT);
>   		if (r)
>   			goto error;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 93207badf83f..5a85726ce853 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -336,15 +336,22 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>   /*
>    * sub allocation
>    */
> +static inline struct amdgpu_sa_manager *
> +to_amdgpu_sa_manager(struct drm_suballoc_manager *manager)
> +{
> +	return container_of(manager, struct amdgpu_sa_manager, base);
> +}
>   
> -static inline uint64_t amdgpu_sa_bo_gpu_addr(struct amdgpu_sa_bo *sa_bo)
> +static inline uint64_t amdgpu_sa_bo_gpu_addr(struct drm_suballoc *sa_bo)
>   {
> -	return sa_bo->manager->gpu_addr + sa_bo->soffset;
> +	return to_amdgpu_sa_manager(sa_bo->manager)->gpu_addr +
> +		drm_suballoc_soffset(sa_bo);
>   }
>   
> -static inline void * amdgpu_sa_bo_cpu_addr(struct amdgpu_sa_bo *sa_bo)
> +static inline void *amdgpu_sa_bo_cpu_addr(struct drm_suballoc *sa_bo)
>   {
> -	return sa_bo->manager->cpu_ptr + sa_bo->soffset;
> +	return to_amdgpu_sa_manager(sa_bo->manager)->cpu_ptr +
> +		drm_suballoc_soffset(sa_bo);
>   }
>   
>   int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
> @@ -355,11 +362,11 @@ void amdgpu_sa_bo_manager_fini(struct amdgpu_device *adev,
>   int amdgpu_sa_bo_manager_start(struct amdgpu_device *adev,
>   				      struct amdgpu_sa_manager *sa_manager);
>   int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
> -		     struct amdgpu_sa_bo **sa_bo,
> -		     unsigned size, unsigned align);
> +		     struct drm_suballoc **sa_bo,
> +		     unsigned int size);
>   void amdgpu_sa_bo_free(struct amdgpu_device *adev,
> -			      struct amdgpu_sa_bo **sa_bo,
> -			      struct dma_fence *fence);
> +		       struct drm_suballoc **sa_bo,
> +		       struct dma_fence *fence);
>   #if defined(CONFIG_DEBUG_FS)
>   void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager *sa_manager,
>   					 struct seq_file *m);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 3989e755a5b4..018f36b10de8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -27,6 +27,7 @@
>   #include <drm/amdgpu_drm.h>
>   #include <drm/gpu_scheduler.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_suballoc.h>
>   
>   struct amdgpu_device;
>   struct amdgpu_ring;
> @@ -92,7 +93,7 @@ enum amdgpu_ib_pool_type {
>   };
>   
>   struct amdgpu_ib {
> -	struct amdgpu_sa_bo		*sa_bo;
> +	struct drm_suballoc		*sa_bo;
>   	uint32_t			length_dw;
>   	uint64_t			gpu_addr;
>   	uint32_t			*ptr;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
> index 524d10b21041..c6b4337eb20c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c
> @@ -44,327 +44,63 @@
>   
>   #include "amdgpu.h"
>   
> -static void amdgpu_sa_bo_remove_locked(struct amdgpu_sa_bo *sa_bo);
> -static void amdgpu_sa_bo_try_free(struct amdgpu_sa_manager *sa_manager);
> -
>   int amdgpu_sa_bo_manager_init(struct amdgpu_device *adev,
>   			      struct amdgpu_sa_manager *sa_manager,
> -			      unsigned size, u32 align, u32 domain)
> +			      unsigned int size, u32 suballoc_align, u32 domain)
>   {
> -	int i, r;
> -
> -	init_waitqueue_head(&sa_manager->wq);
> -	sa_manager->bo = NULL;
> -	sa_manager->size = size;
> -	sa_manager->domain = domain;
> -	sa_manager->align = align;
> -	sa_manager->hole = &sa_manager->olist;
> -	INIT_LIST_HEAD(&sa_manager->olist);
> -	for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
> -		INIT_LIST_HEAD(&sa_manager->flist[i]);
> +	int r;
>   
> -	r = amdgpu_bo_create_kernel(adev, size, align, domain, &sa_manager->bo,
> -				&sa_manager->gpu_addr, &sa_manager->cpu_ptr);
> +	r = amdgpu_bo_create_kernel(adev, size, AMDGPU_GPU_PAGE_SIZE, domain,
> +				    &sa_manager->bo, &sa_manager->gpu_addr,
> +				    &sa_manager->cpu_ptr);
>   	if (r) {
>   		dev_err(adev->dev, "(%d) failed to allocate bo for manager\n", r);
>   		return r;
>   	}
>   
> -	memset(sa_manager->cpu_ptr, 0, sa_manager->size);
> +	memset(sa_manager->cpu_ptr, 0, size);
> +	drm_suballoc_manager_init(&sa_manager->base, size, suballoc_align);
>   	return r;
>   }
>   
>   void amdgpu_sa_bo_manager_fini(struct amdgpu_device *adev,
>   			       struct amdgpu_sa_manager *sa_manager)
>   {
> -	struct amdgpu_sa_bo *sa_bo, *tmp;
> -
>   	if (sa_manager->bo == NULL) {
>   		dev_err(adev->dev, "no bo for sa manager\n");
>   		return;
>   	}
>   
> -	if (!list_empty(&sa_manager->olist)) {
> -		sa_manager->hole = &sa_manager->olist,
> -		amdgpu_sa_bo_try_free(sa_manager);
> -		if (!list_empty(&sa_manager->olist)) {
> -			dev_err(adev->dev, "sa_manager is not empty, clearing anyway\n");
> -		}
> -	}
> -	list_for_each_entry_safe(sa_bo, tmp, &sa_manager->olist, olist) {
> -		amdgpu_sa_bo_remove_locked(sa_bo);
> -	}
> +	drm_suballoc_manager_fini(&sa_manager->base);
>   
>   	amdgpu_bo_free_kernel(&sa_manager->bo, &sa_manager->gpu_addr, &sa_manager->cpu_ptr);
> -	sa_manager->size = 0;
>   }
>   
> -static void amdgpu_sa_bo_remove_locked(struct amdgpu_sa_bo *sa_bo)
> -{
> -	struct amdgpu_sa_manager *sa_manager = sa_bo->manager;
> -	if (sa_manager->hole == &sa_bo->olist) {
> -		sa_manager->hole = sa_bo->olist.prev;
> -	}
> -	list_del_init(&sa_bo->olist);
> -	list_del_init(&sa_bo->flist);
> -	dma_fence_put(sa_bo->fence);
> -	kfree(sa_bo);
> -}
> -
> -static void amdgpu_sa_bo_try_free(struct amdgpu_sa_manager *sa_manager)
> +int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
> +		     struct drm_suballoc **sa_bo,
> +		     unsigned int size)
>   {
> -	struct amdgpu_sa_bo *sa_bo, *tmp;
> +	struct drm_suballoc *sa = drm_suballoc_new(&sa_manager->base, size,
> +						   GFP_KERNEL, true, 0);
>   
> -	if (sa_manager->hole->next == &sa_manager->olist)
> -		return;
> +	if (IS_ERR(sa)) {
> +		*sa_bo = NULL;
>   
> -	sa_bo = list_entry(sa_manager->hole->next, struct amdgpu_sa_bo, olist);
> -	list_for_each_entry_safe_from(sa_bo, tmp, &sa_manager->olist, olist) {
> -		if (sa_bo->fence == NULL ||
> -		    !dma_fence_is_signaled(sa_bo->fence)) {
> -			return;
> -		}
> -		amdgpu_sa_bo_remove_locked(sa_bo);
> +		return PTR_ERR(sa);
>   	}
> -}
>   
> -static inline unsigned amdgpu_sa_bo_hole_soffset(struct amdgpu_sa_manager *sa_manager)
> -{
> -	struct list_head *hole = sa_manager->hole;
> -
> -	if (hole != &sa_manager->olist) {
> -		return list_entry(hole, struct amdgpu_sa_bo, olist)->eoffset;
> -	}
> +	*sa_bo = sa;
>   	return 0;
>   }
>   
> -static inline unsigned amdgpu_sa_bo_hole_eoffset(struct amdgpu_sa_manager *sa_manager)
> -{
> -	struct list_head *hole = sa_manager->hole;
> -
> -	if (hole->next != &sa_manager->olist) {
> -		return list_entry(hole->next, struct amdgpu_sa_bo, olist)->soffset;
> -	}
> -	return sa_manager->size;
> -}
> -
> -static bool amdgpu_sa_bo_try_alloc(struct amdgpu_sa_manager *sa_manager,
> -				   struct amdgpu_sa_bo *sa_bo,
> -				   unsigned size, unsigned align)
> -{
> -	unsigned soffset, eoffset, wasted;
> -
> -	soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
> -	eoffset = amdgpu_sa_bo_hole_eoffset(sa_manager);
> -	wasted = (align - (soffset % align)) % align;
> -
> -	if ((eoffset - soffset) >= (size + wasted)) {
> -		soffset += wasted;
> -
> -		sa_bo->manager = sa_manager;
> -		sa_bo->soffset = soffset;
> -		sa_bo->eoffset = soffset + size;
> -		list_add(&sa_bo->olist, sa_manager->hole);
> -		INIT_LIST_HEAD(&sa_bo->flist);
> -		sa_manager->hole = &sa_bo->olist;
> -		return true;
> -	}
> -	return false;
> -}
> -
> -/**
> - * amdgpu_sa_event - Check if we can stop waiting
> - *
> - * @sa_manager: pointer to the sa_manager
> - * @size: number of bytes we want to allocate
> - * @align: alignment we need to match
> - *
> - * Check if either there is a fence we can wait for or
> - * enough free memory to satisfy the allocation directly
> - */
> -static bool amdgpu_sa_event(struct amdgpu_sa_manager *sa_manager,
> -			    unsigned size, unsigned align)
> -{
> -	unsigned soffset, eoffset, wasted;
> -	int i;
> -
> -	for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
> -		if (!list_empty(&sa_manager->flist[i]))
> -			return true;
> -
> -	soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
> -	eoffset = amdgpu_sa_bo_hole_eoffset(sa_manager);
> -	wasted = (align - (soffset % align)) % align;
> -
> -	if ((eoffset - soffset) >= (size + wasted)) {
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -static bool amdgpu_sa_bo_next_hole(struct amdgpu_sa_manager *sa_manager,
> -				   struct dma_fence **fences,
> -				   unsigned *tries)
> -{
> -	struct amdgpu_sa_bo *best_bo = NULL;
> -	unsigned i, soffset, best, tmp;
> -
> -	/* if hole points to the end of the buffer */
> -	if (sa_manager->hole->next == &sa_manager->olist) {
> -		/* try again with its beginning */
> -		sa_manager->hole = &sa_manager->olist;
> -		return true;
> -	}
> -
> -	soffset = amdgpu_sa_bo_hole_soffset(sa_manager);
> -	/* to handle wrap around we add sa_manager->size */
> -	best = sa_manager->size * 2;
> -	/* go over all fence list and try to find the closest sa_bo
> -	 * of the current last
> -	 */
> -	for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i) {
> -		struct amdgpu_sa_bo *sa_bo;
> -
> -		fences[i] = NULL;
> -
> -		if (list_empty(&sa_manager->flist[i]))
> -			continue;
> -
> -		sa_bo = list_first_entry(&sa_manager->flist[i],
> -					 struct amdgpu_sa_bo, flist);
> -
> -		if (!dma_fence_is_signaled(sa_bo->fence)) {
> -			fences[i] = sa_bo->fence;
> -			continue;
> -		}
> -
> -		/* limit the number of tries each ring gets */
> -		if (tries[i] > 2) {
> -			continue;
> -		}
> -
> -		tmp = sa_bo->soffset;
> -		if (tmp < soffset) {
> -			/* wrap around, pretend it's after */
> -			tmp += sa_manager->size;
> -		}
> -		tmp -= soffset;
> -		if (tmp < best) {
> -			/* this sa bo is the closest one */
> -			best = tmp;
> -			best_bo = sa_bo;
> -		}
> -	}
> -
> -	if (best_bo) {
> -		uint32_t idx = best_bo->fence->context;
> -
> -		idx %= AMDGPU_SA_NUM_FENCE_LISTS;
> -		++tries[idx];
> -		sa_manager->hole = best_bo->olist.prev;
> -
> -		/* we knew that this one is signaled,
> -		   so it's save to remote it */
> -		amdgpu_sa_bo_remove_locked(best_bo);
> -		return true;
> -	}
> -	return false;
> -}
> -
> -int amdgpu_sa_bo_new(struct amdgpu_sa_manager *sa_manager,
> -		     struct amdgpu_sa_bo **sa_bo,
> -		     unsigned size, unsigned align)
> -{
> -	struct dma_fence *fences[AMDGPU_SA_NUM_FENCE_LISTS];
> -	unsigned tries[AMDGPU_SA_NUM_FENCE_LISTS];
> -	unsigned count;
> -	int i, r;
> -	signed long t;
> -
> -	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return -EINVAL;
> -
> -	if (WARN_ON_ONCE(size > sa_manager->size))
> -		return -EINVAL;
> -
> -	*sa_bo = kmalloc(sizeof(struct amdgpu_sa_bo), GFP_KERNEL);
> -	if (!(*sa_bo))
> -		return -ENOMEM;
> -	(*sa_bo)->manager = sa_manager;
> -	(*sa_bo)->fence = NULL;
> -	INIT_LIST_HEAD(&(*sa_bo)->olist);
> -	INIT_LIST_HEAD(&(*sa_bo)->flist);
> -
> -	spin_lock(&sa_manager->wq.lock);
> -	do {
> -		for (i = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
> -			tries[i] = 0;
> -
> -		do {
> -			amdgpu_sa_bo_try_free(sa_manager);
> -
> -			if (amdgpu_sa_bo_try_alloc(sa_manager, *sa_bo,
> -						   size, align)) {
> -				spin_unlock(&sa_manager->wq.lock);
> -				return 0;
> -			}
> -
> -			/* see if we can skip over some allocations */
> -		} while (amdgpu_sa_bo_next_hole(sa_manager, fences, tries));
> -
> -		for (i = 0, count = 0; i < AMDGPU_SA_NUM_FENCE_LISTS; ++i)
> -			if (fences[i])
> -				fences[count++] = dma_fence_get(fences[i]);
> -
> -		if (count) {
> -			spin_unlock(&sa_manager->wq.lock);
> -			t = dma_fence_wait_any_timeout(fences, count, false,
> -						       MAX_SCHEDULE_TIMEOUT,
> -						       NULL);
> -			for (i = 0; i < count; ++i)
> -				dma_fence_put(fences[i]);
> -
> -			r = (t > 0) ? 0 : t;
> -			spin_lock(&sa_manager->wq.lock);
> -		} else {
> -			/* if we have nothing to wait for block */
> -			r = wait_event_interruptible_locked(
> -				sa_manager->wq,
> -				amdgpu_sa_event(sa_manager, size, align)
> -			);
> -		}
> -
> -	} while (!r);
> -
> -	spin_unlock(&sa_manager->wq.lock);
> -	kfree(*sa_bo);
> -	*sa_bo = NULL;
> -	return r;
> -}
> -
> -void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct amdgpu_sa_bo **sa_bo,
> +void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct drm_suballoc **sa_bo,
>   		       struct dma_fence *fence)
>   {
> -	struct amdgpu_sa_manager *sa_manager;
> -
>   	if (sa_bo == NULL || *sa_bo == NULL) {
>   		return;
>   	}
>   
> -	sa_manager = (*sa_bo)->manager;
> -	spin_lock(&sa_manager->wq.lock);
> -	if (fence && !dma_fence_is_signaled(fence)) {
> -		uint32_t idx;
> -
> -		(*sa_bo)->fence = dma_fence_get(fence);
> -		idx = fence->context % AMDGPU_SA_NUM_FENCE_LISTS;
> -		list_add_tail(&(*sa_bo)->flist, &sa_manager->flist[idx]);
> -	} else {
> -		amdgpu_sa_bo_remove_locked(*sa_bo);
> -	}
> -	wake_up_all_locked(&sa_manager->wq);
> -	spin_unlock(&sa_manager->wq.lock);
> +	drm_suballoc_free(*sa_bo, fence);
>   	*sa_bo = NULL;
>   }
>   
> @@ -373,26 +109,8 @@ void amdgpu_sa_bo_free(struct amdgpu_device *adev, struct amdgpu_sa_bo **sa_bo,
>   void amdgpu_sa_bo_dump_debug_info(struct amdgpu_sa_manager *sa_manager,
>   				  struct seq_file *m)
>   {
> -	struct amdgpu_sa_bo *i;
> -
> -	spin_lock(&sa_manager->wq.lock);
> -	list_for_each_entry(i, &sa_manager->olist, olist) {
> -		uint64_t soffset = i->soffset + sa_manager->gpu_addr;
> -		uint64_t eoffset = i->eoffset + sa_manager->gpu_addr;
> -		if (&i->olist == sa_manager->hole) {
> -			seq_printf(m, ">");
> -		} else {
> -			seq_printf(m, " ");
> -		}
> -		seq_printf(m, "[0x%010llx 0x%010llx] size %8lld",
> -			   soffset, eoffset, eoffset - soffset);
> +	struct drm_printer p = drm_seq_file_printer(m);
>   
> -		if (i->fence)
> -			seq_printf(m, " protected by 0x%016llx on context %llu",
> -				   i->fence->seqno, i->fence->context);
> -
> -		seq_printf(m, "\n");
> -	}
> -	spin_unlock(&sa_manager->wq.lock);
> +	drm_suballoc_dump_debug_info(&sa_manager->base, &p, sa_manager->gpu_addr);
>   }
>   #endif

