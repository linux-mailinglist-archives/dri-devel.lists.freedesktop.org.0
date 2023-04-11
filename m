Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA236DDA76
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2135210E524;
	Tue, 11 Apr 2023 12:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B02010E521;
 Tue, 11 Apr 2023 12:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQeW36k9k57exk9+0igs4bvdVPmpNlO+2gnU/2LJfe1zQqmop/i3ku2aRmJhpuZIVa4gOJFWtKa6yAlKyLFuFrMs6OMjlf/NuCoWT+x/HDl/tL6rPfLBtr9Dmy414e/SKWOyVbYCQ3lnUGpA3GisMRNXsW+5m/JEhiWiJpXBuncTLZQyw3wjsNbaIJ8ZWCyqegWznDmvgIyhh2ttOYJadq1SyRsXo/XrdmQaEYu5FSmD7fM26t1fy7LPm+ZSduYElbKJfLLFdxwA5e1Md0pHp814v3cpixQYDho/7FBiEqP+GL/6TF9o56PxqhEMRqr1uHx3Bi14BsIu9OntmZ70tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ywmcOrN9VoHOZ0s28zig2PkzWvFtsDQFuOBrQprVks=;
 b=BZTN8SgPRbYtS8BeQ16xfJSnTXtXtZS7uPXBa9EYf9dygZ7neJvDdFqkeOcjSK2xoJh7LhU4THx9bQVQgWwid+HVBJimSpIntbqbgV1NylyvQU01bOjnuIWw1JzPAYbQE5ehJB5fvYlaR7EojpIXmE1huZaZqsxl2n2D35wyvUifnjXhLgWTQc9d4Kv+CBtDFNtGV6u8fJZtxh97GwOr/Po1tBatIpM0SfAqxDdVTQvNlNSq4pIqTEPQKCAJqX6hh0fxMHwoyNPdzIbZhkRDnNQPgBJFpX/6KGSuvTXjOO7iYV/V7jvgDiMm1E+Pef/4VxSvCpL5Y7sG60Oq4waK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ywmcOrN9VoHOZ0s28zig2PkzWvFtsDQFuOBrQprVks=;
 b=OMQUbJmdDKebvsrETcWY2v//nWV9Ojj1JP5VwC8/L77MYDNsdooIzs+4SxQz8kRasx+U01JL2YW8rimOwXkHKxfbfnI6MtRpSHMissW3I2tUiJFyDdL20T1aQfBc9yuO6yPFBkPC0AeBgE7ZIQY8u+SpLoE1LRfbwapMzgVMz0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 12:11:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 12:11:26 +0000
