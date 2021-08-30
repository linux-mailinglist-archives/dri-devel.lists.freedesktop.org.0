Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D004E3FB66C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 14:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F00C89C3B;
	Mon, 30 Aug 2021 12:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236DD89C3B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 12:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSVgZnOJJKJieA8t/0+WdeU9Tajva23vKpIL4DXqV63+X/upZofkxE0UleT3jRlJwlf3LpxzUKOKQmzqF1I1TqaI4c7GqQL9WTTsvUyeSPQlC8UcXnTfsIFsljKDPTBlf85ywhODSBRMX74famMmh4+FXjeU5n2JevNKdAAciYx2MNUo1DuOTcVRdTDo7E1eIz9I7d0wMYhUSIyYeifru1h/v/AJDmVv90LYhr5kYwdkjsytG5qbALAiT7+tf1i0wG+6KOULNOXBM3aKdQrtBeXPYvFuG0byIEjN0ncYLkwGx80H+J2ypbE2TuqnVfOjN1t8wnPTQ0EL1NYS/u3Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMUAx9ccDV07lV7BtPeDauhTLcqik+389hsBbqeNKR8=;
 b=dZGIVhMqq+KAEuuH0lZsHIG808fSqH98HK4ubjOJ4Qrnb3KQVkB7mdS6ehoImYMPl6e9u/ohg+/mYPWjamy+Kc5pNte5R+aQLVbdCC7P0Vdk05DAJ9pZ/koGZxqTk/Jxy2LrjzTrdCc5B9ZtbU8/Lgfla9pXS2fienjLPmj0Dcix1Vg2vPVzKvaoKOZ0fd+oswpHEs8vrZTwLsiFxxG0gqoTMtys7sqCW62NFMt7o3nQTeTQjgpmdMhLbYjQ3G3KPQBEj9ahtAmXhfN8XDpy3QgrNe1yV2GFTIkpEVEgw4mAY/N7ydCrJw8M9OBrbnzB5mcC6v2fW9i1bb4ZM9wU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMUAx9ccDV07lV7BtPeDauhTLcqik+389hsBbqeNKR8=;
 b=B28muxSEla7cGXYnGTb8WODv+pU7OpYgj4d3xm9KtCkg+4abXi1oBQFwfQH8VsJQ2zpsBZQcrA0t5zJTZcmRKwjyXqvTd1w4/n3S7+ektFrqcWoN/beWYmNRhBajVka0FnzF+aPn5b+7KnNdFp1YWr53AH8a8tYFx1F7S3pVDWg=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 10:16:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 10:16:35 +0000
