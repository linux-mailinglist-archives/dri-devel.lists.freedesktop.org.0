Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B864C78D3B8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9D110E4CB;
	Wed, 30 Aug 2023 07:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410EB10E4CB;
 Wed, 30 Aug 2023 07:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEJA5tavXkSpmeJb+ziECYmD1XOh3EHta+4LzFYgqVtAmy5wwWvTwBhmsuictll/V2dwxNYKno/w1WiV8++/vtBNU3sga1/koIObm8Nvzrkwb2+a8zFdb5oY1oj9gQzSxQobjP2uT7BnMIvZZygcd1JlgKBlgYbF7/Uy43KTyb0ipXbzRK8X34yJI3R4iftgOf4zmwwxY12xrI4x/u6RCwrYD/T7XkBJELsshNlZyfoDVO+f9Pck+fVtxvwlnpvFdT2QqZ9DNqsl8+ZIHOTgKBRBXG0W4pTwinCZOiVuecUzbONABWK1Y3a5SSWUPGNMOtZVPxmp6kXLb7RlX+B05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnuhvdraORFJus29KN1yIburlLtI36eosL+1VTGptrs=;
 b=ROi/pD1rN7dEalQylk7jrXGUy2EgGiGYylY9Ts+4jeEJxqbo7m/GWo2t6p12r24BzIeOUezsGIeA7v99JcA2YHAEJ1gbT5bVNlcrigEfwXp48RINA0XEO9zJUKIFHqMWky8PYQcSntLks4aNM43ztKD13mly377/jGfbDyi550kZ4Vde0x4Dxh4IJ7tjqbXFutymroWOhRGPHVz6FNkS9TN+ZyNRwvvBJ+ScjsTLFh9XdcdHt6/5B8tzAClPMJkC0k02BFq+WsjJMPW++n8JNSd6b5rsgK0JVqYL31Dn9zdMfCEVawF8y7ETIY4TkgXq4hWpHTZA2mAe0ZnNkaDZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnuhvdraORFJus29KN1yIburlLtI36eosL+1VTGptrs=;
 b=nsX+TgZ8J60hCvNA4zTVO4ZcFCvOmPiyhY0vyHZonRGPZ9hXPJH3zJkB9pZ0P+mP2WUvOEpnAwWHrhovodOwJZwlZoy2NrEVFHzzULP9WO8sudUH6IqXu96H85Hu/13u4JY+xjb0yPj3nwac/42xZNv8XQfeWJGDK+h8UkC4YWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5248.namprd12.prod.outlook.com (2603:10b6:5:39c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 07:48:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:48:10 +0000
Message-ID: <69484791-b316-8c45-19ff-1fa776e30764@amd.com>
Date: Wed, 30 Aug 2023 09:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230820215320.4187-3-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5248:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e1fb5c-2307-4fa1-5bdd-08dba92d7465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkP+rooYKnosmWJ6rPnp8hU+nvbBuhAzi7zMDGgNa4HTKsh7/WXq4c3xxD4K14JdBcqQWxHj4bq42e1O+756t4jdIZvuM4cVFoznlUO4qIFGMCzSWu/ySOLt8J9mK87B96/kV5M4qxQgKkzOUHbrxzbzfieDYO/1dKRyy5BJv4omdyZsGHFsozC3BsZwoupwcAQT7853DisROUMOfvybRULijFztlzMcZDb2k13j3oeQaPDYwCSgH9BaJfrV8+Wx26MatRkgVxStZ9iUAe6IeF53z9cSEY9JXtsmR3M77FFiVLch+DWCphx/IkJAwAUuNc9cAfB9zJM3jgUKzTuStn+Uqwr+ThqnI9pw6XbN9iDeHlVOVo6KkX9O1zba4NvfiEcJbqe6eEVAnMrdqtcKMLasQ5E2aGO2+uvvxUFWQSMCpeqCmKKfRrz6dUN6zjnlJ7D1nLcBZHFu9S7x6DS8k9R65CsuO/XIhH0WEZn55Qv2FWgrLq0kVH9c8bFG0CG+kl3f4PtaojB/Q06YlPYfF0Hy1+IZlnyNl2PQnXGVg39ndMaqC+yxOB5wiuiQhK2ozL/GywZHihNu18IsHMQMy5AB1JzIz9O+uB1LiTDyIJNSqdVUpFI0JWBqxNLB1epN0123ZPJ8YYEyvS8sCKHSk4nDKYUsn56JGzjcyEQcdbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(186009)(451199024)(1800799009)(66899024)(66946007)(66556008)(66476007)(316002)(921005)(478600001)(38100700002)(30864003)(2906002)(7416002)(31696002)(86362001)(5660300002)(8936002)(41300700001)(4326008)(83380400001)(8676002)(6512007)(6486002)(6666004)(6506007)(26005)(2616005)(36756003)(31686004)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlo4YXdRRlJqYkNTK2ZtU1Z1S0xTWk5rZys3VkhSc2hTOTRGQ2h4aEFZNEFP?=
 =?utf-8?B?RUM4ZE9JT2JuZXowZjBRU1puaHNtQ2thYmJDTFNZQVJac01zeGt3bi9PZWJv?=
 =?utf-8?B?NWx1Y2p5c0tZVTZ4d0JadzllMVdiKzYxcG9DS2Y4Y1U5bzBDQXMyRmlqak1R?=
 =?utf-8?B?OG1sblE1S2tlTERHeGhNc2ZHMVR2bkI0UDIxdkF5Sk1wd21RaFgvOVMrTDcv?=
 =?utf-8?B?ZUJNVWV3WEpIakJYZEhaM0tNMkIzTmpQSmVESEhEQUhYWVZVbjF1K1JpTE1z?=
 =?utf-8?B?QnB0WldDZzJPRFVZQzFlMkFhbGV4U2NLbXMrcUExUzdFeEFYM1VtanRyT2Ja?=
 =?utf-8?B?aTU0RWE1L0hYTFpnQUJIMzBvcnV2K3RmalVNNVA2TktjOGVicFczNklFWDly?=
 =?utf-8?B?TURSamdxdmRUWlhWYXVmMXlFeGFsYkJyUnhjb3JxQTViMGxhMmJTWEY4MjNw?=
 =?utf-8?B?NHN4ODhjNldYU1lmRFZ2ZnVPZkxIa251bWF1REd2Y3EvODFBSnhNVEFXZVJs?=
 =?utf-8?B?dFNJT3crdmZmMUErUCtFUHlxVkVmeFVDbEF3RU40eHl6TDFadlhFNzlMWXFp?=
 =?utf-8?B?SnVneFNiUmFEQmh6UmJKc09mcmtZNDhkTW1mbmVHbEIyOGZTRjB1QmVUTGdF?=
 =?utf-8?B?YUhBSEptNkVaYmVRRjh1ZGM2RjQwQ05SaWllMDRWY0FqeWVaRXRJTDlQWURw?=
 =?utf-8?B?cTViOW1IcVcwcUtHa011TWFoc0ZWb1RQTG9hTmdaNElqUnVJUHJGcXBxQ0lE?=
 =?utf-8?B?bnFaQ2hVRW9YNDdHNzNjV1cxNVFoeU10bERWc2JtbHhGdHBabytpcFY2Q2sy?=
 =?utf-8?B?RWhUWjhJbEEvdmYvdk9OTzdzODRsdXFMMXhpSWc4Nk9PTlNSQmFzNEovNG5B?=
 =?utf-8?B?WXNUU0xzQXNDNTBUOTZHcFI3Z0ZDMG5UR2E1Y2wraXVmd2xlTVNLQnF3ZDRY?=
 =?utf-8?B?WEt5U2lpOXp6WllPK0FJalJqQmNqR2s1MC90R1ZpZ2xNSHJxUU5jbVN5QjVy?=
 =?utf-8?B?cWh1UDNGWXVTeittUVg5OXZtdXpYei8zL3E1RlR0ZHZKeGhNUm9Oc1l2N1Fy?=
 =?utf-8?B?ZEsxVFVOMU1EcHVnZjdoTzd1NUpRYmVJVzdMcXR6Sm5iNGNpUWR1OXJ1Z3Rt?=
 =?utf-8?B?b0ovb0xKdVpTZ3hEdEJrUXFXMzBUWG5tZitTTHBheUZDZnhWcnZjcTB5Z01E?=
 =?utf-8?B?Nnl1TnVNcUxsS05TQVlVdDVQNGZlbm1XOUh6NHVUcTR0WW9pRldqNVdOTEd2?=
 =?utf-8?B?WTVGekRKOVJPQkRxeFJGdHQ0NkdqeGtabnppM3VFZGd5QUFiZVl0cW83VHNM?=
 =?utf-8?B?cXZKSy9lcjhvWTNiT1phUmtmbFFJanJBeEZkaHllcmJSOHhtNk1GSGxGckY1?=
 =?utf-8?B?Vll4VGcvY3ZBa1YrOU95T1BjaW9JVCtscmZubk1lUVJRdXhURU44eE1kMmp6?=
 =?utf-8?B?WTFxYzlZcVBRU3JLZTJuTW9nekhscWxwWTZIeEY4bGxFQzZ1dE95Rk1lb1pB?=
 =?utf-8?B?R3FRcE9sRlI0alpxaURCNWRYSlBXY1hkZ3Q5MHl1Nk51aGlyS3cwNTM2UnY4?=
 =?utf-8?B?Z29sRDFMSzJpdUVac0NBVnRocjVZcEpqSVJNc2JvQ3JEM1JmdzJ5K0ZxSUJD?=
 =?utf-8?B?clRBcWttcG95eFJuUHY4K21zSzUra1plMDY4SzkyTjVsc2lvTXZpV2RDQ2pB?=
 =?utf-8?B?NWJqemRzclRxS3I2MHlmeHdpbThIU044THpsS0xRSVY3elQwSXdIWHhBRlhs?=
 =?utf-8?B?UEo5NnA3aTFGZmZCZ2ZRczB4SWdISk9HcnFZR3Q3SEF6endESzlxWGVVdmZS?=
 =?utf-8?B?MXZzTTViTGxMdWxkWkFnSVkwQWJsbFQyODVQc29NZGNkbEVCandJcVhMVGNZ?=
 =?utf-8?B?aUgrRVIxQ0RvUkpNSWl0VVM0YVdPSzJqY0FaZjlSYU55d3AzamVFVlY4UWUy?=
 =?utf-8?B?OW1KMWlud3QwZGJiUVQrQTAyb2d2T203ZlQ0S3AzQUhQZi8wWDd3eEM2Q1dZ?=
 =?utf-8?B?dHZzM3RlSENGYzJGUnZrWEE4U2xvMzlwZkwzamdhYnltTnk5Q1Y2R0sxV28r?=
 =?utf-8?B?TE5TdVZPZzVIUFUrSUpLVzVGbSsyeVlsaVhBTmw1VGFvNGtmdkpXMUtyVG1T?=
 =?utf-8?Q?fnr0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e1fb5c-2307-4fa1-5bdd-08dba92d7465
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:48:09.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tIYivG0pOfHBh8ourqN3+vWyYnwE+K5vyzltfe+v4AlvwS3Yzu1ZI2cQU7+0god
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5248
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.08.23 um 23:53 schrieb Danilo Krummrich:
> So far the DRM GPUVA manager offers common infrastructure to track GPU VA
> allocations and mappings, generically connect GPU VA mappings to their
> backing buffers and perform more complex mapping operations on the GPU VA
> space.
>
> However, there are more design patterns commonly used by drivers, which
> can potentially be generalized in order to make the DRM GPUVA manager
> represent a basic GPU-VM implementation. In this context, this patch aims
> at generalizing the following elements.
>
> 1) Provide a common dma-resv for GEM objects not being used outside of
>     this GPU-VM.
>
> 2) Provide tracking of external GEM objects (GEM objects which are
>     shared with other GPU-VMs).
>
> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>     GPU-VM contains mappings of.
>
> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>     of, such that validation of evicted GEM objects is accelerated.
>
> 5) Provide some convinience functions for common patterns.

