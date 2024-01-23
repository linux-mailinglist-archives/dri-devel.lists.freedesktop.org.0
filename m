Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC221838DF8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 12:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77CD10E780;
	Tue, 23 Jan 2024 11:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A50910E765
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 11:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD7WpB5dgv67toNRqTg2H9vQRVCyvOtbKKrm6XqAcsDz8IzUg8b6e4FBwpeN2LzN48ErCHi30wA4OTN1vpIpn7zMoesFDRm/AbDVl6J6w5vHwReQgmzxLfX+Vc4CAMxoJFtk5PBs2QNfFtKacemYu+pLccHAZIOjwTLqVk3zKnwSDrs3qluszobTdQJNicOutCyYlKUCt/WdZ8LueOWi2Y+K4dmR3H4YqNRhjK2GuC4WDCmMlGr2drJrNEc4G13Ac5xBp+DgsRXqUigLimwyIJXzAy9GazUxz3KJrIwqr/hFzkrDLzOWKVQ/e55Azd9zTSIlKAl7qNtW/6IwLyXmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy4fbR9UbO8+KCr7W9tHO9OyrVJdLHBYuWjQT1M0LbU=;
 b=ndse23KLbt1kNIscm3X1m+SWDMpyON9kyI5KVrvoHoYCn1xGiUxxNCnPPOxCWk4Zv43VAGDoCJwF5aqd2oxmDYFLQBOCbVr9XCEFlF8ctZKumYMq/GrV7p7qz3f+h9B0f/GKE5BsPgotinmpoPaBErOdcPak2LOYvMEl5iw6JR/Nck216P5LPIFrRVbhH8Eax+x6OEtGFmcb8hKD26DerVDife5flf3HdN4abe3EnWct1XrZLgVQjqk5i6ygCpDqQKVleSmmrWjBZyb07bHvNFtPwf7QoOfpyPac8MebyMzA/85zOHpHAwkNZtKDjQ0lozakNvKAFCAt1TSOME24kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy4fbR9UbO8+KCr7W9tHO9OyrVJdLHBYuWjQT1M0LbU=;
 b=NqyGGpYv3Q2krlzds/X5pOQOanTmDcuqDUT5SiqITOd9D+O9iBDAdnEf+KRfl4dhgQGBnHhpt9vTZ5w++PPuMNLqTPARGibqhO/TaxSFUJ5edHZBNL9hReZ+4wRmOxgdGVXNquhZ/37wgW6E4yziGOFhW0/nbg2YN5Cww5JN0QE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 11:52:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 11:52:29 +0000
