Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6316F2193
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8063810EE0E;
	Sat, 29 Apr 2023 00:21:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4E10EE0E;
 Sat, 29 Apr 2023 00:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682727681; x=1714263681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OhIcBfX89kMCqB6MD9hKsV1NENi4ffas6G8+mY+b184=;
 b=E6oR3wyaVhqv55yhW463lAirQzAOEm5GADiINq3+OQyw+hjRdx1wK6BL
 WBfRxjCK+8tQMol+UDu+7sy+1tz6yk7+EMOSAeoJBlj4nLzyJPCFJdLAn
 mB6HWvkM6ar9k5DQhmRH78ZunJxGAtHuNiOKnCRHadK9an6TqpVn8lwkc
 Ga5S7YnQBqC15oUgSdxAgMOBsutS4FA9Xp/3PESF5UQhHIitAg860Acgj
 2irI4tpGl7qJjHirUK3NwW3a2Vhq5ePoDsEzfKZbz6OBQG882zfYG8vco
 UzBqGveqa0UVrtFsTiF+EouR2R7PvGckSMa03r8DJ6KN4N+kRWrm8v9gb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="327506682"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="327506682"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 17:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="806599345"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="806599345"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2023 17:21:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 17:21:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 17:21:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 17:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceHVv9rk70MHabjWSRQ+/Z1k4OFlpMHqWFagXycU/0zZisUZlWwokZNJpLlfocaNsve78LhIUbCNSz128wZX/ni40G6gxU0mStmumSB4/28S4OH691mMgcduZxRQi1rqMwzvTPoyq9rrVSD+ycfMQ5/KsDO1R7/33QwafF3Js8LThWQ3IML/aH7O184i+H7RhJZbadceS2lXSfxfbCkB9f3sECUqvXGCUciheheNa/24Do1E39fLlWU8C4jhSYyv88BpSkwZwOI43o1OHDnVEqwr5P5J2t2AILPpc5qKVMbHnvOTW3mgNHmBNhch2vv5PKP7nEbt0ulXlzGRab45Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGYnpOQ4kPZULXUdA9iQ6O+GG8rjWuJCZtpEy0pxOxo=;
 b=Vto8Byh7aWpjbdsUDfhKdgQK0eo0h7iRON+4jPzFlrcSfNqtZpGe8KXVyr+c0HzbNDJVLKRaRRB2TRog6RdiVDhXLXkMLHOF/61ooRLyY1lpEcwMNbjFSWBLhg5s469xDW2nzr279F4nRBT7Ccg06lfYHDKjeJusI2/63RIdvo2eOYvFlNg8sYH8hdx3Enb9TKxbl/l0qul2Ho9ywKN+iXLcASnpsP2/Xo3ldgmhBExZPmXYaKXTNqIW3KIbCHHPfPUo/6w/54Maohisn3PTbEkeiDsFGpv64vjQdZ6V8/G63L1CNoGyR9BNzf8QjT8qzvNDzhmTy6VQNMQ0Py0rEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Sat, 29 Apr
 2023 00:21:16 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::7b09:91d7:6e26:5833%2]) with mapi id 15.20.6340.025; Sat, 29 Apr 2023
 00:21:16 +0000
