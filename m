Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895783E4FF4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 01:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2806489DB7;
	Mon,  9 Aug 2021 23:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923ED89DA5;
 Mon,  9 Aug 2021 23:12:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214828804"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="214828804"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 16:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="674440521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2021 16:12:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 9 Aug 2021 16:12:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 9 Aug 2021 16:12:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 9 Aug 2021 16:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Em5F/zoARsIa0yKtCfQqbmKWaTU0urClJgPWV4IjHWd0S5fjBpebbBow0NKtvpYQFCT/HARwCWaR6VnscA0i4gxEQD4eGs8XdTe8IRabvq7jGgryOtd7U38fjrCdKSgZ3Dhko+AQiap9qyUPWTbAKIEE2Ik+F+BbzGko3IogkqHY6fTSnAcv4KY/M6giA5vOZxXPPAU48+f1XERGODOBfM1qLDegZnMpCmVgQRhdkHvhJV60rzHNvDMXtWqjmzhr/Oy4zWYsed9gonMf2FGCHO/ivneGsJUwmDHuh0MJ9AovnuBe4uoWMPS5vDnYRdEEJgpvIzsmCM9IyYJ9A3zXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7gmkRKVmu5e2RKzAeX5uuWP8pA0STqKMKQ6OYlQ/NA=;
 b=MeAKOAZSRuHU9yWnmmKFc08nEHZ8+MO9vYC+TcppZYNb/GHoE7N3ofkgkiz9xVTpiVKHfbfmCOjrG4ciIle+mPuoCjwBhhLMIiL2e6YutoWeXRJ0FrYh7n2KPRgCm9Qn7apjBckw5md4JMJTiyoOfQM7YBqP3mXK4zHCX9dbgduTzkjVJpdQZ9ltbd5YlTt1IzB+0vrxbXFS3I5hBFRo4X2Lm1C0XvfHDGw4XjW5tGtoaMR8VNFIpfv5br+8+hSuLX1D/aIJ2sOaoinqDHnBfSO2vEE89duArgVNwdbYRa+qnd3l6yeEJjn+gSQ2b8jwr49QqsU4+zt3P1tmTaJdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7gmkRKVmu5e2RKzAeX5uuWP8pA0STqKMKQ6OYlQ/NA=;
 b=mK25LGDybHbsxh851LiOm+BIbYwjJZm6WD2zSeZUhiOBmLVk7hyjoTZ6qfFfLgOqiWsmPigG7EAj1GBinB/Z0K0PhiPOac7Sm5YHxWaVtn754ngcMPlO499ac6drln+zLNlonGkAzLKFF/BfU+J4PN9MGhuNvYD4QTzghi0Ey0k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Mon, 9 Aug
 2021 23:12:55 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110%6]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 23:12:54 +0000
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Check if engine has heartbeat
 when closing a context
To: Daniel Vetter <daniel@ffwll.ch>
CC: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <20210729003400.151864-2-matthew.brost@intel.com>
 <eea0bdb7-681b-0acb-0b9c-041fb38a7119@intel.com>
 <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
 <e6e893a7-a0e2-0441-260f-75da3760de0b@intel.com>
 <58cb6331-813a-7007-dac5-65a2f2ad344e@linux.intel.com>
 <b3d7ae68-ce4b-ec2c-c70d-9f81e2ea07d7@intel.com>
 <CAKMK7uF_xBt2WTLkyWf0tfwtzpbFEigZLMUqy4tHQXx47fJRBQ@mail.gmail.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <f47d3478-be0f-9dc3-2ffe-728d92347cb8@intel.com>
