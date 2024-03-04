Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3E8702FD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 14:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1B6112176;
	Mon,  4 Mar 2024 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="idIDUDyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F2E11217B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 13:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn16UFm0O5iagcxEeJtK1PBZvg4yhkZuUoR8VhIkN2OxsfEOh+YWAnbPGLLasXs6jaqIa2CSNbjTltgiVFsXcy5TReSM43i/SORr3n0k07p1yg+4nNK1JmcM54Q3bBHVXjZ6teFMVUbYn2il68K65fXPcp4zfXbBcoEAVO7daRsoctnb1mn/XxtxNfn3HmuyZieqGuziFEgqjHNdY3lVeW3+nBy5Vv9eRLkkq3NhA0OdIyRQLsRys4MxSqakEOz9Jz+TlxwRbYphtxArwGFBq4SLSu7PEZkiYATv7fU1SXxXQdBO6WJWaQUXCQCAyvDU1KkWvHnPK2iwEJBcHbX3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePN3x23+roha51YUZlubH5rBXH/uv1grg1OOKxvKieY=;
 b=LZNNDmTplp0WYVqzD8GLQqvfMryPQwM1r88hwE/MdEVXRII5M4gVtfqyEewKgk6zDwl3jRENkcd3yHONJl5i/yiQUEaO5xDGOplqB+SsrKuBfX1WXb8siBXj2ZqrcUNrkyQ4l9RRw8PZMLx2AtqWt213eNI26RWHewL8LuXBDq2RGbejz8XOIbJA2uHUc+Mp3HYNSDolbGLETrMMS+CmfKq2aNm2ujlRCEHbfBm7sTtMTdhAmElYm90tycI3jhNJIAG0Oxdr+CZmrwAuSlI3POIv02kPxrMO3CVOk+UGVk+PKdrhU08CDd6ck3bPwwjMyLL4wlHpFD5A86fMsnBjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePN3x23+roha51YUZlubH5rBXH/uv1grg1OOKxvKieY=;
 b=idIDUDyLFcFqPp08V41AcXL68oqGrOeKbnJoyZ8fE/innNBTNdR35qeUE242sryNLwKaFsgjsP2Ee92hFsDbH84wfLwO7lOIexvdmg+IMY4C+J02l1RWvEpe0GlwaAUp4E5mDpg4cwQ44aegueEmYYXZEkLiWuZysklRVQegNKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 13:41:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Mon, 4 Mar 2024
 13:41:47 +0000
Message-ID: <8962f6cf-7e5e-4bfe-a86b-cbb66a815187@amd.com>
Date: Mon, 4 Mar 2024 14:41:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Nuno Sa <nuno.sa@analog.com>, Vinod Koul <vkoul@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
 <85782edb-4876-4cbd-ac14-abcbcfb58770@amd.com>
 <f40f018359d25c78abbeeb3ce02c5b761aabe900.camel@gmail.com>
 <796e8189-0e1a-46d4-8251-7963e56704ac@amd.com>