Message-ID: <94d6ce82-7ce0-2c25-ea8a-0616dffac166@intel.com>
Date: Fri, 28 Apr 2023 17:21:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH 6/6] drm/i915/uc: Make unexpected firmware
 versions an error in debug builds
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
 <20230421011525.3282664-7-John.C.Harrison@Intel.com>
 <028db79a-cb8e-ef27-8ad0-0c1b3c15ef17@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <028db79a-cb8e-ef27-8ad0-0c1b3c15ef17@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c3b105-7bcc-43bb-4c15-08db4847a590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UzeDsttwC5msKe8LIX804nuo9SI/P6boY3GXxVi8VoefraTMbgyWvznnWFsTQ8LCvnwhmTHC4ZbCr1B5HkTIl7Q27Fwz/v1OEbBy8RTUd3f5s79ICPHYek4OO1JrpNdFX5pG07tnWQB5H5MNxCvi7AR6hiwO0QQs0G8G3yTJTKF1HFUyNgEchNnNIGvKxYErtNqK3QGcjkz0xf3Sm2porcgowzI2ZLLYTbVgl+W6UGOFHZgYvKQxp4884nHhk4iLy1P1wzN6ogvvBlKmFv2miAQrxfNDmW9CGAu0+yJmun9NJ3DnJGyTa4jKRp4rgOKRgvZkNQNxMFM7BKjUYd6h1fWsloVE0t+vGReaoELKgO6TxVXyhONzgOs3MF+xzFzAPWcFNuNY0beOt0lwuLZ58iEQlUtkyt4FrIipNG+xHJlusqLy7VPtSqPT+tQoxc11Hy0AIAu/OcQeLxuWKpKOUS8dWV6sR1KZBAxGtMnPkohUrKxBH/aAHw+ftW0JOpEpZM/6XpdSavxhD0PJfVNnyhjc51thhZLaydBpf+xsWStlt2j0Kanqv0uKpSVRqZa5575ur0cBp+VhhHmhYdPQvpUTzFrLogJ/3kao4IBwhfdUrv+NoyGttGy5hzXeJh7tVFVaDgkqvErjDyPj9aRWwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(450100002)(4326008)(31686004)(41300700001)(66946007)(316002)(66476007)(66556008)(5660300002)(66899021)(8936002)(8676002)(2906002)(83380400001)(478600001)(6666004)(6486002)(86362001)(6506007)(82960400001)(186003)(6512007)(53546011)(2616005)(36756003)(38100700002)(26005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1Yxb3V2WjZQSTY4bUR5eWNWRFRhT1psZTUrVFNaNEJ6KzMxZzhiUDNqQXVG?=
 =?utf-8?B?UFJ5OUNNTkhud1JVeS9qaVUxa2JUVnZ2Lyt4Wk1qbC8xNk5Qb3FaNnN1QVMy?=
 =?utf-8?B?bUZIOW5wbnNrUmp4VmJrMDRWQ1ExUkpmanZjL1hKVmNvckhhY0pMN2tFVWN2?=
 =?utf-8?B?aUsrSlNGMGxCb1M5dm96aHpQcjVGYmZXSGdBWGhMd281bUVmWDlGdzhSYzk5?=
 =?utf-8?B?d2l1MDRRbzBmYWZRQUIvVi9sV21Rc3kwQlA0eDdTWUw0YTZqLzREak9ZR3c5?=
 =?utf-8?B?Uk83Sktmemc4TFJFUFQ0MUhnam1qT29VNzNKNjZQSmpiUHY5alRlVHBaSFJl?=
 =?utf-8?B?WGs2U2lsWGRTQndBSXd0NDUzbURTR0Y0ZS9kc2Z1ZXRxZ05zVTZwQTd1UjZK?=
 =?utf-8?B?ZHdRVlQ1dmhkZEZqYkIxc3ZITkUrNWZ1Nm82UXVUWFZXZU1Db29zUFprTXk3?=
 =?utf-8?B?TXE3RTVMTmM2Y3Rhem9HWnZGNG9IS2VFL1JrVmJVQlVkY00rWFZkZjFRSlkr?=
 =?utf-8?B?SzFDZHRuWDNUd1JoUW0vdW8yUDRQRlJmZVB2UWlpeWVTVTNNMThGMjFoQ0ZW?=
 =?utf-8?B?WnB1RkY1a2hYQnI2YjRhbVc4UUdJWFBXaTNOU0hoMGJFbEVjbzNMaW9odUJL?=
 =?utf-8?B?Y0hUWnd3ZGorNXp4eDhveGNBa013VjlCNENXbjdOOVdZQ1RmRlFMa3pDT3B6?=
 =?utf-8?B?Q3AwSDFpdUJHdmRWbmwyYXE0Z3lQWFlicWFDV3BPQkJ3R3lHNjZxVmxubXQ3?=
 =?utf-8?B?d2R6bkUzVXU2c0p0UGVDY0lwM0FVeHo5cmpKVUI4KzBIRTFoQ211dWNJU05y?=
 =?utf-8?B?eFBhMVVHZzZxcEZkMVVhdGRtRmxGdURBMUNJTGk5TlhyOXkvcUJrejZMRHRx?=
 =?utf-8?B?d2s1TlNCRHk3bkF6V3FhU1M4RDVWSTRUenZQSUJXSThQNUU3V1E0Yis5VkFk?=
 =?utf-8?B?VXlZVjBFQjBGbUxvL09GRU93WUhnZDJSaC82aU1zM1pIaldaYlUxc2RKTnpR?=
 =?utf-8?B?b0l2UkkzWUN6YW8vcFdqT3VaL3dyVGxuSHlXVGFlWHpvR3Z3YmUrUkFoaXFX?=
 =?utf-8?B?YTV5bUppd1N2UWlEdk1xMDBzUmR4aHd4a1hvWm9DWGdhOU9IbXBsVERkK2Vt?=
 =?utf-8?B?OW8vcEFUSGVJN01VdExMVUtPU1NnYlk4SlN5MDBlazJZV1kzZ3VnanArMTFs?=
 =?utf-8?B?c3FKMlBMQS9xZ09BdFM3SEo5aWlRQ2l0RVhzV3pyZWJrOGlBNUpLeUFBamlt?=
 =?utf-8?B?Y2dxY0FoKzFHa0J3VU4zR21zaU5qZVJkSFFDWExQWURlVnlaRW8xc0hhZkVJ?=
 =?utf-8?B?MjVsTFZFT3hIcjM2SWxpTUE1bDFPQ1Jla1VralRRc1RudnAwQUFodi9lYitx?=
 =?utf-8?B?bnhBM0VzOVRmYXVGY2pwOEpPZUFaWnNCcG5mT1RsQ09zeEp3TmdZL0ZZeVhp?=
 =?utf-8?B?Tk5sTWlpYmxyQWFIZk9iYzgvbFJ6aEdjWGoxUTdHOGcwdFVpcllLK3BsRlJJ?=
 =?utf-8?B?QkFvQ2dMVWdya3duZ3dJalJIL2hYVG9kd2VZcFR5SnRlNlZOcXN6bHFaZGhy?=
 =?utf-8?B?ZExkZHRzYzJtdGY5WERxMGtVQU9DWStqRVF2cUd4VUpERHVWWU5nU1RzSllh?=
 =?utf-8?B?YTA4WDRUY1owWXZjYlFRVmNnNHd0NG5XTWlDanIyK0F5RVI5QlhBM0J5bGc2?=
 =?utf-8?B?S3JrYWMxVTd5dlAyQU9ibGtHeGc3ZFVkSytFWi9iK2RYM1RvdWdtS2xQY2hs?=
 =?utf-8?B?TXVkSUJuYU9iclBzR21tMUN2TEsvWTlXSndaMm0vUndsYWp5eVd6dEVPSDJ4?=
 =?utf-8?B?OWJYZ1Y1dEJCUC84N0JMVFNCbXUvWWVLMU1KRG5EaG90T0tGZXZGeVM5N2ZC?=
 =?utf-8?B?Z1VFWnhYQ0k3MlJrMnFTcWZXNm00cXMrSS9JdHUydXVsL1VvNmp1cEwraXYz?=
 =?utf-8?B?Vm10SGFyUDMxaEZYRnRxbzNVdWNmeURjdnVVSHJKYWNrOEpYYnc1YktkaTNj?=
 =?utf-8?B?OWl1aUhZdHFQR2pHMmZYcSs2Nm83VnZvSjlqM2FSL2F6eEEvMi93dngyZkpp?=
 =?utf-8?B?aTQwYXVHc09hOHh0UHRRWExMcmlJd243UDNQVzF6UHlseSsyeFhFMTFmNUcy?=
 =?utf-8?B?UEFJQnBDUndPVFNPVURBNnoyUk9uZXN3V290Qy94WHVVZ05ZVFVWLzl2bytW?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c3b105-7bcc-43bb-4c15-08db4847a590
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 00:21:16.2789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MUGeofSquiN4142dkAf69X26qvCNlFILRoSNM0ZIilLmTM+/C1eFk7BH+vqdYOjO5y6PSvu574fgTXqLTyMwHSbvRq3Ice8N+RQp9MoQSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

On 4/28/2023 17:19, Ceraolo Spurio, Daniele wrote:
> On 4/20/2023 6:15 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> If the DEBUG_GEM config option is set then escalate the 'unexpected
>> firmware version' message from a notice to an error. This will ensure
>> that the CI system treats such occurences as a failure and logs a bug
>> about it (or fails the pre-merge testing).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 34 ++++++++++++++----------
>>   1 file changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index bc4011d55667c..c5b21d17ca437 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -17,6 +17,12 @@
>>   #include "i915_drv.h"
>>   #include "i915_reg.h"
>>   +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>> +#define UNEXPECTED    gt_err
>> +#else
>> +#define UNEXPECTED    gt_notice
>
> I tried to find an alternative word that had the same number of 
> characters as "gt_notice" so that we could avoid the indent in the 
> diff, but nothing came to mind, so:
Yup, already went through that! And it didn't seem worth it to 
abbreviate by dropping a single random vowel.

John.


>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> +#endif
>> +
>>   static inline struct intel_gt *
>>   ____uc_fw_to_gt(struct intel_uc_fw *uc_fw, enum intel_uc_fw_type type)
>>   {
>> @@ -828,10 +834,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       if (uc_fw->file_wanted.ver.major && 
>> uc_fw->file_selected.ver.major) {
>>           /* Check the file's major version was as it claimed */
>>           if (uc_fw->file_selected.ver.major != 
>> uc_fw->file_wanted.ver.major) {
>> -            gt_notice(gt, "%s firmware %s: unexpected version: %u.%u 
>> != %u.%u\n",
>> -                  intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -                  uc_fw->file_selected.ver.major, 
>> uc_fw->file_selected.ver.minor,
>> -                  uc_fw->file_wanted.ver.major, 
>> uc_fw->file_wanted.ver.minor);
>> +            UNEXPECTED(gt, "%s firmware %s: unexpected version: 
>> %u.%u != %u.%u\n",
>> +                   intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> +                   uc_fw->file_selected.ver.major, 
>> uc_fw->file_selected.ver.minor,
>> +                   uc_fw->file_wanted.ver.major, 
>> uc_fw->file_wanted.ver.minor);
>>               if (!intel_uc_fw_is_overridden(uc_fw)) {
>>                   err = -ENOEXEC;
>>                   goto fail;
>> @@ -849,16 +855,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>           /* Preserve the version that was really wanted */
>>           memcpy(&uc_fw->file_wanted, &file_ideal, 
>> sizeof(uc_fw->file_wanted));
>>   -        gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, 
>> but only %s (%d.%d.%d) was found\n",
>> -              intel_uc_fw_type_repr(uc_fw->type),
>> -              uc_fw->file_wanted.path,
>> -              uc_fw->file_wanted.ver.major,
>> -              uc_fw->file_wanted.ver.minor,
>> -              uc_fw->file_wanted.ver.patch,
>> -              uc_fw->file_selected.path,
>> -              uc_fw->file_selected.ver.major,
>> -              uc_fw->file_selected.ver.minor,
>> -              uc_fw->file_selected.ver.patch);
>> +        UNEXPECTED(gt, "%s firmware %s (%d.%d.%d) is recommended, 
>> but only %s (%d.%d.%d) was found\n",
>> +               intel_uc_fw_type_repr(uc_fw->type),
>> +               uc_fw->file_wanted.path,
>> +               uc_fw->file_wanted.ver.major,
>> +               uc_fw->file_wanted.ver.minor,
>> +               uc_fw->file_wanted.ver.patch,
>> +               uc_fw->file_selected.path,
>> +               uc_fw->file_selected.ver.major,
>> +               uc_fw->file_selected.ver.minor,
>> +               uc_fw->file_selected.ver.patch);
>>           gt_info(gt, "Consider updating your linux-firmware pkg or 
>> downloading from %s\n",
>>               INTEL_UC_FIRMWARE_URL);
>>       }
>

