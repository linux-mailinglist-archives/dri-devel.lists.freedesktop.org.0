Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A830C8A525B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 15:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABE01125BC;
	Mon, 15 Apr 2024 13:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xuuTpcK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC0A1125BC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 13:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzkgNx8kWKfB/9sYQekRen8bWVieTumm9Ycu1KNyPfsNJBuEX6SRW70O1/l9J5RTMFeETed9IcL6Q8a3e1PBq5F2NiYxy2raw9fioqqnS/iFbW8zbX0/S29JagbzU3KR0xyNuG0wF4/O4gCmTBHEH1DD5zyzo7EnzWPKTGskAO6fg1th44vXN2gN5n17nc9q5MkM6WULOgbb+My2OZaRO1plkkN/rfpPiK1TDwUP7YCDdvfRedtrLU+HG896kc8Y7eHdbNQvCHtNFMHvINpPosU+PbzGvYmMK7v1jsp5WazNW+6FZ+exlYoCYSjWWaia0xKBfr6eTJrd7XzY9aT4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB89RgtAz7xqtJDjzbQ/ex8jw6YJibRhgxelNbkBfEM=;
 b=cesSkKFnLVWSgVfV6xgKH9T8djOoicimvqSyiSqhaKif2DXR2B0/0hlEBkaqChbR+WrACVTyi6+CVOS3ovPxuabZ/yN/48m2mMuUos5bsM+eDzzZD6noNwcStA5MPL+ATPbfWzhKVQ5UQfeG6Dxa9s1RhHxVwgFt2AlA3C4hy/8ibRyK8s2p52bb/zsU6e55wMUGbIt8Yo37jPTj01+y43HMd5V+GEiFXcO+PYjMP6YchVoE5djvNVYVohwsUdxFtndFS3Cwa3lj3l3gqcvDJ6kdrqRlEH+gDezMRW+yR28XHml/U0SRFSBKW8R0xDApcPneanRer8eIWgi0h6Tv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB89RgtAz7xqtJDjzbQ/ex8jw6YJibRhgxelNbkBfEM=;
 b=xuuTpcK86lkyerhpOgEfo476dG+yVHtNtmRQK1kdN8Dw7wF9PKMN47+kJfrZNQZL9rHw3d+PNLcC0ZnMhlN7vRGQz3aEvQQFfQM/qKsxBqAC2y2Gc9nOxyUuR6UH0o0xrvnPPlcUt9aot4QIE6/+SK9+U1E5ln6mgwRvHiZFydI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 13:53:52 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::d895:b707:1189:dfd7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::d895:b707:1189:dfd7%3]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 13:53:52 +0000
Message-ID: <4b04b1d7-2215-42ae-a65a-eb8103bb847e@amd.com>
Date: Mon, 15 Apr 2024 09:53:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: stop pooling cached NUMA pages v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alexander.Deucher@amd.com, Rajneesh.Bhardwaj@amd.com,
 Steven.Roberts@amd.com, dri-devel@lists.freedesktop.org
