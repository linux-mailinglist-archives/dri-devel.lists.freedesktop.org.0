Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB47CB758
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 02:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D128D10E245;
	Tue, 17 Oct 2023 00:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356D810E248;
 Tue, 17 Oct 2023 00:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697502219; x=1729038219;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qa+YHh79/R8S3srgNGYUhrWjae7j8EHviZ0173oka9k=;
 b=D0myg0X0IUNHtAe5YHWeb+rFB2Mh/2QYh9W2iSldhy4b0K1w18BxN6t2
 SjjiV9jjDb6k4qa4eX0AGqD9YW/ImBGKoyGYFLkH+X0cgRBdByPS6fjw1
 2i3Pnuu+I0/s/w45wcGq/f4MjzYwHX351gDyjkyhBG60X2V1Uc4M4Ju/n
 tZnh0kcxCtFNQJ0qAHorHoRk8C7aLgQD45DfAyYrVNNFSyUKS4qcaSO3I
 VeYisMtsqb2hRfLhCaFTHZnHujrDd0AleCj9LrmarRzbaNlGyUKyKiAXo
 2t7TC7+a8ndI7/T2cNm7U+v467UIUdxUfBHa3ApHaBfbxeSU6icMyTVYl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384542106"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="384542106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 17:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="3706749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 17:22:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 17:23:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 17:23:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 17:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOEoaHxgGCL6ZbnfkUpNv7hsWB+xl+SJbJC8/t5fQPz5M7oDrZYsXKyXmxhlWovwv4BnRBNnKdarsWKCP0YdiaRno23EVPuWcKDjvg4pMDVpS0v9zHf5R0n43uo3c38TJttM0NIhDfUuyBupTaO8RhcG3WO+rPsvxIMT0UB+ByBDrabAS5Gt2pFW3g8a+QGyCVNy6J6yqjmZV/5a/AQoQnBxL6WB8mMAo/EyYH6KRsqca1ukJG0+T2mer8kz6F8AjLGA/BDGkMI4VxJAXed/12s/VoOxxKHZj4ZqI3/AsRk3UhivH5gCYQ1h7pS6ff/8ILWo4yHf+Q5GpfTpiAlWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJw4TkYMPBM/Ss/OaQo6AA9KNzoJqsD9AHdukGiAr8A=;
 b=FJ1IM5KqB2+i9J/lRPUDYpXXstAvtjMkoWWJFp7I+qa8CdKHQivrBZSVRVfsE9dPdBxjz9HwMxtwvN+zSyblvnRif+ORcXTqC+3ahXM0Q7SEtcReMtVAG5qC6IBJ3nDx9Sjcw19xJn+FsStGLOpjM9bfmn5PoUQ8QH/CDRGOOm9x6vwfs9TiVEmLm/a+4eLBUwPFkmNNnsuxo7u4LO0rdDQqzTIBfZa0sHR8FgG8+nn2RxKn97cLJqmXVhwP4gbLmJcgvNmqM2yW+DbVdC1qGxPXb0uJpWwj40OiNmbDzhxgutxXU3QxcR+BVz9v95Xe2QOtTTmP34K3A9CQHXN27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 00:23:35 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 00:23:35 +0000
