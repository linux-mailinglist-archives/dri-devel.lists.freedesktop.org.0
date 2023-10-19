Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4267D02DF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 21:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720EA10E0BA;
	Thu, 19 Oct 2023 19:57:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5450010E069;
 Thu, 19 Oct 2023 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697745424; x=1729281424;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qLWISH/kOB/wv0N/cC9W7LXrnrzJ0+Bd1h/+fgi4+mg=;
 b=kZf1IeHQMG2aj2izoVpaHu0PNLo25V69PvwHf1+koiubQ8L1camkv4b7
 PIR7VsVEk2v/5MA/J0jxbfWio8gwaZjdMx3Wrk8D5UTUPARM+tR/dp4yt
 ohUZU4PEAspQ25KHZZXvGFbgWpqnIy89gBZJOblS46zViAPk1Nr/QCRx0
 +F2nZJj67kN3myqdsiDPvF+lF7vqGm4JrCLMU35q0ZsujEwwuvmtrFnVb
 9FKGkkcrstOYSyFYTZ3rCZG26wwJRHsv7JcaG4Zm35GLith68P/g+XbVs
 atTJSoukZxvZJTFAC8J6OCbFNepavOx+JjwmXfs6zzM3khEG2jYVVj3EX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452826183"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="452826183"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 12:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="786534845"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="786534845"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 12:57:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 12:57:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 12:57:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 12:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFaEWZLIsjUZ7mw9dLx8cRrZWl68mWgprjcdpc9/J31U6f5+TIgwWeSv4c37HZ9BI+qQ56PUjMkebxnMJznt/Efrgbk4NcU6KILUoYVlkgTkoZbamDk8dEM8Fk1CLUUgB2avF9pYxSmbc5U9WvIyD/yGXV0ORQFnaUQVi065yywy+lXIroXeAavZt2b/kTJIHSXffq/l/7+TSuk4oPZuV1KoT6fv90rMOBjfx6UZSRsYX+7VXbUTvIeEOxXz0FjEVNMn0cybIFdKGLO9MejZwtJ6ZDV3ZcSogiLoyrLFi93r+cKm1dpEcmvo12L0DMoP1U0iQKt0YP0u3JwO5s8qkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mskJ1Cg8n0VkI3sF9mKIf5hFv1vUBj8PALxTWSg4h+E=;
 b=gkvCaz/+5A8Lj5/EgyCbARvtdQNarrg269YhTkIFlNY8QhzEAS7l59I/HwIYj9w1gwLfJVoBTd3IEWnKsoV7rCjdYu51PgF07l355s/eS6izSsliJckmFbmYgFljGaLfNILKZVEY2KRegR1Nql9Bb/paVKCcPJsBNMmRxq+D6G3dM2DDGnkSjQgEjzOtoDakIFojg2cjLd95OUqvH3q4kaOVDupbve5BtUJ87ajAHHssYCGZrOsCz0vScVn/VLyv3x7SpZQYovQsbZdpr/7OQVXslI8GQD5YagsCfuKLS5/Rw3oABCLyn1ril7Kmb+j4JPc79/oWys9wdFVcxJXIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5181.namprd11.prod.outlook.com (2603:10b6:a03:2de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.41; Thu, 19 Oct
 2023 19:56:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5dc4:882d:948f:55d4]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5dc4:882d:948f:55d4%6]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 19:56:55 +0000
Message-ID: <1a2c9873-43fc-4432-8714-488709e31f26@intel.com>
Date: Thu, 19 Oct 2023 12:56:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/mtl: Add counters for engine
 busyness ticks