In-Reply-To: <796e8189-0e1a-46d4-8251-7963e56704ac@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0221.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b54a66-7fd4-4e34-2780-08dc3c50d6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eede40SCJBMqGPSZKeszytlopDweKdr+8vSMlfu6ae1KisVl+ATVVYjeFCrWUMNLpjwCr6N2jozx5JJ9IFOdmZEzm6Uk6EFnO7Mw9wuScCNEAmSBsrFU2mlG6vQAHh2KZ33gjqbFA8QkFPTdeZy8SJdWLnZIhOjUbwwHw6i5RTqTze/U59L4oTn+qk/drXZBUf8eGD78byHknxhI48p7tRaEBWAf/YpNxZqyp4NSriyVpYd0UPU1zVbMuUgU54N1V1qXeJ4hMtg5iX4TW7ct6EKFMVczaPQcVj3mFxiEkFsBDdyKTTs+q+xKLvlWdF89YePj9Zlty6nTHMJHjQo/kHZyArCBg6RFFZRo7+7Vf/feM52y+nhzPjF8S/WQVjqDtqvcMJcIUUi3lWIkRJ6AB4sUtKJtdBcOR8lRnoLUaf7TzjlGRQcYPWov6g08qj319C3pwdQ2WBGHLJcrTqhc7ienfMeG3RknHKaLj1To3ryI87O+22Gligz0BopECI+dNzZhrMJ91efhc1m5oU5I//eEGkBalVid9ovDrFQGTheJthV54AsUsOWoC0A+Yg/pc0qlZvEAHLn/9U+Iqhif2jtpz7NzN6P2PBA+ayh4UBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFBOR2R2am9xTVpISjFLcHYwMkdSRHlDcHpIamd4cVdyYUMycDVBR3ZWMjFD?=
 =?utf-8?B?UE9vT2NCdklFbmJKM1NZcDZKRUpnbTdwYzlEL09XUmVDSHpvcU81enpjQVYr?=
 =?utf-8?B?Yzd3Z2VkT29Ha2J2RXg0eXkyTDUrV0dMbWxLU0FseS8xeHk2UzJvdjV4MzNI?=
 =?utf-8?B?RkNpY3YwUXN5K2VXclNNMWk0NzZ5S2R2emhOZDFEWlhPUW44cmhaaW95SW9J?=
 =?utf-8?B?dm9ucjV2ZmM2YVJwanY0VlJHTUtSb3pUNHZMc3ZaN3NEMXovTGVIdUEyV2Ns?=
 =?utf-8?B?RkJndkJSYUsrZnJaeVBBeWJQaDl5c3N5U3VWV1FBZEpGUFRDSGZkd21Pbkd3?=
 =?utf-8?B?U3djYXBDZHBvR1pCUzNYUGRLUWpLdFM2U3Z0QTVWazlvZ2Rad05hd2JqTXZ1?=
 =?utf-8?B?ZE95Z3dVaks4aGFMSFRuREs2cW5LOXVwL081UnZSeTlkd2JZR1dSNDdVWEt6?=
 =?utf-8?B?VmNVMHMxNWhBanE2QzlQY1JKZXFZRTlCak1XRnhYSWNVaUpTR0tma3pCUkc3?=
 =?utf-8?B?aDJKbGRPRmRqaXVuRjBGc2R2MnBMUTk0RWI4NzEyVzY2MWZ0TmpYRERNMXh5?=
 =?utf-8?B?Ujd1aWh1Q0NKRDh2dkZLdWsrRDE2R3NHK0JONUMzUHM2U3BRallzOFVGd1hH?=
 =?utf-8?B?QnVOTVFOczRITlJSZVBZSkc2bEpSaHRKL1c3SHNUbENFRW5OOVB5SzR4TmVG?=
 =?utf-8?B?amh5WmN0TFFHd25uREswYjlBemxTekZLTUJmKzJCRjZLY0hGSWhMSnZ6eVJ4?=
 =?utf-8?B?dy92UzlTZFFJS00xUDR3M1NaYWlYbmVZV1p5RGpTT3NKTjgzRExBVDFDeWkx?=
 =?utf-8?B?MFNrdGI3clRyb0hESEF2NXNzVHh4eE4wNlZoMXAraFV6cEtaNEN5ZkxlWWFs?=
 =?utf-8?B?ejJYMEo3OGlncVZTYyt6SWdLR3NZSzBVTmJydS9hL2dUTythb2J4bVNRNmRn?=
 =?utf-8?B?SzBsRHpWYjdzQjBzNHhQTWFWdGxWSUlBTzNHMXkyNnRyZUxOd09YdnovY2Fp?=
 =?utf-8?B?cmM3MlJiOE9vN09jSjFCN2pUSDJpU2dPV0lnaGpVUUtvZ3FYVVppUDVReDRN?=
 =?utf-8?B?emtZbkZkRUNCYTlScVphMVhGeWJZaEpLbEFEenhzakJxb1h4NXoyWldVaTVp?=
 =?utf-8?B?V1ZwbUw4MDFWbEFtVDUyWmw5cUFZV1ZqcjZTTGVHQ2RObTU2d0xHUm5JdjBp?=
 =?utf-8?B?M2hrbHgxU1VyUExzMm1QNXNLSTdXK0FIb3NndW1OV08wR2ZZWXVsL1BRUE5X?=
 =?utf-8?B?VnB3ZFYvV2xSbTl3cExHdFhkeER1UExibHZ0c3ROSG9WR1N3d2xla0ZCRDZh?=
 =?utf-8?B?MVVsRTNFZnJqWFhnYkhvRUd0dWZXd1k3ZjIrYWZROG1IelhoRVBBdU5kMFo4?=
 =?utf-8?B?YlZGODQxU0tLQ3czM2FuNEtEOUZuV1U0TDRqYjYwUCtHNmdJNjJVU3k4Y1Iw?=
 =?utf-8?B?NW9yTTZYbHBiNWRvS3FKSDUxcnpsekIxOU1CZ3FFQ0hRSzIvRU0xSCs1VlJM?=
 =?utf-8?B?K0dYRUJyN1VQcXdCUnJPVWh6dVNXUkJiUVkxT3JHbVduUnVLd0lvL3BrUFRO?=
 =?utf-8?B?eUR6V1MxUENiZjdtVzdudGx6Y3loVXk1MEgrQ1l6YlFjeTRCMThndHNFeGFp?=
 =?utf-8?B?L1MxMlVuZzNpRnp2Z2FWcndXNjhRcUgra0NDNzFIUk1pa2RMcVJyRmdrTmFy?=
 =?utf-8?B?b1NVMTRxaVRtSkd2MkprR1VZVVZhZHRnTFBiTitLTXJhOXJkbUNKR2I4eWpR?=
 =?utf-8?B?VFgvZEpmK3VjL1BlN2RkL3JZNHVvSW5wOVJIZkxPc1VLa1E5YzZLZms0SWFh?=
 =?utf-8?B?UnNpUXF5QXlIMVVMSE1TRkw5aUZ6ckk4SmpHell3MStMc0lKWkNrMktlbHhz?=
 =?utf-8?B?R2hzTTRVVGtOL3cvUmFUUW80VVFKN0VsbEQvWldKYlF2K3k3WVVCZHdYdnkv?=
 =?utf-8?B?MkgyQW1QeThscFlRb3k1Q0ttUTVLbFE5aUUwR2d3R3pwM2YrQ09CMktLZ3JT?=
 =?utf-8?B?WVkvak9CamxJU0duM1VlZFZURXc0TjJWQU5sOHR6eXpyYXc2Q1o3OENyYldt?=
 =?utf-8?B?TXpGWjdGVkgzN01sT3RzdDZNWGg2MDIxdEh2SzdnNktvRW1vclZudEFqaE5q?=
 =?utf-8?Q?QvOWFDwv+KnWCdIyVoCiB8SMe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b54a66-7fd4-4e34-2780-08dc3c50d6a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 13:41:47.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLHolhMOrnukA8mrgNZmyEW1jZtdxErh7tpHPjBkUeDbGjdHamTceIBT0syZs2PG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
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

