Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F866E840
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8B810E35C;
	Tue, 17 Jan 2023 21:14:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69FC10E2E1;
 Tue, 17 Jan 2023 21:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673990068; x=1705526068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UCnG/wLCpF4YNkxh2GVpFfMjk9XdWBSkyIb84WcjY4E=;
 b=RKAnd8v78pZFFFlMLy18oVsBW0OWXKTyjxw2bl1EsELBxxA7Grml9gqa
 8gtMkl6KR5jt8VCu+0e+wPzjCk9r0kMppnO7p2Z7YAGSVHXBkYF7paJ/Q
 XIYDxkQIIrs84yyWkLw+AXNs8TZhpSkid72BfQn5AicZol+Q/X0OLEA4h
 B2IbyrXfH+2Fdp0Vs825j+ZYtrewcPw03pt93Dqy5v8Bt0oFk/dp1XVZP
 ze/Tf9Kr9bTUcj0rt/KwyC5q76IU6uMKGMcRVDtXUtSulvhN0JGKr3UMJ
 aWmIn0d8Sd6ag2TEVP1AaFOGJ03AcnCi5TDGCQ4ECuPR6nHjymJl9X7eb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352063573"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="352063573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 13:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="783388668"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="783388668"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 17 Jan 2023 13:14:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 13:14:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 13:14:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 13:14:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBqeFJ1ViiRxgqswHM6hC3nZTbWfHSuHOY13GenXeRhImovtSuOHeBU8S8o8oqe8DvaY1tZD3x/939tRxx8sEyy71Ur6c64jdhRxg0bYgYBYy12tdVOwa/42PAflr+Ow0MBgWLy3fj7xp5YvnqdnVwJqxYTrnuwbZA9G3b3Ez2N1nuseN4rMtivtPuWpFsyl12c8zpTWAzxilx1QSTrap1LtJtWWZ9uFVYmr3WWpGj+RKO+rohcqDAusTbdv7+W23KOdfP+gtDy6LIOFs8iK95XQSDDSnlSDu1EvLH3pLWdXx3PGH7074qNcXmxGCBcB4w9EORzuDS9SF4JX+dWncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnWFeabvbgsRbikfxgprvmFUgmhWgs+F3jl2K9Bg/0k=;
 b=iMViskzBeOG9tUPguIcVAH20BJcCODGv7itenQHKiRWCgC+vMBPo6j+ydCWTPZvqS4R4aDtPfuYCzTRhNHDpjU7bvXRfH3qL5rW57mird0IUGgQHEsi9LsP9PAaBBvf1DtziF+NGNLB/LD/TCtcEKZMPA+5xA5ykAcJxpOyg7hesmgyoZ0e1mL0SAAZ5k1CUXGZAJJiLC76AFogE2tuTODhcYZ4XPeojBIdQhTDjn0mANlz4KodArzcam32mXYKkEyP1Vm0k0hEYzMYPd+roWO/0FmU1k8U9yD7CZHfbTKHfcQiU9GFKxfySzcX2r1nZJk069AjdKvtZ/WXX5Pr25w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Tue, 17 Jan 2023 21:14:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 21:14:25 +0000
