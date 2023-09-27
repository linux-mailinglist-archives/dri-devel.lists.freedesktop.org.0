Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7067B0CA0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 21:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E8E10E5AF;
	Wed, 27 Sep 2023 19:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E810E5AA;
 Wed, 27 Sep 2023 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695843295; x=1727379295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oHUP/EP/OusK+IwukCvPkrBbX2vXuqA3XmV4nwqUSFQ=;
 b=UNYKZHFg8cQFA2rS5RX8P53XZ1N9Lx4GVhZBepAap823OoJRZMWgCqKb
 5uhzC0uQQWniNMXR5lARxqtSc9x1M8RKWX5n34rzEE8CtjvfyQN54vlD6
 pQudwn59/oWnSfqQIm+ltzWwMLxAKrVv2qyhYBQHDLLU5GHT2o08rgJgB
 0hIFjsFiabh4rdLnSnvUgPmZAjoqmg6zsPjGbVFpzGHR5cdMoAiwBK12H
 x0dBThkiIv4R7+X5e4qtOAdtiNmsRrxgggPpdVM+PTQviFQPLL+oJqEGj
 QuYxyuh2uURHBroJE3fpmoOvkBeLHyJ2V08BQH9q3SCgoKAPPeVwgsBPb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372264741"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="372264741"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="922929014"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="922929014"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 12:34:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 12:34:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 12:34:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 12:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSK8j0LnzRY2IO3EwVOp6W4yOmdLXK6cnQlsB7hDlDfg7M93BGjXAnM7KHulZoSX2SotS4wPbiInZHtG5U+59L+gNByPOXR1HsQDTiXuYXuvlGo2QEghQtiREZWcJfger2AvFOSaMs1zyI/QAy6lK96Q0F04PQRUXToXUI7mrjEYSrpw37lVwtxtng9Hl4r4EHRFfhgcpqMlxL8aFemI05PclEMp5j19C7CWdmOHWhRcDMAOo6eyhpcRjh05FjJTfNRpGGJ+Os5jMrytXtmQViLl49OXrSUkE92+tVRNhxu2dypj1U0uKyyjO8O70XKly52JGqfBldq3v0FA2iCEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARV9puaeiA9I4W+fKe33HeGhxWIWYm1SQ71hTkpICcg=;
 b=le7Q7bcSeMd1JDQ1L5E2YopKWVF5h2Bm120uG5B7pnlNvC9JkACE0fRmmEquNBT65U3PVJeV6OCCycRVsG3AacIE+NZZLtnesU2N04mtOpAgt3ixG60R0eIXNXtV2rJS7reakhDZM3760Jf66uQuI3ErCznz7++9IzwQJcEavyNYPnlK5MMT2lF+84I/Phvn3CTaAZE5RbefGljlwDanN+HiPDNUTh1RUh7+4J3jBmOulZCaGa90zm+VX+fEKe8spnlLMlZ2r0K4lTg60n3pu58J7hyF5f9gsA5m+K/3vBtHiMYdDsZ2jbsCmMP8H1D9esRaC2jagVTXND9DUi5IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 19:34:35 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 19:34:34 +0000
