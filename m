Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C78A4C9A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DCD11243F;
	Mon, 15 Apr 2024 10:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VEpl7yN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2049.outbound.protection.outlook.com [40.107.215.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D65611243F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 10:35:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG5st2MexJ/jDO+M7G4qw5744PJUtwQJKCywCqgotJnrcKxIJZJ8J7/mdKcPecvBzrlB9Qk1Kjtdtgd+AFo/HZOVg0HccBt+D0O/wROwL9yIcmM9G3c3FKadAxhSJ06s0dEwSZUp8RpPCv308ed2gufQqOrfFHiQLQ1kTU/EMIZcuY/MVINmfmmnSQL+5f7VgTAycFW3ZtHX/ph5zWrsBIiXMphVQxD6YbnWB9Rw5GxO6GTb3g/PLj4eEQSSb6UyUMcO/OEqF2fTeovbg82415MpzTRWCxI6zZEK9+74WD0Vz6Edf3kFhIID3HypZnCok4WqrvyXowlEg/QMvqYS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oREWkNcx/M39UtvzuHoQg5IwB2MM7TwGSXLrQ/ThrkY=;
 b=hlvX5onMik5KzcCmRbOK7eowRQQUpLHevxvcTeArIzUm81kn8UK/NPotTXkiC5rMaIwoil3OhEUnaVumVc/fPZaw916VJfQO4Qu6T9fbAJS1GTRsWAGMYpXZ26scgESAQcJbTZUG/JsyTBdvLBjzqSYHHU7HQAqaozZCakhYuJIpf3P/zziSvug+BCY5YWaY1BOYDuVx89xlEO13ICxUWD4OQRpcN7a26eb5nnEkfZ2uSQ5XxVyK8E4B14JyRmjmtWWkAgBXartnjtjhxcNkQaA+I/6gH7jXrxGtyoJUXYya2lTNLFxbnU8I0yZu+p1VlIwDb5jX515JCAUYdwhjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oREWkNcx/M39UtvzuHoQg5IwB2MM7TwGSXLrQ/ThrkY=;
 b=VEpl7yN9LqEQp8leWNi7xVaZhEWPYcFgScpCPy9qiY0RsscC8QgEmTJ3Hdsvd//vDn33SdMismV7gblyHBYTZMWNy+/VsEbM/xHdNT2nguPf2gp3pOYnQxfpaL32PSmFprhuV/eS9//dZ6oWGo30Z4DEdF3+qGoDysLk0awJf7UUIf+PLQmJjQqESTC6wsiF7L5nxsEEBArF6czvXVLt69x7Bmuk8u2RGoLtHwktAdbEiAn4SP8M2qfgV5kZJlhw162d+c2eFfmFb9jfdR1GlAMr4qGuSzYi6mszCYYUCbkNLRfWYyfgxfe5M1lMtVXgp4LxKQBWNzs23b3rTJVF9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by JH0PR06MB6629.apcprd06.prod.outlook.com (2603:1096:990:31::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 10:35:34 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%2]) with mapi id 15.20.7409.042; Mon, 15 Apr 2024
 10:35:34 +0000
Message-ID: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
Date: Mon, 15 Apr 2024 18:35:30 +0800
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
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To JH0PR06MB6849.apcprd06.prod.outlook.com
 (2603:1096:990:47::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|JH0PR06MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: a58e6b94-d9fe-45e9-148a-08dc5d37c7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPJUp84GUcjlpZbQE5J/oadsIP/e3OiEZ6wb1gwc7UKC5oRf4oAyFC7kjCUNwpId9lKdoe1lVbTJgKE3QuLJZ2Stp/wn4x3oTacq5a2Ox2JbjiLsDDtOcYwxpijxTM0e1WH4nLWsZ14DQJj62DE4AvA9scjxZGu0onDn3mh5cw4OaPiph3PfU0YPUBhlZ6rf5sQ7OIiHIXYTfLa5CqyGRMVpUAdXiVQciU5m3s+fy7/Cm1b1xSLD3+ZMAikLFIVR+1Wa9CRSUgIhhsNkXBikEuxkE973XJOhjI9dknL/3SQ3FCJnliHtM6dtZj7WfeK1qZF/FgDw4GHI+m59MXTeFxYMbHJFvNa6CkseSvgiO0wpdS4T/MWyvZ7yVRRXOHLeXqGFuzarFjVo/nAsYtG7X3bmdpBdymrtELW/w4GUXN0jJZqRnqTBFV3x2CPiN7oItwQhMfIyw1f+vfZiOL2ZHdCaITM8L9J1syxcEfUwuo0yv9FVpwZ3w2z5MyuSKBQHeINnc//4QkINboh/djdNKwlBMOL98eNSYCAyYNuITlnAE0ifcA1UFAf8tKIO1LLGId/bnw6gaZr6eKQpSTC0+5J40N+1VI+4bCYvjV99o5+da480OWrUjEPo87O6InFdo9XRIL2X64wxexvYQywDUSTLV+DAXP59tYtd7Mk0jlnkInEw27W+ANqbJjbMLgMpkxmuDx7NbiTywd+qj6QIdaEP/skSi+N8cIFhbShcSRZTXruwqIA9Vkd+5w+/Vryb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR06MB6849.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(52116005)(366007)(38350700005)(43062008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnNER01GaFh4US9pNUZTeXBSMHFJLytKamYybkZUL3NJN0xzUWd0UDVlVFNG?=
 =?utf-8?B?YkhpTk9BL0dEYzVyZHZkME5zK2o4a1pqTzJCblZMaGcybHpYRVZSQjdBTFJD?=
 =?utf-8?B?V0txUkNhb1hqUW1XRVRQQVVQQmR1RldwRHQvSnhVM0d6YjJMS3JZNnFaK0Qy?=
 =?utf-8?B?bTJkV2tPZjJxZ3NDWDB3M2oxQzNnYjFzMHo4dkYzNTdVSVlDdWhkZkFsUFBp?=
 =?utf-8?B?Z3JvUTY0Z1B0N3JhUkc5VmRnZVZabzNPUTdoSnc5OHpmOWhCcXpSR1V4S1Fv?=
 =?utf-8?B?OU1POGwvM1dRaHVJWWpKQlc0dHNGeEhxaTFSRkFmVEZmV2VsSXM2WWJHRGRx?=
 =?utf-8?B?Vnh4TTVqQnBlejd3ajBpdEZ0VHJWaC9BaEJrRzVmZW9ZSXMzUG9icjNJcmkv?=
 =?utf-8?B?ZkNzM2tobWZ1ckdaN0Nndm9aNzFQNncrUHhxdzE1akNzQ3g3L2hYODRURTMx?=
 =?utf-8?B?SmM3OXkxcWc0Y0ZodzExQkUwd2hqdDBPcWp6UmxXZ2RSbEw3SkFvVEZxbm9F?=
 =?utf-8?B?MGFhWjd0R2VaOFJ3cUVCYS9raUc2U0lFa2VQazlkaDFaRDEwUmk3QW5VYXhO?=
 =?utf-8?B?RTAyOU40eFFhNUpOQ1kwOHVnQmZzQVJGSVphU1pKZUlhMkltQnhNa3J1NUNX?=
 =?utf-8?B?am02YUJNSkljY0ZXMHdyakprajd1VThDR09HOExoQnB6WDl4ekgxRUVrT1di?=
 =?utf-8?B?YkFkc3crUXNrelpsTVg1Tk5NMG12WWVtdStIdU5iTElYS0M3T2dybHl5NmJD?=
 =?utf-8?B?cWN3N2NLbVBpeTNVNFZOLzhQSUt1YlBhM2l2dEd4V1p6QStwakJHdVdyTEgz?=
 =?utf-8?B?cmZ5TVpMaFdGZW5JWllhODJDM3MwTHBON1NsS0lVYksvNHcySVpUdnYwY3RU?=
 =?utf-8?B?Z0lLM3BZUWRheEsreUF4THhkaER4VXJWTWlWc2FJK1pUdkNOekJUSTJ0M1V0?=
 =?utf-8?B?SGprU1FmU2J1OXBORmU2bXo0Wi9HejV5dGQ0M29PLzd6dzNsZEQwY2NlM1NN?=
 =?utf-8?B?L1JNem8zeGpVR2NXNW1Wck5tSTlTYUVsRFkyTDU5SlloRi9RSWNjNVFONThs?=
 =?utf-8?B?Qng3Q3NNdlhjeFVtYzBUSTd1MTlOdXRJR0RhSUpYb1JiRnhvUHFUbnhFdWlQ?=
 =?utf-8?B?TzZYVGJnajJXZ2xyS1pBbDJ2aklocncxRVBoK3dCWGVFOVB0ZTI5MDk4dHFk?=
 =?utf-8?B?c09BMkcybEhYWm9mTks0WnBkdjR0Y3pmTzdibllPSkorSUVFRjNTT1NUN3B0?=
 =?utf-8?B?VVp0Qm04RS9kMERlU1FWajcwY2QreVFOcmlKOWV4QWdseEJqMTBMd2VNV1pN?=
 =?utf-8?B?MUxPNjN2bWZkUFBJVHc3WHhRZlo3Z0xZVnE5UGpSeGJCYmpUTUJ6MGlzNkJE?=
 =?utf-8?B?SSs0eExCV1IxK0E0NC80ZGk1ZW5oUUcvQ2pLYXdZUGJ1Y3hiUExBdUdxUWcv?=
 =?utf-8?B?Sk1rdnRQeXF2eWxZTlhMdlVrdVVlRGV4YzZnb2U0SWFlWDdLTkhZc3cxRWtq?=
 =?utf-8?B?OXVOL3RUbGhOMmVLK1JCSjU0MFNWSExlUWtPZUUrZlFLdTFFeHAzclIreGVT?=
 =?utf-8?B?T2o2MGZkenZ0dlRNVEZ1QnFYZXdRZ1VoOWptUTZjaUJQbXhCc0tkVGxKalRw?=
 =?utf-8?B?bE5qTnNWb0MvQ09sN2RyMGo0c0VPV1BaQ1gxdnRnK1B4RGo4dU9mN2ZFSWxS?=
 =?utf-8?B?WEJlb2FwVllPMm1lVzFLaHFrSWVXV2hCRlVtYzhXRUhOTjRYMWhZaXdwY251?=
 =?utf-8?B?LzVIV21wTmZnb1poV0xUZjRMWFF1aVdRb1N3MytRamxtN3BRSXRqdDN3WWpN?=
 =?utf-8?B?c0dPVFdHNk1XemgxMHlZOFZNTkl3VzZRQU5meTRQU2YzWk4yUXJlb3VLVXUx?=
 =?utf-8?B?eENXay9WQmZKWFZUbUo3c3VUR2o3bnEyQzJtL0tYcEI2YUJDWlg5aHhlUjB5?=
 =?utf-8?B?cmxEMDdrdklvcEpoNXN3Q1hjcXlDa3U1TXVIREMxSFVQdVJaTHpOK2E5QU10?=
 =?utf-8?B?SWlySnFDOVFDMDVPMk5kcDBRV3FuWGNQZm1qVjkwT3hFaERmVVRkQkhjREVp?=
 =?utf-8?B?TFFub0JzOWgyeldUQ3E0c1FyRnVZS3hYK2ltK2h1VWJuS1BNYXN1S2k3TXFa?=
 =?utf-8?Q?XS6dJwW1X7Aj6+DS8/iQuHmFy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58e6b94-d9fe-45e9-148a-08dc5d37c7e1
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 10:35:34.0680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBRtQ+xFfGqb5M3au0AVIjVurho5rR6aPR/GshfjeY9yGWMRTmH4iAPOI69QGDxEVMbmy5vsJKEXOaB4938xYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6629
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



在 2024/4/12 14:39, Christian König 写道:
> [Some people who received this message don't often get email from 
> christian.koenig@amd.com. Learn why this is important at 
> https://aka.ms/LearnAboutSenderIdentification ]
>
> Am 12.04.24 um 08:19 schrieb zhiguojiang:
>> [SNIP]
>> -> Here task 2220 do epoll again where internally it will get/put then
>> start to free twice and lead to final crash.
>>
>> Here is the basic flow:
>>
>> 1. Thread A install the dma_buf_fd via dma_buf_export, the fd refcount
>> is 1
>>
>> 2. Thread A add the fd to epoll list via epoll_ctl(EPOLL_CTL_ADD)
>>
>> 3. After use the dma buf, Thread A close the fd, then here fd refcount
>> is 0,
>>   and it will run __fput finally to release the file
>
> Stop, that isn't correct.
>
> The fs layer which calls dma_buf_poll() should make sure that the file
> can't go away until the function returns.
>
> Then inside dma_buf_poll() we add another reference to the file while
> installing the callback:
>
>                         /* Paired with fput in dma_buf_poll_cb */
>                         get_file(dmabuf->file);
Hi,

The problem may just occurred here.

Is it possible file reference count already decreased to 0 and fput 
already being in progressing just before calling get_file(dmabuf->file) 
in dma_buf_poll()?

>
> This reference is only dropped after the callback is completed in
> dma_buf_poll_cb():
>
>         /* Paired with get_file in dma_buf_poll */
>         fput(dmabuf->file);
>
> So your explanation for the issue just seems to be incorrect.
>
>>
>> 4. Here Thread A not do epoll_ctl(EPOLL_CTL_DEL) manunally, so it
>> still resides in one epoll_list.
>>   Although __fput will call eventpoll_release to remove the file from
>> binded epoll list,
>>   but it has small time window where Thread B jumps in.
>
> Well if that is really the case then that would then be a bug in
> epoll_ctl().
>
>>
>> 5. During the small window, Thread B do the poll action for
>> dma_buf_fd, where it will fget/fput for the file,
>>   this means the fd refcount will be 0 -> 1 -> 0, and it will call
>> __fput again.
>>   This will lead to __fput twice for the same file.
>>
>> 6. So the potenial fix is use get_file_rcu which to check if file
>> refcount already zero which means under free.
>>   If so, we just return and no need to do the dma_buf_poll.
>
> Well to say it bluntly as far as I can see this suggestion is completely
> nonsense.
>
> When the reference to the file goes away while dma_buf_poll() is
> executed then that's a massive bug in the caller of that function.
>
> Regards,
> Christian.
>
>>
>> Here is the race condition:
>>
>> Thread A Thread B
>> dma_buf_export
>> fd_refcount is 1
>> epoll_ctl(EPOLL_ADD)
>> add dma_buf_fd to epoll list
>> close(dma_buf_fd)
>> fd_refcount is 0
>> __fput
>> dma_buf_poll
>> fget
>> fput
>> fd_refcount is zero again
>>
>> Thanks
>>
>

