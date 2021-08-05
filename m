Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A63E1C44
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CFB6E5C8;
	Thu,  5 Aug 2021 19:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EF46E5C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOLGQ77aKL7AbSoiTBKeN9XktJduyK49T8ioy3cm59E9RAN3UD4j7ozNzAVvaYKxy0KCKkhG8teoMsuniw4kFhACFrtTr80M2h2PvNnsAY35/SSFftcysiponwhvSBzkBcw64HD2NG/BzPTbgJthtk1Vz+WS0WeuyKNZnd1FxxjrCsrK7PcaegUgXJ/jkPidZ0DqT15dq/7MMCT5qAeWXdUid9lLFLNZM/X1ZwzQ5EKuJ361aqNZaTKzWg8JsIPHyghSMoJr8jf7xyo3ZBcSAVR6/b/Wgc2K5FIWOBiO+H9Wlg6VMAaQV3g7ATDaHpPLsG/ctzI3XWPXObmXh//+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auj8Lx4jfaAju/sJVUXhmAewH7VJTtygCvAyzENHoxk=;
 b=j6+qs+AhQa+T4+0FoZcH6qO6SKZcYkldg4gSK37AQZ5QiCHHacwLOBajp1BF0nAPhrZKtKWIuD8YIUcIVTzRBbZfLp8HCQmTkXgMJPa6woYBJeVGLN+a/V5u54ndxq3RckXzHjCmDS67kjeF0Zrk33XKMsyKB6g5hm5sHDVLs0QqllpCK5VYBt5IZSdfLcb1lfj4F2oIBmrIiSzu3w5QkOQcy19V/rua8yEGZOGDjbbXY1RxOCodILfHiCDvzEkipwz/KVhJSbrWbU0uJeYfidsOhxyskGOK09cT41ewcUxp8Gt0DVOHd/+/DACfhKsmicmUW+orFfN5N0/IC6Vq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auj8Lx4jfaAju/sJVUXhmAewH7VJTtygCvAyzENHoxk=;
 b=Ths7mHb2pAO7sxbN98UlvzF9Un1LZqNEYK2bxhhXkum0+6g0O6ke177h2YKTcdpDdw6IJdwPap8A7bDI/kXJbF1kfVMkiQ9TSFF/kwwr9kaVp54QcTQXx+gMtV4ki+9bpq8Jff0u09L0HmlOyb8MMIpQWLi4sfSSZzO2mBuEdXE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3776.namprd12.prod.outlook.com (2603:10b6:208:167::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Thu, 5 Aug
 2021 19:16:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 19:16:33 +0000
Subject: Re: [RFC PATCH 13/15] mm: convert MAX_ORDER sized static arrays to
 dynamic ones.
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Michal Hocko <mhocko@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210805190253.2795604-1-zi.yan@sent.com>
 <20210805190253.2795604-14-zi.yan@sent.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <586dda97-dc64-ade2-6736-a531e225acbc@amd.com>
Date: Thu, 5 Aug 2021 21:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805190253.2795604-14-zi.yan@sent.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5db9:1819:342c:6954]
 (2a02:908:1252:fb60:5db9:1819:342c:6954) by
 PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 19:16:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41005fb-5063-4a23-af18-08d958458917
X-MS-TrafficTypeDiagnostic: MN2PR12MB3776:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3776361E06564B681F48A42483F29@MN2PR12MB3776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+08hOjeSMYBALnBZNAQdgowRbpEbWjrq5qRKFNMlafnTnnCVhqHXz4uwptZeu2hn2okVcLppzzN5D93n0GzHNXWjtkBi11OaF6d4KBolTGBNotPfxsO+rabQ5rKNSXjectj65chc9hIQX+OeVBLjJfsPgljMesVROBkAUW4dZ4Fu9KSV9W+85KTXnQE/bOtmcuh4oXVk1l+v8SQBFo8jtmVIxMXIjkEFve58sqK9+TskYtt/JYoXd2/g9uWKnpbdZXzo9rlov1/B2kmeA+AgIYKT/jcWjAV+QyUHQqXSx2OlsZywIwiSr5mIRIcXZsGTXE5GUb0gqcNBmmIwNpEqATXdRv8PYyVmU2IC6tH3/ThAseSfgOCLeQGKOLnjDLns3ZzV48XQ25qZ3201QtWtOnFpzGyH9sLYEMYR2j2GpWsPI4VVseWfLUKDpD51syydJQSs5Ltye7EgiBq4wC35EMSIihQJa6DAcG2xiB5Ebb222aWnhe1WmiQARScK61+Tx7ZWoe0PE4AFetwBYAOdnUwnRwchylLSaJWThothEKh/dTumfbUCrHifdQPyQ+6jJe2IjQ2IIvCi6x4P9r1lzZPw6SsCuFSN3VPlbbwztY5TtZl42VU6Op5sJWK6barBB0R8LeHJxLzY9caJA0z8rItcDEncOpiY2YezF7ueN7F++DOFjbSl0IENewcpB7ouf3NZoZEPZbNbSGu0kO/9ZWG3zbM8DDa+Ut1dkVMJXVLFY+C5wvZQKm73qgCQi/l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(186003)(5660300002)(30864003)(8936002)(8676002)(6486002)(36756003)(508600001)(38100700002)(31686004)(2616005)(4326008)(7416002)(86362001)(2906002)(66556008)(316002)(54906003)(110136005)(66476007)(66946007)(31696002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWF1NkE4WmI1bXZlK2R5VkVvSDRDV2M0YmpOdXkzVUhXcWd6bXhYb0JwbC9G?=
 =?utf-8?B?cHpPNTd5eHNpRDNLYkliRWhqdnljQ3l1M3luSkRQTzRVOVNQWnRFYmVmR1p2?=
 =?utf-8?B?aDR6OW9xajg5QVJ1Y0pmQnY5ckhwNFcvKzQ5dm5rNUg1NDdsbktuLzRSUmRp?=
 =?utf-8?B?SEJzSzRlMWhqUEpBS1BJdStLMWh1Wm1ZK0RoT0h5dTZ4WC9MZVRiKzd4cGdj?=
 =?utf-8?B?ZGZVSFUrTHBVMGlvWFVYU1ZRcC9COEJaeE1JZjhndkhXa1RqVVBzUExqM3Vq?=
 =?utf-8?B?Z1VaWEplVXZ4R1B2ZlUvYzRtcjhHUjZpeVFhUGdiTGtpTHNKTkVaRm1wSVpm?=
 =?utf-8?B?MFVGeGVjSVNTMzl1NUJsUGJzU3NDVStDSWNIcjJIMHNDbm1YcjYvUVZBVFZ2?=
 =?utf-8?B?cXNkR2dYMjltWXN3cnFMczRyMU1yZzg2YjFyYjZwZXlNak91N3lrWnNUWFhZ?=
 =?utf-8?B?bmNabXhnOXluQng5c1Ywdm9XKzEra3ZVT1dueGp0aExMMHcrSDFJQmZMZGdz?=
 =?utf-8?B?bTI3WEVackRBWTNjNDZzOHZyb3FranlTcUI1REJKeDhmeGNFdFVnVEVHL2cw?=
 =?utf-8?B?Zm9QL0ZIWWgwVG4rUmJVYlNZc25tSS9LMW0yNStwZWgyV0dMd0xXSVJyUVdI?=
 =?utf-8?B?RWo5bDY4cmdFTERCdmZucTBZWldidnlxTkR3ZHpTdEx6eURlKzhGLytMOGVF?=
 =?utf-8?B?WmFRZ05yR3NzYjJ6ZHNHOC9KZHkrRFZ1eGVvc3Y1N2s1MHZPdTQvRkhOYWFq?=
 =?utf-8?B?cXZXN3Q3ektSaHNGSEIzTXl6TCtKS0hWN2hvU1JOc1NFaUdZcitxcXE3dS9Q?=
 =?utf-8?B?TkNhdnZBL1ZFTVBiTHp4cGMwUmpXQ01ueTVEeXM4MXRnUXg0T2hJb0FkRnli?=
 =?utf-8?B?LzloRkdvSlhBckQ1WVY4c2REZUdWUVNZRjJwemV6d1ZaQWRVWDRTUUVtSUxI?=
 =?utf-8?B?cHVqWGFYL1c3MkhhaFU0VlFuQ1c1bWFYcHQxSFZ2RDRPYXY2V3YzZzZRd3Vh?=
 =?utf-8?B?eERDRTFNYzBqT3QvYnRjVTR2K1NjNHpOYTJpS2FJalJrUGQrdVB3dGhaZldW?=
 =?utf-8?B?QmFZME1uR2RqUXJSRXZrb2ppZklWa3NxcHBkLzZReHNJNm1jSmc4TjNWYVA5?=
 =?utf-8?B?aGZGVjdKREpWQ3FZeU5hVzUyQlBvTitPclF2WlFvaUl2YnJyaGVsQ2Z3c1hk?=
 =?utf-8?B?c3Y3cWlqQVovVW9BZk43Zy9wVnhJOEoyYXo2aWxNbXIyWk9HUThJVjVNZUcv?=
 =?utf-8?B?MFUrNVlCVURMQkVKV3FIcUtpcGdoMHRvZi9YUlNTTWtTUUhBc1k1OWxHVWJF?=
 =?utf-8?B?RlVQaksxenJLb3RCS0dDb3J1Qm9CUWE2TENyRWhab3MwMkNCNWlaa0NkNzdk?=
 =?utf-8?B?QlFmNnNGR2lwblZobHpkeWpQOWUzN2JCYmxBTkJnUDVob1g3cCtsMStSTlQw?=
 =?utf-8?B?MEZhdnNzMnpOamw2SlkrQ1VHSWpkUHJJaWJ5K2t1NXdIV3R3TkdVRDRoUUxu?=
 =?utf-8?B?RVJ3bTZoSWd4em9FRnkxS083YTE4Z1FzbmZkQ0JySjZnSzFlSVlzazkwQUVa?=
 =?utf-8?B?RGhhbEhBVFhqeEN4dmVYd0lrMFB2VWRqQ1BSQk4rcmQ1UTBGcm9UUHMrOEE5?=
 =?utf-8?B?RlBpckh3Sm1Nait2WnBzemowc3dXQ0doWkpQS1NjWTBGNjBCeStLZXZSdHR6?=
 =?utf-8?B?WDRRVnU0Z2RzbGowQ2h6WEdjL2xmVU40UWRJU1V4c09zT2lHdFFpRHFmN2VE?=
 =?utf-8?B?VkE0bE9TYkpvSVdLcnExbURQN0xUb2RhYnVKeTZ6bTdLSTlVVU1sVFZLeSsx?=
 =?utf-8?B?ZlZndjM5ZmUrbTZ1S21JTC90UWx1VXByNTZuQkNHVDNWUjQ1cUZaUFZURFNH?=
 =?utf-8?Q?odG9UBgQnqUUD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41005fb-5063-4a23-af18-08d958458917
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 19:16:32.7733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eD383idqBgqjLeHNcaim9q4Wdp0LOVWB1HMpTs4kYPGjvrm0Amrrke4fX2SjjKL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3776
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

Am 05.08.21 um 21:02 schrieb Zi Yan:
> From: Zi Yan <ziy@nvidia.com>
>
> This prepares for the upcoming changes to make MAX_ORDER a boot time
> parameter instead of compilation time constant. All static arrays with
> MAX_ORDER size are converted to pointers and their memory is allocated
> at runtime.

Well in general I strongly suggest to not use the patter 
kmalloc(sizeof(some struct) * MAX_ORDER,...) instead use kmalloc_array, 
kcalloc etc..

Then when a array is embedded at the end of a structure you can use a 
trailing array and the struct_size() macro to determine the allocation size.

Additional to that separating the patch into changes for TTM to make the 
maximum allocation order independent from MAX_ORDER would be rather good 
to have I think.

Regards,
Christian.

>
> free_area array in struct zone is allocated using memblock_alloc_node()
> at boot time and using kzalloc() when memory is hot-added.
>
> MAX_ORDER in arm64 nVHE code is independent of kernel buddy allocator,
> so use CONFIG_FORCE_MAX_ZONEORDER instead.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: kexec@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   .../admin-guide/kdump/vmcoreinfo.rst          |  2 +-
>   drivers/gpu/drm/ttm/ttm_device.c              |  7 ++-
>   drivers/gpu/drm/ttm/ttm_pool.c                | 58 +++++++++++++++++--
>   include/drm/ttm/ttm_pool.h                    |  4 +-
>   include/linux/memory_hotplug.h                |  1 +
>   include/linux/mmzone.h                        |  2 +-
>   mm/memory_hotplug.c                           |  1 +
>   mm/page_alloc.c                               | 48 ++++++++++++---
>   8 files changed, 104 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> index 3861a25faae1..1c9449b9458f 100644
> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> @@ -172,7 +172,7 @@ variables.
>   Offset of the free_list's member. This value is used to compute the number
>   of free pages.
>   
> -Each zone has a free_area structure array called free_area[MAX_ORDER].
> +Each zone has a free_area structure array called free_area with length of MAX_ORDER.
>   The free_list represents a linked list of free page blocks.
>   
>   (list_head, next|prev)
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 74e3b460132b..7d994c03fbd0 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -94,7 +94,9 @@ static int ttm_global_init(void)
>   		>> PAGE_SHIFT;
>   	num_dma32 = min(num_dma32, 2UL << (30 - PAGE_SHIFT));
>   
> -	ttm_pool_mgr_init(num_pages);
> +	ret = ttm_pool_mgr_init(num_pages);
> +	if (ret)
> +		goto out;
>   	ttm_tt_mgr_init(num_pages, num_dma32);
>   
>   	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
> @@ -216,7 +218,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	bdev->funcs = funcs;
>   
>   	ttm_sys_man_init(bdev);
> -	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> +	if (ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32))
> +		return -ENOMEM;
>   
>   	bdev->vma_manager = vma_manager;
>   	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index cb38b1a17b09..ae20c80f14a4 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -64,11 +64,11 @@ module_param(page_pool_size, ulong, 0644);
>   
>   static atomic_long_t allocated_pages;
>   
> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> +static struct ttm_pool_type *global_write_combined;
> +static struct ttm_pool_type *global_uncached;
>   
> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> +static struct ttm_pool_type *global_dma32_write_combined;
> +static struct ttm_pool_type *global_dma32_uncached;
>   
>   static struct mutex shrinker_lock;
>   static struct list_head shrinker_list;
> @@ -493,8 +493,10 @@ EXPORT_SYMBOL(ttm_pool_free);
>    * @use_dma32: true if GFP_DMA32 should be used
>    *
>    * Initialize the pool and its pool types.
> + *
> + * Returns: 0 on successe, negative error code otherwise
>    */
> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> +int ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   		   bool use_dma_alloc, bool use_dma32)
>   {
>   	unsigned int i, j;
> @@ -506,11 +508,30 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   	pool->use_dma32 = use_dma32;
>   
>   	if (use_dma_alloc) {
> -		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> +			pool->caching[i].orders =
> +				kzalloc(sizeof(struct ttm_pool_type) * MAX_ORDER,
> +					GFP_KERNEL);
> +			if (!pool->caching[i].orders) {
> +				i--;
> +				goto failed;
> +			}
>   			for (j = 0; j < MAX_ORDER; ++j)
>   				ttm_pool_type_init(&pool->caching[i].orders[j],
>   						   pool, i, j);
> +
> +		}
> +		return 0;
> +
> +failed:
> +		for (; i >= 0; i--) {
> +			for (j = 0; j < MAX_ORDER; ++j)
> +				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> +			kfree(pool->caching[i].orders);
> +		}
> +		return -ENOMEM;
>   	}
> +	return 0;
>   }
>   
>   /**
> @@ -696,6 +717,31 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   	mutex_init(&shrinker_lock);
>   	INIT_LIST_HEAD(&shrinker_list);
>   
> +	if (!global_write_combined) {
> +		global_write_combined = kzalloc(sizeof(struct ttm_pool_type) * MAX_ORDER,
> +						GFP_KERNEL);
> +		if (!global_write_combined)
> +			return -ENOMEM;
> +	}
> +	if (!global_uncached) {
> +		global_uncached = kzalloc(sizeof(struct ttm_pool_type) * MAX_ORDER,
> +					  GFP_KERNEL);
> +		if (!global_uncached)
> +			return -ENOMEM;
> +	}
> +	if (!global_dma32_write_combined) {
> +		global_dma32_write_combined = kzalloc(sizeof(struct ttm_pool_type) * MAX_ORDER,
> +						      GFP_KERNEL);
> +		if (!global_dma32_write_combined)
> +			return -ENOMEM;
> +	}
> +	if (!global_dma32_uncached) {
> +		global_dma32_uncached = kzalloc(sizeof(struct ttm_pool_type) * MAX_ORDER,
> +						GFP_KERNEL);
> +		if (!global_dma32_uncached)
> +			return -ENOMEM;
> +	}
> +
>   	for (i = 0; i < MAX_ORDER; ++i) {
>   		ttm_pool_type_init(&global_write_combined[i], NULL,
>   				   ttm_write_combined, i);
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 4321728bdd11..5c09e3cf63ce 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -71,7 +71,7 @@ struct ttm_pool {
>   	bool use_dma32;
>   
>   	struct {
> -		struct ttm_pool_type orders[MAX_ORDER];
> +		struct ttm_pool_type *orders;
>   	} caching[TTM_NUM_CACHING_TYPES];
>   };
>   
> @@ -79,7 +79,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   		   struct ttm_operation_ctx *ctx);
>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>   
> -void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> +int ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   		   bool use_dma_alloc, bool use_dma32);
>   void ttm_pool_fini(struct ttm_pool *pool);
>   
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 97f874a60607..c16aa66db61e 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -326,6 +326,7 @@ extern void clear_zone_contiguous(struct zone *zone);
>   
>   #ifdef CONFIG_MEMORY_HOTPLUG
>   extern void __ref free_area_init_core_hotplug(int nid);
> +extern void __ref free_area_deinit_core_hotplug(int nid);
>   extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
>   extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
>   extern int add_memory_resource(int nid, struct resource *resource,
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 322b995942e5..09aafc05aef4 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -609,7 +609,7 @@ struct zone {
>   	ZONE_PADDING(_pad1_)
>   
>   	/* free areas of different sizes */
> -	struct free_area	free_area[MAX_ORDER];
> +	struct free_area	*free_area;
>   
>   	/* zone flags, see below */
>   	unsigned long		flags;
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 91ca751ac20c..4ce20b6482aa 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1239,6 +1239,7 @@ static void rollback_node_hotadd(int nid)
>   
>   	arch_refresh_nodedata(nid, NULL);
>   	free_percpu(pgdat->per_cpu_nodestats);
> +	free_area_deinit_core_hotplug(nid);
>   	arch_free_nodedata(pgdat);
>   }
>   
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e4657009fd4f..bfa6962f7615 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6053,11 +6053,21 @@ void show_free_areas(unsigned int filter, nodemask_t *nodemask)
>   
>   	for_each_populated_zone(zone) {
>   		unsigned int order;
> -		unsigned long nr[MAX_ORDER], flags, total = 0;
> -		unsigned char types[MAX_ORDER];
> +		unsigned long *nr, flags, total = 0;
> +		unsigned char *types;
>   
>   		if (show_mem_node_skip(filter, zone_to_nid(zone), nodemask))
>   			continue;
> +
> +		nr = kmalloc(sizeof(unsigned long) * MAX_ORDER, GFP_KERNEL);
> +		if (!nr)
> +			goto skip_zone;
> +		types = kmalloc(sizeof(unsigned char) * MAX_ORDER, GFP_KERNEL);
> +		if (!types) {
> +			kfree(nr);
> +			goto skip_zone;
> +		}
> +
>   		show_node(zone);
>   		printk(KERN_CONT "%s: ", zone->name);
>   
> @@ -6083,8 +6093,11 @@ void show_free_areas(unsigned int filter, nodemask_t *nodemask)
>   				show_migration_types(types[order]);
>   		}
>   		printk(KERN_CONT "= %lukB\n", K(total));
> -	}
>   
> +		kfree(nr);
> +		kfree(types);
> +	}
> +skip_zone:
>   	hugetlb_show_meminfo();
>   
>   	printk("%ld total pagecache pages\n", global_node_page_state(NR_FILE_PAGES));
> @@ -7429,8 +7442,8 @@ static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
>   	lruvec_init(&pgdat->__lruvec);
>   }
>   
> -static void __meminit zone_init_internals(struct zone *zone, enum zone_type idx, int nid,
> -							unsigned long remaining_pages)
> +static void __init zone_init_internals(struct zone *zone, enum zone_type idx, int nid,
> +							unsigned long remaining_pages, bool hotplug)
>   {
>   	atomic_long_set(&zone->managed_pages, remaining_pages);
>   	zone_set_nid(zone, nid);
> @@ -7439,6 +7452,16 @@ static void __meminit zone_init_internals(struct zone *zone, enum zone_type idx,
>   	spin_lock_init(&zone->lock);
>   	zone_seqlock_init(zone);
>   	zone_pcp_init(zone);
> +	if (hotplug)
> +		zone->free_area =
> +			kzalloc_node(sizeof(struct free_area) * MAX_ORDER,
> +				     GFP_KERNEL, nid);
> +	else
> +		zone->free_area =
> +			memblock_alloc_node(sizeof(struct free_area) * MAX_ORDER,
> +					    sizeof(struct free_area), nid);
> +	BUG_ON(!zone->free_area);
> +
>   }
>   
>   /*
> @@ -7456,7 +7479,18 @@ void __ref free_area_init_core_hotplug(int nid)
>   
>   	pgdat_init_internals(pgdat);
>   	for (z = 0; z < MAX_NR_ZONES; z++)
> -		zone_init_internals(&pgdat->node_zones[z], z, nid, 0);
> +		zone_init_internals(&pgdat->node_zones[z], z, nid, 0, true);
> +}
> +
> +void __ref free_area_deinit_core_hotplug(int nid)
> +{
> +	enum zone_type z;
> +	pg_data_t *pgdat = NODE_DATA(nid);
> +
> +	for (z = 0; z < MAX_NR_ZONES; z++) {
> +		kfree(pgdat->node_zones[z].free_area);
> +		pgdat->node_zones[z].free_area = NULL;
> +	}
>   }
>   #endif
>   
> @@ -7519,7 +7553,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>   		 * when the bootmem allocator frees pages into the buddy system.
>   		 * And all highmem pages will be managed by the buddy system.
>   		 */
> -		zone_init_internals(zone, j, nid, freesize);
> +		zone_init_internals(zone, j, nid, freesize, false);
>   
>   		if (!size)
>   			continue;