Content-Language: en-GB
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
 <20230922222510.2235213-4-John.C.Harrison@Intel.com>
 <7da1b636-770f-5b1a-e4f2-b2026aebc8ef@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <7da1b636-770f-5b1a-e4f2-b2026aebc8ef@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:303:8c::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5181:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cf2e90-22a2-49a9-2696-08dbd0dd8b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VtujN0w48R4K9j+v7Gb2PJ/qm6Mg4Q7Ix6bGth93aOMYn9uIN4i49TDhFpCtub1BhWMvyhdw5iYXai1ly6Z4UsNLfZTYOKE1jTHc+bW0g6xYr4tqy41Q0w9IwPDyoktevVkas9W2gxp5GFpYYaLvHc1zcSjJiY/76WM2kXasKYYZV9B9NPnkb/OaWiOxlDMoJVOMZwxsBsEEBjgrnJrAY4atkafPbKbhDUs+QfzxukAcqkAhbRoMLUvsvn7ncRdpK8ubBX6MzSCKfnF1R6OANm+0/kimabpJVbCyBoHxudBxJ9TkZvZX4EcT06za97SbSXxT8k15lyf3E6NZn0g9ne+wb2ORZ5/a/jO3b3qMl7PEdlxZw58LLvm0lGaJ3CUhVHvXtUZ1F2m/2WmW8HrZJZ858yOAC6/vqWlYEqakd8DnPGQ3o3H2fWkjrmKcs6eki/YbMmXsqS3tmFQY3LW+z5iPk6TyN+2Jij0PjL8/JMyxUfkTdJ1Ez+dtL5nREtx8AuqkGvjgmw04ZJgFpBOaSjgHP38mGPc+Uep5Ma4CQUM5jkpu+hrH1Z3pphBQdCHnwsfGAU2IwER8uQd8ACuacC4/QVM/M9LrNkgvG6KfjAuImXjm6hSgAmK+rAEmeix7AlIORfNF+4WnsxZRno8LnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(83380400001)(82960400001)(36756003)(26005)(316002)(66556008)(66476007)(66946007)(2616005)(6512007)(86362001)(38100700002)(31686004)(6666004)(31696002)(6486002)(53546011)(478600001)(2906002)(6506007)(450100002)(8676002)(5660300002)(4326008)(8936002)(30864003)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThUbXlGbzJTSjgwYUpGdVV6c2owZlZMMmNlc0hINy9Mc0daTHQ1ZnJPR1dN?=
 =?utf-8?B?aFhQMFhuRU5jU2gxK1dQN2I5MFR6cVNsTHAvRGt6TTdRRDF2UityQ0FxaHlJ?=
 =?utf-8?B?MHdQSktXelJZZ05leSsyVE9LL0llWlJwaFE3V005VWdnaDNUWHVESVBvUmNH?=
 =?utf-8?B?ZjFqdmxFNGxYMHJnVXBDdW1aRWpoTXRiWkNpZHBLMEttRWZ1QURjTlVvMUJ6?=
 =?utf-8?B?WjNhZkJ2WHM0QjAyMTdpaElMS1A5MFJXY2V1d1BRVytaVkhHYm9WTXE4ZU1w?=
 =?utf-8?B?UENtMWYzRmFrbnFUVGZpdkx3Y2IwWFZZYjkwZ0lpZ2FCY3RxR1M2eVA3QmJQ?=
 =?utf-8?B?bStHa2hEZWZDUlFGdW8wb3AxTUpWck90WE03d2tCV0dRS0dNanlBWEtpa1da?=
 =?utf-8?B?N3RqbllLL2JNNkNLZUtEWWZTMkRJeUxFcGVBejRxQWhxTkpEL3BQZUc5MUNQ?=
 =?utf-8?B?WWlCUU05eEpMQmpNT2NrTzdaWFc1MWdHSXZUY3RpcGRnOFB4cUtjc1U3anB1?=
 =?utf-8?B?b3QzOFpLejEzTytLNnFqYzQ4c3BuOGNhaWNGaDBlYnVWa1Q4ZC9jdFA4bHpo?=
 =?utf-8?B?V3RkS1dGNy8ydUdBQ1hoNzZyeEl1SmM3RzlMVnREejY5eU9Lbkx1ZU1hbHU3?=
 =?utf-8?B?M0NQSm5uL2VpbStYVnBYbXlWOGZDamQrWlBKOTMwcUgrYXk5S0h5Q0t0MnFP?=
 =?utf-8?B?VW13dnh0TnpLWWFXOEQyTk5CM2VybFA0alFjWTA5RTY2UjMzZW5MVGZFdEM2?=
 =?utf-8?B?Z05mME83ZTcwWVpUUXU3YTh2c3I4cUlNQ0x5WFpIQnY2TWlraTQ1U2JycVRL?=
 =?utf-8?B?eGFUWnkyYXkvNmlrQmxZZFJrTFcxYk41Z2ZpSGd2ck5VL256L2R6NzdmRHJO?=
 =?utf-8?B?Wi9YSC9BdjZnZ1hhZ2x0NWdoVC9CSzJTRjRlcUZTbkFOTDlUelc5aUl2T1BX?=
 =?utf-8?B?ZTlGZnBpK1VaVzhXYTZIZnRxTUI1eFNReTBjYVNlampGdkVoNTZjTkFqdlNn?=
 =?utf-8?B?dEpCT29zanVTWWhhUVprVnZpV2NZVWdKdlc4RlJNWFVaQlo2UDlBNXpJbFU3?=
 =?utf-8?B?eHZRYjVYeDZSeC9WWkc0QWpCaDVqTEJzeklaSzFxcFJSN2ZFWVp2SWRMZXVY?=
 =?utf-8?B?S2xQSTlDeWZPSVNod2lST1d2d283dmFENTIyOHc3U3RqdzBGNXFoZGU0WDdv?=
 =?utf-8?B?Z1VQOHQ0M2k3dnViakN6SjcwM0dCWEIvdnIwQ2QzZ3dIcW9kSVZ1TFRWZGJV?=
 =?utf-8?B?V2RwUmxQMklFQWdxbnpxOThrcWN5WEJockNNVEk4NHk2SEJwaTBHa0dKTndi?=
 =?utf-8?B?eDhqWHNaSFpTQ2ZwWmk4ZHZkVlB1S2FSSXNETkhNVDNCT1ZjVVRSc1lMcm9x?=
 =?utf-8?B?dTJyd0FJNXA5bnMyOWJTNzZueFc5ME8xd3JyYThrazRoQ2VQaTA0M3V0aXQw?=
 =?utf-8?B?cHZ6eHBtMThrN0Z0MmNFbkM3VTJVRUVEVDZ2eW1kei8xWXViZ3Y3MHVMbHNj?=
 =?utf-8?B?a0JqaHZ4MXFndEJleHk4ZVN4TU1GRVN6ZE15azJ2WlF2WDFvRG5pU2dzYjFj?=
 =?utf-8?B?ZVE0NWNQSHBKR2RrcTg4b0tHcDkyNkJsQVNrZGZRU05tbm9ITVVqT1ltMkFu?=
 =?utf-8?B?UkVjZER1RzJJZTBsWXNSWUFHYk50d0FyVGNZS1ltL0xHNmtETGVFTDFac3cz?=
 =?utf-8?B?R1JBa3BtemN2d1ZBOGxZVFVuU2t4eHgzRUdWVXJBem9PUzRmQURTMEplMnND?=
 =?utf-8?B?emVFRzFPVE5TdHh2Uk8xSGc2Z1JWWlRMRzcwZ1pFMlhCYTB6bG5sbHhHK3Ir?=
 =?utf-8?B?TGdFRktBa1l1UWFyN0c1SDNWaW90TUY1dlJIRGY5Yk8vR2FCYml5RzJSdzNx?=
 =?utf-8?B?L3dXajU0T1d2dTduejF5U1VLLzJ1S0lxa0VCSUtWYVNIYUk4b05ocU4vWnRs?=
 =?utf-8?B?emo0YXBXOHRHSkFudVpMSDRsenVzdW15RURTVWJoYWNwdDh0K1FkcnErQjFn?=
 =?utf-8?B?dUpRcENRZGVvbU5qbXlCeXZZbWtkRjkwZnIzVnY4bjMyVFlOWk45WXM1NE9q?=
 =?utf-8?B?SHZDQlU4Mm1kUkF1anQ4OWdhUFdHdjJlVnI5dy9saVl6ODVMc1VpQzF0cXVo?=
 =?utf-8?B?Z3AyWldMamdhVVNNYjhZRnhGVVpQK2I1NjhadUlqVGl6Qi9sZlhqaFl3MG5y?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cf2e90-22a2-49a9-2696-08dbd0dd8b84
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 19:56:55.1632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2c9DDXaXRYt6n3IBZ0dcTRs4f8V+ZCJhXhjjGMarYxibEIEesJmpIP1ahltqv6FLK5yp6JxjyXMVG0YQcSivtBThoQT6DCa10D/qZ0b1Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5181
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

