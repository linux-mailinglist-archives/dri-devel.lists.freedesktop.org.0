Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A63EF6D6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 02:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA106E288;
	Wed, 18 Aug 2021 00:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318A36E24E;
 Wed, 18 Aug 2021 00:28:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="196487418"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="196487418"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 17:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449477826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 17 Aug 2021 17:28:43 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 17 Aug 2021 17:28:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 17 Aug 2021 17:28:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 17 Aug 2021 17:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkFmQwsNeoFmTXs6rrfIUv4/glxN4dDAVX1bf4bNUyWIJidvxByE6psIuLLYdnrrUPgdK50Uel6WwSY4kz0BWopZDskE3am/XTIMqDQ5DEh5Pj/IqHRqDozbCiBa+7DLfyNKoHr8UVmoiCE8GVG8OESH8OayRcWjBlyR9H8GoOh7/AKEh6icuRbDu5FAXFxoUppcPhrl36EVmRbfUkzla23Abqt03CWni7dwqosBNvhOybickhmOBathzPq5zOF3VT1N4q0qQi4vdK4H2SzzCn2bM9SJD0qQO2i4wdsFGxQ3P5+tdGb8mYd26k/k0IEDfMgi5JxEMpylRq0Ge7STyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ9JLA7oEAm85qoSPOlVrTZcn1p8mpXHgwMGNXc6JIk=;
 b=dkQlR6GqDzgL+Cmogcavf37/kUc8vLg7EC+g+wlvWlMIWEnzFVwRE6s/mseQ/aEg7qE/wxQ4mM15+vEpNIE/QGAFmuDUaL3sVlecTuKPUdixcX1NeqSjCRi8qZws2rzpaERsBUVlYObvIj3EHIuLFoNJjRDCOoSEosi6fEH5ivOueM5KdtWDCjQcx/KEk0tGaWxU6e9Zm56/OEeQJarT7MvcNOnqm3HwNxHEXJI6o8iQdLDqnaoK331TjsiPzpNz3ax0DyNsn23mWYRSsBgpUvTyOj0WgCRwS0guSLR0Lq/B5gGsbaSFG0XR7M1SzPbEy8dxbx7vMGZok2M0Xcx6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ9JLA7oEAm85qoSPOlVrTZcn1p8mpXHgwMGNXc6JIk=;
 b=aemLypgeKTPPOF+sGDhEEn3HBfME64i07n6+66z1qsKPZG4y3QEdG1UP83Z7nvUJwebKe6wd5lqbztcLXDrwTuOselmfo5MPwGiMe4vvmq7cSaNfo1bzebkqipbE1BHi7mHVcE5Nbmk7pluIre6MAMRigZntpdsot/0880qJtLc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 00:28:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 00:28:39 +0000
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
 <f47d3478-be0f-9dc3-2ffe-728d92347cb8@intel.com>
 <YRIeaQjEVrTFpKlW@phenom.ffwll.local>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <3734361b-47f5-81be-76da-1f241fa3f034@intel.com>
