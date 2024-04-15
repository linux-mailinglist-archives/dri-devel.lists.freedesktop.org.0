Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8F8A4E33
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0AD10E11F;
	Mon, 15 Apr 2024 11:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FTq9H99p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7D610E52B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWLce5aaSM6dnN0+VkugxBcmITpCS5+5E21q/njDKWsEOYr3IpBvoqjGiHf9R6B79OUNO7y/QI0sMZcr8ct/zRIvp2tDZ+Wi1fMXdPfF/fhZ63JtJuIu8CfiK5BxJL1xhnjzv4lQNcZNO4ZVke49MvDbgbNG4Gm6de89jCD3eVWpNXX0fjPBRrdj9hEsYRhkjLAm0I1Fc0VC1Ye7VG7hh8lAB/pD9RHoLtTBkEGeGQ5mNDqgzq/vl7ot3VwojXa49zUR6f1PwOuyU+DZ1HTrfM84IMnikTEZzNhF71MbLhOS9W3ycQNdPwz5MN/VObigxeqDppRhnkVrbBWj7eMAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCptlZIQCcMDtQueiVhSHWTr0JI0xAPMCUZZHpBZEhY=;
 b=mVeGT5fwO7ie9L8of9iNghubC4ke+py9K29qL69wDdDNbJ8TxBb8y9MmZQ1Mp+FASCVoE7zdj/eJiAQHNCyFZDLDBouQvztXxRzCvPGIBcXUDu8iV/3bTV6xQNuciWp6jNSeWw5I6/pOie0i9si9oPlka4PXUpb+8YfFYA/JY0kun5FW0yvkEkp9h+ixLuu7gSUEu3Ni1CiG0h4L65wZU4InK5n2IJQcfKG5emkG+fC4jQlJqbehlvnMCaWa0dWtKlmCEveovjulqQoOXpzdb+zh8ViTKe4bk+GnUYXIbolaTpVm3Md1azlufcbrj5n1Pk5c57LNExevIMFh+zag6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCptlZIQCcMDtQueiVhSHWTr0JI0xAPMCUZZHpBZEhY=;
 b=FTq9H99p+vwossLsSoaCBoxLZ9AWY7VA/6j3rqPaden0ZnEdnMMLBdONV2f6NOUk2vaNtybKWg+9wWD9tOlJnFDs+sO/EKOfCCpouSZwyBCP5jLmWWAk8k+5CWgSRfzEp7xjyoQXiZC1bEuCezkXmSOGL8ti7rKcyQOFXUUjzmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 11:57:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 11:57:27 +0000
