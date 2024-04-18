Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE1A8A90B5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 03:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29FB10F9A0;
	Thu, 18 Apr 2024 01:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jP5AHdzx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2081.outbound.protection.outlook.com [40.107.215.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B4410F9A0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 01:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+Q+Fi7wXE0DMCDA4Kb5zvYTHAU2aEf4+5XAbPY6GL2fFAxf9R+cy4R8TgXLLW+vXClmMsA8p8JwsoaSqlcf+MnIxntegFvS+5ZBe1qyNwivwYFc4adl6NKsNdyA+x2Px8zN10BmKP0kJu82sqCAuWdZK3scNqcF+GvXxagAmocBN6ASHlpmxbLA9KYXU+iChgbX4yGHSoYdHZFKitEqnkNzIJaLMoy/bRW926UL8CnjAeUanroolhMFOvdi8qzsuVO0EPpWRfzmCP87fUbVRAurrIZlyF2BWulcrW14ivaeg5yUc+wLOdLkiELXNi+wCu8WynjcVDKXWo22FLYx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UbpjRJFHjjjrkHsQ+g79VEs6uDhFOo5VzuYeqKSX2I=;
 b=dXm7Zp9XT84aWf5TQpgVYODCa9tTh1ECnAavnakpmmlUDv5VzB/o+FxZdyuwsQrLA/G+ETcMsRcj/tqqu8q3klmh2R+ngmXse1AAlfYFGoUEMFxJNoAJd1C26k63cxpjHi72NmmqerK77rZYvrZ4bPPhmsPNWmSKU73axRH032zWFmguqoscL1pJUN6ngx3+nGSptZzjnNfWsNyuP+K3ct/BTpfNkErlOw+uQouczrRaCie0NecPC6TLInhk1CLCUJ7REDtTPGmp+6thBwWfQJ8brgV4aHgxkd3J1OOW02wlV31DsiUBxpoMPXBKKjbAEgBTAqoSCPWEgmlHqcA95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UbpjRJFHjjjrkHsQ+g79VEs6uDhFOo5VzuYeqKSX2I=;
 b=jP5AHdzxyl1kYByZ0umoOW8vaxlBfAB9WFQONzGfewsEuBKBFzMSJbHIz671Q7V79Zav2txTWuCsMGIOxXQfmp7+huJRIWGjk3pkF2x6DxXQBGTCRw4OMZ62boLctj45MFsO9NHZ9DKrl42OKrEjRC4cEWoB/Eh+3he2CD2+XV8LTOB5nxTH5a9VNfi0g1Iyqt5ikRFeTCR5SW6EYJgQizTOqjM1Vp0xeBD6XEY6hK/oq1npPnlYBcGzilMbTet9JE98OLQ/RN4UAHWW5/KvfNZFVcKtGhH3O9cv4Oi7oUAWVKeJQOZWjgmRkUhEiBAAwvjbP96NSiTHQr2a1NlA0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by TYUPR06MB6003.apcprd06.prod.outlook.com (2603:1096:400:352::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 01:33:25 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%2]) with mapi id 15.20.7409.042; Thu, 18 Apr 2024
 01:33:24 +0000
