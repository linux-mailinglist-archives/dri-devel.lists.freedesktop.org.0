Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059843AADC7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 09:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696A6E883;
	Thu, 17 Jun 2021 07:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82096E029;
 Thu, 17 Jun 2021 07:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K07DwgWxvsuqzVE3y4xdUe1ijTFENWKzw+4WcVpCM35aXM6bHQGbXZcNE+TaZdnrWIPnKRH635qfGVx3+lA63axmVajKffhko3Hft9fL3BGXBipGgH57HmmUzvC2Cr/b41NnqbqXdiM3yM4hiruQpn6Hq/R/+dXH3/TnXlLTyjCWcPgyNbXAKrVOQjWmLOuv39ZCkh4nzlmLTW+1TODPPbj9MWPVM5vweBLNy4++jn8DyYzDOfYJl/sCko0k01mB2rNVRwf7I2StKZn9CSbZ8DOQdT3/NyVmPrJzS5HeCpSOWSqKOkegUISqSGaTWztjjuiVGm2yyQ7IUL+jytvkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA7JjHiZSgF5N3QHFzeTLhIDIYl5dnDUUdlLN05UAAQ=;
 b=ZOKsiS28FWa6yEeqlmERwKyI8mbIXkuRUzoe/xbhLm4CdTn22a7GjY7NZpV83aLg5LlXt0f86WD6SOql0onVQPaeDObozNxTg7h+7oBtLuqNdCh2Kvy/jqwmnSjNXiR4IBv7dHvJ7XisO9UAgjMN0yAeEL58z4wj/UgFBqfS4K6x3FngAgDAL1U3sthuglVNVWKhg1rw4j5t67kJdcYitknk6f7mqVB0SJLLy5NedC8YEy1nGYCUdCObsYxp/Zs3Xw1v0VS1ZG+QRkmMJeWR+VAOUg58ruf1e/F1hcrl7cv1NOhTTZG2R6hnwrTq3gOP4BWXgF0mO97Jq9kGNGKEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA7JjHiZSgF5N3QHFzeTLhIDIYl5dnDUUdlLN05UAAQ=;
 b=YxWAsWBd1he++Gl03kvIxV+aSq/eINnX1NDRvyTj83uGLUvcDvLIvomvjXCvQ6hMtz/H36cCnWzCqiKwl3aFRtW20bys2l6mgW8F24TRbXyws9wnza++C+zxcF4YKyyPKLTOz63mmV15dHDftvqH0TQXPn2CJ9amPB0f3faZrmw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2420.namprd12.prod.outlook.com (2603:10b6:207:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 07:37:43 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 07:37:42 +0000
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
Date: Thu, 17 Jun 2021 09:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9a20:5ac9:ee4d:c186]
X-ClientProxiedBy: AM0PR02CA0082.eurprd02.prod.outlook.com
 (2603:10a6:208:154::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9a20:5ac9:ee4d:c186]
 (2a02:908:1252:fb60:9a20:5ac9:ee4d:c186) by
 AM0PR02CA0082.eurprd02.prod.outlook.com (2603:10a6:208:154::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Thu, 17 Jun 2021 07:37:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc64a99d-b739-42a7-0bd1-08d93162ca9d
X-MS-TrafficTypeDiagnostic: BL0PR12MB2420:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2420E3819801B95F0B51BF98830E9@BL0PR12MB2420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7Aq/zkv0mOaTM5xpQWdbsfgIKLpgjmDB3jU+K2njZazcuJp7ZCViD/hRZuQwx+QRn8S9qmQwSA9eda2I6YB4vVc0uNI+OjU3sfstYsqmAkjxh6aa2xmTmjriDKL5Q8nJ0Smyv+Dfzol6F+ZtEaUaN0zmr3qG9qtqw2KBiBj5ldXlt3yae8obH2+vLxcFgrOPqLUgf/SOuKnINzPzH2jQHRgcMxnd30G+9ToomYTFab6gEuAmE1NoAGE+Ssamiqoqd6CUTgy+5VPzQ75T798Byyx0wFFTqH7CExqwShc940CGOfgl2Ny7ZjDoxoGuu9HrSmibIKnQViG5NBYa+2JnK06tlHYORXvvpvWzJo3GmrueRCFqYGsfoz7deBY2Nn5LR1rl8PLpx0qhpoXpX4w6+dEikGRGxPRUCNrqlXVNVjNpsvPHO3vphLp3xuzimfU1kL0lvDfrfbj+2HrAf+H6/SIHnb+SqTpsoLjayW5HvJ3MnGuETgeA6Cow9e/N7ZtPDAUakTw/lB2bHIUX7mUn9PLi86fDhGxYK0tcKbqZBAZRFJt7J0Op+WlL3f7FuUai6RJtYW129hf4SIoFT4JYmSPiRrZvbI+gCTUkXoj2s97QyKvHpmOSqMvb62L3kFSiiVDb0jFzaPSe3EnwJMDjfq2cpg8VYQ2JY/l8/NWlTymhil1pNPrmONW/lzwFZ5z0MM1tn+pDfZ664gcwqe5mmCSMg/cThncNB+egqpJtp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(110136005)(5660300002)(54906003)(316002)(66556008)(8676002)(8936002)(186003)(16526019)(2616005)(53546011)(66476007)(66946007)(86362001)(36756003)(966005)(38100700002)(66574015)(2906002)(6486002)(478600001)(45080400002)(31696002)(4326008)(31686004)(83380400001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXRrZ2JCL3Rpbys4S3p0ODB3ditJeU5Hc2k5Z3dDdmlpcWJaeWVZc1VlNkh6?=
 =?utf-8?B?T0xSdlN0dnZPcVZUUlowS3JpK1JwMXB4VXBDSy9KMHprY2I1dExIaUYybURq?=
 =?utf-8?B?R1R6Vlg0S0pjeTlvb2FGMnk2YnlvQnRjSU93MFhVQXF4RWhDck9GYXdacEpL?=
 =?utf-8?B?SFYySWlrbzFyYXkyQkRmQ1llMVJzYk9Ca21TRGJ1M1ZRL25DR3hzYzN2czJm?=
 =?utf-8?B?TTZVMlVFY1ZsWGpIWXhkVVFRVnpkMHMrQS9hWFpOek1BMk8rVm1JMGk2ZmFj?=
 =?utf-8?B?cmVCdDF6NUF0b2M0Zm5iSFU5cXhVOFZTaE5aTkJVdmpnclJVRjIzbm1NbDdL?=
 =?utf-8?B?dW5yNjdZeFZlTzEwVTVJYzdtWnpJamRQVEtIOU1LOTBPcmhGTEtZeERUVmh3?=
 =?utf-8?B?YU42NVdlZENOblZxYWNEcWtQYkxBUkQ2NlBjdE5mOWhYR1BQRUFIbFpWOTVy?=
 =?utf-8?B?WHBkUStkMEoyQ0FtaUF6aXkraFl0ZExTOVMyaVZLcmNmaFByQmtRckNGczcw?=
 =?utf-8?B?MzhPUmVwSmVjalZ2a0tCYzU1Wk5YdFc2R0ovRlRDK2xrdWdDZ0QvazdiNUdO?=
 =?utf-8?B?WnBteHQ0anBHZVYvc21DNnFvZ3YxSzFUbER2SmRqR1Z5VFpLQjd2YmV3eitv?=
 =?utf-8?B?b1NKcmVkdkQxQnY4ZUxtVGw2SDd5TTVPQTArSVVxZFRnbDVXZVhQaTlvLzdR?=
 =?utf-8?B?b3VzL0RYM1c5Sk0weC9QYTVxRHliYTZVUW5zenI5bzVnTnZyWGFmcHB0NU5D?=
 =?utf-8?B?WHIwbkYwclo1OXgwWGxEdkpDS3p6L2RMZE5FNlo4VDVUS2hyMUpzTXRSRDRM?=
 =?utf-8?B?OWRvdFBvVUtaZVg1RDJJZHdKVHhJRHhISHBUMGxTMWw5REdraHRpaEtSQ2U4?=
 =?utf-8?B?V0ZrTWo4bHFrc0psY1RUcGdoY01FYzlRNWFEc204ZUVpYUxQKzhKQzZZYXNM?=
 =?utf-8?B?Z2VTOHF2YkQ4a3BIcUZPRjBVUkFEdHhjYVRrSCtGN0tZYmVzK0ZEVnFiMDNI?=
 =?utf-8?B?SGw2c1VNbWtqcm5WcjRsUGFxZFl5MGdSSGo3dWpxVEUyTU9IVWIyL3JIYVdz?=
 =?utf-8?B?TERZZXg0T2ZzSkxpWmI3bGNwb3NPTGl4MFREcjh1RG1FVktmS0NNS1hHM0lp?=
 =?utf-8?B?UnBhbHA4VThRMGdJUWtrSEdPdU1jcWVFZGlQMW5iY0JaYzdIZlFZVjNObTJo?=
 =?utf-8?B?WGZydmQ1YUtVNXBWdDFUT0haRVEwckFnK2wxNXFJZFcrTzJ6cGY0RDNhWWdU?=
 =?utf-8?B?UHFtc1RkRDRLSUl3Qm1BM0kzQkhHaDNKTlVocTRTd1NmbldONjBZTGh4aHM5?=
 =?utf-8?B?UFlEcWZteFN5ZDdkYitEN2xrMGZocTZrTU1YMnZTVkt3T0RHRWZSc00xbm9i?=
 =?utf-8?B?WlV1QytUelR2OWRVSmdhS1BqcWFEN1lWcTdpUnBtamJYS0kycUFVSnk0NVR0?=
 =?utf-8?B?NHNiTlpTWGNHSkxjUFVERklrRms1RmJDWmxHT0wydUhmSUo3WU9IZ1JpeFpu?=
 =?utf-8?B?Mzg2YUpvMlEvckJYWkdPSmJuQkNrT3JzRWYrMFgxNUFxVWpUTTJQbG1uZENl?=
 =?utf-8?B?SDU3V3J5WkNoWDBxY3JXNlpTMUpta2hEZHJKalA3b0hYMUVvYWtqNEtDdi90?=
 =?utf-8?B?c05kUk01bE4wMm5ra3JaSnNxa2JxQ3Z4a3V4UDl0cERUcitXV2tKNENrc1RH?=
 =?utf-8?B?UnEwcjZoN2pkZlFpSWlNZFhZdEtaZGdiWjFSSGhTVEJHai9acmxJb1NFK0ZI?=
 =?utf-8?B?TkVBRUpPU0haejR4cmxqTk0rZGc1VUg3ZVhiNzIvVTZDUXNtTk40dGQrZ1Nm?=
 =?utf-8?B?Q2xDb1AzajJuUE1GOHQ4bHIxSUsxYzhkM0NjUGplNHhLTTJkcXErdDhLZTd5?=
 =?utf-8?Q?N1w+1C3kL2eDi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc64a99d-b739-42a7-0bd1-08d93162ca9d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 07:37:42.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQJyJAUYczc2v4GS6gDGV+CbGzplEmHT63S8JWqQObhbvoM58kj9RqXTUAqhCbNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2420
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.06.21 um 20:30 schrieb Jason Ekstrand:
> On Tue, Jun 15, 2021 at 3:41 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Jason & Daniel,
>>
>> maybe I should explain once more where the problem with this approach is
>> and why I think we need to get that fixed before we can do something
>> like this here.
>>
>> To summarize what this patch here does is that it copies the exclusive
>> fence and/or the shared fences into a sync_file. This alone is totally
>> unproblematic.
>>
>> The problem is what this implies. When you need to copy the exclusive
>> fence to a sync_file then this means that the driver is at some point
>> ignoring the exclusive fence on a buffer object.
> Not necessarily.  Part of the point of this is to allow for CPU waits
> on a past point in buffers timeline.  Today, we have poll() and
> GEM_WAIT both of which wait for the buffer to be idle from whatever
> GPU work is currently happening.  We want to wait on something in the
> past and ignore anything happening now.

Good point, yes that is indeed a valid use case.

> But, to the broader point, maybe?  I'm a little fuzzy on exactly where
> i915 inserts and/or depends on fences.
>
>> When you combine that with complex drivers which use TTM and buffer
>> moves underneath you can construct an information leak using this and
>> give userspace access to memory which is allocated to the driver, but
>> not yet initialized.
>>
>> This way you can leak things like page tables, passwords, kernel data
>> etc... in large amounts to userspace and is an absolutely no-go for
>> security.
> Ugh...  Unfortunately, I'm really out of my depth on the implications
> going on here but I think I see your point.
>
>> That's why I'm said we need to get this fixed before we upstream this
>> patch set here and especially the driver change which is using that.
> Well, i915 has had uAPI for a while to ignore fences.

Yeah, exactly that's illegal.

At least the kernel internal fences like moving or clearing a buffer 
object needs to be taken into account before a driver is allowed to 
access a buffer.

Otherwise we have an information leak worth a CVE and that is certainly 
not something we want.

> Those changes are years in the past.  If we have a real problem here (not sure on
> that yet), then we'll have to figure out how to fix it without nuking
> uAPI.

Well, that was the basic idea of attaching flags to the fences in the 
dma_resv object.

In other words you clearly denote when you have to wait for a fence 
before accessing a buffer or you cause a security issue.

Christian.

>
> --Jason
>
>
>> Regards,
>> Christian.
>>
>> Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
>>> Modern userspace APIs like Vulkan are built on an explicit
>>> synchronization model.  This doesn't always play nicely with the
>>> implicit synchronization used in the kernel and assumed by X11 and
>>> Wayland.  The client -> compositor half of the synchronization isn't too
>>> bad, at least on intel, because we can control whether or not i915
>>> synchronizes on the buffer and whether or not it's considered written.
>>>
>>> The harder part is the compositor -> client synchronization when we get
>>> the buffer back from the compositor.  We're required to be able to
>>> provide the client with a VkSemaphore and VkFence representing the point
>>> in time where the window system (compositor and/or display) finished
>>> using the buffer.  With current APIs, it's very hard to do this in such
>>> a way that we don't get confused by the Vulkan driver's access of the
>>> buffer.  In particular, once we tell the kernel that we're rendering to
>>> the buffer again, any CPU waits on the buffer or GPU dependencies will
>>> wait on some of the client rendering and not just the compositor.
>>>
>>> This new IOCTL solves this problem by allowing us to get a snapshot of
>>> the implicit synchronization state of a given dma-buf in the form of a
>>> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
>>> instead of CPU waiting directly, it encapsulates the wait operation, at
>>> the current moment in time, in a sync_file so we can check/wait on it
>>> later.  As long as the Vulkan driver does the sync_file export from the
>>> dma-buf before we re-introduce it for rendering, it will only contain
>>> fences from the compositor or display.  This allows to accurately turn
>>> it into a VkFence or VkSemaphore without any over- synchronization.
>>>
>>> This patch series actually contains two new ioctls.  There is the export
>>> one mentioned above as well as an RFC for an import ioctl which provides
>>> the other half.  The intention is to land the export ioctl since it seems
>>> like there's no real disagreement on that one.  The import ioctl, however,
>>> has a lot of debate around it so it's intended to be RFC-only for now.
>>>
>>> Mesa MR: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F4037&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb094e69c94814727939508d930f4ca94%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637594650220923783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=xUwaiuw8Qt3d37%2F6NYOHU3K%2FMFwsvg79rno9zTNodRs%3D&amp;reserved=0
>>> IGT tests: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90490%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb094e69c94814727939508d930f4ca94%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637594650220923783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wygYaeVg%2BXmfeEUC45lWH5GgNBukl0%2B%2FMpT5u9LKYDI%3D&amp;reserved=0
>>>
>>> v10 (Jason Ekstrand, Daniel Vetter):
>>>    - Add reviews/acks
>>>    - Add a patch to rename _rcu to _unlocked
>>>    - Split things better so import is clearly RFC status
>>>
>>> v11 (Daniel Vetter):
>>>    - Add more CCs to try and get maintainers
>>>    - Add a patch to document DMA_BUF_IOCTL_SYNC
>>>    - Generally better docs
>>>    - Use separate structs for import/export (easier to document)
>>>    - Fix an issue in the import patch
>>>
>>> v12 (Daniel Vetter):
>>>    - Better docs for DMA_BUF_IOCTL_SYNC
>>>
>>> v12 (Christian König):
>>>    - Drop the rename patch in favor of Christian's series
>>>    - Add a comment to the commit message for the dma-buf sync_file export
>>>      ioctl saying why we made it an ioctl on dma-buf
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Michel Dänzer <michel@daenzer.net>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> Cc: Daniel Stone <daniels@collabora.com>
>>> Cc: mesa-dev@lists.freedesktop.org
>>> Cc: wayland-devel@lists.freedesktop.org
>>> Test-with: 20210524205225.872316-1-jason@jlekstrand.net
>>>
>>> Christian König (1):
>>>     dma-buf: Add dma_fence_array_for_each (v2)
>>>
>>> Jason Ekstrand (5):
>>>     dma-buf: Add dma_resv_get_singleton (v6)
>>>     dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
>>>     dma-buf: Add an API for exporting sync files (v12)
>>>     RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
>>>     RFC: dma-buf: Add an API for importing sync files (v7)
>>>
>>>    Documentation/driver-api/dma-buf.rst |   8 ++
>>>    drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
>>>    drivers/dma-buf/dma-fence-array.c    |  27 +++++++
>>>    drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++++++++++++
>>>    include/linux/dma-fence-array.h      |  17 +++++
>>>    include/linux/dma-resv.h             |   2 +
>>>    include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
>>>    7 files changed, 369 insertions(+), 1 deletion(-)
>>>