Date: Tue, 17 Aug 2021 17:28:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <YRIeaQjEVrTFpKlW@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BYAPR03CA0005.namprd03.prod.outlook.com (2603:10b6:a02:a8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 00:28:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89a441c1-210e-4763-4235-08d961df1fc5
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56111D2EB4BD514A566CA4EFBDFF9@PH0PR11MB5611.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8t3ZENGP38dJ7Ya2K06s/t0CztkXFU5p0Mp5Ik7E/48DIioYmQw9+BBNhyxzMHkbRAzhaTVzAHuBugjCKu3PiYLj2o9qQRq8cdi5nlrqhzCvDw5aW9K9GcTUxs3IEbtRNbE+qy3ArkARWL9Typso5Ck0niO4dWl1io9XGHw7rJ2R3hdUndAPeEdC4GKcSjDfAaRc/dl7fubqynFlT/1gK7wkMydqIbWAtKaHlsd5JqGb3e7/IUIQ5R2cyGUdFpwYFjwhj9W0F5GSn4Fz29009CmjkdxPuGwaY/QEd+C0JB/nTenF9L9eVrnvjhwK/DOtOaMfMB+FbtEHrwWTkWtbbZKOA+9lSvC87y19I1XO9cSLiliH3+xJJaovPYwOUpo1fXzx+NJ7DYxOPhUoqSlgy8J8jthfoQ7IHGZZprvKw8yYTcGUCbBMiNzMqw1RiAi0cps083KqXqtbt4tijN70P3C9pgHUuxS+JGkE4GDCcfuUinIlK/XjqFPGvyq49sMvnSAblVyGgsNbbmPt2b4kFPS60/tZ5AYVC9yh0dEWW98RhCwQPqYZkvbuDEijMa8AEecM8F1qWdqM0oaQyr798USqu8atwSVl6b8HV+hRWe+nVHO17Ib4XO28cQzmnjRqjUJUMEPfL+qZFitkaAtzx6LMH69Ji3kx3HCwqN8719UT2puDsvQqAzAvVlWz2VWO3J/uPuGay6QFoAY1ULKGbIS5tVSZ8DsnZwOmyiDFopsaZabDQIaVMVmcc8rW+yjCjYfG83X/2ZnuBX7IyTKq4gfh9aMCxPzi/50rxTODIdmjA/73VEuXMS3W8MGwql18HHMCmCvkVN4MfEUph8WFpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(30864003)(66556008)(66476007)(8676002)(16576012)(66946007)(6916009)(86362001)(8936002)(31696002)(6486002)(2906002)(53546011)(26005)(38100700002)(54906003)(83380400001)(4326008)(966005)(31686004)(316002)(478600001)(36756003)(956004)(186003)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXhDdko0ZGprcHRSbk9UWnQvazRsTnVRbTRKbFJvQTk3QmNXSEdJNCt2NlhH?=
 =?utf-8?B?SXExc2JSMVZKTElJbGhvSzBnYW5YYTlKK0VNcDA2UmtCUmpOcXhVcTVKWVpX?=
 =?utf-8?B?T3Zyd2dONE85QXRZakE1WTNBMWNuMTFQNzlrajZjdnhWbEgvdStEb0NBZzJV?=
 =?utf-8?B?TW1VRWFDMXdXNGpEeTFnYnNtMkljbVhsc0FyelVjT1o5Q250d2RIbEhKdUE2?=
 =?utf-8?B?UTh2SlVtVnZueEQzZ3FjcC9uSFRaMEJWbHExNDVpSm1QV24rYnBRdmFVZVll?=
 =?utf-8?B?Nkt3ZURTMWxRSU5Cd1A0RGNIU1AwS1VVRVJaUWEzMzdwNUdKeFppYUo1RWNS?=
 =?utf-8?B?UWVtSTVYY1Z4MTFhbXFCd2E1a2pQTTVDT1Mxd2xzMVMwQjJmZ3RZK2JKZ3pV?=
 =?utf-8?B?RVJ6NHhycGRXcm1TWHBPeGppNzhxbUJmdTdWN2plWlpqQTVuMUFEcHd3WnVw?=
 =?utf-8?B?RjJ1cGJpeDFua2VzMC9URlNXL29WY0pXaXdGdEZKa3JSTHBxQ1pHS3pZbEhL?=
 =?utf-8?B?MXVZQXprQWgwSnYzQ0IrT0RtVXJHL0xOY21uZWlBclFpREp6ZjE3YzNMVmZj?=
 =?utf-8?B?NVZxcXNWTEI5TlY2dCt3S3UxRlZSc1piZEJJRnB1M0RrN25IOHhCZTlWd3Jx?=
 =?utf-8?B?bWdWekRYK0RQVWIyTTBGVGpWU3d1eE1qODlsRVBOWXMyck5GSTFyT3ZLM1ZE?=
 =?utf-8?B?VmMwMGNCeEt2QjNsb0EvbWwrb2liRjgwQXVPcDZUcFkwdGVFRHNmNEFzTDB4?=
 =?utf-8?B?Mk9mNlczQkJDVXd3OE50NVd5Ly9YYVJoOFpxY0pZTmwwMHdxWG8vL3EvUmdu?=
 =?utf-8?B?clE4UWtkNWlrVzdHUTZ2dTNKRTZKNTFIcGhRWC9XR3V5NVlWcGRFZ3JLanFB?=
 =?utf-8?B?RWZlbGV1aWFLa09SSE9BVXMzOFkxM3BjN2w1eE5yOGVsVkJNakh6cVRYaVRu?=
 =?utf-8?B?TGVxSmN3VXRmUXMwU2R5Mjl2Q05tMFRVdElQVTFNTy91YjhDUk1wZm1yRk4y?=
 =?utf-8?B?emtnREsxOVFVMVZnZW9IcE0xakNpWWtDbHJlNkhhS1JXZFJmVFBpREFlc3VK?=
 =?utf-8?B?all0RVo3alJ4clVSdXplOXoxaUxZTHN6YUlhRzkrY3l0ZjNjUm5vL3lSc2JB?=
 =?utf-8?B?VEx4U25hbVZXWFNYVVJ3ME45dmJ0VENwVWVzaFFQb2tuTTE2TnV4STdMcCtW?=
 =?utf-8?B?K0pVdXFPRzZaaHBDc0p2ckxubVpuMFNQMVAraStHS0dOdnVPOHcvYlkvYS93?=
 =?utf-8?B?bHV0bjZxeUZuZDJ4SUVLQTY5YWNqS2VWME5mS04rUHVBZGlMazlpclpNS3Q3?=
 =?utf-8?B?U0o2Q0l2YnNVb0xZb3FCLzdWNFhPQjBTbnhqdlhrdFFzQzhhLzRHWHdyVHhU?=
 =?utf-8?B?WmlhQi95cGJWQWNIbkRHaHJaR014dldNSE11UklTTnRib3FEdUpzRG5VSkxm?=
 =?utf-8?B?Uk5heWRoenBOT2VQekU1aEt5ak9wQ09EOUhCLzRveUtzNXQ0OVdOYVQ5cmNJ?=
 =?utf-8?B?NXhac0xCbXNVOTJXVUJ6dVlQWnNvcGNVazB1MXBZMDlLVUpxRUxOYzB6NEVI?=
 =?utf-8?B?QW00eXlEakJ6VkVwcktSRHNDclhETmNpYVpvN0g0UE4zTStsSlkvVGMvK2xz?=
 =?utf-8?B?UTZCeVNBeitZTUw2eUZZWXg0bnhVVkRGV2VOcUY2ZHJZZlpMbU1zZzI3N2lu?=
 =?utf-8?B?Vzkzc3RuMXRwWHFBUnRqcW1Eb1V1cjlaNVphNEpyeHV2eXNRUGdCRi81Z01H?=
 =?utf-8?Q?/ngHpwsGrze6f0PJjFZr+bleP6SUeMc7Yidw6AV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a441c1-210e-4763-4235-08d961df1fc5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 00:28:38.9871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfFmCOPvEglZRYKDYrsijf4HVsldC9HdUQlqXroVyORSTcbnIuimRx1JTi3xsZmuOD9H0+RU771rmgIEcQZK6H7NSVAqwE4bN9OI9P82usc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
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

On 8/9/2021 23:36, Daniel Vetter wrote:
> On Mon, Aug 09, 2021 at 04:12:52PM -0700, John Harrison wrote:
>> On 8/6/2021 12:46, Daniel Vetter wrote:
>>> Seen this fly by and figured I dropped a few thoughts in here. At the
>>> likely cost of looking a bit out of whack :-)
>>>
>>> On Fri, Aug 6, 2021 at 8:01 PM John Harrison <john.c.harrison@intel.com> wrote:
>>>> On 8/2/2021 02:40, Tvrtko Ursulin wrote:
>>>>> On 30/07/2021 19:13, John Harrison wrote:
>>>>>> On 7/30/2021 02:49, Tvrtko Ursulin wrote:
>>>>>>> On 30/07/2021 01:13, John Harrison wrote:
>>>>>>>> On 7/28/2021 17:34, Matthew Brost wrote:
>>>>>>>>> If an engine associated with a context does not have a heartbeat,
>>>>>>>>> ban it
>>>>>>>>> immediately. This is needed for GuC submission as a idle pulse
>>>>>>>>> doesn't
>>>>>>>>> kick the context off the hardware where it then can check for a
>>>>>>>>> heartbeat and ban the context.
>>>>>>> Pulse, that is a request with I915_PRIORITY_BARRIER, does not
>>>>>>> preempt a running normal priority context?
>>>>>>>
>>>>>>> Why does it matter then whether or not heartbeats are enabled - when
>>>>>>> heartbeat just ends up sending the same engine pulse (eventually,
>>>>>>> with raising priority)?
>>>>>> The point is that the pulse is pointless. See the rest of my comments
>>>>>> below, specifically "the context will get resubmitted to the hardware
>>>>>> after the pulse completes". To re-iterate...
>>>>>>
>>>>>> Yes, it preempts the context. Yes, it does so whether heartbeats are
>>>>>> enabled or not. But so what? Who cares? You have preempted a context.
>>>>>> It is no longer running on the hardware. BUT IT IS STILL A VALID
>>>>>> CONTEXT.
>>>>> It is valid yes, and it even may be the current ABI so another
>>>>> question is whether it is okay to change that.
>>>>>
>>>>>> The backend scheduler will just resubmit it to the hardware as soon
>>>>>> as the pulse completes. The only reason this works at all is because
>>>>>> of the horrid hack in the execlist scheduler's back end
>>>>>> implementation (in __execlists_schedule_in):
>>>>>>            if (unlikely(intel_context_is_closed(ce) &&
>>>>>>                         !intel_engine_has_heartbeat(engine)))
>>>>>>                    intel_context_set_banned(ce);
>>>>> Right, is the above code then needed with this patch - when ban is
>>>>> immediately applied on the higher level?
>>>>>
>>>>>> The actual back end scheduler is saying "Is this a zombie context? Is
>>>>>> the heartbeat disabled? Then ban it". No other scheduler backend is
>>>>>> going to have knowledge of zombie context status or of the heartbeat
>>>>>> status. Nor are they going to call back into the higher levels of the
>>>>>> i915 driver to trigger a ban operation. Certainly a hardware
>>>>>> implemented scheduler is not going to be looking at private i915
>>>>>> driver information to decide whether to submit a context or whether
>>>>>> to tell the OS to kill it off instead.
>>>>>>
>>>>>> For persistence to work with a hardware scheduler (or a non-Intel
>>>>>> specific scheduler such as the DRM one), the handling of zombie
>>>>>> contexts, banning, etc. *must* be done entirely in the front end. It
>>>>>> cannot rely on any backend hacks. That means you can't rely on any
>>>>>> fancy behaviour of pulses.
>>>>>>
>>>>>> If you want to ban a context then you must explicitly ban that
>>>>>> context. If you want to ban it at some later point then you need to
>>>>>> track it at the top level as a zombie and then explicitly ban that
>>>>>> zombie at whatever later point.
>>>>> I am still trying to understand it all. If I go by the commit message:
>>>>>
>>>>> """
>>>>> This is needed for GuC submission as a idle pulse doesn't
>>>>> kick the context off the hardware where it then can check for a
>>>>> heartbeat and ban the context.
>>>>> """
>>>>>
>>>>> That did not explain things for me. Sentence does not appear to make
>>>>> sense. Now, it seems "kick off the hardware" is meant as revoke and
>>>>> not just preempt. Which is fine, perhaps just needs to be written more
>>>>> explicitly. But the part of checking for heartbeat after idle pulse
>>>>> does not compute for me. It is the heartbeat which emits idle pulses,
>>>>> not idle pulse emitting heartbeats.
>>>> I am in agreement that the commit message is confusing and does not
>>>> explain either the problem or the solution.
>>>>
>>>>
>>>>> But anyway, I can buy the handling at the front end story completely.
>>>>> It makes sense. We just need to agree that a) it is okay to change the
>>>>> ABI and b) remove the backend check from execlists if it is not needed
>>>>> any longer.
>>>>>
>>>>> And if ABI change is okay then commit message needs to talk about it
>>>>> loudly and clearly.
>>>> I don't think we have a choice. The current ABI is not and cannot ever
>>>> be compatible with any scheduler external to i915. It cannot be
>>>> implemented with a hardware scheduler such as the GuC and it cannot be
>>>> implemented with an external software scheduler such as the DRM one.
>>> So generally on linux we implement helper libraries, which means
>>> massive flexibility everywhere.
>>>
>>> https://blog.ffwll.ch/2016/12/midlayers-once-more-with-feeling.html
>>>
>>> So it shouldn't be an insurmountable problem to make this happen even
>>> with drm/scheduler, we can patch it up.
>>>
>>> Whether that's justified is another question.
>> Helper libraries won't work with a hardware scheduler.
> Hm I guess I misunderstood then what exactly the hold-up is. This entire
> discussion feels at least a bit like "heartbeat is unchangeable and guc
> must fit", which is pretty much the midlayer mistake. We need to figure
> out an implementation that works with GuC of the goals of the uapi,
> instead of assuming that the current heartbeat is the only possible way to
> achieve that.
>
> Or I'm just very confused about what the problem is.

