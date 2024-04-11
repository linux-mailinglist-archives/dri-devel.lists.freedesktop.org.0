Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152208A0DE7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 12:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3066810E562;
	Thu, 11 Apr 2024 10:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NiO2ZKLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6B10E562
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 10:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKV9gwUqtB5PqX9+aXsrCygBNmMFdpVjqz0jldcwsH7iB732kbi+uqK+fCv7TPAVaFOtFnUZlecK0SBk09Fguj0OEZhgd2oBMOvRLlll+A1gZ81i5tRx9FLj/aycnWKKXDgMI5OjJuNv+3Yann9ZcX86nvbAoCwNaTue1lTJDQS37W32NP3G5hGi57PGpKul6UfZgn6mKJPnjG8veS1+ODXl6SImLi+AXvFWhBQVn7mpIGz4fu6iaJLIyRjbGEM9P9PkJ7DDjuTU4GDqjwWN9EP2QzTB7zu/DjQuEzCsFExYvYTPiFQex3bfnYtDWyIOBWyQUIvceZk3BYyyl9F8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap78K8Newm4BnQ3TItEjz2ltOxcvyhhQnJdRIANsFHw=;
 b=GUYHmZfGuM3HdXCI8PK4iKVc5cd+nozpOqoih8qs4k10gplXfMkZllihp168J5Z01HvNyq30J8S0ewiCgRkPO7uU19EAqZxRlUxzC3CedSq0nF23XpimpIRcbOVyjoYHKadAqPAmBKDJfsV+xHZov8e69vOvB+V4vD201myqJHKPWZKq/Q12pZrtFbBZbabCpyVJiY7opSbH3xbHVN60cCvk5UNu4Cjg+YMKfT0UWJK6joPYbarUHe9cjVVXVVOSarl7KTwKxJLWzscBSj2k9sNCAsTyHwvDS7H+uIMUzSHraRd8BpfQkGHNR94t3rca/nZwtvTAcU3qxTpilJynsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap78K8Newm4BnQ3TItEjz2ltOxcvyhhQnJdRIANsFHw=;
 b=NiO2ZKLKsGdhn9I7NOo5wfQyu3W8LNUinW/gL3k4F3gXBbb/AqE3Zh393XoVWKMoHivJqMOXK6eUGh7McqfQqO/kcjogPDI/hKrPHF351QAMA9HqeQ9WKodxxIvQxaQGMIeIDx+wv2pKWB7GTk8djG4rgrBQINSSgG/nt/SAFdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6906.namprd12.prod.outlook.com (2603:10b6:510:1b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 10:08:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 10:08:58 +0000
Message-ID: <72ac9781-6b71-4683-a908-c1289a031b01@amd.com>
Date: Thu, 11 Apr 2024 12:08:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Rong Qianfeng <11065417@vivo.com>, Rong Qianfeng <rongqianfeng@vivo.com>, 
 Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org,
 pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
 <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
 <CABdmKX03Of7OE_9PfAy5DWcCwwvQvJGXDjzAE8c4WRrz_0Z_eg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX03Of7OE_9PfAy5DWcCwwvQvJGXDjzAE8c4WRrz_0Z_eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0365.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: f2111b3f-485e-4a39-5079-08dc5a0f6761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJdbTVoM8QYPZiiDWiyQImq2qkWb9QRzUydDa6DJgUPCxUb9c2zTTuox5DVFcmOXIxcm23fXlvDhtq7SJ/ofhxEDkT0ziX5Upf4cuZ5WexxSxWMR3QhkBOoOPx6ucMCyf+TnjX9Pw7PUvsg6147hyriUlYXJhPH7ODciMSNipLK/1veulVfY3QRnzTKc0yItaKUc7LmftAvZqAsQeV7xrJx5APC4TkAxn/mSEXpAg/PtTzqiyGN1KNXfvPoDWtBuiWZ9hqqvTj/cAyGEEbS21bSL7No3QBidi44cnEe7gULmoLSoII5tj2D46UMCnBiSEa8shoaLgsO3A3GpYB9wrC4mvBmL7jpctLU5JFG29yUhwBNOCmmFZXlLujJ0+k0MonTacj6BQx36uyFm7aibDfKESwQAUv8ZW+2lpbBJd6xGJLNikXIsK5ssxYFClMD/+db/UHt6DRXr5FqyKv+hsm547ecVBu6yAZGaYknjvwpMvLReBcpFCqHfjb3vL/DZNYXMnz5EWlWLhzdAyFINzUIwaOLXLB3hFRH8fJ62MRqKeXx+6GUeDe3U/2zsoU1skhjyUguTVTOPhCRegPYR96l5tsLROXnRwZUM04GVDMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTlRdDB5L053cy9nV0dPUmx2bytPQ003dWY5OTBodTNWSTVuSTlXSzlqMHlp?=
 =?utf-8?B?TlowOHI1dFhYTkZwdktKWVc0ZFJTMFFCVndmZzZsa1dHSzVHZVhZaG9MdVVp?=
 =?utf-8?B?ZG5haThXYitqT2FtVHRYcEsvZG5EdzEzU29iTHV4ZUg2YVpDbWppRkdmNjh1?=
 =?utf-8?B?T3pQNk5tMzZUTTVKM3Z2cEhJYmtQTk00MnRCU3RTVjVLVVhRaytjUmh1ZXR0?=
 =?utf-8?B?NjhMOGYySCs2VExaT0RsVWFoSkNFYnVVdnJKZk1CWWRsSzNOdEhyaGhncjVO?=
 =?utf-8?B?VGVkWkFwVHRtSVpkRXQyU2JlZmR0azFhNithbGxiMURiWTFLWThuL1ZqLzBV?=
 =?utf-8?B?M0tSczhDZGxYb3cyMVNPeHRZTmZYUE9DaGYxZENibUxvMTl1eDBKcU15Tzd6?=
 =?utf-8?B?RC9XQjdRVmtXNzM5dHZndmRJT0F0VUtkV0lhOXN1cGQwRC9RWkFZVXdSbDdE?=
 =?utf-8?B?WjR1MjNsKzZCNmdPUjFGTm91OWpZcGgrd3V2UEE4VEN2b2h5dm1jRjVESkFw?=
 =?utf-8?B?eDhrdUJJQzViTGd6UUt1Q2JNaWxyWnlMKzdHQlpTSDJJbjYyanFMcldGUlFa?=
 =?utf-8?B?TlNhbU9MT2xtcjZueWF2Y1A4cjkxRTFZeVVSNFdFQ3FjSHBmbnVkV2syVjR1?=
 =?utf-8?B?dDFHeitkS3JaMUppclBwc3ZnSHhnNG92dGYzRStpbnJ6b1FzRFhlTzV5WWdw?=
 =?utf-8?B?M0EwUlE0OVFJanJEZHFDUThZU0hzMHRxdWl2U1FnekhCRDRlWW1BbHQ5RDFI?=
 =?utf-8?B?cTZlYVRlTFJ2ODF5NzU0QXVmSktrRHhOc1kwY2s4M0hQQTB5V3dKaHUydGFM?=
 =?utf-8?B?WDI4UVZxVVlpeHFHbFp4WCt4cE1qVTJrTC9QYmE0YTJ4bm1vbnVqTU1WNGdq?=
 =?utf-8?B?Wm9pY05mVnZ3R25qdzZ6WUdkblpOZm04b2hoVWlIaFBrUW41WUowQ1dLeEtY?=
 =?utf-8?B?MkNtcVlZNENBVjdsbmo4MWJZeDBadVFUTlhHQkJPZFFaOXNHa0F5U1pKamV3?=
 =?utf-8?B?YVhORmlwMXErVjRyN0Z3U2pMRXlqaG42WEUzcklueVdZa0piU0hNNk9UVFBC?=
 =?utf-8?B?NHE5RG9lZnNVUVAzaHh6dXVvSmpIRWQzd2dlTys1T0tYdjJmUWlKdzR5NjVD?=
 =?utf-8?B?MzIzUnk4UkJTQjRhYmdxMFVtaGZkb2p1NHhSOVQ4ZDg4OWUwNDNxaE80cmtE?=
 =?utf-8?B?TFJ1WmhsbGJVYUt6RlR1L1RWY0FtVHVjWHUxdUdFRmlUc2MrTk5JVEx5Qkgy?=
 =?utf-8?B?TVVQV0VnYWNwN3VheDl0ZU16K0xWT1RLS0RyOVhSR29saVpDS3Z0N3FLeTFD?=
 =?utf-8?B?cTBqUnVxYUY1cEVZaXpIL3NUb0JBK1ZGRXB4Y0s3L0JCY1BpUHcveDNCb01M?=
 =?utf-8?B?MHo2elphdXVJbGdvSXNtTElJV01LdXdTZVJNMUhnVXRGUGY0ZEQ1eGF4SllL?=
 =?utf-8?B?RENsK3BBbDIxKzVNNlJRd1Z5Uk5zM2QrTmxRYmsrWGZyTkJBek56Tit0OHh6?=
 =?utf-8?B?RzAyZ29jcGRlaXNmcHdQNmpLaWh4ck9NdWptRGlwZjdLak5HdnJjK001RCtm?=
 =?utf-8?B?RTBCVDJLZVMrb05kdWFzNTRvd3RuSndmZFV1azdKVFFVcmtlTVQ1cmh1VDVD?=
 =?utf-8?B?SlBrdS9LUWQyU2tHWWpkMFROYi9pZXlqa1hmcjU5c1hkcFEzZXVGSVdNMmxo?=
 =?utf-8?B?WS9VOWhnUmFqU0NqNXhhZGEyaXQyejV3U0J5czBPY3p2djd2QkthcE5uaUJD?=
 =?utf-8?B?TkR0ZldobXlBdlQ0aVlHRXJ4UWVLZGgyaUVna2owL3FsNDlZMm9aTFNTL0Rk?=
 =?utf-8?B?amlQWjRSN1VJTmYwUkxYdDVDQ09WbzIzUWZ2ZmkvZVRlcyt4N01rSFE3bGRK?=
 =?utf-8?B?M0FEL2JDcER4aStEVUtRSXJ5cjhVMElqMDcyUllBNkVhdEwwekxxdUpOL3dB?=
 =?utf-8?B?OTBKVitmTjNEYktOaGl5Nk5sZU1kaytNaGZMMkhyRXNTdkJpRG1yckdheW8x?=
 =?utf-8?B?dU16a0MrSEVJMy84ZjlOZ0wzemI2d2dDdlZHZmJCNnRwNlpYV050WW5aL0Vw?=
 =?utf-8?B?Ykx6U1ppM2NvWDNYRm9Vck5OZml0bUVnWWpKYnZzQmNhT3FWdUUrWGZacmc5?=
 =?utf-8?Q?Jb+wLTpY4H76yufi8R3Dg9MFH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2111b3f-485e-4a39-5079-08dc5a0f6761
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 10:08:58.6578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZXdlyIy2z1mGlfMOiq6XhB4K9AJSQgkeaGmKubOg1m9fLvmyUVd6BlLabvP+fgl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6906
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

Am 10.04.24 um 17:07 schrieb T.J. Mercier:
> On Wed, Apr 10, 2024 at 7:22 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 09.04.24 um 18:37 schrieb T.J. Mercier:
>>> On Tue, Apr 9, 2024 at 12:34 AM Rong Qianfeng <11065417@vivo.com> wrote:
>>>> 在 2024/4/8 15:58, Christian König 写道:
>>>>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
>>>>>> [SNIP]
>>>>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>>>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>>>>>>> offset and len.
>>>>>>> You have not given an use case for this so it is a bit hard to
>>>>>>> review. And from the existing use cases I don't see why this should
>>>>>>> be necessary.
>>>>>>>
>>>>>>> Even worse from the existing backend implementation I don't even see
>>>>>>> how drivers should be able to fulfill this semantics.
>>>>>>>
>>>>>>> Please explain further,
>>>>>>> Christian.
>>>>>> Here is a practical case:
>>>>>> The user space can allocate a large chunk of dma-buf for
>>>>>> self-management, used as a shared memory pool.
>>>>>> Small dma-buf can be allocated from this shared memory pool and
>>>>>> released back to it after use, thus improving the speed of dma-buf
>>>>>> allocation and release.
>>>>>> Additionally, custom functionalities such as memory statistics and
>>>>>> boundary checking can be implemented in the user space.
>>>>>> Of course, the above-mentioned functionalities require the
>>>>>> implementation of a partial cache sync interface.
>>>>> Well that is obvious, but where is the code doing that?
>>>>>
>>>>> You can't send out code without an actual user of it. That will
>>>>> obviously be rejected.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>> In fact, we have already used the user-level dma-buf memory pool in the
>>>> camera shooting scenario on the phone.
>>>>
>>>>    From the test results, The execution time of the photo shooting
>>>> algorithm has been reduced from 3.8s to 3s.
>>>>
>>> For phones, the (out of tree) Android version of the system heap has a
>>> page pool connected to a shrinker.
>> Well, it should be obvious but I'm going to repeat it here: Submitting
>> kernel patches for our of tree code is a rather *extreme* no-go.
>>
> Sorry I think my comment led to some confusion. I wasn't suggesting
> you should take the patch; it's clearly incomplete. I was pointing out
> another option to Rong. It appears Rong is creating a single oversized
> dma-buf, and subdividing it in userspace to avoid multiple allocations
> for multiple buffers. That would lead to a need for a partial sync of
> the buffer from userspace. Instead of that, using a heap with a page
> pool gets you kind of the same thing with a lot less headache in
> userspace, and no need for partial sync. So I wanted to share that
> option, and that can go in just Android if necessary without this
> patch.

Ah! Thanks for the clarification and sorry for any noise I created.

I mean from the technical side the patch doesn't looks invalid or 
anything, but there is simply no upstream use case.

Regards,
Christian.

>
>> That in kernel code *must* have an in kernel user is a number one rule.
>>
>> When somebody violates this rule he pretty much disqualifying himself as
>> reliable source of patches since maintainers then have to assume that
>> this person tries to submit code which doesn't have a justification to
>> be upstream.
>>
>> So while this actually looks useful from the technical side as long as
>> nobody does an implementation based on an upstream driver I absolutely
>> have to reject it from the organizational side.
>>
>> Regards,
>> Christian.
>>
>>>    That allows you to skip page
>>> allocation without fully pinning the memory like you get when
>>> allocating a dma-buf that's way larger than necessary. If it's for a
>>> camera maybe you need physically contiguous memory, but it's also
>>> possible to set that up.
>>>
>>> https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/dma-buf/heaps/system_heap.c#377
>>>
>>>
>>>> To be honest, I didn't understand your concern "...how drivers should be
>>>> able to fulfill this semantics." Can you please help explain it in more
>>>> detail?
>>>>
>>>> Thanks,
>>>>
>>>> Rong Qianfeng.
>>>>
>>>>>> Thanks
>>>>>> Rong Qianfeng.

