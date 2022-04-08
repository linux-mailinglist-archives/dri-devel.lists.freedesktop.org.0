Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483D94F9332
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515A510ED18;
	Fri,  8 Apr 2022 10:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89CD10E373;
 Fri,  8 Apr 2022 10:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4RHCXM93qrbEWJQcuz1KfYcQ8McrD//wBtIidOLwBl+gouwefI/2X1a4S44ZSvQiTBhK6PQyOLlEGMm+g4ifFgL7iWqQ5RwT2ddzLudDBxKcMAXTqkLp7BkW85QwOWpfILReHORD61er19PyJHIlVbxIYqdiVTBYI8IIIgwRehuMAOw/2cPzX8hsOD9glUTNWbTj0yv2dlSa2FqA0/vdx2F8v5gKjNhUHLdkIbPlfDnI4QpAzi71aZ5ewaVmfCFesa1LKCLNrlWD/WCByPtQ4bxBsjCh/XUR5LW+ov9VimBgRMT6FpIRdLaYWj28dKbwWOBDak5vOQ1Q8JEfDIkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW7HBsN+cPfJmrM+bT8nBd9/d4hmRJqTz4pkQdDvY/Q=;
 b=Vzvlo7wky3R54Bk5vI91YatpT6zWZartnnljZxAohZl8aFPkJJzyo11DSc1aQRhw1YDJ2AqQnRDWOOq2VOuy0vgCKct/V8vAad4ZtwhSzmtlBOno7KF9x8BjGJ9t1T8E+aJi5BWZ6/RJZ/+aiwRTJjnLKJxpyD+Yqj01JykFk2vWKBDM3DrscngypHc9ZIWi2j0Q3MfKkrP4ye8qzdXqgCfAjSxdxgZzXp4nz52mW7RN2qr97UJK+TnJRRJ6GnFlZnJv/83GuUfhQoQb0A+sAWrHD55aLkYmn8gzMSFOLJJsHK64acFh7Z/20cJO9+x7N8mXNRuIVcTWky5DBwSm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW7HBsN+cPfJmrM+bT8nBd9/d4hmRJqTz4pkQdDvY/Q=;
 b=v1ea5VUMnF23VZROwRqS9C7y7mlzF7q9IgvMEO03My3ASIPRmKMZMOTO0VkmMAfvfnl8EfF2lBOzw7FTvP7c2wPdhPwrn8XM3c5qabdUde1hn3yZJztRfmzxbHO8GXSBr7lQDujKTyiG/bwT3bYNhCecbzDQfw74v813SOY+MD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4584.namprd12.prod.outlook.com (2603:10b6:208:24e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 10:41:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 10:41:59 +0000
Message-ID: <cdd56195-ee11-f8fa-05ee-8998cf985876@amd.com>
Date: Fri, 8 Apr 2022 12:41:52 +0200
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
 <87y20ghrmy.fsf@intel.com> <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
 <87v8vjj2yu.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87v8vjj2yu.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::36) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 025c23ff-911d-4307-29e1-08da194c68c4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4584:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB45844E373BF9B20E1A477E0183E99@MN2PR12MB4584.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+9MHWBVwph3u2mLBDQ2lRkuTR8Wbn24xg+cjwC6EJJWXsoDL0M8mRQ2d4y0Z1TmGifn+lYIFY0wbf72hJVIrt36/uVCz2E1e4D2Cx0PO245FBhktZfCIeUPUPQy2vFUjJ9xNljfbYMii/liaiz52Dhed+gw90ubdjRjeCFw+g8spCo524OxH3YlK6RzSvJjOslMBebM/rt4Hlq0kfDiH8+wPNdk954V/4uLTwGe1xPfY0K+fVWgykY4iHrL47DLF0Cdmy4skR6LKMuTLbY6t8Jm0NNp3tQQw1GDZaofKNbJdxfxnHxyPZIJwNPrPIFVIoc3MC/29zUWF2OFdqywa1gXKXMsC15RC8dzQ11sUx7Ssq2H6CKyfumqsIY89eKz6iSqrMCRwfigeEt9yKa515PvQRHOiOUfvtHmCBYsPaDgvnfSlo/3yq/vclCmrkp2iH/4tOfK9NhK2vcjPu1xN+wfnXj/GALO0YKERPxPRT/NOzCQdR/ghUv4Q0EKW5FCNOBDwuqs87AwGjB3haRetbJ1RLX0nBg4aui5tFXyfcGUi2UUDOws4HMHojxy4zYHASxs9vMtrOR9eSu5e95O73byK3g0n/e1gwKjCeahURn+A2LMZvkccy5VuEw36H7SbEEUI5ebAwcSn8WkVYazYSjwz+OlGrUdD2/kiVNjTznMYWgnWLgzNuIbUzJ/da3tDO6t9B+5KpOp0IsAZHtCNu3wlwN8f/h9wm2OqHNgsYpfi7I8FuZY9i5RYUoYjzLj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(186003)(66574015)(83380400001)(31696002)(38100700002)(8936002)(5660300002)(7416002)(2906002)(66556008)(508600001)(6666004)(6512007)(6506007)(316002)(66946007)(4326008)(6486002)(110136005)(8676002)(66476007)(54906003)(86362001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1qVVg0S1RuVmhoM1dHei9uODBLWGJlMW5vSW1xK0RUb2M5YjMwZFJEZWhD?=
 =?utf-8?B?cVlvTFk5c3U0NWh6akROK2J0WmphbkFjbVh6VmMzUkhnZ1VKL0NwTHNDMksr?=
 =?utf-8?B?Q2lLRHB0K2JhWVBiQnRlV3JNc2czTVNiZTNDanorWkU1d0JHZFVvamtiK3NZ?=
 =?utf-8?B?emsxUzcxT1FWbmFHL2tNOFpwSXBveTNCRjdaU3ZlTUcxK2labWh0bU1BSTJn?=
 =?utf-8?B?VlJXUUJkQ0JNNzE5V2U1aE5oU1dpbWpIQkw0aXJUWlg1OHRFc2hrak9HWVda?=
 =?utf-8?B?bjBXVEh1TExuVFRKdGRCQXE0YmY0bGtWRmNJaE9uOTRONG5Td2ZxcEJBRHVv?=
 =?utf-8?B?Vk1FTDVWaWtER3Z1bHZqa0pWbWJkSldjYmVpRzlXa0p6MHg2bUF2UnUwMXgx?=
 =?utf-8?B?OW9TV2Yxc3lXb3QyVERYZjR3b0dUREhNYnFaZXdkNlhaT0dJMWhLTFM0WW5w?=
 =?utf-8?B?ZjVJR2pxVXdFeWpQbmc2SHlqTFo0N0VEekdEdnEya3FQSlJCNlFEdjNpbkNi?=
 =?utf-8?B?aEt2OEs5UGZ0SXJDZEhkL213SjljSkF4em9LSWNCczlXT3ozNW92TXliWVJw?=
 =?utf-8?B?UTBEOWwyVTJ1V2NjUXg1Ny80UVE5eHJndHBsQjlpQjU2M1dhd2pCekkwM0dG?=
 =?utf-8?B?NjVnS3M1cUQvaXJJOTd3MlJ0cjRLSmFLZXcwQUU3RHVaaStjTjFMdERMU05N?=
 =?utf-8?B?UDJ3aFdhbTVjK0NjTjVpYXBLcE9UUHZLWTVFaUl3dHRFejY5L2xhdk5YcG1C?=
 =?utf-8?B?aUc1YXNIWHFXSE9vUFJLcUdmaStNbENiN1N0dloxWERmWWhEVGRvY0pGZjF6?=
 =?utf-8?B?M3A3N3dQRFJVcEdLdWxHVGxpakNyN2JMa2pzbFprblA4aWFnbFJVamVnVnNx?=
 =?utf-8?B?bUdLc1lQQU51Zk96SDRBcFg3ZmNJUUEvaUNRUlFQOFlobXdWZDJUMEJBb3hx?=
 =?utf-8?B?dmMzaDlZR2hLdTd1cDlkWjZSZVJrMzExRnFMVU5UcXk1L3ZOUk9XODlwOXpD?=
 =?utf-8?B?aTNVa083SmErVFFxRGRVVFZXVG45TVZkcUZDZXFJUmNYWU1MaGZ2RzkxcEhH?=
 =?utf-8?B?cTAvYnB4UkxRZEpkZXFWQTJNdzRJek1WZzlZaGRzYTUxTDl0U3B1QVVOM2Zp?=
 =?utf-8?B?S1J5dEVmNGRwNFV5am1Ub2hRaVpQMnBVa1QwRE5VZGpRelVqWENVUnp2V3JX?=
 =?utf-8?B?L1pjdTJhSTVKQzl5WjYwaTdNNzg0K1R5cXlHeVE5cU1JaFhEcTFadVM5K1B3?=
 =?utf-8?B?T2dlNDQvUmFzOHRBRzNvTDNCOU9iV0tXazU1S0N6RE4xTXdQdVl3ekUrRnRM?=
 =?utf-8?B?K2JoU29OR09FZjFPMHNlSU9zamhTbGpnZ0dOb0p6cDdXbUkvck5JNFh3NFlu?=
 =?utf-8?B?UmlJZ0JMczZ1TjFndTd5UEoxVk5hSXlUV2FxanJ5Y0dZL3ozeUdXVm45TUlt?=
 =?utf-8?B?SXkxQnhCcDBYblVSN3NDY2xzaFByVXppeHZSN1grUlRlWjE0TXJUMEVoMDRU?=
 =?utf-8?B?cjkxUVdTM3hpWEViNWs5ZklGTEpxQm1LT0VNbWdET3VnZDZBTVZVQ01FeUNV?=
 =?utf-8?B?UFJGUk5PVTRXaW01R09jd2JBTS9zdUt6OE90NG15Y3Eyck9ZUHVtTlpOdEFH?=
 =?utf-8?B?OU1uamppL2ZVeGNFZzUrRDhxZG0rRUJlMHQ2VlUzeEdnQmg4UzV2RmMrWkVF?=
 =?utf-8?B?RlhzZzQ2dlA0NzR0Z3pvT2liRWJveU5aUWpIdjEvcEx3eWVha0VkZXpPeUt1?=
 =?utf-8?B?eWg0UjNzcGJ1ZVJKM2w1THdQZWFkSnZPTWZYVG84bFJnUGxDYlNJNEw5eTdx?=
 =?utf-8?B?cnN5WHBjOUlRSjVxNldyRWhaVk1LWVR5cW95L3BhNjV2UDJFT2VTSWxlSWxT?=
 =?utf-8?B?OU1lRWYyZVJmdVhjVkNRZFhLOEdZR29nMWpZYzlHUHN1RkhPdVhYRHJZMmVJ?=
 =?utf-8?B?TjhWbTBodkJSaThGYnpBQmVBTWE0cVBRWGVqL1RoVTViTkpoL0RNaS9rdUNY?=
 =?utf-8?B?TncrZ0ZyQ1BoL0ZmWjlNVkJzYWcxOU13WGp0MU5aS3g4b0hKSnRDZFVZS0lI?=
 =?utf-8?B?ckRyL082YkRhVmhaS0Y0OW1EMkRjQWphTjYxalFkbFJNR2NHbGdTMUNISlRh?=
 =?utf-8?B?WEE5YS9GTFRuQkFJUlhFb0NvNWFpZTA1aVBzdG9CblNSbjRZdE1NcDVtbnVB?=
 =?utf-8?B?Qmh3cEZZbzNkeWpxUUQvdUcwaG45aFpYMkNieDgxV05vT0ZqTm9FYTBKc3Nj?=
 =?utf-8?B?aUFZdXU5S2h6dkZ5Q0ljU2FKd2VRM0QvY3Z6Q2pDa0Q2SHNSOFE0YjBUcU8x?=
 =?utf-8?B?ZmVwMlErRFRBbm5ab3plWldvUlZiQlJRTjdvZkMzUUZ4dWowODhIZVhCYVJY?=
 =?utf-8?Q?HcWNj4z83ku3GIMTqbO1Tkrk5QYcTDVFECmPEzCnlCeKn?=
X-MS-Exchange-AntiSpam-MessageData-1: YoqGP+/RamM+Pw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025c23ff-911d-4307-29e1-08da194c68c4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:41:59.5210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNgBWknQyRGm8cAiwCwJ1Va+oKHEfuBXj64nCL8zErO5R8sVnxuW9SXFp5raObBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4584
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



Am 08.04.22 um 12:15 schrieb Jani Nikula:
> On Fri, 08 Apr 2022, Christian König <christian.koenig@amd.com> wrote:
>> Am 08.04.22 um 11:05 schrieb Jani Nikula:
>>> On Thu, 07 Apr 2022, "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> That should now be handled by the common dma_resv framework.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: intel-gfx@lists.freedesktop.org
>>> So, where are the i915 maintainer acks for merging this (and the other
>>> patches in the series touching i915) via drm-misc-next?
>>>
>>> Daniel's Reviewed-by is not an ack to merge outside drm-intel-next.
>> I had the impression that it would be sufficient.
> Please don't assume. Please always ask for explicit acks from the
> maintainers before merging, and record the acks in the commit
> message. This has been standard policy for as long as I remember.

Acked.

> Contrast with us merging non-trivial dma-buf changes via drm-intel-next
> with a Reviewed-by from someone who isn't a dma-buf maintainer, and not
> even bothering to Cc the maintainers.

Exactly that has happened before. And yes you are right we need to get 
more Acks here.

>
>>> We don't merge i915 stuff without passing CI results. Apparently this
>>> one failed enough machines that the CI had to be stopped entirely.
>> That was unfortunately partially expected and pointed out by Matthew and
>> Daniel before the push.
>>
>> i915 for some reason extended the usage of the bo->moving fence despite
>> the fact we had patches on the mailing list to entirely remove this feature.
>>
>> I couldn't get any sane CI results for weeks because of this and at some
>> point we just had to go ahead and fix the clash in drm-tip.
> Did you talk to the maintainers about it?

Well, I noted merge problems on the list a few days before.

I'm still puzzled why this didn't worked as expected. I've tested the 
drm-tip merge result on my build system before the push and it didn't 
showed anything broken.

After the merge not just  i915 broke, the whole core kernel didn't build 
because of a now missing include in futex.h.

There must be something wrong with my setup here (or I just didn't had 
enough sleep). One major problem for me is that I can't run dim on my 
build system, but rather have to push/pull stuff from my laptop over SSH.

My suspicion is that I was testing a stale checkout all the time because 
of this.

Regards,
Christian.

>
>
> BR,
> Jani.
>
>> Sorry for any inconvenience cause by that. I hoped that we fixed all
>> cases, but looks like we still missed some.
>>
>> Regards,
>> Christian.
>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
>>>>    .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
>>>>    .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
>>>>    drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
>>>>    6 files changed, 21 insertions(+), 58 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 372bc220faeb..ffde7bc0a95d 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
>>>>    /**
>>>>     * i915_gem_object_get_moving_fence - Get the object's moving fence if any
>>>>     * @obj: The object whose moving fence to get.
>>>> + * @fence: The resulting fence
>>>>     *
>>>>     * A non-signaled moving fence means that there is an async operation
>>>>     * pending on the object that needs to be waited on before setting up
>>>>     * any GPU- or CPU PTEs to the object's pages.
>>>>     *
>>>> - * Return: A refcounted pointer to the object's moving fence if any,
>>>> - * NULL otherwise.
>>>> + * Return: Negative error code or 0 for success.
>>>>     */
>>>> -struct dma_fence *
>>>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
>>>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>>>> +				     struct dma_fence **fence)
>>>>    {
>>>> -	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
>>>> -}
>>>> -
>>>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>>> -				      struct dma_fence *fence)
>>>> -{
>>>> -	struct dma_fence **moving = &i915_gem_to_ttm(obj)->moving;
>>>> -
>>>> -	if (*moving == fence)
>>>> -		return;
>>>> -
>>>> -	dma_fence_put(*moving);
>>>> -	*moving = dma_fence_get(fence);
>>>> +	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
>>>> +				      fence);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>>>    int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>>    				      bool intr)
>>>>    {
>>>> -	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
>>>> -	int ret;
>>>> -
>>>>    	assert_object_held(obj);
>>>> -	if (!fence)
>>>> -		return 0;
>>>> -
>>>> -	ret = dma_fence_wait(fence, intr);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>> -	if (fence->error)
>>>> -		return fence->error;
>>>> -
>>>> -	i915_gem_to_ttm(obj)->moving = NULL;
>>>> -	dma_fence_put(fence);
>>>> -	return 0;
>>>> +	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>>>> +				     intr, MAX_SCHEDULE_TIMEOUT);
>>>>    }
>>>>    
>>>>    #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> index 02c37fe4a535..e11d82a9f7c3 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> @@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>>>>    	i915_gem_object_unpin_pages(obj);
>>>>    }
>>>>    
>>>> -struct dma_fence *
>>>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
>>>> -
>>>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>>> -				      struct dma_fence *fence);
>>>> -
>>>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>>>> +				     struct dma_fence **fence);
>>>>    int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>>    				      bool intr);
>>>>    
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> index 438b8a95b3d1..a10716f4e717 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>> @@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>>>>    	return fence;
>>>>    }
>>>>    
>>>> -static int
>>>> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>> -	  struct i915_deps *deps)
>>>> -{
>>>> -	int ret;
>>>> -
>>>> -	ret = i915_deps_add_dependency(deps, bo->moving, ctx);
>>>> -	if (!ret)
>>>> -		ret = i915_deps_add_resv(deps, bo->base.resv, ctx);
>>>> -
>>>> -	return ret;
>>>> -}
>>>> -
>>>>    /**
>>>>     * i915_ttm_move - The TTM move callback used by i915.
>>>>     * @bo: The buffer object.
>>>> @@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>>>>    		struct i915_deps deps;
>>>>    
>>>>    		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
>>>> -		ret = prev_deps(bo, ctx, &deps);
>>>> +		ret = i915_deps_add_resv(&deps, bo->base.resv, ctx);
>>>>    		if (ret) {
>>>>    			i915_refct_sgt_put(dst_rsgt);
>>>>    			return ret;
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> index 4997ed18b6e4..0ad443a90c8b 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> @@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt *gt,
>>>>    			err = dma_resv_reserve_fences(obj->base.resv, 1);
>>>>    			if (!err)
>>>>    				dma_resv_add_fence(obj->base.resv, &rq->fence,
>>>> -						   DMA_RESV_USAGE_WRITE);
>>>> -			i915_gem_object_set_moving_fence(obj, &rq->fence);
>>>> +						   DMA_RESV_USAGE_KERNEL);
>>>>    			i915_request_put(rq);
>>>>    		}
>>>>    		if (err)
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> index 3a6e3f6d239f..dfc34cc2ef8c 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>>> @@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
>>>>    	i915_gem_object_unpin_pages(obj);
>>>>    	if (rq) {
>>>>    		dma_resv_add_fence(obj->base.resv, &rq->fence,
>>>> -				   DMA_RESV_USAGE_WRITE);
>>>> -		i915_gem_object_set_moving_fence(obj, &rq->fence);
>>>> +				   DMA_RESV_USAGE_KERNEL);
>>>>    		i915_request_put(rq);
>>>>    	}
>>>>    	i915_gem_object_unlock(obj);
>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>>> index 524477d8939e..d077f7b9eaad 100644
>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>> @@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>>>    	if (err)
>>>>    		return err;
>>>>    
>>>> +	if (vma->obj) {
>>>> +		err = i915_gem_object_get_moving_fence(vma->obj, &moving);
>>>> +		if (err)
>>>> +			return err;
>>>> +	} else {
>>>> +		moving = NULL;
>>>> +	}
>>>> +
>>>>    	if (flags & PIN_GLOBAL)
>>>>    		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>>>>    
>>>> -	moving = vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NULL;
>>>>    	if (flags & vma->vm->bind_async_flags || moving) {
>>>>    		/* lock VM */
>>>>    		err = i915_vm_lock_objects(vma->vm, ww);