What I mean is that you can't add helper callback hook things into a 
hardware scheduler. It's hardware. It does what it does. Sure, the GuC 
is firmware but it is very limited in what it can do. It certainly can't 
peek into internal KMD state such as the heartbeat. Nor can it call back 
to i915 to execute code every time it wants to make a scheduling 
decision. That would be defeating the whole point of it being a CPU 
offload accelerator thing.

Also, what I'm arguing is that the heartbeat should not be involved in 
the management of persistent contexts in the first place. It is way over 
complicated, unnecessary and not intuitive to an end user in the slightest.

>
>>>> My view is that any implementation involving knowledge of the heartbeat
>>>> is fundamentally broken.
>>>>
>>>> According to Daniel Vetter, the DRM ABI on this subject is that an
>>>> actively executing context should persist until the DRM file handle is
>>>> closed. That seems like a much more plausible and simple ABI than one
>>> DRM ABI is maybe a bit an overkill statement. It's more "what other
>>> drivers do", but it's generally a good idea to not ignore that :-)
>>>
>>>> that says 'if the heartbeat is running then a context will persist
>>>> forever, if the heartbeat is not running then it will be killed
>>>> immediately, if the heart was running but then stops running then the
>>>> context will be killed on the next context switch, ...'. And if I
>>>> understand it correctly, the current ABI allows a badly written user app
>>>> to cause a denial of service by leaving contexts permanently running an
>>>> infinite loop on the hardware even after the app has been killed! How
>>>> can that ever be considered a good idea?
>>> We're not going to support changing all these settings at runtime.
>>> There's just not point in trying to make that work race-free, it
>>> either adds complexity to the code for no reason, or it adds overhead
>>> to the code for no reason.
>>>
>>> Yes I know existing customers and all that, but
>>> - they can change this stuff, and when they change it while anyting is
>>> in-flight they get to keep the pieces. These options taint the kernel
>>> for a reason (and if they don't, that should be fixed)
>>> - quite a few around heartbeat and compute support as we've merged a
>>> while ago hang by design when trying to smash them into drm rules.
>>> We're not going to fix that, and we should not use any existing such
>>> assumptions as justification for code changes.
>>>
>>> Wrt infinitely running: Right now nothing is allowed to run forever,
>>> because hangcheck will step in and kill that job. Once we add compute
>>> mode ctx flag we'll require killing on process exit to stop escape.
>> If the infinite loop is pre-emptible then the heartbeat won't kill it off.
>> It will just run forever. Okay, it won't be a huge denial of service because
>> other work can pre-empt and run. However, you are down one timeslice
>> execution slot at that priority level. You have also permanently lost
>> whatever memory is allocated and in use by that workload.
> Ok I think I'm definitely lost.
>
> Right now, in upstream, you can't run forever without regularly calling
> execbuf to stuff new work in. So it will die out, it wont be persistent
> for very long.
It is possible to write an infinite loop batch buffer that is 
pre-emptible. Once you set that running, no amount of heartbeats will 
kill it off. The heartbeat will happily pre-empt it and tell you that 
the system as a whole is still running just fine. And then the scheduler 
will set the infinite loop task running again because it still has more 
'work' to do.


>
>>>> Therefore, the context close implementation should be to add an active
>>>> context to a zombie list. If a context is in zombie state and its last
>>>> request completes then the context can be immediately killed at that
>>>> point. Otherwise, on DRM handle close, we go through the zombie list and
>>>> immediately kill all contexts.
>>>>
>>>> Simple, clean, no back-end scheduler hacks, no reliance on heartbeats or
>>>> pulses. Also no opportunity for rogue (or just badly written) user
>>>> processes to leave zombie contexts running on the hardware forever and
>>>> causing a denial of service attack. If the host process is killed, all
>>>> of its GPU processes are also killed irrespective of what dodgy context
>>>> flags they may or may not have set.
>>> Uh, the intel_context state machine is already a bit too complex, and
>>> the implementation lacks a bunch of barriers at least from the cursor
>>> look I've given it thus far.
>>>
>>> So if we really need to make that more complex with more states then I
>>> think someone needs to come up with an actual clean design, with
>>> proper state transitions and all the barriers (or really, a design
>>> which doesn't need barriers). This is going to be work.
>>> -Daniel
>> Personally, I would rather just drop the whole persistence/zombie idea
>> completely. If you close your context then you should expect that context to
>> be destroyed and any outstanding workloads killed off. If you wanted the
>> results then you should have waited for them.
>>
>> If we do have to support some level of persistence then it doesn't seem like
>> tracking closed contexts should be especially complex. Not sure why it would
>> need special barriers either.
> Frankly I think I'm lost, and I think the confusion (for me at least)
> starts with what the current uapi is.
>
> Can someone please document that, with kerneldoc in the uapi header
> ideally? Once we have that defined I think we can have an actual
> discussion about what exactly this should look like with GuC (and also
> eventually with drm/scheduler), and which parts of the uapi are just
> artifacts of the current implementation, and which parts actually matter.
>
> Otherwise I think we're just spinning wheels a bit much here.
> -Daniel
See other branch of this thread - feel free to write it yourself or 
elect someone who actually knows the history/reasons behind this to 
write it up. All I can do is reverse engineer the code and document what 
it currently does and what is required to pass the IGT test.

If you want documentation about what the interface *should* be then I 
can offer two options:

1. No persistence at all.
If you close a context (whether explicitly through a close context call 
or implicitly through closing the DRM file handle, being killed, etc.) 
then that context is destroyed immediately. All outstanding work is 
discarded.

2. Persistence until DRM handle closure.
You can close a context and have it keep running previously submitted 
work. However, as soon as the DRM file handle is closed (either 
explicitly or by being killed, etc.) then all contexts are immediately 
destroyed and all outstanding work is discarded.

Simple. Concise. Sensible. No long discussions about what the heartbeat 
enable state was when the context was closed versus what that state is 
at some future point. No platform specific caveats or interactions. And 
no opportunity to cause denial of service attacks either deliberately or 
accidentally (and no opportunity for hideously complex KMD 
implementations to introduce potential DOS bugs either).

John.


>
>> John.
>>
>>>> John.
>>>>
>>>>
>>>>> Or perhaps there is no ABI change? I am not really clear how does
>>>>> setting banned status propagate to the GuC backend. I mean at which
>>>>> point does i915 ends up passing that info to the firmware?
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>>> It's worse than this. If the engine in question is an individual
>>>>>>>> physical engine then sending a pulse (with sufficiently high
>>>>>>>> priority) will pre-empt the engine and kick the context off.
>>>>>>>> However, the GuC
>>>>>>> Why it is different for physical vs virtual, aren't both just
>>>>>>> schedulable contexts with different engine masks for what GuC is
>>>>>>> concerned? Oh, is it a matter of needing to send pulses to all
>>>>>>> engines which comprise a virtual one?
>>>>>> It isn't different. It is totally broken for both. It is potentially
>>>>>> more broken for virtual engines because of the question of which
>>>>>> engine to pulse. But as stated above, the pulse is pointless anyway
>>>>>> so the which engine question doesn't even matter.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>
>>>>>>>> scheduler does not have hacks in it to check the state of the
>>>>>>>> heartbeat or whether a context is actually a zombie or not. Thus,
>>>>>>>> the context will get resubmitted to the hardware after the pulse
>>>>>>>> completes and effectively nothing will have happened.
>>>>>>>>
>>>>>>>> I would assume that the DRM scheduler which we are meant to be
>>>>>>>> switching to for execlist as well as GuC submission is also
>>>>>>>> unlikely to have hacks for zombie contexts and tests for whether
>>>>>>>> the i915 specific heartbeat has been disabled since the context
>>>>>>>> became a zombie. So when that switch happens, this test will also
>>>>>>>> fail in execlist mode as well as GuC mode.
>>>>>>>>
>>>>>>>> The choices I see here are to simply remove persistence completely
>>>>>>>> (it is a basically a bug that became UAPI because it wasn't caught
>>>>>>>> soon enough!) or to implement it in a way that does not require
>>>>>>>> hacks in the back end scheduler. Apparently, the DRM scheduler is
>>>>>>>> expected to allow zombie contexts to persist until the DRM file
>>>>>>>> handle is closed. So presumably we will have to go with option two.
>>>>>>>>
>>>>>>>> That means flagging a context as being a zombie when it is closed
>>>>>>>> but still active. The driver would then add it to a zombie list
>>>>>>>> owned by the DRM client object. When that client object is closed,
>>>>>>>> i915 would go through the list and genuinely kill all the contexts.
>>>>>>>> No back end scheduler hacks required and no intimate knowledge of
>>>>>>>> the i915 heartbeat mechanism required either.
>>>>>>>>
>>>>>>>> John.
>>>>>>>>
>>>>>>>>
>>>>>>>>> This patch also updates intel_engine_has_heartbeat to be a vfunc
>>>>>>>>> as we
>>>>>>>>> now need to call this function on execlists virtual engines too.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>>>>>>>>>     drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>>>>>>>>>     drivers/gpu/drm/i915/gt/intel_engine.h        | 21
>>>>>>>>> ++-----------------
>>>>>>>>>     .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>>>>>>>>>     .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>>>>>>>>>     .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>>>>>>>>>     6 files changed, 26 insertions(+), 24 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> index 9c3672bac0e2..b8e01c5ba9e5 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>>>>>> @@ -1090,8 +1090,9 @@ static void kill_engines(struct
>>>>>>>>> i915_gem_engines *engines, bool ban)
>>>>>>>>>          */
>>>>>>>>>         for_each_gem_engine(ce, engines, it) {
>>>>>>>>>             struct intel_engine_cs *engine;
>>>>>>>>> +        bool local_ban = ban ||
>>>>>>>>> !intel_engine_has_heartbeat(ce->engine);
>>>>>>> In any case (pending me understanding what's really going on there),
>>>>>>> why would this check not be in kill_context with currently does this:
>>>>>>>
>>>>>>>       bool ban = (!i915_gem_context_is_persistent(ctx) ||
>>>>>>>               !ctx->i915->params.enable_hangcheck);
>>>>>>> ...
>>>>>>>           kill_engines(pos, ban);
>>>>>>>
>>>>>>> So whether to ban decision would be consolidated to one place.
>>>>>>>
>>>>>>> In fact, decision on whether to allow persistent is tied to
>>>>>>> enable_hangcheck, which also drives hearbeat emission. So perhaps
>>>>>>> one part of the correct fix is to extend the above (kill_context)
>>>>>>> ban criteria to include hearbeat values anyway. Otherwise isn't it a
>>>>>>> simple miss that this check fails to account to hearbeat disablement
>>>>>>> via sysfs?
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Tvrtko
>>>>>>>
>>>>>>>>> -        if (ban && intel_context_ban(ce, NULL))
>>>>>>>>> +        if (local_ban && intel_context_ban(ce, NULL))
>>>>>>>>>                 continue;
>>>>>>>>>             /*
>>>>>>>>> @@ -1104,7 +1105,7 @@ static void kill_engines(struct
>>>>>>>>> i915_gem_engines *engines, bool ban)
>>>>>>>>>             engine = active_engine(ce);
>>>>>>>>>             /* First attempt to gracefully cancel the context */
>>>>>>>>> -        if (engine && !__cancel_engine(engine) && ban)
>>>>>>>>> +        if (engine && !__cancel_engine(engine) && local_ban)
>>>>>>>>>                 /*
>>>>>>>>>                  * If we are unable to send a preemptive pulse to bump
>>>>>>>>>                  * the context from the GPU, we have to resort to a
>>>>>>>>> full
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>>>> index e54351a170e2..65f2eb2a78e4 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>>>>>>>> @@ -55,6 +55,8 @@ struct intel_context_ops {
>>>>>>>>>         void (*reset)(struct intel_context *ce);
>>>>>>>>>         void (*destroy)(struct kref *kref);
>>>>>>>>> +    bool (*has_heartbeat)(const struct intel_engine_cs *engine);
>>>>>>>>> +
>>>>>>>>>         /* virtual engine/context interface */
>>>>>>>>>         struct intel_context *(*create_virtual)(struct
>>>>>>>>> intel_engine_cs **engine,
>>>>>>>>>                             unsigned int count);
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>>>> index c2a5640ae055..1b11a808acc4 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>>>>>>>> @@ -283,28 +283,11 @@ struct intel_context *
>>>>>>>>>     intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>>>>>>>>                     unsigned int count);
>>>>>>>>> -static inline bool
>>>>>>>>> -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs
>>>>>>>>> *engine)
>>>>>>>>> -{
>>>>>>>>> -    /*
>>>>>>>>> -     * For non-GuC submission we expect the back-end to look at the
>>>>>>>>> -     * heartbeat status of the actual physical engine that the work
>>>>>>>>> -     * has been (or is being) scheduled on, so we should only reach
>>>>>>>>> -     * here with GuC submission enabled.
>>>>>>>>> -     */
>>>>>>>>> -    GEM_BUG_ON(!intel_engine_uses_guc(engine));
>>>>>>>>> -
>>>>>>>>> -    return intel_guc_virtual_engine_has_heartbeat(engine);
>>>>>>>>> -}
>>>>>>>>> -
>>>>>>>>>     static inline bool
>>>>>>>>>     intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>>>>>>>>>     {
>>>>>>>>> -    if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
>>>>>>>>> -        return false;
>>>>>>>>> -
>>>>>>>>> -    if (intel_engine_is_virtual(engine))
>>>>>>>>> -        return intel_virtual_engine_has_heartbeat(engine);
>>>>>>>>> +    if (engine->cops->has_heartbeat)
>>>>>>>>> +        return engine->cops->has_heartbeat(engine);
>>>>>>>>>         else
>>>>>>>>>             return READ_ONCE(engine->props.heartbeat_interval_ms);
>>>>>>>>>     }
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> index de5f9c86b9a4..18005b5546b6 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>>>>>>>> @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs
>>>>>>>>> *engine, unsigned int sibling)
>>>>>>>>>         return ve->siblings[sibling];
>>>>>>>>>     }
>>>>>>>>> +static bool virtual_engine_has_heartbeat(const struct
>>>>>>>>> intel_engine_cs *ve)
>>>>>>>>> +{
>>>>>>>>> +    struct intel_engine_cs *engine;
>>>>>>>>> +    intel_engine_mask_t tmp, mask = ve->mask;
>>>>>>>>> +
>>>>>>>>> +    for_each_engine_masked(engine, ve->gt, mask, tmp)
>>>>>>>>> +        if (READ_ONCE(engine->props.heartbeat_interval_ms))
>>>>>>>>> +            return true;
>>>>>>>>> +
>>>>>>>>> +    return false;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>     static const struct intel_context_ops virtual_context_ops = {
>>>>>>>>>         .flags = COPS_HAS_INFLIGHT,
>>>>>>>>> @@ -3634,6 +3646,8 @@ static const struct intel_context_ops
>>>>>>>>> virtual_context_ops = {
>>>>>>>>>         .enter = virtual_context_enter,
>>>>>>>>>         .exit = virtual_context_exit,
>>>>>>>>> +    .has_heartbeat = virtual_engine_has_heartbeat,
>>>>>>>>> +
>>>>>>>>>         .destroy = virtual_context_destroy,
>>>>>>>>>         .get_sibling = virtual_get_sibling,
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>> index 89ff0e4b4bc7..ae70bff3605f 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>>>> @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct
>>>>>>>>> intel_context *ce)
>>>>>>>>>         return lrc_alloc(ce, engine);
>>>>>>>>>     }
>>>>>>>>> +static bool guc_virtual_engine_has_heartbeat(const struct
>>>>>>>>> intel_engine_cs *ve);
>>>>>>>>> +
>>>>>>>>>     static const struct intel_context_ops virtual_guc_context_ops = {
>>>>>>>>>         .alloc = guc_virtual_context_alloc,
>>>>>>>>> @@ -2183,6 +2185,8 @@ static const struct intel_context_ops
>>>>>>>>> virtual_guc_context_ops = {
>>>>>>>>>         .enter = guc_virtual_context_enter,
>>>>>>>>>         .exit = guc_virtual_context_exit,
>>>>>>>>> +    .has_heartbeat = guc_virtual_engine_has_heartbeat,
>>>>>>>>> +
>>>>>>>>>         .sched_disable = guc_context_sched_disable,
>>>>>>>>>         .destroy = guc_context_destroy,
>>>>>>>>> @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs
>>>>>>>>> **siblings, unsigned int count)
>>>>>>>>>         return ERR_PTR(err);
>>>>>>>>>     }
>>>>>>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct
>>>>>>>>> intel_engine_cs *ve)
>>>>>>>>> +static bool guc_virtual_engine_has_heartbeat(const struct
>>>>>>>>> intel_engine_cs *ve)
>>>>>>>>>     {
>>>>>>>>>         struct intel_engine_cs *engine;
>>>>>>>>>         intel_engine_mask_t tmp, mask = ve->mask;
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>>>> index c7ef44fa0c36..c2afc3b88fd8 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>>>>>>>> @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct
>>>>>>>>> intel_engine_cs *engine,
>>>>>>>>>                         struct i915_request *hung_rq,
>>>>>>>>>                         struct drm_printer *m);
>>>>>>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct
>>>>>>>>> intel_engine_cs *ve);
>>>>>>>>> -
>>>>>>>>>     int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>>>>>>>>>                        atomic_t *wait_var,
>>>>>>>>>                        bool interruptible,
>>>>>>>> _______________________________________________
>>>>>>>> Intel-gfx mailing list
>>>>>>>> Intel-gfx@lists.freedesktop.org
>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

