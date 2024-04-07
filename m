Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478789B8DD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69281121E1;
	Mon,  8 Apr 2024 07:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="hd59/J9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2117.outbound.protection.outlook.com [40.107.215.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA5B10F9C1
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 07:50:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2PEeAxzyCJLYJ5ZP+XCvdLv+TptfSdlrn7y12xoMNNDXJKReFvUSpy4QmP5zHN6wwSHXr0Gl5jPXcDkLAnQ7pX/HtO5Q6IcLXFwPphM8qLPu+9DE7ElEVS3xZpT8amBerVJLtvaG7PsFn6AXPnfznx58/Xz4wtYOAX8wcatiJ3ydqhzCVG8lSQ8DQT2AG7OA9X2qI6Kk0l+4KcszsUBfX1Swg2rGkaLuXeGvUM7X6UWTYuw6I4t3Td2s4x/ubIhnh/RtyWtSq7iQs+YxnZw2ik8x+nsm7EhSXl3HQewODOy4CePl/yhAh704JRsiSEZvnHoG9dRthnBNPXkdRDJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRIBZRHZZk7GVwQBNGmJ2/2xp/a4WyzEvW1+6hfqUuA=;
 b=MgEPi+H9IbTH10OLk1Dy5bKplmPiQz20VnnD0FTnum5FcKNHyB7haxrpBnyv5QT9U608h6YvlYWqFlHOQQdlCrJoRnBqpKueSXVuP7hRFvZGS1z/OvHMe/V+Ch3Zq49VI8VfxgiM2BHG78sskUz1dHeACWdPxwzA5LOjVJRa4vAUCbQT/vmUylBaSKtnpeMKekoOVjIC9zfon26Yqyob7FDVxK4JehXtAUt4rIyyozulT4rCKUzOjm0yK1w7+leaA1vLvj7s3bnFF0YgfNwXuYbhS3wNYtwYP3NigQuLXtvzh0N0Zbi6BmIGpt4p8cLvdq0stmT1fuAU64ImmU2kcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRIBZRHZZk7GVwQBNGmJ2/2xp/a4WyzEvW1+6hfqUuA=;
 b=hd59/J9dYV1u3BJtYiRIQj36mkv9ozZYYzW1CkJcdrgsHys1enoKeOx84ONBZmVk+P+7R7Pd5H3C3HNSbOgj/x41E/uRNWucOhJJWfX4sbDDEjR0TtTzI9/6E+jSROjzQLZavFsOsSuT0i1i8pEPBlhMw2K9Xi1ubhOjSkij+DWk7rGywKxBdu5gdnfxzvjv0n0AUxsRbyFGPR96GMmsr/VFpLCmTVMIg3YwBaUNBR+Bpp6j9aFu+whJffvHUXgUpgtCal3vPQJTKTiBRQwyGLsY0dkXKYG+7klnm6ntdqFfcHu1WLY0UbQ83i6Fx758YtiTihppU0uE7VkOtRpYsg==
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB7353.apcprd06.prod.outlook.com (2603:1096:990:a5::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Sun, 7 Apr 2024 07:50:13 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1%3]) with mapi id 15.20.7409.042; Sun, 7 Apr 2024
 07:50:13 +0000
