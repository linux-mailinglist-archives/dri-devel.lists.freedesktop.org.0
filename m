Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D283A2883
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 11:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F346E491;
	Thu, 10 Jun 2021 09:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B646E02C;
 Thu, 10 Jun 2021 09:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ES+FlPkM+v78ZNOEa3m25JfnlDEFaj6K/S+ElLt80Ub8A8M6ow/mux5N7VW+psQ1TqDYWxEsNQfBlM/g+2YxbnSu+2YIlZcqJv2xXHdfZVkLTtb3wwhqX6ouETEVBED1PWBDcw8jWwglGzJRg2ZPdS5RuEjhvk+aRu8CSKAM5aVfcqTghX7LPDcBXpcxH1n5cBYPWOlDPvzwIs0BJyf2idw1jxPHfflT+RO2g69SVNHiDU3PzDIBXU682fN4X67BeHcCF7n8JgSZW7+DHMQIMAiqSxTP2O9wAvNZcDKjotaNxWz4Wgj56Cx0ViYHgrbE847f7/S9t3mpkIzuNTCJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9xrMgtpyAz8mOtcLF2JuKFbvqTebF/G8+wCEPut6Ag=;
 b=Eko1V9LTIKev13vwupAttuWQ654CCo2mYjzoXmEh6s67vIvj9EGSVw+o9ppUx13vpL3Gmeml2/P4jip65JAK/+uLzpTvFo7zpDfbECmB5fx93DIknLq9xKZP2iV8DUpPhIkVHI8WrHwV2+Zyaje8nmpxb/H7z+WTP3C/xwTc3mR+Pq8UQKxuNCpVIem7xPupYpuV4beUNkY3IVc4zGTdqs2Kc6YYqqhggpkBn6k2mg9L/w9G8IWnRDswM7mHs5WZaydPVbhqYPFSCe9P+3RgRG+j9q6uOS8YSdDQ79FzqDSHZc5RJ90z7Vt6IGAXxhVm/mB1/WTwoDXJiSpGKdgnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9xrMgtpyAz8mOtcLF2JuKFbvqTebF/G8+wCEPut6Ag=;
 b=fiBJDebZxLbGkjXBLcrhwLFAQw9gaPdS4sYFWArF/9ub777R6dlq5Pfe8n5Nl3L/cVYnlYcMA3A74PC8B7MjbyvWPru9GQV5JGwb2ycLXl43reRaObac/gvqjUEZgvMvxLYIxff/kCdY2P9mACfb0Qrh/fh4UsNgSabzzypVx+4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 09:39:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 09:39:20 +0000
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
Date: Thu, 10 Jun 2021 11:39:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: PR0P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 PR0P264CA0166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 09:39:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb7abfea-0c6f-4a52-80c5-08d92bf39fa9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4126:
X-Microsoft-Antispam-PRVS: <MN2PR12MB412696459F82668C55183A6083359@MN2PR12MB4126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7N+PHX92tt/jbWsiqzVjh4XGLhSSnNAIGJxMqteTSLx6BJerPKgH1bBzvLgIfmBpG7XFJZeW41cuo1vQE6ZLtK5Ljwx0B4/SCE/13fNv3RIUPdIbXxlh0mQNtzEMH7Lk00eDqN4BLbjRyVvQ7C/YWgaJO3CXD+/gI5jsUnFQzibbOKZ/E/y9/r08Fi323HX9G+/WCxuItYU2BN5o2q/Kr2uHDPQlxPuX/Um1WWvpCkq7Kht92ohnjX4zjlyR+JaNo/BJwreZ2GtJt72H4cr72XgWdev6QN8S3xlFNlmIv3p0Wb2af2s4bfX6xU011AC/1eYiebMrCran74rbyQPVJkp2/hYvRhusi4ugE4qIjGi0nBCgcKte7hJdwgpE7Vx6GcJEbEPNz7sPJec64BqiJQvQgVDJacdN/urUfwdDrv2TOroIT0P51zFJUK6hyvBwy8BzGs7hlo83AaepeZLLevX+IEa1qyuj1zAyIUVHnPWHJaqCPZ5Zu5skGgEWmpyorEFruO9GFwDy1IuIGObKt+3ikKeOeByhF+FJnKHMFTfcHtcqfYo5yCYlpQY04mgW6DSrhVkkIKzti24WQ/1Twqgzgb/RbsVZbsAF6zDWPTF9qP/gKOFehfb6JiKmrAMmb7x52Rn6mhtc8UlhqelCxLEGb5kF6D+11eo/7je5KntUK8+7vzpwMC/wAtssBy5X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(376002)(366004)(136003)(66476007)(6486002)(66946007)(4326008)(36756003)(66574015)(38100700002)(186003)(16526019)(53546011)(31696002)(86362001)(66556008)(2616005)(6666004)(54906003)(478600001)(110136005)(5660300002)(316002)(2906002)(8936002)(31686004)(8676002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVVxdTBvbElWSzUyUWVwYlVsRjRPeTFKUTh0YWF2c3NIUlF4TXlrS1Z2TkdC?=
 =?utf-8?B?c0pIb2g5c1RGaE9QOVFCT1BhME50NjJYRGJuZ1VmYlNPSERDS0gvZGpYNThj?=
 =?utf-8?B?YjA5Q2ZLVURob0J1R2lYQTNzNi9TL3kwQXgya0UyUjR0RUFqSnkvZDd0UEM4?=
 =?utf-8?B?NFloaDhFejFNdGhhdG1NS0EzT1dIWEFHQlRpYjRnbFpHbU8rQmpFZUM0MFl3?=
 =?utf-8?B?dmNHdXY2aUZaSGxzeXVFQmNKWVZIMmdRTGVXWXd6emh4N041aGU3QXNsNXIv?=
 =?utf-8?B?UUVrNk0rSTRMd2UwN28rSEJXak05RXlZZkZ1UDhGZXA2MG40VEx0bWVxSEt6?=
 =?utf-8?B?NFFtb0lxLzE4MlJsTyt1amRkZGlxbUxycE00Q0RIUlVVbmYrbDNhMU91NUpS?=
 =?utf-8?B?VU1OZHg4a1o5WDlSYllscjBwYjhTQVVkeUdkb2NIUlFQYmpmbC94ODhSVU05?=
 =?utf-8?B?R0toT0YwVUVERjRnNzhROU04dGI1bVJWSS9rbXhjR0E1bjdVVzBCNEhQek9B?=
 =?utf-8?B?ZEdqamlXbnIzUWhEcXNnOFhDdlhnQ1pTUi9DUEJQQXA3MzB6Ni81WWdpbko4?=
 =?utf-8?B?azJLNjN1eWtBb2FBNHQ3OC9qTHczV3FxTWUyOUNuNmtuK0FYT0QwTDdxOXl6?=
 =?utf-8?B?SFM1ek5JeTB0TVZJUFBCR1NFVzNoWDVTZlFGY2xEak9RWU5nSUZJTXoybS9P?=
 =?utf-8?B?WThxMldjMytGVWJITG1QbWtlVWFSSi8ra2lFUUI1TmpTN1JGT25iTjRzU0Ux?=
 =?utf-8?B?WjMzcTR3eEx3ZHB5SnI2em5rUVUyQU9ZampoNmllTEJpUWpJWm1ZTWt0SnFV?=
 =?utf-8?B?S1FURnl2cXRocGZ0Wjg3NW5ZeU9yV1VzZ043SnMrYXhpM0JuRFU1Ykhkb2U0?=
 =?utf-8?B?M0ZkLytLdkhxVWtnN0I4RlNpUFFSMWtsY1pabGtWdnlRbms3OFc4TXFod0M0?=
 =?utf-8?B?eDNUOUZWV2RoSWNBNXlQU3lUamNoWlg2QnBnVkpra3N6K01vRzV5dWRwa2tP?=
 =?utf-8?B?UjhBa0QxaVpJQnNibVlqb3pUWVp5S1JrRm9NTHhra3BGc0p0bUQrdmdIMi9C?=
 =?utf-8?B?N0IzRk03MEhvMnhZYU9SWVRYSFhvWVNUQUl3dVdWR1p2cTJDTm5LMDBmZTBo?=
 =?utf-8?B?b1VXZEZKM093WjFOa0J4VklHSGlzTVZIZzBIUmE0R09GZkxwZEVJb2ZTYnl0?=
 =?utf-8?B?N3UxTVUrcmwxRWFTSTMvemJRU3FjaXFVQXdJbzNVck9MUEVHTThqWFBuaDhy?=
 =?utf-8?B?dEEzS2JHU0o2bjBoeFRBNTE4bDJYUmFOMWNPQUxTcWs2aTNDNC8zK1R6cFZI?=
 =?utf-8?B?eXFOTWVhaGFHRHRyV2M4dktUSDk2dk9TNUc1b0dzRDNwTUNGc0p0cXhPWC9C?=
 =?utf-8?B?QTYrSXVaL3ZGeUVDZElaY3NsU25kc1pqOHlSbHFFOG94cW5idTNRd1N2aXNn?=
 =?utf-8?B?cGFmL0NEZ0xQMmxhaGhLSGlSWi9kSGVXbmV5S0w2SUVnSHovYzVrU2dRYlRs?=
 =?utf-8?B?c0JTN0tCVE1ad1VtMEkvWGFXcmZtM3NocTFSb0gveXBwQWo2ZmFhV3o3TEc4?=
 =?utf-8?B?ZFFUTlEveHpBZExUREwzTDlGMTUyd2dVVlM4WDlXOEVDL1JhRDBKcXo1V2w3?=
 =?utf-8?B?M0NnS0c0M3ZRcGFRUUIrYUxuNlpEVThobVZWVVM3SFZQWVUrWFM4TlRaaXl0?=
 =?utf-8?B?Z0VmLzlYNktGVWJheWJxb1ZHb0h6TXZYZkVTMTlaTi81ZDd3N3FubnZQcTRN?=
 =?utf-8?B?cU5DbThCb2drelJmQU5mU0hsbWFETlloOFRHOW1LbkpBNmZnYkR4ck9LWjBw?=
 =?utf-8?B?Z0RJdzdTeFhUdjZLSzB3bWFUMUpNakQyYk11YXp6WGxxVHhlallYOHg1Q1Vy?=
 =?utf-8?Q?SbXyrKttwr2rn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7abfea-0c6f-4a52-80c5-08d92bf39fa9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 09:39:20.6978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baVYrKtfTmfWeCbNeeUVzCnFNMPbzuy3adEjiyFBfgaGDZigZeJ1wAsALPqiVtHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
>
> On 09/06/2021 22:29, Jason Ekstrand wrote:
>> Ever since 0eafec6d3244 ("drm/i915: Enable lockless lookup of request
>> tracking via RCU"), the i915 driver has used SLAB_TYPESAFE_BY_RCU (it
>> was called SLAB_DESTROY_BY_RCU at the time) in order to allow RCU on
>> i915_request.  As nifty as SLAB_TYPESAFE_BY_RCU may be, it comes with
>> some serious disclaimers.  In particular, objects can get recycled while
>> RCU readers are still in-flight.  This can be ok if everyone who touches
>> these objects knows about the disclaimers and is careful. However,
>> because we've chosen to use SLAB_TYPESAFE_BY_RCU for i915_request and
>> because i915_request contains a dma_fence, we've leaked
>> SLAB_TYPESAFE_BY_RCU and its whole pile of disclaimers to every driver
>> in the kernel which may consume a dma_fence.
>
> I don't think the part about leaking is true...
>
>> We've tried to keep it somewhat contained by doing most of the hard work
>> to prevent access of recycled objects via dma_fence_get_rcu_safe().
>> However, a quick grep of kernel sources says that, of the 30 instances
>> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
>> It's likely there bear traps in DRM and related subsystems just waiting
>> for someone to accidentally step in them.
>
> ...because dma_fence_get_rcu_safe apears to be about whether the 
> *pointer* to the fence itself is rcu protected, not about the fence 
> object itself.

Yes, exactly that.

>
> If one has a stable pointer to a fence dma_fence_get_rcu is I think 
> enough to deal with SLAB_TYPESAFE_BY_RCU used by i915_request (as dma 
> fence is a base object there). Unless you found a bug in rq field 
> recycling. But access to the dma fence is all tightly controlled so I 
> don't get what leaks.
>
>> This patch series stops us using SLAB_TYPESAFE_BY_RCU for i915_request
>> and, instead, does an RCU-safe slab free via rcu_call().  This should
>> let us keep most of the perf benefits of slab allocation while avoiding
>> the bear traps inherent in SLAB_TYPESAFE_BY_RCU.  It then removes 
>> support
>> for SLAB_TYPESAFE_BY_RCU from dma_fence entirely.
>
> According to the rationale behind SLAB_TYPESAFE_BY_RCU traditional RCU 
> freeing can be a lot more costly so I think we need a clear 
> justification on why this change is being considered.

The problem is that SLAB_TYPESAFE_BY_RCU requires that we use a sequence 
counter to make sure that we don't grab the reference to a reallocated 
dma_fence.

Updating the sequence counter every time we add a fence now means two 
additions writes and one additional barrier for an extremely hot path. 
The extra overhead of RCU freeing is completely negligible compared to that.

The good news is that I think if we are just a bit more clever about our 
handle we can both avoid the sequence counter and keep 
SLAB_TYPESAFE_BY_RCU around.

But this needs more code cleanup and abstracting the sequence counter 
usage in a macro.

Regards,
Christian.


>
> Regards,
>
> Tvrtko
>
>>
>> Note: The last patch is labled DONOTMERGE.  This was at Daniel Vetter's
>> request as we may want to let this bake for a couple releases before we
>> rip out dma_fence_get_rcu_safe entirely.
>>
>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> Jason Ekstrand (5):
>>    drm/i915: Move intel_engine_free_request_pool to i915_request.c
>>    drm/i915: Use a simpler scheme for caching i915_request
>>    drm/i915: Stop using SLAB_TYPESAFE_BY_RCU for i915_request
>>    dma-buf: Stop using SLAB_TYPESAFE_BY_RCU in selftests
>>    DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
>>
>>   drivers/dma-buf/dma-fence-chain.c         |   8 +-
>>   drivers/dma-buf/dma-resv.c                |   4 +-
>>   drivers/dma-buf/st-dma-fence-chain.c      |  24 +---
>>   drivers/dma-buf/st-dma-fence.c            |  27 +---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |   4 +-
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |   8 --
>>   drivers/gpu/drm/i915/i915_active.h        |   4 +-
>>   drivers/gpu/drm/i915/i915_request.c       | 147 ++++++++++++----------
>>   drivers/gpu/drm/i915/i915_request.h       |   2 -
>>   drivers/gpu/drm/i915/i915_vma.c           |   4 +-
>>   include/drm/drm_syncobj.h                 |   4 +-
>>   include/linux/dma-fence.h                 |  50 --------
>>   include/linux/dma-resv.h                  |   4 +-
>>   13 files changed, 110 insertions(+), 180 deletions(-)
>>

