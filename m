Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7450E6B01F4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11610E30A;
	Wed,  8 Mar 2023 08:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705CC10E30A;
 Wed,  8 Mar 2023 08:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oqjb2iJOzPbGdz63mwjP4DXAH7Pl1+DzRk9qDnNUwkB4vG1ryNdmdgYVHXUqWxCP7iTOkrF3YA/GGDge6gR+L7MUsrTCTVZGrUzTLbQdOJ3bHU1/lbfIRchbRacXQhJQB+ac05avqseFimsON8FCnanTdrhi88my8TRxgjYLeM+cDpJdG8yS+SddGK3EaQyQw+7fV5eotzxcu+ItZ7GhmPs86+74H3/ZVCVCjedaSDxjtbohBGROGa6FHxUuyCFNCtkg9JDE6Rkw9j9pKTBAi9yVcBXhUUhos1FtedIEuCXwS69LaoMB0OE3FdDj7AeR94bp5EtRT4vigF9BpxhKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kka5P/RmuaIx/yk6HqTxJyleuq8R0fgFX2D+ShGH/iQ=;
 b=I1M1vqZ3zhzONabEwHZFY4AEYBTeBUflQJ8Q2Ww8ERRVgQ/d3XZZau5p2PVTzScpU81EbiPhfcGEDnt8QDCg1Rp96F5v06o4ikhhsMrdQoqA0oDh00cqKodKfO/s5LNbhgvGv3rgmjbUJwGIYB51vWnQEh7SbO5d/4b9kN5mNHJHECcZXtQmvcdziKH8V/kUOLLPIXRmxlZVNyULAuCD84tbCHKLxDyrQdGLWn3/oTJ7Bs59beENIRF/sTOAXPlEZ6FM96USPGomYXHfFH10arVlAp2fJtg+NUli8KVPn/quFJhXDEx7MjOpLe2uH9hcXO0p/vBJ5yDjrRoD5Y+ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kka5P/RmuaIx/yk6HqTxJyleuq8R0fgFX2D+ShGH/iQ=;
 b=nhUktELQ/pWhk5T4ndO+EMIjADC38FO2GnDTBHnqCa5tjlEHQ/AdRq5dlXEwt6L5DlkaHaI2WoWVTAfbe4RXJPEWLCboG5ZxRDWRE7OQjcKcTMigObnpKtqjZXXldLtkXSxDYcvCquygBpBv+cYXGZH6dzdHK0Vsy53CaSNkSeI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.31; Wed, 8 Mar
 2023 08:48:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 08:48:49 +0000