Message-ID: <915a5e08-5daf-153d-cb82-b0f9e5bd3b2a@intel.com>
Date: Wed, 27 Sep 2023 12:34:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Allow users to disable waitboost
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
 <5f7f3950-bc9b-06cf-611c-46c360bb90e9@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <5f7f3950-bc9b-06cf-611c-46c360bb90e9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: baed6e76-8350-413f-9bf2-08dbbf90c762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLNTElIqCX0L5m8sy1J3MYZjIFQblcTxKqsh/JZwEzzKtKwJQn9JXrrm0ldJ04EGOwJcvDd8eNwL5yHvb/mbpW0evWiKKEO/w/+Bbqd9LRHQVY2ee9kaZOSFVifjXp9SOUjVEToUdvyAhdavd55Cq3b93JiADJzjqMt56CErAMddgoxs576wBMjPyd93ZrKaftYRdQOPc5N900zp3Vim7ZFILHoC8+JA+9YKzoomhiSjtuteW6vZNhcj9zI46tnGUeJZv8Zfl3CZUHfw1dybxjiM/WBgwVAMG6XV5MQpuz9xJx5upMV3//J7Ik7I56/qQzXCjDQ7GfcAOpu3TxWXRoilDHSWXrqeZ4auwJldKjJljChBgTDU3qv9XCslCeT7X/HZGBpuRixdKWVNSvkeQQhLk69tTK2jLG9v6ZizIWracEDIY1DvN+4CfPRnTQAFa9nOGMhV+im1SkGnYBYo/9jm1HrAlrBc27JAQdckekSzeNgx26AEI1SpZyTdlHLprysI1vT8IGiSz3VDXszILfkpiFm6YkuUFtivoSOFpcLc6F5yTwbFr/HROxGzqW+0epiJmck19s7fOlWJTOW7F3w9HMwbDa3gEeGaDIV29HYxfBfVC99tQb8uPsdZCtdd7wu1J9cWRMCy+JTQA3P5jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(31686004)(2906002)(4326008)(316002)(41300700001)(53546011)(8936002)(8676002)(5660300002)(36756003)(54906003)(66556008)(66946007)(31696002)(86362001)(6512007)(6486002)(966005)(66476007)(2616005)(6506007)(38100700002)(83380400001)(478600001)(82960400001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajBPVDdpWmpLR0svQjRUY0NPOGUxNkRSOC9yTWFoTDI4bFgyTE9vQnJhMXdQ?=
 =?utf-8?B?K05lYmNISHNkc2d5MWwzek1kZjFPNC9mZnc3RUppQVZUYUs4aDE1VFFLREF2?=
 =?utf-8?B?d2YvYTIzdHBhNitWZnY1bWo5V3dUd2czSHorbDduVzg4Nm1hbTlVZk5LcGRk?=
 =?utf-8?B?NjZKbVVVeFJmWHZGaUJrTzRBWGh3SkE5N3V5RlpOd1lKa0J2b0MzSXZCb3VU?=
 =?utf-8?B?cUJ6a2hUdTJ2cVBra3FZdW0xVGlHUThnMHE0Q0pmTnpRc1JEcE5mSjRCYzRo?=
 =?utf-8?B?ay9seUJDUE9nblFqSlV4STZSckQzNWUxL3hWZlN6MmVCdXp4TStrc1RaU0h3?=
 =?utf-8?B?QXl4Sy9lMWN0T21OOEJIUmVaUHpvSklTMzBJdTFadmdYSWgvanh0aE84L1ly?=
 =?utf-8?B?Q3ZLeDV1YnAvaTRhN1NtTXQ0ZFQzOGdrVnRqL2crNngyclpuUWYwQmZLSkFC?=
 =?utf-8?B?aXd2MmZxZGMxYW1FdEhxZk9ZZi9XWllOMzB5QkkwMjg0QTNQeHVJbldLb2hS?=
 =?utf-8?B?KzJibVYvWHd2blptMkFxaER3UmVwZnBWRlgxMlZSUkcxaWZSakZOMTJoWkFB?=
 =?utf-8?B?RXBEbUhYYkZJdyt6Q3laSUQ3RlNLOHZMRWcxRzJ4STlTUFBRUjVQNjlWaGk3?=
 =?utf-8?B?UUlFSFFCQ2xVbnFCQjVVekJRbkdWUTZrbktoNjAxQWJ5SUpiTjgxMzU2Q2xB?=
 =?utf-8?B?c2ZHeEhxUmcrSUJQODBrSVA5czBKUksxNHBrTFZ5VGVtTXA5UjRmYWgxNWZn?=
 =?utf-8?B?bUVUTG1Ud09MNkU5ZGUyUEI5YzdJblNsbEN3REowazJWWG9BZEdGSW5VeTUv?=
 =?utf-8?B?TTF3LzBETkVqZHBnNklzOVQwcmJCSXdTMlhCZ3RseS9vUndTNmV0M2xsZUcv?=
 =?utf-8?B?QnRHU3FJa2NyMFY4SnpQZ05oYnU1clVDNWgrNTc5UWVEak9oSUlXdzFZd2sv?=
 =?utf-8?B?ZDZ6R3lDRmltZTJoNDJORVp3dU4rR3VSK0RBdXoxclJaSm1DeXpzeWcrUnpG?=
 =?utf-8?B?ZE0xQU1aWXFUQlJ1SGR3SUhIWExZRXF4ZGh0aXNOclJCTFlxa0hjUGhlWi9p?=
 =?utf-8?B?cVZQYXJiQ2ZkREI4R0JiVFNKejBiRmZEUS9scmhRbHBBcTd2MFplcFU4cEVn?=
 =?utf-8?B?d2pmaThyOXhtKzhzVFVjaGwvKzhCR2t3UTY1RUZrSjB2YlY4SnZBWUhGNkc4?=
 =?utf-8?B?cUdhZnNNZXU5ZkJsQlJtV0lyT2RIYysrb0grK05ydm5HWnpadkgreStCY1h6?=
 =?utf-8?B?QVRhb2NHaGZZd0VwcEgyT01qMkgwRDhmQUJBZmxMcmU0R1JHUkVZaFZielUw?=
 =?utf-8?B?THkwVVl3cFNIeDBCc21yUVQ5a3h2TjhiSkZVd2NTdG96bE9XVlFMaVcvbVMr?=
 =?utf-8?B?NEZBVXhFV29TL2RUY2pQZzU0T3hPTS9VSVNRajZhZVZNT0FLWjk4ZHJaQ3By?=
 =?utf-8?B?OStSelJEV0xtVElpZWxjQ1RYL3lQV2ZMQVFZSGJGbHczSHBMNnV2ZjkybTdB?=
 =?utf-8?B?ZWRJbUhpQ2FWUTc1REg0ZnJQdWdNckxtMjgyckZKSkJFSHJ6NmlQU2Zrajc2?=
 =?utf-8?B?eUoyQkpwa3pPc092UUR3bmxkbGxwY1p4M1ZweXc3bnpZMnBMaUZiOUJMN3M0?=
 =?utf-8?B?NFdZL3ZLYk5LcHJWQU1Jc2YveEU0WldBa1dSMlNhNkpKV1FvQzhZRjh4by9X?=
 =?utf-8?B?blRvN1VpWHhqT2tBQ1IvR0Z0Mi9jK0RNMVdHcUU0czlRMXNvRUNUeUZ6dGIz?=
 =?utf-8?B?dXU4eHBOZkYyQTViYWJ3NUhIMVJ5bDFLSHljaVRycFJGMitCblNvMmM5NXlR?=
 =?utf-8?B?bkhZM2ZxUGFIWVlYc09YeEtSQUt6QkQ0alp4L0djMFlDRk1IQlBpVFk3aFlB?=
 =?utf-8?B?YkJDZGtiUkR3blNRSGY5ZWRXQmRPeU9ESU51OWFqZEJjUFdBTWRJK0VLdUlG?=
 =?utf-8?B?cG9Kak5Gek9Ja0Qwc0lSWCtoQWRjUldLVkxvMVVuTERqck5vcmVJTU9IWVlh?=
 =?utf-8?B?eHJLOE0zdTBzaGszS3Z5ZURTUklLdWVTdjVpMUlUa285K2ZGbDRTdmtjRmRV?=
 =?utf-8?B?VTIzaFhGTjU3bjlyV2d6TXo0SWViMTFiNkhGUjJLcUp6N1YrREVjblJLMW03?=
 =?utf-8?B?b0YzYVl2cmFGZDEyYzRtbjJhdTdKZ3hSTndZQkV4VDk1WnBZRVgxVWlRZG5i?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baed6e76-8350-413f-9bf2-08dbbf90c762
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 19:34:34.6007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVTmmEbdMdRslIN9cXaTsrAxhfssWL42kyCEJ/yzTZfnL/g6iEldxLrJniup4u9+53sJGp6c30SxiTRVESBG9ow3emnaow/LACUFWIXLaz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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
Cc: Rob Clark <robdclark@chromium.org>, carl.zhang@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/21/2023 3:41 AM, Tvrtko Ursulin wrote:
>
> On 20/09/2023 22:56, Vinay Belgaumkar wrote:
>> Provide a bit to disable waitboost while waiting on a gem object.
>> Waitboost results in increased power consumption by requesting RP0
>> while waiting for the request to complete. Add a bit in the gem_wait()
>> IOCTL where this can be disabled.
>>
>> This is related to the libva API change here -
>> Link: 
>> https://github.com/XinfengZhang/libva/commit/3d90d18c67609a73121bb71b20ee4776b54b61a7
>
> This link does not appear to lead to userspace code using this uapi?
We have asked Carl (cc'd) to post a patch for the same.
>
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 9 ++++++---
>>   drivers/gpu/drm/i915/i915_request.c      | 3 ++-
>>   drivers/gpu/drm/i915/i915_request.h      | 1 +
>>   include/uapi/drm/i915_drm.h              | 1 +
>>   4 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> index d4b918fb11ce..955885ec859d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> @@ -72,7 +72,8 @@ i915_gem_object_wait_reservation(struct dma_resv 
>> *resv,
>>       struct dma_fence *fence;
>>       long ret = timeout ?: 1;
>>   -    i915_gem_object_boost(resv, flags);
>> +    if (!(flags & I915_WAITBOOST_DISABLE))
>> +        i915_gem_object_boost(resv, flags);
>>         dma_resv_iter_begin(&cursor, resv,
>>                   dma_resv_usage_rw(flags & I915_WAIT_ALL));
>> @@ -236,7 +237,7 @@ i915_gem_wait_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>       ktime_t start;
>>       long ret;
>>   -    if (args->flags != 0)
>> +    if (args->flags != 0 || args->flags != I915_GEM_WAITBOOST_DISABLE)
>>           return -EINVAL;
>>         obj = i915_gem_object_lookup(file, args->bo_handle);
>> @@ -248,7 +249,9 @@ i915_gem_wait_ioctl(struct drm_device *dev, void 
>> *data, struct drm_file *file)
>>       ret = i915_gem_object_wait(obj,
>>                      I915_WAIT_INTERRUPTIBLE |
>>                      I915_WAIT_PRIORITY |
>> -                   I915_WAIT_ALL,
>> +                   I915_WAIT_ALL |
>> +                   (args->flags & I915_GEM_WAITBOOST_DISABLE ?
>> +                    I915_WAITBOOST_DISABLE : 0),
>>                      to_wait_timeout(args->timeout_ns));
>>         if (args->timeout_ns > 0) {
>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>> b/drivers/gpu/drm/i915/i915_request.c
>> index f59081066a19..2957409b4b2a 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -2044,7 +2044,8 @@ long i915_request_wait_timeout(struct 
>> i915_request *rq,
>>        * but at a cost of spending more power processing the workload
>>        * (bad for battery).
>>        */
>> -    if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
>> +    if (!(flags & I915_WAITBOOST_DISABLE) && (flags & 
>> I915_WAIT_PRIORITY) &&
>> +        !i915_request_started(rq))
>>           intel_rps_boost(rq);
>>         wait.tsk = current;
>> diff --git a/drivers/gpu/drm/i915/i915_request.h 
>> b/drivers/gpu/drm/i915/i915_request.h
>> index 0ac55b2e4223..3cc00e8254dc 100644
>> --- a/drivers/gpu/drm/i915/i915_request.h
>> +++ b/drivers/gpu/drm/i915/i915_request.h
>> @@ -445,6 +445,7 @@ long i915_request_wait(struct i915_request *rq,
>>   #define I915_WAIT_INTERRUPTIBLE    BIT(0)
>>   #define I915_WAIT_PRIORITY    BIT(1) /* small priority bump for the 
>> request */
>>   #define I915_WAIT_ALL        BIT(2) /* used by 
>> i915_gem_object_wait() */
>> +#define I915_WAITBOOST_DISABLE    BIT(3) /* used by 
>> i915_gem_object_wait() */
>>     void i915_request_show(struct drm_printer *m,
>>                  const struct i915_request *rq,
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 7000e5910a1d..4adee70e39cf 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -1928,6 +1928,7 @@ struct drm_i915_gem_wait {
>>       /** Handle of BO we shall wait on */
>>       __u32 bo_handle;
>>       __u32 flags;
>> +#define I915_GEM_WAITBOOST_DISABLE      (1u<<0)
>
> Probably would be good to avoid mentioning waitboost in the uapi since 
> so far it wasn't an explicit feature/contract. Something like 
> I915_GEM_WAIT_BACKGROUND_PRIORITY? Low priority?
sure.
>
> I also wonder if there could be a possible angle to help Rob (+cc) 
> upstream the syncobj/fence deadline code if our media driver might 
> make use of that somehow.
>
> Like if either we could wire up the deadline into GEM_WAIT (in a 
> backward compatible manner), or if media could use sync fd wait 
> instead. Assuming they have an out fence already, which may not be true.

Makes sense. We could add a SET_DEADLINE flag or something similar and 
pass in the deadline when appropriate.

Thanks,

Vinay.

>
> Regards,
>
> Tvrtko
>
>>       /** Number of nanoseconds to wait, Returns time remaining. */
>>       __s64 timeout_ns;
>>   };