Trying to send this once more as text only.

Am 04.03.24 um 14:40 schrieb Christian König:
> Am 04.03.24 um 14:28 schrieb Nuno Sá:
>> On Mon, 2024-03-04 at 13:44 +0100, Christian König wrote:
>>> Am 23.02.24 um 13:14 schrieb Nuno Sa:
>>>> From: Paul Cercueil<paul@crapouillou.net>
>>>>
>>>> Add the necessary infrastructure to the IIO core to support a new
>>>> optional DMABUF based interface.
>>>>
>>>> With this new interface, DMABUF objects (externally created) can be
>>>> attached to a IIO buffer, and subsequently used for data transfer.
>>>>
>>>> A userspace application can then use this interface to share DMABUF
>>>> objects between several interfaces, allowing it to transfer data in a
>>>> zero-copy fashion, for instance between IIO and the USB stack.
>>>>
>>>> The userspace application can also memory-map the DMABUF objects, and
>>>> access the sample data directly. The advantage of doing this vs. the
>>>> read() interface is that it avoids an extra copy of the data between the
>>>> kernel and userspace. This is particularly userful for high-speed
>>>> devices which produce several megabytes or even gigabytes of data per
>>>> second.
>>>>
>>>> As part of the interface, 3 new IOCTLs have been added:
>>>>
>>>> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>>>>    Attach the DMABUF object identified by the given file descriptor to the
>>>>    buffer.
>>>>
>>>> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>>>>    Detach the DMABUF object identified by the given file descriptor from
>>>>    the buffer. Note that closing the IIO buffer's file descriptor will
>>>>    automatically detach all previously attached DMABUF objects.
>>>>
>>>> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>>>>    Request a data transfer to/from the given DMABUF object. Its file
>>>>    descriptor, as well as the transfer size and flags are provided in the
>>>>    "iio_dmabuf" structure.
>>>>
>>>> These three IOCTLs have to be performed on the IIO buffer's file
>>>> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
>>> A few nit picks and one bug below, apart from that looks good to me.
>> Hi Christian,
>>
>> Thanks for looking at it. I'll just add some comment on the bug below and for
>> the other stuff I hope Paul is already able to step in and reply to it. My
>> assumption (which seems to be wrong) is that the dmabuf bits should be already
>> good to go as they should be pretty similar to the USB part of it.
>>
>> ...
>>
>>>> +	if (dma_to_ram) {
>>>> +		/*
>>>> +		 * If we're writing to the DMABUF, make sure we don't have
>>>> +		 * readers
>>>> +		 */
>>>> +		retl = dma_resv_wait_timeout(dmabuf->resv,
>>>> +					     DMA_RESV_USAGE_READ, true,
>>>> +					     timeout);
>>>> +		if (retl == 0)
>>>> +			retl = -EBUSY;
>>>> +		if (retl < 0) {
>>>> +			ret = (int)retl;
>>>> +			goto err_resv_unlock;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (buffer->access->lock_queue)
>>>> +		buffer->access->lock_queue(buffer);
>>>> +
>>>> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>>>> +	if (ret)
>>>> +		goto err_queue_unlock;
>>>> +
>>>> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
>>>> +			   dma_resv_usage_rw(dma_to_ram));
>>> That is incorrect use of the function dma_resv_usage_rw(). That function
>>> is for retrieving fences and not adding them.
>>>
>>> See the function implementation and comments, when you use it like this
>>> you get exactly what you don't want.
>>>
>> Does that mean that the USB stuff [1] is also wrong?
>>
>> [1]:https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/drivers/usb/gadget/function/f_fs.c?h=usb-next#n1669
>
> Yes, that's broken as well. The dma_resv_usage_rw() function is 
> supposed to be used while retrieving fences.
>
> In other words your "if (dma_to_ram) ..." above is incorrect as well. 
> That one should look more like this:
> /*
>   * Writes needs to wait for other writes and reads, but readers only have to wait for writers.
>   */
>
> retl = dma_resv_wait_timeout(dmabuf->resv, dma_resv_usage_rw(dma_to_ram), timeout);
>
> Regards,
> Christian.
>
>> - Nuno Sá
>>
>>
>

