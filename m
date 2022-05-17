Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C4529A00
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 08:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0802410F583;
	Tue, 17 May 2022 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B187F10F583
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 06:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1hqDVwAi51ho6P6GDCyP4PLHCX2cR67sEeHiT3VhdGOI9XMfyB8QawnSltx3+jta+MwbTTVrXJrDrXpOKqbGKQaMNcuCdXQFgBasfqU6EH2noaySQdCoT/o5m8h0gys2h9CFDxSenKkNVOWu60oiRdU5XbTLY6GyX+EeeDkmFb6qDK1H8ldgt0IMJ6Pqw5BwCYt3nblZpFw6nSjIDfXJ63fqNv4s0ssiVZ3elJy+CZNsTJ+uRAP/PDoEb3PDD8O1Jf3nLzzB2OQaICovoGXW5iqkD7J8nI1OKxumz428xOsL5RQeclqeV7uBdj5X9QUBrY5MIJzs+/VS34JyjRyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6gMRQ9BQhC8ticeyu8kdODbzEkz/RkxWSfcAF5XfSs=;
 b=m/dxIBDiGsmyJ330TmW38K9F2GIqUt5B4SCh2EDnYSodMGTZFg+EOQioGdp65OxLv8W/PMg20zaPaMMcVZO3a5NaFxoUel/K4pJ4oCFehyKFCUXklqYK2+kNTIA6VrLfu2wsR8DYkud5pSk0/JfsMcPJk9e5Iyktmwh6m+3DQg03sCdi9OcWRIt3ZFn9D+O7kd/dbiADHea0ZtpMS3sX39ChkG4PHnOasschLSqwn0kqytg2Qt2IFa6NLG7fHUf75/gts/yVMvKJQcTqLjfAsEjqWVR/1XzZqIr/8hJ+sQqcn2h82ydicLd3qp7bhPZnEmGoSqx/4QgcJD7e8kQX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6gMRQ9BQhC8ticeyu8kdODbzEkz/RkxWSfcAF5XfSs=;
 b=fTDLFYLqOgci15BfOAEoAniVlnvI+rHxUfNIu8JO2X4OcLtYuu/bETWeQ3h2b9iD3OXYwybZjXO2vtcLBoesGi4wbRaQMRwI/vHsInA1+3HW7oFF3NLSeW5wG37W7hgMNzsnkAjiOi7u3UBDYvj2ZZs98BpInN4HKCSltXrGah8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3292.namprd12.prod.outlook.com (2603:10b6:5:18c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 06:59:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 06:59:52 +0000
Message-ID: <d820893c-fa2e-3bac-88be-f39c06d89c01@amd.com>
Date: Tue, 17 May 2022 08:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "T.J. Mercier" <tjmercier@google.com>
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YoM9BAwybcjG7K/H@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0207.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6679a98-47d6-4389-f45d-08da37d2d723
X-MS-TrafficTypeDiagnostic: DM6PR12MB3292:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB329228066B93AE885739D40F83CE9@DM6PR12MB3292.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtqmA8VwPEH9CwxwIzpfgxE6djtBxm7BXPPC/Q9yb2Fa96WcFlvVKSfAiLDQt5OHu5EmupX1LuceGgDGw3Uhf5eWN+micqp7N/3jcVr31T23Wn6iTKeGFl0OyAg1mHN2UZlUwiSS8A1prGJC51xdmUSU6fUNJSCI+fxv6ks2P4PlwU8sAIxcBPEO9H7miplnxbghVvV3GiVPV3Eh3b6CmRL5DJsomJ8MXKEdZ/L0OJzAzyrqmpoDXhYy8I+ta6D6uYz9XhUsfQ4/JkQ5ms+5PUHA55m7FYLNkMlDTr7quA0NuLUdZNh5gcZpbzHA67xOXKyy59ErCordBDWJdoasFs9JwDxU2OskxA+qlEMAuLCVIRimZUoBA1FhiFNLfAsDOQlrSG4VnsPp6bMTMbPXuzDoDnqQ9Nseyxa+dyGs8eDwZnBBDJFDOxWLxdxloH34XZciF8jKI99cOADTIbbEzcTkb4mYQ/Bi3W7RWsTL3wvo422y2PLm1RVRzYI5XF+tvRoEcpjyIGcK/nZGs1kaRN8NGdXdTJtL6lN/3GcltUEwBpmfHHgCtq8zZz8l34M7/cRX8HTmdr4Cm3Y8O+XiTOARutH6Yfd9a5NNWP0yjTLLuPzsgZss5Q0C204MU/GZ7mCQrocZLGwpf7dwu9jprJ6CPo2Y6Hs0m3SkJPheevJl+B8YSzeTaLT6FlZ9VhuL8zjJmjhowPAbYlP2xFghKWF/wMTzo8oIWnw4U4R0Yo8+r50c6l4d8fVFLjCd5676roN83sfSkmwGxXFa1bPZXJtsjXF5FkJtzDBkYluiQ/alLLYRcoiuGk+B/wswqOg/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(508600001)(6512007)(6486002)(6506007)(6666004)(26005)(31696002)(45080400002)(8936002)(7416002)(316002)(86362001)(66574015)(110136005)(83380400001)(54906003)(36756003)(8676002)(4326008)(2616005)(66946007)(66556008)(66476007)(31686004)(2906002)(5660300002)(38100700002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEFRTmwrT3Q4SDVKcWc5KzFqd3E2ZE5YUXlLQ0ZsUFlEMER1SFNwZzlHMWF3?=
 =?utf-8?B?NnZRL0ZpSCtKTDBINDhjRmJ6UE9jMXJrS0ZQaTIxTk1kZmp2N05MNmpTbnBn?=
 =?utf-8?B?QjNEdEpEYUxsTzJyUzAxdWRSdG16ZkN1K1BYREtDSS9acVgzTlFWVDBkbzBN?=
 =?utf-8?B?clF1RXhHM1RmcGlBVUR1TitRd3kxYlp6R1JPVUhOUERDUnhpNUdCREoxZGVS?=
 =?utf-8?B?aFA4eHZDYk5hTnBQZFFKaFBKZXhUbHg5eUZwNHRkUm1RR3FsbmEwWFMrb3px?=
 =?utf-8?B?NWVUczdCeDE4VjZ6K0dyRzN4ZmdhekRNczliNlZvaWlNNFp5RTl2Y1RLaXY3?=
 =?utf-8?B?L1BicmNDNXBrRHMwK3EySVVLYUE4NGJJODR3bGxPdEUrK25NMFVQVDFVZlY0?=
 =?utf-8?B?UGFZSmJ6TnAra0Rlam1UYnJNUmdranhPR3I4d0ZYbW1NODRQOFFRSG5uZFJ4?=
 =?utf-8?B?ZStEeXErZFBWVHZ6ZnkyaUJtRlFjOFFtZHJWaWNDRUZmYTFzSENxbFRrcXhN?=
 =?utf-8?B?MGlwL1BzdDJsWGFLUTk5WnVRYmpDbjhROVdDWEhLNXNxaXlIVnYvRDNQRTJk?=
 =?utf-8?B?NnRHaE5GVGoxNUVneVRaNFpIT2NTWlFoU002QW5ocFVIYjl5cklaNElWdjBK?=
 =?utf-8?B?R2RQTnk5UUpaVXhISTdpTHhORktYWlQ4S1JQczZzU0laZkRFZHZrK3V3SW1H?=
 =?utf-8?B?MUlkcmVnWGFoUGdGNXU2NlpJSXlzL3RnTDh4dUg1anlvYTRMVUdjZHlhek9m?=
 =?utf-8?B?eEF0YUFSV0lBUXVXaGpEQmVEMWhQV1dZZzJsRDQ1alpHRmhwRDVvcHk5b2FE?=
 =?utf-8?B?d1poTjkrdVRxb3lEZ2pFY0pMQVRoVFN6SEd3UEIzaC9WWU9naTBmSHNJKyt6?=
 =?utf-8?B?b1lPRHp6WHBBWnBuaE95czdTaEc2SGdKUEpMcVFnNHdZaTFnRHhyVWxGaWVC?=
 =?utf-8?B?QjRTQlFQUjh1bE9YZ0YyMk1HRUptcnQxVnR3RmtZT0ZrZWUrcHhsNHgvSDBR?=
 =?utf-8?B?WCsvZGkwb1doMzlBbXZLWE0zR242WWQ3dmxrY2YxZENhVC9uV0U3N2E3WHh5?=
 =?utf-8?B?V3ZVdDVGZnYyazhDWmVCNlE1WEZEd29Eb2MwVXB4aVd5VldlcDM2MDNEa0sx?=
 =?utf-8?B?Wkk1NmZ3WUlFeW43d1VMSnFDdlRnMTNsSjBJQjZsRkkyU2dBQ1JSWG5KaHQ5?=
 =?utf-8?B?SDdHMzRyQ09maVhzdzVQQk9QWk1KM1ZXTlFVM1AyTExtYjd2cmk5bjdkK05k?=
 =?utf-8?B?UVBGbHZxangzOHBwZzBKenQ4MGhDU2c5TFBPK0U4akFGd1hnWGhHdGtDWm02?=
 =?utf-8?B?TWpvYmE4UHZsUW5WRnFEWm9SMjRTWXdZRUJYZ0YzRUVUMVJXZkhBdkM2NHR5?=
 =?utf-8?B?anNOZmwwUWFiblcreis0bXdyMWN0aDRxV01iWHJNcHFSb1dMdVVlSmFVRVMy?=
 =?utf-8?B?cnVjN2FUQjBzM2NWT2JKSDErVlM0TFN6bzNyLzVIVW9qTUh1aEZid2VZd0RP?=
 =?utf-8?B?dHJpL2Y5eFhTcUhYRWt4ajZFTW54ZitkOElXOHVDdEZPZ25aUjRIYzNiZWxo?=
 =?utf-8?B?OHNQZUVUTVFxd0krVVBlNWhoZ25HUDY5emlHaDlPRWJ1b0JNMTRJcW9QSDY3?=
 =?utf-8?B?MHprbXBpT3pWTWQ5OEdjYXVYbGtmeFRXbnNpSXg1MU9DZithWGV4Q25ndTJl?=
 =?utf-8?B?ZDZoOGRudmc1c1JzS1BjUUtQSEx1UXNWZ1ZoeGUvS3JDVnlkRFpNMjFoNmly?=
 =?utf-8?B?T0NselZnZEpCb09NaFIrRy94U2JEenpETUtqOWNpL0pxMGtzcjBIeWhQaDRn?=
 =?utf-8?B?QUFrTDluV20zK2pCZ0xOa05NeXlPVVF0cVhwTm5Obm5zTWJ1U21mUytoOUtM?=
 =?utf-8?B?ME5IVXBya3ZaSWtMT1NFR3JsRXpmRmUvUDlWNVZHOW5EQXZXSnRzaW1vSlpR?=
 =?utf-8?B?ZWIxNE9TaEgzSm9FZlMzQ0k5TU95UUtFZTljaGlIU3hlVUh6eUlsVUd4Tkdn?=
 =?utf-8?B?cHZ0Sy9NYVIzMWJ0U3U3SkE4dXNZNUVoaHovemN1NmlSclNRVWkyMFNlR2U0?=
 =?utf-8?B?Ly9OaHZPanhnUVBmTVpUWTR1MnVXanA1dXhNVExkY3BSTkNVQ2h0WUlHOGps?=
 =?utf-8?B?MXpOb3BHVzNLY21oaTJTVW44R0d1SVhmUTVXRDR2ZXBGV211N2phUmkzVlFD?=
 =?utf-8?B?Z1VlcWszeWZGU2VnSkVQb29JdEJxNmo0a0hsV1duM291TkFBL0Rkc3A4RmFr?=
 =?utf-8?B?cXhtN2RVSTB3WEg4T01pWWFHSndhOTVmejJoV1NtZmdFSDdoTC9YS3hUdmQw?=
 =?utf-8?B?RXBZMSsrVm9QVk8renNDRjg2UVhiM2VId2dtT05qRTI1ekNiUS9ZUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6679a98-47d6-4389-f45d-08da37d2d723
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 06:59:52.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vgNWzahnMNFdQeHOCab+XXvK5ABVwDvjSgJ2MCeGPITv4einz/dKKLrUXOwswYh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3292
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
Cc: kernel-team@android.com, Minchan Kim <minchan@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.22 um 08:13 schrieb Greg Kroah-Hartman:
> On Mon, May 16, 2022 at 05:08:05PM -0700, T.J. Mercier wrote:
>> [SNIP]
>>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>>>>> Originally-by: Hridya Valsaraju <hridya@google.com>
>>>>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>>>>>>
>>>>>> ---
>>>>>> See the originally submitted patch by Hridya Valsaraju here:
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F1%2F4%2F1066&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C61d7d3acbe5f47c7d0e608da37cc5ed7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637883648212878440%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=HdSHA2vbBkBgdKxPXIp57EHW49yoMjgmigkVOKeTasI%3D&amp;reserved=0
>>>>>>
>>>>>> v2 changes:
>>>>>> - Defer only sysfs creation instead of creation and teardown per
>>>>>> Christian König
>>>>>>
>>>>>> - Use a work queue instead of a kthread for deferred work per
>>>>>> Christian König
>>>>>> ---
>>>>>>     drivers/dma-buf/dma-buf-sysfs-stats.c | 56 ++++++++++++++++++++-------
>>>>>>     include/linux/dma-buf.h               | 14 ++++++-
>>>>>>     2 files changed, 54 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>> index 2bba0babcb62..67b0a298291c 100644
>>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>> @@ -11,6 +11,7 @@
>>>>>>     #include <linux/printk.h>
>>>>>>     #include <linux/slab.h>
>>>>>>     #include <linux/sysfs.h>
>>>>>> +#include <linux/workqueue.h>
>>>>>>
>>>>>>     #include "dma-buf-sysfs-stats.h"
>>>>>>
>>>>>> @@ -168,10 +169,46 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>>>>         kset_unregister(dma_buf_stats_kset);
>>>>>>     }
>>>>>>
>>>>>> +static void sysfs_add_workfn(struct work_struct *work)
>>>>>> +{
>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry =
>>>>>> +             container_of(work, struct dma_buf_sysfs_entry, sysfs_add_work);
>>>>>> +     struct dma_buf *dmabuf = sysfs_entry->dmabuf;
>>>>>> +
>>>>>> +     /*
>>>>>> +      * A dmabuf is ref-counted via its file member. If this handler holds the only
>>>>>> +      * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
>>>>>> +      * optimization and a race; when the reference count drops to 1 immediately after
>>>>>> +      * this check it is not harmful as the sysfs entry will still get cleaned up in
>>>>>> +      * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
>>>>>> +      * is released, and that can't happen until the end of this function.
>>>>>> +      */
>>>>>> +     if (file_count(dmabuf->file) > 1) {
>>>>> Please completely drop that. I see absolutely no justification for this
>>>>> additional complexity.
>>>>>
>>>> This case gets hit around 5% of the time in my testing so the else is
>>>> not a completely unused branch.
>>> Well I can only repeat myself: This means that your userspace is
>>> severely broken!
>>>
>>> DMA-buf are meant to be long living objects
>> This patch addresses export *latency* regardless of how long-lived the
>> object is. Even a single, long-lived export will benefit from this
>> change if it would otherwise be blocked on adding an object to sysfs.
>> I think attempting to improve this latency still has merit.
> Fixing the latency is nice, but as it's just pushing the needed work off
> to another code path, it will take longer overall for the sysfs stuff to
> be ready for userspace to see.
>
> Perhaps we need to step back and understand what this code is supposed
> to be doing.  As I recall, it was created because some systems do not
> allow debugfs anymore, and they wanted the debugging information that
> the dmabuf code was exposing to debugfs on a "normal" system.  Moving
> that logic to sysfs made sense, but now I am wondering why we didn't see
> these issues in the debugfs code previously?

Well, I think that some key information is that adding the sysfs support 
was justified with the argument that this is not only used for debugging.

If it would be used only for debugging then debugfs would the right 
choice for this. If debugfs is then not available in your environment 
then you should *not* ask the kernel to work around that. Instead we 
should discuss why you want to disable some debugging access, but not 
all of that.

So for now let's assume that this is also used for accounting, e.g. when 
userspace wants to know how many DMA-bufs of which size are flying 
around to make decisions like which process to put into background or 
which to swap out based on that information.

> Perhaps we should go just one step further and make a misc device node
> for dmabug debugging information to be in and just have userspace
> poll/read on the device node and we spit the info that used to be in
> debugfs out through that?  That way this only affects systems when they
> want to read the information and not normal code paths?  Yeah that's a
> hack, but this whole thing feels overly complex now.

Yeah, totally agree on the complexity note. I'm just absolutely not keen 
to add hack over hack over hack to make something work which from my 
point of view has some serious issues with it's design.

For example trying to do accounting based on DMA-bufs is extremely 
questionable to begin with. See a modern game for example can have 
between 10k and 100k of different buffers, reserving one file descriptor 
for each of those objects is absolutely not going to work.

So my request is to please describe your full use case and not just why 
you think this patch is justified.

Regards,
Christian.

>
> thanks,
>
> greg k-h

