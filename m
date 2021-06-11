Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F23A3CAB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B236E81C;
	Fri, 11 Jun 2021 07:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C046E81C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEc92VTP1i9ERyrYfHqMmH36rUw1X/D6+3vsuSs0SZo52FHW46QvSPsS9Wywti/AmXUegoUJFTEFQWIi0MfXymzK59NdZEI2EJatqKXzHHL9G0qdAJTwww/QIH7oHW7BwBcJybtpErT32tibav76d9iFslBJsfN5h+k3VJN1tAZsJ6c3/bd+MLGk32ISSaO7G+LRe/XqH6ZTkrl/9HwnX06xJLzlF87ortHmq7vdjTTwz1rY7NSKzliMiF/+GDRiYn3O2+qE9nYpiqMyr+27zIrsqW7UnanemPronniLyKgOVSyifkE0O15klC1PlTM9ZWHKupTwTCVf5mkwzjSMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8qu4SVvABt2mEIx+O+qPKgsfdasMLksFuogEiF7wlc=;
 b=JXJ7JYRYPteq3cTieBt+oNy9YKa1+KGTd+8LT4iwawt1tg4qXNllgr64U6dggfVC7YBqk7nQpKi7xosGoHTeWBU8dKFZMeSYsIEz9bSXBddVsgdiS5K/AFzEgj7nzDBc5vT9Bsj9XFR9xtgeRL7N0vKklU1C432gEFAjPQrZ4xRfsDQ7aEXtyFfjjoHcknXuUtpbUcE2DoqrgOLfSm+kenRadAxjE4MfAReVckbjC6/VFpsFmh7wMhOTJYbq8w1n0VyZ0BnFyJ3rsGDHKidHL2UUKcMwNKal69iQ6pvyzq3Tr2pyXVuMLnGsHEZbCmAOnkWnIFspBmIWX0U/i334PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8qu4SVvABt2mEIx+O+qPKgsfdasMLksFuogEiF7wlc=;
 b=cn0kTYncf4ROogkpQeGuhAq4ffNPCLilYEaAqENndZzW1YPVLAtu13v7nawjVbFHEQIQ0kbqbDh8SPcnOR3MHDuq+nMHDasHfkt6oQ60R87epiLdpyRtwFR/Z2kSrLvyg1FRq6wQZVbgyuZJFo2DNjAdGI/M+pgKGC77vjQmfeE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3789.namprd12.prod.outlook.com (2603:10b6:208:16a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 07:11:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:11:33 +0000
Subject: Re: [PATCH 2/6] dma-buf: Add dma_resv_get_singleton (v6)
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <20210610210925.642582-3-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4f27d6ea-ed7e-1d25-3b8f-9852df1eb2a6@amd.com>
Date: Fri, 11 Jun 2021 09:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210610210925.642582-3-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e99:1d6a:3624:888b]
X-ClientProxiedBy: AM0PR01CA0105.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e99:1d6a:3624:888b]
 (2a02:908:1252:fb60:1e99:1d6a:3624:888b) by
 AM0PR01CA0105.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Fri, 11 Jun 2021 07:11:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af62c859-8ddd-458f-e879-08d92ca82493
