Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AF698208
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CDF10E28B;
	Wed, 15 Feb 2023 17:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E261D89261;
 Wed, 15 Feb 2023 17:31:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8Q3cap2p5Iw/8HiYGhKEbd31tDlllkWkxJhrkKRpOybapp0MjPDFP2Lm31tWDCzv4/L58aerBhrI/We7PWukEDqCAGyKvl/cyPzXBnBL+3W/OGm+AjxFObwAqAP9hheknTpILBvUW3tmeJZcEECKRKJP4cURZ//NP+Ax2INFOHWC6+2k4FU0lBlUvX7MpcgZlBzJFvGCFVJqpF0ua7AWamWmWaoCXZnfrWkCPCgTwsLUlsxp7a5wuG8r1VIzoC2GslgBjMJiNmviSp0O+03XXD7YF2q5TSLe4M2HGJUaqBXxghFG7FZ9Ffx5G6o1VWt9GoMv3RA5u5CAJnm9qApzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyIGoY8f8+fWaMwfMikG4eAkNgwVFNzxfeUtiaeyXpE=;
 b=JFc7kY3HcUqGGI9htmDJDGbgmi4BgIfLFbmEnr4qJGvSNlma1R6JjqJeDhohSkiX49Zs8Izlr69CiRsANxc9chu4p7nPrzyuhT3veeq39Nv6wQsjPXK3jE41W5XVt1phuSIs9b6TP/C9BiffE8T4hRZ1eDnhLeSm5IADSxCuHf8a6SQWlb6QWoiIiU/SN0RvGU6aEDKIEM0EG8ZWRmFqp6jM5bmeOUVj0fFP59CDCR4xjZQ78pqD/O6qr14HioPGfzY+6r/mUd7rGUd41HIl+pdljwjVHgBSpa18o4X8yeqQLAD7zJzz6jqt2S8SVI9BeqQAhYnjdBmDXNr/TUCn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyIGoY8f8+fWaMwfMikG4eAkNgwVFNzxfeUtiaeyXpE=;
 b=Nj3QtlN3Z+QElZ6mqP+05vdl2dpY1F5dS6TRr02mEcfqIXEIBP+3x46CXrv1bQzg1MARhYd7zxIpnANzmpoTizMsZr0ey72UNquxR4YloE8hRy/ra6vAdOoeQzJLGLbVeRlNupSt4DdMJVzYGr+OwRjIl47u3QJAra90zL2rgA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 17:31:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 17:31:28 +0000
