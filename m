Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E657B1629
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C5C10E5F0;
	Thu, 28 Sep 2023 08:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Thu, 28 Sep 2023 08:37:40 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C196910E5F0;
 Thu, 28 Sep 2023 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695890261; x=1727426261;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KD5WSS2UWG/OrRaoX6/H+ncSLUvu6TbVrhqGzJiz58E=;
 b=LNde0JzF+vTKwWiWX4+HxR2trs0eQl3oYrjUga/wowHA19UNpOSZj5dJ
 V7HqkcFJH29Si3ow8y1G2rAAwZblUst1xNsC5NMDJ7Pmd5HJrtujFfvr4
 o45T7SxJ1qzgvwRt/YN7U0bw37eJVgo2StBI7TA37hJjqdHn9MQMaiGgo
 egN224wMFRnofNrp47cy0tTnQ8Tw9qMBe1LrgRK/Cyp/JSuPY8Zyxr7Od
 gVmS256OnrMFuD9Qm373zbxP0eFAizG+Fyf9UU5Id0eD/+GO1I3WnoJd3
 f/0AiljLalkLH9Rdnj35moIEIh6swm/n6r8QeQAdHL5byUn3RZ4bzo0Ta Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="619706"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="619706"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="726153760"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="726153760"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 01:30:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:30:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 01:30:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 01:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cC/L/PCXIR+mMwpL8wESE7TK4cB+3Y47Exv3caPyzrUsf5ftabxrqbceAnZm6gZ3TOs/WDft1x695SbWSTvY9tRRvN1keZcJb3YuH15vJXEYaaYeclDLFPhvOK+17sldl9zYKWdGduFrkwQgh0hV6xIs+5ohcc0nZpGUR+j7PNCSs7D9sAVdIiyGT0d1KeLF2YuyktKfBLbMTBkhI8Ig9g+ueQ4ovEwiIKKyoRBAXzudTNS1uVeesf9T1WtIZSIL6vTA0+Jy7dVckbdTpPIGNLHHCE1HeUmlh6IsJQxuz3cxnk1qRdgrZA73swNobsdEYzwxQ14ioy1O23QdA8JxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUJJloK1BYdQFfqQJjSlCuhCbRdlrA7eVy1j63C4TX8=;
 b=IXYwtHGHaTzTEPBygn3YpxEj6YqBQpjkHo4rtbxYvIam+DPL7Ng4R4hPxYM0lHkDPf/1MBACQM3Y1e1SuGho/hAUCBxsYcLuWiOz78wC1RKNdA7rPptm5fkQUyZL2/XBGm0OuYwvyH3J11LyvU/XHsIOEaY46VeHcNsgn5VzVon/5OQjW6Hyy5odlkDu30dFq35HFLkxrRAFGinRzvZyn2IPrlRZhP8OlfDb8e23XD41yAbQHn61sqPfaJ1ecRHKIPXPzSsyXwPh5hsfy+39j3wETa6sbH0U68OAgeJIq6Epav/LvQWiOGjAtGAwro9yBKJNli0zgGLSSFfHQ1EftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 08:30:27 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 08:30:27 +0000
