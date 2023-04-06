Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBA6D923F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537AF10EB44;
	Thu,  6 Apr 2023 09:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5CF10EB43
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:06:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT2VWGxMTqdCSIA0RO52JXoFXpdpmR7Xh8EqGw3q8cdO9Ep4VBbEKRgkhu9XrmqW6CKshv2s1m/mDLgW8v1nkEx0dEGFHjRg6ZPadU7VhvLQORoDJwyNqk0iWC/hyIHjp3SK1QK+k2LT/5tfNepiCgeDs+1E/nCtKff+pVW+u3QA3Ccl1WNRfn4VydB2/bBl/dCorsR8KLEKVkiKAGPrWGbzygaTqrL0vJOaYkRvPw94OQGu6LQ8MdHio/93dPXFKPMksJMgNaKl3qVkp1IxNEVpd8tY8Q5NubAP1HYKsVesueC3yrPHguwOk2XPIEZ1nkiyl+I2Vrzo4YX8wonPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBtzoEQzftDK/D2RmrxlepcWllFg/pXlLWxUystsmkA=;
 b=Lw2ob66/HEROvGvqQQvcn8F7BwpAb04A5XiQtFXGCIGVqZoe5JNZmg7Frhbg6e8iA4K2OL8MU5zWUuoq00hwhIZK6ugxHpPsv7H50YRfg1L2LbCGGV2CbAg+4W4QdMgvReOPVW2EyN8MWBb5U8PiO34Wn5GK0XMCCMnaj49sk9AhtDBM7RQnJORbQhle0QDZmCxDvvbRUB/msMMvTIaIYKoiTShJvYOBQtRvp54PLai3JdgPwiTy9J7LiBfXMTjUE509vWZZ1Vag+wNiqufQz65xOb3TnIoXtntqeYqu0xJeLwwEqq3rQdcHAabPjfm0CLX3GPXLB4sm+lQ3OnufKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBtzoEQzftDK/D2RmrxlepcWllFg/pXlLWxUystsmkA=;
 b=ILMTeYpx0EtB+bvNkhDWNCsmVmmetBncmNr+DD0DYPIGaJrv0DRAK0SGcV73yLpEy2yJwhvll5z+b3+S4fO3AAEMIvy7xH2whQuApv0fsyluuDHUP/8eO3CorYM7mYEix+aU21jeXLxo4zZwAmyPo0Ku5lfkxKlEA5fN6w/q0/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 09:06:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:06:14 +0000
