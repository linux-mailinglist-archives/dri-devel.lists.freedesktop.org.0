Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0BC415146
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 22:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74F6EC76;
	Wed, 22 Sep 2021 20:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB66E049;
 Wed, 22 Sep 2021 20:15:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203845939"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="203845939"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 13:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="613672972"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2021 13:15:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 22 Sep 2021 13:15:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 22 Sep 2021 13:15:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 22 Sep 2021 13:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkMMPHxvwKDFHnNhTWjoY3Dsk/MnxIzjum29c4ur6XawoKGjaXJzzrX4OQ2pGr79CADfaXrYhqCzRjhjvFAGC1bwzT1CuMoYvkfDFYRcPJoyVYrgyVzWPJKqQbnCs1yPevC18xR0YI7RpALRZ5eK1hZzp0oI16Y3Bnp+u4RpW5Y+FROiZ9QGUYhQk8c45q78mY6sVbBK9IT5Ufk9teEXmUfI0MYGKhJiwHsu52qGCgFoLr7ETgqDOyus0BcMpn5dZlD9yR3HwtUv1x7SOzVQgl1MkOHc3ZiS9k3LWYmqeRqVwCzMd6vgptN9WKGwM2Izjo1ffm1PTwfxzjeI3TF7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=A3YkxkHJFOWFNtwWUO/NZvVtJs0zu8ZBu9Kxi01fWh8=;
 b=MhaEoJ2i4OesupUyUafx7sJiYBFI3G+eBEYQMGoPh34D0EPMw457gkJpkZ9fVrgfewq56V6pCCcPZ8lauA56qRfghiX3vel9LFJtf4lLSvzQ1e9muBGZvg9xc1y8aeEIsIGpkIJVJL9vMkwqiUGqhXSfsgO/cFA08Cuv8n4jfcuazy4N1OV2vtLvUkKw96y9Wl2Iw4TLV+3We6TB5lki74GkorVi0zMWbRlQ0LLzCoCg8jrIdkEsa1+amiJflPq74CJDi7oKvuMbSpiL8QyUDFQhsURfZYysGCKvLARL//vs3pXGYkcdAW0Ch6EvYYMTmt1gDJFZr+oXpkZc8I2fLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3YkxkHJFOWFNtwWUO/NZvVtJs0zu8ZBu9Kxi01fWh8=;
 b=IrdJANTBFVmQFcDMyjqMmkVPndx7jTO8/P3CYUlQVx5aXp0zVvRY+1NDE3AkRjC/wPni0/YVu9WZMGjsx6+/QFm1aT+cpeVM93fJLrG1sgbdmznxOzzwlmKNT2qvy8bEuVS/qcImNJHLc3zfOuvkZPTlVMKFvTq2xJ4Z6K+DVak=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 20:15:48 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 20:15:48 +0000
Subject: Re: [Intel-gfx] [PATCH 15/27] drm/i915/guc: Implement multi-lrc
 submission
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-16-matthew.brost@intel.com>
 <c840bf5b-c5e9-872d-e04f-2dfe1852e555@intel.com>
 <20210922162555.GA4456@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a493356d-9676-e864-bd3b-38d9a1eb498a@intel.com>