Message-ID: <49aa2475-cce5-d6ec-8ad8-4744542c56df@amd.com>
Date: Wed, 8 Mar 2023 09:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/7] drm/ttm/pool: Fix ttm_pool_alloc error path
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-3-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307144621.10748-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: b873a264-5397-443b-62e0-08db1fb1ef58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVF4wLTTBOb0YGYaX/RBX6JXW7FBeAIt8RlpQWZl7vsBiLe1+uUgyu78cckzE9jViOhK6ITg1Vyl7dUGcyiqbBE9wKStObFHRi2skBGMvkZnV8yCt4KXpnbAvZEidu+g5LLnXWLchaqe41t/lUTTERRZFF3bdh1XojT+aHYGKd05FE6k3CKcl71FAk52uQt4BqRC1d01NhJmd7hRJ1pY/vSY1qAjjmaR0xl1PqNfUh7i+xRTWE5Ub9l+peBi70dzTBPq6gMbjqX/OaqfEGjju6kyHmjmFckKQde5CkCoPvqWrBNMXeiFIjHXH7YnMgL6k+0bngGJavVXOZRnSgWwgDz0m6DwChMOIbytSqsc+GOw/AXaWXi2xggbYQb0wLDOZIeAnI6xfWzIAMZuEJjoC4HCxkBYbKfhVvnyKIrD/fYedpYolkYO1AwIRxt+0gT+SqV8rLMSsXytPLQ150+6XTgsC/tiGDYnlNf6GpAU29Z1QPFfeXT47na1HaAXEyPmVsHD6nYorVHaTIkm9Z8DdgHaWG9dpd2uOOZJOXm185+Usf5XlNtWMUKsp8f08BbEJfYSdSOUv0hDRGfZ8yNoz9eva3lr6v7K6Db0wGmUiwC2lYk0JG+haW2jBhNN/XAHH45cIB9nD0SjehQuMEEujZMer8Azv4bXEPYxRkn1fZ5VLpfytL0ToH7wpVi8J716OnMlAyqLD0msLM+vGXORLjb/GqC6eKxL5JwvBB4x140=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(4326008)(31686004)(41300700001)(66574015)(8676002)(66556008)(66946007)(66476007)(316002)(38100700002)(54906003)(186003)(36756003)(2616005)(8936002)(2906002)(6486002)(478600001)(5660300002)(6666004)(86362001)(31696002)(83380400001)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBsWkRKQzdRSlB5YmVRenpJQUJnVXR1dmxLMnpiL2dkeUNmamxuY3ljRk1N?=
 =?utf-8?B?TnVyNW5YbFJUUWtMeGJweXNjK3kvMTlLbWpYY2NleWFyVUVCMGtQdnFYa2g2?=
 =?utf-8?B?L2pKNkNqTEtOblBjOGxoMlo0RS9iZUlvdjUrNUNLOGJJcmxUMmczZ1Jyc2hi?=
 =?utf-8?B?c2xQVkh4ZlZQeDFVbFdVdGpUeWpWOURzWnVQWko0dDQwZWpjQzRBSkN1MHR2?=
 =?utf-8?B?TWRLNFJRbHZQdFBrR2NnVWI5RzFwNUlzd3NBZk1EUlNTMXpLYkJKMEZZWUxh?=
 =?utf-8?B?cFVNbHdWdS9wL1RiZ3VZR08yKy9DeWhjOWtFRU9tUzFmVGFPaWJ6bUUzM2tK?=
 =?utf-8?B?Unlhd0pHalZXM3pmQ0krZUZyMVloZGt0eVJ3Tzd1VkJneU9FektMYlZubkV4?=
 =?utf-8?B?dXlONU5YRjFFVm85VnlIbVliUUhHME1TcmJwYUh5R01BcithSmNQUnhUVlc5?=
 =?utf-8?B?NFNmV3JBUEh2SDIxaGhGMTlOUTgxR2hyUUJPRk4zUGRsaFlkWDdXS2cxeW1o?=
 =?utf-8?B?UnlyQXVGRTFCd1lkT1JwNHlkeTZNbmlFR2tXMVkxWUZTR1BWT2FZdjRBWHBt?=
 =?utf-8?B?enA5bUxhZHZmWHcrUExiL3R5aEl5OVhiSWVmRjlPZ1E5Z0ZrekxQQjhhcVBV?=
 =?utf-8?B?Vkx0UVNtR20wK3BtcU90ZndPUGtjd2dsYiszbHEyNnpzZW9iQXdrTnJBeXdr?=
 =?utf-8?B?UWZ1L3BQL0ZhWDdxcWFVL25RVFd6Ym1PaHd1b0JNTEpUWWV2bC9VazhMekNi?=
 =?utf-8?B?S0k0NXVIY2ZsSEVoQlRMKzJ3eHkrdU1TajQvN0QyOFdKc2V3Si9TU0p0bjBw?=
 =?utf-8?B?Y0NhaHVDSi9hTWdiQnYvTko5TVZ1YWdrQVVxSitxUnhTRnFlNjJabzAxTVAy?=
 =?utf-8?B?Mlp5VEtUTUZ5Y1ZtSXJPbFZNRWh4bjdJSFh3SUVKZWxwVjJLWjlHZ0U0Vi9k?=
 =?utf-8?B?cTlLTjBoaDdoV1BTY20yQkpPcmpkZEh0eUdQdFM2eTFselBmM0VKL2dTclVm?=
 =?utf-8?B?cFpRYmRFeklPVDA3OTFjeGZNNVd6S0VDNFh0K2hoQ3JzTXhmcUVCc2hGVjFR?=
 =?utf-8?B?eS9RVHlxdDZ1S0tMVHJBUmpPYkdOSTBzc2ljSm1oZEZTeXFlaFdBNUNZWDBP?=
 =?utf-8?B?RHJNOXFEOTR0SmJwU3VLOVZtYlNKOE43RlFtSW0yanpwYlVuWHF0MnQzKzlS?=
 =?utf-8?B?V0Z5RGxyMkFiTjJNVHk4NmF5QlFSVHlKckxDdkpqZHJGZVJiVnVnRjFicXNB?=
 =?utf-8?B?RXVscVRFQlN0eGlnRXZzMjgyeU9HejNMMjRXeHAwZTNBVEN4blhla0grcmFi?=
 =?utf-8?B?dXF1cGViVnJ2WE1TTFhNOW9wY0NhbVRWOU9QcHhPakVjNW5YSGlab2pTYTVK?=
 =?utf-8?B?aW9RNUM1N1FxNDl2NGV0YlRMQzR4L2ZYSE9IazZmb3F0MTNrM1pzaTVBWXhu?=
 =?utf-8?B?Q3ZMdkFXS21JU1Fydys3b2tOZERKNjZ1Y09jZHlucVAvUXp5SGdZV25SWkYv?=
 =?utf-8?B?Z2h0cEEvTGlxQkJseHovcGxuTkhrVEFBUm51VmlXZkJEOXJYaEdNSFRVTDNE?=
 =?utf-8?B?Q1JycFlrajhBdXF5bE5KVGdCQjlnaUFZbm91ZEN1c3pqY3dnTUVmRTRxcGFt?=
 =?utf-8?B?M2pOM3JmQTVRR0oxMmNDV00xZUFldTJFQTRZNVNnaFAwQXYwQ0VzNE9TcjlG?=
 =?utf-8?B?RXl0NXpPQ0l2UDBhaFFrNVB6ZEFkMUV2UXhCd21pMjBmdERRMHIzTTl1YkJC?=
 =?utf-8?B?NGVEZUQ3bC95eEU5QXlPdnpmK1l5VWFyQm5WRG5ldExCaDczY3BnK2crcXBu?=
 =?utf-8?B?UC91dWVmWlp0VEs0ZGd4Nmpaa2FvQTFLcnlCU2hUa0xlL1dnOWF2ci95LzJB?=
 =?utf-8?B?dXd4U0J4T2oxQWJlbkREMzBXVVc3N2JFTi91TWdxY29wR1A2RXRhMjRuTndr?=
 =?utf-8?B?cDRQL1AxZVhvUG8rUlRZOVZYYlZwSTQ3Z2tGRHFKNGxOYW0zVmM4S0YrMHhm?=
 =?utf-8?B?ZnhrMTloOXBzZUhGK3FyZVdXTjFYOTREMU5ReS83S0o2WUFtNklXUDVZU0J4?=
 =?utf-8?B?TTZIMUMvUEh1TVFCSXZqQUt1L0JjM0F4Ym1ESjNBdENTbmFYdFdhMGEzNWpy?=
 =?utf-8?B?M1lOVFZOaGQvWmJGRWwreVE2WlBLN2JoM1N0RWZWOWU5SHlEZ080UjNpSUtw?=
 =?utf-8?Q?JS/TdaL17hRbCi/olbw/artBbS8548QcejzR1p5L66vI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b873a264-5397-443b-62e0-08db1fb1ef58
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 08:48:48.9995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJlTxA4iEqZMM1kM7YkY9HnWHWegtUD+ZnI8iw3wDw7uuBpVeIc6+9ygO2RquaL/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.23 um 15:46 schrieb Thomas Hellström:
> When hitting an error, the error path forgot to unmap dma mappings and
> could call set_pages_wb() on already uncached pages.
>
> Fix this by introducing a common __ttm_pool_free() function that
> does the right thing.
>
> v2:
> - Simplify __ttm_pool_free() (Christian König)
>
> Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 68 +++++++++++++++++++---------------
>   1 file changed, 38 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index aa116a7bbae3..0b6e20613d19 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -367,6 +367,30 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>   	return 0;
>   }
>   
> +static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt,