Message-ID: <180bd178-e3c0-85e3-785e-fc8a216cf65e@amd.com>
Date: Thu, 6 Apr 2023 11:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
 <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
 <cfbaceae-6d40-a8b3-e449-6473be234d2d@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cfbaceae-6d40-a8b3-e449-6473be234d2d@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1faf12-aeb6-4717-5437-08db367e2c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dT8QCU5sEF4FhMWe8Moqn65NPm4yCYUpM/lXkpr8ZVddGjHKldHNxvdXLfj2689d8e5ynhccyxIEc5hRMWuh1KkWgsa3u2iW/M5uqkFU2MpR2hVKG+gNP/oBWYKovSVXP6WIaX5wPTZp1bhrpa5cYktt+O6pojdgWwlv6+u6eSczNkoZ4fuljALU1Ed0XiqhxW2V6iM0HjPn1PbaHYRv/tnaUFbvlEYvs7W7gC3cuSpwZqdWhAiOQQYhoU0bpMFQBySI7fHTT7OL+QKWnEVlEepjmIxRXFmGp+7QfpMdqEiLL16Q72334OIaYdsy9FMsV+us1m7+DcNs9CYRRS0n4Y7YsbDmYjEe4zKXPRMDCg5l+0VIoj8Ad+eCA1ls22HqYLD4YIP4QcQ9jQj38ofUmyHV8MJN+l+drKUNTwkmqcL2Ms6bv0BMdQKIqcLcsYrus3FLmirTyymu7+v+klJeBLRIrdcEhUo+k0DTLeXYnrZRAENriBEMlvZ98qGhq3fjj5KNo//kjQOCaz85rTbjzc+cGsO5sfF1WaNby8eC1Mji5A55AFNEyPvkf7Blb1A2oFtNaexq+RJtgPRcautgFi2LZELHiIOJQwiGzwTsUF6/7r9PiXSh6wxUql1cczutShIL7YGcJuhX7U4xDksalA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199021)(86362001)(41300700001)(66556008)(6666004)(31696002)(316002)(66476007)(66946007)(36756003)(6486002)(4326008)(110136005)(2616005)(5660300002)(8676002)(8936002)(2906002)(38100700002)(186003)(6512007)(478600001)(66574015)(26005)(83380400001)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBSUGtmTXlHbFE3SDFvK0JCSGpmWVJWTlVRTERyYmxLdXdaRUh5N001YkR4?=
 =?utf-8?B?T2lQdnhwZkdOWnV5RXFYQnVSK2kyQzFLd3pQVnVPMEZzcXV4cGZLOC9jc3Nz?=
 =?utf-8?B?Q0FUTTV4UGtWS2lkMTJhKzVuNG9TRUVNeUU3RVNyZ2JwcDF3OUVZTkU5U0M4?=
 =?utf-8?B?aE5lT0RrRWliQzBuWWltbWExaXVNRWNyM09wUnVVQ0xrc0U0NzBHRU5Ibkln?=
 =?utf-8?B?ZTJtN01vVGpwdzh5K0FMakp6LzYzbjNGMEhtak54Vng0OTVtbVJVWTRuVWlW?=
 =?utf-8?B?RUdscHJNbkNlZ1lYU0RwcnZwWlBENWprc3F1NGQyRmVqTGQyNjFKRFFMRGxM?=
 =?utf-8?B?RFFPVWtGckx5OVZ5YlpWWmFhdFVUVUt0d1QwVk1HdW9wY1U1YkRCQTBpWFFh?=
 =?utf-8?B?TXpyOG9Rb0lSWUtFKzEvRHYzR2ZVcWZ6VEZwUWllbEdTWFVndlM0aUpnMkpM?=
 =?utf-8?B?cGk4eEs2THBVYTRVUHh3aVlQdWZwMUJKRVAwZDFwTXVBcHFVQW80NExQMG0r?=
 =?utf-8?B?aFdndEdQM3BIQ0ZnblI3Y1dEV01XN2VSck9INEUwcTdNT0tVTlFlQmJXbHB1?=
 =?utf-8?B?SUFLY3VBTXFKYnNhYWZJMlZaZGFRbEVHNGhSdmEzNnhlYm8xM0syZUdwSENR?=
 =?utf-8?B?aWo1VEd0Y3B4dHBEWm1kUVRPSkEyYjM2NTBncXA0QTBrK1AxUy9ROTFjemxH?=
 =?utf-8?B?NEpYOGpEdFJtanBjaEJHZG9MUzh5YnJZS25YaWZpdEhLVGRUcWxTNHdyS01y?=
 =?utf-8?B?dW5pL1pKY3AxbE5iUGRoSVJnbkFZZU1jSmk3U1QyZDRrbnZFZk9OclRaNkMv?=
 =?utf-8?B?M1g4RGhxUTJEMVd3YnlLOUhMQnloYWpZaWc0TDRDVE9raHExOUxJYUk4MkdL?=
 =?utf-8?B?enhCU3g2d3dxekZ4bCszSGRCdzlMMC91Zk5IQWdZczRlbjRNZ3oxaHZoVXNW?=
 =?utf-8?B?UXVDMm9LbTc4ZjdiMjhwVGI2YXpUVmRUQWl4TEFVaXdNYmhoZFVIMHFmLy9k?=
 =?utf-8?B?eFFNTVVhL2J5OGwrUVRBTjNUdEc1NVlKTU1hVGRVNVM0N0NYTzlTb255RnA4?=
 =?utf-8?B?SVQ2QXg3RmlmSDAwSkV6ekpsTGlXU1FEMjcveXNCNG9RNXVpUmUzYVp2a0Yy?=
 =?utf-8?B?TlZOZFF2Y0s5ajBwbFZpdy9HUi9VbWhoSUcrdlRDNWRrVU0ySzI1YlBnRUtn?=
 =?utf-8?B?KzBFTDFxZjhzRE9laVFsMmdqaGVBT0hkV3dGcXUvdFIxT1BPR3hiZUlROGM2?=
 =?utf-8?B?MG8vTVk3V0I1OWlTME9sVm1BRFhaL2RjVGhRdlRrZkVSMGdBN3RGb1plY0RI?=
 =?utf-8?B?Smt1YzlQL3pmdUFrVVRDKzIrakVQd0xzeFBNc1MwL0RPNU1oQXl4Y2JNSzNU?=
 =?utf-8?B?V1B3YkN0NG5yUEJCMHpLNUJuVXlHMlVVWCtYWGxzaFpTNU1PaE1Kbm1laXI4?=
 =?utf-8?B?ankrbmRIV25Wci9NdXhSWDdsdk1EKzNlWGIrVFZqUzkvZlVxM3VFRHpVL242?=
 =?utf-8?B?SEp3SjJCTkM2bmNHRklTT2U4aDRON2hwMTNacVhSaFR0a0dyTHQxRWtEOGtz?=
 =?utf-8?B?c2IzVGowVi9tY3c2emg2dFlDaWo0QVVTRko1TnEwemZHZlJRdG05T0w3L0tV?=
 =?utf-8?B?c1R3ZnBHRG1JUUhkMFROQzI4Nm4zdVV5RWsza1dJWWY0Mm1UKzN0eDF1eXV3?=
 =?utf-8?B?SEhRc3hpUmZXeUNiTklVcFh3WXpUNmhaNnk3djhkYjkrY25Kc0tBbTBvdlpq?=
 =?utf-8?B?ZnJCOXR1Zk9CcFRiM0pSOFZvKzJWYmFFMG4zMHBmeFd4L0lXbkdBcUQ2b2V1?=
 =?utf-8?B?T05PVnd2Yld3eEh2TXJkZ3F5ZWViMXdrd1pmUFpvZDhWMmRWNFRLbWZ6T05m?=
 =?utf-8?B?OHZ5OVoyejltRW9hNWRyTS9uWVdzNU1DR24wcWV2bVZkS1gwUGZHVzV1dER3?=
 =?utf-8?B?cE1Fakk4UUxidjV1UmIrVnlZZ1FuaVBGa0V1WWZVUkJVWXJUTWMxWlF6Wk1Z?=
 =?utf-8?B?V2hrWFlMcDFISXJ3Ym8vQmdhdTN2MVRqLzhqS0xISWpCZVJyZExNbVNjUk1m?=
 =?utf-8?B?cWU1eTBkaDl1emV5TEtub0RmQjNEMGxYemhVQTYybGZhTnRMQWZZaTIvRmJQ?=
 =?utf-8?Q?CGKVV4cDTI/PIctXDuAgJYYMM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1faf12-aeb6-4717-5437-08db367e2c21
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:06:13.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2gTGOwcUKhYIl+HGwoihHTcBhlAiqBYEMokM02MVO5dqhsYtbHl8aiRyl+gZ+of
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.23 um 10:49 schrieb Asahi Lina:
> On 06/04/2023 17.29, Christian König wrote:
>> Am 05.04.23 um 18:34 schrieb Asahi Lina:
>>> A signaled scheduler fence can outlive its scheduler, since fences are
>>> independently reference counted.
>>
>> Well that is actually not correct. Schedulers are supposed to stay
>> around until the hw they have been driving is no longer present.
>
> But the fences can outlive that. You can GPU render into an imported 
> buffer, which attaches a fence to it. Then the GPU goes away but the 
> fence is still attached to the buffer. Then you oops when you cat that 
> debugfs file...