Date: Mon, 9 Aug 2021 16:12:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <CAKMK7uF_xBt2WTLkyWf0tfwtzpbFEigZLMUqy4tHQXx47fJRBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR14CA0051.namprd14.prod.outlook.com
 (2603:10b6:300:81::13) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR14CA0051.namprd14.prod.outlook.com (2603:10b6:300:81::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Mon, 9 Aug 2021 23:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df3a46c-db07-4fb8-fa8d-08d95b8b37f8
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56742CAFDCA1949AF4F27813BDF69@PH0PR11MB5674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qjhrGtirlKMsSvklpaM+gjzprdObSN9kCJ0DiWL3k/ecwSIoyjLvdsHMhIPpOh2UrU6VAQgekNPTIeojv9Q67PJ6J7zdvr7N5TBhuStkwNZe22byrdQZC0hHbcYQKDDCuZuxkJCLhkYWg3C4La02jdVil06YZU2kRHHv066T/vD9+QTMa4QMs1K6+QViL7Dh36fcDcJu5T7FvClCjSM7WgNBnbwD42aedJEtnW7eC3u+CWopdZZi2Elsr9ZMbJFHDO5Rx5fyHyn50kUYh0674ZSVQHVcdF8RkcsBAGYrXMWi0yRnRja/BxeyCym/ZF7J60guVWLtqkMRfnFYGo4nCUnKA9TDiFQSyvrtOEc/ETiRLLac0JbGWY1iLQry+MNPRaIuEN41rn/5PER0zYMdswsh/ehAMB4Em+B6Jb+OHXOsN15N/cPxMyJ+hTXbyXwA6BfIYfnG8zIOLbSbGJ5XOAqGJ7XfpzZBoujSOsBMhflJIEg/l3didD5BFTeasEmF8JodyCioKA+MHA0+8DNWTSgXLBN75Ei15RDINBnjBxGIgz4rLiKwjIbGLvRzhQl1qLqxpMFYPFuke+s/KQPm0oQ05TgOv9TT7pmtS5noNhjpOFJNN6jxwAFfxF61CoKTTq362yfuaOKvmkMf3yVkTPpcQPTTsGDrPCzY2GfY3IyQkPWHHcsxmzynLWtDG6hmdB5ntHIxlwwRSqHvygTz2uXvv+W6QcV+fGykS6rYEMvZHoxdriUE5e+i7Sqyi5RNTkH98d9msQ8AazF66xcNEweVArVrvWvDfII987KRR7SBNSzbPYeq5AZOEYOmvmm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(5660300002)(16576012)(2616005)(956004)(6486002)(316002)(478600001)(186003)(966005)(30864003)(36756003)(31696002)(66476007)(66946007)(83380400001)(86362001)(31686004)(26005)(53546011)(66556008)(38100700002)(8936002)(2906002)(4326008)(54906003)(8676002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZYclAyTUZGVHE0bGk1S2NxdnVLVzdwUkJsK1R6UUU0VHBMZnlpdDFnSTgz?=
 =?utf-8?B?cWc3dkxpTitBZnpBNFJpblBOYkNnZjY2ckF2NkRNRi9vNC9NL0lHM2x0eUpM?=
 =?utf-8?B?bUVMYi9lbTEvaDEvb0JvUU90bWl6RzVPc2xTNVdPelFOOHpsb1YyZkpxR2c4?=
 =?utf-8?B?ZWV5cElXVWhVcmdtdmdxcXBCTGpCNzFQMUxPREh4dDB5YlZJbkg0VW1IdmFF?=
 =?utf-8?B?ZU4waU1qdFBac3hLRlVOM2xZNkZ6MmkxVWNRcHhCNHl5YzMySlFQM3AvbG1B?=
 =?utf-8?B?NC91SkhQRlJlRFBzUDAxUDhydjlZbEFLZTFzR2dFdXFDZjJ3NktGdGw5VkF0?=
 =?utf-8?B?a3prYmt3SGpKYlFhMWNhb0FEWHZsN1pUZmVKeWNweXpwV3R2RW4xRzExNHFa?=
 =?utf-8?B?TXV4bzVCV24wVzE1Q2hac3p0Q2VoNEU2eHhXNU9WYllwK3ZhOHdmcUFSaUMv?=
 =?utf-8?B?ZklFNWdsdmE0ZTV1VE96czZyWEJmTTZraU9CbEkrWWVLTE95eDI4eUwrV0Z6?=
 =?utf-8?B?OENERWcvVElYNXNqMFp5WVI5UHJHaW41L1JZZXY3QnY4aU5QTjdqS0twd3FD?=
 =?utf-8?B?OFBIRDY4WXJIZk5tNisyWkVJTlFZaWJIVDg5K1c4QU1FNUwrdHhLV3FKeVRi?=
 =?utf-8?B?dVdCTy85RGJKcGNZck9kVU9mQzR6bS8wbkp4TDllZHVYTGZpZHhlWHlzNldl?=
 =?utf-8?B?ZEM3TjhnM1hjT3BXYXdNWXkzd243T2VlZnF6V0NsN3YyREY2Mnc0dThTNElL?=
 =?utf-8?B?dDVLYmtIV1BQU2UzSk9xS1lXUDlOd2hjUjNlL2Z0eWxIWi8xRUt6dHBvZmZn?=
 =?utf-8?B?alVodEVpYW8xVlRwZlZYVXBEVHpldFh2dnNKVFBNZ0w5VFRmVDRtcWF2K2Zv?=
 =?utf-8?B?blJmelBFM0FOOVhpV1dSdXkwM1Y3c05vbUIzYWh3WnQ5V3JaYmJEeUZWNW0v?=
 =?utf-8?B?OGt0S09lZWJweUhNdi8vL2VoS2FaclUrLzEybnRkS3ZzNFdweDFmYTdZUTVt?=
 =?utf-8?B?dmlDSDdTTDNIYUVLUnhYZk4yUTBKUHNueVNNOEt6RFZYRGRJUSs4OHNiZFJV?=
 =?utf-8?B?WUdrTEFCUUh5QnFMWlZKWjZnKytlMHNhaDZ6NjFxNWgzZktTNE9pV1l3anZ4?=
 =?utf-8?B?c0VmUDkwK1NaVjdwSUV1ZU5ZeGhXTURpakJZY3Z4bjAvSHRmd1JjTzdiZHdp?=
 =?utf-8?B?RERJTythVFNrRFlpdk1lYXduSm5IYU0yZFFZcno1Y0JPQ3lVQkE2SjRGTnh1?=
 =?utf-8?B?djl2SWFndS9rVVB6TWI3WjNWbzB0aDlGUjVJZWdmekkzaURXV05LeFNnS002?=
 =?utf-8?B?TnBzQmdIOGtsTUwrNStSV0pRQUhwNzFDSVNPbmgxdkZGU1Q1RXZDaGxiNUls?=
 =?utf-8?B?SnZJRHRXMGpxNGI3bHk3bzMyeEI2RFFlY2lhbTNYZW5iU1ZMdWlWeDRiVytv?=
 =?utf-8?B?ZGN4bFR0SnFYR1Budm81UGFpTzlNZTRZVFEwQUJXa2paT0x2WXZJOGtCcjJ6?=
 =?utf-8?B?RUZ0WUJlMTZwNFVmdE9UN0FqbjRLM2NvNmVoeHNSeVI5NktCbTF6b3Y1Wjlz?=
 =?utf-8?B?OW5RdDA4cWIvL2dwdEJsTmVpQ3FtcG1ZdjU2Vzk0YzZ1Qm1DQWN0ckl0VlFM?=
 =?utf-8?B?QWI2b1lYcGVuMENtRzY3VHNlQzVaS3dOSXNITGtWMjRDMUNRTHVjU0dJNEdW?=
 =?utf-8?B?QWxNaWdrQTcrdHQ3N1JGNUhYa1c0NndleFRzZFcxaEt2a2tBWmNFTEJqL1ps?=
 =?utf-8?Q?8DS8O8nXjbtLYDavhSTAZnJ0xtaCus9yw04mUp1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df3a46c-db07-4fb8-fa8d-08d95b8b37f8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 23:12:54.9093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tnNKBkQxN/6hN6Gp/TZxjOvYX7VBYsuqbvUBRWGQJsTnfaFIgQ7aaQf0rtvvMShMToB5oks/I6n4YwdO9rx3j+5DYI+sj2jusgMMhf8l5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
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

On 8/6/2021 12:46, Daniel Vetter wrote:
> Seen this fly by and figured I dropped a few thoughts in here. At the
> likely cost of looking a bit out of whack :-)
>
> On Fri, Aug 6, 2021 at 8:01 PM John Harrison <john.c.harrison@intel.com> wrote:
>> On 8/2/2021 02:40, Tvrtko Ursulin wrote:
>>> On 30/07/2021 19:13, John Harrison wrote:
>>>> On 7/30/2021 02:49, Tvrtko Ursulin wrote:
>>>>> On 30/07/2021 01:13, John Harrison wrote:
>>>>>> On 7/28/2021 17:34, Matthew Brost wrote:
>>>>>>> If an engine associated with a context does not have a heartbeat,
>>>>>>> ban it
>>>>>>> immediately. This is needed for GuC submission as a idle pulse
>>>>>>> doesn't
>>>>>>> kick the context off the hardware where it then can check for a
>>>>>>> heartbeat and ban the context.
>>>>> Pulse, that is a request with I915_PRIORITY_BARRIER, does not
>>>>> preempt a running normal priority context?
>>>>>
>>>>> Why does it matter then whether or not heartbeats are enabled - when
>>>>> heartbeat just ends up sending the same engine pulse (eventually,
>>>>> with raising priority)?
>>>> The point is that the pulse is pointless. See the rest of my comments
>>>> below, specifically "the context will get resubmitted to the hardware
>>>> after the pulse completes". To re-iterate...
>>>>
>>>> Yes, it preempts the context. Yes, it does so whether heartbeats are
>>>> enabled or not. But so what? Who cares? You have preempted a context.
>>>> It is no longer running on the hardware. BUT IT IS STILL A VALID
>>>> CONTEXT.
>>> It is valid yes, and it even may be the current ABI so another
>>> question is whether it is okay to change that.
>>>
>>>> The backend scheduler will just resubmit it to the hardware as soon
>>>> as the pulse completes. The only reason this works at all is because
>>>> of the horrid hack in the execlist scheduler's back end
>>>> implementation (in __execlists_schedule_in):
>>>>           if (unlikely(intel_context_is_closed(ce) &&
>>>>                        !intel_engine_has_heartbeat(engine)))
>>>>                   intel_context_set_banned(ce);
>>> Right, is the above code then needed with this patch - when ban is
>>> immediately applied on the higher level?
>>>
>>>> The actual back end scheduler is saying "Is this a zombie context? Is
>>>> the heartbeat disabled? Then ban it". No other scheduler backend is
>>>> going to have knowledge of zombie context status or of the heartbeat
>>>> status. Nor are they going to call back into the higher levels of the
>>>> i915 driver to trigger a ban operation. Certainly a hardware
>>>> implemented scheduler is not going to be looking at private i915
>>>> driver information to decide whether to submit a context or whether
>>>> to tell the OS to kill it off instead.
>>>>
>>>> For persistence to work with a hardware scheduler (or a non-Intel
>>>> specific scheduler such as the DRM one), the handling of zombie
>>>> contexts, banning, etc. *must* be done entirely in the front end. It
>>>> cannot rely on any backend hacks. That means you can't rely on any
>>>> fancy behaviour of pulses.
>>>>
>>>> If you want to ban a context then you must explicitly ban that
>>>> context. If you want to ban it at some later point then you need to
>>>> track it at the top level as a zombie and then explicitly ban that
>>>> zombie at whatever later point.
>>> I am still trying to understand it all. If I go by the commit message:
>>>
>>> """
>>> This is needed for GuC submission as a idle pulse doesn't
>>> kick the context off the hardware where it then can check for a
>>> heartbeat and ban the context.
>>> """
>>>
>>> That did not explain things for me. Sentence does not appear to make
>>> sense. Now, it seems "kick off the hardware" is meant as revoke and
>>> not just preempt. Which is fine, perhaps just needs to be written more
>>> explicitly. But the part of checking for heartbeat after idle pulse
>>> does not compute for me. It is the heartbeat which emits idle pulses,
>>> not idle pulse emitting heartbeats.
>> I am in agreement that the commit message is confusing and does not
>> explain either the problem or the solution.
>>
>>
>>>
>>> But anyway, I can buy the handling at the front end story completely.
>>> It makes sense. We just need to agree that a) it is okay to change the
>>> ABI and b) remove the backend check from execlists if it is not needed
>>> any longer.
>>>
>>> And if ABI change is okay then commit message needs to talk about it
>>> loudly and clearly.
>> I don't think we have a choice. The current ABI is not and cannot ever
>> be compatible with any scheduler external to i915. It cannot be
>> implemented with a hardware scheduler such as the GuC and it cannot be
>> implemented with an external software scheduler such as the DRM one.
> So generally on linux we implement helper libraries, which means
> massive flexibility everywhere.
>
> https://blog.ffwll.ch/2016/12/midlayers-once-more-with-feeling.html
>
> So it shouldn't be an insurmountable problem to make this happen even
> with drm/scheduler, we can patch it up.
>
> Whether that's justified is another question.
Helper libraries won't work with a hardware scheduler.