Message-ID: <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
Date: Thu, 18 Apr 2024 09:33:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "T.J. Mercier" <tjmercier@google.com>
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
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0089.apcprd02.prod.outlook.com
 (2603:1096:4:90::29) To JH0PR06MB6849.apcprd06.prod.outlook.com
 (2603:1096:990:47::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|TYUPR06MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 767eba79-327b-4be7-bf9c-08dc5f4789fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/ovRAzJ+r3EmsLSfgRBUZt0x7kRvk/QvUTV+QGWq6bRknSVvq4B+wPEBOzxAsrTva3nQL50UChujJxD0cabRCvDFlE4D86ZGx3hOA6RPTipL9K0Dwku+9PuozRHxzZStBBLLH3Qzm0O41ITCiJ1ZwSyKHk4W5SsgWnxS6A1+q+LIQR/WAMQGUtWRe3j93wIAjeUrVfEMYlHKwOVRDrCQ5RCLOaRrOh0BqpuazE5G5oy/1lI4v2ca7uQ3WIEsHESIPeF1tQPg7H06QQmYce5NT1ZOHipZXwJGQUZxX6rvVRbwNB9rWWd6MLbh2w1KpoJJ/lWv9nhU6DhxiEQTYWsLc7lmAqnYUZR/qBfXJIzL24/g3UYkFvGZPwC/ZngW6teviXt4oMdQZhgBpB66lS2fhnXeOHXMYM2Qtq3mJocX5qAzK6UWowO4pHpqXfNoMnOfmbc9pI3KXlOyQGYsFwK7cPmc+IutMi0XK/tHg9Bj7Sj+9kCgUDeWZlQOE8Cmnps1D+he7dafAPY9xt6H2YX0zk4aVgVIrXYA6vve5p9TYMqpImuej+LVEwaWnR9doRg58pceYKfC71LnUokJYeGulYEI2hMt5FxK5QSDprJbLcBJqvjgesq8WS3EV/GwlLLoixY/TQogXgOpR8GhYFNJM+npbsHPXnZpnPOVD8IaxOH0986R7hH6yjVyuHNFWjSzf6S8UA6oeNAi5pOvrxaMKXG+7qUwkl94HPasRc7SBjfw8gO96uxHHyRI0DOPUSq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR06MB6849.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005)(43062008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtFMFJuWkZJUmI0QkFJYzAyYUkvSm01dnVGZ2NWRGFFNFZTZTRnTTZoWnBN?=
 =?utf-8?B?SHVGYkR2S0RNWTA4aDFoNGV6MndtYkdZekc1UFN6dURsczhhaERTUEMrMGVF?=
 =?utf-8?B?eFJYNklHTTl1Nkd4M1pXM09CUGtQelhLaVRjaFJwdkVXa2pUQlRmUEFzdXFP?=
 =?utf-8?B?RWxiYWxYbm9INGM5UXdna2Q2Nll6a3YrVnhmakJjVlNjSGdhOFRNWFMxeVBz?=
 =?utf-8?B?R3NlNmtqbDZDMDUzMHdwL2xmVFF5WFJ3RWRKMTJtVThMTEJaYmtINTdYNU1m?=
 =?utf-8?B?YjM2U0ozTUxaZ004MDhXc01SNDFuOHR4SnU0K1ExTDU3c09SVW8vU1QvWXhS?=
 =?utf-8?B?eDdLRTg2NWdBK1dmejg5WHd6WUJjT2lDVVpNVWNXY3hZb3RTZ2JteUQxdFJz?=
 =?utf-8?B?eDF6czlsV3g3QWJSYVBjNnIzcEl0RHB1ZEJEZ1NTZzVPdGFGVHF5SE9kU1dy?=
 =?utf-8?B?cjJYQnNEa09xa3R1Q1N5ZXhRblZBTnNDNWdXMUhiVnoreklESHZlbHY3TEVV?=
 =?utf-8?B?U2dsQUZWdEd1c0I2RCt5OFVoU3lwdlBZczRUT3VQK05peTU1SEo5OENsbUxm?=
 =?utf-8?B?bWVJQXVtTm9tekRiNW50TXZJZEZUNFhweUsrc3N4clpvUndKOWJ0WndXTzZM?=
 =?utf-8?B?NkpXYW96MmtWbUhIanU1WHlxYkNFSFl1RVRMcHhzQ09kYXRFSHBlYVVGdzM3?=
 =?utf-8?B?Y0dpZEtlcWlydCt4cXA0N0hHdG54cHFybVBlSS9adUEyOUpzNHNjUjF6RExa?=
 =?utf-8?B?ekgxQVhxaTA4UGMwa05RTFJBL3RlVU9rV0lkT0xrcnVhOHFVUmNIQnEvd1VF?=
 =?utf-8?B?RDFjZ0czZFBHaytzZE1YVElmWHM3RVF0OW9mTzJORVlIb1c0bUpReXFFMnps?=
 =?utf-8?B?S2Q1cFlWcDdsWG94WkVVMkRRY1EybEwwckg2Z281bVFtcnZHaC9LTjVTNGxT?=
 =?utf-8?B?NmpueHhmNGtYdFhNR1YvVkdhbmdEaTBIVVByNW5oVmVTei9IU0V2Z1RhTHFS?=
 =?utf-8?B?VU9qaTVGbnJmTGFaSTY4YUorblVjQU5seklNM0dGeEdJeForZjkyLzBUSjhr?=
 =?utf-8?B?eVdjS2xhbDlqNkJvbjVDYzhVWmttUlErbkZNcTZaS0NUdDJzdGkzWW03Wk44?=
 =?utf-8?B?citwYjBzcVJaNnpsRkdRREh2K3Bwd2IzMUNUZStNcDJOWnQ3bkdMcVE0Qkx5?=
 =?utf-8?B?UStxeGhNZUkzUFl6Yi9uMnR4OXhEenRMeXRqQXQxcy9SZnkxY01MTjNPMWo1?=
 =?utf-8?B?enhrOGFRZjQ4VHQ1dTA2ejN2TUJRNy9PVTlzMWI3UWxIUmliTXVlVCt5b1ND?=
 =?utf-8?B?V05HRmVuZE0vMU15TVR0Mm5FV1h5alBVanhnamFRRG8rdlVPNFVIdVp4RkdD?=
 =?utf-8?B?eldWVCtEOVJHTEtpT3UzZXNCdDQzM0F3cVZzWXZjclpxb3l5YzlBV2FaYW00?=
 =?utf-8?B?M1pJS2FKRWU0RmZZalBQdEQ5UVlWcjd2SUNuS2JrZnk1TU5vcjNFS202Z0Qz?=
 =?utf-8?B?dERuSUlOK0VaZkRkRmFBNi9NVGxpOTF5blU2bFVBVEM0NDcvQmI5Rlk1Wmhk?=
 =?utf-8?B?cVhRc2cwbzN6WmZkRFlReFZYVGo5clFpTmhIdGVNN0tmZ2xHTUJYK2Q4QjEy?=
 =?utf-8?B?NUdjcDgrNmtTTGplNWdJU2lqMG96WjdJQmhyL0wrL1NlNVp0WTJEdUFlc1Fi?=
 =?utf-8?B?UmRKejBCMFMyVEozK21qd3dvM0gzMU8yRmZyR3pGdldZbzFVZ3VxNlNyc1dS?=
 =?utf-8?B?bm5OMFgxWHVLMEdITkpOd0s2UU1oVDVkZTlPYVRwdmVWREtzZG12TDlpMlNs?=
 =?utf-8?B?aGNDc2pKaStoM3pjWXVPOVdla1RoUU1QYitEVDdZeWNNNGtoVStValVJblRV?=
 =?utf-8?B?ajhQdVFYVkNIQ2NqaGhUQ1ZqRjVvR0V2NW93NXp1YWxlVjc4azVvcEJTVFJT?=
 =?utf-8?B?NythOTB2a2hQKzJwZDN4K3pJeFF1SnhDSG1BWjlsL1RyUHF1Qmp4akVBaDJV?=
 =?utf-8?B?UW5tYkY5L1ZSNGpGaHI4SGR1VjBhZkJTWi9ScVNzY1VacnFhMnZvYXdRMDJT?=
 =?utf-8?B?OUxxdXh1NGFDcERkd3ZDOXQxZG94Z2VnbUdORk84TDY4b1dsZkJwaFFJQzVQ?=
 =?utf-8?Q?53ID4RJGJcYrQ7qzmlrG9N9US?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767eba79-327b-4be7-bf9c-08dc5f4789fe
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 01:33:24.5837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/7W/XoMFjqGaaNKBvTDGj7MzOdlIkL7lj6CHlcVojBeKwqMU1X1qbMf4mcOjNQyj5whg3nh4NMXY6plyCCiwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6003
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



在 2024/4/15 19:57, Christian König 写道:
> [Some people who received this message don't often get email from 
> christian.koenig@amd.com. Learn why this is important at 
> https://aka.ms/LearnAboutSenderIdentification ]
>
> Am 15.04.24 um 12:35 schrieb zhiguojiang:
>> 在 2024/4/12 14:39, Christian König 写道:
>>> [Some people who received this message don't often get email from
>>> christian.koenig@amd.com. Learn why this is important at
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Am 12.04.24 um 08:19 schrieb zhiguojiang:
>>>> [SNIP]
>>>> -> Here task 2220 do epoll again where internally it will get/put then
>>>> start to free twice and lead to final crash.
>>>>
>>>> Here is the basic flow:
>>>>
>>>> 1. Thread A install the dma_buf_fd via dma_buf_export, the fd refcount
>>>> is 1
>>>>
>>>> 2. Thread A add the fd to epoll list via epoll_ctl(EPOLL_CTL_ADD)
>>>>
>>>> 3. After use the dma buf, Thread A close the fd, then here fd refcount
>>>> is 0,
>>>>   and it will run __fput finally to release the file
>>>
>>> Stop, that isn't correct.
>>>
>>> The fs layer which calls dma_buf_poll() should make sure that the file
>>> can't go away until the function returns.
>>>
>>> Then inside dma_buf_poll() we add another reference to the file while
>>> installing the callback:
>>>
>>>                         /* Paired with fput in dma_buf_poll_cb */
>>>                         get_file(dmabuf->file);
>> Hi,
>>
>> The problem may just occurred here.
>>
>> Is it possible file reference count already decreased to 0 and fput
>> already being in progressing just before calling
>> get_file(dmabuf->file) in dma_buf_poll()?
>
> No, exactly that isn't possible.
>
> If a function gets a dma_buf pointer or even more general any reference
> counted pointer which has already decreased to 0 then that is a major
> bug in the caller of that function.
>
> BTW: It's completely illegal to work around such issues by using
> file_count() or RCU functions. So when you suggest stuff like that it
> will immediately face rejection.
>
> Regards,
> Christian.
Hi,

Thanks for your kind comment.

'If a function gets a dma_buf pointer or even more general any reference

counted pointer which has already decreased to 0 then that is a major

bug in the caller of that function.'

According to the issue log, we can see the dma buf file close and epoll 
operation running in parallel.

Apparently at the moment caller calls epoll, although another task 
caller already called close on the same fd, but this fd was still in 
progress to close, so fd is still valid, thus no EBADF returned to caller.

Then the two task contexts operate on same dma buf fd(one is close, 
another is epoll) in kernel space.

Please kindly help to comment whether above scenario is possible.

If there is some bug in the caller logic, Can u help to point it out? :)

Regards,
Zhiguo
>
>>
>>>
>>> This reference is only dropped after the callback is completed in
>>> dma_buf_poll_cb():
>>>
>>>         /* Paired with get_file in dma_buf_poll */
>>>         fput(dmabuf->file);
>>>
>>> So your explanation for the issue just seems to be incorrect.
>>>
>>>>
>>>> 4. Here Thread A not do epoll_ctl(EPOLL_CTL_DEL) manunally, so it
>>>> still resides in one epoll_list.
>>>>   Although __fput will call eventpoll_release to remove the file from
>>>> binded epoll list,
>>>>   but it has small time window where Thread B jumps in.
>>>
>>> Well if that is really the case then that would then be a bug in
>>> epoll_ctl().
>>>
>>>>
>>>> 5. During the small window, Thread B do the poll action for
>>>> dma_buf_fd, where it will fget/fput for the file,
>>>>   this means the fd refcount will be 0 -> 1 -> 0, and it will call
>>>> __fput again.
>>>>   This will lead to __fput twice for the same file.
>>>>
>>>> 6. So the potenial fix is use get_file_rcu which to check if file
>>>> refcount already zero which means under free.
>>>>   If so, we just return and no need to do the dma_buf_poll.
>>>
>>> Well to say it bluntly as far as I can see this suggestion is 
>>> completely
>>> nonsense.
>>>
>>> When the reference to the file goes away while dma_buf_poll() is
>>> executed then that's a massive bug in the caller of that function.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Here is the race condition:
>>>>
>>>> Thread A Thread B
>>>> dma_buf_export
>>>> fd_refcount is 1
>>>> epoll_ctl(EPOLL_ADD)
>>>> add dma_buf_fd to epoll list
>>>> close(dma_buf_fd)
>>>> fd_refcount is 0
>>>> __fput
>>>> dma_buf_poll
>>>> fget
>>>> fput
>>>> fd_refcount is zero again
>>>>
>>>> Thanks
>>>>
>>>
>>
>