X-MS-TrafficTypeDiagnostic: MN2PR12MB3789:
X-Microsoft-Antispam-PRVS: <MN2PR12MB378918ABE7E2FD572E166D3B83349@MN2PR12MB3789.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imVYcZ61VATjYTBdF6MEgCoCQLFKJza2op/Xzhcl1joUva89C2OfD/ntS1zXQGk1jcjPIO2qIeS2hwLaBkb/CNl2a5Ows5oi2v+d1Yem9h/Ss6bMRq30CCdG5Jx4zTxPI7Ku/R9b58R2hG7d4B9U4mSguFC4lMxb0fdueXCPlzfd/KVMYG77FKsTiT3obap/EIKoCEJTS5vpNgUHcxRNBU1VCFVTEquiU73/jnQuzcA+1D9kfxvRtgWZv6lsMFJRDR78xfQY/rSynQO9nwy7MdqgmJJF9P1czW9AtPC+5Ai/VioUSn4ZpVKGvDzWKXid60tZkOMw8WUPXLp840/N+rn2sMUxTerIgC2LLb9wcMEPH4dju1dsHg9/GWbMUKVimnYKySZ1b/RrmFsbaAhi6jIE0OGExFKkie7LXeHH9YQJmsq5Hc6+ucem8rOpnFYFMtDMqw0FMgEa3EqYRZnqYQ8bNWx2GVxOX6u5CTxvEzUcTpZFUppvnejzgV48GbmMIv1bc/uWEZLUjtsFfPLs2i9nc6lHbG4YcpHf0MwmNSYNCXQSiiy/C0KtqPu6fPfuksOphmAZrxe/VCibsNY1UUM3DpKycMTKXKAa8mnNB2CVV+WDKI5qVXzCekbC/hoHwPRYe4eM8js1E9rR7QKWbGECyiDRhFJc0EEzzE/QytA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(8936002)(478600001)(186003)(8676002)(16526019)(36756003)(31686004)(66946007)(6666004)(66476007)(54906003)(66556008)(6486002)(5660300002)(86362001)(2906002)(2616005)(4326008)(38100700002)(31696002)(83380400001)(66574015)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXRwZkxxblYzaGhJVkNoYkdHUHlldWVUT0pEN3FKVk9wM1RxWUZCempDNHM1?=
 =?utf-8?B?N05QNzlhMS9hNUFVZlBKRG9RZjhmQ25nbUxDa203MksvUHduZVFURm5TN0ts?=
 =?utf-8?B?cWpXTjZtTG5kejZ2THhxMFZDMDZhNFJnTFBCTHJ3YWcyNDZUb0ZpdWt6YnVs?=
 =?utf-8?B?ZkhZa1FxbVNyaU5YZDlKYngyYWFYY0lXcWtZNENsQjdwVW93VklEdmZuMmQ2?=
 =?utf-8?B?aVRjNWl1S2tPSmJneGxpUkc3bGpmczBPWkhpajNNMmRoQ1RvZ2JyRDZXVXM2?=
 =?utf-8?B?cVA3SStua1BzbXZjS3JORDFCU0dZMUc1UnBXT2YxN3VKYTlBcXJ3eXlkVGN4?=
 =?utf-8?B?VUpjZzNPa3Z4b2thaDl2V21GZVhkTnFhSmgrUTFMZFJ1MWhWSVR5NGF1dUhO?=
 =?utf-8?B?bm5ZZWJSZU04REpzb283RU41UnpzSFZ1RUdUMGlMSGFLdzM1Y2VDTWQ5YXpD?=
 =?utf-8?B?em9UUmp1ZkRINUdnTHZFSTJ6SzdlWFhFN1FmQmpwWDBDOTVReS90WHpQUlZs?=
 =?utf-8?B?WnNwVDV4NEZNOXJGR1YxZERLdWg3QWNMc3o0bTFFQVlBd0hlbHVDbkNBVUV6?=
 =?utf-8?B?OFlpajRpdjZCTG9aWWRodEJHb1owOU5mTzRRUjA3RWJZaXVEbkI3M1JmdWJk?=
 =?utf-8?B?TEsyVjEraWhMdE96bVpocDBISkZLajYwSGtXcWNKNUZsUTRDdjhyYWlWR3kz?=
 =?utf-8?B?R1hWTlpDRGF1Ri9tTXl4ZFpOODdNZlpPY3FqRUhnVlk4T2x2Sm5YQjBvZ1hs?=
 =?utf-8?B?aUhyQzRWa1FMdXhiNktrcnpNdXk3eG1sVEZyMmpOODErU2wxQVFBNFBWNzFG?=
 =?utf-8?B?TVR1bjB3N2dvYkNSazlSRmE4OEU1RlpmV1BuRThxSitUL1F1S0g5T3RKVGNZ?=
 =?utf-8?B?NXBuQmRpZXNxY3FmL0dqVjNYT01Kb3hKaHpTYzMzTVN1dUk0UTJZUCs3QXZr?=
 =?utf-8?B?bFNxVWtLak9zZDc1c3RxRmRDT0Y0blgySThVczBJeGRSVjdEZ1d4K0RhVDZs?=
 =?utf-8?B?UlRpdVl1UDgyMkpVSEJiZUNYZWRLbXR3RGRueW0vUGJoT243bnZGVGFnTDYz?=
 =?utf-8?B?QkhPRmJMS1BmOVcwNzVoMDl4Z1hpZWNPeDN3TURUU1p5MVhKa1J5bEY2MXZk?=
 =?utf-8?B?MTI4RHNvNFVSamcvT2UyVXp0ZjRPWUl5clVsVVZmbmQ1bVNwT05lVUVhS01Z?=
 =?utf-8?B?eEFIOHlha2lhNUhhZGYrZ1phQ2xQNzJzUHFWRmdHeW8yM0ZXYjhDaFJmTXlt?=
 =?utf-8?B?bE1PTXRZRmlCSGw0V1ZEZkFXQWhxV2dEcFUrOGZXbFc2Vllsemw0UmZ3WlhX?=
 =?utf-8?B?My9ockx4MVJTa0VobHYxSHZ4eGNDSm13MCs3SERSZVc5UlZvZEFocEdOcldw?=
 =?utf-8?B?U0NMZlNNeHhoWVFhREpkZ1p5MVJ4VTlTQ2h2NnBFNDJiWUpCMEpnV0FGY0pT?=
 =?utf-8?B?dFRKQy9TaUwreTBIczhPcTRDdWRvY1pSUmJjZHljVGNDTlRlOThjYjdMOVND?=
 =?utf-8?B?UWU4Skhqby9sTkthTWpzV24wUERUQTlXcTNVV1NoVlJ3TlZuK2g1S0swR2M1?=
 =?utf-8?B?TXArZ1pIVUtNSnNTN1VMeFZTOGtXMTN6SDBXQkFaNjAzVUorWkVON1lqTXl6?=
 =?utf-8?B?WVdiOEc0cTJ1TU03ZzZURkVxbFBaS1RZbHN1U2N5VWh3bFNpb3AzR3VXaDQz?=
 =?utf-8?B?WHFtcHZQZ3gzSmRrb3hIdWRLSTJaRk9ONTZGRytVc0k0Lzh3RlRsNFlyeVBM?=
 =?utf-8?B?cVYyQ1BnTEF3eUgwcGMzVWwvZUdSZ000T3BLTDQrU1V5eUZiR21naGJEdzZ3?=
 =?utf-8?B?NDQvdEU0NjZJQlJRU2YvQmJNSjVoVk5UV1Z0RlNLRTNqWmZSMHl6ekRuZDlm?=
 =?utf-8?Q?u/2b1ZhcyFXAS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af62c859-8ddd-458f-e879-08d92ca82493
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:11:33.2684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9S7MdFob0omEup2bSgaGR+wAbMgcs5iPgjT8Pq9bwkVZ6CG2FI8hHpz1p6a/EMHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3789
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> Add a helper function to get a single fence representing
> all fences in a dma_resv object.
>
> This fence is either the only one in the object or all not
> signaled fences of the object in a flatted out dma_fence_array.
>
> v2 (Jason Ekstrand):
>   - Take reference of fences both for creating the dma_fence_array and in
>     the case where we return one fence.
>   - Handle the case where dma_resv_get_list() returns NULL
>
> v3 (Jason Ekstrand):
>   - Add an _rcu suffix because it is read-only
>   - Rewrite to use dma_resv_get_fences_rcu so it's RCU-safe
>   - Add an EXPORT_SYMBOL_GPL declaration
>   - Re-author the patch to Jason since very little is left of Christian
>     König's original patch
>   - Remove the extra fence argument
>
> v4 (Jason Ekstrand):
>   - Restore the extra fence argument
>
> v5 (Daniel Vetter):
>   - Rename from _rcu to _unlocked since it doesn't leak RCU details to
>     the caller
>   - Fix docs
>   - Use ERR_PTR for error handling rather than an output dma_fence**
>
> v5 (Jason Ekstrand):
>   - Drop the extra fence param and leave that to a separate patch
>
> v6 (Jason Ekstrand):
>   - Rename to dma_resv_get_singleton to match the new naming convention
>     for dma_resv helpers which work without taking a lock.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Christian König <christian.koenig@amd.com>

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-resv.c | 91 ++++++++++++++++++++++++++++++++++++++
>   include/linux/dma-resv.h   |  1 +
>   2 files changed, 92 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index f26c71747d43a..1b26aa7e5d81c 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -34,6 +34,8 @@
>    */
>   
>   #include <linux/dma-resv.h>
> +#include <linux/dma-fence-chain.h>
> +#include <linux/dma-fence-array.h>
>   #include <linux/export.h>
>   #include <linux/mm.h>
>   #include <linux/sched/mm.h>
> @@ -50,6 +52,10 @@
>    * write-side updates.
>    */
>   
> +#define dma_fence_deep_dive_for_each(fence, chain, index, head)	\
> +	dma_fence_chain_for_each(chain, head)			\
> +		dma_fence_array_for_each(fence, index, chain)
> +
>   DEFINE_WD_CLASS(reservation_ww_class);
>   EXPORT_SYMBOL(reservation_ww_class);
>   
> @@ -495,6 +501,91 @@ int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>   }
>   EXPORT_SYMBOL_GPL(dma_resv_get_fences);
>   
> +/**
> + * dma_resv_get_singleton - get a single fence for the dma_resv object
> + * @obj: the reservation object
> + *
> + * Get a single fence representing all unsignaled fences in the dma_resv object
> + * plus the given extra fence. If we got only one fence return a new
> + * reference to that, otherwise return a dma_fence_array object.
> + *
> + * RETURNS
> + * The singleton dma_fence on success or an ERR_PTR on failure
> + */
> +struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
> +{
> +	struct dma_fence *result, **resv_fences, *fence, *chain, **fences;
> +	struct dma_fence_array *array;
> +	unsigned int num_resv_fences, num_fences;
> +	unsigned int err, i, j;
> +
> +	err = dma_resv_get_fences(obj, NULL, &num_resv_fences, &resv_fences);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	if (num_resv_fences == 0)
> +		return NULL;
> +
> +	num_fences = 0;
> +	result = NULL;
> +
> +	for (i = 0; i < num_resv_fences; ++i) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
> +			if (dma_fence_is_signaled(fence))
> +				continue;
> +
> +			result = fence;
> +			++num_fences;
> +		}
> +	}
> +
> +	if (num_fences <= 1) {
> +		result = dma_fence_get(result);
> +		goto put_resv_fences;
> +	}
> +
> +	fences = kmalloc_array(num_fences, sizeof(struct dma_fence *),
> +			       GFP_KERNEL);
> +	if (!fences) {
> +		result = ERR_PTR(-ENOMEM);
> +		goto put_resv_fences;
> +	}
> +
> +	num_fences = 0;
> +	for (i = 0; i < num_resv_fences; ++i) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
> +			if (!dma_fence_is_signaled(fence))
> +				fences[num_fences++] = dma_fence_get(fence);
> +		}
> +	}
> +
> +	if (num_fences <= 1) {
> +		result = num_fences ? fences[0] : NULL;
> +		kfree(fences);
> +		goto put_resv_fences;
> +	}
> +
> +	array = dma_fence_array_create(num_fences, fences,
> +				       dma_fence_context_alloc(1),
> +				       1, false);
> +	if (array) {
> +		result = &array->base;
> +	} else {
> +		result = ERR_PTR(-ENOMEM);
> +		while (num_fences--)
> +			dma_fence_put(fences[num_fences]);
> +		kfree(fences);
> +	}
> +
> +put_resv_fences:
> +	while (num_resv_fences--)
> +		dma_fence_put(resv_fences[num_resv_fences]);
> +	kfree(resv_fences);
> +
> +	return result;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> +
>   /**
>    * dma_resv_wait_timeout - Wait on reservation's objects
>    * shared and/or exclusive fences.
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 562b885cf9c3d..d60982975a786 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -275,6 +275,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
>   int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>   			unsigned *pshared_count, struct dma_fence ***pshared);
>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
> +struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj);
>   long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
>   			   unsigned long timeout);
>   bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);

