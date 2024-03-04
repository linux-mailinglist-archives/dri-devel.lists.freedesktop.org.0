Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDD87050D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93110E9E9;
	Mon,  4 Mar 2024 15:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h5xx+kOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB7C10E9E9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQIrYnQEDmBPUnL3dPpAmWHEGULn6xH76Vqq4k++91DtaRJx4iIlKxx0IrLP6Iy/nITRb+1ZOJnafMI6ArdN7gQ4oRyjNTFutXCJUWy/UzdsZnDrUCT32SqnKBV+cpx0tBAjUyX4EKHilWpno9u9IYGeHConIoc2I8kfbK4WQavDzpHuW+KtN9xe4L76HuQgwnT3dUFtTA4FUDfERXlSUsrf06weIpp4mWOXJSobXpidwCn1floxPDI2B09+kr6XquyoqJdFqI54iRA6foUABtcJrYT9BteazktVweCfv5XxOsVC2DgzcaEEqvv35WRLfpPZBukSXOOmQEd6et11Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2yBKDtNma32BwfBFI8tv+VTE3pOWFtf4koMy/uCcUY=;
 b=ZESXFk9AVyDTeMJgQQWZJkIKhTo2OZwZ5Gj1VLBZIagSnfXapi3tWR3KsB2ahGKjPoZGJfBfgalQfJIaPBtSprqDwmfafB5tDCrk5vLgbyklZrx7MXwMra0DsvpeCSgCem5Wp08/cWCqSwMUGjEszaak1rziyAOYQzggoUPf+C+TS5oC1uk+QgBlNzw08UGj5GKsAZuELnlntW1Bmz6+Jj3/BsUW4PculE3jYemcmobT3fB4kf6tI0CqkQxBJfvJsfUlx9gsc6M9jJnbjHCe1oG4ri5NqENv9rT3Ji/Xe2L5HLh2I7zRO/A9wsXpxO1EoLtHiCpGMokqYmvVh7MMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2yBKDtNma32BwfBFI8tv+VTE3pOWFtf4koMy/uCcUY=;
 b=h5xx+kOAzOKUfkdWM2IKNzoweTVlTEhHZUDALa/yMxoUNxpaRAaQdQMJU1M2YmtEA+zJKrvSzrkuUmMDjOrCKDw/CST9C3OVtNXmh4viHa0zQb6occhXEz8xWVDjTcblkuG4pIbjXrinUbSgpERPfVGiFa1I4k88/V50QUkF238=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7034.namprd12.prod.outlook.com (2603:10b6:a03:449::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 15:13:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Mon, 4 Mar 2024
 15:13:57 +0000
Message-ID: <4131f2c2-1143-4de5-82d4-337359b1f20e@amd.com>
Date: Mon, 4 Mar 2024 16:13:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
 Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>
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
 <8962f6cf-7e5e-4bfe-a86b-cbb66a815187@amd.com>
 <b00a1fc2ea51816317bf7475f32f85696bd29b4e.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b00a1fc2ea51816317bf7475f32f85696bd29b4e.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0114.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ebd2a7-11bc-4a3b-50b5-08dc3c5db69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjzTpePNtf+43rIN34u4q3Mf7XEIkWcefGbda4UHo8j+FTL4i2HRSbLv3RfkPuhNcqrO8v+jt8ZZbJlHXKTUz84MH5xqUSVCAohu/7uGri/Raas3bAPG+OEhTTrtOoiZbUL+xS1W20krFeUIMnARmPefMWvl8o7LF5a2AXPwY8phk4eDJ0ogdHZ2sVVi9JsxX+95rySfL0Oy5YCCqTBhCQuFl/hl4QEzUuFM/joHg0Qw2K8THsfAQbv/FHHmOvHt8wtghTGFiYytI8yUi9SDAiykfnnHyK2bIUhwvkcPTi/A3hwb5pMMe3PaufNrHqh/2P9qLjXmLi/JH5IFv3bZD3g6cpXByWCDEMkdaZFwbPlHqLy/WmapNy/anAfAnnSf08akBslp2PRPE/WNBcxjGoBDfmL9fkMSL3k29lZF3kleY7xw0F6BqEd6Cf/JLeKlQ4RLo+2S+6ihHMNB0ppqu4lc0KPWiwwb0AYIw9R0wY8CWo+hUA95C1IJDf+MUmWex/yDROcYSLu6bNmljps9uaOXHdnzJXHV9e7UgdMcWx3O5kEeRJHJhmjNmMAqABNS8IYb49AiYijNp3jep2ZJiCil21oZJT1rNYfdLLHpYG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVVKcEROOGNVNnVIYm9hY3Fud0tNdUdxeWZzaVE4SHhsNWd2MXpDN253VTQ1?=
 =?utf-8?B?UnQ2cTYwN3NsTnpQVll5VjRhYlAxbUZVeTQvcTZPYk00dkFVRFBRWnNERmF0?=
 =?utf-8?B?cEVFUjNvK2pDbU5ZZnJaRzZoL3ZFSmpCZzFaYytiWE1sL3JlL2NTeEdnSHY5?=
 =?utf-8?B?M080cTVxcFM4MWZkQ255NmpyQmZUL0ZpOWswMDU5aW9JV3pXTEJJdnZCb0FY?=
 =?utf-8?B?QllWeEFEMnRmMVBteGY1ZHJqUjVDSVJBM2NPdWdWMlRIUUpoZlhsZHIyVjR6?=
 =?utf-8?B?dVh3UFJLNVdWaThJeDM0dExpeE1EYnpnRHBEMDYxSHcrYzBtTW1XRVozNmVO?=
 =?utf-8?B?VTBVTHpJQlZ5N3JWSkhSeW1HOWlzT3dKRWZ6SC8zTGwzanZJNDVSU2I2MUE2?=
 =?utf-8?B?eG1UTXpzaWJwZkpZNGQyS2NRVTZBWnhKRnpxT2ZFNlptdDdGTm5aeVRTU0U5?=
 =?utf-8?B?TzRYOURrc3N1cTl1emNGbVRRUWRkWW4ySi8wa0hWZmd0S3hJc3JwaURIVmNG?=
 =?utf-8?B?Y2xSc0xLTlN1akxlQldGdXV4cmVFdHc2R0xlTXRPaFBOWFBqeUxOT3d5WFI3?=
 =?utf-8?B?a2YyNWtQSkFqcFNldncyMEJUa0U3eHV1R2E0MUl4R0VuWkIyNUxoOFJJSXR0?=
 =?utf-8?B?MmE5dWxubG1tcGZGZGJKWFJDZG5peHJBeFZEQzNlczM4akVMZzZHQXBwNlpN?=
 =?utf-8?B?RVY0eitlWVVvY3pPcjg4VUliV1RpRy92WkVidDNzb1NLRVdhQ3dkYm1WQkxN?=
 =?utf-8?B?YTFzUHg1aWNBWEpQZ1ZTbjV2dCszNDJoUnpVeGVpZ0NlT0s3RE1EKzFBeE1v?=
 =?utf-8?B?SEcwWExvaklaMTEycnZ6YUxXeVdnMExNZlI2WW44VEVabmhYdUI1SldScjU1?=
 =?utf-8?B?bGUyeUtoa0pnOENGd2pHU0tjOC9oTCtJZmxSL3pYNXhoN1FaNUNpRWdDaVpL?=
 =?utf-8?B?TkpNYmFDLzQvdEc0em5Sa3M2Wkp3dDIwWVZlL1k2bEFrekdwVzYvSXRSK0xo?=
 =?utf-8?B?WUozVFlYdDBJbGFHUC83VCtSZE1zUjhhTzcvQlUrSnhudDZrb0ZJU091YUpB?=
 =?utf-8?B?dktqaFloWExMR3pTbkVyMkhGMGUvQndCZGZIYnBra0RtQkh4ODQ1ejBWeDZU?=
 =?utf-8?B?cVcwMGFMTkNIc2I4RndQYkxyOWNyWmNzdVRla1Jqek4xQ1ZiTGxPSnZTWll5?=
 =?utf-8?B?RnZCWW1tUzJYdmJMUVRGUk5heDlOYTlZOHd3bHNXVjhsZnIyZFJkWlh4Rjhr?=
 =?utf-8?B?ckQwaHpJZFBmVmZWbERqNENSZWhyTTkrNndzSlliRUY5RythVEhFT3FyS1cy?=
 =?utf-8?B?UWpId0ZhSlp4V1h0Rm13NWo0dTJTa2FZaWtDTStKUXptaERYSDUvTkZWKzJp?=
 =?utf-8?B?YlRjMXFsa1l4TENRR1o3WkxTYlQ5TzI2VXdXNzN4ckdITjRmT1g5Q015S1hP?=
 =?utf-8?B?UEJ5UDhtNERnbGRKTTMzZHZxU0hnQXRhanJrYjJzZytqcjRKZy9qSnFpZXZw?=
 =?utf-8?B?SU8zWWNGdFNDcFA5TUl1bUxYK0cxYjY3TE1pKzRkd1pRQW1wRCt3anJFZy9P?=
 =?utf-8?B?TjRNZWk4MlB1d2UyK0FEeHRrSEdDTnNFSmxPYmZKRU5rR2tlVm1KNVBvOEhM?=
 =?utf-8?B?d0E2ZWY1OHpKYUNMZysyZVYvVHZlczZKNUhRQlYxZkpEWEF0MVphdThaSWdt?=
 =?utf-8?B?QXRvL0o1YUFlS3FJWVFCaWtLb0NMTmFqMGdIMy9LQm1BZHFDUGtkend3cFZG?=
 =?utf-8?B?MC95UjBUcTQ1RGlVdURJZ2doRlFrN1BSeU14Qm12Z25qaUhWdTJTbVNnaXJI?=
 =?utf-8?B?Zm5tN3JrRHAwbFE1b0JlTU8yR0k4NTlxbjhObHV4bEk5RHJlVkhqYkpYenp0?=
 =?utf-8?B?Mm0zbmQzNmNsd3NOOWZMelZlNktmaW9ZZUl6dmd1U1FuTld6a1h2NTIxZytF?=
 =?utf-8?B?c3FYeVhtYUdTWHNZWWR1K0N3QkZIK3poUisrK1k5QjZBNCt4VUFzVWdRbzZ4?=
 =?utf-8?B?clVwYUdpT1NWZncyWFBaQksyZXBXZ3ZQMXpwY3VERkpUUmZyU3RmcUppeEhD?=
 =?utf-8?B?aWdNZ1JwV1ViZUpKQkxncmpyNS82SVBZcG00OUZ1d2duNWo3YnpxdWZseEl6?=
 =?utf-8?Q?7CsI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ebd2a7-11bc-4a3b-50b5-08dc3c5db69e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 15:13:57.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJnV7ZJo/JNFlZQFQQnnxrxM9V1pDWCvRx3uZjQSsmcpVgm/OqVA0Y7X4vtrT8AQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7034
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

Am 04.03.24 um 15:29 schrieb Paul Cercueil:
> Le lundi 04 mars 2024 à 14:41 +0100, Christian König a écrit :
>> Trying to send this once more as text only.
>>
>> Am 04.03.24 um 14:40 schrieb Christian König:
>>> Am 04.03.24 um 14:28 schrieb Nuno Sá:
>>>> On Mon, 2024-03-04 at 13:44 +0100, Christian König wrote:
>>>>> Am 23.02.24 um 13:14 schrieb Nuno Sa:
>>>>>> From: Paul Cercueil<paul@crapouillou.net>
>>>>>>
>>>>>> Add the necessary infrastructure to the IIO core to support a
>>>>>> new
>>>>>> optional DMABUF based interface.
>>>>>>
>>>>>> With this new interface, DMABUF objects (externally created)
>>>>>> can be
>>>>>> attached to a IIO buffer, and subsequently used for data
>>>>>> transfer.
>>>>>>
>>>>>> A userspace application can then use this interface to share
>>>>>> DMABUF
>>>>>> objects between several interfaces, allowing it to transfer
>>>>>> data in a
>>>>>> zero-copy fashion, for instance between IIO and the USB
>>>>>> stack.
>>>>>>
>>>>>> The userspace application can also memory-map the DMABUF
>>>>>> objects, and
>>>>>> access the sample data directly. The advantage of doing this
>>>>>> vs. the
>>>>>> read() interface is that it avoids an extra copy of the data
>>>>>> between the
>>>>>> kernel and userspace. This is particularly userful for high-
>>>>>> speed
>>>>>> devices which produce several megabytes or even gigabytes of
>>>>>> data per
>>>>>> second.
>>>>>>
>>>>>> As part of the interface, 3 new IOCTLs have been added:
>>>>>>
>>>>>> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>>>>>>     Attach the DMABUF object identified by the given file
>>>>>> descriptor to the
>>>>>>     buffer.
>>>>>>
>>>>>> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>>>>>>     Detach the DMABUF object identified by the given file
>>>>>> descriptor from
>>>>>>     the buffer. Note that closing the IIO buffer's file
>>>>>> descriptor will
>>>>>>     automatically detach all previously attached DMABUF
>>>>>> objects.
>>>>>>
>>>>>> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>>>>>>     Request a data transfer to/from the given DMABUF object.
>>>>>> Its file
>>>>>>     descriptor, as well as the transfer size and flags are
>>>>>> provided in the
>>>>>>     "iio_dmabuf" structure.
>>>>>>
>>>>>> These three IOCTLs have to be performed on the IIO buffer's
>>>>>> file
>>>>>> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL()
>>>>>> ioctl.
>>>>> A few nit picks and one bug below, apart from that looks good
>>>>> to me.
>>>> Hi Christian,
>>>>
>>>> Thanks for looking at it. I'll just add some comment on the bug
>>>> below and for
>>>> the other stuff I hope Paul is already able to step in and reply
>>>> to it. My
>>>> assumption (which seems to be wrong) is that the dmabuf bits
>>>> should be already
>>>> good to go as they should be pretty similar to the USB part of
>>>> it.
>>>>
>>>> ...
>>>>
>>>>>> +	if (dma_to_ram) {
>>>>>> +		/*
>>>>>> +		 * If we're writing to the DMABUF, make sure
>>>>>> we don't have
>>>>>> +		 * readers
>>>>>> +		 */
>>>>>> +		retl = dma_resv_wait_timeout(dmabuf->resv,
>>>>>> +					
>>>>>> DMA_RESV_USAGE_READ, true,
>>>>>> +					     timeout);
>>>>>> +		if (retl == 0)
>>>>>> +			retl = -EBUSY;
>>>>>> +		if (retl < 0) {
>>>>>> +			ret = (int)retl;
>>>>>> +			goto err_resv_unlock;
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>> +	if (buffer->access->lock_queue)
>>>>>> +		buffer->access->lock_queue(buffer);
>>>>>> +
>>>>>> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
>>>>>> +	if (ret)
>>>>>> +		goto err_queue_unlock;
>>>>>> +
>>>>>> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
>>>>>> +			   dma_resv_usage_rw(dma_to_ram));
>>>>> That is incorrect use of the function dma_resv_usage_rw(). That
>>>>> function
>>>>> is for retrieving fences and not adding them.
>>>>>
>>>>> See the function implementation and comments, when you use it
>>>>> like this
>>>>> you get exactly what you don't want.
>>>>>
>>>> Does that mean that the USB stuff [1] is also wrong?
>>>>
>>>> [1]:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tr
>>>> ee/drivers/usb/gadget/function/f_fs.c?h=usb-next#n1669
>>> Yes, that's broken as well. The dma_resv_usage_rw() function is
>>> supposed to be used while retrieving fences.
> Ok, I'll fix it there too.
>
>>> In other words your "if (dma_to_ram) ..." above is incorrect as
>>> well.
>>> That one should look more like this:
>>> /*
>>>    * Writes needs to wait for other writes and reads, but readers
>>> only have to wait for writers.
>>>    */
>>>
>>> retl = dma_resv_wait_timeout(dmabuf->resv,
>>> dma_resv_usage_rw(dma_to_ram), timeout);
> When writing the DMABUF, the USB code (and the IIO code above) will
> wait for writers/readers, but it does so through two consecutive calls
> to dma_resv_wait_timeout (because I did not know the proper usage - I
> thought I had to check both manually).

Yeah, see the documentation on the dma_resv_usage enum. Basically you 
have KERNEL>WRITE>READ>BOOKKEEP.

When waiting for READ you automatically wait for WRITE and KERNEL as 
well. So no need for two calls to the wait function.

If you have any idea how to improve the documentation feel free to 
suggest, it's certainly not obvious how that works :)

Cheers,
Christian.

>
> So this code block should technically be correct; but I'll update this
> code nonetheless.
>
>>> Regards,
>>> Christian.
> Cheers,
> -Paul

