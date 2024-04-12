Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23AE8A2656
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 08:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314BC10E3B3;
	Fri, 12 Apr 2024 06:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gZlZJoFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2069.outbound.protection.outlook.com [40.107.215.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F8E10E3B3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 06:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0XR39F65ksVoytq12vEEyx72TT38ecjsHwNgxL+NyAh2j6e/PVKfsG16XD2bhz3s/WxIf1SSg5/7fJOkxv9N8EFtbayONdfZlQObQGc6vKIbGELF0ukToKTSGLSu4lkGwbKCoic3Tq2a3+WZSqLfnd4N+Mp19KAxLdHbyZV1NsWuVkZCXD6EMDLONxyciRFu/+GPurcJtDMcWYGw94tPmKg4s0FYaxUGuj+seb8dN5134BbipZ4g6yW3j8QGKwm1nfIQIl8Hb173EbFFqh9DvXghFLLGKGAENcjvD7PARbnGMY+HwOAyIlTQpwbj5tE98e1+W84U3Oe+M51tCJnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUldofiIeNm15V2kV2f7DcWGL5HCR5an9ITYiTzuIEA=;
 b=j8NpKwJWuuI9pEctpnuo1WtyG+Vd9ABdsF4zvFnAu0bdaymg2ar/Km2sHVimI7HmBWrC67OaH0NqNmdyi3l1o/lNtEk2iwoCTwA8B2yC5KOVDYSkwaoUyg1ng5/4+zO4hsnoxaYPwyX1v9fzQphQR1AA51x8XTcZ36lG5aW5r0wzuRESOv8cV8mE2viVv7EBphcwG1r5PD2QfokYj0tbDMq+RBsCX6/i/94Mf5bP1poBjXPQYVLl9YizkJTz3tbR3x2g5G7HWtj/UU2snG5y9xY9mG6syj6dnFyv/V8Ym+G2ZMZ4GJ4K8lIfrXXKEcVYewerQ5TfSx5nN6T+bgmgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUldofiIeNm15V2kV2f7DcWGL5HCR5an9ITYiTzuIEA=;
 b=gZlZJoFp8Pk1YrBS64KZa6+mEGEDjWgofalSHp6rJZ10N7G9kXzqtwHD81qv0XajF2qIK2fHhTSS0Ci0SCtZ4ubJ7LxgXFc6jJHfULPJ6xqjJptJeZLtYPFdaKHpGwHkW1y9c7TwUzivnN1+QbYQ+gOqq0Wkltk8MJ7Xzf3V74+ptZ3IQRK2nUBBqG3V2bInp7tUZF0FnXmJw3k0ZriiSrA1P4Sc5aF+qf8bfYDAZoUgGDx3dDAZLfI57WUjTIMyCwoyQCKjMNd4CONU8TYK2MtGIjnkzI1h+XFtdEje7HC2kies41LD/RHzYxJxAx5Xh+Qu5yq+4i3XE2jbUuOiuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com (2603:1096:990:47::12)
 by TYSPR06MB7019.apcprd06.prod.outlook.com (2603:1096:400:46a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 06:19:53 +0000
Received: from JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed]) by JH0PR06MB6849.apcprd06.prod.outlook.com
 ([fe80::ed24:a6cd:d489:c5ed%2]) with mapi id 15.20.7409.042; Fri, 12 Apr 2024
 06:19:53 +0000