>
>> My view is that any implementation involving knowledge of the heartbeat
>> is fundamentally broken.
>>
>> According to Daniel Vetter, the DRM ABI on this subject is that an
>> actively executing context should persist until the DRM file handle is
>> closed. That seems like a much more plausible and simple ABI than one
> DRM ABI is maybe a bit an overkill statement. It's more "what other
> drivers do", but it's generally a good idea to not ignore that :-)
>
>> that says 'if the heartbeat is running then a context will persist
>> forever, if the heartbeat is not running then it will be killed
>> immediately, if the heart was running but then stops running then the
>> context will be killed on the next context switch, ...'. And if I
>> understand it correctly, the current ABI allows a badly written user app
>> to cause a denial of service by leaving contexts permanently running an
>> infinite loop on the hardware even after the app has been killed! How
>> can that ever be considered a good idea?
> We're not going to support changing all these settings at runtime.
> There's just not point in trying to make that work race-free, it
> either adds complexity to the code for no reason, or it adds overhead
> to the code for no reason.
>
> Yes I know existing customers and all that, but
> - they can change this stuff, and when they change it while anyting is
> in-flight they get to keep the pieces. These options taint the kernel
> for a reason (and if they don't, that should be fixed)
> - quite a few around heartbeat and compute support as we've merged a
> while ago hang by design when trying to smash them into drm rules.
> We're not going to fix that, and we should not use any existing such
> assumptions as justification for code changes.
>
> Wrt infinitely running: Right now nothing is allowed to run forever,
> because hangcheck will step in and kill that job. Once we add compute
> mode ctx flag we'll require killing on process exit to stop escape.
If the infinite loop is pre-emptible then the heartbeat won't kill it 
off. It will just run forever. Okay, it won't be a huge denial of 
service because other work can pre-empt and run. However, you are down 
one timeslice execution slot at that priority level. You have also 
permanently lost whatever memory is allocated and in use by that workload.


>
>> Therefore, the context close implementation should be to add an active
>> context to a zombie list. If a context is in zombie state and its last
>> request completes then the context can be immediately killed at that
>> point. Otherwise, on DRM handle close, we go through the zombie list and
>> immediately kill all contexts.
>>
>> Simple, clean, no back-end scheduler hacks, no reliance on heartbeats or
>> pulses. Also no opportunity for rogue (or just badly written) user
>> processes to leave zombie contexts running on the hardware forever and
>> causing a denial of service attack. If the host process is killed, all
>> of its GPU processes are also killed irrespective of what dodgy context
>> flags they may or may not have set.
> Uh, the intel_context state machine is already a bit too complex, and
> the implementation lacks a bunch of barriers at least from the cursor
> look I've given it thus far.
>
> So if we really need to make that more complex with more states then I
> think someone needs to come up with an actual clean design, with
> proper state transitions and all the barriers (or really, a design
> which doesn't need barriers). This is going to be work.
> -Daniel
Personally, I would rather just drop the whole persistence/zombie idea 
completely. If you close your context then you should expect that 
context to be destroyed and any outstanding workloads killed off. If you 
wanted the results then you should have waited for them.

If we do have to support some level of persistence then it doesn't seem 
like tracking closed contexts should be especially complex. Not sure why 
it would need special barriers either.

John.

>> John.
>>
>>
>>> Or perhaps there is no ABI change? I am not really clear how does
>>> setting banned status propagate to the GuC backend. I mean at which
>>> point does i915 ends up passing that info to the firmware?
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>>>> It's worse than this. If the engine in question is an individual
>>>>>> physical engine then sending a pulse (with sufficiently high
>>>>>> priority) will pre-empt the engine and kick the context off.
>>>>>> However, the GuC
>>>>> Why it is different for physical vs virtual, aren't both just
>>>>> schedulable contexts with different engine masks for what GuC is
>>>>> concerned? Oh, is it a matter of needing to send pulses to all
>>>>> engines which comprise a virtual one?
>>>> It isn't different. It is totally broken for both. It is potentially
>>>> more broken for virtual engines because of the question of which
>>>> engine to pulse. But as stated above, the pulse is pointless anyway
>>>> so the which engine question doesn't even matter.
>>>>
>>>> John.
>>>>
>>>>
>>>>>> scheduler does not have hacks in it to check the state of the
>>>>>> heartbeat or whether a context is actually a zombie or not. Thus,
>>>>>> the context will get resubmitted to the hardware after the pulse
>>>>>> completes and effectively nothing will have happened.
>>>>>>
>>>>>> I would assume that the DRM scheduler which we are meant to be
>>>>>> switching to for execlist as well as GuC submission is also
>>>>>> unlikely to have hacks for zombie contexts and tests for whether
>>>>>> the i915 specific heartbeat has been disabled since the context
>>>>>> became a zombie. So when that switch happens, this test will also
>>>>>> fail in execlist mode as well as GuC mode.
>>>>>>
>>>>>> The choices I see here are to simply remove persistence completely
>>>>>> (it is a basically a bug that became UAPI because it wasn't caught
>>>>>> soon enough!) or to implement it in a way that does not require
>>>>>> hacks in the back end scheduler. Apparently, the DRM scheduler is
>>>>>> expected to allow zombie contexts to persist until the DRM file
>>>>>> handle is closed. So presumably we will have to go with option two.
>>>>>>
>>>>>> That means flagging a context as being a zombie when it is closed
>>>>>> but still active. The driver would then add it to a zombie list
>>>>>> owned by the DRM client object. When that client object is closed,
>>>>>> i915 would go through the list and genuinely kill all the contexts.
>>>>>> No back end scheduler hacks required and no intimate knowledge of
>>>>>> the i915 heartbeat mechanism required either.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>
>>>>>>> This patch also updates intel_engine_has_heartbeat to be a vfunc
>>>>>>> as we
>>>>>>> now need to call this function on execlists virtual engines too.
>>>>>>>
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>>>>>>>    drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>>>>>>>    drivers/gpu/drm/i915/gt/intel_engine.h        | 21
>>>>>>> ++-----------------
>>>>>>>    .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>>>>>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>>>>>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>>>>>>>    6 files changed, 26 insertions(+), 24 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>> index 9c3672bac0e2..b8e01c5ba9e5 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>> @@ -1090,8 +1090,9 @@ static void kill_engines(struct
>>>>>>> i915_gem_engines *engines, bool ban)
>>>>>>>         */
>>>>>>>        for_each_gem_engine(ce, engines, it) {
>>>>>>>            struct intel_engine_cs *engine;
>>>>>>> +        bool local_ban = ban ||
>>>>>>> !intel_engine_has_heartbeat(ce->engine);
>>>>> In any case (pending me understanding what's really going on there),
>>>>> why would this check not be in kill_context with currently does this:
>>>>>
>>>>>      bool ban = (!i915_gem_context_is_persistent(ctx) ||
>>>>>              !ctx->i915->params.enable_hangcheck);
>>>>> ...
>>>>>          kill_engines(pos, ban);
>>>>>
>>>>> So whether to ban decision would be consolidated to one place.
>>>>>
>>>>> In fact, decision on whether to allow persistent is tied to
>>>>> enable_hangcheck, which also drives hearbeat emission. So perhaps
>>>>> one part of the correct fix is to extend the above (kill_context)
>>>>> ban criteria to include hearbeat values anyway. Otherwise isn't it a
>>>>> simple miss that this check fails to account to hearbeat disablement
>>>>> via sysfs?
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>> -        if (ban && intel_context_ban(ce, NULL))
>>>>>>> +        if (local_ban && intel_context_ban(ce, NULL))
>>>>>>>                continue;
>>>>>>>            /*
>>>>>>> @@ -1104,7 +1105,7 @@ static void kill_engines(struct
>>>>>>> i915_gem_engines *engines, bool ban)
>>>>>>>            engine = active_engine(ce);
>>>>>>>            /* First attempt to gracefully cancel the context */
>>>>>>> -        if (engine && !__cancel_engine(engine) && ban)
>>>>>>> +        if (engine && !__cancel_engine(engine) && local_ban)
>>>>>>>                /*
>>>>>>>                 * If we are unable to send a preemptive pulse to bump
>>>>>>>                 * the context from the GPU, we have to resort to a
>>>>>>> full
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>> index e54351a170e2..65f2eb2a78e4 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>> @@ -55,6 +55,8 @@ struct intel_context_ops {
>>>>>>>        void (*reset)(struct intel_context *ce);
>>>>>>>        void (*destroy)(struct kref *kref);
>>>>>>> +    bool (*has_heartbeat)(const struct intel_engine_cs *engine);
>>>>>>> +
>>>>>>>        /* virtual engine/context interface */
>>>>>>>        struct intel_context *(*create_virtual)(struct
>>>>>>> intel_engine_cs **engine,
>>>>>>>                            unsigned int count);
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>> index c2a5640ae055..1b11a808acc4 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>> @@ -283,28 +283,11 @@ struct intel_context *
>>>>>>>    intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>>>>>>                    unsigned int count);
>>>>>>> -static inline bool
>>>>>>> -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs
>>>>>>> *engine)
>>>>>>> -{
>>>>>>> -    /*
>>>>>>> -     * For non-GuC submission we expect the back-end to look at the
>>>>>>> -     * heartbeat status of the actual physical engine that the work
>>>>>>> -     * has been (or is being) scheduled on, so we should only reach
>>>>>>> -     * here with GuC submission enabled.
>>>>>>> -     */
>>>>>>> -    GEM_BUG_ON(!intel_engine_uses_guc(engine));
>>>>>>> -
>>>>>>> -    return intel_guc_virtual_engine_has_heartbeat(engine);
>>>>>>> -}
>>>>>>> -
>>>>>>>    static inline bool
>>>>>>>    intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>>>>>>>    {
>>>>>>> -    if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>>>>>>> -        return false;
>>>>>>> -
>>>>>>> -    if (intel_engine_is_virtual(engine))
>>>>>>> -        return intel_virtual_engine_has_heartbeat(engine);
>>>>>>> +    if (engine->cops->has_heartbeat)
>>>>>>> +        return engine->cops->has_heartbeat(engine);
>>>>>>>        else
>>>>>>>            return READ_ONCE(engine->props.heartbeat_interval_ms);
>>>>>>>    }
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>> index de5f9c86b9a4..18005b5546b6 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>> @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs
>>>>>>> *engine, unsigned int sibling)
>>>>>>>        return ve->siblings[sibling];
>>>>>>>    }
>>>>>>> +static bool virtual_engine_has_heartbeat(const struct
>>>>>>> intel_engine_cs *ve)
>>>>>>> +{
>>>>>>> +    struct intel_engine_cs *engine;
>>>>>>> +    intel_engine_mask_t tmp, mask = ve->mask;
>>>>>>> +
>>>>>>> +    for_each_engine_masked(engine, ve->gt, mask, tmp)
>>>>>>> +        if (READ_ONCE(engine->props.heartbeat_interval_ms))
>>>>>>> +            return true;
>>>>>>> +
>>>>>>> +    return false;
>>>>>>> +}
>>>>>>> +
>>>>>>>    static const struct intel_context_ops virtual_context_ops = {
>>>>>>>        .flags = COPS_HAS_INFLIGHT,
>>>>>>> @@ -3634,6 +3646,8 @@ static const struct intel_context_ops
>>>>>>> virtual_context_ops = {
>>>>>>>        .enter = virtual_context_enter,
>>>>>>>        .exit = virtual_context_exit,
>>>>>>> +    .has_heartbeat = virtual_engine_has_heartbeat,
>>>>>>> +
>>>>>>>        .destroy = virtual_context_destroy,
>>>>>>>        .get_sibling = virtual_get_sibling,
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> index 89ff0e4b4bc7..ae70bff3605f 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct
>>>>>>> intel_context *ce)
>>>>>>>        return lrc_alloc(ce, engine);
>>>>>>>    }
>>>>>>> +static bool guc_virtual_engine_has_heartbeat(const struct
>>>>>>> intel_engine_cs *ve);
>>>>>>> +
>>>>>>>    static const struct intel_context_ops virtual_guc_context_ops = {
>>>>>>>        .alloc = guc_virtual_context_alloc,
>>>>>>> @@ -2183,6 +2185,8 @@ static const struct intel_context_ops
>>>>>>> virtual_guc_context_ops = {
>>>>>>>        .enter = guc_virtual_context_enter,
>>>>>>>        .exit = guc_virtual_context_exit,
>>>>>>> +    .has_heartbeat = guc_virtual_engine_has_heartbeat,
>>>>>>> +
>>>>>>>        .sched_disable = guc_context_sched_disable,
>>>>>>>        .destroy = guc_context_destroy,
>>>>>>> @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs
>>>>>>> **siblings, unsigned int count)
>>>>>>>        return ERR_PTR(err);
>>>>>>>    }
>>>>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct
>>>>>>> intel_engine_cs *ve)
>>>>>>> +static bool guc_virtual_engine_has_heartbeat(const struct
>>>>>>> intel_engine_cs *ve)
>>>>>>>    {
>>>>>>>        struct intel_engine_cs *engine;
>>>>>>>        intel_engine_mask_t tmp, mask = ve->mask;
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>> index c7ef44fa0c36..c2afc3b88fd8 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>> @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct
>>>>>>> intel_engine_cs *engine,
>>>>>>>                        struct i915_request *hung_rq,
>>>>>>>                        struct drm_printer *m);
>>>>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct
>>>>>>> intel_engine_cs *ve);
>>>>>>> -
>>>>>>>    int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>>>>>>>                       atomic_t *wait_var,
>>>>>>>                       bool interruptible,
>>>>>> _______________________________________________
>>>>>> Intel-gfx mailing list
>>>>>> Intel-gfx@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>