Message-ID: <e9fce01a-3348-9df4-d772-39f1bba272a6@intel.com>
Date: Thu, 28 Sep 2023 10:30:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/4] drm/i915: Introduce the intel_gt_resume_early()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-2-nirmoy.das@intel.com>
 <ZRUqFuG7FQdOqI2N@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZRUqFuG7FQdOqI2N@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ebec89-fcca-494f-7016-08dbbffd2ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S9JgNIZSp5iQJ+8K9PrYnbuCnVd0lbeA9BarL1bLpAxCq+AG+QRaRS8G3YMMk3MbXMEDxw2HpSjA+hmOTsJ1FxxtlbyeqAEVTJQb3O4vZDEur4KBgn+v29rVlToQhAGRcQdUMuDscHQDRNDXrx1bG+y0pE25YWSTWDup4Fgh3DQl++5RoRcy8IVnG4+r4Ixb/FtPlZoSVXh6cWOCBJk37OQtuT3RLrIHx6uRDfc56Gy1YOjzANE5JYPsSz1uqWYxjqWpS9QlrFShc7XS6eNHhx1gOwe5KBFGe4M3Q0AGJbTs4th9xR7eOMu+q+S5EE54QN3BjOWn+b78jf5srzACDimMP3JFA+JwUYHelmW7YXhhfEgW3/z9SPP4diMNc2OXgTPm90WUNt+7wWS3YYHPgf3FPiELOlDskX1RoDm+XzfFQ1Oiulf22aBYgld4WkvEosU9vAZThqLKq34Eo9Z2/DRiRmBqinNXSW7t0ws4GSxPjHI/Oi3OrZh482dy02InSQgA3CQAG5bTgas2Urr45Ht77kAWnr57PKdgixT4AN5dde7wrcRx7J9xXGYXK6/+Eriuo7cX1gdvQqwDK2/+aP9VO/PVyOUFIIIDgQOiATyHOFdofkChCAMaOnZ9dNG2xL9BiJ+RN/6T4N39zwqq/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(31696002)(36756003)(31686004)(6666004)(26005)(66946007)(5660300002)(6506007)(53546011)(66476007)(6512007)(8676002)(2616005)(316002)(8936002)(44832011)(41300700001)(66556008)(4326008)(6916009)(478600001)(2906002)(82960400001)(38100700002)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlA2bytVcXhGS21xTm5uUmxxSkt1UElUeFhFWDNzM21tSFhkREdMVlpUMW9m?=
 =?utf-8?B?RHBrUElUQ1hIc2lzeDBOMDZzcG5zNlJhTjQ4MC9kT2xiUitzR3k3WTFBa2Ew?=
 =?utf-8?B?WW5UMWxndUhjOVlaU3Z1ZG5kNXJEbmxqT3J3MHcrOStmTVBJbjRqZ3hnOVVr?=
 =?utf-8?B?SHJvVkIzcVhtU0dZUkp4eDhsMHRXNnFkcnJtR3lSRGZVaGUrK093VnNXaTA5?=
 =?utf-8?B?Z1NDZ0xObDJvS21COE95NnRYaE9LdFJ1N2o2YW1vS3h1N3BkYkx2ZmcxaUdL?=
 =?utf-8?B?TUpQRTl1UWJPaGVxN1JCeldRRmFMZWhKQVNqNkVFbHQzQUQ1bXNCNjVrWjBm?=
 =?utf-8?B?Q0IxWGErQkl5Q3BSVG4vMzZySGdleWNJU0NjMW1rOFE4Z0JnTnlUTFdlMWhh?=
 =?utf-8?B?cUd1Mm1RSENiNStYQmEwdi9HMDdYVG9YYkF4YkRKd3gyVlBpM1JYa1hORFNP?=
 =?utf-8?B?UWJBMnR0a0FhZzErUEdWVWdDK0JQbFdjZzZWY2JIcVB5VHhtVzZ6MXozem1V?=
 =?utf-8?B?eUh4dGNDbmcwTnlGbGNuWFUxL2h2M04rL2Y3UHlWQ3JXUUFTTFlta3RvSG5L?=
 =?utf-8?B?M3VqZWNFQTNkVDZSdkN2d0ZjUkdBZjVPV0wzWDRuenptbWE5czlHTVlYNEpD?=
 =?utf-8?B?dzhTS0c5K0o0a0d5b3VGY1lmbkJJM2FyMm9KRU4rS2lBU1d3UmoxWmNTb2RL?=
 =?utf-8?B?eW9iNVl1NFgxd0x0N0VKMUV2UFhONDBkZW1jdkxPOEdpTmpWOU1QalZBYUtn?=
 =?utf-8?B?eWJ5SGxMek5JYk5JaUluTGlKaXJTOFNFYWF6dy9LR2VVL1Q3VGVzcWZKVEZy?=
 =?utf-8?B?Q1VSaTdjMWNLY2VidjV3U0w3eC8zUHV5M2ttQ2VZbVQ5eWlYWW1hQm5CWHhx?=
 =?utf-8?B?TU9LY1pTZ0JjSS80a2NLZ3hiQUovV1BOTlY3ODJjOVViZUY4cG9Mek5UNlpI?=
 =?utf-8?B?UzdQbjV3UWV0S01RNlFrRko5NG5rMWlTcm1WZC8yMHA3WTE3eTlLWGs0amw5?=
 =?utf-8?B?bGdEWTc3TzJ3UHM4N2N1dm1zUlJsbzVoVDJqVXZ0QlBIVGpmaGNKY1dpU0Ru?=
 =?utf-8?B?dnpSZ2JxVVNTb1MyT3FYQWNCRlVCL2tDOERZazNzY2hPU1pyUzZsN0hXQ0lQ?=
 =?utf-8?B?bjJqNzdWSWg1T1drVTQ5MFpBNkhCcnA5WFVoY0xpWisremJBcnJWNXJhNXZF?=
 =?utf-8?B?WVhOUSt5dFdKR3pvTHpyNWVoZWxHNkVPckV0aFdjWGp2QXVMd1c5YnAvNndu?=
 =?utf-8?B?ekl2RWRaUkxhWFVyOWZ3Ryt2UngxN1dFd0NoZnZwbHpJWEkzaUE2cTY3TVVs?=
 =?utf-8?B?ZXhvbEkrY1VRclBkVVRiRXJONG9QNmRuZFhSVlRSMTE4aDBxV2RJR3V1ZTdx?=
 =?utf-8?B?Q0tjd0tJSitGcm1jc3NsazJkZEVBWjBtSW5WTEFWa1VxSHFmdU9oakZVQ3JW?=
 =?utf-8?B?b1R1K3E1Nis0V2xSU3VWcG1zNy80RFhVYUdrSVhYQUNGQS90SUhsTlB4VW1M?=
 =?utf-8?B?R1JMNnhVRlFBMWI4bm4yMWova3VpKysvVGEzWUMxaVZxTlowdWZ1Y2xzbi9X?=
 =?utf-8?B?QVQycEdneHlOay9NVFdVLzF5M1NPSTVWVSt1NnZ0ZnlDeHJuRmlYcldVODc2?=
 =?utf-8?B?Z0plZkhvVmNOWTFlT21UOW5qak1VSHNiQzB1WTR0cUk4VmRDeXNDSXVCckwr?=
 =?utf-8?B?V1AydnNUbGNSekFQWElQZTZvd3paZmtFeVBsVXBzbVdXMzhPYnhIdEtpS2hB?=
 =?utf-8?B?QVdxMnlaUWhsdDFpV1NnQlp6YlVVNUhTOWJCSG80ckd0aVZtMVVXZ0RsSnF4?=
 =?utf-8?B?c01LNnJJbExpNHE4VDRGRC9aZmZWVGgwMzJIa3RPZzhXOGE3RTlzYy9jWUxu?=
 =?utf-8?B?d243WlhFbk92QzlCM1A0VUp6UkdKcnVKSDByeTJOWDh5M1ZlRXhoS3B3VmRS?=
 =?utf-8?B?dnk2QjNCTzRjQ0kxTXVYY2VkMmNSTXRMcXZkcmtFNnU4R2RvUVVZbW41NUta?=
 =?utf-8?B?TE1NblM2SkU3bmJYc3RYYWdSV3V4UTdyeEhFZmVrbzZ4Wmh0SlRUeSs5TkNL?=
 =?utf-8?B?dkxQdkF3OS8wMk9QS2FteWFXdXRCemQrVmRuKy9XbUpFVnlKTFd3MXZXVGw3?=
 =?utf-8?Q?q5Az9fDrtKozZSnPbne6Zxnw8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ebec89-fcca-494f-7016-08dbbffd2ad1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:30:27.0789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUia0ZREbJ3zmPFm38B6mtjZ/M6APfjCdwIr32vcEW2DoWVQ01wAOXf1bCBrJG7CG41Ev7Sm3tQUqcEB0Z7YWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 9/28/2023 9:24 AM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Wed, Sep 27, 2023 at 11:03:55PM +0200, Nirmoy Das wrote:
>> Move early resume functions of gt to a proper file.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 6 ++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.h | 1 +
>>   drivers/gpu/drm/i915/i915_driver.c    | 6 ++----
>>   3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index 5a942af0a14e..dab73980c9f1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -216,6 +216,12 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>>   	intel_rc6_fini(&gt->rc6);
>>   }
>>   
>> +void intel_gt_resume_early(struct intel_gt *gt)
>> +{
>> +	intel_uncore_resume_early(gt->uncore);
>> +	intel_gt_check_and_clear_faults(gt);
>> +}
>> +
> should this go into the gt/ directory?


Don't wanted to add anything new to i915_driver which can be done at 
lower levels as suggested by Jani and this seems like it

should go to gt dir.

> Besides, if we don't need
> spinlocks in the whole reset function, we could directly have the
>
>     intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>
> here, so that we avoid having one line functions.

I think steer specific functions should stay in one file/header.


Thanks,

Nirmoy


>
> Andi