Message-ID: <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
Date: Tue, 11 Apr 2023 14:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: d548302e-3752-48dd-dc52-08db3a85dfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Qfv8EQyyuSFcThA1FpexDBdKQeVGi3TnW3q/LdcUkkMiU+GONmWsY5mRoNwgMRpcd5ik+a1g5r3ZZ0J09S9m0fspcW+8SBsosYzeGBiUsKclu3SdMAmf/rUyuXSv7MLJ/NcLOt2yNHRllX7drXHSecW0ZFYTrQZFN8GiOzI3C+pE+YwjvvP2liCj/dCdE+zCjnXy11/QHZt+dl92kGd8M1dLFQQR62LITkZjbEYjOYjmQK4mm+mZOunEqImrGNDULp8SijHhdinWCiZIX0W2gitpPGVi+gnNGQfaUvI5ScWHQeMyetijqirdPB6ifIlkY56HZ7nCB7nul07ydxGuoBnV7gwU+KEmxVlB9NOpQMgyiBroLpUdNlfUsKTBxpqBK4nWUofBr3kZcW28Q2wPPNquHovqy+xrFMfRcGQHlQ/1HS0gNiZetCPCSWL2iq7HJsedCUX/l4kBxqhg66FfbgYh7SKxR6knMXYjfJ1qF1XS/6ZXPjGTfQCJJEniv30O4SAiYxHpeNnPZzsrwoeDNsN0GoAx1uUhE3uoP1ZHDW1FRTQyfVOs/4bT2gEcKAE70xhOg13hnSjkT3eGN4w7wLi6e7RFnEX8mfmcFF/njYw6KIkLm5s3GuqvrPYExbsTRxGgJ2GIXhAm8aO7xZ3nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199021)(478600001)(6512007)(316002)(110136005)(26005)(6506007)(186003)(6486002)(2906002)(5660300002)(4326008)(66946007)(41300700001)(8676002)(66476007)(6666004)(8936002)(66556008)(38100700002)(31696002)(66574015)(86362001)(83380400001)(36756003)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHUrSnV6SHdRMTRxSy85alJzMVYrSlpOYTlaanQ2U1ZtQjFsRTgycU9hU1Rx?=
 =?utf-8?B?dkpiQVBXZG43OS9aRWdoVHRrUFJUV1ZzbzZ5ZHZDVlNTL0U1SHl2SXZua3lx?=
 =?utf-8?B?ZmFTWFhmTEZnc3hHTUZ0aHhnL0c2MGs5YnBIQ0hLOHozT1JsSld0VWtqRlM4?=
 =?utf-8?B?YlZCQVVIU2FLendRVUR6VWovNkorNDNaM2JTa3NxVFJaYmJoVk5zSlVOQlN0?=
 =?utf-8?B?dlFNeXBEeHJtN3V1b093UExOdmZ0cXdXa0JKY2diNlZySU16eCtRRkxCSkdv?=
 =?utf-8?B?ZC8yQ2l2cDczS0tqcWZiTjlHTmFGazFCdDdlMkxTM2FWNGNBelF3TmREOUVZ?=
 =?utf-8?B?T1NERnRYajBrUXVzbi9rYVgrMHNoNU5HU2RMYjU2Q25jY2QwS3JLVUt4WUZZ?=
 =?utf-8?B?RDB3eHlJSGt6UzFacE0xM3lxQVRmTlNsc1lsb0hUL0JhZmd0Z2JSZldNdGlR?=
 =?utf-8?B?ZEZVbEhrNmxpQzFZSEFldkZqbGQrcWFOR0dhd2lZSmFEcDdRejVqZ3gzRHlW?=
 =?utf-8?B?aXYxL1NmNE5Xd3V2akl5Q2lhZmhBY3grcUNHU0NCbzhrNmZZVmVjVXhLV1Fy?=
 =?utf-8?B?WXJJVE5lMCtpQnl2V3NHRzdmY2llSzhuUDh4OHZEZTJLdW8xUThxZzNnWVFH?=
 =?utf-8?B?dWRpM3pLNDlIR04zcWFJVUhoRU9jYnlaR0RpK0FMNWlQMlMvU1lYeGtaVFRz?=
 =?utf-8?B?YVlqb2VLWVpKUnQwTzk4WDh5OWFQVTQvRTBHNHM1eGQrYjhJZzRMQy9HU0J4?=
 =?utf-8?B?R250MXVQMWVMYWszWFdqaG9aYlA1d0pyZXlXZndXdldvN2RtZXhrUFNTVHRv?=
 =?utf-8?B?a0JMYVg2eTZKa3NicTgzL1Z1aGxmMzEwSURjUHNwWjdaOXcwV2ZyQ0tCaHM0?=
 =?utf-8?B?d2VhRzBpZVBxR3YzU3UxWnQ0eDNzV2YvYnZNNXhTQkVMeHdFdXExd2xQOFVa?=
 =?utf-8?B?NkRoN082M0hKMWhxOVpUbDhCMU1wRkJoTlpJTnJzRlNMNUl6dUd4TGlTcjFu?=
 =?utf-8?B?MnhUajJ5M2tzdXpRTE5jNzZpYlhJYW82U0tFOGNvVXRoS0huRnZlUnV3cEdP?=
 =?utf-8?B?bUUvS2dlcnRpVTF6Vy9EMXUxVGdZLzQ5OHB2NWtCYzBNeDNiajlvajNHYm1C?=
 =?utf-8?B?MjZOM1pNQWt0aHFDN3lldVQrWkVsWXdmTGJ1dCtaaG14ZG9kY3g5VU9FMUdk?=
 =?utf-8?B?TVpaeVRhK0VqWmRrUktMN3o2WlhSa2VnTHlMVkRIVU5yZk5VaXh4cTNHWlhh?=
 =?utf-8?B?eDUxQ29Pdkh2M21yVHdqMVBZWFlqbjNJZTVkZjZzeVlteWpFOTQzd0QzT0c5?=
 =?utf-8?B?ZFZDOFFJV29GVXlPM0tkOXNoQS9VQWIrcXZ0clZjd0RiOUlnc0dPajBqN0dN?=
 =?utf-8?B?NXZmeGxjankwTUlVNTkvMkt1VUpxN1BQN2EzcjJTMjBHbVBmeGFxVlZHMm1Q?=
 =?utf-8?B?UnZVbExmUkFHUWFjWXZHZXh6NXRIVVIrbFl1MVNxaE9vYnVuTFdoc20vT1Ni?=
 =?utf-8?B?K1ZtSFJ6NDRJblozQ1FjZ3gvVzh6MWExR3EvMUp5Uy9YekRSbzNmM2trNUh2?=
 =?utf-8?B?c095c3U2Vzc5blE1TkZBeXErTWpPb0UwR2tCZ0gzbFpBVmRmbllyc1doSkc5?=
 =?utf-8?B?bXFBOWRPRE5rTElwT2I0VHJaS3JvOVlvci9DWm1HR0pYNnlhenJtVGRpQTJK?=
 =?utf-8?B?WXY3cFpyK2Z0aFZBaURiVFpGS3FHTDgydk1xTktqNjhUUlkvTjJRSllDd1U4?=
 =?utf-8?B?R1ZMSlpFV2IrNVdlRER1czQrcklhaE9JQSt3amUxVnRQaGdnZG9JVDRoUUww?=
 =?utf-8?B?VG02d25JTW95QTJyY2ppU2VhNjJQNjhSMURaZWd6N3YySVUvblA2bFY1MmdC?=
 =?utf-8?B?Qis4ZFNWNlVYdjFPSTRGWWQrZ0tuU1RpM0crd053anU0bU1BYk92enFUelIy?=
 =?utf-8?B?QzArUlZzeENSOEl5WXN5d3ZXNUZjc0Z0Ui9rdFdUTS9tV3M2eUxISWdaWTY1?=
 =?utf-8?B?eUlsZkpGWnZzaU5TTXJUOUgwWkdSS3hZUDVrRDRRbFJqNkVkeHI3d3hGRmJP?=
 =?utf-8?B?MWlTci9WZW93RWlMY3c5NHRBVFhQY3RsSnIzNzhKNTR5ZjhRcG9nV2Z6Y25B?=
 =?utf-8?Q?RrIY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d548302e-3752-48dd-dc52-08db3a85dfe7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 12:11:26.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfwmcBPcKoV2/Ca0QhYbhtMdZVz5+eTtlXha0iB/tsi6wOZX/Uh5eDywZhdkW+j5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.04.23 um 11:51 schrieb Daniel Vetter:
> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellström wrote:
>> When swapping out, we will split multi-order pages both in order to
>> move them to the swap-cache and to be able to return memory to the
>> swap cache as soon as possible on a page-by-page basis.
>> Reduce the page max order to the system PMD size, as we can then be nicer
>> to the system and avoid splitting gigantic pages.
>>
>> Looking forward to when we might be able to swap out PMD size folios
>> without splitting, this will also be a benefit.
>>
>> v2:
>> - Include all orders up to the PMD size (Christian König)
>> v3:
>> - Avoid compilation errors for architectures with special PFN_SHIFTs
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Apparently this fails on ppc build testing. Please supply build fix asap
> (or I guess we need to revert). I'm kinda not clear why this only showed
> up when I merged the drm-misc-next pr into drm-next ...

I'm really wondering this as well. It looks like PMD_SHIFT isn't a 
constant on this particular platform.

But from what I can find in the upstream 6.2 kernel PMD_SHIFT always 
seems to be a constant.

So how exactly can that here break?

Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++-----------
>>   1 file changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index dfce896c4bae..18c342a919a2 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -47,6 +47,11 @@
>>   
>>   #include "ttm_module.h"
>>   
>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>> +/* Some architectures have a weird PMD_SHIFT */
>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)
>> +
>>   /**
>>    * struct ttm_pool_dma - Helper object for coherent DMA mappings
>>    *
>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
>>   
>>   static atomic_long_t allocated_pages;
>>   
>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>   
>> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>>   
>>   static spinlock_t shrinker_lock;
>>   static struct list_head shrinker_list;
>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>   	else
>>   		gfp_flags |= GFP_HIGHUSER;
>>   
>> -	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
>> +	for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
>>   	     num_pages;
>>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>>   		struct ttm_pool_type *pt;
>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>   
>>   	if (use_dma_alloc) {
>>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> -			for (j = 0; j < MAX_ORDER; ++j)
>> +			for (j = 0; j < TTM_DIM_ORDER; ++j)
>>   				ttm_pool_type_init(&pool->caching[i].orders[j],
>>   						   pool, i, j);
>>   	}
>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>   
>>   	if (pool->use_dma_alloc) {
>>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> -			for (j = 0; j < MAX_ORDER; ++j)
>> +			for (j = 0; j < TTM_DIM_ORDER; ++j)
>>   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>   	}
>>   
>> @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
>>   	unsigned int i;
>>   
>>   	seq_puts(m, "\t ");
>> -	for (i = 0; i < MAX_ORDER; ++i)
>> +	for (i = 0; i < TTM_DIM_ORDER; ++i)
>>   		seq_printf(m, " ---%2u---", i);
>>   	seq_puts(m, "\n");
>>   }
>> @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>>   {
>>   	unsigned int i;
>>   
>> -	for (i = 0; i < MAX_ORDER; ++i)
>> +	for (i = 0; i < TTM_DIM_ORDER; ++i)
>>   		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>>   	seq_puts(m, "\n");
>>   }
>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>   {
>>   	unsigned int i;
>>   
>> +	BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
>> +	BUILD_BUG_ON(TTM_DIM_ORDER < 1);
>> +
>>   	if (!page_pool_size)
>>   		page_pool_size = num_pages;
>>   
>>   	spin_lock_init(&shrinker_lock);
>>   	INIT_LIST_HEAD(&shrinker_list);
>>   
>> -	for (i = 0; i < MAX_ORDER; ++i) {
>> +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>   		ttm_pool_type_init(&global_write_combined[i], NULL,
>>   				   ttm_write_combined, i);
>>   		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
>>   {
>>   	unsigned int i;
>>   
>> -	for (i = 0; i < MAX_ORDER; ++i) {
>> +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>   		ttm_pool_type_fini(&global_write_combined[i]);
>>   		ttm_pool_type_fini(&global_uncached[i]);
>>   
>> -- 
>> 2.39.2
>>