Message-ID: <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
Date: Mon, 15 Apr 2024 13:57:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: zhiguojiang <justinjiang@vivo.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
 <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d75ea0c-7748-45e5-6e2b-08dc5d43383d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4TrhYJNUUSQGf6JV4ZTBZA7hcNjA+Nd3JQCtL/eEa+Az+2GVHC6RxMGcBp39S7zrcWjuslbQgFxfMcsW3xwt7satv5+VrUfvAH6opK4BuSPBcYbZGuBg8I7XCZNM152YstAVvkY2hdIGm3/vpHSt2c8LQW4JCK7IEOE3ts7pkA/8cbX3YQj7Eyf+nogggC4AmcjmIqePX3guB974hGbwS0Jl1BgPFTb1pNLhuEZxySfSG+wMFmxaScvxL4CJWBVE3TBYL24iHms7KhKo/g10Ag0qM2+tx7oZrW475zDJsnjv7AMe2wKe4n+anJ7nHZ0TQUy/6+FopM6yGuvFAWwdgdrFK+txdGFVcNDdn9mdHvBkQoFexPXFee0lcV90gGm3ab8P8KyzGkdM+qaGXxi//Kp0P7w3ubJ1kYtcHPh2Tp7LP81S9tb6FVWWmDXFL3rnb4P8AWGGFB38k1wQApPvSiIukGnBwpDrugxMpDi8/a2zlz/8TY9Ahycmd/JTN0LL+WrzsmA9rR8JBNXlcoioXwQgq6GB9D4XTf19VeNVaa5G5YngHasEOun0F/5G+nPrtHQKxJl7o1ZUDLRCt/Qsdlo4GjOB3t+3/ximVGigRPNJtitiyzF9wLnDnNswvTlLMpYGjuYRmH92PC+rLa/m2p4SMLmj5uUw0A4IQdS1xY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJuNjh3eEpSQk9FSkJPNWVOYjJBL1l0L2lHOGtqa1AzU0NQeFFRRUVMRGdZ?=
 =?utf-8?B?RTNWK1ZFQUVDMUN5ejZSR2lKTjFuRWtlSUFSalM4dDN3MkFNTkZ1Y094cDJu?=
 =?utf-8?B?dWxIdXRDWkVxRFBteE80QnUreTIyWTQrc3krSTJJOENVYW9UbWI5TlgrTG9x?=
 =?utf-8?B?Q2FaQmxRa1ZjQWVIeThTdThjdC9mM2Z0UjJkTGtIU2pubk5oVzIwWWc3N29L?=
 =?utf-8?B?SE44djMwdFlPWktyVmhpT2g3aFlrUTg2cGtYbzZlbnZqTElsbE1MU1JUQk91?=
 =?utf-8?B?dFQ4MGQ0aXRIRThoQjRvRGFmQ0wyZzJmRUxOU0RPaTh2dHpIcGpvL2kyUmcw?=
 =?utf-8?B?TDRuRnVaNStiY2N1TGZZdGpmV1owSlM1eVlpUWcwd2lQbU5GN21weSt1Q3J2?=
 =?utf-8?B?NXZPRzlZRjlnbGMxc1dyOHhjeFpJUHF4Y3gwa0R4dVJQeHJyZ2doamVvNkNw?=
 =?utf-8?B?SmNLaU0rOElnTHNCRUNrbXp0Q0ZkZU5sODYzU0dKeWkwZ2FZcDhKNStXNmlV?=
 =?utf-8?B?Y0VBODBaUGFaUmtQL1RhRmsxaFUwc0FVR2hqcTlyRVhCK0xMNGRpQUxoK0J3?=
 =?utf-8?B?b091dlRDV2hNN3JvTmFMMTh4ekhEcCszbi8vdEczT29kVFRmQVV3ekFmWC9I?=
 =?utf-8?B?RTZGUkxsenpMSCs0aTcyekRtR2xNdW8wVCtPdDQraUZNS00rZ29sUHVLR0JW?=
 =?utf-8?B?QXFrOHRKVy8xVDVwb1VYaDBnUldXVEQ1RG9PZ0ZZS3BTTmt4cGpNQjRMWEVp?=
 =?utf-8?B?T1EzY2hsYWVuVjNJRE55NG02eEhFMUNxSUNJWmNON1VNQkxqMzlVd2hzTXN0?=
 =?utf-8?B?NytrdU1DaU5HVW9IUk5XQkl6dHJmZE02MVFCUzdLbUJXdktyRUJFSkRVLzNV?=
 =?utf-8?B?L0gxZGQ4endQdVR4WVR0NmI4citsUWc1eHZPanNlcG5jWFdsNzY3OEIzTlZa?=
 =?utf-8?B?WElMYXZQaXBETzJQT0dFWHYvRXRiNXQzUm81V3BFMFFjM3UxU0VEVHk2NGFT?=
 =?utf-8?B?cGJTSDVFUXpXWlh4cS95MUFnQXptUXl3bGRGVHY4cDVHb0drZWpXa3J4ZEI4?=
 =?utf-8?B?NXlFSTdKVkVPR0pxcEwydG9ESkV4anBuU2V6aVBoWWNiaHFuTkZLd1B0NGZJ?=
 =?utf-8?B?Vm5VUGdTc3dLK091UGFMZDBMY0pyMFplaVBCb3B2VnNFNjdvU2Zld0dDbGMw?=
 =?utf-8?B?OHdiakVRNk5udEJKL3djNmM2Mm91Y0Z1NkhsWkZTenBRaUJseXpwR2tRc2FY?=
 =?utf-8?B?aWhESVZ3RWtvOFl6WGFMZ2VrcG9OeGxVazlHUzM0TE9CTHlXNmNLaW5sWWhM?=
 =?utf-8?B?ZFVmVzNOeDJCZm1DNU9GVHlweHlIODF0QXI1d3lzcm5HcTJnVjY4N3dxOEhF?=
 =?utf-8?B?R1dOUTRiOTFscWFMLzFVRnE5YjhHbEdOV1A0eDkvUEJwWlBSaWYyNEUxMDlh?=
 =?utf-8?B?WHBMMXVPMHNMdThtMFZ4WWV2UXYySHdmeVJZcnRzL1Rta3JWVG5ZSzQ4WkdG?=
 =?utf-8?B?ZlZjekhYTzlZQzBuTVVKb0lSNWgzbWFvaW5YZGJZL1BNbXN0YjB4cWZWSy92?=
 =?utf-8?B?UVFPb2xuNXJMV3dMUGZKTVNRcnM2cFJxYkV5V2hGaW4vL0ZTMnBNejhTaTJk?=
 =?utf-8?B?alcwc0RjblVZNjl0MDBpSVJ2YnhqdjYvV1g3eVVmRUxhNEJ4bHhtWmd0QWxa?=
 =?utf-8?B?b0lBRllPTkY1WHFRaXRmNFpYb0VRM0s0QUhQQ25LQ2hQMkhxU0ZMUGFRUktH?=
 =?utf-8?B?WC9VMWcxeGJZSFNyalAwdzRURFlkSjlqN2owZzBXSHpHQ1NZSUxZWUN6Tkk0?=
 =?utf-8?B?QVZzYzVveUw4NlZjMmVsT09iOGFFQ0crS3pidzVvNDJxR1prbnVtVmt5bjdQ?=
 =?utf-8?B?MGFtbysvbmRtdFhUS2tqUnM4MGJCS0twa0htU1lic08zNUZnRktpeHgvblVP?=
 =?utf-8?B?YzFJNkUwTk93VUkyQmRkMVlwdHZVdDdXQ3djbmJFOFpPQ1RQSHFhSlZpN0Rr?=
 =?utf-8?B?a3JtSjJKbElneUQ1bnJCLzgxdHFtTHpoYVRqNTA5TDdBTjdGV05iSCtKZjAx?=
 =?utf-8?B?R3QwRjRpZ0RFWENaM3pUK3RvaHZQWDRjTjdkN0hPc1RnWXBUUnp1Z3Jra0xR?=
 =?utf-8?Q?DK8w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d75ea0c-7748-45e5-6e2b-08dc5d43383d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 11:57:27.2398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUJbTjPRugKdwb6Z+b4bzSqDksVPd3GgZALUnjcTv8MsVagYVu1P1hxQ+xWwKEsG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902
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

