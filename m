Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E844F9204
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56410E16A;
	Fri,  8 Apr 2022 09:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52010E15B;
 Fri,  8 Apr 2022 09:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqNp5KvuUa2+9Hiiomw1b7UDsQ+kzkbz2WXc9EsdCxrvKnPPsAKwefq9vEI99shlewjCeYStxZhUb+97JWwY17G0Y8b7Ek+xzunFM78YJ6r8DW7E29aIzdpMbI6AyAPMhMpxCePkj94TpE8LnZn1gEVCV+HI+boM+Z31sGv4GfSlwsTpUr54rCM38JFgX59MIaKnLuyuc0i6sDTHx8O6yNiCFuco72GCwXH6Ok7Z4VI82Z0qwHFYrpNkPg4dw6d+qrq2ycEuCMW35bnmOt+/wr59zhlmMf8jLl7qSNnUrx4TFqyjrt1Dlb/O2Sigmn35n8+DTsgzSAVxManLxGSBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trY9B8t/ZB+ns3Mx3ycOMzBDz/hpn+S2wKkrhyndiGY=;
 b=bbegvxL0oXYFpkK8k0keKi4pKoZniver3y07pjyDkh2RXjgdyth4mvRhy6jt42YH6FHDvQLP0BQITqk+KOYiRk3Yj6HY+gFVWP9rzRTAcf4fmBD6aQ6An6aflsLciBWtGHNiJtaEwIQc52duZZGdLqjNrvzCNB11jRGMBOBDzG3DONNAXXDlRtTnaVc/7zMVCa86RmQgqTY5exgTD19ysTWguZbrxdiokDndl5a6qjnPMzJkjqCpPgMdbBf2IOfP0Pez6/QW/rO6uSBMw2l3KHyItaWfltXTQ2lJS4gBAZkUE1qmIWQL81F51Cdh1VEy+1Fq6GOc0iA9AyQFMzXWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trY9B8t/ZB+ns3Mx3ycOMzBDz/hpn+S2wKkrhyndiGY=;
 b=rfDD71n+s+45yaqwIqeicbZrdKvBtBe2LeF+EBWGvS+TJTAXKnE3EUBdKy3mX+o8WYNTQb4YingXv4SrIvu6uQ6E4J/HXHtdDZOdVeRb4mfBwK+7B0H7WHlrwmqVS+RiJ3wAevSOjnUXSxgNN+0+aBQzXSKDO5Bdw5xQ9+i3+OE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3722.namprd12.prod.outlook.com (2603:10b6:5:1c3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 09:27:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 09:27:37 +0000
Message-ID: <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
Date: Fri, 8 Apr 2022 11:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/15] drm/i915: drop bo->moving dependency
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-13-christian.koenig@amd.com>
 <87y20ghrmy.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87y20ghrmy.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0558.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3796e3d-fcc3-46f6-b17a-08da194204e8
