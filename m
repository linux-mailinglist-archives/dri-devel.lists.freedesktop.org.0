Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F96B0298
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE0C10E5E8;
	Wed,  8 Mar 2023 09:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3BD10E5D2;
 Wed,  8 Mar 2023 09:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjNW3rZizVDRhHRXTfxhgr1409l40mZn7ZiIFQEal2EH42+IuuhzcnI2+1R7oMiRThu6PzLonHbC3F1C139d1CrRty2gxiquPXPzVmv+uM/aHpVXib3gLcIoHU4hl1MAMtlNo+5wtWAeFDeARpi1Kz/2HYTIXYD5Bu632+jksx9vmLosKnqYmojqubkanm5vgRANdNEEOhRslW1IxZjTwjZjc5+WR+wNssIg3isQ5hW8E5peYvUF3dRvtpROWrkkrZKgJpekUg0svtcB/2+wuLY2DM7K98hmyWyjLbJfAamiUO3mTQKzCP9Jr/seI7+qCA39kTGz02GtH8Be/JJYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne+Gy1vL9neSJJw87STKpA5GouA7M8MzyGZjHVZnuD8=;
 b=TKd5iwJse9FA1UpVC4BalAj+E5871IYgGDVCqfvQy66hI/UO9Db0HH4KNRreQrhqLA10kTDcsLqmwZcexVJ0f7J4VpiPhFam3ukJf6axolGoMcSimgTXlTPLdzZraJ/aoSZwugfZAw3kLkpMhTTMNLtf4wltFvc3b/RjjyAg3P5bfAHuuP7TSXKembswt3ikVQM1lTHpR/+b9BZ/dgsmUyytB0AuWDPLvaXEUnHEmc6xlvnkb1nPouCNxZnghCuD4dT5ubEqdAgIGRZIyR+0Q+XC9RAq0VmyqZ8hIQgTtrtFFjqJExPIJicoHDwpRcKEq8/PgvYJvk93N7RAp4/3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne+Gy1vL9neSJJw87STKpA5GouA7M8MzyGZjHVZnuD8=;
 b=3nhg+h5YBTMUFiFG7QiqbIW9HdTjVtd7zAM2RkXFbgRnC/JLnrImuSM3X01A3qTU3uvvzZManIgk7ERh4Ab5FQa9bzteJAd7wOvt5ymNQIDUgyLnUsGOLZCdkwj8qahShmTSmegl92m4m+8z9tzukvLT+yczfY/Vf++1J5Z+YZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5027.namprd12.prod.outlook.com (2603:10b6:610:e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 09:15:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 09:15:15 +0000
Message-ID: <151b48d3-3ca4-292a-547b-628eb362c2ae@amd.com>
Date: Wed, 8 Mar 2023 10:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/7] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-7-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307144621.10748-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 684f194c-17ea-482c-893d-08db1fb5a11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVR5yT9uYR092yN4mZBleBe27fB9ifEEoKOTqAiRo1euASCYtAVXnqdGfLLgiRhXgYF4JlmLb/JA5RcR8fNCXPAJTXMHivjCaKjZbfBHZe3QEJJIqYz1iyB+KHVInc5da1QTGuwh6hIH7o1SVOD+x0FKTbJ6qHIJ4GoQuCl7hKXT7DE6pHE/WYdx8bnmihw1eHv5RD/tMCjjrdHu0AxhZ/h8fVVJ6RQQm6lxnnhxLfO+Ldo6nam1856CfCTwOjolZoIXaSVF6TGOGy4doQ5xdDy7hKAkJF7Opzlxb2ur4S32+deZFC/JaYWtZF1MKGTUL/055mLGhA19jmIWLsDxM4HjKbOTtlFeWf5o7O6Zodist3Y6/Iy+sXVox1PuZB8GHrYVIvXeRgAfLkrt0UUMngcBGZkca9445OXPt+/jWTM3m6dtabGuRQqLkAoejhFkyBmnp2hGrd7v4QXSlBHRDMXsAoSjZFr7m7WI3meCE2mmUSpzY4aU9GUO0YOLVo5sURk7i0evRhydYguVSRsyT+8XR3DrjfXbLSyC8LCpLDu89gLsOVxBk1mEsct1A6a0o0EPPvGYAQJ0R/S0vwEY8XAXQpY5zK1yxLo9X+D0yThtSknpNym0ptHoC8KVuEB0vKLHIf66g4uuXvzpnZU4906uyVzlqERREeN5/bSTMnGYvjtb0BCV1F+Y5m9ZZKjM2U+Biza+Dpz1vpzDdNunMCQAsGqBDRNAk1WKSLNMY0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199018)(66574015)(86362001)(31696002)(41300700001)(31686004)(8676002)(66556008)(66946007)(66476007)(6506007)(6512007)(83380400001)(316002)(4326008)(5660300002)(8936002)(2616005)(36756003)(478600001)(2906002)(6666004)(186003)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JQeWpNeWZUb1Jnb2dpbkpId0owM1E3RlMvRUI5WEJ5VkcxdWdZd2hpU0d6?=
 =?utf-8?B?TUFzQU9HWGhldVp1bldwRDJDUEpvVm1JR0x3OUZHT0RJdk91d2JLUnVpZVJx?=
 =?utf-8?B?b01oWFpMZ2xhU3BOdkdjNVBxUnhzT0Z0bmcvVEZXbmRIb1hLa1c4UllXbGRt?=
 =?utf-8?B?TjV6S3RCSjErZFhzaVhKU0FKVVhiZVZ0aWpnSDFtOWlXUlc5ekJFNy9sQVZH?=
 =?utf-8?B?TE5OWmx2UEVQMGpHV1o2UnhDTFBzZzBMSFI1UWZXRU93bk9RSnR6NkVPYVly?=
 =?utf-8?B?SHJRdUw1K2Q5RytIUDJveTNtcVNBU2ZWaU95WGFpOUhRM29zMzl0Yis1T0Vy?=
 =?utf-8?B?NUlZTHFlWEVQVTJIS3lFdUVOZWxaa2V6cXJRTURwd3BudEpVQTVBdkRUNnpD?=
 =?utf-8?B?UGVZU1RyOC9oV2FWNlBpTzFUNGptd1dKN2o5RXlGTHVMZ0cxRnlWTUhnOEFk?=
 =?utf-8?B?SkVzemxWTzllQ2VESk9NSmsrVXdQalR1dENSZ09JT2FtMC9SQ2kzU2hsUlZp?=
 =?utf-8?B?R2pJVUNMY0pSdVBFRzVtTURyS2RqRDJYenA1TlA4dk5BbjNESVd2cDgxL2hT?=
 =?utf-8?B?cXI4aFNVOTlKMW1FYi9lV29sVHQrMDF2RHllSkdkY1dGWTl4UUNEZFdjb2ww?=
 =?utf-8?B?WTE0M0ZTanpiOUJmckhJZVcyV0dsQXBTY2JHMStsR3laNUo0Zjg5Wm0wWWlQ?=
 =?utf-8?B?QlVSWm5UQndBTGM0VmxqLzRFQ21TTTYxS3drU0lUZWJTajVYeU9BSVpleGRU?=
 =?utf-8?B?bmdNZXRoaGZyMGdwN3BuTE9qeitRalVwdU5xMzdJV1Y2VEdJL1QvK2VTQWNZ?=
 =?utf-8?B?ZWJyOTJSR08wd285VXpNZ3VJQVVFQVJ1VTJCR2REUVRWenlPV3dqclBaL2FP?=
 =?utf-8?B?UG1BSzhNMnExanZ1ZVltMVY5YWY4TTZjd0hqN2QvZXpURW1MeUhjSUVvYzVI?=
 =?utf-8?B?bTZPY0phOVRGMzg1WWJUTnhId09RSGs0WTdFZGMrbFYwRlJFY1c0T2Uzak9q?=
 =?utf-8?B?TjhaZDVObDBTWkJ4TlZNSFgyWjlqZ3g2QzAreGQ1TUNmR040dWtDOXEvK3A3?=
 =?utf-8?B?Rzl3Nktsb2xmbERYdU9qL3R3eGlaM0IzQzNJcUI4MUoxaGhSZVpQajVzS0p2?=
 =?utf-8?B?cUVEYW1RZ0wvendIbGxqTnhOckZSOHg3V2I4Ni9PMGVibFI2cXl0Rk5PZmFB?=
 =?utf-8?B?dVh2Q3VwcU15dE8xZHVqbThLY21pbGkxWHRRQUpyVmZ4YXR5RW1SUG9kQWhK?=
 =?utf-8?B?MnFZOW5jTG1aR3JxU2pFaSs0YlpScHMycURESk90UExKT3pidUxkSC9KbzVS?=
 =?utf-8?B?QTlIQklTNWpucmNNRlZJclVMUHk2MnJicXFGUjRHaFppUG9WNDVBQjZGdnRs?=
 =?utf-8?B?WWhDK3A1RnFFT25wc1NlVGVIbXBkRW5NSlBDK0hWSWNrRXZSM0trdVB2ek5k?=
 =?utf-8?B?KzZoZS9ONEF4aTNjQ3ZyeVNURXBEb3hmYVVuTHJMUjlENXAvaUhsWndRRDRL?=
 =?utf-8?B?d1FTRUhuWDlnZEhWU250WjRrbjdGdmtXWlpFcXRVVnQ1M2hkWU11eE45RHl6?=
 =?utf-8?B?Z01jQ1NseWpqaEpPdXNlMjIxd2hOek9DVURDczU0Q0pOb0dBUlVMNWpXaW9n?=
 =?utf-8?B?V214WktqS0xwZWwxNk5pMzVDVEltL0hwMW5jNVJ1MTdFNHhqY0F3L0hNMEJU?=
 =?utf-8?B?VGkyaFdZdjU4aDJsUnA0K24zSWEwblU3ZDEzOGJKMytjaExFNEJVTGExc0VE?=
 =?utf-8?B?dDFLUjJEbXBOQUgxRXpObml2azVUMVZ1b1ZCRWcwNWV1ekgvNFhNcDFLeExR?=
 =?utf-8?B?Szc4MHJJeHZYSlNKVzExYlZUbXdlOS9xV2JQVTd3Y3J1aFM2QUhGQ0hwWC9m?=
 =?utf-8?B?cUZlY01SSjJ2MXV1dEVRYTFjMzNMU1lPWnNIOGZ6RHBQRWF2VWtVTGppQkQ4?=
 =?utf-8?B?K0NDSmlqRndRRU9hT0VTKytZK1ZxNkVPbTRDb1FnbGNKRlk1ZkFZSHVaeUhS?=
 =?utf-8?B?Ynd0MFFaaUNUazk5bGlLVjJlWlhlbU9oTGR5YVJXenhEdjdZQlA2dkZORGlL?=
 =?utf-8?B?RWNkV25KOTVpMXhocEtDbzZZUG5VVFVPSUZ1Qkh6cDFxNm5ORDlLYU9GbUlw?=
 =?utf-8?B?eXA3cFk1S0Vuc0M2eGFia2ZiM1MwUG03TTlMaUtWTlJoK1h0cHRvR1o3N1hQ?=
 =?utf-8?Q?azRZC1zW80tH3Jy0g2QvjbywBTXF4QPIHeLNyE6CKbzt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684f194c-17ea-482c-893d-08db1fb5a11c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 09:15:15.7944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QW9kQqc7BdU5vfwvPTVJ4C/uzwZFxWQyePVyU3uANveaiLZVosZbu+sTBBSrNx2g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5027
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.23 um 15:46 schrieb Thomas Hellström:
> When swapping out, we will split multi-order pages both in order to
> move them to the swap-cache and to be able to return memory to the
> swap cache as soon as possible on a page-by-page basis.
> Reduce the page max order to the system PMD size, as we can then be nicer
> to the system and avoid splitting gigantic pages.