Message-ID: <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
Date: Sun, 7 Apr 2024 15:50:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org
Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
From: Rong Qianfeng <rongqianfeng@vivo.com>
In-Reply-To: <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:3:17::26) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB7353:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FgdvjyGuShLjBYT3Cp+pWNuTySxfhA+6jesEVfTv6vqAefjMYzxytSh4DT+845xlP4o5+rhgDOEwBh2qRkvdCYt98wABK3T1iTvWl2gvc+ljzFp38RULNg6sj3Gl6RhDAY1uaSinLWr1YQjIC6BWkpH/8GuMpKgqwyzGclKUvrlKIEUyQlsIeZcEl/bOtCtLSbS/XtxGJz8t1Zj/CbdZ3nex5FZiXdbnc2wNfHZQbcl6otzQoj2sq2kwGU/KaBeLji81jtzL7FN8ogrkVLemOxz02N64JssRKBzuLWU7C10R8lEZSQU3t8oR9zbU585X7Cy7UtM3m9jIbMYTOf0DgnGXX3I/bURwfZA5TjcF5q6gHlAQtxwyGpokrNpvX/ae0BWCPGpn4ZSkGEXWfUSVOpwqOuV0aTPMg8vDkCBOzLeYWDuqKaEdCmD/xj20vJZXyLBmDui89TQG9jQHRWyl3FG3xeahSNY6uqUQyRKewRTmxVbjcenXXLuLyPnSusR6z7ycXGCiMGcRrYHhRmvDgiTf5sTdOk1Es1mC1NBxiRAZShWtwCAsyOBjNynX04/1TUx9/7Xp0a9/Jd6ZpyOlzfd4VdAdeKniikYI8etgwaG+oXxmUciFtfNzoJdEtxiF217ZqypCdjwp5IPivpU1ndU+FqlEPWu461IDyxHiQ0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(52116005)(1800799015)(7416005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmpPbm45OHc3bXJnWkxuY3lSRzVEZWRvSUFzTnp3N2FUTXpLeGRUUTdVa3dr?=
 =?utf-8?B?c0NJSk8yYURKenNnay9SN243RFFXK055SytldmZMbkRIK1pNOHJsTDhlbEIz?=
 =?utf-8?B?MmhFZ1ZPSGRmb2hhV095NXpxeVh6TWZEbUNDUWtwdDB1aEN0QVdTL3Z6NlBm?=
 =?utf-8?B?VFA1YTRtOHFDWGlrNEorZmJzQVllRzI5eURsOGhkb3RncC80NytlMFJvUUg4?=
 =?utf-8?B?em9yQ0pLNnloMlpoanprOUdlZXVZdXp5Zk5uUWtuRGtFSkNsUWJVMFZWcEtZ?=
 =?utf-8?B?dFc0V0ExMG1BMDgrTjAxeVlQa1lEUGhqK2ExV1FTYmpUODlMUTgxbm5jSnJU?=
 =?utf-8?B?TWE4ODdGV0N0M1dCSEpNS21CUUxLSStxMzllSzJIM29wQmtmVEFncHlZNVBL?=
 =?utf-8?B?QlVEcTYzeDZvQlc3K01ZaDYwbDZ0U1loaE44UmlTZ0NFWVYvbEMxNzBYdUg0?=
 =?utf-8?B?MzNObE1GZ1k3V0xHUEdlWWVyR2Y5aWowcU0vYmtGN1lUOVZHNElxYWJFMkl4?=
 =?utf-8?B?WUpIOWF0UjYvNkEzc0MyVTI2bzhVdWUzOWRsM2sxbkVvUlNyNFhxbWxJWEla?=
 =?utf-8?B?eGZxQm9jcjNudG5wVmJYNGJSWXAvN0crR1o1OXNGU3VvNm55N1dvSjZzRDNN?=
 =?utf-8?B?NXVHUmlGNCtNaW50aWQvamcrKzQyZTdSN3p0eEVma04rQ0RCYmw2WFBFcjVp?=
 =?utf-8?B?SXhPdy9ZU3pYMmtKbUNFWmpRcy9IU3lqT0dNYzE1ZElMUm1RSzdnQnZqVnRT?=
 =?utf-8?B?eVBEd2ZpMFdreGhWUSt0Vitrbm9WNXlzZ25RaTl3dVZEZ0xFbFU4c1J1VHNB?=
 =?utf-8?B?OTdtY0Nvbm9HNnFjcG1CcXByMjhyaUlEQTRoOGh5L1Fmajg2ZVdGR3JyQk5M?=
 =?utf-8?B?c1pWZ05EOVRGdUYwRUtuZVZEc2FxbnJxVnBuQ0ZObkZ1NlV6NGFmU1JzU2ZE?=
 =?utf-8?B?dWRNMjF3RFJONnB1ZzZHeHhONkRTY0tnRTYrb0txOThVSGc4UU5DYjZLWHNS?=
 =?utf-8?B?WTJVQXZ3eCthTGZtcjZqdzRNbkRNbG42Y3dRd3MrQVVyZ2xXNWptNjJvUHJj?=
 =?utf-8?B?cXNCaGFsSFFWWDZkZ0FkeE5YZ1pIaWVncml0MTBVSUdSQTVqV2ZpTWhFbkc1?=
 =?utf-8?B?TUFaNFFvVVg2TUYvMCtnZHowNFkrMndMdlpsbEZYbHhWMUE0SG91MkcrSkg2?=
 =?utf-8?B?YngvdDNIcERFTVlabUFReTdXcVlsL1cvR2lvZHRKcmhIQXlveE4xU2t0bXpZ?=
 =?utf-8?B?aHlONkxvQUpwQnRhN0E3dEtaeFdCK3hhcmNsUFJoT2dOZkFuOGpNcWsvcE40?=
 =?utf-8?B?NUhZR0FyMUNuL3JDWDFWS0FHNXlaaW9qUEkxa2VhVWRmZis2YVJZeS9QYUFX?=
 =?utf-8?B?Q3dkV1FnQ01GRHp1Rk1Ebmw2SzZzK3FnRXhnOEF3QkJJbGE0NHRHSTdkRlVp?=
 =?utf-8?B?bmdpSlpiM2VXdHFuTmFJaFpqc1ZUMzFPN3NsaHV3YllPMDB6bmliaURoVzdt?=
 =?utf-8?B?TEJSbGkxYXlaYTM1eGVDcWtDOEhqMHdHOWpmb1dUa3prSnVxRFFLc1IwWXNH?=
 =?utf-8?B?Y2o5RUh1NnZmQXhXdGhzQ3A5dzNFRzh2ZmN5aDE2M2RVdUtDeDdZdEQ0eGU2?=
 =?utf-8?B?cHFRTFlmMTgwOHBzeDdMZy96WDJva2g2NjVLMzZMMlQ1eXRrdmRZWWw3bnF4?=
 =?utf-8?B?QVk5WmF6UlFKVWlHbVpNVmFra1pYcEd1WkpySWxlaVh3T2Vvdi9JR21DUllL?=
 =?utf-8?B?TE9wYXIySzJQeElHeklIbDAxME91dklXU0pGRllXeUpvSmNab1J6Si9wbWcv?=
 =?utf-8?B?c2hlbzVVVE9KazJwUzRIWmRlQ1FyQ0VqSHdpNVJmYTFsbUJLV1NPWUp0M0pD?=
 =?utf-8?B?b2l0ZTFjdTJEUHBIMjEvYXhvUGs1VUtxVHVuVG5wM3k0YjA3OHpKakNsOEFK?=
 =?utf-8?B?MUxCL3JNQVVmMC81bmxvWEFIQzFyaTdsbHdlZWhHRjA0ZWJWMVNZOS81RlFk?=
 =?utf-8?B?Y29wb2tUbUtDam14RkJxajZZb3ZnQ0ZOby83L1pTLzRnaStVUzd6enpXRk1t?=
 =?utf-8?B?UlRpRUxUZ3VzQWlZRHpHWnlHc3Nxd3BXd3FvUWxLSEs2eTkzbVJWVWZGUlcz?=
 =?utf-8?Q?cRNFP0G7CR7TamEWblyrd/iCT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f09225-62aa-4265-2a0a-08dc56d75b44
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2024 07:50:13.1264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4wsfP7TIIFtqlbQL9t9KHmVzxmEypCatq/CxY9oZ7XsfJSVYgW2t2uyBgDVfgr7J1Xm0kUfs8dl8UjyNmC/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7353
X-Mailman-Approved-At: Mon, 08 Apr 2024 07:45:42 +0000
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


在 2021/11/15 19:42, Christian König 写道:
> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>> offset and len.
>
> You have not given an use case for this so it is a bit hard to review. 
> And from the existing use cases I don't see why this should be necessary.
>
> Even worse from the existing backend implementation I don't even see 
> how drivers should be able to fulfill this semantics.
>
> Please explain further,
> Christian.
>
>>
>> Change-Id: I03d2d2e10e48d32aa83c31abade57e0931e1be49
>> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>> ---
>>   drivers/dma-buf/dma-buf.c    | 42 ++++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/dma-buf.h |  8 +++++++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index d9948d58b3f4..78f37f7c3462 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -392,6 +392,7 @@ static long dma_buf_ioctl(struct file *file,
>>   {
>>       struct dma_buf *dmabuf;
>>       struct dma_buf_sync sync;
>> +    struct dma_buf_sync_partial sync_p;
>>       enum dma_data_direction direction;
>>       int ret;
>>   @@ -430,6 +431,47 @@ static long dma_buf_ioctl(struct file *file,
>>       case DMA_BUF_SET_NAME_B:
>>           return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>   +    case DMA_BUF_IOCTL_SYNC_PARTIAL:
>> +        if (copy_from_user(&sync_p, (void __user *) arg, 
>> sizeof(sync_p)))
>> +            return -EFAULT;
>> +
>> +        if (sync_p.len == 0)
>> +            return 0;
>> +
>> +        if ((sync_p.offset % cache_line_size()) || (sync_p.len % 
>> cache_line_size()))
>> +            return -EINVAL;
>> +
>> +        if (sync_p.len > dmabuf->size || sync_p.offset > 
>> dmabuf->size - sync_p.len)
>> +            return -EINVAL;
>> +
>> +        if (sync_p.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
>> +            return -EINVAL;
>> +
>> +        switch (sync_p.flags & DMA_BUF_SYNC_RW) {
>> +        case DMA_BUF_SYNC_READ:
>> +            direction = DMA_FROM_DEVICE;
>> +            break;
>> +        case DMA_BUF_SYNC_WRITE:
>> +            direction = DMA_TO_DEVICE;
>> +            break;
>> +        case DMA_BUF_SYNC_RW:
>> +            direction = DMA_BIDIRECTIONAL;
>> +            break;
>> +        default:
>> +            return -EINVAL;
>> +        }
>> +
>> +        if (sync_p.flags & DMA_BUF_SYNC_END)
>> +            ret = dma_buf_end_cpu_access_partial(dmabuf, direction,
>> +                                 sync_p.offset,
>> +                                 sync_p.len);
>> +        else
>> +            ret = dma_buf_begin_cpu_access_partial(dmabuf, direction,
>> +                                   sync_p.offset,
>> +                                   sync_p.len);
>> +
>> +        return ret;
>> +
>>       default:
>>           return -ENOTTY;
>>       }
>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>> index 7f30393b92c3..6236c644624d 100644
>> --- a/include/uapi/linux/dma-buf.h
>> +++ b/include/uapi/linux/dma-buf.h
>> @@ -47,4 +47,12 @@ struct dma_buf_sync {
>>   #define DMA_BUF_SET_NAME_A    _IOW(DMA_BUF_BASE, 1, u32)
>>   #define DMA_BUF_SET_NAME_B    _IOW(DMA_BUF_BASE, 1, u64)
>>   +struct dma_buf_sync_partial {
>> +    __u64 flags;
>> +    __u32 offset;
>> +    __u32 len;
>> +};
>> +
>> +#define DMA_BUF_IOCTL_SYNC_PARTIAL    _IOW(DMA_BUF_BASE, 2, struct 
>> dma_buf_sync_partial)
>> +
>>   #endif
>
>
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: 
> <SRS0=2xhc=QC=lists.freedesktop.org=dri-devel-bounces@kernel.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
>     aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
>     by smtp.lore.kernel.org (Postfix) with ESMTP id C34E8C433EF
>     for <dri-devel@archiver.kernel.org>; Mon, 15 Nov 2021 11:42:25 
> +0000 (UTC)
> Received: from gabe.freedesktop.org (gabe.freedesktop.org 
> [131.252.210.177])
>     (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 
> bits))
>     (No client certificate requested)
>     by mail.kernel.org (Postfix) with ESMTPS id 802C761AA2
>     for <dri-devel@archiver.kernel.org>; Mon, 15 Nov 2021 11:42:25 
> +0000 (UTC)
> DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 802C761AA2
> Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine 
> dis=none) header.from=amd.com
> Authentication-Results: mail.kernel.org; spf=none 
> smtp.mailfrom=lists.freedesktop.org
> Received: from gabe.freedesktop.org (localhost [127.0.0.1])
>     by gabe.freedesktop.org (Postfix) with ESMTP id 10E466E943;
>     Mon, 15 Nov 2021 11:42:25 +0000 (UTC)
> Received: from NAM10-BN7-obe.outbound.protection.outlook.com
> (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
> by gabe.freedesktop.org (Postfix) with ESMTPS id D422E6E943
> for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:42:23 +0000 
> (UTC)
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
> b=ZYSFfhU+N5Fq39gpw5NCsolRnyvMmfKTA5cWgJx3l903N5tP6BK6x7pUqmtcQZvyCwwzQwonnQGCZqIx/M4qourfwzBBS0SVUSHvvU6Vn4nZRrd/wffjMaX24XwtUxIdQAQntPFWRi0SjIWpG+72E2TIxwcuyY3/5+qkQiF8s3iNnNXmY4zdZ9fx48I5MHFePTx+VAyZvxzedsyfjjAxGaaaPl2uZagHTH9TDFFaAg/rHvH6O2vq0RwQIaMOGxhA8DgCmsj9dMlSloko0iLt+p2s/WUQShbSQrZq13R3POIyU6aCBx32Zz+biTbwpcXQyXxwfQIi+2nIruJQvuvwSw== 
>
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; 
> d=microsoft.com; s=arcselector9901;
> h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1; 
>
> bh=JkRdepoBhhvZgBl9zd4oG1PeOv+kPWSxKw1ORztFSv4=;
> b=hYGlnailNdl4CzgRcFMK/ZTAFR1Ipev9djYIyqc4j32m6sMsqyx1YxjcAPDo6Rnk3qtB+9sMag1rldkddxzJCBGDOLkgX7hQFl7AFRIQhpXLQsUek5IrCfbd0rGW4HpdbUxyGyRz70XnjFPSTGQFhlz7glYKDPeyHN/X3RtVBfrUG1ywFsVzjD6+I8Uc0O9jbG6Rw5S1/dydWeyovBOPcbUVYt1ZF0z7JDt4Tj90hAElD4cTmc/rfAt3eY3pB6pydnGu+nXJ5bKZIY/U7Wec+TwdXPNGU+ia5E4MN6xuL+kVLPNPa1G6h8qetsVTw5UYOkGtPZCxcR6pUKs0ocJTZg== 
>
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
> smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; 
> dkim=pass
> header.d=amd.com; arc=none
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; 
> s=selector1; 
> h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
> bh=JkRdepoBhhvZgBl9zd4oG1PeOv+kPWSxKw1ORztFSv4=;
> b=4zNaX2CfJHDxjaHlT7C84/jyXuQUhJVYoDhuLfWp/MO0v73QSPzoDc9EiD6G3taNwfNkwRBOMm5VIiF2wOMmVeJmV2JabQp0VPjTYkXDZL9xbtuoXkdCtQFx1+Fz1GJhOnpgaIMZrSQ+DugqAkbmKW5Jp6o8P3GT/ZDzIFBk4xk= 
>
> Authentication-Results: dkim=none (message not signed)
> header.d=none;dmarc=none action=none header.from=amd.com;
> Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
> (2603:10b6:301:5a::14) by MWHPR12MB1837.namprd12.prod.outlook.com
> (2603:10b6:300:113::20) with Microsoft SMTP Server (version=TLS1_2,
> cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 
> 15 Nov
> 2021 11:42:20 +0000
> Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
> ([fe80::2d02:26e7:a2d0:3769]) by 
> MWHPR1201MB0192.namprd12.prod.outlook.com
> ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Mon, 15 
> Nov 2021
> 11:42:20 +0000
> Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
> To: Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org
> References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
> From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
> Message-ID: <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
> Date: Mon, 15 Nov 2021 12:42:13 +0100
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
> Thunderbird/78.13.0
> In-Reply-To: <20211113062222.3743909-1-jay.xu@rock-chips.com>
> Content-Type: text/plain; charset=utf-8; format=flowed
> Content-Transfer-Encoding: 7bit
> Content-Language: en-US
> X-ClientProxiedBy: AS9PR0301CA0041.eurprd03.prod.outlook.com
> (2603:10a6:20b:469::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
> (2603:10b6:301:5a::14)
> MIME-Version: 1.0
> Received: from [IPv6:2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6]
> (2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6) by
> AS9PR0301CA0041.eurprd03.prod.outlook.com (2603:10a6:20b:469::32) with
> Microsoft SMTP Server (version=TLS1_2,
> cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via 
> Frontend
> Transport; Mon, 15 Nov 2021 11:42:17 +0000
> X-MS-PublicTrafficType: Email
> X-MS-Office365-Filtering-Correlation-Id: 
> 00ebe1d3-562c-44d3-ab7c-08d9a82cfb38
> X-MS-TrafficTypeDiagnostic: MWHPR12MB1837:
> X-Microsoft-Antispam-PRVS: 
> <MWHPR12MB18370021933B2E90497B3E8C83989@MWHPR12MB1837.namprd12.prod.outlook.com>
> X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam: BCL:0;
> X-Microsoft-Antispam-Message-Info: 
> qnNpT+UDEdrvmTrphgUzQsrIExW/nJQjCEAt6/leQnM/+F75uQ4P/gIEmE2mfi+FLGZoBp+qpesYv6TE414JsgHBjmPsq9wqAxODHs5+tKntVesYVzi2T3a+bor5SPTdHrjOyz4Lv5il0Z00hyIMOsC898lxdXNK3DY8ClRa/X+z05ZLWWI9kbXDjVdrVqmD31Ciy9En6YG1TKIV+epuDLGRKEvYe8NhgoFs6tUkQ/bWmTBdRJgllNrqms9k2nXdSN5hRpvEjPb3R0jF3kat4c9/g+R9ZfNDU0z3Qo2VAfydWQzqA1BIV1A7EDnRTXmW5vnAV79Migw7l8P0CqzM1nBlO5bCjKtHXPj4OXseQUwQWFO5216Sj4yR6FeIQFVrAO7lW3pd3S4bncIRU17nSaQPkQnnNSdXm0OBFoDdrVzhxYO5g7CoHdrAh0S0Y4Q8vQFqy36ujVGByHPPFfX+aaKXQ/BWnlM6tghXuVYUcoYtqlV4AJpRnByfYBQrumA1ouTLedvwpUsQlCItufU36509QJHuQ9oa3NDqXos2SPnUS/F/6HsBJHw63Rq1Jcd0WGmqDrp9wFQaK959C6zotCP8LC+p2pB0gQYgRieAeifspuQuKmSFk46/7OZfmlwmv8i1rhIK65/inlDat2eDtJBEpqk15UW3bMvw1g5dv5Kr9RmOvFfjfRv5uYDkmxM4OcYG/KHnhd59tAKjoVDXcLgv4Z/rf5i8pgCG0D7SWcZI1XNcdbglDuWiigm3ihyx
> X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; 
> SCL:1; SRV:;
> IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; 
> CAT:NONE;
> SFS:(4636009)(366004)(316002)(7416002)(2616005)(6486002)(8936002)(8676002)(186003)(31686004)(66556008)(66476007)(86362001)(66946007)(83380400001)(31696002)(6666004)(508600001)(38100700002)(5660300002)(2906002)(4326008)(36756003)(43740500002)(45980500001); 
>
> DIR:OUT; SFP:1101; X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
> X-MS-Exchange-AntiSpam-MessageData-0: 
> =?utf-8?B?VmtQa3NIa1NhVm40N2lmZnBueGVQS3ZuTWpaWm4waU1IQ3kvYlFHSGI1ZllH?=
> =?utf-8?B?ek13MElkY3lWUlVuVWxJUkZPR0tlQ01FV0lCUnJrUWRSejg0WjZJWW5CTFdS?=
> =?utf-8?B?TDVMZTVHNitXaW9taUpweTFaL2pJS1NZbGJacnlDWVNyMFl3MjlkdGd3YTEr?=
> =?utf-8?B?MmRodnF3dnlzd0NKZEtZN1JaVFA2OTBJRGQ1WjZBUHROK0dhMlhMWWZkaUd3?=
> =?utf-8?B?RFlQd3NmNGRWZFZydFhXSVJyRmxQMEZDWlhxU3hMcDYzNUtJRGtHVzZtMmIx?=
> =?utf-8?B?NU5zT0VvNmI1MUE1WTRmQWRUZkM4aXFtYVBzK3ovM2E3dGFEQ2ZJZ1B5U2Vv?=
> =?utf-8?B?eWVQN0tEZUhFQi93ZG8zdFJaTjcwT2dUc3VzdTgzNzZsaVNuUHFOQjRFN2Nq?=
> =?utf-8?B?eGZJamhBMDhBbmhsRjhWUDY3dmFhODJKR0UwVWlFcW42TXR6Q2lRV0ZhQnJW?=
> =?utf-8?B?SVAvalMxUVpmSVNzWmxpR3Z1cWtYSTlXTHZOMUY4dExKMFJZcXl2UGZ5S2pZ?=
> =?utf-8?B?NVI2K0xOaFQ3QlMyYitGMDRxa2JCVHQrQW40VnpPUkJ4SDN2UjRnU29TeHFU?=
> =?utf-8?B?cUVVSjEzLzV1ZFFxcndBbkw0T2Q0MHo3YUtoOThVTlgxcm5odjlqVzBYUkV3?=
> =?utf-8?B?RzM1dmllc3pTSFIvS0xaNWVoVDNWVXQ3Q1NJc0NpcjAwWUY1VkR0eEFhZnRX?=
> =?utf-8?B?R3gyeEIyMjR3SGVDdDhUaGtmZWRJTnkyeWhuWkpIVVg2RHoxQWtrUEJtNjdv?=
> =?utf-8?B?YlNmbzI2ME1hQkcrVVBNQ1pFT1FWZFRZZFhyZE9OWWJzRUlDM29pQUJ0V24y?=
> =?utf-8?B?NjRQM2g0a0J4NzJVVGw1MDRqMXFndVBJellQazRvUnFVMHFLRlR2Q3lJMlpq?=
> =?utf-8?B?V1F3b1BwZFpUM2xyYUpvR0RTcDJEZ1dGZWdMdDVHYzd2eW5ZYnlwTXlrckpD?=
> =?utf-8?B?OTdGU0w1My9SUVRkdmk3L1VaWDJseUc3S2tjdFhEZ3dUeDZ1RVIrK2ZNUDkv?=
> =?utf-8?B?aU9NbkZqRFpPQzFvVFpOWHYzd2QxS256OTRKaVQrVlR3c29nNHdwcjVjVklD?=
> =?utf-8?B?cVp6dFN0TUpNMDd1SlFzRUx2SjlraVczakM3VmFJdExzVGJ5cXdmSGlKTTVx?=
> =?utf-8?B?dHNCaUFjVmRPZkRuVFp1RVhWTFB0L1FtNHI1TEZEcTFsQUFMNjdUMnIxaVZr?=
> =?utf-8?B?d09MaXhiSFlrMjhPOGxrcGFLVElSR1pOQkdMdG4wa1k1VktnVVRFTXU0QlJk?=
> =?utf-8?B?Z09uemlVVHJxUHNoY3d1UXIrOUxCMU85bHM1TlpYRzZGcHRRcndtbERtdU9s?=
> =?utf-8?B?VUZRaVY2Z3N2RnlFbk14L1lER2Jib0JSSVNyZkw3Wk1sVExYaDhnMXRDUkhv?=
> =?utf-8?B?Z0FyK0NmMDlEKzcxUTdUY3A5SFJBYUhCOEpIbFNTK3Vic2hxcXR5MWZUcFND?=
> =?utf-8?B?bDZlRnl0VkxWajFyeDF4SFpoQzJTbTNPU1U2c1c4TlhscWNQNXhRaWMxTG5G?=
> =?utf-8?B?emJtUURBZVlqT3cxR2hRdGFVZUh1akxuRHIwYlRPOWZZSnVKeXFvMCtlNTFT?=
> =?utf-8?B?Q3BvMGROdlZ2ZFJUNzYya3hvUVlHYmYzaGlSMHMyK1U0Nis1YksrWFZWc1JH?=
> =?utf-8?B?VHFoY0phcnNVdHNJN2Y4Z0lxRzhHRng0SWQ2NmJuZENWUE5uMktmZktpeTY2?=
> =?utf-8?B?dU15L0FOWDNobkJkN0x6RkdlY1BQalhSK3p0S2ZsTVpwUnFSN0l6S1RMcXJh?=
> =?utf-8?B?bnptcHlHc2VDVm50NW52MkRVK0FpbGpNb3JPektpc1pVM3BibGRhNklaMjVN?=
> =?utf-8?B?MTZxNFNOd2lTbDBhSk5XcFk0UTdZbXdsaW5BYm1kRzlGeThJOU4rMWNyL09l?=
> =?utf-8?B?N3ZTM1NSeUFraVMvVnJYcWhNRjFPOVZYNUhTRFUyWHo5QVpKZlhia05HQy9S?=
> =?utf-8?B?Uit6VG51RCtqWGJsNU4vRGlFVXhJdjh4Y1RhdWhEVVpVTUNpcGdMQUY2L005?=
> =?utf-8?B?WG9wejVLbEZjampPYVcxNDMySXNQelVEZEFGQWROZ2h4ZjFNOWR3c084SjFN?=
> =?utf-8?B?b2lMbThOZmdXQW84YWg4ekJyQW9mWStyZnMvV1JWd3lMajVEM2hTbFVUczNv?=
> =?utf-8?B?QmhyeVpQVVUrOUtyRWNjUXp2a1JhQUpsSnk0ZVlrSDdnaFFYaFVTdHpjM01O?=
> =?utf-8?Q?BO9RKUEVN4uMTDc9B3JQWSk=3D?=
> X-OriginatorOrg: amd.com
> X-MS-Exchange-CrossTenant-Network-Message-Id: 
> 00ebe1d3-562c-44d3-ab7c-08d9a82cfb38
> X-MS-Exchange-CrossTenant-AuthSource: 
> MWHPR1201MB0192.namprd12.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Internal
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 
> 11:42:19.8907 (UTC)
> X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
> X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
> X-MS-Exchange-CrossTenant-MailboxType: HOSTED
> X-MS-Exchange-CrossTenant-UserPrincipalName: 
> cPSQhRvD4Dau5vTrINquy4Yo1A5DbJm3yOORz6qQDOx+umrhjPgdp0FqKASMDEeu
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1837
> X-BeenThere: dri-devel@lists.freedesktop.org
> X-Mailman-Version: 2.1.29
> Precedence: list
> List-Id: Direct Rendering Infrastructure - Development
> <dri-devel.lists.freedesktop.org>
> List-Unsubscribe: 
> <https://lists.freedesktop.org/mailman/options/dri-devel>,
> <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
> List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
> List-Post: <mailto:dri-devel@lists.freedesktop.org>
> List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
> List-Subscribe: 
> <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
> <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
> Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
> linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
> linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
> jason@jlekstrand.net, linux-media@vger.kernel.org
> Errors-To: dri-devel-bounces@lists.freedesktop.org
> Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
>
> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>> offset and len.
>
> You have not given an use case for this so it is a bit hard to review. 
> And from the existing use cases I don't see why this should be necessary.
>
> Even worse from the existing backend implementation I don't even see 
> how drivers should be able to fulfill this semantics.
>
> Please explain further,
> Christian.
>
>>
>> Change-Id: I03d2d2e10e48d32aa83c31abade57e0931e1be49
>> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>> ---
>>   drivers/dma-buf/dma-buf.c    | 42 ++++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/dma-buf.h |  8 +++++++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index d9948d58b3f4..78f37f7c3462 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -392,6 +392,7 @@ static long dma_buf_ioctl(struct file *file,
>>   {
>>       struct dma_buf *dmabuf;
>>       struct dma_buf_sync sync;
>> +    struct dma_buf_sync_partial sync_p;
>>       enum dma_data_direction direction;
>>       int ret;
>>   @@ -430,6 +431,47 @@ static long dma_buf_ioctl(struct file *file,
>>       case DMA_BUF_SET_NAME_B:
>>           return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>   +    case DMA_BUF_IOCTL_SYNC_PARTIAL:
>> +        if (copy_from_user(&sync_p, (void __user *) arg, 
>> sizeof(sync_p)))
>> +            return -EFAULT;
>> +
>> +        if (sync_p.len == 0)
>> +            return 0;
>> +
>> +        if ((sync_p.offset % cache_line_size()) || (sync_p.len % 
>> cache_line_size()))
>> +            return -EINVAL;
>> +
>> +        if (sync_p.len > dmabuf->size || sync_p.offset > 
>> dmabuf->size - sync_p.len)
>> +            return -EINVAL;
>> +
>> +        if (sync_p.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
>> +            return -EINVAL;
>> +
>> +        switch (sync_p.flags & DMA_BUF_SYNC_RW) {
>> +        case DMA_BUF_SYNC_READ:
>> +            direction = DMA_FROM_DEVICE;
>> +            break;
>> +        case DMA_BUF_SYNC_WRITE:
>> +            direction = DMA_TO_DEVICE;
>> +            break;
>> +        case DMA_BUF_SYNC_RW:
>> +            direction = DMA_BIDIRECTIONAL;
>> +            break;
>> +        default:
>> +            return -EINVAL;
>> +        }
>> +
>> +        if (sync_p.flags & DMA_BUF_SYNC_END)
>> +            ret = dma_buf_end_cpu_access_partial(dmabuf, direction,
>> +                                 sync_p.offset,
>> +                                 sync_p.len);
>> +        else
>> +            ret = dma_buf_begin_cpu_access_partial(dmabuf, direction,
>> +                                   sync_p.offset,
>> +                                   sync_p.len);
>> +
>> +        return ret;
>> +
>>       default:
>>           return -ENOTTY;
>>       }
>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>> index 7f30393b92c3..6236c644624d 100644
>> --- a/include/uapi/linux/dma-buf.h
>> +++ b/include/uapi/linux/dma-buf.h
>> @@ -47,4 +47,12 @@ struct dma_buf_sync {
>>   #define DMA_BUF_SET_NAME_A    _IOW(DMA_BUF_BASE, 1, u32)
>>   #define DMA_BUF_SET_NAME_B    _IOW(DMA_BUF_BASE, 1, u64)
>>   +struct dma_buf_sync_partial {
>> +    __u64 flags;
>> +    __u32 offset;
>> +    __u32 len;
>> +};
>> +
>> +#define DMA_BUF_IOCTL_SYNC_PARTIAL    _IOW(DMA_BUF_BASE, 2, struct 
>> dma_buf_sync_partial)
>> +
>>   #endif
>
>
> From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: 
> <SRS0=bc75=QC=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
>     aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
>     by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF63C433F5
>     for <linux-rockchip@archiver.kernel.org>; Mon, 15 Nov 2021 
> 11:42:39 +0000 (UTC)
> Received: from bombadil.infradead.org (bombadil.infradead.org 
> [198.137.202.133])
>     (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 
> bits))
>     (No client certificate requested)
>     by mail.kernel.org (Postfix) with ESMTPS id D939A61175
>     for <linux-rockchip@archiver.kernel.org>; Mon, 15 Nov 2021 
> 11:42:38 +0000 (UTC)
> DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D939A61175
> Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine 
> dis=none) header.from=amd.com
> Authentication-Results: mail.kernel.org; spf=none 
> smtp.mailfrom=lists.infradead.org
> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
>     d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
>     Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive: 
>
>     List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From: 
>
>     References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date: 
>
>     Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner; 
>
>     bh=YynYeIAZi+K+m2naIfrKtqrQanTeUDG2hfxK0scEY+M=; 
> b=JLVk0WfVJXF3my3DZsIyB8zoBQ
>     XDDOsW4/MgUPrPvBnKH0xH2UztD/Tzxw3KkYpeUAxb8mx+buAB+V5wJH40hRMgTKSQFKUvsZMZOdS 
>
>     /HgFcaxhD1Zgm/DZDUctpGlg85qHL3T6NVS6HTVmNnyckiGeiW51pgCbPFZl/3FyFiMSABxukwdQm 
>
>     tD3yDWBz1d9BkxA48UHC/k+LbeyyldyHxkuR1c2/CoHk0X9kwxWx78BI94DfyUNE1A4V8Lnvtae07 
>
>     aUnHLtVfWLo5nobyfoep93NHxihd+/nZSJ88ZYGYOg7rsaTeh68YZXKzk7WvuepjMfXYZlzUCS7OX 
>
>     dg1rskUg==;
> Received: from localhost ([::1] helo=bombadil.infradead.org)
>     by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
>     id 1mmaNd-00FR0i-Oq; Mon, 15 Nov 2021 11:42:33 +0000
> Received: from mail-mw2nam10on2065.outbound.protection.outlook.com
> ([40.107.94.65] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
> by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
> id 1mmaNZ-00FQyX-9A
> for linux-rockchip@lists.infradead.org; Mon, 15 Nov 2021 11:42:32 +0000
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
> b=ZYSFfhU+N5Fq39gpw5NCsolRnyvMmfKTA5cWgJx3l903N5tP6BK6x7pUqmtcQZvyCwwzQwonnQGCZqIx/M4qourfwzBBS0SVUSHvvU6Vn4nZRrd/wffjMaX24XwtUxIdQAQntPFWRi0SjIWpG+72E2TIxwcuyY3/5+qkQiF8s3iNnNXmY4zdZ9fx48I5MHFePTx+VAyZvxzedsyfjjAxGaaaPl2uZagHTH9TDFFaAg/rHvH6O2vq0RwQIaMOGxhA8DgCmsj9dMlSloko0iLt+p2s/WUQShbSQrZq13R3POIyU6aCBx32Zz+biTbwpcXQyXxwfQIi+2nIruJQvuvwSw== 
>
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; 
> d=microsoft.com; s=arcselector9901;
> h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1; 
>
> bh=JkRdepoBhhvZgBl9zd4oG1PeOv+kPWSxKw1ORztFSv4=;
> b=hYGlnailNdl4CzgRcFMK/ZTAFR1Ipev9djYIyqc4j32m6sMsqyx1YxjcAPDo6Rnk3qtB+9sMag1rldkddxzJCBGDOLkgX7hQFl7AFRIQhpXLQsUek5IrCfbd0rGW4HpdbUxyGyRz70XnjFPSTGQFhlz7glYKDPeyHN/X3RtVBfrUG1ywFsVzjD6+I8Uc0O9jbG6Rw5S1/dydWeyovBOPcbUVYt1ZF0z7JDt4Tj90hAElD4cTmc/rfAt3eY3pB6pydnGu+nXJ5bKZIY/U7Wec+TwdXPNGU+ia5E4MN6xuL+kVLPNPa1G6h8qetsVTw5UYOkGtPZCxcR6pUKs0ocJTZg== 
>
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
> smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; 
> dkim=pass
> header.d=amd.com; arc=none
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; 
> s=selector1; 
> h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
> bh=JkRdepoBhhvZgBl9zd4oG1PeOv+kPWSxKw1ORztFSv4=;
> b=4zNaX2CfJHDxjaHlT7C84/jyXuQUhJVYoDhuLfWp/MO0v73QSPzoDc9EiD6G3taNwfNkwRBOMm5VIiF2wOMmVeJmV2JabQp0VPjTYkXDZL9xbtuoXkdCtQFx1+Fz1GJhOnpgaIMZrSQ+DugqAkbmKW5Jp6o8P3GT/ZDzIFBk4xk= 
>
> Authentication-Results: dkim=none (message not signed)
> header.d=none;dmarc=none action=none header.from=amd.com;
> Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
> (2603:10b6:301:5a::14) by MWHPR12MB1837.namprd12.prod.outlook.com
> (2603:10b6:300:113::20) with Microsoft SMTP Server (version=TLS1_2,
> cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 
> 15 Nov
> 2021 11:42:20 +0000
> Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
> ([fe80::2d02:26e7:a2d0:3769]) by 
> MWHPR1201MB0192.namprd12.prod.outlook.com
> ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Mon, 15 
> Nov 2021
> 11:42:20 +0000
> Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
> To: Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org
> Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
> jason@jlekstrand.net, linux-media@vger.kernel.org,
> dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
> linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
> References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
> From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
> Message-ID: <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
> Date: Mon, 15 Nov 2021 12:42:13 +0100
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
> Thunderbird/78.13.0
> In-Reply-To: <20211113062222.3743909-1-jay.xu@rock-chips.com>
> Content-Language: en-US
> X-ClientProxiedBy: AS9PR0301CA0041.eurprd03.prod.outlook.com
> (2603:10a6:20b:469::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
> (2603:10b6:301:5a::14)
> MIME-Version: 1.0
> Received: from [IPv6:2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6]
> (2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6) by
> AS9PR0301CA0041.eurprd03.prod.outlook.com (2603:10a6:20b:469::32) with
> Microsoft SMTP Server (version=TLS1_2,
> cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via 
> Frontend
> Transport; Mon, 15 Nov 2021 11:42:17 +0000
> X-MS-PublicTrafficType: Email
> X-MS-Office365-Filtering-Correlation-Id: 
> 00ebe1d3-562c-44d3-ab7c-08d9a82cfb38
> X-MS-TrafficTypeDiagnostic: MWHPR12MB1837:
> X-Microsoft-Antispam-PRVS: 
> <MWHPR12MB18370021933B2E90497B3E8C83989@MWHPR12MB1837.namprd12.prod.outlook.com>
> X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam: BCL:0;
> X-Microsoft-Antispam-Message-Info: 
> qnNpT+UDEdrvmTrphgUzQsrIExW/nJQjCEAt6/leQnM/+F75uQ4P/gIEmE2mfi+FLGZoBp+qpesYv6TE414JsgHBjmPsq9wqAxODHs5+tKntVesYVzi2T3a+bor5SPTdHrjOyz4Lv5il0Z00hyIMOsC898lxdXNK3DY8ClRa/X+z05ZLWWI9kbXDjVdrVqmD31Ciy9En6YG1TKIV+epuDLGRKEvYe8NhgoFs6tUkQ/bWmTBdRJgllNrqms9k2nXdSN5hRpvEjPb3R0jF3kat4c9/g+R9ZfNDU0z3Qo2VAfydWQzqA1BIV1A7EDnRTXmW5vnAV79Migw7l8P0CqzM1nBlO5bCjKtHXPj4OXseQUwQWFO5216Sj4yR6FeIQFVrAO7lW3pd3S4bncIRU17nSaQPkQnnNSdXm0OBFoDdrVzhxYO5g7CoHdrAh0S0Y4Q8vQFqy36ujVGByHPPFfX+aaKXQ/BWnlM6tghXuVYUcoYtqlV4AJpRnByfYBQrumA1ouTLedvwpUsQlCItufU36509QJHuQ9oa3NDqXos2SPnUS/F/6HsBJHw63Rq1Jcd0WGmqDrp9wFQaK959C6zotCP8LC+p2pB0gQYgRieAeifspuQuKmSFk46/7OZfmlwmv8i1rhIK65/inlDat2eDtJBEpqk15UW3bMvw1g5dv5Kr9RmOvFfjfRv5uYDkmxM4OcYG/KHnhd59tAKjoVDXcLgv4Z/rf5i8pgCG0D7SWcZI1XNcdbglDuWiigm3ihyx
> X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; 
> SCL:1; SRV:;
> IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; 
> CAT:NONE;
> SFS:(4636009)(366004)(316002)(7416002)(2616005)(6486002)(8936002)(8676002)(186003)(31686004)(66556008)(66476007)(86362001)(66946007)(83380400001)(31696002)(6666004)(508600001)(38100700002)(5660300002)(2906002)(4326008)(36756003)(43740500002)(45980500001); 
>
> DIR:OUT; SFP:1101; X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
> X-MS-Exchange-AntiSpam-MessageData-0: 
> =?utf-8?B?VmtQa3NIa1NhVm40N2lmZnBueGVQS3ZuTWpaWm4waU1IQ3kvYlFHSGI1ZllH?=
> =?utf-8?B?ek13MElkY3lWUlVuVWxJUkZPR0tlQ01FV0lCUnJrUWRSejg0WjZJWW5CTFdS?=
> =?utf-8?B?TDVMZTVHNitXaW9taUpweTFaL2pJS1NZbGJacnlDWVNyMFl3MjlkdGd3YTEr?=
> =?utf-8?B?MmRodnF3dnlzd0NKZEtZN1JaVFA2OTBJRGQ1WjZBUHROK0dhMlhMWWZkaUd3?=
> =?utf-8?B?RFlQd3NmNGRWZFZydFhXSVJyRmxQMEZDWlhxU3hMcDYzNUtJRGtHVzZtMmIx?=
> =?utf-8?B?NU5zT0VvNmI1MUE1WTRmQWRUZkM4aXFtYVBzK3ovM2E3dGFEQ2ZJZ1B5U2Vv?=
> =?utf-8?B?eWVQN0tEZUhFQi93ZG8zdFJaTjcwT2dUc3VzdTgzNzZsaVNuUHFOQjRFN2Nq?=
> =?utf-8?B?eGZJamhBMDhBbmhsRjhWUDY3dmFhODJKR0UwVWlFcW42TXR6Q2lRV0ZhQnJW?=
> =?utf-8?B?SVAvalMxUVpmSVNzWmxpR3Z1cWtYSTlXTHZOMUY4dExKMFJZcXl2UGZ5S2pZ?=
> =?utf-8?B?NVI2K0xOaFQ3QlMyYitGMDRxa2JCVHQrQW40VnpPUkJ4SDN2UjRnU29TeHFU?=
> =?utf-8?B?cUVVSjEzLzV1ZFFxcndBbkw0T2Q0MHo3YUtoOThVTlgxcm5odjlqVzBYUkV3?=
> =?utf-8?B?RzM1dmllc3pTSFIvS0xaNWVoVDNWVXQ3Q1NJc0NpcjAwWUY1VkR0eEFhZnRX?=
> =?utf-8?B?R3gyeEIyMjR3SGVDdDhUaGtmZWRJTnkyeWhuWkpIVVg2RHoxQWtrUEJtNjdv?=
> =?utf-8?B?YlNmbzI2ME1hQkcrVVBNQ1pFT1FWZFRZZFhyZE9OWWJzRUlDM29pQUJ0V24y?=
> =?utf-8?B?NjRQM2g0a0J4NzJVVGw1MDRqMXFndVBJellQazRvUnFVMHFLRlR2Q3lJMlpq?=
> =?utf-8?B?V1F3b1BwZFpUM2xyYUpvR0RTcDJEZ1dGZWdMdDVHYzd2eW5ZYnlwTXlrckpD?=
> =?utf-8?B?OTdGU0w1My9SUVRkdmk3L1VaWDJseUc3S2tjdFhEZ3dUeDZ1RVIrK2ZNUDkv?=
> =?utf-8?B?aU9NbkZqRFpPQzFvVFpOWHYzd2QxS256OTRKaVQrVlR3c29nNHdwcjVjVklD?=
> =?utf-8?B?cVp6dFN0TUpNMDd1SlFzRUx2SjlraVczakM3VmFJdExzVGJ5cXdmSGlKTTVx?=
> =?utf-8?B?dHNCaUFjVmRPZkRuVFp1RVhWTFB0L1FtNHI1TEZEcTFsQUFMNjdUMnIxaVZr?=
> =?utf-8?B?d09MaXhiSFlrMjhPOGxrcGFLVElSR1pOQkdMdG4wa1k1VktnVVRFTXU0QlJk?=
> =?utf-8?B?Z09uemlVVHJxUHNoY3d1UXIrOUxCMU85bHM1TlpYRzZGcHRRcndtbERtdU9s?=
> =?utf-8?B?VUZRaVY2Z3N2RnlFbk14L1lER2Jib0JSSVNyZkw3Wk1sVExYaDhnMXRDUkhv?=
> =?utf-8?B?Z0FyK0NmMDlEKzcxUTdUY3A5SFJBYUhCOEpIbFNTK3Vic2hxcXR5MWZUcFND?=
> =?utf-8?B?bDZlRnl0VkxWajFyeDF4SFpoQzJTbTNPU1U2c1c4TlhscWNQNXhRaWMxTG5G?=
> =?utf-8?B?emJtUURBZVlqT3cxR2hRdGFVZUh1akxuRHIwYlRPOWZZSnVKeXFvMCtlNTFT?=
> =?utf-8?B?Q3BvMGROdlZ2ZFJUNzYya3hvUVlHYmYzaGlSMHMyK1U0Nis1YksrWFZWc1JH?=
> =?utf-8?B?VHFoY0phcnNVdHNJN2Y4Z0lxRzhHRng0SWQ2NmJuZENWUE5uMktmZktpeTY2?=
> =?utf-8?B?dU15L0FOWDNobkJkN0x6RkdlY1BQalhSK3p0S2ZsTVpwUnFSN0l6S1RMcXJh?=
> =?utf-8?B?bnptcHlHc2VDVm50NW52MkRVK0FpbGpNb3JPektpc1pVM3BibGRhNklaMjVN?=
> =?utf-8?B?MTZxNFNOd2lTbDBhSk5XcFk0UTdZbXdsaW5BYm1kRzlGeThJOU4rMWNyL09l?=
> =?utf-8?B?N3ZTM1NSeUFraVMvVnJYcWhNRjFPOVZYNUhTRFUyWHo5QVpKZlhia05HQy9S?=
> =?utf-8?B?Uit6VG51RCtqWGJsNU4vRGlFVXhJdjh4Y1RhdWhEVVpVTUNpcGdMQUY2L005?=
> =?utf-8?B?WG9wejVLbEZjampPYVcxNDMySXNQelVEZEFGQWROZ2h4ZjFNOWR3c084SjFN?=
> =?utf-8?B?b2lMbThOZmdXQW84YWg4ekJyQW9mWStyZnMvV1JWd3lMajVEM2hTbFVUczNv?=
> =?utf-8?B?QmhyeVpQVVUrOUtyRWNjUXp2a1JhQUpsSnk0ZVlrSDdnaFFYaFVTdHpjM01O?=
> =?utf-8?Q?BO9RKUEVN4uMTDc9B3JQWSk=3D?=
> X-OriginatorOrg: amd.com
> X-MS-Exchange-CrossTenant-Network-Message-Id: 
> 00ebe1d3-562c-44d3-ab7c-08d9a82cfb38
> X-MS-Exchange-CrossTenant-AuthSource: 
> MWHPR1201MB0192.namprd12.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Internal
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 
> 11:42:19.8907 (UTC)
> X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
> X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
> X-MS-Exchange-CrossTenant-MailboxType: HOSTED
> X-MS-Exchange-CrossTenant-UserPrincipalName: 
> cPSQhRvD4Dau5vTrINquy4Yo1A5DbJm3yOORz6qQDOx+umrhjPgdp0FqKASMDEeu
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1837
> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) 
> MR-646709E3 X-CRM114-CacheID: sfid-20211115_034229_353755_F892CB5A 
> X-CRM114-Status: GOOD (  21.17  )
> X-BeenThere: linux-rockchip@lists.infradead.org
> X-Mailman-Version: 2.1.34
> Precedence: list
> List-Id: Upstream kernel work for Rockchip platforms
> <linux-rockchip.lists.infradead.org>
> List-Unsubscribe: 
> <http://lists.infradead.org/mailman/options/linux-rockchip>, 
> <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
> List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
> List-Post: <mailto:linux-rockchip@lists.infradead.org>
> List-Help: 
> <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
> List-Subscribe: 
> <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
> <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
> Content-Transfer-Encoding: 7bit
> Content-Type: text/plain; charset="us-ascii"; Format="flowed"
> Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
> Errors-To: 
> linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
>
> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>> offset and len.
>
> You have not given an use case for this so it is a bit hard to review. 
> And from the existing use cases I don't see why this should be necessary.
>
> Even worse from the existing backend implementation I don't even see 
> how drivers should be able to fulfill this semantics.
>
> Please explain further,
> Christian.
Here is a practical case:
The user space can allocate a large chunk of dma-buf for 
self-management, used as a shared memory pool.
Small dma-buf can be allocated from this shared memory pool and released 
back to it after use, thus improving the speed of dma-buf allocation and 
release.
Additionally, custom functionalities such as memory statistics and 
boundary checking can be implemented in the user space.
Of course, the above-mentioned functionalities require the 
implementation of a partial cache sync interface.

Thanks
Rong Qianfeng.
>
>>
>> Change-Id: I03d2d2e10e48d32aa83c31abade57e0931e1be49
>> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>> ---
>>   drivers/dma-buf/dma-buf.c    | 42 ++++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/dma-buf.h |  8 +++++++
>>   2 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index d9948d58b3f4..78f37f7c3462 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -392,6 +392,7 @@ static long dma_buf_ioctl(struct file *file,
>>   {
>>       struct dma_buf *dmabuf;
>>       struct dma_buf_sync sync;
>> +    struct dma_buf_sync_partial sync_p;
>>       enum dma_data_direction direction;
>>       int ret;
>>   @@ -430,6 +431,47 @@ static long dma_buf_ioctl(struct file *file,
>>       case DMA_BUF_SET_NAME_B:
>>           return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>   +    case DMA_BUF_IOCTL_SYNC_PARTIAL:
>> +        if (copy_from_user(&sync_p, (void __user *) arg, 
>> sizeof(sync_p)))
>> +            return -EFAULT;
>> +
>> +        if (sync_p.len == 0)
>> +            return 0;
>> +
>> +        if ((sync_p.offset % cache_line_size()) || (sync_p.len % 
>> cache_line_size()))
>> +            return -EINVAL;
>> +
>> +        if (sync_p.len > dmabuf->size || sync_p.offset > 
>> dmabuf->size - sync_p.len)
>> +            return -EINVAL;
>> +
>> +        if (sync_p.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
>> +            return -EINVAL;
>> +
>> +        switch (sync_p.flags & DMA_BUF_SYNC_RW) {
>> +        case DMA_BUF_SYNC_READ:
>> +            direction = DMA_FROM_DEVICE;
>> +            break;
>> +        case DMA_BUF_SYNC_WRITE:
>> +            direction = DMA_TO_DEVICE;
>> +            break;
>> +        case DMA_BUF_SYNC_RW:
>> +            direction = DMA_BIDIRECTIONAL;
>> +            break;
>> +        default:
>> +            return -EINVAL;
>> +        }
>> +
>> +        if (sync_p.flags & DMA_BUF_SYNC_END)
>> +            ret = dma_buf_end_cpu_access_partial(dmabuf, direction,
>> +                                 sync_p.offset,
>> +                                 sync_p.len);
>> +        else
>> +            ret = dma_buf_begin_cpu_access_partial(dmabuf, direction,
>> +                                   sync_p.offset,
>> +                                   sync_p.len);
>> +
>> +        return ret;
>> +
>>       default:
>>           return -ENOTTY;
>>       }
>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>> index 7f30393b92c3..6236c644624d 100644
>> --- a/include/uapi/linux/dma-buf.h
>> +++ b/include/uapi/linux/dma-buf.h
>> @@ -47,4 +47,12 @@ struct dma_buf_sync {
>>   #define DMA_BUF_SET_NAME_A    _IOW(DMA_BUF_BASE, 1, u32)
>>   #define DMA_BUF_SET_NAME_B    _IOW(DMA_BUF_BASE, 1, u64)
>>   +struct dma_buf_sync_partial {
>> +    __u64 flags;
>> +    __u32 offset;
>> +    __u32 len;
>> +};
>> +
>> +#define DMA_BUF_IOCTL_SYNC_PARTIAL    _IOW(DMA_BUF_BASE, 2, struct 
>> dma_buf_sync_partial)
>> +
>>   #endif
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
