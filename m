Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D132E6E4010
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 08:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ADA10E37C;
	Mon, 17 Apr 2023 06:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9959010E37C;
 Mon, 17 Apr 2023 06:47:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lC4RuaDeTSBH0ip11nx5KL1F4JpBE3t66VNkI6bqqG/UIMPxEIkFCR4hXoaqzounNbjW4gcaJHHw+ezPFbFbZZyfe6EHertr1Zgf9ZllMRcwNaA4XA1NqFQBriMA+YREhq6R1RasydkPaP7iky0ekgyNSfM9iFWB7OaO3sxVWYIJxpoYXcHzq8K4Mg10droNj1nNEMt7JsCS7eu6WQIjgDgElzO0HbFwTJGvA/SKC7qiMARh+q9saE0BWPcNKywfMblGOzK6KCPyGMjSCOhYzwGG0ZtzQqgY6Yg88tvUwJdOFUsqSx2Axv3Zxeoh9iiJF9cJygzm4+oPI4AGOf5Iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70jnsQKjXfr7apjZ68lfmMRNEYOTjLO8RCMqakPvOpE=;
 b=Qk60yWD1LJZg6LCboq4FWyfleucyoBonkKejK6kB9M0JChBFMuFe49lMoNTVx+N1fKznr1TgXzZNP1ijfU2uBVluudyItkD9Wqc2snKyEKER+qKQWUMkvskgmR1iNMJtCiTWzomD7OddYDzQri49vXteRBBIj92LyLhDX3GraqPIuQxT5V5xLvra3ycX4baa53ZvH3oCqxUj9wWRRe80XzQPNfJELIDiTvNUR8gIcXtaPJMX9H1fo6GCs4SS3ll34xbAMHtpUxBKQMSQRetWpMog4rh2pMi6xfnM4CNLPS6ho+qfTCWbluphXb3kyaBAFoUMxozdgMClPTtB1bnXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70jnsQKjXfr7apjZ68lfmMRNEYOTjLO8RCMqakPvOpE=;
 b=mmmrF6KPuvgFmSsox5FbbXvo6nNoZP4VHHkgWwCU8pDhvYRVLRcHhyiQ7EzOhdOZRT4cxKqh+Gh+AaG5aUtu8zVb/+cWPcKtio6YSRpiZSKl7DhiazBnoMDO/TGeCo5CIYzH6ExzSsIK5VuADvV5d+OUW/I3WG/2KpUiugJ6+S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 17 Apr
 2023 06:47:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 06:47:25 +0000
