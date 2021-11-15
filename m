Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9D4503B2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E466E943;
	Mon, 15 Nov 2021 11:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422E6E943
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYSFfhU+N5Fq39gpw5NCsolRnyvMmfKTA5cWgJx3l903N5tP6BK6x7pUqmtcQZvyCwwzQwonnQGCZqIx/M4qourfwzBBS0SVUSHvvU6Vn4nZRrd/wffjMaX24XwtUxIdQAQntPFWRi0SjIWpG+72E2TIxwcuyY3/5+qkQiF8s3iNnNXmY4zdZ9fx48I5MHFePTx+VAyZvxzedsyfjjAxGaaaPl2uZagHTH9TDFFaAg/rHvH6O2vq0RwQIaMOGxhA8DgCmsj9dMlSloko0iLt+p2s/WUQShbSQrZq13R3POIyU6aCBx32Zz+biTbwpcXQyXxwfQIi+2nIruJQvuvwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkRdepoBhhvZgBl9zd4oG1PeOv+kPWSxKw1ORztFSv4=;
 b=hYGlnailNdl4CzgRcFMK/ZTAFR1Ipev9djYIyqc4j32m6sMsqyx1YxjcAPDo6Rnk3qtB+9sMag1rldkddxzJCBGDOLkgX7hQFl7AFRIQhpXLQsUek5IrCfbd0rGW4HpdbUxyGyRz70XnjFPSTGQFhlz7glYKDPeyHN/X3RtVBfrUG1ywFsVzjD6+I8Uc0O9jbG6Rw5S1/dydWeyovBOPcbUVYt1ZF0z7JDt4Tj90hAElD4cTmc/rfAt3eY3pB6pydnGu+nXJ5bKZIY/U7Wec+TwdXPNGU+ia5E4MN6xuL+kVLPNPa1G6h8qetsVTw5UYOkGtPZCxcR6pUKs0ocJTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkRdepoBhhvZgBl9zd4oG1PeOv+kPWSxKw1ORztFSv4=;
 b=4zNaX2CfJHDxjaHlT7C84/jyXuQUhJVYoDhuLfWp/MO0v73QSPzoDc9EiD6G3taNwfNkwRBOMm5VIiF2wOMmVeJmV2JabQp0VPjTYkXDZL9xbtuoXkdCtQFx1+Fz1GJhOnpgaIMZrSQ+DugqAkbmKW5Jp6o8P3GT/ZDzIFBk4xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1837.namprd12.prod.outlook.com
 (2603:10b6:300:113::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 11:42:20 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:42:20 +0000
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: Jianqun Xu <jay.xu@rock-chips.com>, sumit.semwal@linaro.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
Date: Mon, 15 Nov 2021 12:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211113062222.3743909-1-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR0301CA0041.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::32) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6]
 (2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6) by
 AS9PR0301CA0041.eurprd03.prod.outlook.com (2603:10a6:20b:469::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 11:42:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00ebe1d3-562c-44d3-ab7c-08d9a82cfb38
X-MS-TrafficTypeDiagnostic: MWHPR12MB1837:
X-Microsoft-Antispam-PRVS: <MWHPR12MB18370021933B2E90497B3E8C83989@MWHPR12MB1837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnNpT+UDEdrvmTrphgUzQsrIExW/nJQjCEAt6/leQnM/+F75uQ4P/gIEmE2mfi+FLGZoBp+qpesYv6TE414JsgHBjmPsq9wqAxODHs5+tKntVesYVzi2T3a+bor5SPTdHrjOyz4Lv5il0Z00hyIMOsC898lxdXNK3DY8ClRa/X+z05ZLWWI9kbXDjVdrVqmD31Ciy9En6YG1TKIV+epuDLGRKEvYe8NhgoFs6tUkQ/bWmTBdRJgllNrqms9k2nXdSN5hRpvEjPb3R0jF3kat4c9/g+R9ZfNDU0z3Qo2VAfydWQzqA1BIV1A7EDnRTXmW5vnAV79Migw7l8P0CqzM1nBlO5bCjKtHXPj4OXseQUwQWFO5216Sj4yR6FeIQFVrAO7lW3pd3S4bncIRU17nSaQPkQnnNSdXm0OBFoDdrVzhxYO5g7CoHdrAh0S0Y4Q8vQFqy36ujVGByHPPFfX+aaKXQ/BWnlM6tghXuVYUcoYtqlV4AJpRnByfYBQrumA1ouTLedvwpUsQlCItufU36509QJHuQ9oa3NDqXos2SPnUS/F/6HsBJHw63Rq1Jcd0WGmqDrp9wFQaK959C6zotCP8LC+p2pB0gQYgRieAeifspuQuKmSFk46/7OZfmlwmv8i1rhIK65/inlDat2eDtJBEpqk15UW3bMvw1g5dv5Kr9RmOvFfjfRv5uYDkmxM4OcYG/KHnhd59tAKjoVDXcLgv4Z/rf5i8pgCG0D7SWcZI1XNcdbglDuWiigm3ihyx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(7416002)(2616005)(6486002)(8936002)(8676002)(186003)(31686004)(66556008)(66476007)(86362001)(66946007)(83380400001)(31696002)(6666004)(508600001)(38100700002)(5660300002)(2906002)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmtQa3NIa1NhVm40N2lmZnBueGVQS3ZuTWpaWm4waU1IQ3kvYlFHSGI1ZllH?=
 =?utf-8?B?ek13MElkY3lWUlVuVWxJUkZPR0tlQ01FV0lCUnJrUWRSejg0WjZJWW5CTFdS?=
 =?utf-8?B?TDVMZTVHNitXaW9taUpweTFaL2pJS1NZbGJacnlDWVNyMFl3MjlkdGd3YTEr?=
 =?utf-8?B?MmRodnF3dnlzd0NKZEtZN1JaVFA2OTBJRGQ1WjZBUHROK0dhMlhMWWZkaUd3?=
 =?utf-8?B?RFlQd3NmNGRWZFZydFhXSVJyRmxQMEZDWlhxU3hMcDYzNUtJRGtHVzZtMmIx?=
 =?utf-8?B?NU5zT0VvNmI1MUE1WTRmQWRUZkM4aXFtYVBzK3ovM2E3dGFEQ2ZJZ1B5U2Vv?=
 =?utf-8?B?eWVQN0tEZUhFQi93ZG8zdFJaTjcwT2dUc3VzdTgzNzZsaVNuUHFOQjRFN2Nq?=
 =?utf-8?B?eGZJamhBMDhBbmhsRjhWUDY3dmFhODJKR0UwVWlFcW42TXR6Q2lRV0ZhQnJW?=
 =?utf-8?B?SVAvalMxUVpmSVNzWmxpR3Z1cWtYSTlXTHZOMUY4dExKMFJZcXl2UGZ5S2pZ?=
 =?utf-8?B?NVI2K0xOaFQ3QlMyYitGMDRxa2JCVHQrQW40VnpPUkJ4SDN2UjRnU29TeHFU?=
 =?utf-8?B?cUVVSjEzLzV1ZFFxcndBbkw0T2Q0MHo3YUtoOThVTlgxcm5odjlqVzBYUkV3?=
 =?utf-8?B?RzM1dmllc3pTSFIvS0xaNWVoVDNWVXQ3Q1NJc0NpcjAwWUY1VkR0eEFhZnRX?=
 =?utf-8?B?R3gyeEIyMjR3SGVDdDhUaGtmZWRJTnkyeWhuWkpIVVg2RHoxQWtrUEJtNjdv?=
 =?utf-8?B?YlNmbzI2ME1hQkcrVVBNQ1pFT1FWZFRZZFhyZE9OWWJzRUlDM29pQUJ0V24y?=
 =?utf-8?B?NjRQM2g0a0J4NzJVVGw1MDRqMXFndVBJellQazRvUnFVMHFLRlR2Q3lJMlpq?=
 =?utf-8?B?V1F3b1BwZFpUM2xyYUpvR0RTcDJEZ1dGZWdMdDVHYzd2eW5ZYnlwTXlrckpD?=
 =?utf-8?B?OTdGU0w1My9SUVRkdmk3L1VaWDJseUc3S2tjdFhEZ3dUeDZ1RVIrK2ZNUDkv?=
 =?utf-8?B?aU9NbkZqRFpPQzFvVFpOWHYzd2QxS256OTRKaVQrVlR3c29nNHdwcjVjVklD?=
 =?utf-8?B?cVp6dFN0TUpNMDd1SlFzRUx2SjlraVczakM3VmFJdExzVGJ5cXdmSGlKTTVx?=
 =?utf-8?B?dHNCaUFjVmRPZkRuVFp1RVhWTFB0L1FtNHI1TEZEcTFsQUFMNjdUMnIxaVZr?=
 =?utf-8?B?d09MaXhiSFlrMjhPOGxrcGFLVElSR1pOQkdMdG4wa1k1VktnVVRFTXU0QlJk?=
 =?utf-8?B?Z09uemlVVHJxUHNoY3d1UXIrOUxCMU85bHM1TlpYRzZGcHRRcndtbERtdU9s?=
 =?utf-8?B?VUZRaVY2Z3N2RnlFbk14L1lER2Jib0JSSVNyZkw3Wk1sVExYaDhnMXRDUkhv?=
 =?utf-8?B?Z0FyK0NmMDlEKzcxUTdUY3A5SFJBYUhCOEpIbFNTK3Vic2hxcXR5MWZUcFND?=
 =?utf-8?B?bDZlRnl0VkxWajFyeDF4SFpoQzJTbTNPU1U2c1c4TlhscWNQNXhRaWMxTG5G?=
 =?utf-8?B?emJtUURBZVlqT3cxR2hRdGFVZUh1akxuRHIwYlRPOWZZSnVKeXFvMCtlNTFT?=
 =?utf-8?B?Q3BvMGROdlZ2ZFJUNzYya3hvUVlHYmYzaGlSMHMyK1U0Nis1YksrWFZWc1JH?=
 =?utf-8?B?VHFoY0phcnNVdHNJN2Y4Z0lxRzhHRng0SWQ2NmJuZENWUE5uMktmZktpeTY2?=
 =?utf-8?B?dU15L0FOWDNobkJkN0x6RkdlY1BQalhSK3p0S2ZsTVpwUnFSN0l6S1RMcXJh?=
 =?utf-8?B?bnptcHlHc2VDVm50NW52MkRVK0FpbGpNb3JPektpc1pVM3BibGRhNklaMjVN?=
 =?utf-8?B?MTZxNFNOd2lTbDBhSk5XcFk0UTdZbXdsaW5BYm1kRzlGeThJOU4rMWNyL09l?=
 =?utf-8?B?N3ZTM1NSeUFraVMvVnJYcWhNRjFPOVZYNUhTRFUyWHo5QVpKZlhia05HQy9S?=
 =?utf-8?B?Uit6VG51RCtqWGJsNU4vRGlFVXhJdjh4Y1RhdWhEVVpVTUNpcGdMQUY2L005?=
 =?utf-8?B?WG9wejVLbEZjampPYVcxNDMySXNQelVEZEFGQWROZ2h4ZjFNOWR3c084SjFN?=
 =?utf-8?B?b2lMbThOZmdXQW84YWg4ekJyQW9mWStyZnMvV1JWd3lMajVEM2hTbFVUczNv?=
 =?utf-8?B?QmhyeVpQVVUrOUtyRWNjUXp2a1JhQUpsSnk0ZVlrSDdnaFFYaFVTdHpjM01O?=
 =?utf-8?Q?BO9RKUEVN4uMTDc9B3JQWSk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ebe1d3-562c-44d3-ab7c-08d9a82cfb38
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:42:19.8907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPSQhRvD4Dau5vTrINquy4Yo1A5DbJm3yOORz6qQDOx+umrhjPgdp0FqKASMDEeu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1837
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
Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 jason@jlekstrand.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.11.21 um 07:22 schrieb Jianqun Xu:
> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
> offset and len.

You have not given an use case for this so it is a bit hard to review. 
And from the existing use cases I don't see why this should be necessary.

Even worse from the existing backend implementation I don't even see how 
drivers should be able to fulfill this semantics.

Please explain further,
Christian.

>
> Change-Id: I03d2d2e10e48d32aa83c31abade57e0931e1be49
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>   drivers/dma-buf/dma-buf.c    | 42 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/dma-buf.h |  8 +++++++
>   2 files changed, 50 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d9948d58b3f4..78f37f7c3462 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -392,6 +392,7 @@ static long dma_buf_ioctl(struct file *file,
>   {
>   	struct dma_buf *dmabuf;
>   	struct dma_buf_sync sync;
> +	struct dma_buf_sync_partial sync_p;
>   	enum dma_data_direction direction;
>   	int ret;
>   
> @@ -430,6 +431,47 @@ static long dma_buf_ioctl(struct file *file,
>   	case DMA_BUF_SET_NAME_B:
>   		return dma_buf_set_name(dmabuf, (const char __user *)arg);
>   
> +	case DMA_BUF_IOCTL_SYNC_PARTIAL:
> +		if (copy_from_user(&sync_p, (void __user *) arg, sizeof(sync_p)))
> +			return -EFAULT;
> +
> +		if (sync_p.len == 0)
> +			return 0;
> +
> +		if ((sync_p.offset % cache_line_size()) || (sync_p.len % cache_line_size()))
> +			return -EINVAL;
> +
> +		if (sync_p.len > dmabuf->size || sync_p.offset > dmabuf->size - sync_p.len)
> +			return -EINVAL;
> +
> +		if (sync_p.flags & ~DMA_BUF_SYNC_VALID_FLAGS_MASK)
> +			return -EINVAL;
> +
> +		switch (sync_p.flags & DMA_BUF_SYNC_RW) {
> +		case DMA_BUF_SYNC_READ:
> +			direction = DMA_FROM_DEVICE;
> +			break;
> +		case DMA_BUF_SYNC_WRITE:
> +			direction = DMA_TO_DEVICE;
> +			break;
> +		case DMA_BUF_SYNC_RW:
> +			direction = DMA_BIDIRECTIONAL;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		if (sync_p.flags & DMA_BUF_SYNC_END)
> +			ret = dma_buf_end_cpu_access_partial(dmabuf, direction,
> +							     sync_p.offset,
> +							     sync_p.len);
> +		else
> +			ret = dma_buf_begin_cpu_access_partial(dmabuf, direction,
> +							       sync_p.offset,
> +							       sync_p.len);
> +
> +		return ret;
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3..6236c644624d 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -47,4 +47,12 @@ struct dma_buf_sync {
>   #define DMA_BUF_SET_NAME_A	_IOW(DMA_BUF_BASE, 1, u32)
>   #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, u64)
>   
> +struct dma_buf_sync_partial {
> +	__u64 flags;
> +	__u32 offset;
> +	__u32 len;
> +};
> +
> +#define DMA_BUF_IOCTL_SYNC_PARTIAL	_IOW(DMA_BUF_BASE, 2, struct dma_buf_sync_partial)
> +
>   #endif