Maybe name that ttm_pool_free_range() and add a comment why we need it. 
Something like "/* Cleanup all pages in the tt between start_page till 
end_page */".

Apart from that looks good to me.

Regards,
Christian.

> +			    enum ttm_caching caching,
> +			    pgoff_t start_page, pgoff_t end_page)
> +{
> +	struct page **pages = tt->pages;
> +	unsigned int order;
> +	pgoff_t i, nr;
> +
> +	for (i = start_page; i < end_page; i += nr, pages += nr) {
> +		struct ttm_pool_type *pt = NULL;
> +
> +		order = ttm_pool_page_order(pool, *pages);
> +		nr = (1UL << order);
> +		if (tt->dma_address)
> +			ttm_pool_unmap(pool, tt->dma_address[i], nr);
> +
> +		pt = ttm_pool_select_type(pool, caching, order);
> +		if (pt)
> +			ttm_pool_type_give(pt, *pages);
> +		else
> +			ttm_pool_free_page(pool, caching, order, *pages);
> +	}
> +}
> +
>   /**
>    * ttm_pool_alloc - Fill a ttm_tt object
>    *
> @@ -382,12 +406,14 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>   int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   		   struct ttm_operation_ctx *ctx)
>   {
> -	unsigned long num_pages = tt->num_pages;
> +	pgoff_t num_pages = tt->num_pages;
>   	dma_addr_t *dma_addr = tt->dma_address;
>   	struct page **caching = tt->pages;
>   	struct page **pages = tt->pages;
> +	enum ttm_caching page_caching;
>   	gfp_t gfp_flags = GFP_USER;
> -	unsigned int i, order;
> +	pgoff_t caching_divide;
> +	unsigned int order;
>   	struct page *p;
>   	int r;
>   
> @@ -410,6 +436,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		struct ttm_pool_type *pt;
>   
> +		page_caching = tt->caching;
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
>   		p = pt ? ttm_pool_type_take(pt) : NULL;
>   		if (p) {
> @@ -418,6 +445,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   			if (r)
>   				goto error_free_page;
>   
> +			caching = pages;
>   			do {
>   				r = ttm_pool_page_allocated(pool, order, p,
>   							    &dma_addr,
> @@ -426,14 +454,15 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   				if (r)
>   					goto error_free_page;
>   
> +				caching = pages;
>   				if (num_pages < (1 << order))
>   					break;
>   
>   				p = ttm_pool_type_take(pt);
>   			} while (p);
> -			caching = pages;
>   		}
>   
> +		page_caching = ttm_cached;
>   		while (num_pages >= (1 << order) &&
>   		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
>   
> @@ -442,6 +471,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   							   tt->caching);
>   				if (r)
>   					goto error_free_page;
> +				caching = pages;
>   			}
>   			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
>   						    &num_pages, &pages);
> @@ -468,15 +498,13 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	return 0;
>   
>   error_free_page:
> -	ttm_pool_free_page(pool, tt->caching, order, p);
> +	ttm_pool_free_page(pool, page_caching, order, p);
>   
>   error_free_all:
>   	num_pages = tt->num_pages - num_pages;
> -	for (i = 0; i < num_pages; ) {
> -		order = ttm_pool_page_order(pool, tt->pages[i]);
> -		ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
> -		i += 1 << order;
> -	}
> +	caching_divide = caching - tt->pages;
> +	__ttm_pool_free(pool, tt, tt->caching, 0, caching_divide);
> +	__ttm_pool_free(pool, tt, ttm_cached, caching_divide, num_pages);
>   
>   	return r;
>   }
> @@ -492,27 +520,7 @@ EXPORT_SYMBOL(ttm_pool_alloc);
>    */
>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>   {
> -	unsigned int i;
> -
> -	for (i = 0; i < tt->num_pages; ) {
> -		struct page *p = tt->pages[i];
> -		unsigned int order, num_pages;
> -		struct ttm_pool_type *pt;
> -
> -		order = ttm_pool_page_order(pool, p);
> -		num_pages = 1ULL << order;
> -		if (tt->dma_address)
> -			ttm_pool_unmap(pool, tt->dma_address[i], num_pages);
> -
> -		pt = ttm_pool_select_type(pool, tt->caching, order);
> -		if (pt)
> -			ttm_pool_type_give(pt, tt->pages[i]);
> -		else
> -			ttm_pool_free_page(pool, tt->caching, order,
> -					   tt->pages[i]);
> -
> -		i += num_pages;
> -	}
> +	__ttm_pool_free(pool, tt, tt->caching, 0, tt->num_pages);
>   
>   	while (atomic_long_read(&allocated_pages) > page_pool_size)
>   		ttm_pool_shrink();