Message-ID: <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
Date: Tue, 23 Jan 2024 12:52:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa89bfc-5d3e-42ab-1399-08dc1c09c69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7WlHNrr4s0Teb1KKRw/K+hyylj0HmMy5BfOMUsUBkyi4bsWIXBy78/NRUWGL3Aa6elHQT8q3NA+yf70kI73Dsjy8IW3VfgTNO33H4YhmUmJylDa/7JmY2BYHpv77Kq7vGvIz+2hq+F88WIeFuVV5JgQCe70BcMAZsvo9I2Y/Eu4SbrL7Hgee3Nf9mvHFB3pTKweIOCapQe4P/JSyqKrKvXeV6DGD5wf2gX0KLPyCRNyaOh34IuqNkOBhqgrEHx2CU8mVZYQBFc9/N14UTSGcvfuGGkTXQ77MCBevSj7EzUeo600yJRKaCWdW148YpLP5MseLjagREYhz7YNt8LOO1qZ6mlMbLEE+MPKkrSDxFw4k0Y5NKXwwVtVH3cUy2Ssx0jjPIsRmzZlmDRyyhqi7KO6D4jjKtD/kNt92aW+le04/CSMCV2BhGAnIn4FSVqnrWPmuCF9D7bSCAFtGpj1bCFtKIwsE+b9TwYHDqYllhUXw9I+oVtk6C5ps2fNHyXwJerj1illhHW3Y1drXh34HGSIsanbOHRQteqsabG7dVlke/3mQQ8moeUoVaJ/JMB9AY5IWubDO3Uyo1bydt1pzQ/Hh5jHBRajeueIRgBwoo3T+vtXzMftgqNJ+BT5vfz1/7XU5X9KOkFBbd0FlL+Qfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31696002)(66574015)(83380400001)(2616005)(26005)(66556008)(66476007)(8676002)(38100700002)(41300700001)(66946007)(54906003)(5660300002)(316002)(8936002)(7416002)(110136005)(4326008)(6512007)(6506007)(6666004)(6486002)(478600001)(2906002)(36756003)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTg4R3ZaekgrMGxrVXExbU5MSC9Dci9wZlVrdmVtRTc3MndQaHBJSWk2cFpm?=
 =?utf-8?B?Vkx3WUJlQTMrUzJ0UDlabDJTMXp1M2J1RmRBaDlXdUh6TjRFOEVjaGY5d3hI?=
 =?utf-8?B?OC9qbjFNZm9IUjdDakkwOFpFSm9NZWkvbG43bTlOSGxENFlpS3NtYkE0UitM?=
 =?utf-8?B?ampzeUl2Q2h1V05UV0Jrc1d2dXFrVkU3T2MxOFZYRXNRUzRSYWFCNFpocGE5?=
 =?utf-8?B?YjcxSjRDakN3S0EvaTEvS0R0by85cFNHNzhMMERTN05qdFFSejRsUm1rRVpv?=
 =?utf-8?B?aVBFaUs4TjlvSmFPdzBiL0RUSVVQVWlNbjhFckRVUGdmRHBGbVJIeHJtOTJt?=
 =?utf-8?B?TEdMUU5DYWw1RHRoSWIxYlNzVURPR1lYZkRVazRCL3R1M21rZHZkNUdVVnFZ?=
 =?utf-8?B?ZG5uNUg5RXkrdVpyK2QzN3ZQc2NldzZIZi9WQlhja1NBTmVnSGIwcEczdlp5?=
 =?utf-8?B?OVc4Z3plZzZjeEJROS9OTXdUc3dwTmlsQlNuK0UwSzZhMUV3dTA5cndHVHFp?=
 =?utf-8?B?OTRFbjkyYWxaRGdidE95RHBkRzNJbk9jdG5QLzUyV3JpbFlIWkMwaW9GTTRL?=
 =?utf-8?B?MVR2Um9LWGV3WGVWZXBML0s5Z1NBdXR2NWpPcDVDUjF6azdKR1hqR2JEWFVl?=
 =?utf-8?B?TkV2RlV5WDU4bTRRcGdyNmYrRFVkZDBEMW1QQTI3Wlk5NnhjeTExVDZrSHhu?=
 =?utf-8?B?d0NSOWY4MlRobi90bk9hT1gxV2p6L1VMMUtKclRFSGh1TklkcnlRWkZGRVFE?=
 =?utf-8?B?S1lpQ2ZscTRUS1dkYzVhSjJPWnlpTFMyWDNCam9KMmJ2RXBtMXRUTlhHQ2R0?=
 =?utf-8?B?aWtjL1FUbUdLZVppWXRBQzl3alRzb0tLd3M3cDVLWlA2ajQ0SS9SMHN0QXNr?=
 =?utf-8?B?QXZzaGozWWYxNnJLeXVpZkQ4WU9sTGJzZEcvYWUwdE5Ia3VoUE9JMTlPMGV0?=
 =?utf-8?B?U05XdENYanZHa2MyVEx3b3ROSlB3M3l0bTZ0SGJDL1NCNFFyZ2ZHQ2lyRDBq?=
 =?utf-8?B?bVk4YWlMTUl2QVhaa3g4YmdQQThZMCtqODVlTUYzb3FlT1NhdjRiT3NDTFZT?=
 =?utf-8?B?cWd0amdaZWZzMzlsbFY4WTMzNlh0M3AyQkxKZndzeFEvVktwU0pQUnFyR0o0?=
 =?utf-8?B?cjQxdHovZzB6UGd2SFltODd2TWdMN2FERk5RUmpNWjRoTXBocE55S2lHZTIy?=
 =?utf-8?B?TzBvT1NYNFRXZkpmVGZrRnFUTTMySGY3TWhsOWtiRUxkTFp4Sk14azJqNis5?=
 =?utf-8?B?dVJrM2RKVlNEYWhsUGtMRFV6UFNmeGxaTzVRVDlQSkNxR3FGK0k1eit5RDRN?=
 =?utf-8?B?VVdRb1ZpZjRaekJuUWFUaldBUVRRUUEwU09LREtpendYaGVjUERxSUR0WU9l?=
 =?utf-8?B?eStqbTc4eDNhSnJ6S2lwaW8xVFBSYzVHc25hVW43VjczWTYvVnRCU2wzbGFU?=
 =?utf-8?B?TFkwdXVJUWFueDkwQ2Q1UU92ZENBNU5OTElYajM5cjQwd3AzbWdjbnV5UThn?=
 =?utf-8?B?bXBtaWlNc3l1YThMdTU1ZkNGS0d3YjYycTFoMFlkU1JYNXZVQXlwMHlaV2FJ?=
 =?utf-8?B?dUxEZXBDWGtXSjcvVDU2NGgwaTEvd0xzVUphaXZ2akdCUFcwRmpvMnFSN1FG?=
 =?utf-8?B?cmxkSWF6N1liM0pMUlZsUk85eHovWDJtaDEvQjlJVUp6ZUcvVVczSFRZQ2FP?=
 =?utf-8?B?bkluSncvK2tsUUJnVWVIL3BGY1Q0QlhnRDlnemJ0VnRYNWZWa2FsTUp2QkNu?=
 =?utf-8?B?QnZ3SUJQM2R6TXYrUzRqbys3QWprcHc5dWVyLytOR29vcFdGRlhFNi9qcnl4?=
 =?utf-8?B?OGYyaENydmhLRk5JUksyb21oK3grOEJqK1FiVjZONGxFQWxwclNjZWtBanFH?=
 =?utf-8?B?ZFpSR2NOQWpKN3JXWkxaVkdFOUxMWFI2NTYvWHJkSW84Z3VjWklaaWRsbFhz?=
 =?utf-8?B?RTYrQnQ0OU01cG1SQmxXYkpFNHozZWVXOFVSdkduSzhZZnFFM29KTXM3MFJa?=
 =?utf-8?B?andkOUZyQ2ozbXpiRjd5Y0tVa2pQVDdMVTNXU0RkZjloeFVTSXdoM21mcXJ3?=
 =?utf-8?B?R3M0RzdFUHYxT2pxSnFWSTVxTVpTY1BBK2d4dW94WU8ydmNyWWVJMFRqM1Ri?=
 =?utf-8?Q?OylojFnsfJVnigKymWgHor4R1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa89bfc-5d3e-42ab-1399-08dc1c09c69f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 11:52:29.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttm9Gnp4Er+7JoIVqE1phhuC3/HbZeD0cF/I8REE4nJHEA3gZRZCeUyaGWJXHCOW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.01.24 um 11:10 schrieb Paul Cercueil:
> Hi Christian,
>
> Le lundi 22 janvier 2024 à 14:41 +0100, Christian König a écrit :
>> Am 22.01.24 um 12:01 schrieb Paul Cercueil:
>>> Hi Christian,
>>>
>>> Le lundi 22 janvier 2024 à 11:35 +0100, Christian König a écrit :
>>>> Am 19.01.24 um 15:13 schrieb Paul Cercueil:
>>>>> These functions should be used by device drivers when they
>>>>> start
>>>>> and
>>>>> stop accessing the data of DMABUF. It allows DMABUF importers
>>>>> to
>>>>> cache
>>>>> the dma_buf_attachment while ensuring that the data they want
>>>>> to
>>>>> access
>>>>> is available for their device when the DMA transfers take
>>>>> place.
>>>> As Daniel already noted as well this is a complete no-go from the
>>>> DMA-buf design point of view.
>>> What do you mean "as Daniel already noted"? It was him who
>>> suggested
>>> this.
>> Sorry, I haven't fully catched up to the discussion then.
>>
>> In general DMA-buf is build around the idea that the data can be
>> accessed coherently by the involved devices.
>>
>> Having a begin/end of access for devices was brought up multiple
>> times
>> but so far rejected for good reasons.
> I would argue that if it was brought up multiple times, then there are
> also good reasons to support such a mechanism.
>
>> That an exporter has to call extra functions to access his own
>> buffers
>> is a complete no-go for the design since this forces exporters into
>> doing extra steps for allowing importers to access their data.
> Then what about we add these dma_buf_{begin,end}_access(), with only
> implementations for "dumb" exporters e.g. udmabuf or the dmabuf heaps?
> And only importers (who cache the mapping and actually care about non-
> coherency) would have to call these.