Message-ID: <3d5d3f6c-3faa-7a25-572c-e22ba9eb5b89@intel.com>
Date: Tue, 17 Jan 2023 13:14:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-4-John.C.Harrison@Intel.com>
 <393edad8-fa78-4b28-46ac-86da56d03de0@linux.intel.com>
 <8531ce98-78af-d818-b5bb-0af753a026d3@intel.com>
 <ed669153-0c07-dfdd-58c9-8146ed966366@linux.intel.com>
 <f3749fe9-56c9-dcb7-d1bc-bfd57bee668c@intel.com>
 <195b373c-f98e-306f-40aa-1f028d27a77f@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <195b373c-f98e-306f-40aa-1f028d27a77f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 10efba34-08f3-4064-823e-08daf8cfcf88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WgswJE474oBBoTpOS/LeAZ0oTCao46/C9L2r2DCsIg0Sa1fE/XYScOoTgLLNY9OtFp/3gBPIvTFok37sIVHot/MvxaodfRbSLfyQhBTgv1dL1qIV6X2h8i0vllrxaXjE1PeGRiUq3ErCoLCHT8FnZDvvLK+p8hTmQqzThePEww0ubEHNwlwNc7ZIEFoa/X9T7MLZGNbFyahQh6quCxJFl1C9wm0iVDH3oCxo6o7k3LAa2dJjTTdfr138LS4+MMScXJ+cluCxxEQyK/JAVXwKTBtIeddf7ou1TF/kpMZqLJzy1lTudjKL53xkv9laGswU+Iz04s+1pd+Frn1h8HG9t6ojEPZ9V1fmJ4GZkmNUX0m/Vd6ipRejj7NYm0HBzwjzM+xCPVlUv4KQs4O41Wouy24ghqVlyEaQiAZ+K9XBnb6URNy5hcTGCDF3WZ8LqLZTDxkI4fZLkftbrm5+/JxZBdyCDSvmWszeDSC0WbxYFdKfv0tlXnOmIwRY3v5tMeCHftJAwBhKu5GebEvehdamI/96lAovH1g5JNnVVWMuq3L5cHg6X0k6E+08XEEH+uqo3RsnVLuwhJCEums7DJYlh+nOO9Awq31EVrCO+WA6f91+2nQETpF/gyauwBL+Y4ueoZOJWYrvtd+mhkYHOr24WDFkNc0h+Rxy12oR3wEjBPlyusA1NOJAagApxJM3mV/04HHSzQJFQH/+xUNjDcJ9/I1Gx7bllr/IbmIb41wcHoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(36756003)(31696002)(186003)(478600001)(6512007)(6486002)(26005)(6506007)(2906002)(41300700001)(5660300002)(316002)(66476007)(8676002)(86362001)(53546011)(66946007)(4326008)(8936002)(66556008)(2616005)(82960400001)(38100700002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDZlbGhuQlpOU3NZVTRQQXZSV1Fibm9mRTZYL2xGazIxNnJQWnlVNkJWSjZD?=
 =?utf-8?B?SG1sMUp3U0F5SzBCdHhnaEFiRXgrUm1VRGdjdVdoQzQwZm9HQjdQYlQvYUlV?=
 =?utf-8?B?b1VWOXFSRHZPU1JFaWRXTk9YMUJTOElvdndSWFpTTUJCL3VHL2l6N1FpM0xi?=
 =?utf-8?B?M2xnczBXaXVsV21CeG4zdVFmdUlmZ0pxZmJhaUpJYUt0aDJtdlF6dDFRbXFN?=
 =?utf-8?B?N0hpTS9WaEFIaFZpdTRneWh4NDNQSjJMcFBmcmJ6NHdnM0xsRGFFbUFQb0pN?=
 =?utf-8?B?SjdwVndDRy9SVnJTV1BWaUdYWEVaTVBQSHlsRGdhY0RNdlVtZHZiMUc1emF0?=
 =?utf-8?B?SU02TkNuRW1tNzNZODdMNlBabDFXU3JJc3NJWEZrUGkwN00vNVRqVExCcnRZ?=
 =?utf-8?B?WU8xYWRWVzNlNTVwVVpTUk41SVdCU2tBTVpJTUx6MTdaak1lWWQzOTF5cElP?=
 =?utf-8?B?WUJOL3R5blhmR2w2U3VlSkFXM085UUZ0ayt4WWdEbnV2NC82eUQzMzRkanhN?=
 =?utf-8?B?UnhaNGgvUytsbHoyTnFPMks2REtOU1NrYTRzRDZjWWtGeSsxVWFNc3NtWURo?=
 =?utf-8?B?MVlGU2hMbklKSStEano2dzZQbUk1dlAxaTArMHlxTFQ5VkhxZEh2SXQ2cVJ2?=
 =?utf-8?B?UU4wQ0NnVjNURVZkcjQ0Nyt0L2VYcHU0QnNQZno1ZEx5Yml3R2ZZMWVCend2?=
 =?utf-8?B?R0ZMV0FNcExucTRhbHhZTDBZMkpOa3pyNkFqbWM2TkpGU3J6RHVoZXA3Umd1?=
 =?utf-8?B?cnR0VDFGdm52dlUxQVE5T0FlcnJlbWZZbUZDK1RFMlNvWnVIK2xmUS9rU0th?=
 =?utf-8?B?RWVGckI2c0NjWkpqTlhVV2Z5MWFwRVNhSENyZVV2VG9TRXdzalpxQ2I1QlN5?=
 =?utf-8?B?eVhxSHRCQWFhb1dLUnZMdHE3a2RuSnNidnpmSTRCM2kySFhMY2piNUxLVEdN?=
 =?utf-8?B?Z2Z1MWhjeWNib29taU9KL1BENHlmUGNtclEzUWtaUlFhdVVMaEM1NTYreG1T?=
 =?utf-8?B?OEw2UVFhZnNSSitFc2xITXEweHIyMFZxNFhqSDVnZW0rY1Z0MVQweWp6RVlw?=
 =?utf-8?B?aUVLazltRkRVZEd5YnQvZkI2Z3ZRT1dzbWZVcitYNlpra1AwRktXSVlyT1g5?=
 =?utf-8?B?dENqbDNXM3M0WDRuc090c29oZ3FTcFVNQzh0bjVuckt2TjZadzdrc1lDb0Fy?=
 =?utf-8?B?Qk1DMG9FZmRZK0pmajFCOE9CZ1h4NDN6RDhyc2lFZm5tMG9jV1VQRlJXZ1FB?=
 =?utf-8?B?TUZob09FRXl1REx6VkZiNW1DWmdwcXlCcllJVnJXKzc3WVlNK29ubENGbEVT?=
 =?utf-8?B?dG9Ua3B0VHhqOUJmdWsveWNFcWZhelBBeHprdFhHazhSait4Vnk0WVBoeTJl?=
 =?utf-8?B?MVVsclFDSFpiZmhKVDJsc1BWR1UyWWlJRVZEcytITjNtcG82RXZzTjUwcG8w?=
 =?utf-8?B?c1lLaEpzMGxraUNsUHFySTdiQWVoZFF0ZkM2RG5US0lwa0FQWGNyN3lZR05Z?=
 =?utf-8?B?YjhKWGZWTFVZKytNb2N2VTRKS1k5KzZ2RzdTRUlwalZGZit3emloaUx4L3dY?=
 =?utf-8?B?dG54OHJpcXFJdzQzQVJUSVZpejdEZm1Ga0M4bkMxVmpIZEtLRjJjRTBCL3ZE?=
 =?utf-8?B?K1plVnpUSVdZOXhhZThBYmlQTEZYUUJDelZ3WkxYVUxHcEdVUjRLUFp4UmVo?=
 =?utf-8?B?Z1RnUHZDN205K0NvZGd0engyMDhiZkppTnJQMTNFMFQvdGNZbWlwNklVdXA3?=
 =?utf-8?B?bVJQcTFzdGFKL0VPb1QvVHpzK0Q3NEd1TC9LdlJKWWRwcVFrcEtEckM3Yks0?=
 =?utf-8?B?dVJiV0hLTThMejVsc2lveWVkV29IMDJTdlV1SmZWVG12QU81cmdqUkExd1BE?=
 =?utf-8?B?KzJEakZ4cXpnVGkzWWRkcGVSTnRNRjJJQXFEZGs0emRjYlpFcHlYQVFYaGkx?=
 =?utf-8?B?WkVoNEozY3oyNkZaeTBMV2xxaXAwZ25IeFhRVVEyMFpuNERSUDJqT1RCMHhQ?=
 =?utf-8?B?eEtVRExJR3FSdG1vaG40OVRrT29uOWJwYTNYNWVMMHllTlN2SjBESExBZlhS?=
 =?utf-8?B?bGtVRW00c3V1MC9qdHVwSTJHV2loRnFFTVRRdVV1ZVNTOEoycjlqdDNHb2Zj?=
 =?utf-8?B?dHF4S3pkbGFZdWh2azRGSU4vcjJubUFKYzVPRG1NV0VOVC9aNjZHb2ZmdmdF?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10efba34-08f3-4064-823e-08daf8cfcf88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 21:14:25.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/iP6d/SotRcWizl6q9x4wgfQVg7xYSZQQwxIfNskpe8EM0xjFUj6uIa/MNHmorak19Cim3da/wCjG76G1Ur+FEzvRGkC0/eKopcF6G00Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/2023 04:43, Tvrtko Ursulin wrote:
> On 14/01/2023 01:27, John Harrison wrote:
>> On 1/13/2023 01:22, Tvrtko Ursulin wrote:
>>> On 12/01/2023 20:59, John Harrison wrote:
>>>> On 1/12/2023 02:15, Tvrtko Ursulin wrote:
>>>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Engine resets are supposed to never fail. But in the case when one
>>>>>> does (due to unknown reasons that normally come down to a missing
>>>>>> w/a), it is useful to get as much information out of the system as
>>>>>> possible. Given that the GuC effectively dies on such a 
>>>>>> situation, it
>>>>>> is not possible to get a guilty context notification back. So do a
>>>>>> manual search instead. Given that GuC is dead, this is safe because
>>>>>> GuC won't be changing the engine state asynchronously.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 
>>>>>> +++++++++++++++--
>>>>>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> index b436dd7f12e42..99d09e3394597 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>> @@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct 
>>>>>> work_struct *w)
>>>>>>       guc->submission_state.reset_fail_mask = 0;
>>>>>> spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>>>>   -    if (likely(reset_fail_mask))
>>>>>> +    if (likely(reset_fail_mask)) {
>>>>>> +        struct intel_engine_cs *engine;
>>>>>> +        enum intel_engine_id id;
>>>>>> +
>>>>>> +        /*
>>>>>> +         * GuC is toast at this point - it dead loops after 
>>>>>> sending the failed
>>>>>> +         * reset notification. So need to manually determine the 
>>>>>> guilty context.
>>>>>> +         * Note that it should be safe/reliable to do this here 
>>>>>> because the GuC
>>>>>> +         * is toast and will not be scheduling behind the KMD's 
>>>>>> back.
>>>>>> +         */
>>>>>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>>>>>> +            intel_guc_find_hung_context(engine);
>>>>>> +
>>>>>>           intel_gt_handle_error(gt, reset_fail_mask,
>>>>>>                         I915_ERROR_CAPTURE,
>>>>>> -                      "GuC failed to reset engine mask=0x%x\n",
>>>>>> +                      "GuC failed to reset engine mask=0x%x",
>>>>>>                         reset_fail_mask);
>>>>>> +    }
>>>>>>   }
>>>>>>     int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>>>>>
>>>>> This one I don't feel "at home" enough to r-b. Just a question - 
>>>>> can we be sure at this point that GuC is 100% stuck and there 
>>>>> isn't a chance it somehow comes alive and starts running in 
>>>>> parallel (being driven in parallel by a different "thread" in 
>>>>> i915), interfering with the assumption made in the comment?
>>>> The GuC API definition for the engine reset failure notification is 
>>>> that GuC will dead loop itself after sending - to quote "This is a 
>>>> catastrophic failure that requires a full GT reset, or FLR to 
>>>> recover.". So yes, GuC is 100% stuck and is not going to self 
>>>> recover. Guaranteed. If that changes in the future then that would 
>>>> be a backwards breaking API change and would require a 
>>>> corresponding driver update to go with supporting the new GuC 
>>>> firmware version.
>>>>
>>>> There is the potential for a GT reset to maybe occur in parallel 
>>>> and resurrect the GuC that way. Not sure how that could happen 
>>>> though. The heartbeat timeout is significantly longer than the 
>>>> GuC's pre-emption timeout + engine reset timeout. That just leaves 
>>>> manual resets from the user or maybe from a selftest. If the user 
>>>> is manually poking reset debugfs files then it is already known 
>>>> that all bets are off in terms of getting an accurate error 
>>>> capture. And if a selftest is triggering GT resets in parallel with 
>>>> engine resets then either it is a broken test or it is attempting 
>>>> to test an evil corner case in which it is expected that error 
>>>> capture results will be unreliable. Having said all that, given 
>>>> that the submission_state lock is held here, such a GT reset would 
>>>> not get very far in bring the GuC back up anyway. Certainly, it 
>>>> would not be able to get as far as submitting new work and thus 
>>>> potentially changing the engine state.
>>>>
>>>> So yes, if multiple impossible events occur back to back then the 
>>>> error capture may be wonky. Where wonky means a potentially 
>>>> innocent context/request gets blamed for breaking the hardware. Oh 
>>>> dear. I can live with that.
>>>
>>> Okay, so I was triggered by the "safe/reliable" qualification from 
>>> the comment. I agree "reliable" does not have to be and was mostly 
>>> worried about the "safe" part.
>>>
>>> From what you explain if short heartbeat, or manual reset 
>>> invocation, could actually mess up any of the data structures which 
>>> added intel_guc_find_hung_context walks and so crash the kernel.
>>>
>>> Looking inside, there is some lock dropping going on (and 
>>> undocumented irqsave games), and walking the list while unlocked. So 
>>> whether or not that can go bang if a full reset happens in parallel 
>>> and re-activates the normal driver flows.
>> There is no walking of unlocked lists. The xa_lock is held whenever 
>> it looks at the xa structure itself. The release is only while 
>> analysing the context that was retrieved. And the context retrieval 
>> itself starts with a kref_get_unless_zero. So everything is only ever 
>> accessed while locked or reference counted. The unlock of the xa 
>> while analysing a context is because the xa object can be accessed 
>> from interrupt code and so we don't want to hold it locked 
>> unnecessarily while scanning through requests within a context (all 
>> code which has no connection to the GuC backend at all).
>
> AFAICS intel_guc_find_hung_context walks &ce->guc_state.requests with 
> no locks held. Other places in the code appear to use 
> &ce->guc_state.lock, or maybe &sched_engine->lock, not sure. Then we 
> have request submission, retirement and a few other places modify that 
> list. So *if* indeed hung GuC can get resurrected by a parallel full 
> reset while reset_fail_worker_func is running, why couldn't that list 
> walk explode?
Blurgh. Didn't even notice that loop somehow. Or rather, was assuming 
the context reference count covered everything for some dumb reason and 
didn't look closely at the fact it was scanning something else entirely. 
Yeah, there should be a guc_state lock around that loop.

John.

>
> Regards,
>
> Tvrtko
>
>> I can drop the word 'safe' if it makes you nervous. That was only 
>> meant to refer to the possibility of such a scan returning bogus 
>> results due to contexts switching in/out of the hardware 
>> before/during/after the scan. There is no way for it to go bang.
>>
>> John.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>