Message-ID: <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
Date: Fri, 12 Apr 2024 14:19:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
From: zhiguojiang <justinjiang@vivo.com>
In-Reply-To: <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To JH0PR06MB6849.apcprd06.prod.outlook.com
 (2603:1096:990:47::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR06MB6849:EE_|TYSPR06MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d25704-6fd9-4396-ee2a-08dc5ab8910d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFwsT5gf9KXFJ+4uMBgUiX+zzMK/FbbX88C9ClIVehCQTwUyP8lagiwUbbOqw4+mMpD1iwA+NLGWntmhXjLkPrM63Clh2OViRgNffUeuAtIYTLC3ZjOmhgG3lwBgY/BKRSPY+161DWFuOdiXFKVIIf3hG8SrEgpB1qitHmzGvk3hGCr2JCg5NVACfPXQ2OcjHbdICkuFwsJmBPLihkotTF2O8K2dPeHQ/x3QOYlqOqBM0pdFVwlcSR1O/JX7m8xt6orrtDZMU3yXgrbJBJWWakP46RdAhlBZiPkUObTRzE1yLvYY0Z3EoLG8D5BlQXt9j7ET7u5MKPjri6HQF068Ijj7e5BHLL/K2K4yyQsk4lnC2FJAI+4eo5mKhA3wD5Sitc2/TFiUD5irydhaZc+zrOVzpDarLodcJmJ9nP29QI7aho0UhtmZm7YkJZOCxSFI8aMDWfJ4OFIB0VvlNVIpjpdEdPjWlFZP43GV4FFAQlhnGZGHkwWebN8fgOhdisyFhtBg7OTcJkAO14ULWTG/Yju9UGkIlns4c0QLA3dD3ETDhdlEij7EwvmjA1QpS8bIzZuv6kEv0SYdv7CKqMwYOIDn/oNcwKl6Q/55IHRqti/QezKdSJS6TYNNetnwM81NN2baHZlxy6ohrI/cfxjP3dBR60usQvLYMrm1/ta0DGusx691VE2/pnZ+bXYYoliejZPY5gcfphhQs8pxzQiALNo9nh3s3xSQ/n1S/4+glHRyMF3WtDmJaJBWfGOV2KAc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR06MB6849.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(376005)(366007)(1800799015)(38350700005)(43062008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRqWG9YSkVLK3A4NGFOOEdOdlh6eUV1Z1c3ZGJ4SVcrOTljNkkxblc1ZU9q?=
 =?utf-8?B?WWJjOTV5VTdmUEM4T2dNdjZGTi9YRW1xZjFZU0FQb21OV2ZxR1BkYzJmdVVJ?=
 =?utf-8?B?VDBURjczSlIxcCtZT0xaZk13OHQyS0JFM3BJL0dDK0FIQzltc0RVQXFncVhN?=
 =?utf-8?B?KzlDdVpCOEMvMjhoeVhyeHJ5Y3pkUm9tczR6dktPY2hEQjc1VDNXRU92S3dx?=
 =?utf-8?B?TEZmTk4zd2F5WUUxUXMxUThSelJSMU5FV2M0ZkFsMkkxVzMzQ2Nxb2ZQZ1Qy?=
 =?utf-8?B?NVBDK3lwRUx1SmlUQmhaYXhieTlEcFd6NGMySjJTT2pTd1pDNVk5Nnl3YTUr?=
 =?utf-8?B?dUxUbDdHZ2h5Skd6OWEzdGFxNzZ4Q3VyMGVxcHZZTDhTWUZibzMxak5sekg3?=
 =?utf-8?B?N3NMSU1zM295ZTJkdWRIM3JOanJhOFVWV3ZOQnpRNWtRZEloSVU4MGd1TFRJ?=
 =?utf-8?B?NTdmMHZ4QkovWXhCRUloT0lBdHVTSS9GVzljN3Q0QUFBeHJPMGNUbnN0UEY3?=
 =?utf-8?B?a0E3a0tKUVo3ZGVhUjdKMnQrTFErZHFna1Vkck5kTmRmRExRbFQyY0swVk55?=
 =?utf-8?B?TjdsU24wZDdTR1d2Q0FyelN3Z1N1N3JrWjE4eWdaZ05ka2k5bE9JTFlrRjNH?=
 =?utf-8?B?d3JBNisvRFZDWHR6bGZhemNsSXJPL3F6bGFHM1ArbW1BOHdaenVaZnFaNmZr?=
 =?utf-8?B?MVJ5VHFzVkFlRzhvc0hJV2V1S2ZpTUdlTWVxa1NjaGQzVG1ra0Z6UGlIblIw?=
 =?utf-8?B?TmtwU3VkYUpmNmRuemw3VlF2MXNxV2hScE1lQXgwbU81WVRTdE5INDlWNyt1?=
 =?utf-8?B?Zm9wYXJ5SWl5QVQzNUdWYzl4QXdNTm90RENWSitGV1AvNFJZaDZodm5Yc29a?=
 =?utf-8?B?cEowZEJxaDVyRnQ1Q25sbEdXZkNqZUUrZjNveEd4bjBzQm5YMmNHdmZ2TTI1?=
 =?utf-8?B?dHlqU2RrRVU0YjZaRmVRdUUvdHQzSVRRdmJIQnMvdVVwaUpVbnVwM3ZsNits?=
 =?utf-8?B?TUlWYWVwT29iYktOMm12ekpKWVhwREx3bUIreGttZFZBV3Yrb0U0OWNRd0lB?=
 =?utf-8?B?MXAyV1dFRjg5b3VlYWtFcFJUNjZCOVM0R0F4QUVBRUNoUEZpT3IwbHQySVlr?=
 =?utf-8?B?N1JaeDUweUN0amhKcE9vZlA1RWFBNzNUdXBQRDVsanRQOUdsTEJwMWp1QU9t?=
 =?utf-8?B?dVBQM082OWFRejdWWVFIOTFYUyszMVZMYWtkUXIxVEpWS2JrRTlkMXF5QlQr?=
 =?utf-8?B?blpHZ25DbjdnQTgxdlh0MWpFRlhWOHl5WUJVRjhCcEExYUZvanEydWFNWmtT?=
 =?utf-8?B?UjRjODFzalpNZFJNcWYxdkZRTVY2ZTBGbEs3SldxN1RhMDV1b3RTeVVBcWQr?=
 =?utf-8?B?czFyNmtPMHNYVGgxVnZtU3NrdS9YM1ZRbmJWUjIrZHBrY2FpWkNVQVVkVFp0?=
 =?utf-8?B?dDQrRkxsVFFkZGxGQUczRExkWW1nWW9oTkZvK0JnU2xtTVN1dGJnbHpSelZX?=
 =?utf-8?B?cWYyOExXTllsUm5aaENCZFRzdml5bmpqUitJaWNsUW9hU0tBYlJrditweFVZ?=
 =?utf-8?B?dUxxYjJ3WWZVWm1MSldpSHNIM3hTL1gxUHdQS3VNU3d5OGhOM1A4bFJMKzFP?=
 =?utf-8?B?QVJOWGJWd0pSOVJEdzBwckF6UkhQeno5S2xRbVF0RW53Y1IvWWdUODFKOWFq?=
 =?utf-8?B?TFVWSU5NaFFBK2NJc2VMYnpyRjduald0YmtpeVJQOVN4Qk5rU3RHbHl2Y1R3?=
 =?utf-8?B?b08zbDdTbi93cHM1blB6aDFsNEoyZ24yVzJYR0diZFp6cDdVN1NYMHNSSVcx?=
 =?utf-8?B?WlNaUFdRd2hSVjhmb09MUnhlaTlVM2NVMmw1Qk1pU09ORkRDZDJoVG1BV3Zp?=
 =?utf-8?B?TWhwa1ZWcFlOcEluMnhjTElnYzZGSUUyNXAzMVdDSzNvUnNtZ2dibmMxNVZ2?=
 =?utf-8?B?MUtESkRkZ1FaSWt3b01TcHZyNnFaZEFELzVWamVtN2R6elYrMXF1QjhGU2VY?=
 =?utf-8?B?Q1I2ODA0Q1BJM1lkMmN4SEs0SGZUQUMzbkZlNDVFMzVNSW9yYWtvM1ljdnlT?=
 =?utf-8?B?dnFVRGhNM1VsYitwdUxQTkw3ZFd2U0RGWmpTa0QzZnBBSHI1by9IN1RoalNC?=
 =?utf-8?Q?0JP+jc5bpc0N1Zxxe0kf9sjJx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d25704-6fd9-4396-ee2a-08dc5ab8910d
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB6849.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 06:19:53.5302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3C6csJJXugUxK0i0fbRUjA0wI3Vt2rNs3EMgs5+Wc8UUCJf6yjXgE7EMhrPKhUG1qxsyIQ4ERheUZnwBXydiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7019
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



在 2024/4/3 2:22, T.J. Mercier 写道:
> [你通常不会收到来自 tjmercier@google.com 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
>
> On Tue, Apr 2, 2024 at 1:08 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 02.04.24 um 08:49 schrieb zhiguojiang:
>>>> As far as I can see that's not because of the DMA-buf code, but
>>>> because you are somehow using this interface incorrectly.
>>>>
>>>> When dma_buf_poll() is called it is mandatory for the caller to hold
>>>> a reference to the file descriptor on which the poll operation is
>>>> executed.
>>>>
>>>> So adding code like "if (!file_count(file))" in the beginning of
>>>> dma_buf_poll() is certainly broken.
>>>>
>>>> My best guess is that you have some unbalanced
>>>> dma_buf_get()/dma_buf_put() somewhere instead.
>>>>
>>>>
>>> Hi Christian,
>>>
>>> The kernel dma_buf_poll() code shound not cause system crashes due to
>>> the user mode usage logical issues ?
>> What user mode logical issues are you talking about? Closing a file
>> while polling on it is perfectly valid.
>>
>> dma_buf_poll() is called by the filesystem layer and it's the filesystem
>> layer which should make sure that a file can't be closed while polling
>> for an event.
>>
>> If that doesn't work then you have stumbled over a massive bug in the fs
>> layer. And I have some doubts that this is actually the case.
>>
>> What is more likely is that some driver messes up the reference count
>> and because of this you see an UAF.
>>
>> Anyway as far as I can see the DMA-buf code is correct regarding this.
>>
>> Regards,
>> Christian.
> I tried to reproduce this problem but I couldn't. What I see is a ref
> get taken when poll is first called. So subsequently closing the fd in
> userspace while it's being polled doesn't take the refcount all the
> way to 0. That happens when dma_buf_poll_cb fires, either due to an
> event or when the fd is closed upon timeout.
>
> I don't really see how this could be triggered from userspace so I am
> also suspicious of dma_buf_get/put.
Hi,

Panic signature:

 > list_del corruption, ffffff8a6f143a90->next is LIST_POISON1
 > (dead000000000100)
 > ------------[ cut here ]------------
 > kernel BUG at lib/list_debug.c:55!
 > Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
 > pc : __list_del_entry_valid+0x98/0xd4
 > lr : __list_del_entry_valid+0x98/0xd4
 > sp : ffffffc01d413d00
 > x29: ffffffc01d413d00 x28: 00000000000000c0 x27: 0000000000000020
 > x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000080007
 > x23: ffffff8b22e5dcc0 x22: ffffff88a6be12d0 x21: ffffff8b22e572b0
 > x20: ffffff80254ed0a0 x19: ffffff8a6f143a00 x18: ffffffda5efed3c0
 > x17: 6165642820314e4f x16: 53494f505f545349 x15: 4c20736920747865
 > x14: 6e3e2d3039613334 x13: 2930303130303030 x12: 0000000000000018
 > x11: ffffff8b6c188000 x10: 00000000ffffffff x9 : 6c8413a194897b00
 > x8 : 6c8413a194897b00 x7 : 74707572726f6320 x6 : 6c65645f7473696c
 > x5 : ffffff8b6c3b2a3e x4 : ffffff8b6c3b2a40 x3 : ffff103000001005
 > x2 : 0000000000000001 x1 : 00000000000000c0 x0 : 000000000000004e
 > Call trace:
 >  __list_del_entry_valid+0x98/0xd4
 >  dma_buf_file_release+0x48/0x90
 >  __fput+0xf4/0x280
 >  ____fput+0x10/0x20
 >  task_work_run+0xcc/0xf4
 >  do_notify_resume+0x2a0/0x33c
 >  el0_svc+0x5c/0xa4
 >  el0t_64_sync_handler+0x68/0xb4
 >  el0t_64_sync+0x1a0/0x1a4

It is caused that the same dma buf file released twice in short time, so 
it should be race issue of dma buf release.

Below ftrace log shows the procedure how dma buf release twice:

Line 715473:        android.display-2220  [006] 22160.660738: bprint:    
__fget_files __fget: [file: 0xffffff8ab9e57b80, dmabuf: 
0xffffff8b1baa6a00, count: 0x3] call:(('do_epoll_ctl', 
356)ffffffd4ad46411c<-('__arm64_sys_epoll_ctl', 
112)ffffffd4ad463dd8<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44<-('el0_svc', 
36)ffffffd4ae57ffcc<-('el0t_64_sync_handler', 136)ffffffd4ae57ff44)

Line 715475:        android.display-2220  [006] 22160.660739: bprint:    
get_file get_file[file: 0xffffff8ab9e57b80, dmabuf: 0xffffff8b1baa6a00, 
f_count: 0x4] call:(('dma_buf_poll', 760)ffffffd4adb685c8<-('ep_insert', 
1120)ffffffd4ad464bcc<-('do_epoll_ctl', 
1196)ffffffd4ad464464<-('__arm64_sys_epoll_ctl', 
112)ffffffd4ad463dd8<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44)

Line 715477:        android.display-2220  [006] 22160.660740: bprint:    
fput_many fput for dma buf file[file: 0xffffff8ab9e57b80, dmabuf: 
0xffffff8b1baa6a00, count: 0x4] call:(('dma_buf_poll', 
1104)ffffffd4adb68720<-('ep_insert', 
1120)ffffffd4ad464bcc<-('do_epoll_ctl', 
1196)ffffffd4ad464464<-('__arm64_sys_epoll_ctl', 
112)ffffffd4ad463dd8<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44)

Line 715479:        android.display-2220  [006] 22160.660741: bprint:    
fput_many fput for dma buf file[file: 0xffffff8ab9e57b80, dmabuf: 
0xffffff8b1baa6a00, count: 0x3] call:(('do_epoll_ctl', 
652)ffffffd4ad464244<-('__arm64_sys_epoll_ctl', 
112)ffffffd4ad463dd8<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44<-('el0_svc', 
36)ffffffd4ae57ffcc<-('el0t_64_sync_handler', 136)ffffffd4ae57ff44)

-> Here task 2220 do epoll for dma_buf file twice, and the fget/fput 
match. After this the file refcount is 2.

Line 716521:        RenderThread-3470  [005] 22160.664236: bprint:    
fput_many fput for dma buf file[file: 0xffffff8ab9e57b80, dmabuf: 
0xffffff8b1baa6a00, count: 0x2] call:(('vm_area_free_no_check', 
140)ffffffd4acf5021c<-('__do_munmap', 
1572)ffffffd4ad306eb8<-('__vm_munmap', 
216)ffffffd4ad3095b4<-('__arm64_sys_munmap', 
68)ffffffd4ad3094c4<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44)

Line 716525:        RenderThread-3470  [005] 22160.664243: bprint:    
fput_many fput for dma buf file[file: 0xffffff8ab9e57b80, dmabuf: 
0xffffff8b1baa6a00, count: 0x1] call:(('close_fd', 
376)ffffffd4ad40b404<-('__arm64_sys_close', 
24)ffffffd4ad3bfb1c<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44<-('el0_svc', 
36)ffffffd4ae57ffcc<-('el0t_64_sync_handler', 136)ffffffd4ae57ff44)

Line 716527:        RenderThread-3470  [005] 22160.664244: bprint:    
fput_many fput for dma buf file ret: 0, [file: 0xffffff8ab9e57b80, 
dmabuf: 0xffffff8b1baa6a00] start to free

-> Here task3470 do unmap and close(fd) then decrease the file count to 
zero. Then start to free file buf.

Line 716566:        android.display-2220  [006] 22160.664424: bprint:    
get_file get_file[file: 0xffffff8ab9e57b80, dmabuf: 0xffffff8b1baa6a00, 
f_count: 0x1] call:(('dma_buf_poll', 
760)ffffffd4adb685c8<-('do_epoll_wait', 
1020)ffffffd4ad46229c<-('do_epoll_pwait', 
84)ffffffd4ad463b70<-('__arm64_sys_epoll_pwait', 
276)ffffffd4ad463d1c<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44)

Line 716568:        android.display-2220  [006] 22160.664425: bprint:    
fput_many fput for dma buf file[file: 0xffffff8ab9e57b80, dmabuf: 
0xffffff8b1baa6a00, count: 0x1] call:(('dma_buf_poll', 
1104)ffffffd4adb68720<-('do_epoll_wait', 
1020)ffffffd4ad46229c<-('do_epoll_pwait', 
84)ffffffd4ad463b70<-('__arm64_sys_epoll_pwait', 
276)ffffffd4ad463d1c<-('invoke_syscall', 
96)ffffffd4acebe00c<-('el0_svc_common', 
140)ffffffd4acebdf40<-('do_el0_svc', 40)ffffffd4acebde44)

Line 716570:        android.display-2220  [006] 22160.664427: bprint:    
fput_many fput for dma buf file ret: 0, [file: 0xffffff8ab9e57b80, 
dmabuf: 0xffffff8b1baa6a00] start to free

-> Here task 2220 do epoll again where internally it will get/put then 
start to free twice and lead to final crash.

Here is the basic flow:

1. Thread A install the dma_buf_fd via dma_buf_export, the fd refcount is 1

2. Thread A add the fd to epoll list via epoll_ctl(EPOLL_CTL_ADD)

3. After use the dma buf, Thread A close the fd, then here fd refcount is 0,
   and it will run __fput finally to release the file

4. Here Thread A not do epoll_ctl(EPOLL_CTL_DEL) manunally, so it still 
resides in one epoll_list.
   Although __fput will call eventpoll_release to remove the file from 
binded epoll list,
   but it has small time window where Thread B jumps in.

5. During the small window, Thread B do the poll action for dma_buf_fd, 
where it will fget/fput for the file,
   this means the fd refcount will be 0 -> 1 -> 0, and it will call 
__fput again.
   This will lead to __fput twice for the same file.

6. So the potenial fix is use get_file_rcu which to check if file 
refcount already zero which means under free.
   If so, we just return and no need to do the dma_buf_poll.

Here is the race condition:

Thread A Thread B
dma_buf_export
fd_refcount is 1
epoll_ctl(EPOLL_ADD)
add dma_buf_fd to epoll list
close(dma_buf_fd)
fd_refcount is 0
__fput
dma_buf_poll
fget
fput
fd_refcount is zero again

Thanks