No, the problem is still that you would have to change all importers to 
mandatory use dma_buf_begin/end.

But going a step back caching the mapping is irrelevant for coherency. 
Even if you don't cache the mapping you don't get coherency.

In other words exporters are not require to call sync_to_cpu or 
sync_to_device when you create a mapping.

What exactly is your use case here? And why does coherency matters?

> At the very least, is there a way to check that "the data can be
> accessed coherently by the involved devices"? So that my importer can
> EPERM if there is no coherency vs. a device that's already attached.

Yeah, there is functionality for this in the DMA subsystem. I've once 
created prototype patches for enforcing the same coherency approach 
between importer and exporter, but we never got around to upstream them.



>
> Cheers,
> -Paul
>
>> That in turn is pretty much un-testable unless you have every
>> possible
>> importer around while testing the exporter.
>>
>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>> Cheers,
>>> -Paul
>>>
>>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>>
>>>>> ---
>>>>> v5: New patch
>>>>> ---
>>>>>     drivers/dma-buf/dma-buf.c | 66
>>>>> +++++++++++++++++++++++++++++++++++++++
>>>>>     include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
>>>>>     2 files changed, 103 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
>>>>> buf.c
>>>>> index 8fe5aa67b167..a8bab6c18fcd 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -830,6 +830,8 @@ static struct sg_table *
>>>>> __map_dma_buf(struct
>>>>> dma_buf_attachment *attach,
>>>>>      *     - dma_buf_mmap()
>>>>>      *     - dma_buf_begin_cpu_access()
>>>>>      *     - dma_buf_end_cpu_access()
>>>>> + *     - dma_buf_begin_access()
>>>>> + *     - dma_buf_end_access()
>>>>>      *     - dma_buf_map_attachment_unlocked()
>>>>>      *     - dma_buf_unmap_attachment_unlocked()
>>>>>      *     - dma_buf_vmap_unlocked()
>>>>> @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct
>>>>> dma_buf
>>>>> *dmabuf, struct iosys_map *map)
>>>>>     }
>>>>>     EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>>>>>     
>>>>> +/**
>>>>> + * @dma_buf_begin_access - Call before any hardware access
>>>>> from/to
>>>>> the DMABUF
>>>>> + * @attach:	[in]	attachment used for hardware access
>>>>> + * @sg_table:	[in]	scatterlist used for the DMA transfer
>>>>> + * @direction:  [in]    direction of DMA transfer
>>>>> + */
>>>>> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
>>>>> +			 struct sg_table *sgt, enum
>>>>> dma_data_direction dir)
>>>>> +{
>>>>> +	struct dma_buf *dmabuf;
>>>>> +	bool cookie;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (WARN_ON(!attach))
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	dmabuf = attach->dmabuf;
>>>>> +
>>>>> +	if (!dmabuf->ops->begin_access)
>>>>> +		return 0;
>>>>> +
>>>>> +	cookie = dma_fence_begin_signalling();
>>>>> +	ret = dmabuf->ops->begin_access(attach, sgt, dir);
>>>>> +	dma_fence_end_signalling(cookie);
>>>>> +
>>>>> +	if (WARN_ON_ONCE(ret))
>>>>> +		return ret;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
>>>>> +
>>>>> +/**
>>>>> + * @dma_buf_end_access - Call after any hardware access
>>>>> from/to
>>>>> the DMABUF
>>>>> + * @attach:	[in]	attachment used for hardware access
>>>>> + * @sg_table:	[in]	scatterlist used for the DMA transfer
>>>>> + * @direction:  [in]    direction of DMA transfer
>>>>> + */
>>>>> +int dma_buf_end_access(struct dma_buf_attachment *attach,
>>>>> +		       struct sg_table *sgt, enum
>>>>> dma_data_direction dir)
>>>>> +{
>>>>> +	struct dma_buf *dmabuf;
>>>>> +	bool cookie;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (WARN_ON(!attach))
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	dmabuf = attach->dmabuf;
>>>>> +
>>>>> +	if (!dmabuf->ops->end_access)
>>>>> +		return 0;
>>>>> +
>>>>> +	cookie = dma_fence_begin_signalling();
>>>>> +	ret = dmabuf->ops->end_access(attach, sgt, dir);
>>>>> +	dma_fence_end_signalling(cookie);
>>>>> +
>>>>> +	if (WARN_ON_ONCE(ret))
>>>>> +		return ret;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
>>>>> +
>>>>>     #ifdef CONFIG_DEBUG_FS
>>>>>     static int dma_buf_debug_show(struct seq_file *s, void
>>>>> *unused)
>>>>>     {
>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>> index 8ff4add71f88..8ba612c7cc16 100644
>>>>> --- a/include/linux/dma-buf.h
>>>>> +++ b/include/linux/dma-buf.h
>>>>> @@ -246,6 +246,38 @@ struct dma_buf_ops {
>>>>>     	 */
>>>>>     	int (*end_cpu_access)(struct dma_buf *, enum
>>>>> dma_data_direction);
>>>>>     
>>>>> +	/**
>>>>> +	 * @begin_access:
>>>>> +	 *
>>>>> +	 * This is called from dma_buf_begin_access() when a
>>>>> device driver
>>>>> +	 * wants to access the data of the DMABUF. The
>>>>> exporter
>>>>> can use this
>>>>> +	 * to flush/sync the caches if needed.
>>>>> +	 *
>>>>> +	 * This callback is optional.
>>>>> +	 *
>>>>> +	 * Returns:
>>>>> +	 *
>>>>> +	 * 0 on success or a negative error code on failure.
>>>>> +	 */
>>>>> +	int (*begin_access)(struct dma_buf_attachment *,
>>>>> struct
>>>>> sg_table *,
>>>>> +			    enum dma_data_direction);
>>>>> +
>>>>> +	/**
>>>>> +	 * @end_access:
>>>>> +	 *
>>>>> +	 * This is called from dma_buf_end_access() when a
>>>>> device
>>>>> driver is
>>>>> +	 * done accessing the data of the DMABUF. The exporter
>>>>> can
>>>>> use this
>>>>> +	 * to flush/sync the caches if needed.
>>>>> +	 *
>>>>> +	 * This callback is optional.
>>>>> +	 *
>>>>> +	 * Returns:
>>>>> +	 *
>>>>> +	 * 0 on success or a negative error code on failure.
>>>>> +	 */
>>>>> +	int (*end_access)(struct dma_buf_attachment *, struct
>>>>> sg_table *,
>>>>> +			  enum dma_data_direction);
>>>>> +
>>>>>     	/**
>>>>>     	 * @mmap:
>>>>>     	 *
>>>>> @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf
>>>>> *dmabuf,
>>>>>     int dma_buf_pin(struct dma_buf_attachment *attach);
>>>>>     void dma_buf_unpin(struct dma_buf_attachment *attach);
>>>>>     
>>>>> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
>>>>> +			 struct sg_table *sgt, enum
>>>>> dma_data_direction dir);
>>>>> +int dma_buf_end_access(struct dma_buf_attachment *attach,
>>>>> +		       struct sg_table *sgt, enum
>>>>> dma_data_direction dir);
>>>>> +
>>>>>     struct dma_buf *dma_buf_export(const struct
>>>>> dma_buf_export_info
>>>>> *exp_info);
>>>>>     
>>>>>     int dma_buf_fd(struct dma_buf *dmabuf, int flags);

