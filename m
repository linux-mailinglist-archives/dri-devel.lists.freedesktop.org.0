Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA96D7563
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94B410E30F;
	Wed,  5 Apr 2023 07:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636C10E02B;
 Wed,  5 Apr 2023 07:30:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4BGEUpN/zq9Fr+8STKcMSsCq/MIuzFIra58reObHf4mhYBYDdjBix8l83vvBeJiFWmCaTXoMOF+aQFMEa9tS38jiE5I3nQIzjMwOksDzQWtJGurh4qMd7DufTsbsl3V0qUH5HSoQO2ajpoDiYGvcioiJnJQ/gA6ZSVRAmdOKvMf1ZQBmFm9Z7ydVOw1x11K07j1iHY77Lt6BK1qXPk0UU3b5eCrmu6iq2Wn4B5cuxSucrSRaooWu9sbajefZuy6s40fKzuXpHZUxyvYETPTY4gND1fpWqrH45PUQDPb7xKATe6LRzsK2Z1r44VKifcLm9lW57GSiPqJGSjvjgeIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKX9yA5WizptH2Ot/ZM+xHn0bDW7xr7R4aHGwob36aY=;
 b=UtDGwrAVPzk9XrLUC3t5qkUGLeQ80cRg9HJpDGL89eMQvttHpGEXDNn823yfk3npJDhaQObu+gciKvNtK3m+4A9TyQCbrbPY22ks7LFyZEkvoZqEV5QtAw8dYrEq8jVPYXTYiGIyDuNH9JHIgaCK0Rqs6X04yVktBIpf0rkk2og0hsHP5p1QiFFZ7lJyZ8fh7sT+u/8kwHl18Whl2+XLAE+2q1gv3UC4d7LurP3P1psYnrt+tyPbTLlw3k3X97ftfLf5WGlGHSe/SI3pUde6EaeXNZQ1/d7ig+k+WGEJdtV1A7O7MwvZtPsrgtEnp2HtNZe7OUtyv6Kb5DoyqwesHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKX9yA5WizptH2Ot/ZM+xHn0bDW7xr7R4aHGwob36aY=;
 b=hfRJhxXoi/XRXX1HQnyAdI0NGGxin602elf5NgxFI0nRMJCGjRpZAzIVXQs7fFjMW7lywgLQCLlRlPNZdj9id66e1Buh58EURvYT3/zWp/Rl7y3HALgOtHiPFVrnTn0t7nxFzUzYEwF5RqMhu6s6p1Zu5WXLzxbY12JW8iQVZe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5044.namprd12.prod.outlook.com (2603:10b6:610:e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 07:30:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 07:30:17 +0000
Message-ID: <018b891d-ec31-b8c2-f987-45a204ed77ed@amd.com>
Date: Wed, 5 Apr 2023 09:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, "Zeng, Oak" <oak.zeng@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <SA1PR11MB69913F0A0038DA307701D44092939@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZCxnuCvmknUuLydM@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d1d38c-f7a9-40be-df4c-08db35a79acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3WbLH4iftnIn1wpJ8R0O3otR6CLMwuKZ8fJkFqIp2LsqxGjlgElhMxG+zT0a0sPDHJ9gcZdLBpMJ75z+yfhUBzo5eF1wsDST3FW+BVpqljBMACz+W9yCNy27bKB4WQjrkI4LKN+TQTJoJxi/fWg48f0lWOjpQdkQD3EYJCoeWJoKxAPR0aI2xP/fUbLtRabxhZN7n/0gTu8h0TPzE0xC4qtZtPQiaC2je2gc/zsiG3CWjgX9u2yQlxdhPrnUp3LBMAR/KFP9XKKoa7N7MNmMCRv7txSKed9UUkGIHoN2r/0pcR/lipElF3NWoWV5x2COZHYZX+tP14SvVPutCYo6YTLlSakidBmfPcFG8Vb/9Gv7UtPNP0lxGUSNixLfE6PrqJ/hCz8eBQUWJIgjz04Xp4kl2OKc1/B76cHjxCrPALkqanoKGYg28zSRkgs6ubJ1pN433LeB/hJUTDUS1fMTPC9q6i7e5MlWI0j8puqVRQQnCMfrP9ofTkC8fwxyTSi9RtULluqt/htZvpDobCAKBPXj6RMyAWK3xWajintuvl1x5stj4Djtu2iqDQMYxQsYlcCidNxB/Uba3qTpl92lTlXiNckEpL98DfH6lJHMb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(38100700002)(6666004)(6486002)(966005)(83380400001)(36756003)(66574015)(2616005)(86362001)(31696002)(53546011)(6512007)(6506007)(2906002)(186003)(54906003)(316002)(110136005)(7416002)(66556008)(8676002)(66946007)(66476007)(4326008)(31686004)(66899021)(8936002)(41300700001)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFOSkhuTjl4NkwxQTE3d0NSUyszeGs0RlhqaGt4WEpnU2tmd1hmVVJYWlhv?=
 =?utf-8?B?eW5QaW9VSWR4bzl2eTdoZndpZS95T0M4S016NTRUUmJJQXhvbk1pSmloZXI4?=
 =?utf-8?B?QUszUzc4ZHpldnY5a29NNmFRRDNkdVdQUGtoTVhpMEVpMHFDdVh1Qy92Nmcx?=
 =?utf-8?B?cVJvTmFlWnZ0b1dua0EzTVJHUVowM2cydXA0b0Z6bWU4TEszcnpLWVMzbkpV?=
 =?utf-8?B?ZzZtRjc3dlFXUk1kRVNIeDdQS1lIcS9LN2kzbUpEbnBud2l1cUhlMVdhekJC?=
 =?utf-8?B?WkE0TWkzSGV0SlNkOC85dldITUdhV2cvSHNEM05BZFAzc0hEcm5hb0ZuS2VT?=
 =?utf-8?B?bmdpcEdLM05uSGI2aUsrTVRUQ1lOcFhKdVFSQWVSVW9ZTENjZndPNkxYcmJ6?=
 =?utf-8?B?U3hlWTBEVEVNSkxidVhoTVFYRnhBVkpkdFEzL3FYTkVacnI5SytLVWdjRksw?=
 =?utf-8?B?dEVXZ0dkTTlIMW43d0JLTEFSMTJLWXRibkZ4di9kMmw4cWJBc2NLK0lmNzE2?=
 =?utf-8?B?WWtlWjI3UWVoUEFORWdJOE04UjA3M3llYUJnV3VNNHJqMTNtTlJmT1hoWjln?=
 =?utf-8?B?ZXlnL2lFWWZmSjhhMzVwMDJObDgxMXBvSDZFTHQ5WHFPR25EZ1MrOElCM2k1?=
 =?utf-8?B?czZBdE5maUYxV1R1OHcxMm9mazNJMElXREx2ZG9HZWF4d1ZsUEdDTndWQlJv?=
 =?utf-8?B?RVlCbGNVWWhITTlUNjVXVUF4dmNjYnhsMkYvaWt6MnAvaTd1cVdKTEtsMm9l?=
 =?utf-8?B?dFZkNXgrQTBrSWpWMnFvS3BIRnVoV21hWmJXTklFb1NFbDlCNHRSUEt4VnhQ?=
 =?utf-8?B?dVlsK001ZUk0SFhlaFFTK0VjMG54MlZ6RzZrZFl5bkZGaUUwYWdSVU5lOGxN?=
 =?utf-8?B?bmtPZzFJOHpJbEV0SGhCNVNDVjZzbWJ4bURXS1pXallFZzA3T0pYdTI4RTAr?=
 =?utf-8?B?RXJ1b2NOUkdjemozT1V1VlgyNDFGZFFNQ0ZuZStTZDgrd0dIQ0I0ZzQyV1dB?=
 =?utf-8?B?azNsMkxYOEhNeDNGVDZFd3RBVHYvZ29PQzVpeEtKUmZhR0tkQUYyVEZ5ZnpR?=
 =?utf-8?B?Zy91V09LMDJpdVBHYXdub1AyY05xWFFMdVgyTmNDTUQ4dGRzWTB1eDVTSGpZ?=
 =?utf-8?B?RXBVY0NWM1pPQmJac3AxWXI4eXNsejREMWRLeWYrWWJRYXhqY0F4MDM2UUhW?=
 =?utf-8?B?WkQ0WWR3TFFPbWZJcG5wcEIrRTdqYVNSRi9vdjJOKzFwNENpUXBia3k0d0la?=
 =?utf-8?B?a05FTVY3cC9aUjU2RmFRMjVrNGhselRRVGErMFlQQ3ZrNnFuenNtcVk0NnRU?=
 =?utf-8?B?MVkxMzh0WGJ5b2UwVFAvSG9BN2NKY3M4ZjNUSTRpQ3VGYVRqNVJIZ2pMZXdv?=
 =?utf-8?B?SmRQd01JT1hqclJDNE5NUngzVFZRTmI1TXhZcTRvTzVmOGdpOEhyM2szWjhs?=
 =?utf-8?B?NDkwejdiVXlWMDYxZUJvRFpqdTdVUzhuN3U2cTBGUXEvcEM5TXFEVjFnUGRY?=
 =?utf-8?B?Ti9xMDFXU3Nra3VlSGYxaGNYQmZ4UFMyTmxtYTZCem5WR0U4Q09DcldrbDZF?=
 =?utf-8?B?T25OOXpsaFNkakxlbk1Ub3JvS3U2Y2syblRoMXN2bXdBcDB5Skx0am1obXh5?=
 =?utf-8?B?MkJ2dDY1R2IxRTQzU2pDV3pQdjVTOFA4RDFYcGZHVGhXcjBxQ2RiYzdpbFQy?=
 =?utf-8?B?dWdLcUJHUzBRbTJlK3VPQXhVb09uYXltZGRRVzhBYWFDUjFpbFNlT1lOcmFH?=
 =?utf-8?B?R2toQ3V6a0JJc3h5YmJpMmpoNVU1ZWhpektTYnRFT2UydWVKekFBQVg1eElv?=
 =?utf-8?B?YjRBRDF0bGJudEkzUkprU3h4K3UyMEMvb2FTTHQ0SFcrVGphZ3FTczF2WjdP?=
 =?utf-8?B?NXBzVThtenBON1JDcFF0MzQwSXQ0TDZiN0RZejNMMUpwUGwyMlhxTDlNenda?=
 =?utf-8?B?cGh5SExyaGZqeEFyUjJXUHRaQkp3WXhUZGdMem4wWHlud3MxWEVWd3VmeS8v?=
 =?utf-8?B?TDhoSnJ0RVFFblBSd2V2RFdSNUlEbHcrSlE2K0hMVS9SYmY5c1M3R2Z5b2dn?=
 =?utf-8?B?blQ4TjJhMkRwcFBoUHlzVXI3RUlkcUJielB3VU5IcXlvSCttR1ZnUWVETlNE?=
 =?utf-8?B?a21PTER0OTdhVWFQd1U0a0FBaDNsNm00TG5UM2R1WHpTQ1hzdXFudjhIYndG?=
 =?utf-8?Q?7UdQiZgIWa86nnxYC/KRTe92VQAY6hKAjIJwE53AZ/ho?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d1d38c-f7a9-40be-df4c-08db35a79acf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 07:30:17.8171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8jqQzaVvazNHWa901QC4gzk3fnsluycrmoj80SM9OyicpAsrh6gIZmilF1RQc2E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5044
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.23 um 20:08 schrieb Matthew Brost:
> On Tue, Apr 04, 2023 at 12:02:03PM -0600, Zeng, Oak wrote:
>> Hi Matt, Thomas,
>>
>> Some very bold out of box thinking in this area:
>>
>> 1. so you want to use drm scheduler and dma-fence for long running workload. Why you want to do this in the first place? What is the benefit? Drm scheduler is pretty much a software scheduler. Modern gpu has scheduler built at fw/hw level, as you said below for intel this is Guc. Can xe driver just directly submit job to Guc, bypassing drm scheduler?
>>
> If we did that now we have 2 paths for dependency track, flow controling
> the ring, resets / error handling / backend submission implementations.
> We don't want this.

Well exactly that's the point: Why?

As far as I can see that are two completely distinct use cases, so you 
absolutely do want two completely distinct implementations for this.

>> 2. using dma-fence for long run workload: I am well aware that page fault (and the consequent memory allocation/lock acquiring to fix the fault) can cause deadlock for a dma-fence wait. But I am not convinced that dma-fence can't be used purely because the nature of the workload that it runs very long (indefinite). I did a math: the dma_fence_wait_timeout function's third param is the timeout which is a signed long type. If HZ is 1000, this is about 23 days. If 23 days is not long enough, can we just change the timeout parameter to signed 64 bits so it is much longer than our life time...
>>
>> So I mainly argue we can't use dma-fence for long-run workload is not because the workload runs very long, rather because of the fact that we use page fault for long-run workload. If we enable page fault for short-run workload, we can't use dma-fence either. Page fault is the key thing here.
>>
>> Now since we use page fault which is *fundamentally* controversial with dma-fence design, why now just introduce a independent concept such as user-fence instead of extending existing dma-fence?
>>
>> I like unified design. If drm scheduler, dma-fence can be extended to work for everything, it is beautiful. But seems we have some fundamental problem here.
>>
> Thomas's patches turn a dma-fence into KMD sync point (e.g. we just use
> the signal / CB infrastructure) and enforce we don't use use these
> dma-fences from the scheduler in memory reclaim paths or export these to
> user space or other drivers. Think of this mode as SW only fence.