Message-ID: <c60e39bd-4a3c-5870-1fbf-7a6f0594a505@amd.com>
Date: Wed, 15 Feb 2023 18:31:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 02/16] drm/ttm/pool: Fix ttm_pool_alloc error path
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-3-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230215161405.187368-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: bd790bf5-5479-4d62-7d7c-08db0f7a7839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +R7Yp66N+YYBgZvE92fs8W5zA3Oe5QCwy8jdhw9pIgn5jn9Wzp9BEBp4QXU+NI41VYKpOnsN+UqUO5X5Q6zBGLSEE1WFreX+p5dGrA+dmrJFzoD0iq3MauGNp7O+obOmSZq6QM9bC8OIOv3/pVAYwckQriOkKLSnPJ5sqUP7OB1eSqHL4rGmJ3/3um7T8qNb1CUDOb+IQkQDD6pYRf+69P3gaNKlhEN+WEKbQxmXvyGICKF/RQvhpSpAPCuHp8+Q1SnI6+ZC3bB9if79seSO5YtWn+JBQCAH5wI1vxUrMogzK2rsZK7JMHOqpg0pzi7VX6LQwpBpjxov9qPtrcN0Fpj57n8Ezpf89PXaesoiXGdttqKJlt04nrN9t8lsF3Ioc+Zor1Cs6WnSpLlUx4BgfssLYo244iOoCpTqDP8rljU1EHQR+939RL9mJ93xNsahPrnqe64eumJwv9dr/sNf1eRxRWJAM9Rju8sWD5I++uTAshjfpqFQu+cyA0gNkrtT8RxInRsQZKo0Vp/QKm0vh9HqG1igAX5/mDXGA5yLH4M7lmvrQnMRVrGdPOcy8H6Uzn1z4QvathKCaonpbNnRfL8kznIjk4CUs4ONsEEZxd65Ee9Sw2OaRyzYloxf1FOY29xvIoGxRM6J+KW+6sTyaJvE1VQ7dL+poXejJln9ZwWIEqTnPoLrdpw+W+xY6UG6KIVTBWwME9Uem+wKn6wLR1JAzmiQWhA/9i67rw7CCnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199018)(54906003)(6486002)(83380400001)(478600001)(2616005)(66574015)(6506007)(36756003)(6666004)(186003)(6512007)(41300700001)(38100700002)(5660300002)(86362001)(8936002)(31696002)(31686004)(7416002)(316002)(2906002)(66556008)(66476007)(66946007)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzJ1cEdsenZsd0FsZU16N2F2cDJmdFhMNVBMN21qU3VjMlptOFQ2UWcrcFhl?=
 =?utf-8?B?eUxUZDhvT3VUUmIwWWxQYTBqcGpYamJxeUZYd2NHcUMrdHM4aEdFajRnbCtx?=
 =?utf-8?B?STJPTkh6UC9IN0NXSUxKdlhoeE9rVFdnYVFRUVlFRUVUQUtBRnVGbzRDR0xi?=
 =?utf-8?B?bEl5SnJad28xN1JaSVN3OHBpblhYUjBNQno2eE9paWIxdkgyaXRoSmRqa0VT?=
 =?utf-8?B?T3BpemJ4amg5bGpXN1ZPSytTUFNTYlBzaDZ2RFRFOEJRUDdLclVJOGdwQzFQ?=
 =?utf-8?B?a1ZUU1lHU0RsUDByM0RCOEw2S3lDY1VJTGd0em9qZEhWSWh6Vkh1aFdqQnVZ?=
 =?utf-8?B?L1Fwb3NTenlaYUZIYlpGZUovQXRZWVBrSE56cjBCVkxPOHBpMFlTcW1OaExx?=
 =?utf-8?B?OHd3L2s4UncxMWg5VXRSenkzVnV6bEpwdTZlVkRjSFdOUVU4NUJWRVpoUzM5?=
 =?utf-8?B?MmV1RnpHRG5GRDRDRHR0VE9xK1Qwci9ZcDJKYWxuMWo1ZnZPc1dDNUZtK1Ir?=
 =?utf-8?B?VVVnN1hNN2lVd0Y2VnQ4NHUvZVdXNGl5dTE3MTQwa0NiNWR3aXYvTkU4bWhp?=
 =?utf-8?B?OXZhV2hmcGZWL3BvUnFMZXlZRzFQa3k2bE5YdW1mTHZGalN4RXZVaS85S29m?=
 =?utf-8?B?ditnb1pYZHFtTDNEclFURFZxaTh2UXZkc09BYzZCSmdnTXFWczhxcE5LS1Qv?=
 =?utf-8?B?RUhRUVUzcWQ2dVc3Z05zYTdydlJrQk1ZSjJ6RzNZZktuS3dZMStuM2tpcHA2?=
 =?utf-8?B?VTBBNVphSmFsTXJTeWVHY2dtL2E1UDB0SlhXR011STRpcUpJMFBXOUhtOEVk?=
 =?utf-8?B?Uzhia3J5LzBhazI1QlB3WEJxUC9OQm80V3VEUjlWM2JKVkJzMUl3bWNyNVpZ?=
 =?utf-8?B?b3V6MmlhSUdWZ0IrbUJyOTg2UjRJZVl6bUQ0K3lhVmttYWpJZHBMcXIvbm5h?=
 =?utf-8?B?bVYvZUhCVXd0eHNtWDVXUWhaNjdiRUNwYmNRTEtPMWxFd1doK290THJQS1Jn?=
 =?utf-8?B?ajJaVk1MdVlFNnVmSllIcWkwemM1SWtzQnhiVFl1RjZQT3F2Nyt1VkpLY2Vo?=
 =?utf-8?B?akxMaHFzWGJWcEpWSlNuU01sNk53UmUrZWtvQkNhb2x5QTRNbmdyR1kyVHZV?=
 =?utf-8?B?YWdtaWt2Yk5OL3YrTmFrbnB1V0Zqd3M4a0UxbkVCQmdpL0k4MkQ2Q25WQUxl?=
 =?utf-8?B?RUdEbFJJN0hKZDBUNUdsd1Q5Y0FYNjNNM2VLbm9CUnpLVHdrajdUc3FTb0Iy?=
 =?utf-8?B?enBsWHZQMlRtQm82bjArVVJ6R1hxZDRSV3MrSDBJVUw0RmsvL08vbmZnYkMz?=
 =?utf-8?B?SjgxUGFkek81c2dEQ0syRG1NbjVCUUZBQS9ZMFJaQ1JIcS9wME5mN3VldlpZ?=
 =?utf-8?B?S3QreklFV0c3Qi9SWEgyN2tBNEdUSUh3ZkxYQVlZZVZtNDBYL0RqemdSSXVM?=
 =?utf-8?B?dUcvdG1INXFqVyt2dzc0QXVPdGdpSHkxWnFKV091czNKK0F3clNIU1pGcFRo?=
 =?utf-8?B?S1V2c0VwNjRqSzBJcVk4TDVjb3RjNUFVdkc1QU0ra3dHZzJOMFR0R3ZhSEVL?=
 =?utf-8?B?c1pRL2UxUTBNWEQyejBoanRUWE5aNGd1bm5GRmJPTWdNUm4ySS9WUWx0Y3hG?=
 =?utf-8?B?NUtKY2w0QUtJdzdvc1VCbDczeXVXQTBnb3dJaW13UDcyamFQNGQ0YXJ6c3F4?=
 =?utf-8?B?d2I0cTBubk1XeTljV1JFV2pUb1FueXg3dTM0UyszemNkQkppbnQ1QlRvZnNn?=
 =?utf-8?B?T3F3ek1ReUdIOTkzY1ZvQ2ZvaGViQ0MyTEptcmgyelRkWlBEdjZsK2pRdVha?=
 =?utf-8?B?MmlaMlZjbEZGNmhIU3NDaW9BbXlOL1JONnNNRkpTRDlRVHNadHBIRXRhSHpw?=
 =?utf-8?B?RDZyWmFsVy9RajJRMk9kS3ZLRnI3WkVIb3RabFB1U0VqMklUQkpieVQ5bkFO?=
 =?utf-8?B?aHkwYVRZUU5JbnAya0o1a1BpTEd0eWtoelA5YWtFMnpiaTNsdHdJWDBRSVZD?=
 =?utf-8?B?aVZaNHZISjBsNG5WVnowLzVTeThrbTBNcDh6SFltZjF3NFNjcDNESFM4dHBU?=
 =?utf-8?B?SzBRanRNYXdqVlFBWDQ5NHlhRWlRWmxienZmT2MyNWlRSDNZREhKNzEwcmNp?=
 =?utf-8?B?Y2RSZlJ1RHBzUXFOUUsvUk0rS3Y1bWI4OHNsZnEvcysxS2dYTnQvc1cxZ3ln?=
 =?utf-8?Q?yUPtseSXxqGdCgjsxMa5JjTtcDwFZUccQ2zYmjpukBXy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd790bf5-5479-4d62-7d7c-08db0f7a7839
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:31:28.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COaei3rWx634CqNQDXXKNIHnulyWAJIhmys+4aD0dUlfDqOR2zKIu7OibBYjd0H7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, Huang Rui <ray.huang@amd.com>,
 linux-graphics-maintainer@vmware.com, Peter Xu <peterx@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Madhav Chauhan <madhav.chauhan@amd.com>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 17:13 schrieb Thomas Hellström:
> When hitting an error, the error path forgot to unmap dma mappings and

I don't see where this happens?

> could call set_pages_wb() on already uncached pages.

Yeah, but what's the problem?

Regards,
Christian.

>
> Fix this by introducing a common __ttm_pool_free() function that
> does the right thing.
>
> Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Madhav Chauhan <madhav.chauhan@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 74 +++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index aa116a7bbae3..1cc7591a9542 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -367,6 +367,39 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>   	return 0;
>   }
>   
> +static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt,
> +			    struct page **caching_divide,
> +			    enum ttm_caching initial_caching,
> +			    enum ttm_caching subseq_caching,
> +			    pgoff_t num_pages)
> +{
> +	enum ttm_caching caching = subseq_caching;
> +	struct page **pages = tt->pages;
> +	unsigned int order;
> +	pgoff_t i, nr;
> +
> +	if (pool && caching_divide)
> +		caching = initial_caching;
> +
> +	for (i = 0; i < num_pages; i += nr, pages += nr) {
> +		struct ttm_pool_type *pt = NULL;
> +
> +		if (unlikely(caching_divide == pages))
> +			caching = subseq_caching;
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
> @@ -386,8 +419,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	dma_addr_t *dma_addr = tt->dma_address;
>   	struct page **caching = tt->pages;
>   	struct page **pages = tt->pages;
> +	enum ttm_caching page_caching;
>   	gfp_t gfp_flags = GFP_USER;
> -	unsigned int i, order;
> +	unsigned int order;
>   	struct page *p;
>   	int r;
>   
> @@ -410,6 +444,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		struct ttm_pool_type *pt;
>   
> +		page_caching = tt->caching;
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
>   		p = pt ? ttm_pool_type_take(pt) : NULL;
>   		if (p) {
> @@ -418,6 +453,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   			if (r)
>   				goto error_free_page;
>   
> +			caching = pages;
>   			do {
>   				r = ttm_pool_page_allocated(pool, order, p,
>   							    &dma_addr,
> @@ -426,14 +462,15 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
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
> @@ -442,6 +479,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   							   tt->caching);
>   				if (r)
>   					goto error_free_page;
> +				caching = pages;
>   			}
>   			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
>   						    &num_pages, &pages);
> @@ -468,15 +506,12 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
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
> +	__ttm_pool_free(pool, tt, caching, tt->caching, ttm_cached,
> +			num_pages);
>   
>   	return r;
>   }
> @@ -492,27 +527,8 @@ EXPORT_SYMBOL(ttm_pool_alloc);
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
> +	__ttm_pool_free(pool, tt, NULL, tt->caching, tt->caching,
> +			tt->num_pages);
>   
>   	while (atomic_long_read(&allocated_pages) > page_pool_size)
>   		ttm_pool_shrink();