Interesting work.

You basically implement a bunch of the ideas I came up to improve the 
amdgpu performance in the common manager now. The was one of the 
remaining blockers I had for using this in amdgpu.

Question is for example how do you track evictions? E.g. we don't have a 
common concept of eviction in GEM as far as I know. Or is the driver 
responsible for giving those notifications to the GPUVA manager?

And would it be possible to lock only a specific area of the VM, e.g. 
every BO mapped in the interval X..Y?

Regards,
Christian.

>
> Rather than being designed as a "framework", the target is to make all
> features appear as a collection of optional helper functions, such that
> drivers are free to make use of the DRM GPUVA managers basic
> functionality and opt-in for other features without setting any feature
> flags, just by making use of the corresponding functions.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c | 688 +++++++++++++++++++++++++++++++-
>   include/drm/drm_gem.h           |  48 ++-
>   include/drm/drm_gpuva_mgr.h     | 302 +++++++++++++-
>   3 files changed, 1010 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index f86bfad74ff8..69872b205961 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
>   /**
>    * drm_gpuva_manager_init() - initialize a &drm_gpuva_manager
>    * @mgr: pointer to the &drm_gpuva_manager to initialize
> + * @drm: the drivers &drm_device
>    * @name: the name of the GPU VA space
>    * @start_offset: the start offset of the GPU VA space
>    * @range: the size of the GPU VA space
> @@ -669,6 +670,7 @@ drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
>    */
>   void
>   drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> +		       struct drm_device *drm,
>   		       const char *name,
>   		       u64 start_offset, u64 range,
>   		       u64 reserve_offset, u64 reserve_range,
> @@ -677,6 +679,11 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>   	mgr->rb.tree = RB_ROOT_CACHED;
>   	INIT_LIST_HEAD(&mgr->rb.list);
>   
> +	mt_init(&mgr->mt_ext);
> +
> +	INIT_LIST_HEAD(&mgr->evict.list);
> +	spin_lock_init(&mgr->evict.lock);
> +
>   	drm_gpuva_check_overflow(start_offset, range);
>   	mgr->mm_start = start_offset;
>   	mgr->mm_range = range;
> @@ -694,6 +701,9 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>   						     reserve_range)))
>   			__drm_gpuva_insert(mgr, &mgr->kernel_alloc_node);
>   	}
> +
> +	drm_gem_private_object_init(drm, &mgr->d_obj, 0);
> +	mgr->resv = mgr->d_obj.resv;
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_manager_init);
>   
> @@ -713,10 +723,575 @@ drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
>   		__drm_gpuva_remove(&mgr->kernel_alloc_node);
>   
>   	WARN(!RB_EMPTY_ROOT(&mgr->rb.tree.rb_root),
> -	     "GPUVA tree is not empty, potentially leaking memory.");
> +	     "GPUVA tree is not empty, potentially leaking memory.\n");
> +
> +	mtree_destroy(&mgr->mt_ext);
> +	WARN(!list_empty(&mgr->evict.list), "Evict list should be empty.\n");
> +
> +	drm_gem_private_object_fini(&mgr->d_obj);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_manager_destroy);
>   
> +/**
> + * drm_gpuva_manager_prepare_objects() - prepare all assoiciated BOs
> + * @mgr: the &drm_gpuva_manager
> + * @num_fences: the amount of &dma_fences to reserve
> + *
> + * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
> + * &drm_gpuva_manager contains mappings of.
> + *
> + * Drivers can obtain the corresponding &drm_exec instance through
> + * DRM_GPUVA_EXEC(). It is the drivers responsibility to call drm_exec_init()
> + * and drm_exec_fini() accordingly.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_manager_prepare_objects(struct drm_gpuva_manager *mgr,
> +				  unsigned int num_fences)
> +{
> +	struct drm_exec *exec = DRM_GPUVA_EXEC(mgr);
> +	MA_STATE(mas, &mgr->mt_ext, 0, 0);
> +	union {
> +		void *ptr;
> +		uintptr_t cnt;
> +	} ref;
> +	int ret;
> +
> +	ret = drm_exec_prepare_obj(exec, &mgr->d_obj, num_fences);
> +	if (ret)
> +		goto out;
> +
> +	rcu_read_lock();
> +	mas_for_each(&mas, ref.ptr, ULONG_MAX) {
> +		struct drm_gem_object *obj;
> +
> +		mas_pause(&mas);
> +		rcu_read_unlock();
> +
> +		obj = (struct drm_gem_object *)(uintptr_t)mas.index;
> +		ret = drm_exec_prepare_obj(exec, obj, num_fences);
> +		if (ret)
> +			goto out;
> +
> +		rcu_read_lock();
> +	}
> +	rcu_read_unlock();
> +
> +out:
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_manager_prepare_objects);
> +
> +/**
> + * drm_gpuva_manager_lock_extra() - lock all dma-resv of all assoiciated BOs
> + * @mgr: the &drm_gpuva_manager
> + * @fn: callback received by the driver to lock additional dma-resv
> + * @priv: private driver data passed to @fn
> + * @num_fences: the amount of &dma_fences to reserve
> + * @interruptible: sleep interruptible if waiting
> + *
> + * Acquires all dma-resv locks of all &drm_gem_objects the given
> + * &drm_gpuva_manager contains mappings of.
> + *
> + * Addionally, when calling this function the driver receives the given @fn
> + * callback to lock additional dma-resv in the context of the
> + * &drm_gpuva_managers &drm_exec instance. Typically, drivers would call
> + * drm_exec_prepare_obj() from within this callback.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_manager_lock_extra(struct drm_gpuva_manager *mgr,
> +			     int (*fn)(struct drm_gpuva_manager *mgr,
> +				       void *priv, unsigned int num_fences),
> +			     void *priv,
> +			     unsigned int num_fences,
> +			     bool interruptible)
> +{
> +	struct drm_exec *exec = DRM_GPUVA_EXEC(mgr);
> +	uint32_t flags;
> +	int ret;
> +
> +	flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
> +		DRM_EXEC_IGNORE_DUPLICATES;
> +
> +	drm_exec_init(exec, flags);
> +
> +	drm_exec_until_all_locked(exec) {
> +		ret = drm_gpuva_manager_prepare_objects(mgr, num_fences);
> +		drm_exec_retry_on_contention(exec);
> +		if (ret)
> +			goto err;
> +
> +		if (fn) {
> +			ret = fn(mgr, priv, num_fences);
> +			drm_exec_retry_on_contention(exec);
> +			if (ret)
> +				goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	drm_exec_fini(exec);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_manager_lock_extra);
> +
> +static int
> +fn_lock_array(struct drm_gpuva_manager *mgr, void *priv,
> +				unsigned int num_fences)
> +{
> +	struct {
> +		struct drm_gem_object **objs;
> +		unsigned int num_objs;
> +	} *args = priv;
> +
> +	return drm_exec_prepare_array(DRM_GPUVA_EXEC(mgr), args->objs,
> +				      args->num_objs, num_fences);
> +}
> +
> +/**
> + * drm_gpuva_manager_lock_array() - lock all dma-resv of all assoiciated BOs
> + * @mgr: the &drm_gpuva_manager
> + * @objs: additional &drm_gem_objects to lock
> + * @num_objs: the number of additional &drm_gem_objects to lock
> + * @num_fences: the amount of &dma_fences to reserve
> + * @interruptible: sleep interruptible if waiting
> + *
> + * Acquires all dma-resv locks of all &drm_gem_objects the given
> + * &drm_gpuva_manager contains mappings of, plus the ones given through @objs.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_manager_lock_array(struct drm_gpuva_manager *mgr,
> +			     struct drm_gem_object **objs,
> +			     unsigned int num_objs,
> +			     unsigned int num_fences,
> +			     bool interruptible)
> +{
> +	struct {
> +		struct drm_gem_object **objs;
> +		unsigned int num_objs;
> +	} args;
> +
> +	args.objs = objs;
> +	args.num_objs = num_objs;
> +
> +	return drm_gpuva_manager_lock_extra(mgr, fn_lock_array, &args,
> +					    num_fences, interruptible);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_manager_lock_array);
> +
> +/**
> + * drm_gpuva_manager_validate() - validate all BOs marked as evicted
> + * @mgr: the &drm_gpuva_manager to validate evicted BOs
> + *
> + * Calls the &drm_gpuva_fn_ops.bo_validate callback for all evicted buffer
> + * objects being mapped in the given &drm_gpuva_manager.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_manager_validate(struct drm_gpuva_manager *mgr)
> +{
> +	const struct drm_gpuva_fn_ops *ops = mgr->ops;
> +	struct drm_gpuva_gem *vm_bo;
> +	int ret;
> +
> +	if (unlikely(!ops || !ops->bo_validate))
> +		return -ENOTSUPP;
> +
> +	/* At this point we should hold all dma-resv locks of all GEM objects
> +	 * associated with this GPU-VM, hence it is safe to walk the list.
> +	 */
> +	list_for_each_entry(vm_bo, &mgr->evict.list, list.entry.evict) {
> +		dma_resv_assert_held(vm_bo->obj->resv);
> +
> +		ret = ops->bo_validate(vm_bo->obj);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_manager_validate);
> +
> +/**
> + * drm_gpuva_manager_resv_add_fence - add fence to private and all extobj
> + * dma-resv
> + * @mgr: the &drm_gpuva_manager to add a fence to
> + * @fence: fence to add
> + * @private_usage: private dma-resv usage
> + * @extobj_usage: extobj dma-resv usage
> + */
> +void
> +drm_gpuva_manager_resv_add_fence(struct drm_gpuva_manager *mgr,
> +				 struct dma_fence *fence,
> +				 enum dma_resv_usage private_usage,
> +				 enum dma_resv_usage extobj_usage)
> +{
> +	struct drm_exec *exec = DRM_GPUVA_EXEC(mgr);
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +			dma_resv_assert_held(obj->resv);
> +			dma_resv_add_fence(obj->resv, fence,
> +					   drm_gpuva_is_extobj(mgr, obj) ?
> +					   private_usage : extobj_usage);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_manager_resv_add_fence);
> +
> +static struct drm_gpuva_gem *
> +__drm_gpuva_gem_find(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj)
> +{
> +	struct drm_gpuva_gem *vm_bo;
> +
> +	drm_gem_gpuva_assert_lock_held(obj);
> +
> +	drm_gem_for_each_gpuva_gem(vm_bo, obj)
> +		if (vm_bo->mgr == mgr)
> +			return vm_bo;
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpuva_gem_create() - create a new instance of struct drm_gpuva_gem
> + * @mgr: The &drm_gpuva_manager the @obj is mapped in.
> + * @obj: The &drm_gem_object being mapped in the @mgr.
> + *
> + * If provided by the driver, this function uses the &drm_gpuva_fn_ops
> + * vm_bo_alloc() callback to allocate.
> + *
> + * Returns: a pointer to the &drm_gpuva_gem on success, NULL on failure
> + */
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_create(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj)
> +{
> +	const struct drm_gpuva_fn_ops *ops = mgr->ops;
> +	struct drm_gpuva_gem *vm_bo;
> +
> +	if (ops && ops->vm_bo_alloc)
> +		vm_bo = ops->vm_bo_alloc();
> +	else
> +		vm_bo = kzalloc(sizeof(*vm_bo), GFP_KERNEL);
> +
> +	if (unlikely(!vm_bo))
> +		return NULL;
> +
> +	vm_bo->mgr = mgr;
> +	vm_bo->obj = obj;
> +
> +	kref_init(&vm_bo->kref);
> +	INIT_LIST_HEAD(&vm_bo->list.gpuva);
> +	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
> +	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
> +
> +	drm_gem_object_get(obj);
> +
> +	return vm_bo;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_gem_create);
> +
> +void
> +drm_gpuva_gem_destroy(struct kref *kref)
> +{
> +	struct drm_gpuva_gem *vm_bo = container_of(kref, struct drm_gpuva_gem,
> +						   kref);
> +	const struct drm_gpuva_fn_ops *ops = vm_bo->mgr->ops;
> +
> +	drm_gem_object_put(vm_bo->obj);
> +
> +	if (ops && ops->vm_bo_free)
> +		ops->vm_bo_free(vm_bo);
> +	else
> +		kfree(vm_bo);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_gem_destroy);
> +
> +/**
> + * drm_gpuva_gem_find() - find the &drm_gpuva_gem for the given
> + * &drm_gpuva_manager and &drm_gem_object
> + * @mgr: The &drm_gpuva_manager the @obj is mapped in.
> + * @obj: The &drm_gem_object being mapped in the @mgr.
> + *
> + * Find the &drm_gpuva_gem representing the combination of the given
> + * &drm_gpuva_manager and &drm_gem_object. If found, increases the reference
> + * count of the &drm_gpuva_gem accordingly.
> + *
> + * Returns: a pointer to the &drm_gpuva_gem on success, NULL on failure
> + */
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_find(struct drm_gpuva_manager *mgr,
> +		   struct drm_gem_object *obj)
> +{
> +	struct drm_gpuva_gem *vm_bo = __drm_gpuva_gem_find(mgr, obj);
> +
> +	return vm_bo ? drm_gpuva_gem_get(vm_bo) : NULL;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_gem_find);
> +
> +/**
> + * drm_gpuva_gem_obtain() - obtains and instance of the &drm_gpuva_gem for the
> + * given &drm_gpuva_manager and &drm_gem_object
> + * @mgr: The &drm_gpuva_manager the @obj is mapped in.
> + * @obj: The &drm_gem_object being mapped in the @mgr.
> + *
> + * Find the &drm_gpuva_gem representing the combination of the given
> + * &drm_gpuva_manager and &drm_gem_object. If found, increases the reference
> + * count of the &drm_gpuva_gem accordingly. If not found, allsocates a new
> + * &drm_gpuva_gem.
> + *
> + * Returns: a pointer to the &drm_gpuva_gem on success, an ERR_PTR on failure
> + */
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_obtain(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj)
> +{
> +	struct drm_gpuva_gem *vm_bo;
> +
> +	vm_bo = drm_gpuva_gem_find(mgr, obj);
> +	if (vm_bo)
> +		return vm_bo;
> +
> +	vm_bo = drm_gpuva_gem_create(mgr, obj);
> +	if (!vm_bo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return vm_bo;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_gem_obtain);
> +
> +/**
> + * drm_gpuva_gem_obtain_prealloc() - obtains and instance of the &drm_gpuva_gem
> + * for the given &drm_gpuva_manager and &drm_gem_object
> + * @mgr: The &drm_gpuva_manager the @obj is mapped in.
> + * @obj: The &drm_gem_object being mapped in the @mgr.
> + *
> + * Find the &drm_gpuva_gem representing the combination of the given
> + * &drm_gpuva_manager and &drm_gem_object. If found, increases the reference
> + * count of the found &drm_gpuva_gem accordingly, while the @__vm_bo reference
> + * count is decreased. If not found @__vm_bo is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva_gem or @__vm_bo if no existing
> + * &drm_gpuva_gem was found
> + */
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_obtain_prealloc(struct drm_gpuva_manager *mgr,
> +			      struct drm_gem_object *obj,
> +			      struct drm_gpuva_gem *__vm_bo)
> +{
> +	struct drm_gpuva_gem *vm_bo;
> +
> +	vm_bo = drm_gpuva_gem_find(mgr, obj);
> +	if (vm_bo) {
> +		drm_gpuva_gem_put(__vm_bo);
> +		return vm_bo;
> +	}
> +
> +	return __vm_bo;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_gem_obtain_prealloc);
> +
> +static int
> +__drm_gpuva_extobj_insert(struct drm_gpuva_manager *mgr,
> +			  struct drm_gem_object *obj,
> +			  gfp_t gfp)
> +{
> +	MA_STATE(mas, &mgr->mt_ext, 0, 0);
> +	union {
> +		struct drm_gem_object *obj;
> +		uintptr_t index;
> +	} gem;
> +	union {
> +		void *ptr;
> +		uintptr_t cnt;
> +	} ref;
> +	int ret = 0;
> +
> +	gem.obj = obj;
> +	mas_set(&mas, gem.index);
> +
> +	mas_lock(&mas);
> +	ref.ptr = mas_walk(&mas);
> +	if (ref.ptr) {
> +		++ref.cnt;
> +		mas_store(&mas, ref.ptr);
> +	} else {
> +		if (unlikely(!gfp)) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		mas_set(&mas, gem.index);
> +		ref.cnt = 1;
> +		ret = mas_store_gfp(&mas, ref.ptr, gfp);
> +		if (likely(!ret))
> +			drm_gem_object_get(obj);
> +	}
> +out:
> +	mas_unlock(&mas);
> +	return ret;
> +}
> +
> +static void
> +__drm_gpuva_extobj_remove(struct drm_gpuva_manager *mgr,
> +			  struct drm_gem_object *obj)
> +{
> +	MA_STATE(mas, &mgr->mt_ext, 0, 0);
> +	union {
> +		struct drm_gem_object *obj;
> +		uintptr_t index;
> +	} gem;
> +	union {
> +		void *ptr;
> +		uintptr_t cnt;
> +	} ref;
> +
> +	gem.obj = obj;
> +	mas_set(&mas, gem.index);
> +
> +	mas_lock(&mas);
> +	if (unlikely(!(ref.ptr = mas_walk(&mas))))
> +		goto out;
> +
> +	if (!--ref.cnt) {
> +		mas_erase(&mas);
> +		drm_gem_object_put(obj);
> +	} else {
> +		mas_store(&mas, ref.ptr);
> +	}
> +out:
> +	mas_unlock(&mas);
> +}
> +
> +/**
> + * drm_gpuva_extobj_insert - insert an external &drm_gem_object
> + * @mgr: the &drm_gpuva_manager to insert into
> + * @obj: the &drm_gem_object to insert as extobj
> + *
> + * Insert a &drm_gem_object into the &drm_gpuva_managers external object tree.
> + * If the &drm_gem_object already exists in the tree, the reference counter
> + * of this external object is increased by one.
> + *
> + * Drivers should insert the external &drm_gem_object before the dma-fence
> + * signalling critical section, e.g. when submitting the job, and before
> + * locking all &drm_gem_objects of a GPU-VM, e.g. with drm_gpuva_manager_lock()
> + * or its dervates.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_extobj_insert(struct drm_gpuva_manager *mgr,
> +			struct drm_gem_object *obj)
> +{
> +	return drm_gpuva_is_extobj(mgr, obj) ?
> +		__drm_gpuva_extobj_insert(mgr, obj, GFP_KERNEL) : 0;
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_extobj_insert);
> +
> +/**
> + * drm_gpuva_extobj_get - increase the referecne count of an external
> + * &drm_gem_object
> + * @mgr: the &drm_gpuva_manager storing the extobj
> + * @obj: the &drm_gem_object to representing the extobj
> + *
> + * Increases the reference count of the extobj represented by @obj.
> + *
> + * Drivers should call this for every &drm_gpuva backed by a &drm_gem_object
> + * being inserted.
> + *
> + * For &drm_gpuva_op_remap operations drivers should make sure to only take an
> + * additional reference if the re-map operation splits an existing &drm_gpuva
> + * into two separate ones.
> + *
> + * See also drm_gpuva_map_get() and drm_gpuva_remap_get().
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +void
> +drm_gpuva_extobj_get(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj)
> +{
> +	if (drm_gpuva_is_extobj(mgr, obj))
> +		WARN(__drm_gpuva_extobj_insert(mgr, obj, 0),
> +		     "Can't increase ref-count of non-existent extobj.");
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_extobj_get);
> +
> +/**
> + * drm_gpuva_extobj_put - decrease the referecne count of an external
> + * &drm_gem_object
> + * @mgr: the &drm_gpuva_manager storing the extobj
> + * @obj: the &drm_gem_object to representing the extobj
> + *
> + * Decreases the reference count of the extobj represented by @obj.
> + *
> + * Drivers should call this for every &drm_gpuva backed by a &drm_gem_object
> + * being removed from the GPU VA space.
> + *
> + * See also drm_gpuva_unmap_put().
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +void
> +drm_gpuva_extobj_put(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj)
> +{
> +	if (drm_gpuva_is_extobj(mgr, obj))
> +		__drm_gpuva_extobj_remove(mgr, obj);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_extobj_put);
> +
> +/**
> + * drm_gpuva_gem_evict() - add / remove a &drm_gem_object to / from a
> + * &drm_gpuva_managers evicted list
> + * @obj: the &drm_gem_object to add or remove
> + * @evict: indicates whether the object is evicted
> + *
> + * Adds a &drm_gem_object to or removes it from all &drm_gpuva_managers evicted
> + * list containing a mapping of this &drm_gem_object.
> + */
> +void
> +drm_gpuva_gem_evict(struct drm_gem_object *obj, bool evict)
> +{
> +	struct drm_gpuva_gem *vm_bo;
> +
> +	/* Required for iterating the GEMs GPUVA GEM list. If no driver specific
> +	 * lock has been set, the list is protected with the GEMs dma-resv lock.
> +	 */
> +	drm_gem_gpuva_assert_lock_held(obj);
> +
> +	/* Required to protect the GPUVA managers evict list against concurrent
> +	 * access through drm_gpuva_manager_validate(). Concurrent insertions to
> +	 * the evict list through different GEM object evictions are protected
> +	 * by the GPUVA managers evict lock.
> +	 */
> +	dma_resv_assert_held(obj->resv);
> +
> +	drm_gem_for_each_gpuva_gem(vm_bo, obj) {
> +		struct drm_gpuva_manager *mgr = vm_bo->mgr;
> +
> +		spin_lock(&mgr->evict.lock);
> +		if (evict)
> +			list_add_tail(&vm_bo->list.entry.evict,
> +				      &mgr->evict.list);
> +		else
> +			list_del_init(&vm_bo->list.entry.evict);
> +		spin_unlock(&mgr->evict.lock);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_gem_evict);
> +
>   static int
>   __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>   		   struct drm_gpuva *va)
> @@ -806,15 +1381,20 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>   /**
>    * drm_gpuva_link() - link a &drm_gpuva
>    * @va: the &drm_gpuva to link
> + * @vm_bo: the &drm_gpuva_gem to add the &drm_gpuva to
>    *
> - * This adds the given &va to the GPU VA list of the &drm_gem_object it is
> - * associated with.
> + * This adds the given &va to the GPU VA list of the &drm_gpuva_gem and the
> + * &drm_gpuva_gem to the &drm_gem_object it is associated with.
> + *
> + * For every &drm_gpuva entry added to the &drm_gpuva_gem an additional
> + * reference of the latter is taken.
>    *
>    * This function expects the caller to protect the GEM's GPUVA list against
> - * concurrent access using the GEMs dma_resv lock.
> + * concurrent access using either the GEMs dma_resv lock or a driver specific
> + * lock set through drm_gem_gpuva_set_lock().
>    */
>   void
> -drm_gpuva_link(struct drm_gpuva *va)
> +drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuva_gem *vm_bo)
>   {
>   	struct drm_gem_object *obj = va->gem.obj;
>   
> @@ -823,7 +1403,10 @@ drm_gpuva_link(struct drm_gpuva *va)
>   
>   	drm_gem_gpuva_assert_lock_held(obj);
>   
> -	list_add_tail(&va->gem.entry, &obj->gpuva.list);
> +	drm_gpuva_gem_get(vm_bo);
> +	list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
> +	if (list_empty(&vm_bo->list.entry.gem))
> +		list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_link);
>   
> @@ -834,20 +1417,39 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
>    * This removes the given &va from the GPU VA list of the &drm_gem_object it is
>    * associated with.
>    *
> + * This removes the given &va from the GPU VA list of the &drm_gpuva_gem and
> + * the &drm_gpuva_gem from the &drm_gem_object it is associated with in case
> + * this call unlinks the last &drm_gpuva from the &drm_gpuva_gem.
> + *
> + * For every &drm_gpuva entry removed from the &drm_gpuva_gem a reference of
> + * the latter is dropped.
> + *
>    * This function expects the caller to protect the GEM's GPUVA list against
> - * concurrent access using the GEMs dma_resv lock.
> + * concurrent access using either the GEMs dma_resv lock or a driver specific
> + * lock set through drm_gem_gpuva_set_lock().
>    */
>   void
>   drm_gpuva_unlink(struct drm_gpuva *va)
>   {
>   	struct drm_gem_object *obj = va->gem.obj;
> +	struct drm_gpuva_gem *vm_bo;
>   
>   	if (unlikely(!obj))
>   		return;
>   
>   	drm_gem_gpuva_assert_lock_held(obj);
>   
> +	vm_bo = __drm_gpuva_gem_find(va->mgr, obj);
> +	if (WARN(!vm_bo, "GPUVA doesn't seem to be linked.\n"))
> +		return;
> +
>   	list_del_init(&va->gem.entry);
> +
> +	if (list_empty(&vm_bo->list.gpuva)) {
> +		list_del_init(&vm_bo->list.entry.gem);
> +		list_del_init(&vm_bo->list.entry.evict);
> +	}
> +	drm_gpuva_gem_put(vm_bo);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
>   
> @@ -977,6 +1579,26 @@ drm_gpuva_map(struct drm_gpuva_manager *mgr,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_map);
>   
> +/**
> + * drm_gpuva_map_get() - helper to insert a &drm_gpuva according to a
> + * &drm_gpuva_op_map
> + * @mgr: the &drm_gpuva_manager
> + * @va: the &drm_gpuva to insert
> + * @op: the &drm_gpuva_op_map to initialize @va with
> + *
> + * Initializes the @va from the @op and inserts it into the given @mgr and
> + * increases the reference count of the corresponding extobj.
> + */
> +void
> +drm_gpuva_map_get(struct drm_gpuva_manager *mgr,
> +		  struct drm_gpuva *va,
> +		  struct drm_gpuva_op_map *op)
> +{
> +	drm_gpuva_map(mgr, va, op);
> +	drm_gpuva_extobj_get(mgr, va->gem.obj);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_map_get);
> +
>   /**
>    * drm_gpuva_remap() - helper to remap a &drm_gpuva according to a
>    * &drm_gpuva_op_remap
> @@ -992,10 +1614,10 @@ drm_gpuva_remap(struct drm_gpuva *prev,
>   		struct drm_gpuva *next,
>   		struct drm_gpuva_op_remap *op)
>   {
> -	struct drm_gpuva *curr = op->unmap->va;
> -	struct drm_gpuva_manager *mgr = curr->mgr;
> +	struct drm_gpuva *va = op->unmap->va;
> +	struct drm_gpuva_manager *mgr = va->mgr;
>   
> -	drm_gpuva_remove(curr);
> +	drm_gpuva_remove(va);
>   
>   	if (op->prev) {
>   		drm_gpuva_init_from_op(prev, op->prev);
> @@ -1009,6 +1631,31 @@ drm_gpuva_remap(struct drm_gpuva *prev,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_remap);
>   
> +/**
> + * drm_gpuva_remap_get() - helper to remap a &drm_gpuva according to a
> + * &drm_gpuva_op_remap
> + * @prev: the &drm_gpuva to remap when keeping the start of a mapping
> + * @next: the &drm_gpuva to remap when keeping the end of a mapping
> + * @op: the &drm_gpuva_op_remap to initialize @prev and @next with
> + *
> + * Removes the currently mapped &drm_gpuva and remaps it using @prev and/or
> + * @next. Additionally, if the re-map splits the existing &drm_gpuva into two
> + * separate mappings, increases the reference count of the corresponding extobj.
> + */
> +void
> +drm_gpuva_remap_get(struct drm_gpuva *prev,
> +		    struct drm_gpuva *next,
> +		    struct drm_gpuva_op_remap *op)
> +{
> +	struct drm_gpuva *va = op->unmap->va;
> +	struct drm_gpuva_manager *mgr = va->mgr;
> +
> +	drm_gpuva_remap(prev, next, op);
> +	if (op->prev && op->next)
> +		drm_gpuva_extobj_get(mgr, va->gem.obj);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_remap_get);
> +
>   /**
>    * drm_gpuva_unmap() - helper to remove a &drm_gpuva according to a
>    * &drm_gpuva_op_unmap
> @@ -1023,6 +1670,24 @@ drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>   
> +/**
> + * drm_gpuva_unmap_put() - helper to remove a &drm_gpuva according to a
> + * &drm_gpuva_op_unmap
> + * @op: the &drm_gpuva_op_unmap specifying the &drm_gpuva to remove
> + *
> + * Removes the &drm_gpuva associated with the &drm_gpuva_op_unmap and decreases
> + * the reference count of the corresponding extobj.
> + */
> +void
> +drm_gpuva_unmap_put(struct drm_gpuva_op_unmap *op)
> +{
> +	struct drm_gpuva *va = op->va;
> +
> +	drm_gpuva_unmap(op);
> +	drm_gpuva_extobj_put(va->mgr, va->gem.obj);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_unmap_put);
> +
>   static int
>   op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
>   	  u64 addr, u64 range,
> @@ -1663,6 +2328,7 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
>   {
>   	struct drm_gpuva_ops *ops;
>   	struct drm_gpuva_op *op;
> +	struct drm_gpuva_gem *vm_bo;
>   	struct drm_gpuva *va;
>   	int ret;
>   
> @@ -1674,7 +2340,7 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
>   
>   	INIT_LIST_HEAD(&ops->list);
>   
> -	drm_gem_for_each_gpuva(va, obj) {
> +	drm_gem_for_each_gpuva(va, vm_bo, mgr, obj) {
>   		op = gpuva_op_alloc(mgr);
>   		if (!op) {
>   			ret = -ENOMEM;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bc9f6aa2f3fe..783ed3ab440d 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -571,7 +571,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>    * drm_gem_gpuva_init() - initialize the gpuva list of a GEM object
>    * @obj: the &drm_gem_object
>    *
> - * This initializes the &drm_gem_object's &drm_gpuva list.
> + * This initializes the &drm_gem_object's &drm_gpuva_gem list.
>    *
>    * Calling this function is only necessary for drivers intending to support the
>    * &drm_driver_feature DRIVER_GEM_GPUVA.
> @@ -584,28 +584,44 @@ static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>   }
>   
>   /**
> - * drm_gem_for_each_gpuva() - iternator to walk over a list of gpuvas
> - * @entry__: &drm_gpuva structure to assign to in each iteration step
> - * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
> + * drm_gem_for_each_gpuva_gem() - iterator to walk over a list of &drm_gpuva_gem
> + * @entry__: &drm_gpuva_gem structure to assign to in each iteration step
> + * @obj__: the &drm_gem_object the &drm_gpuva_gem to walk are associated with
>    *
> - * This iterator walks over all &drm_gpuva structures associated with the
> - * &drm_gpuva_manager.
> + * This iterator walks over all &drm_gpuva_gem structures associated with the
> + * &drm_gem_object.
>    */
> -#define drm_gem_for_each_gpuva(entry__, obj__) \
> -	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
> +#define drm_gem_for_each_gpuva_gem(entry__, obj__) \
> +	list_for_each_entry(entry__, &(obj__)->gpuva.list, list.entry.gem)
>   
>   /**
> - * drm_gem_for_each_gpuva_safe() - iternator to safely walk over a list of
> - * gpuvas
> - * @entry__: &drm_gpuva structure to assign to in each iteration step
> - * @next__: &next &drm_gpuva to store the next step
> - * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
> + * drm_gem_for_each_gpuva_gem_safe() - iterator to safely walk over a list of
> + * &drm_gpuva_gem
> + * @entry__: &drm_gpuva_gemstructure to assign to in each iteration step
> + * @next__: &next &drm_gpuva_gem to store the next step
> + * @obj__: the &drm_gem_object the &drm_gpuva_gem to walk are associated with
>    *
> - * This iterator walks over all &drm_gpuva structures associated with the
> + * This iterator walks over all &drm_gpuva_gem structures associated with the
>    * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
>    * it is save against removal of elements.
>    */
> -#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
> -	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
> +#define drm_gem_for_each_gpuva_gem_safe(entry__, next__, obj__) \
> +	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, list.entry.gem)
> +
> +/**
> + * drm_gem_for_each_gpuva() - iterator to walk over a list of &drm_gpuva
> + * @va__: &drm_gpuva structure to assign to in each iteration step
> + * @vm_bo__: the &drm_gpuva_gem representing the @mgr__ and @obj__ combination
> + * @mgr__: the &drm_gpuva_manager the &drm_gpuvas to walk are associated with
> + * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gpuva_manager and &drm_gem_object.
> + */
> +#define drm_gem_for_each_gpuva(va__, vm_bo__, mgr__, obj__) \
> +	for (vm_bo__ = drm_gpuva_gem_find(mgr__, obj__), \
> +	     va__ = vm_bo__ ? list_first_entry(&vm_bo__->list.gpuva, typeof(*va__), gem.entry) : NULL; \
> +	     va__ && !list_entry_is_head(va__, &vm_bo__->list.gpuva, gem.entry); \
> +	     va__ = list_next_entry(va__, gem.entry))
>   
>   #endif /* __DRM_GEM_H__ */
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> index ed8d50200cc3..693e2da3f425 100644
> --- a/include/drm/drm_gpuva_mgr.h
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -26,12 +26,16 @@
>    */
>   
>   #include <linux/list.h>
> +#include <linux/dma-resv.h>
> +#include <linux/maple_tree.h>
>   #include <linux/rbtree.h>
>   #include <linux/types.h>
>   
>   #include <drm/drm_gem.h>
> +#include <drm/drm_exec.h>
>   
>   struct drm_gpuva_manager;
> +struct drm_gpuva_gem;
>   struct drm_gpuva_fn_ops;
>   
>   /**
> @@ -140,7 +144,7 @@ struct drm_gpuva {
>   int drm_gpuva_insert(struct drm_gpuva_manager *mgr, struct drm_gpuva *va);
>   void drm_gpuva_remove(struct drm_gpuva *va);
>   
> -void drm_gpuva_link(struct drm_gpuva *va);
> +void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuva_gem *vm_bo);
>   void drm_gpuva_unlink(struct drm_gpuva *va);
>   
>   struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
> @@ -240,15 +244,137 @@ struct drm_gpuva_manager {
>   	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
>   	 */
>   	const struct drm_gpuva_fn_ops *ops;
> +
> +	/**
> +	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
> +	 * dma-resv to &drm_exec.
> +	 */
> +	struct drm_gem_object d_obj;
> +
> +	/**
> +	 * @resv: the &dma_resv for &drm_gem_objects mapped in this GPU VA
> +	 * space
> +	 */
> +	struct dma_resv *resv;
> +
> +	/**
> +	 * @exec: the &drm_exec helper to lock external &drm_gem_objects
> +	 */
> +	struct drm_exec exec;
> +
> +	/**
> +	 * @mt_ext: &maple_tree storing external &drm_gem_objects
> +	 */
> +	struct maple_tree mt_ext;
> +
> +	/**
> +	 * @evict: structure holding the evict list and evict list lock
> +	 */
> +	struct {
> +		/**
> +		 * @list: &list_head storing &drm_gem_objects currently being
> +		 * evicted
> +		 */
> +		struct list_head list;
> +
> +		/**
> +		 * @lock: spinlock to protect the evict list against concurrent
> +		 * insertion / removal of different &drm_gpuva_gems
> +		 */
> +		spinlock_t lock;
> +	} evict;
>   };
>   
>   void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> +			    struct drm_device *drm,
>   			    const char *name,
>   			    u64 start_offset, u64 range,
>   			    u64 reserve_offset, u64 reserve_range,
>   			    const struct drm_gpuva_fn_ops *ops);
>   void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
>   
> +/**
> + * DRM_GPUVA_EXEC - returns the &drm_gpuva_managers &drm_exec instance
> + * @mgr: the &drm_gpuva_managers to return the &drm_exec instance for
> + */
> +#define DRM_GPUVA_EXEC(mgr)	&(mgr)->exec
> +
> +int drm_gpuva_manager_lock_extra(struct drm_gpuva_manager *mgr,
> +				 int (*fn)(struct drm_gpuva_manager *mgr,
> +					   void *priv, unsigned int num_fences),
> +				 void *priv,
> +				 unsigned int num_fences,
> +				 bool interruptible);
> +
> +int drm_gpuva_manager_lock_array(struct drm_gpuva_manager *mgr,
> +				 struct drm_gem_object **objs,
> +				 unsigned int num_objs,
> +				 unsigned int num_fences,
> +				 bool interruptible);
> +
> +/**
> + * drm_gpuva_manager_lock() - lock all dma-resv of all assoiciated BOs
> + * @mgr: the &drm_gpuva_manager
> + * @num_fences: the amount of &dma_fences to reserve
> + * @interruptible: sleep interruptible if waiting
> + *
> + * Acquires all dma-resv locks of all &drm_gem_objects the given
> + * &drm_gpuva_manager contains mappings of.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +static inline int
> +drm_gpuva_manager_lock(struct drm_gpuva_manager *mgr,
> +		       unsigned int num_fences,
> +		       bool interruptible)
> +{
> +	return drm_gpuva_manager_lock_extra(mgr, NULL, NULL, num_fences,
> +					    interruptible);
> +}
> +
> +/**
> + * drm_gpuva_manager_lock() - lock all dma-resv of all assoiciated BOs
> + * @mgr: the &drm_gpuva_manager
> + *
> + * Releases all dma-resv locks of all &drm_gem_objects previously acquired
> + * through drm_gpuva_manager_lock() or its variants.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +static inline void
> +drm_gpuva_manager_unlock(struct drm_gpuva_manager *mgr)
> +{
> +	drm_exec_fini(&mgr->exec);
> +}
> +
> +int drm_gpuva_manager_validate(struct drm_gpuva_manager *mgr);
> +void drm_gpuva_manager_resv_add_fence(struct drm_gpuva_manager *mgr,
> +				      struct dma_fence *fence,
> +				      enum dma_resv_usage private_usage,
> +				      enum dma_resv_usage extobj_usage);
> +
> +int drm_gpuva_extobj_insert(struct drm_gpuva_manager *mgr,
> +			    struct drm_gem_object *obj);
> +void drm_gpuva_extobj_get(struct drm_gpuva_manager *mgr,
> +			  struct drm_gem_object *obj);
> +void drm_gpuva_extobj_put(struct drm_gpuva_manager *mgr,
> +			  struct drm_gem_object *obj);
> +
> +/**
> + * drm_gpuva_is_extobj() - indicates whether the given &drm_gem_object is an
> + * external object
> + * @mgr: the &drm_gpuva_manager to check
> + * @obj: the &drm_gem_object to check
> + *
> + * Returns: true if the &drm_gem_object &dma_resv differs from the
> + * &drm_gpuva_managers &dma_resv, false otherwise
> + */
> +static inline bool drm_gpuva_is_extobj(struct drm_gpuva_manager *mgr,
> +				       struct drm_gem_object *obj)
> +{
> +	return obj && obj->resv != mgr->resv;
> +}
> +
>   static inline struct drm_gpuva *
>   __drm_gpuva_next(struct drm_gpuva *va)
>   {
> @@ -327,6 +453,138 @@ __drm_gpuva_next(struct drm_gpuva *va)
>   #define drm_gpuva_for_each_va_safe(va__, next__, mgr__) \
>   	list_for_each_entry_safe(va__, next__, &(mgr__)->rb.list, rb.entry)
>   
> +/**
> + * struct drm_gpuva_gem - structure representing a &drm_gpuva_manager and
> + * &drm_gem_object combination
> + *
> + * This structure is an abstraction representing a &drm_gpuva_manager and
> + * &drm_gem_object combination. It serves as an indirection to accelerate
> + * iterating all &drm_gpuvas within a &drm_gpuva_manager backed by the same
> + * &drm_gem_object.
> + *
> + * Furthermore it is used cache evicted GEM objects for a certain GPU-VM to
> + * accelerate validation.
> + *
> + * Typically, drivers want to create an instance of a struct drm_gpuva_gem once
> + * a GEM object is mapped first in a GPU-VM and release the instance once the
> + * last mapping of the GEM object in this GPU-VM is unmapped.
> + */
> +struct drm_gpuva_gem {
> +
> +	/**
> +	 * @mgr: The &drm_gpuva_manager the @obj is mapped in.
> +	 */
> +	struct drm_gpuva_manager *mgr;
> +
> +	/**
> +	 * @obj: The &drm_gem_object being mapped in the @mgr.
> +	 */
> +	struct drm_gem_object *obj;
> +
> +	/**
> +	 * @kref: The reference count for this &drm_gpuva_gem.
> +	 */
> +	struct kref kref;
> +
> +	/**
> +	 * @list: Structure containing all &list_heads.
> +	 */
> +	struct {
> +		/**
> +		 * @gpuva: The list of linked &drm_gpuvas.
> +		 */
> +		struct list_head gpuva;
> +
> +		/**
> +		 * @entry: Structure containing all &list_heads serving as
> +		 * entry.
> +		 */
> +		struct {
> +			/**
> +			 * @gem: List entry to attach to the &drm_gem_objects
> +			 * gpuva list.
> +			 */
> +			struct list_head gem;
> +
> +			/**
> +			 * @evict: List entry to attach to the
> +			 * &drm_gpuva_managers evict list.
> +			 */
> +			struct list_head evict;
> +		} entry;
> +	} list;
> +};
> +
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_obtain(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj);
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_obtain_prealloc(struct drm_gpuva_manager *mgr,
> +			      struct drm_gem_object *obj,
> +			      struct drm_gpuva_gem *__vm_bo);
> +
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_find(struct drm_gpuva_manager *mgr,
> +		   struct drm_gem_object *obj);
> +
> +void drm_gpuva_gem_evict(struct drm_gem_object *obj, bool evict);
> +
> +struct drm_gpuva_gem *
> +drm_gpuva_gem_create(struct drm_gpuva_manager *mgr,
> +		     struct drm_gem_object *obj);
> +void drm_gpuva_gem_destroy(struct kref *kref);
> +
> +/**
> + * drm_gpuva_gem_get() - acquire a struct drm_gpuva_gem reference
> + * @vm_bo: the &drm_gpuva_gem to acquire the reference of
> + *
> + * This function acquires an additional reference to @vm_bo. It is illegal to
> + * call this without already holding a reference. No locks required.
> + */
> +static inline struct drm_gpuva_gem *
> +drm_gpuva_gem_get(struct drm_gpuva_gem *vm_bo)
> +{
> +	kref_get(&vm_bo->kref);
> +	return vm_bo;
> +}
> +
> +/**
> + * drm_gpuva_gem_put() - drop a struct drm_gpuva_gem reference
> + * @vm_bo: the &drm_gpuva_gem to release the reference of
> + *
> + * This releases a reference to @vm_bo.
> + */
> +static inline void
> +drm_gpuva_gem_put(struct drm_gpuva_gem *vm_bo)
> +{
> +	kref_put(&vm_bo->kref, drm_gpuva_gem_destroy);
> +}
> +
> +/**
> + * drm_gpuva_gem_for_each_va() - iterator to walk over a list of &drm_gpuva
> + * @va__: &drm_gpuva structure to assign to in each iteration step
> + * @vm_bo__: the &drm_gpuva_gem the &drm_gpuva to walk are associated with
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gpuva_gem.
> + */
> +#define drm_gpuva_gem_for_each_va(va__, vm_bo__) \
> +	list_for_each_entry(va__, &(vm_bo)->list.gpuva, gem.entry)
> +
> +/**
> + * drm_gpuva_gem_for_each_va_safe() - iterator to safely walk over a list of
> + * &drm_gpuva
> + * @va__: &drm_gpuva structure to assign to in each iteration step
> + * @next__: &next &drm_gpuva to store the next step
> + * @vm_bo__: the &drm_gpuva_gem the &drm_gpuva to walk are associated with
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gpuva_gem. It is implemented with list_for_each_entry_safe(), hence
> + * it is save against removal of elements.
> + */
> +#define drm_gpuva_gem_for_each_va_safe(va__, next__, vm_bo__) \
> +	list_for_each_entry_safe(va__, next__, &(vm_bo)->list.gpuva, gem.entry)
> +
>   /**
>    * enum drm_gpuva_op_type - GPU VA operation type
>    *
> @@ -641,6 +899,30 @@ struct drm_gpuva_fn_ops {
>   	 */
>   	void (*op_free)(struct drm_gpuva_op *op);
>   
> +	/**
> +	 * @vm_bo_alloc: called when the &drm_gpuva_manager allocates
> +	 * a struct drm_gpuva_gem
> +	 *
> +	 * Some drivers may want to embed struct drm_gpuva_gem into driver
> +	 * specific structures. By implementing this callback drivers can
> +	 * allocate memory accordingly.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	struct drm_gpuva_gem *(*vm_bo_alloc)(void);
> +
> +	/**
> +	 * @vm_bo_free: called when the &drm_gpuva_manager frees a
> +	 * struct drm_gpuva_gem
> +	 *
> +	 * Some drivers may want to embed struct drm_gpuva_gem into driver
> +	 * specific structures. By implementing this callback drivers can
> +	 * free the previously allocated memory accordingly.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*vm_bo_free)(struct drm_gpuva_gem *vm_bo);
> +
>   	/**
>   	 * @sm_step_map: called from &drm_gpuva_sm_map to finally insert the
>   	 * mapping once all previous steps were completed
> @@ -684,6 +966,17 @@ struct drm_gpuva_fn_ops {
>   	 * used.
>   	 */
>   	int (*sm_step_unmap)(struct drm_gpuva_op *op, void *priv);
> +
> +	/**
> +	 * @bo_validate: called from drm_gpuva_manager_validate()
> +	 *
> +	 * Drivers receive this callback for every evicted &drm_gem_object being
> +	 * mapped in the corresponding &drm_gpuva_manager.
> +	 *
> +	 * Typically, drivers would call their driver specific variant of
> +	 * ttm_bo_validate() from within this callback.
> +	 */
> +	int (*bo_validate)(struct drm_gem_object *obj);
>   };
>   
>   int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> @@ -696,11 +989,18 @@ int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
>   void drm_gpuva_map(struct drm_gpuva_manager *mgr,
>   		   struct drm_gpuva *va,
>   		   struct drm_gpuva_op_map *op);
> +void drm_gpuva_map_get(struct drm_gpuva_manager *mgr,
> +		       struct drm_gpuva *va,
> +		       struct drm_gpuva_op_map *op);
>   
>   void drm_gpuva_remap(struct drm_gpuva *prev,
>   		     struct drm_gpuva *next,
>   		     struct drm_gpuva_op_remap *op);
> +void drm_gpuva_remap_get(struct drm_gpuva *prev,
> +			 struct drm_gpuva *next,
> +			 struct drm_gpuva_op_remap *op);
>   
>   void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
> +void drm_gpuva_unmap_put(struct drm_gpuva_op_unmap *op);
>   
>   #endif /* __DRM_GPUVA_MGR_H__ */

