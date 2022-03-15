Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8322B4D9538
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E75B10E4CB;
	Tue, 15 Mar 2022 07:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2041.outbound.protection.outlook.com [40.107.212.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BE210E4BD;
 Tue, 15 Mar 2022 07:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Asvcp8ByI5gS244W471FRYBhnWWBihsfrRFskrb319sYIZ18F9mNIrcmcdKUqW7qbrFHDbiXzSrqfIXuSOP1K8dZ9ObSIrTYHap6qu98kO1Ir+65/J84QfpmlI6jUfgKBmrA6dMYxSGDHK7yk2tVAiVk0rZCZZMuWS6wbcPOwklKFBbUBl15rLbRBoTjkEQI9v+uanNt1lh9bmZJuYX/H0SZSGAa3qOQ3ohgmJHLTUGYf7iMXVWY0zjJtFhZqhSykRJsAgASSoXiqqjsoOgZE8BbMz11S2kA3JudWojpi0A48taSOpIJs+z+dpSrQPUkkBHQyyxD3Dw1H0zZ9RS/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Be4CUsKMe+RTq+W9jaPku0tf5ePX4dRRglnr+pFIUUA=;
 b=aQJJsQECRL+AXonth9Q5fnkRu26LEzWF5geqVRgF06bGQu+DQeF8OMb6DZ6CQjlkUu1VeoJg2nz0u39PAgVCLIwxhmUr9vZSdQXuqdZ3ppWlXhHwMElD5Vgdo/HxxS2RZ8zWOtmfafq68MFbTi6b4XYIOc8l+tr9bm1+C5v3AVaqYwe2Havb/dds34VECJjZFKHNH0NydxF6UnKZh/3uciWLk6anYJ7fch1dCj+KoOUJgv962EahYrVgaTyplWPtr8RNOKLD7cLnN0v1oI1cU15uTQpsZpWNl3/9L1VX2qroGm6dhVXMYgj6LcJCLqMWUmhruTPyyhc9kCT41OnMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Be4CUsKMe+RTq+W9jaPku0tf5ePX4dRRglnr+pFIUUA=;
 b=xOk04tTS3Ej3q+9aDjdAewu8x1mrR0/5I1ij55SOvlOBrvpoxkLn8CiB+D3MnCI4Jcm/pWMSPJBYEevwaaE5OQJsHqg/oYsOAFNeV6V+tfMUZZPzxsPpESvK+OYvKuWiexoLBEjsq2R9ge0w5t37ezhEW5owc+niIOBVT5W9gho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB5526.namprd12.prod.outlook.com (2603:10b6:a03:1d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 07:25:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 07:25:54 +0000
Message-ID: <b1322693-cd75-030e-9be8-992bd889cac7@amd.com>
Date: Tue, 15 Mar 2022 08:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <CAPM=9tybizHtKQBHmur8Lh7+pu5CiswZtgcY6SW04y=g0a=YJQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tybizHtKQBHmur8Lh7+pu5CiswZtgcY6SW04y=g0a=YJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:206:14::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f4bb0c5-78a8-49b2-8945-08da06550a9a
X-MS-TrafficTypeDiagnostic: BY5PR12MB5526:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB552684E178041E22B5C6AEC283109@BY5PR12MB5526.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flGX5l8CqBZrKgOqBnr4KwpjFOhsFg29ZYk3acfXYDOSqEqO6f9w4++3yzczeUc6SX5rlj6uqu2Dmlh3f647lBAXeBF/LgSQvVMHdqtNBN79rYPg/5tYdEWtLl8xM8U7yaguyc4ew66plv04q3zsgslW9XDeEQVW5PSmFPTWWSXl/VWK7PWtSJ67AXg30X/0ak0XETYd5RhgjDfOCc4M9AdlJ222z25TmVrsAlOKeZ9nI6uoA0XhfJfwNXlp/yfgoQL7Mxgo0xkJaFAD1pDL136LUG41+I6U+arYjRjFTwjztG+3GceEvXD1LgBShadymUE/bR8igtI2BLtmDWD881qnKP+bbZd0ObqlFXDvhQC91T4qTOYDPiif9Dqld1fywYF017dzlttOs68VXadnol8aFvLjst3m9fBkykFN2a8BXzdKBxRQCY8iR4Oss52xdieEE7afv+aIGcZWp+lfLwLRgB2lkwob9imrfhL5/COfEiW4ZK+vCgCDhqWq7Hj4iR8UA7wGw2OEMAFsYdCedKGI0cLRYIM2LSM5dspJg5O3kGgEnERZwDRM5BpjDi3UJml9psOXiHzq07951ejJ9cMR1GsiXigdlh+xW1Ctfn0b1XHMJqMfc03CXS0m49NsxWU9GjwsdVE884GDzfhw4wPvjc+feKbZj3LEXC2z5JbR0ZtNrW1P00Bk1OMkUZh1VR9hymdjG8rAqJcoqIGrJxiZe3U9ciBtg6HDX+OE7z6NvY7iOYoa3n+vv32kZkx+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(6666004)(6506007)(6486002)(66476007)(8676002)(4326008)(186003)(31686004)(26005)(54906003)(508600001)(110136005)(36756003)(7416002)(8936002)(5660300002)(66556008)(66946007)(83380400001)(316002)(2906002)(38100700002)(2616005)(6512007)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmF4TVdTZkFodW5td1JjMXdEMVYzQ0dZeVQ2NkM0SVV6VmZYUGUyZC95Nm1E?=
 =?utf-8?B?ayt5VUlTTHBqYkRsTUtselN5UGg4OEowMGRSSjRmeE9YVWZqWGVnc1VyNVFW?=
 =?utf-8?B?WEhuLzFXVmpUNmtiazhDRHRhS3pPR1lGVklDeEgweVRMdFRkcTYrTFhBb0Rn?=
 =?utf-8?B?cXhFdHAvWWpvdWN4dEM5RE1IK3Y2Sk5KUmN2Rkw1WVpDNGErY2F3R01QUW1S?=
 =?utf-8?B?T09uS0J0QmFUNllUREgwcXJaYVpJUlc3bzdxd2tTL2pkcUM1VXgzNlVrd1JF?=
 =?utf-8?B?RlkvWXZUUnhiVE1oNkhwcld4dzIwSXNCdEMzK0FVcUpxckhMWUNuL1FBdEM0?=
 =?utf-8?B?WjZ2QWN3amw2Rm5oUEI1ZHVQcHlMR0VZUG9ZSWlTNEpJWkxHWUJhQmpBSWFD?=
 =?utf-8?B?N1ptVnp4YXoyUDhBNnJuWmNRTUJEL2Y1am56M2lOTGNJK0xrKzVwcnlMc1FR?=
 =?utf-8?B?R3M1T0NKc3Z6Z3VjOUpoRitlelBXQ01SNzhFNXJhY2tvdmd5UTBUeHl1ZHYw?=
 =?utf-8?B?cmpqTURVMFZ1ZEl6L0I4MTk4NUpLOEswdUhJVlhBM3B2dXVCNTN1V1ljZzFI?=
 =?utf-8?B?Rng0SkM0WWRwVnExSTVVTXZYUWMyanZoWDRjSW9rVTNNUE1tQ04zeWQ4cWN4?=
 =?utf-8?B?VVA4VE5XTjU1Y0tHNHJMdGZDbWJLV1E4MVZrYkNCalpJMjB0WnI1dWpESFVh?=
 =?utf-8?B?cHptazNtTXZHRHhKdGpsVldFSFd6dHF0UFNJZ3Z0cWxWQjlRQy9BS21VL2tK?=
 =?utf-8?B?SDlWYm9BUUs4djNiNS8rMGh2WTBIb244RldVbEpXT0ZCTWh0cTY5MWZ1dXVM?=
 =?utf-8?B?WjhvTjVDV1BxUCtFL2NFQStlaVZNZlN5QUNEaDAxY3ZrRE54b2ZMSm1JVHZx?=
 =?utf-8?B?YWg5OTdvSzJTMjQrcVdDS0xsU1ozT0Z2dWhmWmZYb1ZpZ2NvakFKKy8rVVVH?=
 =?utf-8?B?Q0xhaDNQWUp0bHZuUWpNcFlPS3gvQmJqZ0RHRHdrdFlJTmpyeGc2UE1WR2JQ?=
 =?utf-8?B?S1lQMHB1UmtMQS9waWhHTXdTSGRjRG5ZYU53QW5POUZWVk8zbzlKaHJIa25R?=
 =?utf-8?B?WHl2eWRacnljb3hvVjRyYUFHdkdTWmFLTkxyNVJNS0FxeEgybzh4eldXRjZn?=
 =?utf-8?B?eUhFNHVXVTBUaUxoekhSREs2YzU2QmdOM3ZINlJrRU95ZG9SM3RuVTMrRTQx?=
 =?utf-8?B?VXhyQzh2RHhrUDllNjBnK01DcHhqdnFzN2lxRjg4aEJrem9lY01XanZYVmQ2?=
 =?utf-8?B?dXlIWmZ1cWYySlVyS0YxUEN4TDZZZmF4NkZqTVJvMTlKMDVkdFBORVQrYllD?=
 =?utf-8?B?bnFhQWRKZ0xiU09HdllzL0hqcWNjTkdWbGF3K2J0SWFaVTFJblNvWXlDbFdv?=
 =?utf-8?B?SVdheWw0WC9CZXpzdENiczRzWVNmTlVmYXgvd3JZYytUR0ZYcUFLUzFNKzY1?=
 =?utf-8?B?SjkvQlFtQ2VJRS9od0VYNG1uM0h0Y21iVFhPTmRkanhPTEt2KzRpTWE0eTly?=
 =?utf-8?B?T1F2K1BRUEg2UWRCS3czZFoyKzdDQWxYSHA0UWh6VEQ3SFNJd1lkclVkaTdH?=
 =?utf-8?B?UEp6WVNCTjhSam52THB4dFJhRi9mNTJQZEpvYzhJR3BjMHIwdE1aWTQyRjNR?=
 =?utf-8?B?Y051eURRTnJCb3IwZ0V3L2pEU1Rkb3hoSEpkR29USG1NcGFVQnJoNS94ZDV5?=
 =?utf-8?B?K0dzenFoczI0L0x4YldhQk9LRkw5VzMrRThzRVpSUmt1T1BBd25QRlk1Q3pF?=
 =?utf-8?B?bFBXQ1ZRdVBsVUpnU0YyWEk4cDdnLzBYeU4rVW5hOFZDb004SzQ3VXYwZENv?=
 =?utf-8?B?WkpUemE2TXA5RW9sc1JDYWNFOVdqY3FiVisyQWovS1BzdE9UZC9mdVJFN2lu?=
 =?utf-8?B?QlBJU3UySnpOWUJFZDZ0MVdlbHRWTzByWkdNcWFvOHBqc3V5RFdMYWJSWUV3?=
 =?utf-8?Q?7Wev8AZ48TAO+hiF+e+w+l5VpRo0J/we?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4bb0c5-78a8-49b2-8945-08da06550a9a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 07:25:54.8264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tqgiI+BR11Fd65wwPjxIiMCgyzPVxhzuai0GqITF1n9Cs2tBc7Hin6MU+ePXR4S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5526
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.03.22 um 08:13 schrieb Dave Airlie:
> On Tue, 15 Mar 2022 at 00:23, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>> On Thu, 10 Mar 2022 11:56:41 -0800
>>> Rob Clark <robdclark@gmail.com> wrote:
>>>
>>>> For something like just notifying a compositor that a gpu crash
>>>> happened, perhaps drm_event is more suitable.  See
>>>> virtio_gpu_fence_event_create() for an example of adding new event
>>>> types.  Although maybe you want it to be an event which is not device
>>>> specific.  This isn't so much of a debugging use-case as simply
>>>> notification.
>>> Hi,
>>>
>>> for this particular use case, are we now talking about the display
>>> device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?
>>>
>>> If the former, I wasn't aware that display device crashes are a thing.
>>> How should a userspace display server react to those?
>>>
>>> If the latter, don't we have EGL extensions or Vulkan API already to
>>> deliver that?
>>>
>>> The above would be about device crashes that directly affect the
>>> display server. Is that the use case in mind here, or is it instead
>>> about notifying the display server that some application has caused a
>>> driver/hardware crash? If the latter, how should a display server react
>>> to that? Disconnect the application?
>>>
>>> Shashank, what is the actual use case you are developing this for?
>>>
>>> I've read all the emails here so far, and I don't recall seeing it
>>> explained.
>>>
>> The idea is that a support daemon or compositor would listen for GPU
>> reset notifications and do something useful with them (kill the guilty
>> app, restart the desktop environment, etc.).  Today when the GPU
>> resets, most applications just continue assuming nothing is wrong,
>> meanwhile the GPU has stopped accepting work until the apps re-init
>> their context so all of their command submissions just get rejected.
> Just one thing comes to mind reading this, racy PID reuse.
>
> process 1234 does something bad to GPU.
> process 1234 dies in parallel to sysfs notification being sent.
> other process 1234 reuses the pid
> new process 1234 gets destroyed by receiver of sysfs notification.

That's a well known problem inherit to the uses of PIDs.

IIRC because of this the kernel only reuses PIDs when 
/proc/sys/kernel/pid_max is reached and then wraps around.

Regards,
Christian.

>
> Dave.