Mhm, we actually have a todo to start supporting giant pages at some time.

Using the folio directly just saves tons of overhead when you don't need 
to allocate 2MiG page array any more for each 1GiB you allocate.

But that probably needs tons of work anyway, so feel free to add my rb 
for now.

Regards,
Christian.

>
> Looking forward to when we might be able to swap out PMD size folios
> without splitting, this will also be a benefit.
>
> v2:
> - Include all orders up to the PMD size (Christian König)
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 0b6e20613d19..939845d853af 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -47,6 +47,9 @@
>   
>   #include "ttm_module.h"
>   
> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
> +#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
> +
>   /**
>    * struct ttm_pool_dma - Helper object for coherent DMA mappings
>    *
> @@ -65,11 +68,11 @@ module_param(page_pool_size, ulong, 0644);
>   
>   static atomic_long_t allocated_pages;
>   
> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>   
> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>   
>   static spinlock_t shrinker_lock;
>   static struct list_head shrinker_list;
> @@ -431,7 +434,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	else
>   		gfp_flags |= GFP_HIGHUSER;
>   
> -	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
> +	for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
>   	     num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		struct ttm_pool_type *pt;
> @@ -550,7 +553,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   
>   	if (use_dma_alloc) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < MAX_ORDER; ++j)
> +			for (j = 0; j < TTM_DIM_ORDER; ++j)
>   				ttm_pool_type_init(&pool->caching[i].orders[j],
>   						   pool, i, j);
>   	}
> @@ -570,7 +573,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   
>   	if (pool->use_dma_alloc) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < MAX_ORDER; ++j)
> +			for (j = 0; j < TTM_DIM_ORDER; ++j)
>   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
>   	}
>   
> @@ -624,7 +627,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
>   	unsigned int i;
>   
>   	seq_puts(m, "\t ");
> -	for (i = 0; i < MAX_ORDER; ++i)
> +	for (i = 0; i < TTM_DIM_ORDER; ++i)
>   		seq_printf(m, " ---%2u---", i);
>   	seq_puts(m, "\n");
>   }
> @@ -635,7 +638,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>   {
>   	unsigned int i;
>   
> -	for (i = 0; i < MAX_ORDER; ++i)
> +	for (i = 0; i < TTM_DIM_ORDER; ++i)
>   		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>   	seq_puts(m, "\n");
>   }
> @@ -738,13 +741,15 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   {
>   	unsigned int i;
>   
> +	BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
> +
>   	if (!page_pool_size)
>   		page_pool_size = num_pages;
>   
>   	spin_lock_init(&shrinker_lock);
>   	INIT_LIST_HEAD(&shrinker_list);
>   
> -	for (i = 0; i < MAX_ORDER; ++i) {
> +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
>   		ttm_pool_type_init(&global_write_combined[i], NULL,
>   				   ttm_write_combined, i);
>   		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> @@ -777,7 +782,7 @@ void ttm_pool_mgr_fini(void)
>   {
>   	unsigned int i;
>   
> -	for (i = 0; i < MAX_ORDER; ++i) {
> +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
>   		ttm_pool_type_fini(&global_write_combined[i]);
>   		ttm_pool_type_fini(&global_uncached[i]);
>   