References: <20240415134821.1919-1-christian.koenig@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20240415134821.1919-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fe7e54-a818-4c9a-0bca-08dc5d537ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ck2AzZjH4+ztdL/+2yiSWGsKxfYe8sCZBz9kuLj3qGhFx5QrGYo8qWP80wkRnDpJoWhgAccfveRMwnH/0IXmVxuitWhO+BzB7Gfuotqkr3gB3F8mhsKfXKQetaEn3MdYiyPcUH+Yzs0KQz07G1sCMxXZpk2kQE+IO0qRNEKfm4o4lY8k0KKS4XrVOoNwlM/2cjJRR+LVaLZXRRGq2l3QGzAlJgbumKdXhwsDm+myLqnYRfIexqskbZFRhyEXJQGzg4uLiUcbPyO1RC8j9RWVfPm4ZhZhzUG8gmBGQdGV1gzctcpkre+xHJjSt6MxbROYnPynI37N+CIS7XACTITdagGcry8IGUGPYbc/bZQBUUv6tDYpdG5iSq9RG++ch6xhG8O0XZj/qB3h7DqbLAZghlCXFCV0JSSxy6NMWXEb6sfL2+9xkkYiCNEejQTASTK/zOjuZdQ1Fl86UEvuCQq+jI+6PB0SZDNQeLjJAgc2kYiT/Om2JZcJIUji+wMbtc8eEa6CdSK/g8/vvKc40IMLb0U+GeKon6BAHT3AWyqs+UWXshcUAcurS1VXE3YMEXEp7/GXao1CFHsXii9twSop89BGd2BIEjRNtucq/VEAiUPDvONZbE4yxeCIqV2EEHu8IzPMHOJIlS5uFgGVXudrfRE1dqai9wWTDm+ljs0V0vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05tYzhCRmZTYTVmRlduVGRURzRLQStRbzA0ZmoxVThCTlovVG5YeWlTc3kz?=
 =?utf-8?B?bGFUMW45djJPZGZnSG5KeUhVd2MyTHhxdDdEWHlpTzI3R2xlSmgxZXBRa25x?=
 =?utf-8?B?bDkyMlIwMzhyR3BIcFRTakpCQ2xZRGV5cFdWZUFIMjhvUDRRQVEwY1lXNDBv?=
 =?utf-8?B?bXowK0F6dnAwaUtIdHFMWmthbzRsTmwxTHh4Z1FqNjNOQ3VxbjRBTUNFRDVt?=
 =?utf-8?B?WmNFVnJwSjk5OStWWkErWUlGTUdTQ21uZ1h5ZFkxa2hQazZ0bmdhY1NQMGcx?=
 =?utf-8?B?am9QaThoNjk2YXd0ZzE0THU5N3IrUytKU2hKTnRyZHdFUHJHaXE1UHJjMUo3?=
 =?utf-8?B?STJKMUNIelVDZVhJZVJNQWN5ZEVoOERTR3NpMXZuT1Z0c2lLK3lvWXljVnUr?=
 =?utf-8?B?bWh3czF6ellvc0NRaXhmcllEVjZSbVJXMUtJdER1RnhEZFk1UkYyRnN1dFVP?=
 =?utf-8?B?eGcycG9JSkdlR2NnNi9ONCtLU2tQK1RMaEFoR0dSR1RGbGpPZEtaek9lVFZL?=
 =?utf-8?B?eDhTRjJYT1RjOTJtZGVxOG5DdFFBeHVhaldFWk1NMXVKSWkyWlVKQWg1US9S?=
 =?utf-8?B?SzZQMmJBUEI0WUtISDRibUF6S3ZKOXVueENndE1KN2hWSkpqK1lvQmwrbU9C?=
 =?utf-8?B?OVdxaEF6Q2cvMzZOdkJONktCOFJOSUdOR2gvb2EzanBTSUpvWG50L0NvN20w?=
 =?utf-8?B?dWNpazFsQWNVSVNHL1ROQkZBNWNhbm5aMnY3SkZoY3dJWlYxWElKcTJjcld1?=
 =?utf-8?B?MWRORmljWmFvUXRPNFh2cW1IcXJkZVpOdXJDUVphQU5ZVXl2aUwxZDZSRHJJ?=
 =?utf-8?B?a1YrMXFGcHY3MWxmT0t1OThsRVpyaDNXa0dNQ3E3SmlONVI4SlBmNGdmbnJ0?=
 =?utf-8?B?OUtGWWhMTitlQ2ZPK3RsWjhmTjgvTTZzdExVeWluQysyTXhyR1IzRTlSTmI2?=
 =?utf-8?B?b1hPQjFlMXZ0OUZEU0xsdGlMRUhDeFRLWGhSQzdjS0JWRmV0dTFlblhiVzBm?=
 =?utf-8?B?QzJncHQ0cnNLdC8wZEVLSVR4QVdmY0ZmbnpTeCtNc3gyZDRuNm9CSEtmbXVw?=
 =?utf-8?B?UHFvNVExb3o0eHQxdEtTcThPNUMyMVVzUTAvT3NMREQyVFVLVkYwV21STjRq?=
 =?utf-8?B?K3VrbG84NnN2MG5qUHh6YVYvS0p0SDZkTENPQXJRaUdnejJsQnFpbGhqelRq?=
 =?utf-8?B?MEdsQ05uQWcvWjdDeWU4alNvbVV6NCtudWVBOTJ6bHJ6SHZyUllocVFPckFm?=
 =?utf-8?B?QTBiTzF5STJFU0s4UXhqRXpjaWhKbUxUTTJUVExycFRPTXRtZ3UxTllGYzNs?=
 =?utf-8?B?VTF3UVgxcGRSWVAxMFMvbzRMSDVaS1EzQzVFajhwaDljNEk2RkF5M29ERmRG?=
 =?utf-8?B?eUVkTFhBbTc0MEpTbzBJSmlaMldyUnp5OUpPZ1h6UCtZaEY0WklUVVZtbFNL?=
 =?utf-8?B?Z1plaFN4UEVOaXJxa2x6OE4veVlybGwza05RZWlER1RRK0hkeVJNOTUxT0Zx?=
 =?utf-8?B?YWpHRDBsS2kraXJNMUZBY1Z6QndrclBpSVZ5aGV5WUc0byt5a2dBM3VEZ0or?=
 =?utf-8?B?VUE1Ynd5TXNDVkgzNmVCM2N5SlNsczNnV1RQaFhKWm9JWVplYWRSQkYwbzVo?=
 =?utf-8?B?V2xXVVIxQnNwWFByRTZVcU96ZE5pMzM1MCt0V2lZYU1lMXFMdVJhblJXdDdL?=
 =?utf-8?B?bEFaaTdjTzEvOE5OL25OS0RMaWRQM0pKTHpWb3FlL09NVldUZC93K1l4R1RJ?=
 =?utf-8?B?YTFqSmhoU2ZSRkNsNFU4UU9EZWMzRUN1dTJENHNrWHhoc2NWaXBtcFpBdTVK?=
 =?utf-8?B?TlRzaDg0L3F2YUFMQjduS1FoTUU1dW15ay95eHJDMW5RR1VHM0RQYUc0b2Zv?=
 =?utf-8?B?V3JXZkw5MDFxU0Q0WkRTTFIxSlFkNkM4TDNZUldxdW5HN1A5QlpZZTFlMlRC?=
 =?utf-8?B?N2pCQU45U3A4YzNQQXUydmJPcUhTVHlEMExkRGdYeUJiZ0daMlZiQjdvR1Vk?=
 =?utf-8?B?WVNvTWVUMHJZY3RaRVY3ekpCNGRaZzlpRVdraHBvL2lOSTlxOHo4ekkySXE4?=
 =?utf-8?B?SnEveUc3aGErZHdQandSdkpGeU9mbS84L2h5bjF3QUVjV21IYVpZZlI4dzZI?=
 =?utf-8?Q?V7i4oZqu22L1w+xUcJyCrG2op?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fe7e54-a818-4c9a-0bca-08dc5d537ba7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 13:53:51.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ss/bYss1A57xKTgmuppzhbe3YWGD5QiLEcXSYoPSnYgMdnDlLPXY2trL/9wLUTZleTQFCiL3MbEVYT0qpoVyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
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