Message-ID: <2b364a80-3d18-17b8-495b-e9a2a9f3c197@intel.com>
Date: Mon, 16 Oct 2023 17:23:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
 <ee2be6d4-1bc6-4516-80cb-408ad6731787@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ee2be6d4-1bc6-4516-80cb-408ad6731787@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: ae385f1b-3241-4e3a-c59e-08dbcea74ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEafVA0QW72lAakYGZkk7nljrPULr3Fa2QYDUwRudcxc+ktHAdaasq+AAkMhCsqzmxwzgvZERjgYCcxLkcoBooiZQwxPM1wQXQAOVsbgM2cVBgwhPQeGlLjBbNVN/OPflyadpjytUk1TeefgImO/PCnHUyePJywISIsEpvMex4C8444kXPpSbkP1g2pu42A2RHzhNz/0R+86/vDX1+dOFMzCwfNVmyjrIcxgeO+7RrGb3hGAoz+qo5uPXyND3Dtp0jICUFFlXF8QiOL9OiaItzB7B4H54OtOjlVoc5Z7j8YJ6Ds0x4N6ckGPFio1RUrwYMUvVzTuGfGTRjb5T5Vi5dR3boUbPfwaIc2IWLBWLrjx6noT6jekZPkiqaFxqEIqGNsfe9LkyaUf7oHO2OKTkbQ0axJgUb8MHB2N4UUTaF6yB6f1jYTVTPvlO95w8ZOFP4LKiaO9rHR6Z5Js04zy+6y2ep+rbfqSAehgSEEqiNFBYo3iq2nuReWqS0LpBk7FrZYTIXHRuNIjksioLT24BCBlk8oqPkh0S2V3Gp6kIo0r+mJR2TzJ6Us95DN2cVMR18LJaWBY+z8V7RDaDS4armizRbBbxGbtj4PwFMKmKJGjfsLQ061MAIDkuUfcgAzTZhuY4Lc1BlaESYdCpD2ynA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(66899024)(38100700002)(6512007)(82960400001)(26005)(107886003)(2616005)(478600001)(6486002)(5660300002)(8676002)(8936002)(86362001)(2906002)(31696002)(450100002)(4326008)(36756003)(41300700001)(66476007)(66556008)(316002)(54906003)(66946007)(53546011)(6506007)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1FaSS9USEZUNUNGOTZRRHU5U0oydnVDT1Jqd3MrV3hqeld4VmNlM0JmQnRK?=
 =?utf-8?B?bm9uc2dyYkRWbEtlU2ljR3QyYUhuYmFleitiRG9vWlZyRGhRSkNJcGxseWdP?=
 =?utf-8?B?UEtQczVtTFk2M1NzNlgvV1IrZC9VbDViK2pndlRQbkloQ2lsTEhRVi9wWXlv?=
 =?utf-8?B?bjI0NWNZQnBhNG9iOHFSOHVVc2U5VmRnQS9wR0tJQWR6UTRGb1VLeHVVMVdL?=
 =?utf-8?B?OHdkS0JFazNVc1k4Y3IwYU5ROHBlM2Q4aGE4M1hpSTJKTVRQWFQ5MktNdG1P?=
 =?utf-8?B?QkZPaHdQWlRLNmU3NTY2bnNiTnBpVkRqQ0ZTMGhWM0N3dFJCYmh3UCttTjMr?=
 =?utf-8?B?QmhVOWwwakFFeE5wOEtJK1pjWTlrazJtRFVCME1xcnQrNU9MaFNleks1MWNF?=
 =?utf-8?B?ZEk3QjJabEVQYXkvRDVVcGxwZUZmVys2Wm42RHY1TCtKMTBUV3JaWThzcjJH?=
 =?utf-8?B?ZVNXK2xBRHd2dGFNQjRTSDcyN3FIeU1JUnZrang1YU9yVklxOVdhSmozU251?=
 =?utf-8?B?cnFpSVdETzJIOEdXbzZERG5jZjZSTUY2VFBkbEt2cWJQVkt1M0t6QUxIN0Ev?=
 =?utf-8?B?WkJuZ3EwaXF2Q0NJbVdJdHowcnBFTk5qSlJSRk9hcHU2MzJVc1BnREVzWjNa?=
 =?utf-8?B?SlpmYzBNNUxTV0ZkUWtSL1lvd0RXYXB5aDVJMGJTK2R3N3lHNlV1UUpjaGNM?=
 =?utf-8?B?Q0pDUm43d2NzWmFYeXA5Qk5WWTRzMTFDbjVTSzF1WThuR1FaUkNGU21Td1Na?=
 =?utf-8?B?SW02N1FDWmE5VllmRlpTOUNrSERSUWNmNFlPMTNzRER5MWpIVzF2OVdCdU9F?=
 =?utf-8?B?NHhZR2gzeUZnZEkvTTd3RDVoK3N0OEFuMlB5MnFuZ1RQbU5HelRtcWcxWHor?=
 =?utf-8?B?Tmx0NWc2S2c5OHpDOHZmMm80eGdrTUhyaXk3WXkvRlZKSUxQbUpMTDZQSzdG?=
 =?utf-8?B?MHc4WjVQb3REdVJzcm4rdDAydTVtUHUyRXZRNzFyQVArS2trT2RLQlQxQ1dU?=
 =?utf-8?B?WkRtVlNJbEcvVFNiU01FVHZjVjBNaHdsTmFMOW5XbXBhS3RZWXYzUngxVEUy?=
 =?utf-8?B?alAwdjN5eEwwYWhQL0xYVlZuZjU3d1NkSFA2Z21RZUh4b0FuSzdQczZEWlYv?=
 =?utf-8?B?R205T09Ddk82RUdnSE9WNDQ0QVh1T0VteWRXMWJBNnJDdXcxZlR4QjdnMk1B?=
 =?utf-8?B?UUZlKzkrYWlmc0ZiQjlqcXdIRkwrS01IQmFwbmc5RFBqME9SQ0U5bFMzWVN4?=
 =?utf-8?B?bzlWa05PbVZ0dW5GcnNnanNXTkdnRGlFSWpTMDlBejV1OGszTlJoQ2pnNlo0?=
 =?utf-8?B?eC9QYU9jOGZhUmEvdGtsdEFyN2pEZWxkd0o2S1BTZVdOMWlRZ0pYY1orMFJM?=
 =?utf-8?B?a2RITjFZQXo3aFl0OHRMYlJRWnFzSGVCRUJjMzRZRFBBV1pOTXJhRkxEbktW?=
 =?utf-8?B?WXg0c080MnhjbTR4c0ZsUE1XWTdKNnhGMnBJM1gwQVVGZ0JBSitHWDBIbHlT?=
 =?utf-8?B?dEZFSzdRTXVXQXcvdXNGMXQxbWxialFoajdjQ3ZWcWY2TmVMazFjOUlsN0pL?=
 =?utf-8?B?K1lXalBBZmluWS9BN3lWY3ZDelB3V0t1WkFVN1k0cDBNSUhyUEN1QUxpT2pq?=
 =?utf-8?B?Zk13eWZvdFBKUnhrK3ZUNk9MdjVZamNMUmlDQ1hCOXhaZnhuVVFscHZkNWlk?=
 =?utf-8?B?c0xTWDB0b2FINlRYRkRQUGZoa1E4NnRldjBCS0VIOWhXSmwxUmN6N3UxUXRu?=
 =?utf-8?B?eVcyQ0p1QUJhYmZNcDBmVFZJUGFJVUNuOWRDaXoyeHEzZlZxN3RZZUs4MmFw?=
 =?utf-8?B?akZiUlVxTlkyUEpNbTUxUE5xZDBPdHo0WitTby9rRzlLU0dvN3dCNmhNczg5?=
 =?utf-8?B?b1RsdnFHelhCTWdqZkNKNEFVSU5DSFlFY3RvVjNLUVM3SGcrdVNzcjhkLzZh?=
 =?utf-8?B?M0RNZFFwK2pnQ2lDSWhyc1hlMWI3QUYwTHBYL3ZPN3REOSt3NEpsME0zeENJ?=
 =?utf-8?B?UTNSdnpvUkp4cko2N3ZhMmJhaU0xeWpEWSt5N1ZMNWgyUUN0b3NnOCt0Mm4x?=
 =?utf-8?B?bU5OZXVGLysrYjJZd3pQWStNTENwZHdmOWhjaDY4dzZyRFdlbDNHaFJJYk9s?=
 =?utf-8?B?Q0U0Z1pFS21Kc3pXRUM2M1kxVUhkQmlGVG1xRzFuRG5xU3hPUk1mT2Q3UFlN?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae385f1b-3241-4e3a-c59e-08dbcea74ce4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 00:23:34.9412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYrtvjPZa44k/LmkdCMIytacPtxeoxknQaZ2mFp7nMuN623HpZZx3qQGItfF1BdzAYSHdsHO/wrIOfKaUeSvIKi3wT6q8esye6qNFdq3O5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
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
Cc: Nirmoy Das <nirmoy.das@intel.com>, Mikka Kuoppala <mika.kuoppala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/16/2023 4:24 PM, John Harrison wrote:
> On 10/16/2023 15:55, Vinay Belgaumkar wrote:
>> This bit does not cause an explicit L3 flush. We already use
> At all? Or only on newer hardware? And as a genuine spec change or as 
> a bug / workaround?
>
> If the hardware has re-purposed the bit then it is probably worth at 
> least adding a comment to the bit definition to say that it is only 
> valid up to IP version 12.70.
At this point, this is a bug on MTL since this bit is not related to L3 
flushes as per spec. Regarding older platforms, still checking the 
reason why this was added (i.e if it fixed something and will regress if 
removed). If not, we can extend the change for others as well in a 
separate patch. On older platforms, this bit seems to cause an implicit 
flush at best.
>
>> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
>>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> index ba4c2422b340..abbc02f3e66e 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> @@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct 
>> i915_request *rq)
>>   int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>>   {
>>       struct intel_engine_cs *engine = rq->engine;
>> +    struct intel_gt *gt = rq->engine->gt;
>>         /*
>>        * On Aux CCS platforms the invalidation of the Aux
>> @@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, 
>> u32 mode)
>>            * deals with Protected Memory which is not needed for
>>            * AUX CCS invalidation and lead to unwanted side effects.
>>            */
>> -        if (mode & EMIT_FLUSH)
>> +        if ((mode & EMIT_FLUSH) &&
>> +            !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
> Why stop at 12.71? Is the meaning only changed for 12.70 and the 
> old/correct version will be restored in later hardware?

Was trying to keep this limited to MTL for now until the above 
statements are verified.

Thanks,

Vinay.

>
> John.
>
>
>>               bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>>             bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>> @@ -812,12 +814,14 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct 
>> i915_request *rq, u32 *cs)
>>       u32 flags = (PIPE_CONTROL_CS_STALL |
>>                PIPE_CONTROL_TLB_INVALIDATE |
>>                PIPE_CONTROL_TILE_CACHE_FLUSH |
>> -             PIPE_CONTROL_FLUSH_L3 |
>>                PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>>                PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>>                PIPE_CONTROL_DC_FLUSH_ENABLE |
>>                PIPE_CONTROL_FLUSH_ENABLE);
>>   +    if (!(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
>> +        flags |= PIPE_CONTROL_FLUSH_L3;
>> +
>>       /* Wa_14016712196 */
>>       if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || 
>> IS_DG2(i915))
>>           /* dummy PIPE_CONTROL + depth flush */
>