Am 15.04.24 um 12:35 schrieb zhiguojiang:
> 在 2024/4/12 14:39, Christian König 写道:
>> [Some people who received this message don't often get email from 
>> christian.koenig@amd.com. Learn why this is important at 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Am 12.04.24 um 08:19 schrieb zhiguojiang:
>>> [SNIP]
>>> -> Here task 2220 do epoll again where internally it will get/put then
>>> start to free twice and lead to final crash.
>>>
>>> Here is the basic flow:
>>>
>>> 1. Thread A install the dma_buf_fd via dma_buf_export, the fd refcount
>>> is 1
>>>
>>> 2. Thread A add the fd to epoll list via epoll_ctl(EPOLL_CTL_ADD)
>>>
>>> 3. After use the dma buf, Thread A close the fd, then here fd refcount
>>> is 0,
>>>   and it will run __fput finally to release the file
>>
>> Stop, that isn't correct.
>>
>> The fs layer which calls dma_buf_poll() should make sure that the file
>> can't go away until the function returns.
>>
>> Then inside dma_buf_poll() we add another reference to the file while
>> installing the callback:
>>
>>                         /* Paired with fput in dma_buf_poll_cb */
>>                         get_file(dmabuf->file);
> Hi,
>
> The problem may just occurred here.
>
> Is it possible file reference count already decreased to 0 and fput 
> already being in progressing just before calling 
> get_file(dmabuf->file) in dma_buf_poll()?

No, exactly that isn't possible.

If a function gets a dma_buf pointer or even more general any reference 
counted pointer which has already decreased to 0 then that is a major 
bug in the caller of that function.

BTW: It's completely illegal to work around such issues by using 
file_count() or RCU functions. So when you suggest stuff like that it 
will immediately face rejection.

Regards,
Christian.

>
>>
>> This reference is only dropped after the callback is completed in
>> dma_buf_poll_cb():
>>
>>         /* Paired with get_file in dma_buf_poll */
>>         fput(dmabuf->file);
>>
>> So your explanation for the issue just seems to be incorrect.
>>
>>>
>>> 4. Here Thread A not do epoll_ctl(EPOLL_CTL_DEL) manunally, so it
>>> still resides in one epoll_list.
>>>   Although __fput will call eventpoll_release to remove the file from
>>> binded epoll list,
>>>   but it has small time window where Thread B jumps in.
>>
>> Well if that is really the case then that would then be a bug in
>> epoll_ctl().
>>
>>>
>>> 5. During the small window, Thread B do the poll action for
>>> dma_buf_fd, where it will fget/fput for the file,
>>>   this means the fd refcount will be 0 -> 1 -> 0, and it will call
>>> __fput again.
>>>   This will lead to __fput twice for the same file.
>>>
>>> 6. So the potenial fix is use get_file_rcu which to check if file
>>> refcount already zero which means under free.
>>>   If so, we just return and no need to do the dma_buf_poll.
>>
>> Well to say it bluntly as far as I can see this suggestion is completely
>> nonsense.
>>
>> When the reference to the file goes away while dma_buf_poll() is
>> executed then that's a massive bug in the caller of that function.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Here is the race condition:
>>>
>>> Thread A Thread B
>>> dma_buf_export
>>> fd_refcount is 1
>>> epoll_ctl(EPOLL_ADD)
>>> add dma_buf_fd to epoll list
>>> close(dma_buf_fd)
>>> fd_refcount is 0
>>> __fput
>>> dma_buf_poll
>>> fget
>>> fput
>>> fd_refcount is zero again
>>>
>>> Thanks
>>>
>>
>