Date: Wed, 22 Sep 2021 13:15:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210922162555.GA4456@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW3PR06CA0022.namprd06.prod.outlook.com (2603:10b6:303:2a::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 20:15:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 125ef160-d772-43dd-8850-08d97e05c480
X-MS-TrafficTypeDiagnostic: PH0PR11MB5579:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB557932BEF90891A69D53CFFEBDA29@PH0PR11MB5579.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R+YzYsRnRYq+14yaegqmF6Ax1QTrmWJEnE6Hg+P210q20L5wOllIiB6RTtnGmNFrn2X1duQRHTlF3btIJaT8dJ5OwF2zGxiaxdF+SGNiKCPdw+azPF2pm0MlY2fpzv2SJF1RaxDuNYf2lcJuqv/o5w5ZnqfHTx+0T8rgbX8meBUkyklXKUDr2VyqI1oQ9XAmx85kRwoPdHwrJHQ6X+sh2cE0y6ZkqQQP9hmpCUxqaFDkMY89EqZgxMMqa0CpG42gv+CJWFQKX6aqWVaDrK2WwYJhl0ztNx07tEncx+wvubvQH/SUv8jayAwDCJScy5dnWwgEy+sLmWG75ktmx6Bi+FqEAprZ6O6Fu0XuEk+mavJXxH1mzXBHDAB0zJfevmfZWe5psemr7fGMOCsNIqRqgoQH3JMv9cIaSoqswifZT3YnbBlqITqBqSaUwJsDY+M9ei2ZtHMbSfesBWSD7p9UfmN8u/0wPAjRWFx6bFNn4cDfqWsWdPdcSSqbwDTaAtwL23yEQsGtxlb0kOi903/eKC+OC4DmI1aqHf0D345Y16u0sU3K8apdKMkTgDLSE5U4TUVt0HTGqou7uHNlcIOcVkQSNqC3fB0CY2d9wPzP909GvkXpBCFcyk7/L12TBzSkrlnWoOplqWkqlRcmytHAL681fGyoWsgXLd/tzhiAmPXPE7lgRFbKO/Y87Bl+5IHW5Gvsp5AnM9DsAPX6YkinRhLzHQH69d2F0eBwp46XKY0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66556008)(30864003)(508600001)(36756003)(107886003)(31696002)(8936002)(83380400001)(26005)(86362001)(186003)(316002)(956004)(6486002)(66476007)(66946007)(6636002)(8676002)(38100700002)(37006003)(53546011)(2906002)(4326008)(31686004)(16576012)(6862004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ZxZ2c1UE9xQ3p1MC9iUnlYMlI4UlBvTVYyVmUwRDJOQlpWNXZKeVJOZ3BT?=
 =?utf-8?B?MUJlMWVYbG1uNkFveDZHQk5GNFNIOGp6L2RDamE4M3IxRHJnMkFvTW1aMjQz?=
 =?utf-8?B?UHZYQmRRTVFaSDVJWmpwQ0VwdUI1RkY0T1Z4d2dUY3grSmM1eGRicHE3YU01?=
 =?utf-8?B?Y3lheXE3TzJuNUJqbnFva0tKbEhLMENIN25ydXpWWUE4OHBzZnJrTU9qZC9h?=
 =?utf-8?B?bFoxWHJrOGNIYTRYMngzc3BMNE9CWVNhK3JHQ1M5bGZNZFpraUc4YmdwUVlB?=
 =?utf-8?B?aTBDSXBQMVVSTSsvZDNvaGJ3c0g5WEluWStZZURuSDkwME1RbzExR3lPWnVz?=
 =?utf-8?B?c0VxdHpZVVk1MTM2cnhmT1E2YTlxMGV5NHpnUGhtU0VEN2xmWERTWm9La25k?=
 =?utf-8?B?ZFNnZHlhMjFvR2VEZVUyK084ZmZRdUFJb011c2pteEt0ZkVJOFY3Vy94QmNz?=
 =?utf-8?B?eEFQNkczNlNCSnl3UTJYbnNFVkZhdksvRzRReS9IUU9NY2tvV0RjWGNYN00y?=
 =?utf-8?B?cGxqdnQ0a2NScXhWL2N0dkt3M0JGZExrYnYxSDJJNk8vMnUxZHA4Y213QXZh?=
 =?utf-8?B?YlVhSVRUNGJlL0F1aEVSUHNtMlYyejlUVEVhT3ovN20zcXhSWS84SmxwRkdn?=
 =?utf-8?B?dFBxTjR0RnR5UXB0YWwrUmpEY05QWmpKZW1rd2FqcnZpeDlCRlIxazlNMTR1?=
 =?utf-8?B?M055NityWmZ0dFp4emtkVXRTQmhUckFvWlVva2lZcmN4cSs4eXZPOTAzRnZ6?=
 =?utf-8?B?N1ZuZXlOR3ZTVUVsQk1QZWM0amZ1WVhCRnpza3QxTFFtaUVFcHQ3aHMyREx3?=
 =?utf-8?B?ZTNPTCtEVU9wbit0QWFRUjVoSnl5eTJxeUQvTVVPZ0EyZ285SmpacDdIQjlU?=
 =?utf-8?B?ZW1YVDBmSDFNaUVEVGxWd3dFL2d6SnU0NGQ4WHN2UVRvZ2ltRlJxOVkwMU5y?=
 =?utf-8?B?NUlJRmFsSUpuT1FWSzN6VmpvNHh6WWxoVnpSdXVkVndwSHc0Vzg0WHl2NCtM?=
 =?utf-8?B?cXh1clhkVHBFL0REd2gyd0FYOUJpZUxHdHRxekFDWXZOeUM2ZEg1bnJwdDd6?=
 =?utf-8?B?TW5jYUhQc0c3cVBOVUJHNGhXTmdlZjB4cVh6NG1vZmNZUmlKd3hyeE54T2Rv?=
 =?utf-8?B?RitjSm9XMTRSQWJNZDVXRGxGTHBmcGxuRTRGN0xFU2dONUNMRGR6MXZ2VXF6?=
 =?utf-8?B?T2J5Z011YlFkaHVlbUFzNXZFZXBoZUJvckNxbGQwMnM0Znc4TDh5ck01emxX?=
 =?utf-8?B?bmNyc2xHWkJzWTJpUmpkRDdKdFZQOVlBMTREQzRLY28rM1BOcUNCMU1BcEgy?=
 =?utf-8?B?UFJzbThDRHg2UjFBZno3VUkxTm5NNWtBNFM2TlRJMEtlbnloQW9LODBVdlVK?=
 =?utf-8?B?MFBhelcwV21IMGJKelR3Zk5SS3ZZL0hnc21TWDJMSEdiOXNkU2FpS25TUTZq?=
 =?utf-8?B?cCsvZlE5cUcwVXlzK0FFSjB1QjhoRVhaVXF6ZS9hYVNmNVJPSmJicUVQUWdx?=
 =?utf-8?B?YzRBa0NadDFBMUt5SGloZXdQZWZzdEhYNEVhWkRqSEJKTUE3K1lYNmFtVXV0?=
 =?utf-8?B?am1Za1dMaitTS1ljbVN5dE01NzMvOFlQM0VNakp1MndabnlFay9xWHMybExz?=
 =?utf-8?B?Sk1CWi9iaWErWUJnMllDM3lSa0I4R2tFQXUrb3VlWXlVWnRnYUcxOGdhVGJa?=
 =?utf-8?B?NFFpMXRId1ZVV3dLR3Z3d0hOQ0Y3dXp5eFVCNDhRelllcldMeDR3UHpWd1N1?=
 =?utf-8?Q?EK8WZqAR111oF5vtW+e/bD3457Q/P9TaasmZjYb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 125ef160-d772-43dd-8850-08d97e05c480
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 20:15:48.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ANHAhhfwhiG8efXETVjDmycebhvPjInnI2ZlqwLi5o5l/JvQuhQqrirbcO0NC4PLvOct/CHLp7xp7Y/xNMY+L37ZtqQ5/j/ipGQhqua/QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5579
X-OriginatorOrg: intel.com
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

On 9/22/2021 09:25, Matthew Brost wrote:
> On Mon, Sep 20, 2021 at 02:48:52PM -0700, John Harrison wrote:
>> On 8/20/2021 15:44, Matthew Brost wrote:
>>> Implement multi-lrc submission via a single workqueue entry and single
>>> H2G. The workqueue entry contains an updated tail value for each
>>> request, of all the contexts in the multi-lrc submission, and updates
>>> these values simultaneously. As such, the tasklet and bypass path have
>>> been updated to coalesce requests into a single submission.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  21 ++
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   8 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  24 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   6 +-
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 312 +++++++++++++++---
>>>    drivers/gpu/drm/i915/i915_request.h           |   8 +
>>>    6 files changed, 317 insertions(+), 62 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> index fbfcae727d7f..879aef662b2e 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> @@ -748,3 +748,24 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
>>>    		}
>>>    	}
>>>    }
>>> +
>>> +void intel_guc_write_barrier(struct intel_guc *guc)
>>> +{
>>> +	struct intel_gt *gt = guc_to_gt(guc);
>>> +
>>> +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
>>> +		GEM_BUG_ON(guc->send_regs.fw_domains);
>> Granted, this patch is just moving code from one file to another not
>> changing it. However, I think it would be worth adding a blank line in here.
>> Otherwise the 'this register' comment below can be confusingly read as
>> referring to the send_regs.fw_domain entry above.
>>
>> And maybe add a comment why it is a bug for the send_regs value to be set?
>> I'm not seeing any obvious connection between it and the reset of this code.
>>
> Can add a blank line. I think the GEM_BUG_ON relates to being able to
> use intel_uncore_write_fw vs intel_uncore_write. Can add comment.
>
>>> +		/*
>>> +		 * This register is used by the i915 and GuC for MMIO based
>>> +		 * communication. Once we are in this code CTBs are the only
>>> +		 * method the i915 uses to communicate with the GuC so it is
>>> +		 * safe to write to this register (a value of 0 is NOP for MMIO
>>> +		 * communication). If we ever start mixing CTBs and MMIOs a new
>>> +		 * register will have to be chosen.
>>> +		 */
>>> +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
>>> +	} else {
>>> +		/* wmb() sufficient for a barrier if in smem */
>>> +		wmb();
>>> +	}
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index 3f95b1b4f15c..0ead2406d03c 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -37,6 +37,12 @@ struct intel_guc {
>>>    	/* Global engine used to submit requests to GuC */
>>>    	struct i915_sched_engine *sched_engine;
>>>    	struct i915_request *stalled_request;
>>> +	enum {
>>> +		STALL_NONE,
>>> +		STALL_REGISTER_CONTEXT,
>>> +		STALL_MOVE_LRC_TAIL,
>>> +		STALL_ADD_REQUEST,
>>> +	} submission_stall_reason;
>>>    	/* intel_guc_recv interrupt related state */
>>>    	spinlock_t irq_lock;
>>> @@ -332,4 +338,6 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc);
>>>    void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>>> +void intel_guc_write_barrier(struct intel_guc *guc);
>>> +
>>>    #endif
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> index 20c710a74498..10d1878d2826 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> @@ -377,28 +377,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>>>    	return ++ct->requests.last_fence;
>>>    }
>>> -static void write_barrier(struct intel_guc_ct *ct)
>>> -{
>>> -	struct intel_guc *guc = ct_to_guc(ct);
>>> -	struct intel_gt *gt = guc_to_gt(guc);
>>> -
>>> -	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
>>> -		GEM_BUG_ON(guc->send_regs.fw_domains);
>>> -		/*
>>> -		 * This register is used by the i915 and GuC for MMIO based
>>> -		 * communication. Once we are in this code CTBs are the only
>>> -		 * method the i915 uses to communicate with the GuC so it is
>>> -		 * safe to write to this register (a value of 0 is NOP for MMIO
>>> -		 * communication). If we ever start mixing CTBs and MMIOs a new
>>> -		 * register will have to be chosen.
>>> -		 */
>>> -		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
>>> -	} else {
>>> -		/* wmb() sufficient for a barrier if in smem */
>>> -		wmb();
>>> -	}
>>> -}
>>> -
>>>    static int ct_write(struct intel_guc_ct *ct,
>>>    		    const u32 *action,
>>>    		    u32 len /* in dwords */,
>>> @@ -468,7 +446,7 @@ static int ct_write(struct intel_guc_ct *ct,
>>>    	 * make sure H2G buffer update and LRC tail update (if this triggering a
>>>    	 * submission) are visible before updating the descriptor tail
>>>    	 */
>>> -	write_barrier(ct);
>>> +	intel_guc_write_barrier(ct_to_guc(ct));
>>>    	/* update local copies */
>>>    	ctb->tail = tail;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> index 0e600a3b8f1e..6cd26dc060d1 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> @@ -65,12 +65,14 @@
>>>    #define   WQ_TYPE_PSEUDO		(0x2 << WQ_TYPE_SHIFT)
>>>    #define   WQ_TYPE_INORDER		(0x3 << WQ_TYPE_SHIFT)
>>>    #define   WQ_TYPE_NOOP			(0x4 << WQ_TYPE_SHIFT)
>>> -#define WQ_TARGET_SHIFT			10
>>> +#define   WQ_TYPE_MULTI_LRC		(0x5 << WQ_TYPE_SHIFT)
>>> +#define WQ_TARGET_SHIFT			8
>>>    #define WQ_LEN_SHIFT			16
>>>    #define WQ_NO_WCFLUSH_WAIT		(1 << 27)
>>>    #define WQ_PRESENT_WORKLOAD		(1 << 28)
>>> -#define WQ_RING_TAIL_SHIFT		20
>>> +#define WQ_GUC_ID_SHIFT			0
>>> +#define WQ_RING_TAIL_SHIFT		18
>> Presumably all of these API changes are not actually new? They really came
>> in with the reset of the v40 re-write? It's just that this is the first time
>> we are using them and therefore need to finally update the defines?
>>
> Yes.
>
>>>    #define WQ_RING_TAIL_MAX		0x7FF	/* 2^11 QWords */
>>>    #define WQ_RING_TAIL_MASK		(WQ_RING_TAIL_MAX << WQ_RING_TAIL_SHIFT)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index e9dfd43d29a0..b107ad095248 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -391,6 +391,29 @@ __get_process_desc(struct intel_context *ce)
>>>    		   LRC_STATE_OFFSET) / sizeof(u32)));
>>>    }
>>> +static u32 *get_wq_pointer(struct guc_process_desc *desc,
>>> +			   struct intel_context *ce,
>>> +			   u32 wqi_size)
>>> +{
>>> +	/*
>>> +	 * Check for space in work queue. Caching a value of head pointer in
>>> +	 * intel_context structure in order reduce the number accesses to shared
>>> +	 * GPU memory which may be across a PCIe bus.
>>> +	 */
>>> +#define AVAILABLE_SPACE	\
>>> +	CIRC_SPACE(ce->guc_wqi_tail, ce->guc_wqi_head, GUC_WQ_SIZE)
>>> +	if (wqi_size > AVAILABLE_SPACE) {
>>> +		ce->guc_wqi_head = READ_ONCE(desc->head);
>>> +
>>> +		if (wqi_size > AVAILABLE_SPACE)
>>> +			return NULL;
>>> +	}
>>> +#undef AVAILABLE_SPACE
>>> +
>>> +	return ((u32 *)__get_process_desc(ce)) +
>>> +		((WQ_OFFSET + ce->guc_wqi_tail) / sizeof(u32));
>>> +}
>>> +
>>>    static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>>>    {
>>>    	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>>> @@ -547,10 +570,10 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>>>    static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
>>> -static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>> +static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    {
>>>    	int err = 0;
>>> -	struct intel_context *ce = rq->context;
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>>    	u32 action[3];
>>>    	int len = 0;
>>>    	u32 g2h_len_dw = 0;
>>> @@ -571,26 +594,17 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>>>    	GEM_BUG_ON(context_guc_id_invalid(ce));
>>> -	/*
>>> -	 * Corner case where the GuC firmware was blown away and reloaded while
>>> -	 * this context was pinned.
>>> -	 */
>>> -	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
>>> -		err = guc_lrc_desc_pin(ce, false);
>>> -		if (unlikely(err))
>>> -			return err;
>>> -	}
>>> -
>>>    	spin_lock(&ce->guc_state.lock);
>>>    	/*
>>>    	 * The request / context will be run on the hardware when scheduling
>>> -	 * gets enabled in the unblock.
>>> +	 * gets enabled in the unblock. For multi-lrc we still submit the
>>> +	 * context to move the LRC tails.
>>>    	 */
>>> -	if (unlikely(context_blocked(ce)))
>>> +	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
>>>    		goto out;
>>> -	enabled = context_enabled(ce);
>>> +	enabled = context_enabled(ce) || context_blocked(ce);
>> Would be better to say '|| is_parent(ce)' rather than blocked? The reason
>> for reason for claiming enabled when not is because it's a multi-LRC parent,
>> right? Or can there be a parent that is neither enabled nor blocked for
>> which we don't want to do the processing? But why would that make sense/be
>> possible?
>>
> No. If it is parent and blocked we want to submit the enable but not
> enable submission. In the non-multi-lrc case the submit has already been
> done by the i915 (moving lrc tail).
>
>>>    	if (!enabled) {
>>>    		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>>> @@ -609,6 +623,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    		trace_intel_context_sched_enable(ce);
>>>    		atomic_inc(&guc->outstanding_submission_g2h);
>>>    		set_context_enabled(ce);
>>> +
>>> +		/*
>>> +		 * Without multi-lrc KMD does the submission step (moving the
>>> +		 * lrc tail) so enabling scheduling is sufficient to submit the
>>> +		 * context. This isn't the case in multi-lrc submission as the
>>> +		 * GuC needs to move the tails, hence the need for another H2G
>>> +		 * to submit a multi-lrc context after enabling scheduling.
>>> +		 */
>>> +		if (intel_context_is_parent(ce)) {
>>> +			action[0] = INTEL_GUC_ACTION_SCHED_CONTEXT;
>>> +			err = intel_guc_send_nb(guc, action, len - 1, 0);
>>> +		}
>>>    	} else if (!enabled) {
>>>    		clr_context_pending_enable(ce);
>>>    		intel_context_put(ce);
>>> @@ -621,6 +647,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    	return err;
>>>    }
>>> +static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>> +{
>>> +	int ret = __guc_add_request(guc, rq);
>>> +
>>> +	if (unlikely(ret == -EBUSY)) {
>>> +		guc->stalled_request= rq;
>>> +		guc->submission_stall_reason = STALL_ADD_REQUEST;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    static void guc_set_lrc_tail(struct i915_request *rq)
>>>    {
>>>    	rq->context->lrc_reg_state[CTX_RING_TAIL] =
>>> @@ -632,6 +670,127 @@ static int rq_prio(const struct i915_request *rq)
>>>    	return rq->sched.attr.priority;
>>>    }
>>> +static bool is_multi_lrc_rq(struct i915_request *rq)
>>> +{
>>> +	return intel_context_is_child(rq->context) ||
>>> +		intel_context_is_parent(rq->context);
>>> +}
>>> +
>>> +static bool can_merge_rq(struct i915_request *rq,
>>> +			 struct i915_request *last)
>>> +{
>>> +	return request_to_scheduling_context(rq) ==
>>> +		request_to_scheduling_context(last);
>>> +}
>>> +
>>> +static u32 wq_space_until_wrap(struct intel_context *ce)
>>> +{
>>> +	return (GUC_WQ_SIZE - ce->guc_wqi_tail);
>>> +}
>>> +
>>> +static void write_wqi(struct guc_process_desc *desc,
>>> +		      struct intel_context *ce,
>>> +		      u32 wqi_size)
>>> +{
>>> +	/*
>>> +	 * Ensure WQE are visible before updating tail
>> WQE or WQI?
>>
> WQI (work queue instance) is the convention used but I actually like WQE
> (work queue entry) better. Will change the name to WQE everywhere.
I thought it was Work Queue Item. Which is basically the same as entry. 
Ether works but simpler just to change this one instance to WQI. And 
maybe make sure the abbreviation is actually written out in full 
somewhere to be clear? I think patch #12 is adding these fields to the 
ce, maybe update the comments to explain what wqi means.

John.

>   
>>> +	 */
>>> +	intel_guc_write_barrier(ce_to_guc(ce));
>>> +
>>> +	ce->guc_wqi_tail = (ce->guc_wqi_tail + wqi_size) & (GUC_WQ_SIZE - 1);
>>> +	WRITE_ONCE(desc->tail, ce->guc_wqi_tail);
>>> +}
>>> +
>>> +static int guc_wq_noop_append(struct intel_context *ce)
>>> +{
>>> +	struct guc_process_desc *desc = __get_process_desc(ce);
>>> +	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
>>> +
>>> +	if (!wqi)
>>> +		return -EBUSY;
>>> +
>>> +	*wqi = WQ_TYPE_NOOP |
>>> +		((wq_space_until_wrap(ce) / sizeof(u32) - 1) << WQ_LEN_SHIFT);
>> This should have a BUG_ON check that the requested size fits within the
>> WQ_LEN field?
>>
> I could add that.
>   
>> Indeed, would be better to use the FIELD macros as they do that kind of
>> thing for you.
>>
> Yes, they do. I forget how they work, will figure this out and use the
> macros.
>   
>>> +	ce->guc_wqi_tail = 0;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __guc_wq_item_append(struct i915_request *rq)
>>> +{
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>> +	struct intel_context *child;
>>> +	struct guc_process_desc *desc = __get_process_desc(ce);
>>> +	unsigned int wqi_size = (ce->guc_number_children + 4) *
>>> +		sizeof(u32);
>>> +	u32 *wqi;
>>> +	int ret;
>>> +
>>> +	/* Ensure context is in correct state updating work queue */
>>> +	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>>> +	GEM_BUG_ON(context_guc_id_invalid(ce));
>>> +	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
>>> +	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
>>> +
>>> +	/* Insert NOOP if this work queue item will wrap the tail pointer. */
>>> +	if (wqi_size > wq_space_until_wrap(ce)) {
>>> +		ret = guc_wq_noop_append(ce);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	wqi = get_wq_pointer(desc, ce, wqi_size);
>>> +	if (!wqi)
>>> +		return -EBUSY;
>>> +
>>> +	*wqi++ = WQ_TYPE_MULTI_LRC |
>>> +		((wqi_size / sizeof(u32) - 1) << WQ_LEN_SHIFT);
>>> +	*wqi++ = ce->lrc.lrca;
>>> +	*wqi++ = (ce->guc_id.id << WQ_GUC_ID_SHIFT) |
>>> +		 ((ce->ring->tail / sizeof(u64)) << WQ_RING_TAIL_SHIFT);
>> As above, would be better to use FIELD macros instead of manual shifting.
>>
> Will do.
>
> Matt
>
>> John.
>>
>>
>>> +	*wqi++ = 0;	/* fence_id */
>>> +	for_each_child(ce, child)
>>> +		*wqi++ = child->ring->tail / sizeof(u64);
>>> +
>>> +	write_wqi(desc, ce, wqi_size);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int guc_wq_item_append(struct intel_guc *guc,
>>> +			      struct i915_request *rq)
>>> +{
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>> +	int ret = 0;
>>> +
>>> +	if (likely(!intel_context_is_banned(ce))) {
>>> +		ret = __guc_wq_item_append(rq);
>>> +
>>> +		if (unlikely(ret == -EBUSY)) {
>>> +			guc->stalled_request = rq;
>>> +			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
>>> +		}
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static bool multi_lrc_submit(struct i915_request *rq)
>>> +{
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>> +
>>> +	intel_ring_set_tail(rq->ring, rq->tail);
>>> +
>>> +	/*
>>> +	 * We expect the front end (execbuf IOCTL) to set this flag on the last
>>> +	 * request generated from a multi-BB submission. This indicates to the
>>> +	 * backend (GuC interface) that we should submit this context thus
>>> +	 * submitting all the requests generated in parallel.
>>> +	 */
>>> +	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
>>> +		intel_context_is_banned(ce);
>>> +}
>>> +
>>>    static int guc_dequeue_one_context(struct intel_guc *guc)
>>>    {
>>>    	struct i915_sched_engine * const sched_engine = guc->sched_engine;
>>> @@ -645,7 +804,17 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>>>    	if (guc->stalled_request) {
>>>    		submit = true;
>>>    		last = guc->stalled_request;
>>> -		goto resubmit;
>>> +
>>> +		switch (guc->submission_stall_reason) {
>>> +		case STALL_REGISTER_CONTEXT:
>>> +			goto register_context;
>>> +		case STALL_MOVE_LRC_TAIL:
>>> +			goto move_lrc_tail;
>>> +		case STALL_ADD_REQUEST:
>>> +			goto add_request;
>>> +		default:
>>> +			MISSING_CASE(guc->submission_stall_reason);
>>> +		}
>>>    	}
>>>    	while ((rb = rb_first_cached(&sched_engine->queue))) {
>>> @@ -653,8 +822,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>>>    		struct i915_request *rq, *rn;
>>>    		priolist_for_each_request_consume(rq, rn, p) {
>>> -			if (last && rq->context != last->context)
>>> -				goto done;
>>> +			if (last && !can_merge_rq(rq, last))
>>> +				goto register_context;
>>>    			list_del_init(&rq->sched.link);
>>> @@ -662,33 +831,84 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
>>>    			trace_i915_request_in(rq, 0);
>>>    			last = rq;
>>> -			submit = true;
>>> +
>>> +			if (is_multi_lrc_rq(rq)) {
>>> +				/*
>>> +				 * We need to coalesce all multi-lrc requests in
>>> +				 * a relationship into a single H2G. We are
>>> +				 * guaranteed that all of these requests will be
>>> +				 * submitted sequentially.
>>> +				 */
>>> +				if (multi_lrc_submit(rq)) {
>>> +					submit = true;
>>> +					goto register_context;
>>> +				}
>>> +			} else {
>>> +				submit = true;
>>> +			}
>>>    		}
>>>    		rb_erase_cached(&p->node, &sched_engine->queue);
>>>    		i915_priolist_free(p);
>>>    	}
>>> -done:
>>> +
>>> +register_context:
>>>    	if (submit) {
>>> -		guc_set_lrc_tail(last);
>>> -resubmit:
>>> +		struct intel_context *ce = request_to_scheduling_context(last);
>>> +
>>> +		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
>>> +			     !intel_context_is_banned(ce))) {
>>> +			ret = guc_lrc_desc_pin(ce, false);
>>> +			if (unlikely(ret == -EPIPE)) {
>>> +				goto deadlk;
>>> +			} else if (ret == -EBUSY) {
>>> +				guc->stalled_request = last;
>>> +				guc->submission_stall_reason =
>>> +					STALL_REGISTER_CONTEXT;
>>> +				goto schedule_tasklet;
>>> +			} else if (ret != 0) {
>>> +				GEM_WARN_ON(ret);	/* Unexpected */
>>> +				goto deadlk;
>>> +			}
>>> +		}
>>> +
>>> +move_lrc_tail:
>>> +		if (is_multi_lrc_rq(last)) {
>>> +			ret = guc_wq_item_append(guc, last);
>>> +			if (ret == -EBUSY) {
>>> +				goto schedule_tasklet;
>>> +			} else if (ret != 0) {
>>> +				GEM_WARN_ON(ret);	/* Unexpected */
>>> +				goto deadlk;
>>> +			}
>>> +		} else {
>>> +			guc_set_lrc_tail(last);
>>> +		}
>>> +
>>> +add_request:
>>>    		ret = guc_add_request(guc, last);
>>> -		if (unlikely(ret == -EPIPE))
>>> +		if (unlikely(ret == -EPIPE)) {
>>> +			goto deadlk;
>>> +		} else if (ret == -EBUSY) {
>>> +			goto schedule_tasklet;
>>> +		} else if (ret != 0) {
>>> +			GEM_WARN_ON(ret);	/* Unexpected */
>>>    			goto deadlk;
>>> -		else if (ret == -EBUSY) {
>>> -			tasklet_schedule(&sched_engine->tasklet);
>>> -			guc->stalled_request = last;
>>> -			return false;
>>>    		}
>>>    	}
>>>    	guc->stalled_request = NULL;
>>> +	guc->submission_stall_reason = STALL_NONE;
>>>    	return submit;
>>>    deadlk:
>>>    	sched_engine->tasklet.callback = NULL;
>>>    	tasklet_disable_nosync(&sched_engine->tasklet);
>>>    	return false;
>>> +
>>> +schedule_tasklet:
>>> +	tasklet_schedule(&sched_engine->tasklet);
>>> +	return false;
>>>    }
>>>    static void guc_submission_tasklet(struct tasklet_struct *t)
>>> @@ -1227,10 +1447,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>>>    	trace_i915_request_in(rq, 0);
>>> -	guc_set_lrc_tail(rq);
>>> -	ret = guc_add_request(guc, rq);
>>> -	if (ret == -EBUSY)
>>> -		guc->stalled_request = rq;
>>> +	if (is_multi_lrc_rq(rq)) {
>>> +		if (multi_lrc_submit(rq)) {
>>> +			ret = guc_wq_item_append(guc, rq);
>>> +			if (!ret)
>>> +				ret = guc_add_request(guc, rq);
>>> +		}
>>> +	} else {
>>> +		guc_set_lrc_tail(rq);
>>> +		ret = guc_add_request(guc, rq);
>>> +	}
>>>    	if (unlikely(ret == -EPIPE))
>>>    		disable_submission(guc);
>>> @@ -1238,6 +1464,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
>>>    	return ret;
>>>    }
>>> +bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
>>> +{
>>> +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>> +
>>> +	return submission_disabled(guc) || guc->stalled_request ||
>>> +		!i915_sched_engine_is_empty(sched_engine) ||
>>> +		!lrc_desc_registered(guc, ce->guc_id.id);
>>> +}
>>> +
>>>    static void guc_submit_request(struct i915_request *rq)
>>>    {
>>>    	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
>>> @@ -1247,8 +1483,7 @@ static void guc_submit_request(struct i915_request *rq)
>>>    	/* Will be called from irq-context when using foreign fences. */
>>>    	spin_lock_irqsave(&sched_engine->lock, flags);
>>> -	if (submission_disabled(guc) || guc->stalled_request ||
>>> -	    !i915_sched_engine_is_empty(sched_engine))
>>> +	if (need_tasklet(guc, rq))
>>>    		queue_request(sched_engine, rq, rq_prio(rq));
>>>    	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
>>>    		tasklet_hi_schedule(&sched_engine->tasklet);
>>> @@ -2241,9 +2476,10 @@ static bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
>>>    static void add_to_context(struct i915_request *rq)
>>>    {
>>> -	struct intel_context *ce = rq->context;
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>>    	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>    	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>>>    	spin_lock(&ce->guc_state.lock);
>>> @@ -2276,7 +2512,9 @@ static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
>>>    static void remove_from_context(struct i915_request *rq)
>>>    {
>>> -	struct intel_context *ce = rq->context;
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>> +
>>> +	GEM_BUG_ON(intel_context_is_child(ce));
>>>    	spin_lock_irq(&ce->guc_state.lock);
>>> @@ -2692,7 +2930,7 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>>>    static void guc_bump_inflight_request_prio(struct i915_request *rq,
>>>    					   int prio)
>>>    {
>>> -	struct intel_context *ce = rq->context;
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>>    	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>>>    	/* Short circuit function */
>>> @@ -2715,7 +2953,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>>>    static void guc_retire_inflight_request_prio(struct i915_request *rq)
>>>    {
>>> -	struct intel_context *ce = rq->context;
>>> +	struct intel_context *ce = request_to_scheduling_context(rq);
>>>    	spin_lock(&ce->guc_state.lock);
>>>    	guc_prio_fini(rq, ce);
>>> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
>>> index 177eaf55adff..8f0073e19079 100644
>>> --- a/drivers/gpu/drm/i915/i915_request.h
>>> +++ b/drivers/gpu/drm/i915/i915_request.h
>>> @@ -139,6 +139,14 @@ enum {
>>>    	 * the GPU. Here we track such boost requests on a per-request basis.
>>>    	 */
>>>    	I915_FENCE_FLAG_BOOST,
>>> +
>>> +	/*
>>> +	 * I915_FENCE_FLAG_SUBMIT_PARALLEL - request with a context in a
>>> +	 * parent-child relationship (parallel submission, multi-lrc) should
>>> +	 * trigger a submission to the GuC rather than just moving the context
>>> +	 * tail.
>>> +	 */
>>> +	I915_FENCE_FLAG_SUBMIT_PARALLEL,
>>>    };
>>>    /**

