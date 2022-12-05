Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90838642494
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 09:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE6210E10A;
	Mon,  5 Dec 2022 08:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7F10E10A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 08:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+9ZGf7PGV9VYPxI/DTScUpBil1ziluAAysIaTKda1dIrS1rVR0mDON51PaT2zIHJt9Fk/I6bwZc4ldYYMtCQGFRkld0DlwKFFR0e7nYTk/yfKLVYa+Jum9fEa84p2vvFBcvAOdO+IA9VptZYBo73PLlO/anP8kym8OLsHpZROkjwk/wEyUdtiwnZXmVzQefMaUyGgYOg+/hkpfu+/PrJUzURv+m+kr8cMCa5tMSkWhsjfb1kS0avi606AmRUJPGO3lkghLSRop/Ho8Swn+M8d8l7DPgqZ949fQJMQFxZ0c6Vex6s/xBozBj64Y2BwcnETBKVOFgyrKx1+sLNRKZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re6YPDB0AQsApw7aqmP6M9GbdAp/iG6Q3t70qgoEMsY=;
 b=TeZCGdT5k3WkfWGAhRpcql36GSn2OUFBGbLbEulpWVwGc6nhcBABIX93WBNiy+EY5DfipnwraxGPYamR5IU12bDXvQT4gH8LxZwNbQb6GlArvqf+XFIgj2BFEkcIfKAapPHjY1t6BFuW5eYpQ61pErf+Mzn12jNcXgTo7yWFBxOsdJP8amIc5Y5PH4InPG9j+c0kCNJZxo61nqOn2tKrXZJBlxQNHnXPtm9wuprqsCZ4AmdcvocxWmhBDwvEKqEdNUR6FRuZvhCT9U41qi0rWZfMWoIhGnr8QRnvKFFY0fNED5qxNzPDqrT7WIkV0o/+KA3L5myhysMEqgDt527v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re6YPDB0AQsApw7aqmP6M9GbdAp/iG6Q3t70qgoEMsY=;
 b=1BloOmOMP2DxiRQxgMwNomy8gi3viDMHDf7xbDUtqGNbeqsKRt0rPS03oF5naMstl8+ODvBolS1bQXmPErN0a10mbky9hch7ogUVyojgYM/3gp/Vsu59j8u2n8q9E8lYHe5tzvty/h3L5Yxft/tdV6QpyIEzq+qufbrMbS9YzgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by PH0PR12MB7010.namprd12.prod.outlook.com (2603:10b6:510:21c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 5 Dec
 2022 08:29:00 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%4]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 08:29:00 +0000
Message-ID: <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
Date: Mon, 5 Dec 2022 09:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|PH0PR12MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 8883063c-64e5-460c-51d1-08dad69ac276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ffzdwr1cnOxMs0pXYojFnsSD6YbnS8lzJz1Q9wjGM32UgMcPq77yYyNJhvYqZFqwzcCUCdFQweb2jtMwP8FTzZ/Nz79nO8MyZJXlAkQU7AAhXcLYKVYUVOhVmNBOcURUlJgPMEPsgOFM8Z9XhDUkGT2kItIgOrOccQ1lrOcKgfsOLUO7jsDlOkvoBokR278QYFtzXOzEPNBLfm+9Zlbe+4oOKfIG3XTbL8L4MWfWUKB5pR2hWnHci+K94IZmSk7BZBxDCeW8xz2b1f8Tugc7uoF6/Ltl1wVbrGkQ7+lA6AN5eQxIFUwirfYtgz0OW+EeihmsXrqg6RbLM/vc5sPxnSmY3u33IgFP6n8jOgXXM0YtbLLGKL+okgGgFYRURy8gUOT+hIPTjBwODtXfpfdH6yRCvJ2PHbK/3uCSax8Rw0bVf0cFUq0E6wX6kBoF26Y/DDeyRTJboDTeZj9bhQNlVcJ26O+BIfVX7Ckwwq0iPHqBlfevnPwGOxJKl3gQ76V6khJ5mb4A+VUc+XyyEmd7vXruxXnYpYZ2/i8mCIyZM0930r1V39qVFqtkX6hltcMix1+Gole7WMrX9aoFXgf+vB5OSpG7wxbQUjH3JHXVsCHtg9BVUr17gZc+1otzNK0ewD6OzSHdAZ1F6vzWLgvs1aKVFxwdKjgJSenOcFqDNFy/YMC8J0HnL2ER+pCdgiMh/aoqyP5u3BpJf4R4xnIFsyPrqofJs0IAiiUJRWaS+lk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(6512007)(2906002)(30864003)(31686004)(66899015)(8676002)(5660300002)(316002)(66946007)(8936002)(66556008)(41300700001)(66476007)(36756003)(54906003)(86362001)(6916009)(4326008)(478600001)(31696002)(6506007)(6666004)(6486002)(186003)(2616005)(7416002)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXlWd05kTGFaU0xpV0FGNEhqaHRkSVA1MXVCV3h0SUN0NGhJeXdsTVB1bVJR?=
 =?utf-8?B?M0RIZ1ozTUxkM0xZcEt5MzkxdXNveTI0anJhZmJnSEFaN1pFcEVCem9BTjIx?=
 =?utf-8?B?THhOMUJwQ3VFS3JHKzRUVCtIeDNHN3RRVmczc0Nxbmlpbk9PNWx2QnpZSGdu?=
 =?utf-8?B?dG9ydnlCaXViSGhZYTZ5bmhTanA2elUwWHpGUWoydDJyRzM1YWxHTm9IeWl4?=
 =?utf-8?B?NUJhTkhmNHo5QTZlM0ZpWFBrWVZQQS9UYkI5SzNmTE5vcmg4LzdFV3NCZlg3?=
 =?utf-8?B?a1JRSWo4dFk3MnJEL0JmU0lBajFQZXhrbEtXc24weHdRa0hkcWRnS2FoY1pU?=
 =?utf-8?B?VWRRdmN1TlpxaDZnYmZtZnd6aEt3ZTRWUU55alNmQndpV2Z3akdpcjJWL2VU?=
 =?utf-8?B?L3V3Nm5BMzZLbys0VzJHRGpBVUwzU28xdXlPSUJvdXNWa0dRc3N4bkJlRXhD?=
 =?utf-8?B?LzV2Ny9CYmJidnVEOEp2bXlVcTZ3U1c2dHB5dlFkTkx2MGpZLzZuZjRZN3Q1?=
 =?utf-8?B?dHlZYkRGNzh2NmFKOGsyUUhVK2tzck1TYlhVZlNtNm96Y3RJZXFmOThpaStR?=
 =?utf-8?B?L2s3aGFvQjRRK216Y2NxSHFaZTBYd1dXeDJKYnp3cVQxOGIvRjI3T3F3NlFG?=
 =?utf-8?B?Nm1HVy9HRGlyQ3FTeUhscmRMemdMRms2eXhkRWlTSmVyenVOUzlVVjBicTk0?=
 =?utf-8?B?aUNtYjVzNXdQczIyMVpaby9waW10MnJLNVI5Y3lDQ0EwTGc4YmE2SVEwa3dF?=
 =?utf-8?B?RVNSb0NQNGs5M0pKYUw4ZEJ6cjhJOVBUdWRZeGRpZWl5S2Q2a0R0elhTZmg3?=
 =?utf-8?B?bmM1Zng2aEJhcWpEVWxiOE1YR3FWRmcrYkwvNVlnN21DWE1VVkZkeW13Rkg0?=
 =?utf-8?B?dlpKL2RpK1o1SHQrK3RJSTEvTENZMFE4Z3NBdlJ0T1Y0cFpxRnpnYTA2djVO?=
 =?utf-8?B?N3M0emYzaUFKemZONnJBZnJSeUhJZlZzei9NWFlDQ1pCWm93TzRhaVNoY0Rj?=
 =?utf-8?B?M3BRaGlBeVZPOHJHUldPRGJYZUhMcTRwUWhZempEYmJPVHR3Y3ZQZHhCY0tj?=
 =?utf-8?B?UUl5ZUxMK1Azd3AybVVUeXF3ejdXejI3T1J3S2R6UW0rK1BsNlpMbkVuVmtU?=
 =?utf-8?B?dUlkeU92NG5PeXJ1RUswaGdod3A0ajA4NEhRUllmMW9WREFmWDNLMDlueGVE?=
 =?utf-8?B?MCsxQkkzNGVoZzRPUElXV0FnUHpXeS9VUG1MMWJWV1I4SDVmdkkwbjhiQ2pt?=
 =?utf-8?B?M01rL1MvMWZVV2dCTWNzOXZOOUNXSEtsM0xEZ2dRdFZtUFc5VGlub1ljaTk0?=
 =?utf-8?B?MHJzYzFidGZNUjB2NHJkUm5ZWmRvQlRrMWw1a3NLUnR3VUEwU2RZOTBOZWd4?=
 =?utf-8?B?ZitpVWhOMG1tOTA4Vjd2Mi90RkdTRjR6dUNFaDdTNFJ2cVY2bU9hWDJHQ2VZ?=
 =?utf-8?B?d2t2Y0M1eUlSUlVwRWtVWDNQaS9NbmRzNDVCRWRYRWRMQWUyTGdVQjJ4NUc0?=
 =?utf-8?B?UzJKVjl3S1dNM1Y0SjJ6cHNZc3RKOWVIRlFUTkZScVMvVGNLZTNxZDlRN0pv?=
 =?utf-8?B?U3ZxVmtLc0RUT1p6cWljUFhxL3o3WlEvMG5LajBvTFB2QVJwT0ZaREJTZ1J3?=
 =?utf-8?B?enYzenZRd2xoaHFTVERmUWtJZy8rTUxkenBrWVFZMXJLZ2ErbFlEeXZ1dmZz?=
 =?utf-8?B?ak51a0lNS0w1WTR6SW1IbjVNdFlMOCtieXVkMnJBbS9VN08zT0RvQTZ4RnRy?=
 =?utf-8?B?cXZxRWRDTVkwZDREZzVxRWhaRktRS3dOR2RrVEVBUVp1QWt1TWtZZUFPSEcr?=
 =?utf-8?B?L1ExTm9mZzZSbElDMFVVOEZiQVp6cno5WGtNWGpwZG4zL21ja1JMK0w0a3g1?=
 =?utf-8?B?djBNNjlpbThhTm1ZT25NbjhlNTdmbk42cDRScXYvaG1wVk8zM0hHMDRDbGlJ?=
 =?utf-8?B?NWJLVXlrbDNpUXVjYkVOYmZ2N3hCSFhJVTl2QTBpNzByT0NIUDNOUmttQXgx?=
 =?utf-8?B?WmVFcmpmOVpxVUx3NWowcUE2dUo1TkFWL3VPK21RMFZQMDZLdVFBK1hsOEhp?=
 =?utf-8?B?NFpEZ2xQUDU1MkQ2aUFIMnJnSWhMVlZVeFN3Y1NDWHE3TVBEZm1MNHFyMHRI?=
 =?utf-8?B?NWRVK3FrZGFtT1I2TzI4ZitQOHJLMDBXOERzQjcwT0ZpOENISnZUek9IbS9n?=
 =?utf-8?Q?EQa2i00OVVCjn7gjYl6i3EDdMli15CwSgZR1BZqFeEma?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8883063c-64e5-460c-51d1-08dad69ac276
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 08:29:00.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFN5oXjYticstYxUFHaEBKDZM/IMDzit2S0BT+BetSvBJsPgkM/7ZGYPa9dIA3Q0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7010
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomasz,

Am 05.12.22 um 07:41 schrieb Tomasz Figa:
> [SNIP]
>> In other words explicit ownership transfer is not something we would
>> want as requirement in the framework, cause otherwise we break tons of
>> use cases which require concurrent access to the underlying buffer.
>>
>> When a device driver needs explicit ownership transfer it's perfectly
>> possible to implement this using the dma_fence objects mentioned above.
>> E.g. drivers can already look at who is accessing a buffer currently and
>> can even grab explicit ownership of it by adding their own dma_fence
>> objects.
>>
>> The only exception is CPU based access, e.g. when something is written
>> with the CPU a cache flush might be necessary and when something is read
>> with the CPU a cache invalidation might be necessary.
>>
> Okay, that's much clearer now, thanks for clarifying this. So we
> should be covered for the cache maintenance needs originating from CPU
> accesses already, +/- the broken cases which don't call the begin/end
> CPU access routines that I mentioned above.
>
> Similarly, for any ownership transfer between different DMA engines,
> we should be covered either by the userspace explicitly flushing the
> hardware pipeline or attaching a DMA-buf fence to the buffer.
>
> But then, what's left to be solved? :) (Besides the cases of missing
> begin/end CPU access calls.)

Well there are multiple problems here:

1. A lot of userspace applications/frameworks assume that it can 
allocate the buffer anywhere and it just works.

This isn't true at all, we have tons of cases where device can only 
access their special memory for certain use cases.
Just look at scanout for displaying on dGPU, neither AMD nor NVidia 
supports system memory here. Similar cases exists for audio/video codecs 
where intermediate memory is only accessible by certain devices because 
of content protection.

2. We don't properly communicate allocation requirements to userspace.

E.g. even if you allocate from DMA-Heaps userspace can currently only 
guess if normal, CMA or even device specific memory is needed.

3. We seem to lack some essential parts of those restrictions in the 
documentation.

>>>> So if a device driver uses cached system memory on an architecture which
>>>> devices which can't access it the right approach is clearly to reject
>>>> the access.
>>> I'd like to accent the fact that "requires cache maintenance" != "can't access".
>> Well that depends. As said above the exporter exports the buffer as it
>> was allocated.
>>
>> If that means the the exporter provides a piece of memory which requires
>> CPU cache snooping to access correctly then the best thing we can do is
>> to prevent an importer which can't do this from attaching.
> Could you elaborate more about this case? Does it exist in practice?
> Do I assume correctly that it's about sharing a buffer between one DMA
> engine that is cache-coherent and another that is non-coherent, where
> the first one ends up having its accesses always go through some kind
> of a cache (CPU cache, L2/L3/... cache, etc.)?

Yes, exactly that. What happens in this particular use case is that one 
device driver wrote to it's internal buffer with the CPU (so some cache 
lines where dirty) and then a device which couldn't deal with that tried 
to access it.

We could say that all device drivers must always look at the coherency 
of the devices which want to access their buffers. But that would 
horrible complicate things for maintaining the drivers because then 
drivers would need to take into account requirements from other drivers 
while allocating their internal buffers.

That's essentially the reason why we have DMA-buf heaps. Those heaps 
expose system memory buffers with certain properties (size, CMA, DMA bit 
restrictions etc...) and also implement the callback functions for CPU 
cache maintenance.

>> We do have the system and CMA dma-buf heap for cases where a device
>> driver which wants to access the buffer with caches enabled. So this is
>> not a limitation in functionality, it's just a matter of correctly using it.
>>
> V4L2 also has the ability to allocate buffers and map them with caches enabled.

Yeah, when that's a requirement for the V4L2 device it also makes 
perfect sense.

It's just that we shouldn't force any specific allocation behavior on a 
device driver because of the requirements of a different device.

Giving an example a V4L2 device shouldn't be forced to use 
videobuf2-dma-contig because some other device needs CMA. Instead we 
should use the common DMA-buf heaps which implement this as neutral 
supplier of system memory buffers.

>> The problem is that in this particular case the exporter provides the
>> buffer as is, e.g. with dirty CPU caches. And the importer can't deal
>> with that.
> Why does the exporter leave the buffer with dirty CPU caches?

Because exporters always export the buffers as they would use it. And in 
this case that means writing with the CPU to it.

>> Either reverting the roles of the importer or exporter or switching over
>> to the common DMA-heaps implementation for the buffer would solve that.
>>
>>>> It's the job of the higher level to prepare the buffer a device work
>>>> with, not the one of the lower level.
>>> What are higher and lower levels here?
>> The MM as higher level and the DMA mapping framework as lower level.
>>
> Hmm, I generally consider the DMA mapping framework a part of MM,
> especially its allocation capabilities. It heavily relies on low level
> MM primitives internally and exposes another set of low level
> primitives that is more useful for device drivers. At least it should
> be seen this way, but I agree that it currently includes things that
> shouldn't necessarily be there, like the transparent bouncing.

Exactly that, yes! Good to hear that more people think that way.

Christoph made some comments which sounded like he agreed to some of the 
points as well, but nobody ever said it so clearly.

>>> As per the existing design of the DMA mapping framework, the framework
>>> handles the system DMA architecture details and DMA master drivers
>>> take care of invoking the right DMA mapping operations around the DMA
>>> accesses. This makes sense to me, as DMA master drivers have no idea
>>> about the specific SoCs or buses they're plugged into, while the DMA
>>> mapping framework has no idea when the DMA accesses are taking place.
>> Yeah and exactly that's a bit problematic. In an ideal world device
>> drivers wouldn't see memory they can't access in the first place.
>>
>> For example what we currently do is the following:
>> 1. get_user_pages() grabs a reference to the pages we want to DMA to/from.
>> 2. DMA mapping framework is called by the driver to create an sg-table.
>> 3. The DMA mapping framework sees that this won't work and inserts
>> bounce buffers.
>> 4. The driver does the DMA to the bounce buffers instead.
>> 5. The DMA mapping framework copies the data to the real location.
>>
>> This is highly problematic since it removes the control of what happens
>> here. E.g. drivers can't prevent using bounce buffers when they need
>> coherent access for DMA-buf for example.
>>
>> What we should have instead is that bounce buffers are applied at a
>> higher level, for example by get_user_pages() or more general in the MM.
>>
> I tend to agree with you on this, but I see a lot of challenges that
> would need to be solved if we want to make it otherwise. The whole
> reason for transparent bouncing came from the fact that many existing
> subsystems didn't really care about the needs of the underlying
> hardware, e.g. block or network subsystems would just pass random
> pages to the drivers. I think the idea of DMA mapping handling this
> internally was to avoid implementing the bouncing here and there in
> each block or network driver that needs it. (Arguably, an optional
> helper could be provided instead for use in those subsystems...)