Yeah and I truly think this is an really bad idea.

The signal/CB infrastructure in the dma_fence turned out to be the 
absolutely nightmare I initially predicted. Sorry to say that, but in 
this case the "I've told you so" is appropriate in my opinion.

If we need infrastructure for long running dependency tracking we should 
encapsulate that in a new framework and not try to mangle the existing 
code for something it was never intended for.

Christian.

>
> Matt
>   
>> Thanks,
>> Oak
>>
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>> Matthew Brost
>>> Sent: April 3, 2023 8:22 PM
>>> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>>> Cc: robdclark@chromium.org; thomas.hellstrom@linux.intel.com; airlied@linux.ie;
>>> lina@asahilina.net; boris.brezillon@collabora.com; Brost, Matthew
>>> <matthew.brost@intel.com>; christian.koenig@amd.com;
>>> faith.ekstrand@collabora.com
>>> Subject: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
>>>
>>> Hello,
>>>
>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>> have been asked to merge our common DRM scheduler patches first as well
>>> as develop a common solution for long running workloads with the DRM
>>> scheduler. This RFC series is our first attempt at doing this. We
>>> welcome any and all feedback.
>>>
>>> This can we thought of as 4 parts detailed below.
>>>
>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>> entity (patches 1-3)
>>>
>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>> severals problems as the DRM was originally designed to schedule jobs on
>>> hardware queues. The main problem being that DRM scheduler expects the
>>> submission order of jobs to be the completion order of jobs even across
>>> multiple entities. This assumption falls apart with a firmware scheduler
>>> as a firmware scheduler has no concept of jobs and jobs can complete out
>>> of order. A novel solution for was originally thought of by Faith during
>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>> and entity. I believe the AGX driver [3] is using this approach and
>>> Boris may use approach as well for the Mali driver [4].
>>>
>>> To support a 1 to 1 relationship we move the main execution function
>>> from a kthread to a work queue and add a new scheduling mode which
>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>> relationship and can be thought of as using scheduler as a dependency /
>>> infligt job tracker rather than a true scheduler.
>>>
>>> - Generic messaging interface for DRM scheduler
>>>
>>> Idea is to be able to communicate to the submission backend with in band
>>> (relative to main execution function) messages. Messages are backend
>>> defined and flexable enough for any use case. In Xe we use these
>>> messages to clean up entites, set properties for entites, and suspend /
>>> resume execution of an entity [5]. I suspect other driver can leverage
>>> this messaging concept too as it a convenient way to avoid races in the
>>> backend.
>>>
>>> - Support for using TDR for all error paths of a scheduler / entity
>>>
>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>
>>> - Annotate dma-fences for long running workloads.
>>>
>>> The idea here is to use dma-fences only as sync points within the
>>> scheduler and never export them for long running workloads. By
>>> annotating these fences as long running we ensure that these dma-fences
>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>> thus approach is the scheduler can still safely flow control the
>>> execution ring buffer via the job limit without breaking the dma-fence
>>> rules.
>>>
>>> Again this a first draft and looking forward to feedback.
>>>
>>> Enjoy - Matt
>>>
>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>> [2] https://patchwork.freedesktop.org/series/112188/
>>> [3] https://patchwork.freedesktop.org/series/114772/
>>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-
>>> next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>
>>> Matthew Brost (8):
>>>    drm/sched: Convert drm scheduler to use a work queue rather than
>>>      kthread
>>>    drm/sched: Move schedule policy to scheduler / entity
>>>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>>    drm/sched: Add generic scheduler message interface
>>>    drm/sched: Start run wq before TDR in drm_sched_start
>>>    drm/sched: Submit job before starting TDR
>>>    drm/sched: Add helper to set TDR timeout
>>>    drm/syncobj: Warn on long running dma-fences
>>>
>>> Thomas Hellström (2):
>>>    dma-buf/dma-fence: Introduce long-running completion fences
>>>    drm/sched: Support long-running sched entities
>>>
>>>   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>   drivers/dma-buf/dma-resv.c                  |   5 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>   drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>>>   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>   include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>   include/linux/dma-fence.h                   |  60 ++++-
>>>   16 files changed, 649 insertions(+), 184 deletions(-)
>>>
>>> --
>>> 2.34.1

