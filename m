Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 955068944DB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 20:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DED810F3BC;
	Mon,  1 Apr 2024 18:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Y7zm6LpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2122.outbound.protection.outlook.com [40.107.215.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153C410EF33
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 06:52:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4tKvYr1qtWQcop3pqNhWQQIghaSyR7JSI8tudRlkubW/HVrG0UULtVmBf4Rj/eOtWx4sWzCGOlqAxYjqsjy2NF0AQxqLteFtILvWUmJhfwOHoi1uTxO7SItg4VnuXQkzQCHV6zI1VnvsCEL0V9hI8La3noxRjVS0mXaEBqcOZ6EEQf1s4go4gPn8oJkL8feORVOED3WaGtoSq8PjXhWxT4IBAQYNmy7v7xQ8zKiIUCL4RuIgFgGqV12VHoKGSAAqpRVEz4IuCen0JyGUxj6IKdBmXfweXwxj2ZSrF4AIK+zk2EMdHvlao41T8Q6Yv8Knk+0n16/fDzMqBCXq0ibuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ApYt4SnRtaIrR7pKgG6yBAduNfALorHyzL2YbOXBPw=;
 b=NjK5+tnGBBx/pyQa6DlVHuCh3MiDw5Ujv2jRXwnhLOc7tIxS20d1PmViyxCxuLJq/YShS7oKMLp0X5TEuEMayUVR921E1q0bhpX2DSRfYZedPyT3ej5EtNXEj/rT4iCz+4L4d9ou8/8AQRLynoNTyx2KpkYT13r76mfUbCX2ewBb3+iLxsfmcJVtLSUbjhRSVlVOlQvsOM+O3BnjPJIToxzOHMJij0D1DYQmpl4KkYPfaEKsLh6MB3eyPVfJnNGddayOARqwaMRTQlRSrQXClY3dqdbzvJszJ43bDon+CwjSI1h58F0ZSxReKH5NF+B1TjtparAKdGQH42Kzf2Hf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ApYt4SnRtaIrR7pKgG6yBAduNfALorHyzL2YbOXBPw=;
 b=Y7zm6LpKlM+jwjomHA2B+YqCHnLl3eYnLmKSy+SyWsqG6M7sBwsK8wHkB9QBba9vOpkrpUa/EwZmp5AW8dqV+5hBusb3+6SxUo9iIVFcpmbiUPKCcNci08MW2TjV5szEfnS1lTs918n9EEU3YjU5F9CbnfuWDhNo5IuDgpkwepPNhaVDLnVK5j0/VdxT2crAfAg5uVPh67RCFuytV2/Fg4V9UBAgPf/oaYBYTh/Oypm2wSzgy43al+eeAEzJplmOXbL5N2A7LtxMcZqO5qQuOqlOIwPXf4MSipIxOJKf31ejbXQwlZb7henesA5sMe4AegSnz5a6u+KO3LDlxcnEFg==
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 06:52:05 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%2]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 06:52:04 +0000
Message-ID: <0687994c-82b9-4395-8777-f15b101650e8@vivo.com>
Date: Mon, 1 Apr 2024 14:52:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <CABdmKX1swVO1=6cs+CW_g2g4g7woB5-Ks1gBzCA+iLcvpLmkvQ@mail.gmail.com>
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <CABdmKX1swVO1=6cs+CW_g2g4g7woB5-Ks1gBzCA+iLcvpLmkvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To JH0PR06MB6849.apcprd06.prod.outlook.com
 (2603:1096:990:47::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|SEZPR06MB5624:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hD9m73hfzcE5yPi76/wFK6+Kwwg03hbop00gJt4mxuaIPXZOAugFkIFo0QIw5u2ZSdP3woWQxfhkvmAX9B/55M6GPhzMcWps/qKgxlFlVbUgcIHfUalEBYQ2g+R3tiS4kQOmKH2nPe/HAoLMeMp3E0D5lZ78WFrLU0GcDbne1mbFWI0Mq7AuE4pt82R+da5oUWocGkxePlBAu9CTSaXaqKu3U/C0xjMYybM5fQT2MeOB7RLNM5dQ0UKDQonntiYHgZrxYI1je+ITVZS5Cq3S+4Kq5Ywup0ccgJVqfRh5VpCm2S4p/77j4ynDJK5mytT5IYbfQ/77Mj8XVK1Dw4IAiJlTmHKE6DF0nmwXyoe+H6SYHe0HtFkl8BRfRPO9BDqt+49fJ4ANVcr+yKC9L7KLBxLDs9aNBuib12dJCzaRpyTG8Kc1s7cAlOwpfsTUoUE50K5GAajl57SiODsDpOE5Yof6duQOGyxyThmFU/Bx3gByVUUCYDx2u8wcHFuNWCgdjH1GhRHHGo5kbu40efT7Tn09vEmZLaqkUh9ONChPyPcLsI4UrlCKvWfth88GKHrWitS4F1rooQH1Og6s6egNN7Moi1Aa/RmTOJ8D8Yiryc5evtr5PNvGK8S6KgPnNXEJFRJhUYMnDVjWGjt5mVF50Ud0NkGAH9kLbqRyb0umrjBIrr6D6npTRKfGtVj5znvHqCC1H+1xIz05YNQHdh2op31WSmMYwXxFarKgcj49AEC05CN8aHhiIsM8e0ns/f8S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR06MB6849.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005)(43062008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEtGVHduL2IzOTUrQWNkV1dhL1F2aVpnOWFIbm0wTTh3LzdIaEUzNGJRRjlF?=
 =?utf-8?B?cmtGUnUwWWh4QjhtdlhXbWNkeWYxd3FHdVcyam05Z0svaWRGUGlpcC94aUI0?=
 =?utf-8?B?UXhFaXM0ZjVSVXdEdFZzd2xOamRQZjE2MW4rcHFWaHJxWE42Z2M2VTY5aHlq?=
 =?utf-8?B?Z0Y2UVI3dmk5WkNHSW93czJ1NG51TE5RMkFPQTIvOHl4U2krM0hTNWljU3lE?=
 =?utf-8?B?NlBlUjJhMVIvWVJJcTBVS1hhYUZkODY0Rzc3bDB0eldNN1QycUFVYUdHOU5S?=
 =?utf-8?B?Z1BxU1pONWNUTWRkZmc5a1YwNWI0d1p0VnlXcjU2a0NNalBSbFJKSm5JN2FY?=
 =?utf-8?B?TjBOcFhtSVVoS0Y1bWswdU0vblBqUUZ6MkhFZUllOHJZOTZrTkMwNlFycUcy?=
 =?utf-8?B?Vi93eFB2SURYK3VGVW40OG0yTjhQL05yZm1VRUExSnJLeFcxYytaVS9Nb2VJ?=
 =?utf-8?B?N1IzemtNRU5TcjJVckpwZEt3Q3hWQkZIZWQzM25ETEtwMC9UWkdVOEZVTWVR?=
 =?utf-8?B?Q2M5ZTRZdXNMaGp1WHM4RkwrSWxsVUxaZ1Jid3hZNGZqYlRhWS9QV2pySWZh?=
 =?utf-8?B?Q0F1L2Z6UTlidHh0d2d6OFhtYWtmUWw1YTJVMk1NdWlidGtUdk5ZbjFuRGZN?=
 =?utf-8?B?MjQwUTBVWUE3NHM5c3FGeGxKOFFWWERkaDNDaElyS3BVS2krQStMaE1XL1ow?=
 =?utf-8?B?VDl5cHV2bWFtNmJ1NktqTUpZZENhUnppQUxVdEVYQ0NqUVZKT3JjVnhNbjAr?=
 =?utf-8?B?QXlYeEZuU09tM3pxZzU1VG85aHM2Nmt5dkpRODc4Nko1VVN2dy9hck1VVlpO?=
 =?utf-8?B?LzBEVnhteUdVeXpyZEJ1UFRwdnh6MUZ1b1RSM0Z6aU02YW9OaU1kVXlhNWNF?=
 =?utf-8?B?R3R5ZHhzWG9OUmlySllIUnhJdVlTaGx2K0lJeDYvaGRzRG91eXp0TDN1M2d3?=
 =?utf-8?B?NHJ3Q2JubVdXYW13Qk9QQzdDUFVUUEtxbEpGWFZJT2l1YlRxL1dLMlQ5MFJQ?=
 =?utf-8?B?QWZjNzZJMy9ON3A4aDVhNlNDSERpNGo5c0pZR24zZWxhMC93ZTJRNnlaa2w0?=
 =?utf-8?B?Zm5LeXk0eTFnRW9uay9XSjdRdzloODMyM3RwTkpEeEt4T2hUZjNWVVZnM0Va?=
 =?utf-8?B?ZDNhcjF6ckVicnpDc2hLdnFwZVNiaktqc0VjU0tmQStjK2xVdTYvUGpQcHlW?=
 =?utf-8?B?RDFucUsvT25SS3BKM3BLTWNUd3FIQnFpa2Fva0hZa1YyTElXblJoRGRqRk1J?=
 =?utf-8?B?R1kreFVTRmVOakhub1dMVmt1TXBIQmIwSGNQRnpTOW0yR3pLbE9ycXdXL1V6?=
 =?utf-8?B?TWM0ZjJ0aXpQMEZQb3NSVTkxWEpZbHZ0U2hheGxiYktxQ0haMGhubE9VNVFX?=
 =?utf-8?B?NEdScnl4eTQxWFU0NDhXTkNJQ01yQnFmZFZnUlpTMVZQUk9JdUNyYXFGOGlU?=
 =?utf-8?B?YlFvZFh3bzVzVFBUdkxLeWo4dkI1OVVzVEJJY1Y0a1R1YXd1ckRjZWZyR09o?=
 =?utf-8?B?RjZiek52SktUTkM4ZTk1WGNjajhkNDNCSUxkT2c0RWJhUHMxTUZZRXRzYUxq?=
 =?utf-8?B?TkFoQzBnSU9uTGpneHJoaTdFbHJ3OGQ1UmpSbFJ5SmxWRGtVKzY3RjRET2JR?=
 =?utf-8?B?YkU1MFR3Q1FWRnROUElDK21WODJQYWV6aU1BYWZaZVkycmdFeVd6cnoxT1pm?=
 =?utf-8?B?aGF3OERlWVNNVnV0QVpJcVFRWURUUkQxOGYwR0dQRG12Y2JqY3hLNkZZYzF5?=
 =?utf-8?B?Znd6K3ZqOTBSbDRxeTJreDlkVkxGeTNmRUhrMzBQSkYrNkJCaTZ0SksyNjdl?=
 =?utf-8?B?ZVl3VUV3eE4vQ0JMTEM0bC9MRDhvQUppRTgxQjE2b0tOaks5WFBrV2dzRlFN?=
 =?utf-8?B?NTluZVNZMzMwMURKMGFzcUd0Qm96NFY5bVZTK01wSnpxUWRZRmtsSGRVUCtw?=
 =?utf-8?B?azBJc0luRk9Fbk5aaW9xaktzaW9PUlRMQU42WGJyaFZPSDAwSGxncG5jOXY4?=
 =?utf-8?B?RllBZUhsZnlxOURlRFhaZDJjblV6akRCS25Kd0xUekdiZjVjcm5kYm84bXRM?=
 =?utf-8?B?d2lRNExka3VacHpnMnlIaExpM2Z2OEdsRXVuVmx6UkdpTTk1VzB6SllEM1hU?=
 =?utf-8?Q?EOWWzvcOjszGLlHP7g4RErdEZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fffa798-2f7d-4efd-a521-08dc52183d5b
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 06:52:04.3860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDGKKq7/2inqWCIzA3ATBMjbuUR8aXn+1oKnJ1VDxZQX7nq6KKifc6DAxadwDohl6GelS+BYbehY0bas3HmJ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5624
X-Mailman-Approved-At: Mon, 01 Apr 2024 18:26:39 +0000
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

Hi T.J.,

> What is the most recent kernel version you've seen the bug on?
The latest kernel version of the issue we discovered is kernel-6.1.25, and
kernel-5.15 also reported this issue.
> You are closing the dmabuf fd from another thread while it is still
> part of the epoll interest list?
Yes, we found that threads related to android.display modules performed
an operation to close this dmabuf fd while it was still part of the 
epoll interest
list,  but the specific threads were random. So I think this is also 
issue with
the logic of kernel dmabuf code.

Thanks,
Zhiguo


在 2024/3/30 7:36, T.J. Mercier 写道:
> [你通常不会收到来自 tjmercier@google.com 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
>
> On Tue, Mar 26, 2024 at 7:29 PM Zhiguo Jiang <justinjiang@vivo.com> wrote:
>> The issue is a UAF issue of dmabuf file fd. Throght debugging, we found
>> that the dmabuf file fd is added to the epoll event listener list, and
>> when it is released, it is not removed from the epoll list, which leads
>> to the UAF(Use-After-Free) issue.
>>
>> The UAF issue can be solved by checking dmabuf file->f_count value and
>> skipping the poll operation for the closed dmabuf file in the
>> dma_buf_poll(). We have tested this solved patch multiple times and
>> have not reproduced the uaf issue.
>>
> Hi Zhiguo,
>
> What is the most recent kernel version you've seen the bug on?
>
> You are closing the dmabuf fd from another thread while it is still
> part of the epoll interest list?
>
> Thanks,
> T.J.

