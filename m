Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4723F045D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CF689E9E;
	Wed, 18 Aug 2021 13:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E491289EEB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWWzPjS7gGTIESpD74sAMfc4zsEgxQ0oJQ+yB2Zs2BlXLwm/WhgZlbtiNs9tR3UjB7eITLVwx34+EGES/es1MfK44J00vJ/XIYovMUCmih3w1m/lCXP50ywD7uO0Scdn9+PivJJJ2/p3LyysTn9w5kOJLhpBHMYaM1+D7xb6zMm9FXNEhrNm2Z+vPkXdXJcSUmBXKwDUy8igaKBq8/Ejv+V+c6oRXOPxETCZAzYIYOBEm1drB2CmW/XXCCgxMFGpHYk5GupNUqHK0v+wtL6Fkt0avd3YLjzHz6/z91D8sGJZbu9GwIhtQQK6468pbMaukC7OkB6lJXG2Hgxi6LnIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tisiPHDVwsfbGh/JGAqJBHz7M4SsbGkEuYK703GrxR4=;
 b=jOjspRc/xh/JbGGuD6dz9khkGR8sif4XXaj8ZNI1+v+IUP+0Y384mBdjc74R11iU/uwxzPrLjm0oVTuTZNl3NdFNThtypmd3qBg6z0FpDVYbeQEPk/jLpWacPi4kKBzM1gwE//4cN3sUmn9zQDp2PLZznMkOSjRLN4KsEXWJjn7UD8gS784Ptwu7DITucp59gFup5smP2CPs7xBKfqn02W0y4hHIBdT12m6oEaEHpzJ0LYER2Ng4RhBVAHImcijIU5IKLPwyoLQC9/7JbpJC0AzEJs7hvBuVELfege1uw34lCvYX0f3D7RTUPxXI4HAI9sFDI3y8b6CVLOd6YynWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tisiPHDVwsfbGh/JGAqJBHz7M4SsbGkEuYK703GrxR4=;
 b=Bu+Bp4H4UmNfMzcLAh9QAx0qPirn1GctOjyfxBu0hK4c5aTI3STanV6duH7T5wzIFMA0Tyg/9haVBL+1llTCYm7ekv+9brf/jukLG3OAU/TReQ/o4LsXuJ4Zj3KQ8u3/AIYQs74a6CGmt85Kj/N5/eo7tpQQxQlxS8W3qkTF+Wk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3965.namprd12.prod.outlook.com (2603:10b6:208:168::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Wed, 18 Aug
 2021 13:09:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 13:09:51 +0000
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit v3
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>
References: <20210722113453.2314-1-christian.koenig@amd.com>
 <ae7405c6-2d91-e7e4-0a0a-7de6f4b330a0@gmail.com>
 <YRz98uGS7R1AeE+e@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <86b3314e-8dc3-cc6c-f59a-e970859e7716@amd.com>
Date: Wed, 18 Aug 2021 15:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YRz98uGS7R1AeE+e@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.55.180] (165.204.72.6) by
 AM0PR01CA0118.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 13:09:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 229ba699-cfba-407f-d592-08d9624976b8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3965:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3965FF89CA7896877348F70183FF9@MN2PR12MB3965.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H91O/wc1M8G54D3h7xgBVaBqbhl7zd/9GYjosBmQxZutlKZpDOjiJewR6A5ZXwQ4pmpRnvnDHq930FH2pATPwAPRCXiIPwRf+FCborUN0c2pqkNsILVy/V64Qfx9pUPXcQceYNaJCfe6exwrfG4fIm3bGR1guzkVeE/rioQulC1cf41gQIvYqGaznzTL4EUf54UJdyGh7Ww2Jq8pNLKt5sg2CLm+4oA+ewd/V9pAT/MCJwpPuL5kR63aZUyHvwstrRAYhyg5eI5BB4ZmXw8zvSb5TpdP0dvyjxQmzn2C4I78znD3RDzbEFN73G5Ca2yC9Lt4AQ8SRXTJo0AI7RlSrr/UgWl/7qbPnERaUPccmpPLkGnv9lO+uMdpJkH8m4IbJ9ifWXOE22mCOKcKG2r+F+p+s7dTKJnmnZWAAdKHi8JhFWTfMTM8HTzKedE4OWFclpaFqe0HpcMk2WU66tsrJpvzrbPfva/qpKHJE2aZaxforepHcHQJQQEPfr+icPAcCG3zKIagEbivSzCr9yXqEAcCS25lmaXCSk8rGoo28jFVTbOSWHUIZmXhsN0YR8aucizq4bX2ymf5lh6Cpsep2D/L2oGBeBAhywd4A8ggcIgFAydRmtamZuc0Vqd6naRGXNc81iXhI6XA7CmxTCF4GSoDeCNHBxorD7q6QBw3CxlODUYW1Zyo+/ZgkDr/BMtK32/Ps3HKZ0e2Td5PpWDYtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(478600001)(66556008)(66574015)(38100700002)(316002)(2906002)(4326008)(36756003)(6916009)(6666004)(2616005)(31686004)(16576012)(956004)(31696002)(66476007)(6486002)(26005)(66946007)(8936002)(83380400001)(8676002)(186003)(5660300002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZlcFVvM0JVMFNnR0NCZTJYR1RtSDd6ejZJTnRKWjVpUjN0UTZDV1ZiKytY?=
 =?utf-8?B?SDZWMjlqVzdlVHdZYlFLWjVrdGd5UWFkWVp6dXdrSUFUM3hsVkNudTRQTEs0?=
 =?utf-8?B?WXFoTnFvOVlESFRuMkZWZU8yNHpLdGEwTXBBS211WkNlY1Uxa1dNQ3dQZzlk?=
 =?utf-8?B?TTZyUGVCbVgxMnIyZUJVUVpMdHphNUIvdjF0Q0dSODVHL1dRaisvaTNYYUt6?=
 =?utf-8?B?S0U1MERkT1NWUDVpeWlJMmZYcUs1WnEwcmhsNTlPa2kySVdRSUp4d3FEU05z?=
 =?utf-8?B?cS8wbDdzeHFISlN6ZnM3S2ZlcjNDQkh4L21nZW5mdUUwNDVSSm5xVFFoaW1l?=
 =?utf-8?B?cDdqRm8yUUFPZmZKSEFMR1ptaEtRZGNaM21LN1NFUVR1L1VaMmhhU1hOQ2pB?=
 =?utf-8?B?eEJJeU9xTjNMNXFZdXNYYmtoWG9Zc08yWkQ5S3M3REMrTEo4bEd5VXhzNFlG?=
 =?utf-8?B?NXIyWnJ0NE1HQTM3QzZRcHlHVld1WDdmNVVUT1E0RW03eVgzSzRKbi9Nclhx?=
 =?utf-8?B?dGwrRGg5Y2VBODFKK05odm9IR3EyUmhTNWtXc3YrUXdjclNrUWdLRzZ5Z2tV?=
 =?utf-8?B?TVl0blF2WlpEa0N6NnpKa0lYMGRLVkNIQWFaNEMxQ01HY0ZDVDFoVDdRbjNP?=
 =?utf-8?B?VjdKd21jOGV3bzR6UEp2TmFrTUk4WVNpUCtwdDJHMGlkWFR0N3pRNjhGVjJI?=
 =?utf-8?B?aWw0aEtEZDV4SEtORTFsZEdvRWRZb2UwaEhLSTRTOVo4bHFKdUJCRHZCc1ZS?=
 =?utf-8?B?a05DczJEaVVVMmVJUTZyT3k1YUlPOWNKWkdZZWN4MnplTmRVUjVueEQzazEr?=
 =?utf-8?B?TlVROWpOaFpnTlZ0YnJkZTkrZjhOQWNOZUZTTGRXejMzaEwyN05ndmd1Q24r?=
 =?utf-8?B?M0h5Z0o0bG96N2lPeWZnaC84TkNFT0lJeWFDV1lKSVVtV1g3RjM2RnBZZllr?=
 =?utf-8?B?MTJJR0hMSlNnRzlnb3JKajE3R0ppMWhZWUNEMEoxbWlrQWI4S0JobW5lRXV0?=
 =?utf-8?B?OFYrVnNHYUVYRWlQdGxpTStZZ0MxR01qVklHTkN3V0g1VTlsUGlKcWg5RGJj?=
 =?utf-8?B?aG8yd0crTTFaWDFvVmZoZ09lcHYzOVpuZDlmS21ZT3RYcVJyZzlFNE1ZYlhV?=
 =?utf-8?B?bS9NQ01ISFdGVjFrOXg1cnFEVTBRYmVoeXl4M2d2YlRidWtTUEV1TWc3MkZX?=
 =?utf-8?B?WW9CQzRZS1lqUEI0Mi9MaTdENE9PQlhBVkxMYzBXdHZYYmgyQWIyMnlnWmQr?=
 =?utf-8?B?QWF5cEg4NVRQQlQrSElWT1hXNEdmS0gvd3poWlVTNy8wNmo2VGhucDAwaHZp?=
 =?utf-8?B?M2Y5ZUpFUkg5cU5QR3hzUHk3djFwdWJXM2VMZ1BHQ3ZuWHB3UVpHSVd5eTJN?=
 =?utf-8?B?Zmd0QUgrVlpsWEFyTlVNZ1h5S3NGcDE0L1l6VkpGYXR2akdnQlZka09XSi8v?=
 =?utf-8?B?b0hLSFVSU3RKVlNJVVhwcXd3ZEZJMmZCaUp0QUtMY0Z1aG9FMW5aQ25sSkcw?=
 =?utf-8?B?NG5qZDNjRGRnS3pIMUhLK3F3OUczMHRYbDZGWUpBZCtjQ2cyS1NwdDRhZVJN?=
 =?utf-8?B?V2Z6czFNOVExTTk4d3hqYkFad29UY1k3eTl6S1M0elpFZUVVdjB5ZXNJMGJ2?=
 =?utf-8?B?ME9zRG1OVjk0K0VEbC8vb1RTWWw4NmJXQjErTkpZTTJPWHBBRXZwV3ZLVXBO?=
 =?utf-8?B?U3dHYmtQMVNQMkpDOXFQZzU0MGNCUXJ4elJTQnBZS3BOeGdWOTlZZWVkNDhv?=
 =?utf-8?Q?XD72dW2a1+CoYEHnuXpPaGOkQX32OU6cBKpsSTS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229ba699-cfba-407f-d592-08d9624976b8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 13:09:51.8002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eATQotJY7IkVWqNkylCBGEYlqUUZ/wPfKm3vH0AFiDbTepCBqzTNTpTzchLexkmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3965
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

Am 18.08.21 um 14:32 schrieb Daniel Vetter:
> On Wed, Aug 18, 2021 at 01:27:13PM +0200, Christian König wrote:
>> Just a gentle ping?
>>
>> Does anybody have any objections? It's just switching back to using a
>> spinlock in the hot path instead of a mutex.
>>
>> Thanks,
>> Christian.
>>
>> Am 22.07.21 um 13:34 schrieb Christian König:
>>> Switch back to using a spinlock again by moving the IOMMU unmap outside
>>> of the locked region.
>>>
>>> v2: Add a comment explaining why we need sync_shrinkers().
>>> v3: Drop sync_shrinkers() and use an SRCU instead.
> Why did you move to your own hand-rolled thing here? From the old thread
> it just looked like Andrew wanted some proper explanation. And the
> sychronize_shrinkers is imo much clearer than some hand-rolled srcu thing.

Well I agree that it is minimal cleaner, but I've pinged Andrew a couple 
of times and he seems to be busy.

> Also on the spinlock covnersion, do you have some benchmarks/profile
> flamegraphs/numbers that show it matters? Would be realy good to record
> that kind of stuff in the commit message instead of just having the
> implication that this optimizes stuff.

The spinlock conversion doesn't matter that much, but what makes the 
difference is that we don't do all IOMMU mapping/unmapping under a 
single mutex any more.

I've promised to take another look at it when we fixed that and somebody 
from an internal team complained about this as well.

Not sure if that really helps or if we then have the next bottleneck in 
the IOMMU code, but it is at least a start.

Christian.

> -Daniel
>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_pool.c | 45 ++++++++++++++++++++--------------
>>>    1 file changed, 27 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index cb38b1a17b09..cee664c487b5 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -70,7 +70,8 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>    static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>>>    static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>> -static struct mutex shrinker_lock;
>>> +static spinlock_t shrinker_lock;
>>> +DEFINE_STATIC_SRCU(shrinker_srcu);
>>>    static struct list_head shrinker_list;
>>>    static struct shrinker mm_shrinker;
>>> @@ -263,9 +264,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>>>    	spin_lock_init(&pt->lock);
>>>    	INIT_LIST_HEAD(&pt->pages);
>>> -	mutex_lock(&shrinker_lock);
>>> +	spin_lock(&shrinker_lock);
>>>    	list_add_tail(&pt->shrinker_list, &shrinker_list);
>>> -	mutex_unlock(&shrinker_lock);
>>> +	spin_unlock(&shrinker_lock);
>>>    }
>>>    /* Remove a pool_type from the global shrinker list and free all pages */
>>> @@ -273,9 +274,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>>>    {
>>>    	struct page *p;
>>> -	mutex_lock(&shrinker_lock);
>>> +	spin_lock(&shrinker_lock);
>>>    	list_del(&pt->shrinker_list);
>>> -	mutex_unlock(&shrinker_lock);
>>> +	spin_unlock(&shrinker_lock);
>>>    	while ((p = ttm_pool_type_take(pt)))
>>>    		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>> @@ -313,24 +314,27 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>>>    static unsigned int ttm_pool_shrink(void)
>>>    {
>>>    	struct ttm_pool_type *pt;
>>> -	unsigned int num_freed;
>>> +	unsigned int num_pages;
>>>    	struct page *p;
>>> +	int idx;
>>> -	mutex_lock(&shrinker_lock);
>>> +	idx = srcu_read_lock(&shrinker_srcu);
>>> +
>>> +	spin_lock(&shrinker_lock);
>>>    	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>>> +	list_move_tail(&pt->shrinker_list, &shrinker_list);
>>> +	spin_unlock(&shrinker_lock);
>>>    	p = ttm_pool_type_take(pt);
>>>    	if (p) {
>>>    		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
>>> -		num_freed = 1 << pt->order;
>>> +		num_pages = 1 << pt->order;
>>>    	} else {
>>> -		num_freed = 0;
>>> +		num_pages = 0;
>>>    	}
>>> -	list_move_tail(&pt->shrinker_list, &shrinker_list);
>>> -	mutex_unlock(&shrinker_lock);
>>> -
>>> -	return num_freed;
>>> +	srcu_read_unlock(&shrinker_srcu, idx);
>>> +	return num_pages;
>>>    }
>>>    /* Return the allocation order based for a page */
>>> @@ -530,6 +534,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>    			for (j = 0; j < MAX_ORDER; ++j)
>>>    				ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>>    	}
>>> +
>>> +	/* We removed the pool types from the LRU, but we need to also make sure
>>> +	 * that no shrinker is concurrently freeing pages from the pool.
>>> +	 */
>>> +	synchronize_srcu(&shrinker_srcu);
>>>    }
>>>    /* As long as pages are available make sure to release at least one */
>>> @@ -604,7 +613,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
>>>    {
>>>    	ttm_pool_debugfs_header(m);
>>> -	mutex_lock(&shrinker_lock);
>>> +	spin_lock(&shrinker_lock);
>>>    	seq_puts(m, "wc\t:");
>>>    	ttm_pool_debugfs_orders(global_write_combined, m);
>>>    	seq_puts(m, "uc\t:");
>>> @@ -613,7 +622,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
>>>    	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
>>>    	seq_puts(m, "uc 32\t:");
>>>    	ttm_pool_debugfs_orders(global_dma32_uncached, m);
>>> -	mutex_unlock(&shrinker_lock);
>>> +	spin_unlock(&shrinker_lock);
>>>    	ttm_pool_debugfs_footer(m);
>>> @@ -640,7 +649,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>>    	ttm_pool_debugfs_header(m);
>>> -	mutex_lock(&shrinker_lock);
>>> +	spin_lock(&shrinker_lock);
>>>    	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>>    		seq_puts(m, "DMA ");
>>>    		switch (i) {
>>> @@ -656,7 +665,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>>    		}
>>>    		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
>>>    	}
>>> -	mutex_unlock(&shrinker_lock);
>>> +	spin_unlock(&shrinker_lock);
>>>    	ttm_pool_debugfs_footer(m);
>>>    	return 0;
>>> @@ -693,7 +702,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>    	if (!page_pool_size)
>>>    		page_pool_size = num_pages;
>>> -	mutex_init(&shrinker_lock);
>>> +	spin_lock_init(&shrinker_lock);
>>>    	INIT_LIST_HEAD(&shrinker_list);
>>>    	for (i = 0; i < MAX_ORDER; ++i) {

