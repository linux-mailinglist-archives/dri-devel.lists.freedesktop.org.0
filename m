Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9FA3C841E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 13:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9F66E221;
	Wed, 14 Jul 2021 11:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA946E221;
 Wed, 14 Jul 2021 11:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv9z9e1b05Z4RTOpX8JFQ3+nCuTRbaz7CnYNBjWHm59Bfg+jp3RJXxVL2PvdmYtDr4T4nddOp8s4oOqg7ga41XrXoxxx4e7lZ8L51QCnEwpdbcI5idLA7Z7w0jt8NSILqYPxpOJYt7eM27qshQ/LFahmcEiIY4JgKMURSd/mDXlrcX3Oc8q0EsGG04/yE/7xea1citvJEVozcPk8AQf0/8RFuogESOa10grcsfCFVwSk4E8D+jyMbdy6/Fj/QJnQqv1IDDFwj5V2xkh2J6jfHSydvesi2dxkd5LROCToe1VoI8u6hnDw+6kdm8PrF3npjfOlFgeGET5LD8oLk5afJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVyKwJ0Rj/bHHCmlz995TBjDsZS0uJHErjSnfbvP5ko=;
 b=oaS7diGWZm33AM29F2JYrnbhE5qweFCg+wGgIAI/YmN42mL/Kbcc8zzZ1Mo/E79kU0QQ5BhM6onKvhGZ3IOLRrgD1euMxjmdvES//eIw9we9S2G5mXBaCEOvSLMhc+imbDQY39vZ7A/FKKjd5c38j6gG3yn/aOmiLYA/l7sSHys8P8YNay+OVmbbTPIuICeONA0CHhK5krrgraPv1Dttzt6ijyiSkcDbW7SD9qCIDI4boupCsmMlJo7lSOVdidWI8m8R4njaPrhv1nR2GKeoAHAOq1/pmVcenrd1NOtobmM1VNEeRPkaFi4NE71pZVzaWsLkKI6dBAxfYdK9h91Feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVyKwJ0Rj/bHHCmlz995TBjDsZS0uJHErjSnfbvP5ko=;
 b=Zfb6n7o3jogkdLGiIn3in98rd85YjvHuDVD3MB26+hA0V+eiLmAI/b1ShBqXUjNe2wmFQSr6Vbqtx0ZjG8MjnTXn0Iq+rU1I74ssv1SPkWBtSTAocVMA4y64//qRGgWsX1e1bceiT0qLkDMUeAhfpDSeW66sBhIwbfRB5tRQANc=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 11:54:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 11:54:55 +0000
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4626a7d7-95ca-104c-753a-07a9d83b0b28@amd.com>
Date: Wed, 14 Jul 2021 13:54:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0076.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P189CA0076.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 11:54:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e57d3497-b21f-4389-d2c7-08d946be323a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159EECE9148F1AF706A256383139@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 837bu30NRfe9FF7wFah/v3JkQaLftLSO1axIbysS/kIZIjDTBOjjdoCEQsFO98XiHJSS+dGq2E6/GSeTMVRAfRw+9Yt6qEqrxzljWo/kXp8VVXSuz6TSPQ95ab9UM2pWzrF9o0ExbbhvqThhWVlnr7Mz1ptiQJpr5jqqrrNe/G9KwS8dHR91gMFWjt4a20end9Sg78W7fj5j+o6TdLbHUrRaBnfu6veKelcEbqJREP1lMyL/4uz9W4qzxIbMoX4P7O++h0d+u1Gh300zagzcQd5a3Z2gUzMxITJaP0Rt/56yZBEQwp9/xn0RiaK/yVHPkE+ywk2RIvTXS06K22eHN9Y21F8EOoeFK6ZKZ8kmh/SDkVDzOTQCiJkn9eZFCJfmSdhixoaXh19zjrF4GvqIFRlq2f5HvcOM8TzqAtmgVX6CwByAbNdU9r18XmKWrjVaryZdDSuwhjowpJhHa6yls/0l+NqUlU46goeOwDQhjiXMTQ2kv/pdYGHYdQG94nR2VD2Re1HyXCSpo+qJkpt144RnLlYxAzv1DWikbhY4XfNp4a44D0B7fD5bozuihhb4ThJWtk/mBEZJBETSbfrNHo2WwcpAdojP8T7tcBT23RHGGN8+peo9IDTQlRmKSOnzHketzhp72WusktCMdQDGkOQSBSFZBzvlisPvIjKKVmA/wkygA6CXh06b3uI1B7x8PEnehDNeeSg5E2Mjm9KUe5B80p22RdbxLB1NIJ8GA0HTFxcY7ORPZQ/KI9JRppzU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(66556008)(6486002)(186003)(66946007)(66476007)(4326008)(110136005)(54906003)(316002)(2616005)(8936002)(8676002)(2906002)(31686004)(7416002)(36756003)(31696002)(86362001)(5660300002)(478600001)(66574015)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2dwc2lLaEh6T3FNUzJmcVdLL2JMU080QURzMFMvZzRkQ1hJclMvTm4wa0Fs?=
 =?utf-8?B?aENHcmhhYlYyNWFTTHNpZjNmMG9zU1kvUTZTTFlwREFGT0EvZFVRUmNKWEdU?=
 =?utf-8?B?S2lRUkE2b2RPdkpObDF6dGhTYTB5enRFVG5kdmFaaVBFMyszRml3aTBScVh2?=
 =?utf-8?B?K0RIUk9aSEl6blYvd004WmRmR1FCUlFUR05lUkFUVy9kS3FzU2dCVjg3cGlX?=
 =?utf-8?B?eTdVclJoMkowYkpTaWNmS250Z3F1RGZWSnhwUlh4Nmg4ODRYMHAyRHBEUU45?=
 =?utf-8?B?VHZWaUk4Wk12ek5zN2cveEVYbEppa3pxMkFTSkNwV2hpRU51eFBsZ3NRNHox?=
 =?utf-8?B?NE85dHZ1UXkxckRmMEwwc0NJUnE2Y0U4U3FIR21tTDU0czhlaHY5cG0vL3A2?=
 =?utf-8?B?L0pmd1JOTVJIOXdLY2ZsYXBVaVRMekF0VVFRQWNpZ3YvN29SVnpmNHVIbHF5?=
 =?utf-8?B?QjhBZk1lb0VHSGtjeUN6ZDVaSkdQNDdhZWl1OEU2TWV0VzNhbmg3eDhoUis1?=
 =?utf-8?B?M3N0TUhoZzBXMDUvcks0UE05MWpwVXBiZWpDZ1YycGdiU0ZwYzFrckNwdVJh?=
 =?utf-8?B?cTEzaEUvMDFCWmFuZHl2VGs3UjBhSzFYdDlvZTY3TndWdkI1M3ZwYTkzRjV4?=
 =?utf-8?B?RkdPM09PbEpoSXVuMWFzRFZwNFQzQzE4Q08rOWM0STNCWm1sTyt4ZVF0K1hj?=
 =?utf-8?B?NjNweitUZkZGQUE0U0xicTR6RVhJZ0pzS3k3bS9kOVZJSzVHa3NtNFhwSmFk?=
 =?utf-8?B?dWNUK1B1Q0JlMUwrbUZLQmdiYWl4c21oMVU4VkxnejdYS3pwWDE4UERaWmQy?=
 =?utf-8?B?Z2J5emc4Qkc3ZWpnZ1kyQXhpQ2ltRWdDTDZOWFFuNXJjajZjWnMvdThkUE1E?=
 =?utf-8?B?cXZmVThCMzBOMWQ5R1AxMmJlOThmRkhlVk5pdUV3RlpRbjNCa09vVmVRNEU0?=
 =?utf-8?B?TCtpTjFDZ2JKbnlUN2VtRDFQblIxL0wxMU9VU0pUaStya0JtTzFkWnp1T3I1?=
 =?utf-8?B?dUJ2V3ZJNFFhdGU1dVBSaXZ2aFJ6QWRuTEhmdHY3MDZRQ0QwNFNETVRYZDFR?=
 =?utf-8?B?Ymh2VVlqSGNnYmVXY2NMQm9qWWRvZUZIQVhUNTdIRlFrOWFWMUlFSFl6NVhz?=
 =?utf-8?B?OXRwUmd3MDhZd1Z5N2YvaWZTRDlPY1RTbFNzN2dROWNHSWJkczl5dC9xMjdi?=
 =?utf-8?B?NWR0U3ZmaVNKdlQzK3l5TGhMc2d2aXk4dXNsdkxMWGpEN2lXbFFLMHJlMUN4?=
 =?utf-8?B?VXJJOGhRMERiZ2FpTG1xcHV1UGdjKzRZQmo1TTFOQzNyVStyc2gybDVQbEdo?=
 =?utf-8?B?YUZPem91UXdoVzE2cUErUUh3a3Nndklya3FzOEE5cmdxTXRrS3R3d2ZYNUZI?=
 =?utf-8?B?M1RiNGVDb0ZuVExqTUNKU0w4RUlUL2wwZGlWc01tMmJzVG9icXJiVkZTTFI2?=
 =?utf-8?B?M1NzVzRLVTc1dmVvbFp5QnV4TXF4RVlLNFp4d2dhL2ZZeC9IVkE3dDgyQ3Iw?=
 =?utf-8?B?cS9qYVpWa1NBY1Y2aDg2QnpaK2t3ekFMOU9EOVg3YmJjbHZWZkpJZlJ2UkRk?=
 =?utf-8?B?UlBIdHdDS3M0Wk44eE1HOUZndFVzYis4MU1kVWZFSXZJK2Q1cWEwczE0Skow?=
 =?utf-8?B?R0NZeUNVdnYvamNtb044SllHM09UNnk4anNxM1hyUXJLczVveEUvWkJaUmMw?=
 =?utf-8?B?VWVsYUxuSnQxblFTeHVPMFp4WnlrWUZYUXRSeDZBYjdHSS90OGdKK1ZkSy9i?=
 =?utf-8?B?WW9CRUIrMjU5ekNPdFpKY3FHTWpvOU05Y09JUVhad1JqTVNzR1JIZU83cW04?=
 =?utf-8?B?ZDFvT3VjYkpnYVhuSzVkdWhFRWlqT2pHZW0zakgwdGIzcmJvSm5KaUVsMDZV?=
 =?utf-8?Q?/Fp/mM4E6df9f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57d3497-b21f-4389-d2c7-08d946be323a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 11:54:55.4049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4tJC6JWSpGCl0GcOXs0NQUvqXdbBfEY+XV4HUtnpil7tGmYWs2IlxLH3RtCj8d9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> intel-gfx-ci realized that something is not quite coherent anymore on