Message-ID: <8795846f-551a-7e0a-a7ab-3d6b6ca74e4f@amd.com>
Date: Mon, 17 Apr 2023 08:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
 <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
 <SA1PR11MB69918B99750334B368E196B992909@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZC3Dmno7s05/5VPN@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB699131A9F895F4A7AE28FEB492969@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ce82debe-127b-045d-26ac-7900b81ec36e@amd.com>
 <ZDVq+lRYkTWDB19k@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZDVq+lRYkTWDB19k@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: e4972183-ff98-4ea4-e3a6-08db3f0f9a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3ZCrZiasBcU4+eI3GEyJkYKTKS2Fq+cLx7+8k18HT+oHuI/dHER+hWYOXDHLzk9YVh9d9kRplAfEzAhkMSTJEjFb+61+zoU4KXeXTISMp8LaqIAgZqYwRavXlQ9ZC6UvlKsbt2M3DNqXVhEobFi87tOb5BGlY9x5aHRj+xh3d/A1S0BdoTSW2VAW9X4Fmc3ZbiPLL6O4MpQnyPPli6SkV7Ym6Hy8weV9/CoNiHPn91yV1QQc43psmHNzKoVMhBVSlGN3HvyzYKUeUvRit0dy+FN3x4TclgboWcD5Z6QxWjU9ibXBhlV6AQr2LPFnAvELH/1rS9jtS9D8BbiW03I/vK+AdoHZ0rkqvovS3l25bzDqXlJOsPo0Zi6iWBRmkLkJMFCOhs49dQ8iar97WyhMKNw0aZMgQ47/06hSsvYTrGVAOIpLhwwxDp82Qom/z40ukkHbXU3l7GUfCafnOwd2fR7Jy+bAMcwbVU6scil7GGNp+PdukAGrSDQu5TJTI8wK7JSoSjSqPKEuozrDcLkY9XjxM+Cx/eIY6ZIYPtgOtJ9u6f3RwZ1fhOwjsdHzFZqwJdgmO+EKQePovJP+wQ3fTHNTdJlXctj3UxuCwgTCBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(478600001)(6512007)(54906003)(6506007)(5660300002)(186003)(26005)(66476007)(966005)(53546011)(316002)(2906002)(30864003)(6916009)(6666004)(6486002)(66946007)(4326008)(8676002)(7416002)(66556008)(8936002)(41300700001)(83380400001)(66574015)(36756003)(31696002)(2616005)(38100700002)(86362001)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmFLUG9NNG9aRng2SUVSKzdnbmhZY1B1emJldW9leTJaQlRHWFpjeHg4cjhW?=
 =?utf-8?B?Y3RzSHJyazN1RXBSRjJRUFhoODMwYTVPaDN2a1F5VWlYdDg3bStxMEViTHRr?=
 =?utf-8?B?R3R6cmwvdG5uUGw3Q1JRblBOWkQ4OUs3UDQzQndsTktHOU96V004a0JrOWtG?=
 =?utf-8?B?WTVSdDVJbVhsYW5iNUphR0VoSEwyc2NJTERnREU2VHV1dDlLTFI5Qnp0UklU?=
 =?utf-8?B?ekwwM0xlNUZoWSttck5VZjZURDlPbll2QUVGeGpQLzJPY0NTSUNSRWpyd01L?=
 =?utf-8?B?VVpHbEdSWHE2eEFxSE1tMUNyMEJ5anlmdk5NSXh2TVozdSt5YVJNKzRPUEpp?=
 =?utf-8?B?a0lNeHExQzlNNXZyZ0dHeGhZWGlhQlJCQ0VyQzBKUFd5ZDFmMzRPRDQ3Nytx?=
 =?utf-8?B?dHR1QXBnYWJHRXA0b3VjZUZrMXJ1ci9uRlRnWU5sb05mVU0vNGkzb3Z2WE9y?=
 =?utf-8?B?M2JMM1R6ekp5alkrM2ZtWEpNeFIrbzdVRklucURFbVVUNitlczZwYit5dWN3?=
 =?utf-8?B?T0hlbFFwVTV2aFF5bmp4RFVBOTNRNFBHQm9RdGNVR1YyRTVVUW1Cemt6NTBR?=
 =?utf-8?B?dVhnWE94NWVmLzJ6V2RPSGpaTU05dnZXanJhS1h0TmdZdFZFYjA3Rkp3WXNj?=
 =?utf-8?B?ZlI0STQya3U0dXdEMU5KQTBnTVZxWWQvZk1YYlB1elh3alZWOTVFbHpGR2dO?=
 =?utf-8?B?cDZMZlQySXkwQ2VLK0FJTDcxbE9CWVJHSTJCMHp0b2JZM1dJN2lia0pBSC9u?=
 =?utf-8?B?b3JiNndRb2dCWnpQZHdOU2xVV05obk4xWS9KZnV6UDNBTjhQTWFjck9qcGdD?=
 =?utf-8?B?OXJpUTFmb0pNZ1VwUlY4K0k0MVJpV2lMTHJZVDdkUFgzdlU0Szk0NDhseFBw?=
 =?utf-8?B?aUNOT3JYYVZ0THZiTUFkbFVuNjArMUUxZ0lqNStSSDV0RTZqRWVIQmV3aTVN?=
 =?utf-8?B?QSs3SDROVVN3OWE5a1k0UHg5U0hoZ3VWS1RXbjBXZU1PL0JDUmZJdGpPbE5w?=
 =?utf-8?B?eEE0bUlNV0xiMkxhbFdTQUxnUjJsdzJyaXQrOVdzVlI3UDVCb1laTU53QWZW?=
 =?utf-8?B?WWthcE9ldTkvckFGMk10aXJ1Rm5qdkNNUVE3Yk9HbDNQa0EwTFozVU1UdmpP?=
 =?utf-8?B?S0lVVjBsbm93MWJNUVdJUU15ZTlPTE00dFRvZS9tM1JPb2JBV1pmRTI2dFAv?=
 =?utf-8?B?aXMwamE0WlVxaENIWXBMN3FHTkN5RnFnemJwbERlRlJDeU1kMzh2NnV2Nkpq?=
 =?utf-8?B?MTFlUXc1QkNWNkp5eG1pcUpqQlZpK2o4Qnk0cDZUM0FFVzRueHBvUDVTQ05U?=
 =?utf-8?B?MUhTQTFCRW03NW9pSkgyR2NNOGo1VDJxa3lUdVR1bHBMeFA3aHU2d0hnZll1?=
 =?utf-8?B?N2VQbC9mTHg4eGVNbnlncjl3YXVzT0ZBUHJIMFZ6SzdudnFMb2tUcllzV0k5?=
 =?utf-8?B?Zlg4a2QvM1RPUU5hYWVvMm14bnNKS3RISzZFa21LM240UXoreUNwYkVQM0dC?=
 =?utf-8?B?ZDArZy9tUzFTZkZZRmJwQm9vcHErSFhzUU83azdNNzJoZXBzZkR1T21EamtR?=
 =?utf-8?B?dW1QdWF3MkFkQ0ZWbSt3am1QdEkxVEJZbXN5ZjdVUEpsMDNFMnk3aVBVQ08w?=
 =?utf-8?B?dzgvZ2Z4VlBtZ0laZ1QvK1RkSFdEYm1sNVVDVklTYm5hTmZNT3hNazhCMk9C?=
 =?utf-8?B?dWFhRGV6cEhTQ0tFZGFvOW5oMnRnZzRhK0JHUFpya2l6Rm5GU2dCKzI4SEdQ?=
 =?utf-8?B?a1FrMkYrS29oY0taN0ZJVUg2Y0twaCtLKzJVN01jcDJHNTlwZUZJVEN3SlZr?=
 =?utf-8?B?M29kU1JqOTBQMVNPd0FHUlhlTTFlbWprVGJMbFp0VE9KNUlPcnU0TG1OcTRs?=
 =?utf-8?B?a2dYc2NTVW4ybXQ5ZW1ZandOWlExUlFubGdHZUU4UmJRUU1GdzhVZkppRmFL?=
 =?utf-8?B?TTZXQ3MyREtsNEpqMXlCZSswQUxFUkIxVTZNaFBXejVINXQ3TEU2cWtWSHBo?=
 =?utf-8?B?R1JidEM5ZjdUd25HT0RFMFVBQVNjVFRaVGN1ZVRmWG5DRUlJbjkzUGlOS3B6?=
 =?utf-8?B?WDd2Qk1VSDQ3R2JwVDFma1UyMU1Fd0lQeFF5NUFwOExwYnd3ZXd4RmFHdEYx?=
 =?utf-8?Q?I2S8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4972183-ff98-4ea4-e3a6-08db3f0f9a75
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 06:47:25.4482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eYBIRfwwVX+RyTU9qbPRpIlU/GZBK7zR5RKNRvrvc4HFNpi8o7TkvhdL02y/99B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "robdclark@chromium.org" <robdclark@chromium.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>, "Zeng, Oak" <oak.zeng@intel.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.04.23 um 16:13 schrieb Daniel Vetter:
> On Tue, Apr 11, 2023 at 11:02:55AM +0200, Christian König wrote:
>> The point is that this not only requires some work in the drm_scheduler, but
>> rather it then makes only little sense to use the drm_scheduler in the first
>> place.
>>
>> The whole point of the drm_scheduler is to provide dma_fence implementation
>> for the submitted jobs.
>>
>> We also have dependency handling, but as Daniel and I said this can be
>> easily extracted into a separate object/component.
> Uh that's not what I meant. My take is that minimally patching drm/sched
> to make the out-fence either optional, or complete it right away, is the
> simplest way to get at the dependency handling. For me at least the major
> part of drm/sched is the dep handling and timeout stuff. And the later can
> be reused with some glue to handle preempt timeouts too and other things,
> since tdr is a work struct you can just issue any other gpu timeouts on
> the same workqueue and using the roughly same pattern as the ->timed_out
> hook and it'll just work.