On 10/19/2023 09:21, Dong, Zhanjun wrote:
> See comments inline below.
>
> Zhanjun
>
> On 2023-09-22 6:25 p.m., John.C.Harrison@Intel.com wrote:
>> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> In new version of GuC engine busyness, GuC provides engine busyness
>> ticks as a 64 bit counter. Add a new counter to relay this value to the
>> user as is.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine.h        |  1 +
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 16 +++++
>>   drivers/gpu/drm/i915/gt/intel_engine_types.h  | 12 ++++
>>   drivers/gpu/drm/i915/gt/intel_engine_user.c   |  1 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 67 ++++++++++++++-----
>>   drivers/gpu/drm/i915/i915_pmu.c               | 25 ++++++-
>>   drivers/gpu/drm/i915/i915_pmu.h               |  2 +-
>>   include/uapi/drm/i915_drm.h                   | 13 +++-
>>   8 files changed, 116 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>> index b58c30ac8ef02..57af7ec8ecd82 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>> @@ -249,6 +249,7 @@ void intel_engine_dump_active_requests(struct 
>> list_head *requests,
>>     ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine,
>>                      ktime_t *now);
>> +u64 intel_engine_get_busy_ticks(struct intel_engine_cs *engine);
>>     void intel_engine_get_hung_entity(struct intel_engine_cs *engine,
>>                     struct intel_context **ce, struct i915_request 
>> **rq);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 84a75c95f3f7d..1c9ffb1ae9889 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -2426,6 +2426,22 @@ ktime_t intel_engine_get_busy_time(struct 
>> intel_engine_cs *engine, ktime_t *now)
>>       return engine->busyness(engine, now);
>>   }
>>   +/**
>> + * intel_engine_get_busy_ticks() - Return current accumulated engine 
>> busyness
>> + * ticks
>> + * @engine: engine to report on
>> + *
>> + * Returns accumulated ticks @engine was busy since engine stats 
>> were enabled.
>> + */
>> +u64 intel_engine_get_busy_ticks(struct intel_engine_cs *engine)
>> +{
>> +    if (!engine->busyness_ticks ||
>> +        !(engine->flags & I915_ENGINE_SUPPORTS_TICKS_STATS))
>> +        return 0;
>> +
>> +    return engine->busyness_ticks(engine);
>> +}
>> +
>>   struct intel_context *
>>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>                   unsigned int count, unsigned long flags)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> index 40fd8f984d64b..a88d40c74d604 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> @@ -548,6 +548,11 @@ struct intel_engine_cs {
>>       ktime_t        (*busyness)(struct intel_engine_cs *engine,
>>                       ktime_t *now);
>>   +    /*
>> +     * Get engine busyness ticks
>> +     */
>> +    u64        (*busyness_ticks)(struct intel_engine_cs *engine);
>> +
>>       struct intel_engine_execlists execlists;
>>         /*
>> @@ -574,6 +579,7 @@ struct intel_engine_cs {
>>   #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
>>   #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
>>   #define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
>> +#define I915_ENGINE_SUPPORTS_TICKS_STATS   BIT(13)
>>       unsigned int flags;
>>         /*
>> @@ -649,6 +655,12 @@ intel_engine_supports_stats(const struct 
>> intel_engine_cs *engine)
>>       return engine->flags & I915_ENGINE_SUPPORTS_STATS;
>>   }
>>   +static inline bool
>> +intel_engine_supports_tick_stats(const struct intel_engine_cs *engine)
>> +{
>> +    return engine->flags & I915_ENGINE_SUPPORTS_TICKS_STATS;
>> +}
>> +
>>   static inline bool
>>   intel_engine_has_preemption(const struct intel_engine_cs *engine)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> index dcedff41a825f..69eb610b5ab0a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> @@ -100,6 +100,7 @@ static void set_scheduler_caps(struct 
>> drm_i915_private *i915)
>>           MAP(HAS_PREEMPTION, PREEMPTION),
>>           MAP(HAS_SEMAPHORES, SEMAPHORES),
>>           MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
>> +        MAP(SUPPORTS_TICKS_STATS, ENGINE_BUSY_TICKS_STATS),
>>   #undef MAP
>>       };
>>       struct intel_engine_cs *engine;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 0c1fee5360777..71749fb9ad35b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1289,12 +1289,7 @@ static void 
>> busy_v1_guc_update_pm_timestamp(struct intel_guc *guc, ktime_t *now)
>>       guc->busy.v1.gt_stamp = ((u64)gt_stamp_hi << 32) | gt_stamp_lo;
>>   }
>>   -/*
>> - * Unlike the execlist mode of submission total and active times are 
>> in terms of
>> - * gt clocks. The *now parameter is retained to return the cpu time 
>> at which the
>> - * busyness was sampled.
>> - */
>> -static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs 
>> *engine, ktime_t *now)
>> +static u64 __busy_v1_guc_engine_busyness_ticks(struct 
>> intel_engine_cs *engine, ktime_t *now_out)
>>   {
>>       struct intel_engine_guc_stats_v1 stats_saved, *stats = 
>> &engine->stats.guc_v1;
>>       struct i915_gpu_error *gpu_error = &engine->i915->gpu_error;
>> @@ -1304,6 +1299,7 @@ static ktime_t 
>> busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>>       unsigned long flags;
>>       u32 reset_count;
>>       bool in_reset;
>> +    ktime_t now;
>>         spin_lock_irqsave(&guc->busy.v1.lock, flags);
>>   @@ -1318,7 +1314,7 @@ static ktime_t 
>> busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>>       reset_count = i915_reset_count(gpu_error);
>>       in_reset = test_bit(I915_RESET_BACKOFF, &gt->reset.flags);
>>   -    *now = ktime_get();
>> +    now = ktime_get();
>>         /*
>>        * The active busyness depends on start_gt_clk and gt_stamp.
>> @@ -1334,7 +1330,7 @@ static ktime_t 
>> busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>>            * start_gt_clk' calculation below for active engines.
>>            */
>>           busy_v1_guc_update_engine_gt_clks(engine);
>> -        busy_v1_guc_update_pm_timestamp(guc, now);
>> +        busy_v1_guc_update_pm_timestamp(guc, &now);
>>           intel_gt_pm_put_async(gt);
>>           if (i915_reset_count(gpu_error) != reset_count) {
>>               *stats = stats_saved;
>> @@ -1342,16 +1338,37 @@ static ktime_t 
>> busy_v1_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>>           }
>>       }
>>   -    total = intel_gt_clock_interval_to_ns(gt, stats->total_gt_clks);
>> +    total = stats->total_gt_clks;
>>       if (stats->running) {
>>           u64 clk = guc->busy.v1.gt_stamp - stats->start_gt_clk;
>>   -        total += intel_gt_clock_interval_to_ns(gt, clk);
>> +        total += clk;
>>       }
>>         spin_unlock_irqrestore(&guc->busy.v1.lock, flags);
>>   -    return ns_to_ktime(total);
>> +    if (now_out)
>> +        *now_out = now;
>> +
>> +    return total;
>> +}
>> +
>> +/*
>> + * Unlike the execlist mode of submission total and active times are 
>> in terms of
>> + * gt clocks. The *now parameter is retained to return the cpu time 
>> at which the
>> + * busyness was sampled.
>> + */
>> +static ktime_t busy_v1_guc_engine_busyness(struct intel_engine_cs 
>> *engine, ktime_t *now)
>> +{
>> +    u64 ticks = __busy_v1_guc_engine_busyness_ticks(engine, now);
>> +    u64 ns = intel_gt_clock_interval_to_ns(engine->gt, ticks);
>> +
>> +    return ns_to_ktime(ns);
>> +}
>> +
>> +static u64 busy_v1_guc_engine_busyness_ticks(struct intel_engine_cs 
>> *engine)
>> +{
>> +    return __busy_v1_guc_engine_busyness_ticks(engine, NULL);
>>   }
>>     static void busy_v1_guc_enable_worker(struct intel_guc *guc)
>> @@ -1607,6 +1624,16 @@ static ktime_t 
>> busy_v2_guc_engine_busyness(struct intel_engine_cs *engine, ktime
>>       return ns_to_ktime(total);
>>   }
>>   +static u64 busy_v2_guc_engine_busyness_ticks(struct 
>> intel_engine_cs *engine)
>> +{
>> +    struct intel_guc *guc = &engine->gt->uc.guc;
>> +    u64 ticks_engine;
>> +
>> +    __busy_v2_get_engine_usage_record(guc, engine, &ticks_engine, 
>> NULL, NULL);
>> +
>> +    return ticks_engine;
>> +}
>> +
>>   static u64 busy_v1_intel_guc_total_active_ticks(struct intel_guc *guc)
>>   {
>>       return guc->busy.v1.gt_stamp;
>> @@ -4480,12 +4507,20 @@ static void guc_default_vfuncs(struct 
>> intel_engine_cs *engine)
>>           engine->emit_flush = gen12_emit_flush_xcs;
>>       }
>>       engine->set_default_submission = guc_set_default_submission;
>> -    if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1))
>> -        engine->busyness = busy_v1_guc_engine_busyness;
>> -    else
>> -        engine->busyness = busy_v2_guc_engine_busyness;
>> +    if (GUC_SUBMIT_VER(&engine->gt->uc.guc) < MAKE_GUC_VER(1, 3, 1)) {
>> +        if (GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 70))
>> +            engine->busyness = busy_v1_guc_engine_busyness;
>> +        engine->busyness_ticks = busy_v1_guc_engine_busyness_ticks;
>> +    } else {
>> +        if (GRAPHICS_VER_FULL(engine->i915) < IP_VER(12, 70))
>> +            engine->busyness = busy_v2_guc_engine_busyness;
>
> Do we leave engine->busyness not initialized when >= IP_VER(12, 70)?
These vfuncs are all zero initialised and checked for null before being 
called. And the intention was that MTL would not support the old API as 
it not a good fit for current hardware. However, that plan was rejected 
and the whole v2 implementation is currently shelved for upstream due to 
power implications that need to be resolved.

John.


>
>> +        engine->busyness_ticks = busy_v2_guc_engine_busyness_ticks;
>> +    }
>> +
>> +    if (engine->busyness)
>> +        engine->flags |= I915_ENGINE_SUPPORTS_STATS;
>>   -    engine->flags |= I915_ENGINE_SUPPORTS_STATS;
>> +    engine->flags |= I915_ENGINE_SUPPORTS_TICKS_STATS;
>>       engine->flags |= I915_ENGINE_HAS_PREEMPTION;
>>       engine->flags |= I915_ENGINE_HAS_TIMESLICES;
>>   diff --git a/drivers/gpu/drm/i915/i915_pmu.c 
>> b/drivers/gpu/drm/i915/i915_pmu.c
>> index 4f52636eb4a80..1b859556644f6 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -26,7 +26,8 @@
>>   #define ENGINE_SAMPLE_MASK \
>>       (BIT(I915_SAMPLE_BUSY) | \
>>        BIT(I915_SAMPLE_WAIT) | \
>> -     BIT(I915_SAMPLE_SEMA))
>> +     BIT(I915_SAMPLE_SEMA) | \
>> +     BIT(I915_SAMPLE_BUSY_TICKS))
>>     static cpumask_t i915_pmu_cpumask;
>>   static unsigned int i915_pmu_target_cpu = -1;
>> @@ -161,8 +162,11 @@ static bool pmu_needs_timer(struct i915_pmu *pmu)
>>        * Also there is software busyness tracking available we do not
>>        * need the timer for I915_SAMPLE_BUSY counter.
>>        */
>> -    if (i915->caps.scheduler & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
>> +    if ((i915->caps.scheduler & 
>> I915_SCHEDULER_CAP_ENGINE_BUSY_STATS) ||
>> +        (i915->caps.scheduler & 
>> I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS)) {
>>           enable &= ~BIT(I915_SAMPLE_BUSY);
>> +        enable &= ~BIT(I915_SAMPLE_BUSY_TICKS);
>> +    }
>>         /*
>>        * If some bits remain it means we need the sampling timer 
>> running.
>> @@ -362,7 +366,8 @@ static void engine_sample(struct intel_engine_cs 
>> *engine, unsigned int period_ns
>>           add_sample(&pmu->sample[I915_SAMPLE_SEMA], period_ns);
>>         /* No need to sample when busy stats are supported. */
>> -    if (intel_engine_supports_stats(engine))
>> +    if (intel_engine_supports_stats(engine) ||
>> +        intel_engine_supports_tick_stats(engine))
>>           return;
>>         /*
>> @@ -519,6 +524,13 @@ engine_event_status(struct intel_engine_cs *engine,
>>   {
>>       switch (sample) {
>>       case I915_SAMPLE_BUSY:
>> +        if (!intel_engine_supports_stats(engine))
>> +            return -ENODEV;
>> +        break;
>> +    case I915_SAMPLE_BUSY_TICKS:
>> +        if (!intel_engine_supports_tick_stats(engine))
>> +            return -ENODEV;
>> +        break;
>>       case I915_SAMPLE_WAIT:
>>           break;
>>       case I915_SAMPLE_SEMA:
>> @@ -651,6 +663,9 @@ static u64 __i915_pmu_event_read(struct 
>> perf_event *event)
>>                 val = ktime_to_ns(intel_engine_get_busy_time(engine,
>>                                        &unused));
>> +        } else if (sample == I915_SAMPLE_BUSY_TICKS &&
>> +               intel_engine_supports_tick_stats(engine)) {
>> +            val = intel_engine_get_busy_ticks(engine);
>>           } else {
>>               val = engine->pmu.sample[sample].cur;
>>           }
>> @@ -1000,6 +1015,7 @@ create_event_attributes(struct i915_pmu *pmu)
>>           __engine_event(I915_SAMPLE_BUSY, "busy"),
>>           __engine_event(I915_SAMPLE_SEMA, "sema"),
>>           __engine_event(I915_SAMPLE_WAIT, "wait"),
>> +        __engine_event(I915_SAMPLE_BUSY_TICKS, "busy-ticks"),
>>       };
>>       unsigned int count = 0;
>>       struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -1103,6 +1119,9 @@ create_event_attributes(struct i915_pmu *pmu)
>>                                   engine->uabi_instance,
>>                                   engine_events[i].sample));
>>   +            if (engine_events[i].sample == I915_SAMPLE_BUSY_TICKS)
>> +                continue;
>> +
>>               str = kasprintf(GFP_KERNEL, "%s-%s.unit",
>>                       engine->name, engine_events[i].name);
>>               if (!str)
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.h 
>> b/drivers/gpu/drm/i915/i915_pmu.h
>> index 41af038c37388..72a9c71944f8d 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.h
>> +++ b/drivers/gpu/drm/i915/i915_pmu.h
>> @@ -49,7 +49,7 @@ enum {
>>       (I915_ENGINE_SAMPLE_COUNT + \
>>        I915_PMU_MAX_GT * __I915_PMU_TRACKED_EVENT_COUNT)
>>   -#define I915_ENGINE_SAMPLE_COUNT (I915_SAMPLE_SEMA + 1)
>> +#define I915_ENGINE_SAMPLE_COUNT (I915_SAMPLE_BUSY_TICKS + 1)
>>     struct i915_pmu_sample {
>>       u64 cur;
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index e26dd27ff4a5f..8ae98c1bda0ea 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -257,7 +257,8 @@ struct i915_engine_class_instance {
>>   enum drm_i915_pmu_engine_sample {
>>       I915_SAMPLE_BUSY = 0,
>>       I915_SAMPLE_WAIT = 1,
>> -    I915_SAMPLE_SEMA = 2
>> +    I915_SAMPLE_SEMA = 2,
>> +    I915_SAMPLE_BUSY_TICKS = 3,
>>   };
>>     #define I915_PMU_SAMPLE_BITS (4)
>> @@ -274,6 +275,9 @@ enum drm_i915_pmu_engine_sample {
>>   #define I915_PMU_ENGINE_BUSY(class, instance) \
>>       __I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY)
>>   +#define I915_PMU_ENGINE_BUSY_TICKS(class, instance) \
>> +    __I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY_TICKS)
>> +
>>   #define I915_PMU_ENGINE_WAIT(class, instance) \
>>       __I915_PMU_ENGINE(class, instance, I915_SAMPLE_WAIT)
>>   @@ -651,7 +655,14 @@ typedef struct drm_i915_irq_wait {
>>   #define   I915_SCHEDULER_CAP_PRIORITY    (1ul << 1)
>>   #define   I915_SCHEDULER_CAP_PREEMPTION    (1ul << 2)
>>   #define   I915_SCHEDULER_CAP_SEMAPHORES    (1ul << 3)
>> +/*
>> + * BUSY_STATS is deprecated on platforms with GuC based submission 
>> and will nt
>> + * be available at all on newer platforms. It has accuracy issues 
>> due to the
>> + * conversions from tick counts to wall time.
>> + * BUSY_TICKS_STATS should be used instead.
>> + */
>>   #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS    (1ul << 4)
>> +#define   I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS    (1ul << 5)
>>   /*
>>    * Indicates the 2k user priority levels are statically mapped into 
>> 3 buckets as
>>    * follows:

