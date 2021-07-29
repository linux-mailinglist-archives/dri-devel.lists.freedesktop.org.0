Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B55713D9FC6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70606ECF5;
	Thu, 29 Jul 2021 08:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496A76ECF5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODz9ibhulbCrKlHoDgrPmF0ob7ZS6jzNUXDtCg1b8CkQwU7Wrw4+xUqP6LUdTwoLaY0XMxrSTWBr7FyX4akJe4zd5Ac1wXA+YQUeBSA5zSd4/5uYbpYZjy54ldEujdts5m6ufho5SVo2bInS5RN9NIhWMjnckTLfCfRD69iw7M0tOkRvaVve7muVPqheuGsm16P0/q19W6duvDogUkAhQKv9pDsp9q3LUU08BbpiNT5B7+VqVMCfx7bq8NrWA4zT5j22W+EvfxD5fyrj0Y23W1+uLj4r4yHmDydi/0lIDG6mFFbg0moLqh0uJxgZhWqz5BIX/gaGpt8pktEuJAki0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN4jFALw7xgibT7SY6MP8qoVWR2GlybbLVfVTmZCRK0=;
 b=kBOhFm1N0H0kvy1q68XxiZlxLjBlciV1ERCoUvx79FCREL8XfkObmHYHLQT2l3Rgvf+2kq6HF8QS9nn0n1MT6yXdqk0WyuVeODnluCfra8cpOucAbVGYn2hw+A4zLdMR68nAARVemFhwKqUK/M7XL6S4YK/J7xTLB3IXLA4OHCq48gB+FoM0bGn5anJW9NlWuG5ZAIwQtQ99Ke04mXznZJXz+6Gb3doIe+fRquP8qbVrFD3lxepVDFLJau0KL4JxIll64sbYJH0hPhmyQeQtQCKwAj4WU9pcw9gT8LY+F2o4BuBqwSQNUcoGBNgq2aaU5CS3zTNkkIzyLLceomzehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN4jFALw7xgibT7SY6MP8qoVWR2GlybbLVfVTmZCRK0=;
 b=i26wraluJEygr7z7/XRnYxiAA3aVG8Jg5DgucD5tDsOCGyNnjQTuNpwcejdOhkg6zefhA4LMb5Ry02S5De89SluDg4mvG1HN+kLMkKd/0YD69r8DedFOIBwp9SEo5XefxtTBQ3gpuNcL7+Nn6tGCzM4mw8qtc17mW35HDUvZNvc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2888.namprd12.prod.outlook.com (2603:10b6:a03:137::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 08:43:31 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e%7]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 08:43:30 +0000
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
Date: Thu, 29 Jul 2021 10:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210729112358.237651ff@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::15) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4b10:6e80:f619:9837]
 (2a02:908:1252:fb60:4b10:6e80:f619:9837) by
 PR3P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23 via Frontend Transport; Thu, 29 Jul 2021 08:43:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc70b4c-ef44-4f79-69a1-08d9526cf0fa
X-MS-TrafficTypeDiagnostic: BYAPR12MB2888:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB288816D95FFE4B7E1C809F5883EB9@BYAPR12MB2888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9pe2bhXPaPVpAgkr7dlt7J1AQN9kHsZqmjwtQr3dskT+e1wYMsVQMoSXMhIH/qiOeBthdYBsJywWpTK0JgEFgwSgy/n9cuYN8voBE8tLMgm/rpKSZeHGATyvg2+c2xbUhOOmeSrc1yLa2pc8OC70NcfIrNeXn4C3g1YhkwUsooJxjQ2E+SOnKPLq/Mjqijm8vI7yTsLMBqZ4UqtbLvp5KDQFV9Eei83/GJqyPQFdyf75NC8c7r4FRKxjKHKW8b06poLN75hAYFlUuUDn6/mkBkKHsYv9T+m5wGTUnweIqcqbnWJRHbfNE/IaTvoVsw06OzbmiuKxmXrchuuf8r4wb1pJrCQCEv4GGniXmISGSk0WPP3MRCk8kjKQQoPePSKSOme4ThPRd++4ERIs4i4O94Vr4LURJ6CVWTyEtk21ipOLOSPgjg74qxceGzGpNPd8jAkPRIIzYv4l101a8E3uOBBaNkNfvLfP2zVGfqrC/Kj3r7Ep6QtPTj406UR6rRvd7iistqLpI3qA/ggRZOwETVbswMYadJAgyPDUVMzOGbDRdU5qnRQBRF0N/qVlRITvn81rYZ8lEHf8S5JNl1A0KWlLt1IQUmPNzkjhGTqT9QJkMh7uw8SNBrWATLDeFD1g5n+IJFOqXOBFxQrEbC4lBXL2HQl+Paffxm6vu+o8vTmcCbuqAB1HYVgeaYmkeM7B6A5QdIGGZXmvU0Uz+QimUUQDEGh+UdQjtOUEtcr3TX4H0aVI/2Xsadt0xWU364b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(54906003)(53546011)(8936002)(7416002)(86362001)(5660300002)(31696002)(8676002)(6916009)(83380400001)(66574015)(66946007)(316002)(38100700002)(6486002)(186003)(66476007)(36756003)(2616005)(66556008)(6666004)(31686004)(4326008)(478600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZ3ODR2SWJNbDg2YnBLOU1idkV4MlNxU2ovS0hjYkN1SkYzNDZnUGordUFu?=
 =?utf-8?B?YjdwaEg3WU1oR21rcXk4eDVHTjFkcUkzYUI3V01sU21XZ05tdU4xNlZVMGdw?=
 =?utf-8?B?MTlqdXh5K3NTVUp0QmJCWklQa083UzRtdHJMYXczNEZueHY3S3dHUHFTUVBN?=
 =?utf-8?B?ZGtBczlBR25YdWdsK2RuM3ZCYzEvU29KOXBqSG84c1BBTVJFemoxMTNjYUNQ?=
 =?utf-8?B?ekwyaDJVT2ZkSUZ4MGZMVkt6VHJ4K1lxZGc1bzZWQzN1VkowdkpCNUlhNWk0?=
 =?utf-8?B?Z25DK3o0Rjk2dS9MWHYwbWNBM0kxa1FIZUd0WFRDK0xnQjZPV24vZ0VYcDdt?=
 =?utf-8?B?RFdTbGdvdXdMNTNMNTdMUXd5TDdqK3o3eTZKYkdQTkMrdSttUE0rdjRoOFU1?=
 =?utf-8?B?MDVpQXM4OGN3dmIydzl4RWhWZitacU5Ea1JRaDJRQkRQWkI3VkozcmNXTE9C?=
 =?utf-8?B?UnpQOGpQbEl6eS9STndZZXN4WUhFeEZMR01uZGJhaHJqWGZSOUM2V3Z3aHNW?=
 =?utf-8?B?cm9wNjVWZkJuQ0hZVVlEQnMveFlQaTlLbStsSW02em9HSjlYaW81ZDNSeWZG?=
 =?utf-8?B?cHRCOVVzQlJoMkZndUJoYXlhZ2E2VUtDWk5OeGtVS3RwcTdmempQdmJqaTlO?=
 =?utf-8?B?Y3hURGVMYkdCUldqb2F1cTVNcFdneGM1UDFQV0x0TCtQK1BqVk4vRVkyQ1Zw?=
 =?utf-8?B?MC9RbTF3QjErSFVFOWV6OHVCZ01XNzNZT2hRbnUxUkdLWjl4K2xYbCtvaW8z?=
 =?utf-8?B?akxaUExHRHBKYnRwa05teS9Ud0RMTUd0dHhvd3FQLzV4YVEzZ1B6SE9vb2RD?=
 =?utf-8?B?enBDT1VaZU5EelRpcjlveW1lb2dpbVl4SXpGdmVKaGhBeU5nZnBJU2ZnUFph?=
 =?utf-8?B?SDhvaE4xN0JGcjBSVWdYS0RreFczRUFXbVNnVXJZdGhqNFdLMVpsVVNzVG1S?=
 =?utf-8?B?cG4xTkxodC9SZzNjZ2FPUk5raXRKbklvN0cxUEtTZUZ4bWdNazlzQ1Z2eEtk?=
 =?utf-8?B?R0F1NVF1SGxzRlNBM2ZpVWJQNzg3Ry9pdC9VUzhiRlZCaTVvSUhwaWVkd011?=
 =?utf-8?B?T3JXcnc4L3gwY3RGY3VJNWVSM3RRcFMrNnNJRjBtUjdPdWxETDJrWWJaeGxh?=
 =?utf-8?B?ZmtOcEJMRHZ2WnhpUkZZVEhmQ1EwSitka3hMU1BocWZQNy80aWVzcFppUmty?=
 =?utf-8?B?c0h5bnFqM2VZcFlnSEtxYjdKOWRaVU04d3NHUXRLOHZuSzVCcFNEWTVvVkVQ?=
 =?utf-8?B?eVUzNTNSaHVDalEzM2NSMUlOZENtVllCbkZ5eTJMSXVWN2I2T2tFdUgxNjQz?=
 =?utf-8?B?V2VRRW5hRlpPcng2bi8zMHk2dDFmZm14c3hZSEFkUDNzUmlKbXhwQzRCdG4y?=
 =?utf-8?B?SkwrQkRmZXh2V0hZbDBGeG9yNUF5YnFFWWRremlFZjFNWGY3M081RmNkbC9u?=
 =?utf-8?B?SS8zR3lHam1XbXVHRHR0SVo1Zlc2UTkwbjJpa3hBVU5XR2w2K2Q3d2ZGZ3Zy?=
 =?utf-8?B?WTExZkdmY0ptZ3pFUEYzc0dMVDBSKzFqSlo4ZW1sUHUrTThZMGxpSnN5ZkN3?=
 =?utf-8?B?bXNhaFhKNTRVbUxkRGcrSmZkTEhzZ25qYUFzZUtUbnNjWHM3dHFJczhIb3dU?=
 =?utf-8?B?eHB4T25qQzc4OW1EbzRmZXIyWGw3bzRIVXQwZTBCNkFUK2RWazl0QXFNL3lw?=
 =?utf-8?B?NFY3SjkvenpLbnB5VTdvTkxqeVpMNDRJbUJEbXNRWlFSWk0rd21LUVl2Tkk1?=
 =?utf-8?B?L1hRNmY0M1dySk9ZazY4TktKMHVPQ2ZoZlE4TTV4a2M5dmdHQW1JdXhObE5Q?=
 =?utf-8?B?YWhVUStMeDhpWE1nT1dCQ0QxaVpMY3duNUgrd1U4N09maFFOT1Z4dUM0dTdo?=
 =?utf-8?Q?ve697MRONYXbI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc70b4c-ef44-4f79-69a1-08d9526cf0fa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 08:43:30.5922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJOwJyg2ELIru++ps3q8fMk9tJsn5PUNeEyxMicJFp6HG5TUAutdgLoNsSZB1zVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2888
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.07.21 um 10:23 schrieb Pekka Paalanen:
> On Wed, 28 Jul 2021 16:30:13 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 28.07.21 um 15:57 schrieb Pekka Paalanen:
>>> On Wed, 28 Jul 2021 15:31:41 +0200
>>> Christian König <christian.koenig@amd.com> wrote:
>>>   
>>>> Am 28.07.21 um 15:24 schrieb Michel Dänzer:
>>>>> On 2021-07-28 3:13 p.m., Christian König wrote:
>>>>>> Am 28.07.21 um 15:08 schrieb Michel Dänzer:
>>>>>>> On 2021-07-28 1:36 p.m., Christian König wrote:
>>>>>>>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
>>>>>>>>
>>>>>>>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
>>>>>>>>
>>>>>>>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
>>>>>>> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
>>>>>>>
>>>>>>> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
>>>>>> Well then let's extend the KMS API instead of hacking together workarounds in userspace.
>>>>> That's indeed a possible solution for the fullscreen / direct scanout case.
>>>>>
>>>>> Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.
>>>> Yeah, that's true as well.
>>>>
>>>> At least as long as nobody invents a mechanism to do this decision on
>>>> the GPU instead.
>>> That would mean putting the whole window manager into the GPU.
>> Not really. You only need to decide if you want to use the new backing
>> store or the old one based on if the new surface is ready or not.
> Except that a window content update in Wayland must be synchronised with
> all the possible and arbitrary other window system state changes, that
> will affect how and where other windows will get drawn *this frame*,
> how input events are routed, and more.
>
> But, if the window manager made sure that *only* window contents are
> about to change and *all* other state remains as it was, then it would
> be possible to let the GPU decide which frame it uses. As long as it
> also tells back which one it actually did, so that presentation
> feedback etc. can trigger the right Wayland events.
>
> Wayland has "atomic commits" to windows, and arbitrary protocol
> extensions can add arbitrary state to be tracked with it. A bit like KMS
> properties. Even atomic commits affecting multiple windows together are
> a thing, and they must be latched either all or none.
>
> So it's quite a lot of work to determine if one can allow the GPU to
> choose the buffer it will texture from, or not.

But how does it then help to wait on the CPU instead?

See what I'm proposing is to either render the next state of the window 
or compose from the old state (including all atomic properties).

E.g. what do you do if you timeout and can't have the new window content 
on time? What's the fallback here?

Regards,
Christian.

>
>
> Thanks,
> pq

