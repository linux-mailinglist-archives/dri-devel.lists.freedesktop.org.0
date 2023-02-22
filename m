Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D794F69F2AB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 11:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0358110E1CA;
	Wed, 22 Feb 2023 10:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A54710E95F;
 Wed, 22 Feb 2023 10:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n02WvV+5Rs/VhV/P+Z9n8RCpCFwGRWvKqvUv1FYEBvVIFpXch0yHXTygUq6oU1UMrpPEh6XQ7Im/+3XzLSsPageK4PxjjiRTid5Uu5lTzc2P7NqvkzJz/DQVPso4pZMWUu881HtZA9hpTbOSAieEeN0HbJAvnm9n5P3zFBwRKBPjNPX2GF4xRCOhsaosfvJtcGJxaCtj1+O8oOXJkdecLyCDxjnYQNTcwWREygwzQPZeFcShO3lq+Vjx6sqKWz4cj6YAvuARiEfQ/6V42ZqcdQz9zg5vD87pyZuw3uI5EQpMfn1IThPqMKIiJoRMAc2n8v+OeW5jpMRZ9j118T+SbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8IlzZW2eCqQVMbpjg88fLluzaKQls9HWkgwQOmqzv0=;
 b=MrpbhALPbrivflP9K7VjiZPCPK9Zi8+5VLFCwTd/M2Ja3wBOeQsrgJo2uI3UemXIa0TP1h8ZmdN5BnfHnE/Y+6fu2/1tLMoDmGLkkWPwWjcxF2EeCAxMFIuV1yEAKmrPXluf4HeqHPBtmwVFQv7LR6WHUg7afS8xZkF7nV9ri168uZ2TP86ATwViJFVNkcGN+8b3QmgGQvb7Bczm8gfkt0GVAvTHAcZQl82IbLRjbLLiX6TREyzRcrZtSY5Qgy8B4cdURQAXJ2p42fgaxG8MNuRUr3/meIvLe5wS6vUx/w4YvEVyqd71AGTOZDXJxS9Ik9D7jqahwQ5o5FJDvXHRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8IlzZW2eCqQVMbpjg88fLluzaKQls9HWkgwQOmqzv0=;
 b=5DGbZ62b1RfkKo6ybIeiELCL8XFSdgDVkLVla7YDCRvT7uKUGbwX4FUkvFZ7q0O72hrMTX1Y32JsPcnYVcBr9ekKEmJmOOGH0VicT4R5/rMScsc/kMLTkEHtBDya/aDpyz86XcBcX3KOXdwM6MzqnbI74LbrAtoYukQrw/k1/KI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Wed, 22 Feb
 2023 10:26:40 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:26:40 +0000
Message-ID: <0e781fd6-5188-35c6-6cdb-09ce8c0035dd@amd.com>
Date: Wed, 22 Feb 2023 05:26:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-CA
To: Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
In-Reply-To: <20230222114900.1b6baf95@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dc5304-f6d7-4154-b13c-08db14bf48f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+/P0x8M6UCE55B71e5uA5UqWayD13TSOs5Z+YCmXQbn40DMEA4Y6dxtTV9Sh92g3KTeurMCOvydLbkoJ5B9DcN+PC66B2DoPWWDo//hHMp8D/XSj2mMrWvFz0EntbS9N/QbZFDinTxkzDdR+LKt7cI4VxQbrPD6kYK8cWCOl+u/O0lW69/W8xKLRBKAXLgO3AkM6AmYhBjNemjh1YFjiIF6n7/rclD7nA6evCac8XCOx2IS/HSaDr5zVll3+aORw1zZFPYD9IYHdYSy7Fd5H5P40DkWK4oPAC/bBCEqIBDLF+gXck3zZOPd2HNMpvawsPqXIe4KUb1rak2HTWyl5uYAypZwsQuGcLI2rnSbuHo3GG5pxAlKvxWWkTaeUc3nB70Kn0prWVFldaTqmfZRfovts8R8CxY8+LvID6sjrMQ5GlQ0gujlYIXpw/vICU/0usCUYlkATb2huQegUgg44KgPSQUljApLq2DDzIPbyGq+YXMpDcStmOONGq6YYmV/AuETr7v7Rz9Hci9eMJjAqZarFvQg2I1ZR+Kzy6C6ej0Dji8mg9tJKWVpUgsmeMfe4DME6foQsyynZnTB0bN6ObTFwJlbL5ezSKWROa7XynGDGGX1joOId+dYvJa+2CvdUfvTmOrpz/DwgNkeWY5Ut6jQPvIaM/0rUUUN6GCBYaxrOqX7iOiU9/utQ1QDUQpnMkYu3J0AdwFxff691aQ8wS9amnvOoa7RGi23yHdhnFI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(66476007)(66556008)(31696002)(316002)(66946007)(53546011)(4326008)(41300700001)(8676002)(5660300002)(86362001)(2616005)(31686004)(83380400001)(6512007)(186003)(55236004)(26005)(6506007)(6666004)(6486002)(54906003)(110136005)(36756003)(2906002)(478600001)(38100700002)(8936002)(7416002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUp5WlNMaTNNTmVIUTE4Z3BVY1Q3RUljaW43cEk0aW5CWE8vdG03NjdnZ3NH?=
 =?utf-8?B?Tk1RcmtYNVQ1SlJWRkVDYVk2VklnL21mSmxnUFdUNE1nSCt4b1V2TFJiQWY0?=
 =?utf-8?B?bVZoU3ZVcHZNaUh4LzBFZURhYUtFdzdRN04zRi94ejUvNTVsQ1U3RW5lTHpz?=
 =?utf-8?B?WEgxQkFmbUt1N1JzcU95Tm9xRjBWY1hCOWc0YTR6NlZJR1FwQnBBRXZuZjdv?=
 =?utf-8?B?QWpFM1ZUdWFnd25nNUM3dUNmUzZYOEZtZ2hZTWYvQ2UxRlduci9RRGNhTTRq?=
 =?utf-8?B?b3RNZEY0MVBHUFhFQ0pMWGhaZXM2dW1MblRqbFc2RGh2dVR3SFNtOXJhQXdP?=
 =?utf-8?B?SjEvL0l0ZE5LVTBRUVU3eURFNTgzREtoR0xIM1BlNUk1M0NPRXl1RmpYTU1n?=
 =?utf-8?B?NjJUMFUxaXZ2MVBkc29EbHFxTFBiejJvZ2ZLMkZKZWp6Wjl0M3E3VHdzNlVP?=
 =?utf-8?B?c3kwbVZMR0RtZmRGc000V05UaG9iZjllYnoremdXQ1BvN3pETC9zZGZEeXVl?=
 =?utf-8?B?eXBSbFhleXpZbXNXektiakx0QmU5UHhCbkRLTDJ6WU1jNTM1aEF3eVh6NHY4?=
 =?utf-8?B?L3g4SkM0VmpDZGxJd1VqZlB0WXpoTFd6cmRTVHgydzY4cG5GTnp2blhJeUd0?=
 =?utf-8?B?dWlvcUNvSEpjcWtaa3hWV2gxMGo2M2pPS3R0SUtCVnB3dzIzMENVdytlOHUx?=
 =?utf-8?B?Qi9mc3h0M0EzdjlObk9iR3lOS2hBZFZyRjB3L09xN2xBY3FRRWRENXFjVVJr?=
 =?utf-8?B?elRrWDJTanJFdk9HeWtVeXI0TGFzZk1TS2Q4cTBVNG0xZTVpT004MFVIZ1Fu?=
 =?utf-8?B?REhDQ0k5MmlHc0hERFV4UVRHRnZodXFiMjBkd3BDbzBJeHFwM0M2bkh4TkNO?=
 =?utf-8?B?MUJyZnN1SWRiNGdSd21uZm5iVVdTdjhMcEo1USt0clVrOFRjSm5ISVZYVUpj?=
 =?utf-8?B?SlMrYnpES0hRUC9Fd0xDemlvK1lYMk5weTNIOE1KZFFSbU0rb2Urb0UrSVVs?=
 =?utf-8?B?ckJmdG5jaytPSjFDdFFJYW1DL2NZcWR3V3oxRytGRThYTmJuNUhLdXY5NHYr?=
 =?utf-8?B?ZXVjRkFuVERsU3RGRkFaU1Y0WEc1YzFHNytnNGFlaUhOMlNQMVNrZEZOVVF4?=
 =?utf-8?B?VnpZbEpqODArK0FHMlVRLzduS01FVzNwODRTVFBKU1UzRlJGaTFGWFBueVdn?=
 =?utf-8?B?N1hQMmhpZTRJamk1UENnNmRJK1NHWXBkZWJCV2ZCQjcyVXN6dDN1Y2dsWW81?=
 =?utf-8?B?MTlWSDE1UEFWOGZzSWhZNEJnUzdkZzN0ZmphTHRrZS9EMEtOTHRJUGVDMW8z?=
 =?utf-8?B?NUU5bHpHejRiNEtGUVl5VEl6dmdBcXlzL3pLV1dIYm1mY1JKbTc5KzltcWdU?=
 =?utf-8?B?Q1ZVYkxML3Jwb2J2NGdSREVRNjZyMGNPM0hvTC9oWHg0dFZBd1lpQVlJaWdq?=
 =?utf-8?B?WDErRTFiUHJma2FTZ3hxalhhT3FDcXo3czU0c0oxaVdQUzBnYW11L1BEZERw?=
 =?utf-8?B?SnV5MmpaazI5WUhNSVg0UFMyV1RHdzNUeWJnTVV3akFpalNwQWxlWnFWVlhn?=
 =?utf-8?B?YzZ4MU1nRGNqMXZYZ0NOM2NNTjk2Q0hPclc5QUZSR0gvZ0ZGeUlQTW5FdlJC?=
 =?utf-8?B?YjZtRG1Id21ialppSE8zelBVNTlBa2J3U1UzbTNKaDd2b0xKOUNXVnRLQVI4?=
 =?utf-8?B?Nm40Y01uWjVKTmpoOXBHTVFnR2J6M3NweVlOcGtPalJDNzJrVEpwY1p1ZlRH?=
 =?utf-8?B?WkVySjF1cEhIYnBYSDJpZ0pBZGhJVmdMaUhCK3N5d0NyUGlueCtiWXprcjJ3?=
 =?utf-8?B?Ylo3VUVEcDFiSFVZLzJja1hxZk5rSHo3K0RJYVgwdEVSenhYeVFyekFMYlQz?=
 =?utf-8?B?bHJmMW50cVY2SllUcUtqNFBzM21ISm4zVzBsRmtCNXc5VnRObTNGNjJURWFT?=
 =?utf-8?B?N1diblZqZWVnV1Z3YW1PSHEra29UWVFKRU0rOUFzaGJLdFhOaE5mS2puSW5a?=
 =?utf-8?B?L2RwTXJ3V1Ryd3gwWHpnbE04aFhJVjc1NFNrNDkrUEcwVy9BN0V1U0tRb1Ur?=
 =?utf-8?B?RnZQdlBqWjNwVUZITVBBd2dqOVNiUXFLdy9GbC9xV3VXb0lobmtyMDgwRHNt?=
 =?utf-8?Q?ovZmXCTRDt6SmvYEyS8cxfV65?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc5304-f6d7-4154-b13c-08db14bf48f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:26:39.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqkvvL9Unu1qtP/BpC75XnGs2mqot8RGT06REukqBokpvgqOXTgi4tBexaT13OON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-22 04:49, Pekka Paalanen wrote:
> On Tue, 21 Feb 2023 09:53:56 -0800
> Rob Clark <robdclark@gmail.com> wrote:
> 
>> On Tue, Feb 21, 2023 at 8:48 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>
>>> On 2023-02-20 11:14, Rob Clark wrote:  
>>>> On Mon, Feb 20, 2023 at 12:53 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:  
>>>>>
>>>>> On Sat, 18 Feb 2023 13:15:49 -0800
>>>>> Rob Clark <robdclark@gmail.com> wrote:
>>>>>  
>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>
>>>>>> Allow userspace to use the EPOLLPRI/POLLPRI flag to indicate an urgent
>>>>>> wait (as opposed to a "housekeeping" wait to know when to cleanup after
>>>>>> some work has completed).  Usermode components of GPU driver stacks
>>>>>> often poll() on fence fd's to know when it is safe to do things like
>>>>>> free or reuse a buffer, but they can also poll() on a fence fd when
>>>>>> waiting to read back results from the GPU.  The EPOLLPRI/POLLPRI flag
>>>>>> lets the kernel differentiate these two cases.
>>>>>>
>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>  
>>>>>
>>>>> Hi,
>>>>>
>>>>> where would the UAPI documentation of this go?
>>>>> It seems to be missing.  
>>>>
>>>> Good question, I am not sure.  The poll() man page has a description,
>>>> but my usage doesn't fit that _exactly_ (but OTOH the description is a
>>>> bit vague).
>>>>  
>>>>> If a Wayland compositor is polling application fences to know which
>>>>> client buffer to use in its rendering, should the compositor poll with
>>>>> PRI or not? If a compositor polls with PRI, then all fences from all
>>>>> applications would always be PRI. Would that be harmful somehow or
>>>>> would it be beneficial?  
>>>>
>>>> I think a compositor would rather use the deadline ioctl and then poll
>>>> without PRI.  Otherwise you are giving an urgency signal to the fence
>>>> signaller which might not necessarily be needed.
>>>>
>>>> The places where I expect PRI to be useful is more in mesa (things
>>>> like glFinish(), readpix, and other similar sorts of blocking APIs)  
>>> Hi,
>>>
>>> Hmm, but then user-space could do the opposite, namely, submit work as usual--never
>>> using the SET_DEADLINE ioctl, and then at the end, poll using (E)POLLPRI. That seems
>>> like a possible usage pattern, unintended--maybe, but possible. Do we want to discourage
>>> this? Wouldn't SET_DEADLINE be enough? I mean, one can call SET_DEADLINE with the current
>>> time, and then wouldn't that be equivalent to (E)POLLPRI?  
>>
>> Yeah, (E)POLLPRI isn't strictly needed if we have SET_DEADLINE.  It is
>> slightly more convenient if you want an immediate deadline (single
>> syscall instead of two), but not strictly needed.  OTOH it piggy-backs
>> on existing UABI.
> 
> In that case, I would be conservative, and not add the POLLPRI
> semantics. An UAPI addition that is not strictly needed and somewhat
> unclear if it violates any design principles is best not done, until it
> is proven to be beneficial.

That is my sentiment as well. Moreover, on hard-realtime systems,
one would want to set the deadline at the outset and not at poll time.
-- 
Regards,
Luben