No, exactly that's the point you wouldn't ops.

>
> My use case does this way more often (since schedulers are tied to 
> UAPI objects), which is how I found this, but as far as I can tell 
> this is already broken for all drivers on unplug/unbind/anything else 
> that would destroy the schedulers with fences potentially referenced 
> on separate scanout devices or at any other DMA-BUF consumer.

Even if a GPU is hot plugged the data structures for it should only go 
away with the last reference, since the scheduler fence is referencing 
the hw fence and the hw fence in turn is referencing the driver this 
shouldn't happen.

>
>> E.g. the reference was scheduler_fence->hw_fence->driver->scheduler.
>
> It's up to drivers not to mess that up, since the HW fence has the 
> same requirements that it can outlive other driver objects, just like 
> any other fence. That's not something the scheduler has to be 
> concerned with, it's a driver correctness issue.
>
> Of course, in C you have to get it right yourself, while with correct 
> Rust abstractions will cause your code to fail to compile if you do it 
> wrong ^^
>
> In my particular case, the hw_fence is a very dumb object that has no 
> references to anything, only an ID and a pending op count. Jobs hold 
> references to it and decrement it until it signals, not the other way 
> around. So that object can live forever regardless of whether the rest 
> of the device is gone.

That is then certainly a bug. This won't work that way, and the timelime 
name is just the tip of the iceberg here.

The fence reference count needs to keep both the scheduler and driver 
alive. Otherwise you could for example unload the module and immediately 
ops because your fence_ops go away.

>
>> Your use case is now completely different to that and this won't work
>> any more.
>>
>> This here might just be the first case where that breaks.
>
> This bug already exists, it's just a lot rarer for existing use 
> cases... but either way Xe is doing the same thing I am, so I'm not 
> the only one here either.

No it doesn't. You just have implemented the references differently than 
they are supposed to be.

Fixing this one occasion here would mitigate that immediate ops, but 
doesn't fix the fundamental problem.

Regards,
Christian.

>
> ~~ Lina
>