> some platforms for our i915+vgem tests, when I tried to switch vgem
> over to shmem helpers.
>
> After lots of head-scratching I realized that I've removed calls to
> drm_clflush. And we need those. To make this a bit cleaner use the
> same page allocation tooling as ttm, which does internally clflush
> (and more, as neeeded on any platform instead of just the intel x86
> cpus i915 can be combined with).
>
> Unfortunately this doesn't exist on arm, or as a generic feature. For
> that I think only the dma-api can get at wc memory reliably, so maybe
> we'd need some kind of GFP_WC flag to do this properly.

The problem is that this stuff is extremely architecture specific. So 
GFP_WC and GFP_UNCACHED are really what we should aim for in the long term.

And as far as I know we have at least the following possibilities how it 
is implemented:

* A fixed amount of registers which tells the CPU the caching behavior 
for a memory region, e.g. MTRR.
* Some bits of the memory pointers used, e.g. you see the same memory at 
different locations with different caching attributes.
* Some bits in the CPUs page table.
* Some bits in a separate page table.

On top of that there is the PCIe specification which defines non-cache 
snooping access as an extension.

Mixing that with the CPU caching behavior gets you some really nice ways 
to break a driver. In general x86 seems to be rather graceful, but arm 
and PowerPC are easily pissed if you mess that up.

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Christian könig <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 296ab1b7c07f..657d2490aaa5 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -10,6 +10,10 @@
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
>   
> +#ifdef CONFIG_X86
> +#include <asm/set_memory.h>
> +#endif
> +
>   #include <drm/drm.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
> @@ -162,6 +166,11 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>   		return PTR_ERR(pages);
>   	}
>   
> +#ifdef CONFIG_X86
> +	if (shmem->map_wc)
> +		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
> +#endif
> +
>   	shmem->pages = pages;
>   
>   	return 0;
> @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>   	if (--shmem->pages_use_count > 0)
>   		return;
>   
> +#ifdef CONFIG_X86
> +	if (shmem->map_wc)
> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> +#endif
> +
>   	drm_gem_put_pages(obj, shmem->pages,
>   			  shmem->pages_mark_dirty_on_put,
>   			  shmem->pages_mark_accessed_on_put);