Yes, totally agree. The problem is really that we moved bunch of MM and 
DMA functions in one API.

The bounce buffers are something we should really have in a separate 
component.

Then the functionality of allocating system memory for a specific device 
or devices should be something provided by the MM.

And finally making this memory or any other CPU address accessible to a 
device (IOMMU programming etc..) should then be part of an DMA API.

>>>> In other words in a proper design the higher level would prepare the
>>>> memory in a way the device driver can work with it, not the other way
>>>> around.
>>>>
>>>> When a device driver gets memory it can't work with the correct response
>>>> is to throw an error and bubble that up into a layer where it can be
>>>> handled gracefully.
>>>>
>>>> For example instead of using bounce buffers under the hood the DMA layer
>>>> the MM should make sure that when you call read() with O_DIRECT that the
>>>> pages in question are accessible by the device.
>>>>
>>> I tend to agree with you if it's about a costly software "emulation"
>>> like bounce buffers, but cache maintenance is a hardware feature
>>> existing there by default and it's often much cheaper to operate on
>>> cached memory and synchronize the caches rather than have everything
>>> in uncached (or write-combined) memory.
>> Well that we should have proper cache maintenance is really not the
>> question. The question is where to do that?
>>
>> E.g. in the DMA-mapping framework which as far as I can see should only
>> take care of translating addresses.
> The DMA mapping framework is actually a DMA allocation and mapping
> framework. Generic memory allocation primitives (like alloc_pages(),
> kmalloc()) shouldn't be used for buffers that are expected to be
> passed to DMA engines - there exist DMA-aware replacements, like
> dma_alloc_pages(), dma_alloc_coherent(), dma_alloc_noncontiguous(),
> etc.
>
>> Or the higher level (get_user_pages() is just one example of that) which
>> says ok device X wants to access memory Y I need to make sure that
>> caches are flushed/invalidated.
> Okay, so here comes the userptr case, which I really feel like is just
> doomed at the very start, because it does nothing to accommodate
> hardware needs at allocation time and then just expects some magic to
> happen to make it possible for the hardware to make use of the buffer.
>
> That said, it should be still possible to handle that pretty well for
> hardware that allows it, i.e. without much memory access constraints.
> What would be still missing if we just use the existing gup() +
> dma_map() + dma_sync() sequence?

Error or rather fallback handling and *not* transparently inserting 
bounce buffers.

The whole implicit bounce buffers concept falls apart as soon as you 
don't have a stream access any more.

>>>>> It's a use-case that is working fine today with many devices (e.g. network
>>>>> adapters) in the ARM world, exactly because the architecture specific
>>>>> implementation of the DMA API inserts the cache maintenance operations
>>>>> on buffer ownership transfer.
>>>> Yeah, I'm perfectly aware of that. The problem is that exactly that
>>>> design totally breaks GPUs on Xen DOM0 for example.
>>>>
>>>> And Xen is just one example, I can certainly say from experience that
>>>> this design was a really really bad idea because it favors just one use
>>>> case while making other use cases practically impossible if not really
>>>> hard to implement.
>>> Sorry, I haven't worked with Xen. Could you elaborate what's the
>>> problem that this introduces for it?
>> That's a bit longer topic. The AMD XEN devs are already working on this
>> as far as I know. I can ping internally how far they got with sending
>> the patches out to avoid this problem.
> Hmm, I see. It might be a good data point to understand in which
> direction we should be going, but I guess we can wait until they send
> some patches.

There was just recently a longer thread on the amd-gfx mailing list 
about that. I think looking in there as well might be beneficial.

Regards,
Christian.

>
> Best regards,
> Tomasz