Well that strongly sounds like what I had in mind as well.

If we move the dependency/timeout functionality into a new component or 
if we move the scheduler fence into a new component doesn't seem to 
matter, the high level goal is that we have separated the two 
functionalities and both approach will work for that.

> The entire "oh we also make sure your hw fence doesn't leak into public
> fences and causes lifetime mayhem" seems pretty minor. And maybe also
> something we want to replicate for the preempt-ctx dma_fence that some
> long-running context need (but more as part of drm_sched_entity I guess).
>
> We can of course bikeshed how much flexibility really should be in the
> different parts of drm/sched, but imo that's a bikeshed.

Well the dependency handling in a separate component would still be 
interesting to have since we need something similar for user queues as well.

Christian.

> -Daniel
>
>
>> Regards,
>> Christian.
>>
>> Am 07.04.23 um 02:20 schrieb Zeng, Oak:
>>> So this series basically go with option 2. The part that option2 makes me uncomfortable is, dma-fence doesn't work for long running workload, why we generate it in the first place? As long as dma-fence is generated, it will become a source of confusion in the future. It doesn't matter how much you annotate it/document it. So if we decide to go with option2, the bottom line is, don't generate dma-fence for long running workload during job submission. This requires some rework in drm scheduler.
>>>
>>> The cleanest solution to me is option3. Dma-fence is a very old technology. When it was created, no gpu support page fault. Obviously this is not a good technology for modern gpu with page fault support. I think the best way is to create a new scheduler and dependency tracking mechanism works for both page fault enabled and page fault disabled context. I think this matches what Christian said below. Maybe nobody think this is easy?
>>>
>>> Thanks,
>>> Oak
>>>
>>>> -----Original Message-----
>>>> From: Brost, Matthew <matthew.brost@intel.com>
>>>> Sent: April 5, 2023 2:53 PM
>>>> To: Zeng, Oak <oak.zeng@intel.com>
>>>> Cc: Christian König <christian.koenig@amd.com>; Vetter, Daniel
>>>> <daniel.vetter@intel.com>; Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>; dri-devel@lists.freedesktop.org; intel-
>>>> xe@lists.freedesktop.org; robdclark@chromium.org; airlied@linux.ie;
>>>> lina@asahilina.net; boris.brezillon@collabora.com; faith.ekstrand@collabora.com
>>>> Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>>> plans
>>>>
>>>> On Wed, Apr 05, 2023 at 12:06:53PM -0600, Zeng, Oak wrote:
>>>>> Hi,
>>>>>
>>>>> Using dma-fence for completion/dependency tracking for long-run
>>>> workload(more precisely on-demand paging/page fault enabled workload) can
>>>> cause deadlock. This seems the significant issue here. Other issues such as the
>>>> drm scheduler completion order implication etc are minors which can be solve
>>>> inside the framework of drm scheduler. We need to evaluate below paths:
>>>>> 	1) still use drm scheduler for job submission, and use dma-fence for job
>>>> completion waiting/dependency tracking. This is solution proposed in this series.
>>>> Annotate dma-fence for long-run workload: user can still wait dma-fence for job
>>>> completion but can't wait dma-fence while holding any memory management
>>>> locks.  We still use dma-fence for dependency tracking. But it is just very easily
>>>> run into deadlock when on-demand paging is in the picture. The annotation helps
>>>> us to detect deadlock but not solve deadlock problems. Seems *not* a complete
>>>> solution: It is almost impossible to completely avoid dependency deadlock in
>>>> complex runtime environment
>>>> No one can wait on LR fence, so it is impossible to deadlock. The
>>>> annotations enforce this. Literally this is only for flow controling the
>>>> ring / hold pending jobs in in the DRM schedule list.
>>>>
>>>>> 	2) Still use drm scheduler but not use dma-fence for completion signaling
>>>> and dependency tracking. This way we still get some free functions (reset, err
>>>> handling ring flow control as Matt said)from drm scheduler, but push the
>>>> dependency/completion tracking completely to user space using techniques such
>>>> as user space fence. User space doesn't have chance to wait fence while holding
>>>> a kernel memory management lock, thus the dma-fence deadlock issue is solved.
>>>> We use user space fence for syncs.
>>>>
>>>>> 	3) Completely discard drm scheduler and dma-fence for long-run
>>>> workload. Use user queue/doorbell for super fast submission, directly interact
>>>> with fw scheduler. Use user fence for completion/dependency tracking.
>>>> This is a hard no from me, I want 1 submission path in Xe. Either we use
>>>> the DRM scheduler or we don't.
>>>>
>>>> Matt
>>>>
>>>>> Thanks,
>>>>> Oak
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Christian König <christian.koenig@amd.com>
>>>>>> Sent: April 5, 2023 3:30 AM
>>>>>> To: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
>>>>>> <oak.zeng@intel.com>
>>>>>> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
>>>>>> robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
>>>> airlied@linux.ie;
>>>>>> lina@asahilina.net; boris.brezillon@collabora.com;
>>>> faith.ekstrand@collabora.com
>>>>>> Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>>>>> plans
>>>>>>
>>>>>> Am 04.04.23 um 20:08 schrieb Matthew Brost:
>>>>>>> On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
>>>>>>>> Hi Matt, Thomas,
>>>>>>>>
>>>>>>>> Some very bold out of box thinking in this area:
>>>>>>>>
>>>>>>>> 1. so you want to use drm scheduler and dma-fence for long running
>>>> workload.
>>>>>> Why you want to do this in the first place? What is the benefit? Drm scheduler
>>>> is
>>>>>> pretty much a software scheduler. Modern gpu has scheduler built at fw/hw
>>>>>> level, as you said below for intel this is Guc. Can xe driver just directly submit
>>>> job
>>>>>> to Guc, bypassing drm scheduler?
>>>>>>> If we did that now we have 2 paths for dependency track, flow controling
>>>>>>> the ring, resets / error handling / backend submission implementations.
>>>>>>> We don't want this.
>>>>>> Well exactly that's the point: Why?
>>>>>>
>>>>>> As far as I can see that are two completely distinct use cases, so you
>>>>>> absolutely do want two completely distinct implementations for this.
>>>>>>
>>>>>>>> 2. using dma-fence for long run workload: I am well aware that page fault
>>>> (and
>>>>>> the consequent memory allocation/lock acquiring to fix the fault) can cause
>>>>>> deadlock for a dma-fence wait. But I am not convinced that dma-fence can't
>>>> be
>>>>>> used purely because the nature of the workload that it runs very long
>>>> (indefinite).
>>>>>> I did a math: the dma_fence_wait_timeout function's third param is the
>>>> timeout
>>>>>> which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not
>>>> long
>>>>>> enough, can we just change the timeout parameter to signed 64 bits so it is
>>>> much
>>>>>> longer than our life time...
>>>>>>>> So I mainly argue we can't use dma-fence for long-run workload is not
>>>>>> because the workload runs very long, rather because of the fact that we use
>>>>>> page fault for long-run workload. If we enable page fault for short-run
>>>> workload,
>>>>>> we can't use dma-fence either. Page fault is the key thing here.
>>>>>>>> Now since we use page fault which is *fundamentally* controversial with
>>>>>> dma-fence design, why now just introduce a independent concept such as
>>>> user-
>>>>>> fence instead of extending existing dma-fence?
>>>>>>>> I like unified design. If drm scheduler, dma-fence can be extended to work
>>>> for
>>>>>> everything, it is beautiful. But seems we have some fundamental problem
>>>> here.
>>>>>>> Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
>>>>>>> the signal / CB infrastructure) and enforce we don't use use these
>>>>>>> dma-fences from the scheduler in memory reclaim paths or export these to
>>>>>>> user space or other drivers. Think of this mode as SW only fence.
>>>>>> Yeah and I truly think this is an really bad idea.
>>>>>>
>>>>>> The signal/CB infrastructure in the dma_fence turned out to be the
>>>>>> absolutely nightmare I initially predicted. Sorry to say that, but in
>>>>>> this case the "I've told you so" is appropriate in my opinion.
>>>>>>
>>>>>> If we need infrastructure for long running dependency tracking we should
>>>>>> encapsulate that in a new framework and not try to mangle the existing
>>>>>> code for something it was never intended for.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> Matt
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Oak
>>>>>>>>
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>>>>>>>> Matthew Brost
>>>>>>>>> Sent: April 3, 2023 8:22 PM
>>>>>>>>> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>>>>>>>> Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com;
>>>>>> airlied@linux.ie;
>>>>>>>>> lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
>>>>>>>>> <matthew.brost@intel.com>; christian.koenig@amd.com;
>>>>>>>>> faith.ekstrand@collabora.com
>>>>>>>>> Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload
>>>>>> plans
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>>>>>>>> have been asked to merge our common DRM scheduler patches first as
>>>> well
>>>>>>>>> as develop a common solution for long running workloads with the DRM
>>>>>>>>> scheduler. This RFC series is our first attempt at doing this. We
>>>>>>>>> welcome any and all feedback.
>>>>>>>>>
>>>>>>>>> This can we thought of as 4 parts detailed below.
>>>>>>>>>
>>>>>>>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>>>>>>>> entity (patches 1-3)
>>>>>>>>>
>>>>>>>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>>>>>>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>>>>>>>> severals problems as the DRM was originally designed to schedule jobs
>>>> on
>>>>>>>>> hardware queues. The main problem being that DRM scheduler expects
>>>> the
>>>>>>>>> submission order of jobs to be the completion order of jobs even across
>>>>>>>>> multiple entities. This assumption falls apart with a firmware scheduler
>>>>>>>>> as a firmware scheduler has no concept of jobs and jobs can complete
>>>> out
>>>>>>>>> of order. A novel solution for was originally thought of by Faith during
>>>>>>>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>>>>>>>> and entity. I believe the AGX driver [3] is using this approach and
>>>>>>>>> Boris may use approach as well for the Mali driver [4].
>>>>>>>>>
>>>>>>>>> To support a 1 to 1 relationship we move the main execution function
>>>>>>>>> from a kthread to a work queue and add a new scheduling mode which
>>>>>>>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>>>>>>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>>>>>>>> relationship and can be thought of as using scheduler as a dependency /
>>>>>>>>> infligt job tracker rather than a true scheduler.
>>>>>>>>>
>>>>>>>>> - Generic messaging interface for DRM scheduler
>>>>>>>>>
>>>>>>>>> Idea is to be able to communicate to the submission backend with in
>>>> band
>>>>>>>>> (relative to main execution function) messages. Messages are backend
>>>>>>>>> defined and flexable enough for any use case. In Xe we use these
>>>>>>>>> messages to clean up entites, set properties for entites, and suspend /
>>>>>>>>> resume execution of an entity [5]. I suspect other driver can leverage
>>>>>>>>> this messaging concept too as it a convenient way to avoid races in the
>>>>>>>>> backend.
>>>>>>>>>
>>>>>>>>> - Support for using TDR for all error paths of a scheduler / entity
>>>>>>>>>
>>>>>>>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>>>>>>>
>>>>>>>>> - Annotate dma-fences for long running workloads.
>>>>>>>>>
>>>>>>>>> The idea here is to use dma-fences only as sync points within the
>>>>>>>>> scheduler and never export them for long running workloads. By
>>>>>>>>> annotating these fences as long running we ensure that these dma-
>>>> fences
>>>>>>>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>>>>>>>> thus approach is the scheduler can still safely flow control the
>>>>>>>>> execution ring buffer via the job limit without breaking the dma-fence
>>>>>>>>> rules.
>>>>>>>>>
>>>>>>>>> Again this a first draft and looking forward to feedback.
>>>>>>>>>
>>>>>>>>> Enjoy - Matt
>>>>>>>>>
>>>>>>>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>>>>>>>> [2] https://patchwork.freedesktop.org/series/112188/
>>>>>>>>> [3] https://patchwork.freedesktop.org/series/114772/
>>>>>>>>> [4]
>>>> https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>>>>>>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
>>>>>>>>> next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>>>>>>>
>>>>>>>>> Matthew Brost (8):
>>>>>>>>>      drm/sched: Convert drm scheduler to use a work queue rather than
>>>>>>>>>        kthread
>>>>>>>>>      drm/sched: Move schedule policy to scheduler / entity
>>>>>>>>>      drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling
>>>> policy
>>>>>>>>>      drm/sched: Add generic scheduler message interface
>>>>>>>>>      drm/sched: Start run wq before TDR in drm_sched_start
>>>>>>>>>      drm/sched: Submit job before starting TDR
>>>>>>>>>      drm/sched: Add helper to set TDR timeout
>>>>>>>>>      drm/syncobj: Warn on long running dma-fences
>>>>>>>>>
>>>>>>>>> Thomas Hellström (2):
>>>>>>>>>      dma-buf/dma-fence: Introduce long-running completion fences
>>>>>>>>>      drm/sched: Support long-running sched entities
>>>>>>>>>
>>>>>>>>>     drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>>>>>>>     drivers/dma-buf/dma-resv.c                  |   5 +
>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>>>>>>>     drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>>>>>>>     drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>>>>>>>     drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>>>>>>>     drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>>>>>>>     drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>>>>>>>     drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>>>>>>>     drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>>>>>>>     drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>>>>>>>     drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++--
>>>> ---
>>>>>>>>>     drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>>>>>>>     include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>>>>>>>     include/linux/dma-fence.h                   |  60 ++++-
>>>>>>>>>     16 files changed, 649 insertions(+), 184 deletions(-)
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> 2.34.1

