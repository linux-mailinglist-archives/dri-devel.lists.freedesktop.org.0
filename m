Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE3483D2B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 08:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553110E13C;
	Tue,  4 Jan 2022 07:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3069010E13C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 07:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNEwbIFmC2lCEKo/YymYDq2wgjtfurSIDheZvE0SU0WorWpxyYT7LNC9h+s0CTEv69YGnqSdituZzwJL/JCuF/khjKdeA0k7YxzVQLUKkCRm07LLSK31aJ/8B8mmeX8ljlK/VAantZ2qY1+TKD+U0TGgl5visE6ijvNg+Vk6yd39brB3TJKKritQ3NKxQ8fyWoGwtkn8etKXGPbBzTgJIKYinlWXaifQwvrGacdtTvXXtkiROw7phVd9vldRiR2Vj8Rrtm7Pt2CaQURd9mvduq7isGhQiTxyqYoN/MF2myo/2Mh0Nr3h0HXZNr1Lq3bmxOsxBHks6t8Ar2n4mKpS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+SCPjSnCVLiUBWhViEtMN33OhhKbFGRJRHwOn3HUPI=;
 b=gznSyv/4JXp7sjTbkRHIqPeRUGcmfOHzv9SR/QiueW5fBZRlsn1sTiV5WuBv7M+ISB+s8nPu3OKpC7IXAU+6fDr0Tsu40Sg2vTa3CqRDnbbt/3s1IG3yiidUX1HE+LS71NdcJisCqD3bnmxPU4iiWS3yYsh9OCjiaXC/oMmiF4lareqc/iV9HXLNUWoFtUDSI9HgDo65Bqo+nFsQUylCkfcIXvYOaSjwiuz0gzKL9WZRppXzpcDm/2K4UBihkN74/b/n49Pw2mMqzt0mCfqdhqrCwPgxGHopw5QmpJZDd13EiGZlwfLVchB9/0N/ci1coounoxUJMI12TBexP2mHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+SCPjSnCVLiUBWhViEtMN33OhhKbFGRJRHwOn3HUPI=;
 b=0dyH0iYMlJgZJuRa2kbXTEi1zg2jObpeOxnj7RoXdTduuFBxPrzqnIvMNvTTPlnYmVLWf9B3fu5Tj7az8nVA7QOQO3y3JcNXP58UMotZc100Nt/xXyk6jB8OxHT3pQU4P5xF27cVEiy5vMe0XYtV1kaUcydWbcoyp4wWMpXH7PE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0238.namprd12.prod.outlook.com
 (2603:10b6:301:57::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 07:48:05 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 07:48:05 +0000
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
To: John Stultz <john.stultz@linaro.org>, guangming.cao@mediatek.com
References: <20211217094104.24977-1-guangming.cao@mediatek.com>
 <20211227095102.6054-1-guangming.cao@mediatek.com>
 <CALAqxLVA4jUk-2o28RZobrPDUnuXfV1xN77Pt8Pu1o27V3aUQQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
Date: Tue, 4 Jan 2022 08:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CALAqxLVA4jUk-2o28RZobrPDUnuXfV1xN77Pt8Pu1o27V3aUQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbe28ac9-d954-4061-97a1-08d9cf568a6e
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0238:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0238675257542B0223865017834A9@MWHPR1201MB0238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKJrrZ7I+1bWTs5pTmLfqOqlLa3Z94HiyiQD3OeIHIN43oIUWTHjB0tJXK84hExBAFQ+KUk/nSrLx1dsSpZen30y//7PMzP1Itb252CNCBaWK3KQnd5t8DSz5OTqEX2woAcs6FaKNu0ttD5JtKkj0kUWIBKkQ7OSIJffbjCxPsFp5ZL2vQikp9caGoRQMy9kJX9mlp6GICs9Cea5PIJb0YrJD6YXbgVIx2RMS+D3nprkYUxOiBuNmYO1WhC3PUB+U/5MgKrU58qIW0E3EZuwM+9fM+00KzD7NG06M/QMrnjmVeuc8SlxIzzsRp5HZZgm0akBxEGSzGa7E7+fPk/lpgtjzrU4AevIDyW/cUydVOwGYZXnEF/yPcBOXnmOdU/un+td/sCcj0x4Xf2wXsv97gauIEFgmDB31FJYKKK6Tn72uZ3gzkiB7xt55IrmYe+rWk4iAz1QEXxWhrPbXBUAdmd4+B1UbiqDOTqwTuUFFprQXpleOcqQyLVyvcZRJUKhPQGKCPAMg3UrJHV/8Fk0fOl5nVVcKie4wyEV8oYMEO7UYIXFdJxW6xvirDZi6zXiNPPjbZQmO9h5vUDzVXPbB3cSO+1aOfntCLKH2btyeBMbARE4jVZN0WxDxKng9xDLED+mP21ythPBXSXgU+mSK7NNgzoA3F0hoHkr6V7O/nh7k0MUo07QtfedjoqNlWkQbILWVygwDUGTnp2dt/irdAO1LQoWkU4wv0HLf+1A0As=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(86362001)(316002)(66476007)(8936002)(31686004)(83380400001)(54906003)(8676002)(2616005)(186003)(7416002)(2906002)(6666004)(66556008)(6486002)(53546011)(4326008)(38100700002)(508600001)(66946007)(36756003)(6512007)(6506007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FrcUx6aXlybTBqQkFzVTJZSCtOY01XS20xNmlaZ0FsQ09zS1ZiMkFLZ0Fk?=
 =?utf-8?B?WmVvMEMwY0QvVDlDQmZMZng1T29IUktFYmJKWVBZZEZST0xwOXBCYTM3c0Vn?=
 =?utf-8?B?TWxBMVJINDArL25oTFRzdEhkamxnQjV3NHZDWDlkWjE4QnRNOVJCSmdBRnhW?=
 =?utf-8?B?OS9FNWV3R0s3Q1FTS1g2UEY4VW8xaE1QVElFM0tObWNHMUkwWkM4b0hIQjMr?=
 =?utf-8?B?WUhsTjl1bE9tMU5IV2ZzOUVhQ0NJMXJYeTVoTkw4b0hXaTAzL0Z3SDR1YkVK?=
 =?utf-8?B?TTMxVFNwNXZYbVJRMmVpRDlVRUZxeWdMUXVyMWRnU3c1SHlmcTdlM1p0OXBK?=
 =?utf-8?B?QUMrbGw1L1hJd3FvN1VMaUFYWldjc2l1bWk4Mk1SL21HZURia2JlRXduT01u?=
 =?utf-8?B?U3VkUnI4QXJ5Wm45M2JlSFdXNmtOZXN6MHNYb2Z4TVhBWEQ5RU5MK0lWS0NM?=
 =?utf-8?B?eWVwSUVCcFBzdGsyaTZ1Vjc2VEJPRS9HNkx5TjhaY0tBeWhuWjdJQkt4Umpq?=
 =?utf-8?B?NW5QOTlZMWc4ZzZQTXJWVEpXN1RudUlIS3krVm5LeGxBVGpDYjVSK016Q2dl?=
 =?utf-8?B?U0JiUHU4NlAra2NGOHhFYmJ5YW0veEZJczZPR1RHb3RjZ0tZTlZnOXFtRk9t?=
 =?utf-8?B?QjBUZ29seHh0VUFHYnNoWXhXRnJmb0kxaXJRK1BsSXNNN29laU4ydnJDRFpQ?=
 =?utf-8?B?SW1WOGlqM05qTzhNRDhaUENiSjRLaG9HMVp6MzNPZFpzdEdxZ29Jc3ppeG96?=
 =?utf-8?B?aksvMW9iWmlRSi9XalIzTWtHTmNUV1FIcjJRbmNxK0hteEpYamV4NVd5V3JK?=
 =?utf-8?B?QTFwVjlRenVSTi8reWxUQklSYnZJOC9RQlBpd093aVVUZGFoU0hrazNXb05s?=
 =?utf-8?B?ZTA0ZStZalhQbEUzdUMyY1hmWEcyNWRwSXdOeFpXbDA1cjRmcFc2bEVkV0tq?=
 =?utf-8?B?R25nYldUZlptVkVxTXhhQkZRV2xSZS9hK1I0amxZcEF4M0JnRGZxVHVjYWIw?=
 =?utf-8?B?K0FMWENDNjExeWtxcE1wZ3EvR3FtVXZUZ1dkQ1lRU2xSZWxTejcwRzlPSVF6?=
 =?utf-8?B?OFo3VTB5QVB4b0VPdVhxNkNtMldiQXJ6ZFFtOUszSkg5UWZyb2hFd2FCemc2?=
 =?utf-8?B?eEMxNnlLNFdYRTZjRjYrakNKY2VFc013YUR4WU5POWJiMDlTb2k1Zlgzek03?=
 =?utf-8?B?MDFmdWl3SzVQQ3JNL3BDRVhvL0Q4d2VONEE0S3BJcXdHSjRHZUViYkFLNDVN?=
 =?utf-8?B?N0swYTdmWU42ajFhcHhKaVFUbWdIUTNmbmNCWjkxZVVSanZUdW11R3N2OU1i?=
 =?utf-8?B?RXNuTlJ5d2RPM3lBR0VFOWExcHVVWkxBeDg2UFF4R0VWUVB6MUxQaEloVjlk?=
 =?utf-8?B?dWIrQXpPbGx2b0VjRXNYclcxVEl1WWplS1BCY3plWWlXVWRUcUZNajM5Y1po?=
 =?utf-8?B?aGRZSXhBR1ZJVjNxZVg4T1dsZHlnalo0MzB1SlltS2YycmFicnR4VmpyN0o2?=
 =?utf-8?B?bGF3MTIwN1BXRlM3aW91ZmxlZEdFbHlWdHZGSHVSL0tVckRpRm5wNWVscUh4?=
 =?utf-8?B?UDIvSVFmRlF2T0o4bkhGNXZkd0JNSlQ2R1l1UTRnaVRQY3lDNmtrZ3hTUWpv?=
 =?utf-8?B?UFR5MUE2cXExV05zRmZmUEFQTm1UTFFYRnFORkltRzExMEVGWDBpNWE3NFBW?=
 =?utf-8?B?VHpiU0djSFJIaThqZlNkd0RGY1Z2b2RCVmh0bU1NZzNnQWV4SEdLZ1Z5NlBI?=
 =?utf-8?B?c3g4a3pXTldTaGFnZEs2ZzNCc3ZUVXBCSHZNeC9idWRFUmVEbEFwS3hFZkw3?=
 =?utf-8?B?OU1wUkV6VVpmeFZXYU5vWEJ5VHlySC9zODdCY2dCYmxLQ0p2YjdudWZpcEVt?=
 =?utf-8?B?VnRtaE9BNllEMHl1Zm1QLzlKU1ZLM0NrYWo1bjRsMXBXT2ltOSs0TitpZEFZ?=
 =?utf-8?B?YkNGR0lYRHdseVJjTUt1citJbXpvZGNSUytZWGphdERDMWxIWFQ3SDF6OXpz?=
 =?utf-8?B?TmRDaW14dzdPY0tqTUdQKzhPTXExa3Fwck5pcHpjcEZJMW90alBsaEhWeGZV?=
 =?utf-8?B?ZkNpaFRtNWlmK3Q4R3VjUm5sVUVESjA0SThIL3JGMSsyclBmeFlaSktVcXNM?=
 =?utf-8?B?NG9OYzFkRDNqeWd0S05ZallMYWVYZlkwWXJRaDZjV2hiUWIvUlNXT1d5NDFt?=
 =?utf-8?Q?bmp1cgeHXVVD/tJUxXaG5BE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe28ac9-d954-4061-97a1-08d9cf568a6e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 07:48:05.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzUH+RJ/48KKBhYBKCp7lHA0rvnl4SwHJEG3fOY4WRoQOZab2+ucW81PJqxqu93x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0238
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
Cc: jianjiao zeng <jianjiao.zeng@mediatek.com>, wsd_upstream@mediatek.com,
 Libo Kang <libo.kang@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Yunfei Wang <yf.wang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Bo Song <bo.song@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mingyuan ma <mingyuan.ma@mediatek.com>, Laura Abbott <labbott@redhat.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.01.22 um 19:57 schrieb John Stultz:
> On Mon, Dec 27, 2021 at 1:52 AM <guangming.cao@mediatek.com> wrote:
>> From: Guangming <Guangming.Cao@mediatek.com>
>>
> Thanks for submitting this!
>
>> Add a size check for allcation since the allocation size is
> nit: "allocation" above.
>
>> always less than the total DRAM size.
> In general, it might be good to add more context to the commit message
> to better answer *why* this change is needed rather than what the
> change is doing.  ie: What negative thing happens without this change?
> And so how does this change avoid or improve things?

Completely agree, just one little addition: Could you also add this why 
as comment to the code?

When we stumble over this five years from now it is absolutely not 
obvious why we do this.

Thanks,
Christian.

>
>
>> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
>> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
>> ---
>> v2: 1. update size limitation as total_dram page size.
>>      2. update commit message
>> ---
>>   drivers/dma-buf/dma-heap.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>> index 56bf5ad01ad5..e39d2be98d69 100644
>> --- a/drivers/dma-buf/dma-heap.c
>> +++ b/drivers/dma-buf/dma-heap.c
>> @@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>>          struct dma_buf *dmabuf;
>>          int fd;
>>
>> +       if (len / PAGE_SIZE > totalram_pages())
>> +               return -EINVAL;
> This seems sane. I know ION used to have some 1/2 of memory cap to
> avoid unnecessary memory pressure on crazy allocations.
>
> Could you send again with an improved commit message?
>
> thanks
> -john