X-MS-TrafficTypeDiagnostic: DM6PR12MB3722:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3722070ECC3FF73D6FAA558583E99@DM6PR12MB3722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvQ/C6m22Y6xWp7ISqh1iU2Ob5jCTl3MRH64qaYpBdXRQdsmniW/cuVFI1HqdO/+SlK2cKMoBE4sn9BeFWOZl6gaI31xhpe3xATXVohhSkuSFcg4CZBczpJt2FTNTn9fFpPSeRgrLm/GJS9Op2FPIoGqzUyMf0hCA5HPQaxgZYqeWJWps1mxNtx5rbrTjJEY7Jaw+PzlzNp0m5Z4cvpUXvqxhnYL325aVrZzwg9HZxgOPABNNu0jGU31xMxyvc6rpVuTUuTvytp0uIN6El5v0pSqrj+S9u59Ol11xtCSDdJ0lm/xS0omGoQt5TWLeNHgUkawILMfwGUdlLwhEfJPfpPEEbdNiIoBWKhodvNwgCUyNa6WJW4eMQVjtEbpfcsRcXafJse8KszKPhEHC0JZ26zwJZWx9SGJ/eoSkIN2j74IDoQRseSwtSSXTT17Ln2J8tN5evNS6ypTGHzI/N6y31gkJzVPAREjOIe155oDDYrNTpJ6w2a3G4blNtFcv+Gty7mkt1T9Y09B2OYB+bUGXokvZ3rq359tFAybIGG5PEH5qZj7bKouCdnT51aXan/kylTWdcbtHibnIxMUUGBRQerCSER4ggiULWHoiLfAwQE013ddpvWRxOZaoVNjXscSm+VMlyEm0dBqXdndfPZ+LATw3Hd24H1gGkXqdlX55cLJbqeddmPVMMSL07nt3UIvzL1RM45A9cTmikB+oMdG+cx+P2b3OfHEjmHIpKzTWC0W7wxpG6bo7E8UTRw/1x8j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(6486002)(38100700002)(7416002)(186003)(66476007)(5660300002)(66946007)(6666004)(66556008)(66574015)(508600001)(8936002)(83380400001)(2906002)(6512007)(54906003)(36756003)(316002)(31686004)(31696002)(110136005)(2616005)(6506007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBjZGhqaWhLMkR2ZW5ITXZQRXFaQTdaZ3drcVc1VU92YUd0SmF4NkxuL053?=
 =?utf-8?B?LzZvMkhhZkZBYitmdTdaUXAxNE5BeWZ1ZXJiNWhPQW45WS8zS1VFSSthWFpO?=
 =?utf-8?B?cFdRZVMvd0RlRzVKR1hsSGUrUXFNVDdSbkpieVdOR3k1ZVVTNm55WWQ3SDFV?=
 =?utf-8?B?MHJ4TGFYRGkvQXE5dkxidEI5anFvcFloTUtIb3RLUUp5anBTRjRFbTRHMGVQ?=
 =?utf-8?B?NERkeFRFZ1ZlMWFPKzE3enpJVUxnanY4MXBjWjROenQwdmNmRVUwVnJDNFhu?=
 =?utf-8?B?MjZZWmd3M2U4V2dXejljUVBhTXpoVktJWStQaUxPRHNJcUpBT1Fuck85L2Rq?=
 =?utf-8?B?TitZL1BobmdoZFFxZlVMRWZtckVzaFVJQjVzdjRBbmJucmdIZlRFVzF2WDJT?=
 =?utf-8?B?MDJCT0UwT0hFTHljL3N1cXNxYm9zYU1ldzRTTXVXeWd5WFV5ZGp5R0pOdTVQ?=
 =?utf-8?B?QWJySVl0UWhHUTNPSzBoK3pya0xLYWRycEU1QWhNQTdLMmpUa05qQVNHdEtv?=
 =?utf-8?B?cE1KWE1EbjRyaFEzZ0d6WW9LTzBHblJyQ1NOa1E5YWQ5ZzBLUThlcWdoMjh4?=
 =?utf-8?B?UDVGYTNvMlljd0crQ3JTb0NsSmRwSWxqYmMyYnJzbzlOczcyTjB0WFIrOFds?=
 =?utf-8?B?WmhHWXlmWjBpRTA1WlBnY1NIa0hQQTI5L0JDSDczRFVNTWlhaTFWbmNINFF6?=
 =?utf-8?B?RGc1ek1rbnBDU2kzU25wZnFUbXFGam5QNUVuRHJ2ajg5N01ON0Y1OEpDcHZ3?=
 =?utf-8?B?cTgxdDRGOVhJREdrMFcwZlVobjhuQk1UU0c3TCtoaDlwbTEyWlR3MGM3d0tl?=
 =?utf-8?B?a0o3TWt1dTlxdi9sMHpkMmh1UnRvWi9oU1d0ZFN6Q3Z2TnpBd2trdmhVU1Bu?=
 =?utf-8?B?REgybkMxVm9RZklQZDFQODRuUW9TWjFEbElmMDJWK2JUNC90SEdoeDNGOUZX?=
 =?utf-8?B?Nk5WS21kYUNDTjBzcEhHaGh2Y0JGdFFhNDVWWmliR0JENTN1ZU8xeDgwZ1ZT?=
 =?utf-8?B?WG92SHlmZEJMUEFoSnIrSnVwSUN3bkZ0VjNZOHBVeVQ1QldjaFZIUVk2UXdX?=
 =?utf-8?B?bzVaRmdrdGo4V1VTRGtXdWV1ZUlPbzlJK1FzVDkwVXN4bGZwQTdDejVUNkgr?=
 =?utf-8?B?b3A1OFF0ZUF3MWFPOWx1M3VRd3lxQUdFb24rTWNJL3NSWHNTWGJkRDkwbDJh?=
 =?utf-8?B?TSs5TzkwSHJ3Z0g4N29iL1RiVlVaZ0RhenEvZ1lMcGgwek10TVA2eEJ1cHlX?=
 =?utf-8?B?ekNkcnNRVHhmclI2RVBiM2g0aHU3cjJHMU4yNTVRbjZPaGFqWlJCSmlTUHVq?=
 =?utf-8?B?ZHp1YjRyNEJVNG90L001ODkxRHkrSG5oNzZlNU5hOEZWdE4yeG9VT0JrT2xW?=
 =?utf-8?B?YW8rNkhKanpKaFBSQzVEZ1NvZC9GekJlSWlmd1h5eWwzZmRlQWNJZGxMTi9l?=
 =?utf-8?B?d2oxelh3eDQ4cWFTalVGZ2hLVTBkaXZMRmRJMklvM0YwT1dNYUs2aWpKZkRk?=
 =?utf-8?B?SVIzbkd3NW15amNQenZQcFFON1Y0ZVRYTTBOUzZSbFYzVzNJWkROWXhlTGpQ?=
 =?utf-8?B?cHROZ1dwNUtPZVlHZFRQcEtEdEJxMFM5QjRDbmovUXZUUER0NFlXWkNNcHlC?=
 =?utf-8?B?eWRacW9BcjczQXBJUkU4a3hwVnA5aDhwaHBLYXltVFVZRU1GaWd6OHJkSFIr?=
 =?utf-8?B?eG41NmhabzhEdU92Z2tVUXRFU0tISG1UMzBwLzVJY2RzTWhTRkhlQ21HczZk?=
 =?utf-8?B?bTMvYVByd2RsYTlJSHc5WU8zUXBqNGJxR2YrcDlnOHduRHlsR2M2c0RRaTQr?=
 =?utf-8?B?SVhlenVjd2pCMmFoNDJmLytQclFuMlRNdVdWVjBDNzg0RzhkOWJEamk0WTZk?=
 =?utf-8?B?SGZtRzVhOEVUNTVRZ1EzL1NleDNqOVVNUWZyaXAzMFE3VFhROGw5dXU3SENK?=
 =?utf-8?B?dnI0QXhIUkU3Mlg1Wmc1cG5UWTRDQUVpMVorR3JKNkt2OXN2QWVPUElzMjN3?=
 =?utf-8?B?ZkxBdm0wclNLVHhPdE04T2JOclZhTkcwalNBVHpCalIxZHJhOFFFTXkzSjFV?=
 =?utf-8?B?RjRNVFArbitRUXhVMUtwWm1pT3l6RmE4Q2p6eEdSOVFqTkR1TEFGaXRleTZJ?=
 =?utf-8?B?WlgrekhtT3RjQjZFWHZrbkV4cjF5eWlseFVxcVRJQ0liNWNwZFpRYVFjNzZI?=
 =?utf-8?B?a1NqZ0k0N1lQQ2JPQVc4aTN1WmtYWktyVFE5eFRmN0lsVzA2dzdQMHlnNzMr?=
 =?utf-8?B?L0NuaEozT0RJbCtERkFkYlNLZWt4UXFzSUE1NFordE02NnhyVUs2eGRNOU9a?=
 =?utf-8?B?dDZZa0RIMUZkODM2dG5tenI2amFFR2lwMk1MeTA3cDdCd1Z2cDdnYTU1UkRW?=
 =?utf-8?Q?tvqb7LPWx2kYLhTW3RyxjWu2Oata6VaCDBM5q/AinAYEA?=
X-MS-Exchange-AntiSpam-MessageData-1: 8b6pBLMve2jmsg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3796e3d-fcc3-46f6-b17a-08da194204e8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:27:36.9897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qj6KioJZzVdJFoidWSlz+NihHZ3rvgY/pzhDdhw2ch0Qid8AlIYz+dqMspjVUmSF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3722
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 11:05 schrieb Jani Nikula:
> On Thu, 07 Apr 2022, "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>> That should now be handled by the common dma_resv framework.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: intel-gfx@lists.freedesktop.org
> So, where are the i915 maintainer acks for merging this (and the other
> patches in the series touching i915) via drm-misc-next?
>
> Daniel's Reviewed-by is not an ack to merge outside drm-intel-next.

I had the impression that it would be sufficient.

> We don't merge i915 stuff without passing CI results. Apparently this
> one failed enough machines that the CI had to be stopped entirely.

That was unfortunately partially expected and pointed out by Matthew and 
Daniel before the push.

i915 for some reason extended the usage of the bo->moving fence despite 
the fact we had patches on the mailing list to entirely remove this feature.

I couldn't get any sane CI results for weeks because of this and at some 
point we just had to go ahead and fix the clash in drm-tip.

Sorry for any inconvenience cause by that. I hoped that we fixed all 
cases, but looks like we still missed some.

Regards,
Christian.

>
>
> BR,
> Jani.
>
>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
>>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
>>   drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
>>   6 files changed, 21 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 372bc220faeb..ffde7bc0a95d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>>   /**
>>    * i915_gem_object_get_moving_fence - Get the object's moving fence if any
>>    * @obj: The object whose moving fence to get.
>> + * @fence: The resulting fence
>>    *
>>    * A non-signaled moving fence means that there is an async operation
>>    * pending on the object that needs to be waited on before setting up
>>    * any GPU- or CPU PTEs to the object's pages.
>>    *
>> - * Return: A refcounted pointer to the object's moving fence if any,
>> - * NULL otherwise.
>> + * Return: Negative error code or 0 for success.
>>    */
>> -struct dma_fence *
>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>> +				     struct dma_fence **fence)
>>   {
>> -	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
>> -}
>> -
>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>> -				      struct dma_fence *fence)
>> -{
>> -	struct dma_fence **moving = &i915_gem_to_ttm(obj)->moving;
>> -
>> -	if (*moving == fence)
>> -		return;
>> -
>> -	dma_fence_put(*moving);
>> -	*moving = dma_fence_get(fence);
>> +	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
>> +				      fence);
>>   }
>>   
>>   /**
>> @@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>   				      bool intr)
>>   {
>> -	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
>> -	int ret;
>> -
>>   	assert_object_held(obj);
>> -	if (!fence)
>> -		return 0;
>> -
>> -	ret = dma_fence_wait(fence, intr);
>> -	if (ret)
>> -		return ret;
>> -
>> -	if (fence->error)
>> -		return fence->error;
>> -
>> -	i915_gem_to_ttm(obj)->moving = NULL;
>> -	dma_fence_put(fence);
>> -	return 0;
>> +	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>> +				     intr, MAX_SCHEDULE_TIMEOUT);
>>   }
>>   
>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 02c37fe4a535..e11d82a9f7c3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>>   	i915_gem_object_unpin_pages(obj);
>>   }
>>   
>> -struct dma_fence *
>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
>> -
>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>> -				      struct dma_fence *fence);
>> -
>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>> +				     struct dma_fence **fence);
>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>   				      bool intr);
>>   
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> index 438b8a95b3d1..a10716f4e717 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>>   	return fence;
>>   }
>>   
>> -static int
>> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>> -	  struct i915_deps *deps)
>> -{
>> -	int ret;
>> -
>> -	ret = i915_deps_add_dependency(deps, bo->moving, ctx);
>> -	if (!ret)
>> -		ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
>> -
>> -	return ret;
>> -}
>> -
>>   /**
>>    * i915_ttm_move - The TTM move callback used by i915.
>>    * @bo: The buffer object.
>> @@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>   		struct i915_deps deps;
>>   
>>   		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
>> -		ret = prev_deps(bo, ctx, &deps);
>> +		ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
>>   		if (ret) {
>>   			i915_refct_sgt_put(dst_rsgt);
>>   			return ret;
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> index 4997ed18b6e4..0ad443a90c8b 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>> @@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *gt,
>>   			err = dma_resv_reserve_fences(obj->base.resv, 1);
>>   			if (!err)
>>   				dma_resv_add_fence(obj->base.resv, &rq->fence,
>> -						   DMA_RESV_USAGE_WRITE);
>> -			i915_gem_object_set_moving_fence(obj, &rq->fence);
>> +						   DMA_RESV_USAGE_KERNEL);
>>   			i915_request_put(rq);
>>   		}
>>   		if (err)
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> index 3a6e3f6d239f..dfc34cc2ef8c 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>> @@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
>>   	i915_gem_object_unpin_pages(obj);
>>   	if (rq) {
>>   		dma_resv_add_fence(obj->base.resv, &rq->fence,
>> -				   DMA_RESV_USAGE_WRITE);
>> -		i915_gem_object_set_moving_fence(obj, &rq->fence);
>> +				   DMA_RESV_USAGE_KERNEL);
>>   		i915_request_put(rq);
>>   	}
>>   	i915_gem_object_unlock(obj);
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index 524477d8939e..d077f7b9eaad 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>   	if (err)
>>   		return err;
>>   
>> +	if (vma->obj) {
>> +		err = i915_gem_object_get_moving_fence(vma->obj, &moving);
>> +		if (err)
>> +			return err;
>> +	} else {
>> +		moving = NULL;
>> +	}
>> +
>>   	if (flags & PIN_GLOBAL)
>>   		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>>   
>> -	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
>>   	if (flags & vma->vm->bind_async_flags || moving) {
>>   		/* lock VM */
>>   		err = i915_vm_lock_objects(vma->vm, ww);