Subject: Re: [PATCH] dma-buf: heaps: remove duplicated cache sync
To: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: wsd_upstream@mediatek.com
References: <20210830100139.15632-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dd5ba603-8c9d-f6a0-cbcc-dfb353fb6701@amd.com>
Date: Mon, 30 Aug 2021 12:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210830100139.15632-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0144.eurprd04.prod.outlook.com
 (2603:10a6:208:55::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:208:55::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 10:16:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14e4b5b5-f6df-4122-c2d3-08d96b9f3f42
X-MS-TrafficTypeDiagnostic: MN2PR12MB4392:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43927CE07B10C47AC8F2919383CB9@MN2PR12MB4392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfR00fALiHH9wxNxtB3LRLdO8q3k3F2VGP78g21te9IwYV0Zngxv8TanDOZxrAc+03MxahtFNjNYH7pYPjtsPRubvCqQut0ahnqWwwU0fObXdmv2imBPF62K2vL7hb90hXu+GOat0iI1nH+6z7X+1q8JjvjjMQTJO+FuVPdVszT3VEGt7BMOdX2A5JKf3eyyDJwEQKmIejlzz/qQsmJPtTwY8ibHKyTS7pChwi1TF7ipqb7FHe3mYICWT4/nZmhM6jcULxGG+MZRcdXmtk1NzCtoQvrsyMc9hlXnvWn1nBzwI98icL4c/bG6RqqTqWEB9nJ0VI8DERbp/WGplUXUw6Z2mIHcFjOconz8WMTLxuxNuviq+l93IpF881GKtc8/JfM1YwzF1orujrZtzWaVLZeiT7lDYXxgsaDMygrsrvQyCqcDJY4q5e/mCoH523uDY90h5mvT1UV+IYF/As3H7w1nMABg5r/5U/Qj9Y0ychqaAG1eNzcsUDKQL919BnijmHLfw0x4bpZmZ8U/Ri/4vgjRQFI4yLtkJ1emSWiifJiK7svCdIyizeBoxgtaLbn53DLLF6Fy9RE914m2umZToPPL1Gu7e2Pc+1ZPx39pF4QKMO55QUBVMbY/gkqnBHvBkVNeGyzDR+b7OU/tRPcRYNvt0BnsnGDYPk5Lvn3TuN3T7YIZjbxLGme17Xv0iIy07/IM8m4OqCdBooOjiHFF6v1eRLQrBLR3yd2HYt+30mHttf5Wz4lPN6Xzrp/dMT5Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(26005)(186003)(2906002)(956004)(83380400001)(38100700002)(31686004)(4326008)(31696002)(2616005)(66476007)(478600001)(6486002)(8676002)(110136005)(36756003)(16576012)(6666004)(66946007)(86362001)(66556008)(921005)(7416002)(316002)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDI3MUhZMW1URjVmN0hMeUdnVHpieGRWS1ZGcUp2dUMrSFBUODNsamdOMlB4?=
 =?utf-8?B?YkloemFXSWhMaHFFekZNS054RnJqTTlScXFRNGZpdEdQdWJSWk92SktWU3BL?=
 =?utf-8?B?ckNLRURvMWJraUQzdWowcTNKenZ2MVRaOVhBNDl5ZHJHRWREV3MxVzRENngx?=
 =?utf-8?B?cTgranBnNkFCWm53L1hQWjlpN3lza2t4M2xKREJHQUtZU0psVGJvaWVtVVcz?=
 =?utf-8?B?MFB2MXpod3dxVnF2VnZ6MnJ0WTFPZ2oydHU2bUNra0J3Q1poVGN2WlgxUjhB?=
 =?utf-8?B?Y05waVlpMmdtWjFieFNqN0RmNGE0bnRJQ2djRkE0cDVOWTJ6Skk0VXR5cXh1?=
 =?utf-8?B?YldxN05TenhpN01ob2FNWlhUbnpnaUM0L214MUlPY2JjSEtiaUxMWG1kK29v?=
 =?utf-8?B?ZkhUdFNTNUNQeUxCTUlQY1lQVmNuaDlMK2dHbVZZV2hibldCQ1dtNEdzaVht?=
 =?utf-8?B?OWhvMWZpRWEwcGRobXFxQWN0MGRueFl3UTd2QUJzallkTTVLSW1vc0R6UEVp?=
 =?utf-8?B?eExGMVZnM3dBSTJyMG1wYWZjZVBhU1ZVdlZYdy9VWDlvK3RmOW9KMEYwcVNi?=
 =?utf-8?B?OFREWXpiYVprRFFhK1hldmtiSkFOWDVqVlFlbVpiRDl5NHVvc0RhTlN5S3cv?=
 =?utf-8?B?c0ZUV1NOeFVlcEtlenlFeVdYUDQzVnBSV3hKRkswdXJWaFdvdVV4YTNaSTJN?=
 =?utf-8?B?K2UzR2M1K2ZsZDR4c2NaeW5wQlhzbFNoMGNwYms1UGczU2lWZmE3OE0vTzJM?=
 =?utf-8?B?S3pXdEFaUXNKenpQVW9jcEw2RmtheTNVM1RtWVltZ255ZE1TYk9sOExsWWVk?=
 =?utf-8?B?OWpYMURPb1lRMTIvaHBoTzI4dFhZc253S0F1aCtHSEsyWFZXUGQvZ05KVDZG?=
 =?utf-8?B?MEpCaXRIOHQ2SUN0WUIwWnlhMEMzNm9VL2tJY0NzenRTYzRmZHA4anVUN0wy?=
 =?utf-8?B?bFR1Tm5IZXVtbTVxZngzUFEwRTRNQWtvazFkN293NGp1eTBydXlMbDErbUU0?=
 =?utf-8?B?MkpDZDQ2Rjg1K2JEMVUvZHdpaCtBcTdVNFFONVk5M2ExTXJhZmN4OUpFY0Zl?=
 =?utf-8?B?c1ZpUjNqQVNQc3gzSDFoZy9Fczg2WW4wcXFOaHh6SDdrampGM2tTOTZxRHls?=
 =?utf-8?B?c21FeGdMS3ZmV1I3R09FdlV4TzFwbkhEWWRLRGdRM2QvTlJGSEsvQWwwYXJS?=
 =?utf-8?B?cGFrS0h4bUtGY29jY3ArL3o1a3pwZ0FyY29qSXNiRUVGRFlRV2VxK3kzeWdU?=
 =?utf-8?B?ekVlUzAvL0RVTjhnSjJ3K1JiejhXMFJNV2RPLytIc1kydVQ0NjF2OWdYaEpl?=
 =?utf-8?B?S2JIY3pUUlM1NkRpVHhKbE1NNXdZR1VxaXJBS0tDZEowNm1HR1lXZVJBNHlO?=
 =?utf-8?B?TGpBekNPQVh5TUZWQlBoNFR6NGMxSjBwVkZrUzFYV1BUVGQ3bHoxSGlZdytv?=
 =?utf-8?B?d2c0WG9mQ0VaSFN4dU9vMVk2SkgrV2pnQ2lMeUlpV2ljZWtZS2tIL2FLY0lh?=
 =?utf-8?B?aHFWN3lWUGI3NGlJVWhGQXdxNUMybE84bWxDTkI5MGFvc1hUNTYrRnVkalVa?=
 =?utf-8?B?dEkvOG1lSzVFTFlBRXgyK2l2b0xnSEIwYnNOOVlSZEJQQlhSeFk3bGZXZURT?=
 =?utf-8?B?THFPOWh1SXpjR3ZVcUlwNytlU0RBUThEUVRTZGJoMU9KLzR1dGs4clArVmpN?=
 =?utf-8?B?ZVo5SnVwdDRDY1VCYWxFSVNOKzRvNzg2andERUtidzNDL0wvMXFTQmMwK05y?=
 =?utf-8?Q?YKCQxxv6zcQ+cOGCuLBT1WV/KSJ8EpcGW7vGZVV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e4b5b5-f6df-4122-c2d3-08d96b9f3f42
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 10:16:35.8166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwLAbmhsQNiLtopzohB7x/Im8WXhUjC+sbGt0GIbp0jJ5EXLXtK0MdF+ZdgsbcST
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
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

Am 30.08.21 um 12:01 schrieb guangming.cao@mediatek.com:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> Current flow, one dmabuf maybe call cache sync many times if
> it has beed mapped more than one time.

Well I'm not an expert on DMA heaps, but this will most likely not work 
correctly.

> Is there any case that attachments of one dmabuf will points to
> different memory? If not, seems do sync only one time is more better.

I think that this can happen, yes.

Christian.


>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/heaps/system_heap.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..909ef652a8c8 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -162,9 +162,10 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>   		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
>   
>   	list_for_each_entry(a, &buffer->attachments, list) {
> -		if (!a->mapped)
> -			continue;
> -		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> +		if (a->mapped) {
> +			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> +			break;
> +		}
>   	}
>   	mutex_unlock(&buffer->lock);
>   
> @@ -183,9 +184,10 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>   		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
>   
>   	list_for_each_entry(a, &buffer->attachments, list) {
> -		if (!a->mapped)
> -			continue;
> -		dma_sync_sgtable_for_device(a->dev, a->table, direction);
> +		if (!a->mapped) {
> +			dma_sync_sgtable_for_device(a->dev, a->table, direction);
> +			break;
> +		}
>   	}
>   	mutex_unlock(&buffer->lock);
>   

