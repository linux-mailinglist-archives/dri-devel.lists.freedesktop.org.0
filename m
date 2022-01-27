Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E249DB62
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 08:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21FB10E4AA;
	Thu, 27 Jan 2022 07:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE69610E3DC;
 Thu, 27 Jan 2022 07:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNm78A/NVNaMawugXsb0LMZ2tlkEL56I793qUYCUIQ+SiRUhNMF5IQeUhBk0nnwbaFOY65f8K1qXoQ3HBXHtTyH6Bg7pJk25s8VhXpqIZB5PsIrghhItJ/pRVw+T2xG5lAeqgkIK0zL2UkGh04HdJvn5AYeHdlPsHDwCPUdlWm6RV/NHHAKk7FwcKpm0m5m4ierl6JRRyUpuTeg9pI4tgYv0WXopU6/RC29AwyocxvjFORiEpdxp2mCe0dPyBALm0XLJTrctwMRqKo8OAFXMvDcMj/JRTsnEamd/dXe9fbsQZKEcwXlBuziAuJhceW8tGEilfurnbopGLUEUuz2f5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yp8HFlhJFEFbE20JD0bQw7xyEdubMt9QjM9zB124M38=;
 b=V4V64Gal2pj4+IG1M1RoiW77gExTVlU2/I98WOyoi/kAG89teT4tqC/NiS1Hdj5JVF3hezTG2VLcUh8Qdg0YpmKMgQzoazlTixLfEcgUNuj6l5alWmFdidLmBDM60jJoft0JjX0eUgAUZtcBi6yhMV3HaiHd8FYkGPZp5BmBuhkefbAZv28bRjx/hzV4Dowr2CEx3uhNmLQDUxqfNl0umIbR6cSt/gjwnUq5Bw7+MuO9NHtLHNe2kiI+Ff52P0R5lIeLWsLrm1ImWQqgX65PadcSb3k0kMIqpOwYdVx65JDn3YTjYtl30ZlMZNpw8XeZ8Zt0nGNNAW6Q7fEwKx4UfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp8HFlhJFEFbE20JD0bQw7xyEdubMt9QjM9zB124M38=;
 b=yX0PQkFTMA2yAc+zBYjRgOFzqs+fzcBB8Ghnbbc0nGRZvBlHEv6ty12r2b/GFU7kCwvVX1oneQ5PnP21iqdDro8duTBJjyHAD+CVamJL2YyMUJP/XpVyJiQGrbwLGn1bo8ckZtdxpDiCfTL3Xjj0lRkqL4EXyI7LBKYvm887BlY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (20.178.210.205) by
 DM6PR12MB2603.namprd12.prod.outlook.com (20.176.116.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 07:24:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 07:24:11 +0000
Message-ID: <91bfa9d4-99fc-767e-5ba2-a2643cf585f5@amd.com>
Date: Thu, 27 Jan 2022 08:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/19] dma-buf-map: Add read/write helpers
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220126203702.1784589-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35acb5b7-c4d5-4fcd-d278-08d9e1660361
X-MS-TrafficTypeDiagnostic: DM6PR12MB2603:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB260385BD0CA15F3A30FAD28183219@DM6PR12MB2603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJADHa2OM/pw51+qn6id0/QobI1nmA26Q2lQMW5GxLm/d66q8rQMnNsRW26qvJRcMOIMZKvGH1+VypCTzJfLoIbxSO66PlGPcVUVxvpkpoAdWKxxFzWn+XvP+eaUdSNvMoToFqEgMi6/hLzsPCwCbOTuupnhyPHrdhbqXppk0ylCxCx9TIA5dWegZk9yWWHyXbyXgBjpWKWF8/QN3g5OrZpaW6I+IdXfjMO+o/L2TkMCDVE/Mkrb/MvPi+9rp80wvNWTRDZwkcFR9+XYsB0LicabSHS/f3+d+F47U4iit7vFJiGzhMGyaQz9uU4Lj5lDz2Mvx7TJUUqPozogl/aBLSTd0VtO72jwzUYcf/RmLL6vWOMkE6CL3COfjT8uxiXc6InoDz5IPhml2PV5FjD/Ja3l+wP0DsVrHcdTkn7PEGCQDkPaiUAO1Og21UMdRyP5+sJCxLXAD2rhJ8VLqREoRCSdZ+GR1iUy4fUJ/XOZiTr9BbB+2+ExtQ5/nYd+ofM0VlG62XnFD27CLYtnEQkBNY9hX5zOIQYKPOJJkMi1kWE3C7B337ddQ8qAN78pMpTATVe29n7f8/6SoqMv8aPeZ3f/z0Qvda22ShFw7KKRLUmtWbw2E2/uCvt2mNNU2Zh/oyw/iT+hstYnfDP0a2jKzqvWe6wINuwVJXHDRdKYO5oAhlEiAhd3HqDXBzpLRxiNLl7e0MmlbszcSL+aiSWoB7z0m02ezUI/Zo6/ihLyN4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(38100700002)(5660300002)(66946007)(31696002)(2906002)(66476007)(8936002)(8676002)(316002)(66556008)(6666004)(31686004)(86362001)(4326008)(508600001)(2616005)(83380400001)(6512007)(26005)(6506007)(6486002)(36756003)(186003)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlRZM0c4akFpdFkyT25oelBXaUgva0ZxRnRCZXZJZjFnNUpoNzkzQlNnVUdB?=
 =?utf-8?B?bUtKSVJ0NndFUmVYNVV4MnNpcnVpS3l4alRVOU1BQXVhVHRLczlwMWUvN3Fr?=
 =?utf-8?B?R1M5N0JSTFR4TjRUTmUwM0gxcUZXd1oyTCt1L2EyYi9HODVpT2dYRXdUZm5v?=
 =?utf-8?B?U1Y0Qy9uMU4yclh3WHJYSE9zeTVOdTVOekJaQjB5OEtZWm9jNjlXQ3Y0TXQ3?=
 =?utf-8?B?Z1ZpTXk2Sm54MTdyNDB5bDVTZWEzN0ljQnEwaUxqMmxuSTIyZVRnUjd4NHRO?=
 =?utf-8?B?am4wSzZETi82S1MrOFFXbWdmZTlIVUpWNjEwNDRWY1BaZDVJQUVtcmNVOE1P?=
 =?utf-8?B?QXB6OFhXT1RRMXZ6L0NoSzNlOS9SN055RWVHZk4yVCtTNWNxUzllRGIzNld5?=
 =?utf-8?B?cXJlbXlmcE9KVWFPQm9kNVpCajlFMUNXN2gyTzdJZ2tyUk9ZYlRzRm03Z2FR?=
 =?utf-8?B?eDhVQ2FvOWtVRStCUnNudmtHazlBcUN4ZHhmY1ZJT1YzblpGc1VkRTgvQVBK?=
 =?utf-8?B?VjNRSm9yMno0eEVnekpvZWRnM3k2dW1YSmJmWUxhaHczR2lpNWVTWWJDWFNl?=
 =?utf-8?B?WGw0a3h2NVJwK3BweVZoQ0o4ZTRjVUp3Sk9PdkpoM2FZVUttS1VHNU5YWEZ3?=
 =?utf-8?B?bDltRFVaTmFWMGhNNGV3aElsZzZuRU1mY1N2dDVQVVJXMjNLSFdZWnUwN0VF?=
 =?utf-8?B?aGtTbmpNdkxpdjRzTG5kb29FWnZUUHppSXk1bnVqY1dyOXhqV2VPSWtuZWtX?=
 =?utf-8?B?QkFqUzFZQ1FiMVJQT0pIYzUwYUxnelBlcUNsRVBpYmswalhZc2pON1h0OVNJ?=
 =?utf-8?B?RzFNK1Q1aUhrMjR6eU45N2llbUlrSGpYa2c4bzVRajNtYmJYUkFicWM0V1Ax?=
 =?utf-8?B?VTNML0xkSnVMcFg3ckhvemU1SXdRbmsrTTNDdEVacFM4c2tORHJTRTdxUDdu?=
 =?utf-8?B?VlgrdXRYQlFQdmlISXJsYjVqM1NuV3JRRjVWRlMxK1hrWGhFMHRxWmVZZEhY?=
 =?utf-8?B?ci94TzErTXlHYmprNFkvekwxVVc1anptRCtiU2hXMW1vRGpGZnFuVmZDKzVT?=
 =?utf-8?B?SHF3TnR5K3c3Y1VGaU1nVzZZTHo1VExPbkxibGtFOGtRRUNnUmJEdzErTFgr?=
 =?utf-8?B?Sk9OR3FyaEs1emxhZWNIM2NOaEN2L3lRT2pjNTZRS2RHd0J4eXdqZ0h1eTFQ?=
 =?utf-8?B?WDcvanRaZ0lGbnFidDhDa24vSnJIMkxKUFJSUnZhNUtubFpGVWtaSHRRZzhY?=
 =?utf-8?B?RGNkalZuZzM4MDBLZWgxc0pxQncyaVhuREsrQjZCd1M0RHhSUEhUK0l5eWFi?=
 =?utf-8?B?MlFyM1B4STM0c1RGRlBkM1dFYkdxTExhT3h0NG02Tk5vT0JUSVNHN2ZnY0pC?=
 =?utf-8?B?MmdYTmtTU0xucUR5WGlrV2V4V09IeExCMVhPdjgyRVVPODNPbW84WGp6THpL?=
 =?utf-8?B?ZDRlcWZYaWNvS0RMdVcrMnV0dXZKUFdUU0ZMK1JmUTdRZXIyWkhpaHBLaXBG?=
 =?utf-8?B?MjRSc01RVk9QVnJtM1hId1crbVBYM1MzeHZtSDVMZkN6R0tZNFJiUURRYjhK?=
 =?utf-8?B?MFNzV3lLcmp0ZkJIYzM5WVhmZmUxOHUzaEo3SnF3allqMWxwTDZJZDM5NVFw?=
 =?utf-8?B?eXNjc2lKU3J0aWNZd0FVby9ZZmZRcVNuOEZyM2NLVEVSdWJQVzIzK3ZPZmRW?=
 =?utf-8?B?Y3JQWDZiakFMN29OZVUxZVp1SGZDdW5CUFFzQVEvNW94b21Xd3ZHQlFxbGx1?=
 =?utf-8?B?REdhbmlrMUE0MzJON0w3emJiMDZjZDVXUGp5cXF3YTR0SHJFUzlOQ3Uxdndz?=
 =?utf-8?B?SVRJZTFXZnFUVEhiOVNTTWdxSlA2dmliVUM3ZGV2ZlRRZ28wYnNsMXkybnBz?=
 =?utf-8?B?STQrZTJidk1SQWxtY2pYcUcrZjJlZ2h1V1k4Q2p2Slg5WUsxRGJYQ05mb0Vl?=
 =?utf-8?B?V29TN1Zab0J6R1Y5QmREOFptSzJUdzRTWGRGY053b0FISlFlOU5zSG1zS3Aw?=
 =?utf-8?B?QVJySWk4UVltYmdHMU8rNDNQbVIxU0pxR09ZcGV0U0dubEVRa3BrYktpY3dL?=
 =?utf-8?B?LytEcVlKL2Vsam03VHRxNlpOVXZESmFTZEZIZjVJaG00MEhUU0VMT1hLdm1x?=
 =?utf-8?Q?j38k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35acb5b7-c4d5-4fcd-d278-08d9e1660361
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:24:11.1479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqSMHU9tamL+TJ0arKVoR1K0t6YR4K/ABdp6yeBze2r7hADVOJS0RMrTU5Ll3h6s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2603
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
> In certain situations it's useful to be able to read or write to an
> offset that is calculated by having the memory layout given by a struct
> declaration. Usually we are going to read/write a u8, u16, u32 or u64.
>
> Add a pair of macros dma_buf_map_read_field()/dma_buf_map_write_field()
> to calculate the offset of a struct member and memcpy the data from/to
> the dma_buf_map. We could use readb, readw, readl, readq and the write*
> counterparts, however due to alignment issues this may not work on all
> architectures. If alignment needs to be checked to call the right
> function, it's not possible to decide at compile-time which function to
> call: so just leave the decision to the memcpy function that will do
> exactly that on IO memory or dereference the pointer.
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   include/linux/dma-buf-map.h | 81 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
>
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index 19fa0b5ae5ec..65e927d9ce33 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -6,6 +6,7 @@
>   #ifndef __DMA_BUF_MAP_H__
>   #define __DMA_BUF_MAP_H__
>   
> +#include <linux/kernel.h>
>   #include <linux/io.h>
>   #include <linux/string.h>
>   
> @@ -229,6 +230,46 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
>   	}
>   }
>   
> +/**
> + * dma_buf_map_memcpy_to_offset - Memcpy into offset of dma-buf mapping
> + * @dst:	The dma-buf mapping structure
> + * @offset:	The offset from which to copy
> + * @src:	The source buffer
> + * @len:	The number of byte in src
> + *
> + * Copies data into a dma-buf mapping with an offset. The source buffer is in
> + * system memory. Depending on the buffer's location, the helper picks the
> + * correct method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to_offset(struct dma_buf_map *dst, size_t offset,
> +						const void *src, size_t len)
> +{
> +	if (dst->is_iomem)
> +		memcpy_toio(dst->vaddr_iomem + offset, src, len);
> +	else
> +		memcpy(dst->vaddr + offset, src, len);
> +}
> +
> +/**
> + * dma_buf_map_memcpy_from_offset - Memcpy from offset of dma-buf mapping into system memory
> + * @dst:	Destination in system memory
> + * @src:	The dma-buf mapping structure
> + * @src:	The offset from which to copy
> + * @len:	The number of byte in src
> + *
> + * Copies data from a dma-buf mapping with an offset. The dest buffer is in
> + * system memory. Depending on the mapping location, the helper picks the
> + * correct method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_from_offset(void *dst, const struct dma_buf_map *src,
> +						  size_t offset, size_t len)
> +{
> +	if (src->is_iomem)
> +		memcpy_fromio(dst, src->vaddr_iomem + offset, len);
> +	else
> +		memcpy(dst, src->vaddr + offset, len);
> +}
> +

Well that's certainly a valid use case, but I suggest to change the 
implementation of the existing functions to call the new ones with offset=0.

This way we only have one implementation.

>   /**
>    * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
>    * @dst:	The dma-buf mapping structure
> @@ -263,4 +304,44 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
>   		map->vaddr += incr;
>   }
>   
> +/**
> + * dma_buf_map_read_field - Read struct member from dma-buf mapping with
> + * arbitrary size and handling un-aligned accesses
> + *
> + * @map__:	The dma-buf mapping structure
> + * @type__:	The struct to be used containing the field to read
> + * @field__:	Member from struct we want to read
> + *
> + * Read a value from dma-buf mapping calculating the offset and size: this assumes
> + * the dma-buf mapping is aligned with a a struct type__. A single u8, u16, u32
> + * or u64 can be read, based on the offset and size of type__.field__.
> + */
> +#define dma_buf_map_read_field(map__, type__, field__) ({				\
> +	type__ *t__;									\
> +	typeof(t__->field__) val__;							\
> +	dma_buf_map_memcpy_from_offset(&val__, map__, offsetof(type__, field__),	\
> +				       sizeof(t__->field__));				\
> +	val__;										\
> +})
> +
> +/**
> + * dma_buf_map_write_field - Write struct member to the dma-buf mapping with
> + * arbitrary size and handling un-aligned accesses
> + *
> + * @map__:	The dma-buf mapping structure
> + * @type__:	The struct to be used containing the field to write
> + * @field__:	Member from struct we want to write
> + * @val__:	Value to be written
> + *
> + * Write a value to the dma-buf mapping calculating the offset and size.
> + * A single u8, u16, u32 or u64 can be written based on the offset and size of
> + * type__.field__.
> + */
> +#define dma_buf_map_write_field(map__, type__, field__, val__) ({			\
> +	type__ *t__;									\
> +	typeof(t__->field__) val____ = val__;						\
> +	dma_buf_map_memcpy_to_offset(map__, offsetof(type__, field__),			\
> +				     &val____, sizeof(t__->field__));			\
> +})
> +

Uff well that absolutely looks like overkill to me.

That's a rather special use case as far as I can see and I think we 
should only have this in the common framework if more than one driver is 
using it.

Regards,
Christian.

>   #endif /* __DMA_BUF_MAP_H__ */