On 2024-04-15 9:48, Christian König wrote:
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>
> We only pool write combined and uncached allocations because they
> require extra overhead on allocation and release.
>
> If we also pool cached NUMA it not only means some extra unnecessary
> overhead, but also that under memory pressure it can happen that
> pages from the wrong NUMA node enters the pool and are re-used
> over and over again.
>
> This can lead to performance reduction after running into memory
> pressure.
>
> v2: restructure and cleanup the code a bit from the internal hack to
>      test this.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 4482d3c94d7f ("drm/ttm: add NUMA node id to the pool")
> CC: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 38 +++++++++++++++++++++++++---------
>   1 file changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 112438d965ff..6e1fd6985ffc 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -288,17 +288,23 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>   						  enum ttm_caching caching,
>   						  unsigned int order)
>   {
> -	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
> +	if (pool->use_dma_alloc)
>   		return &pool->caching[caching].orders[order];
>   
>   #ifdef CONFIG_X86
>   	switch (caching) {
>   	case ttm_write_combined:
> +		if (pool->nid != NUMA_NO_NODE)
> +			return &pool->caching[caching].orders[order];

Doesn't this break USWC allocations on NUMA systems, where we set a NUMA 
node for the default pool (at least we were planning to at some point)?

Regards,
   Felix


> +
>   		if (pool->use_dma32)
>   			return &global_dma32_write_combined[order];
>   
>   		return &global_write_combined[order];
>   	case ttm_uncached:
> +		if (pool->nid != NUMA_NO_NODE)
> +			return &pool->caching[caching].orders[order];
> +
>   		if (pool->use_dma32)
>   			return &global_dma32_uncached[order];
>   
> @@ -566,11 +572,17 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   	pool->use_dma_alloc = use_dma_alloc;
>   	pool->use_dma32 = use_dma32;
>   
> -	if (use_dma_alloc || nid != NUMA_NO_NODE) {
> -		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < NR_PAGE_ORDERS; ++j)
> -				ttm_pool_type_init(&pool->caching[i].orders[j],
> -						   pool, i, j);
> +	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> +		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
> +			struct ttm_pool_type *pt;
> +
> +			/* Initialize only pool types which are actually used */
> +			pt = ttm_pool_select_type(pool, i, j);
> +			if (pt != &pool->caching[i].orders[j])
> +				continue;
> +
> +			ttm_pool_type_init(pt, pool, i, j);
> +		}
>   	}
>   }
>   EXPORT_SYMBOL(ttm_pool_init);
> @@ -599,10 +611,16 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   {
>   	unsigned int i, j;
>   
> -	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
> -		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < NR_PAGE_ORDERS; ++j)
> -				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> +	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> +		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
> +			struct ttm_pool_type *pt;
> +
> +			pt = ttm_pool_select_type(pool, i, j);
> +			if (pt != &pool->caching[i].orders[j])
> +				continue;
> +
> +			ttm_pool_type_fini(pt);
> +		}
>   	}
>   
>   	/* We removed the pool types from the LRU, but we need to also make sure
