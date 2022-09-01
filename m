Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68495A8F95
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CA110E5EE;
	Thu,  1 Sep 2022 07:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53D910E5EE;
 Thu,  1 Sep 2022 07:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7FWfhsNIwuOy3OT430mYaGey6sF8Vu5uEaDtfN1ZjawwylmzfN73TkMV4zrqYXYmL0q96pwqkHSUuYqU+IMKhBSOn3IQ3E4eluFz3k+kJP3mvQvjPGthlcHwjfvF4SvuPsw7QV/Mxn3BuoRVx9j5L3A4y3F4lOhAHKHKRIoapJi4cDhule0jB8nMGTtrKzYgH7onq0pYi1DeoQz75UeP+cHAheeZjtFdxXLMfpYylAgWnlAgLKaVzwY9MRAXgbdGSFUPFSvioX5PD/A5a4dbrdJ8b/EThSK+kktS19t4QkgoDP2nKnmsx7AFyVCMbLgcA2e9Eb6bp1AQbR72xYamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHLVt8A/betNG8SaQLcMk/gr0EGqztrxEPR0r60twJk=;
 b=K98IkF/UVErQl1bxJO17OG1G3BL2n4TR46E8bahAnqMJ2XhqYVCQNsWU7j+kEV3BVw7Be+NK9U0JCBG8azwKxQnpaIkaOyNh1WAwK21t6yWcDmStM2/Ub9yh7at4js2hatO+k58NGRPwQHefQzX9RGC0al4gPq7SSA0DeI1Kzyk/tDgsoa/6FDp2vS0/bmhMfzRzZM+3cuGwtfZaEUGAnhvE+lJliiGCmxQUc5WEdar5VCLJSnl8mez9KjxQ+2Hi0V2H00UcJGGyYZ0Na3r1eqRfEKGWEhg4AdXqxgn9Tj001YOjZTF3nRDK2rGYtmXFP3clr0uMSgM+POEeP0TnDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHLVt8A/betNG8SaQLcMk/gr0EGqztrxEPR0r60twJk=;
 b=WoSPa4NKSM+sNNoVSdwEiaNK3CYxWcJM8VyLXLT/1fUeGc8nLV6z6hqveZ/Z6jzaTIFgXD1G85X61HeMqMolDmQjS2jBFPljYyTbStfB1dKRAxY3nex415jYHMIdge6xGHzxdaLd1f5jcFsr7voeme/zkSCkzsz2CUmEqxZLOoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:16:44 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 07:16:43 +0000
Message-ID: <192b9a30-6f15-3702-c679-c3f26b76c9ef@amd.com>
Date: Thu, 1 Sep 2022 09:16:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 19/21] dma-buf: Document dynamic locking convention
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-20-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-20-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::22) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e18351-2cd4-41b9-f3c2-08da8be9ec5b
X-MS-TrafficTypeDiagnostic: BL3PR12MB6547:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4AArAxg4nVDu1rhkdi0sNgfrkQsWv+kLvK2ItSwhgIFNzvFeRMASaBVoRGVxBONS745plw8B7i0cnajmxceI/9/O+b3BSSb6ERlL02JLrCNEl++PdQyqxWBFXfREO1y5N5qqtoWKs4s1NlJdOjE/breaBH2RfCQjZnJhUoEka7PcJ+xcMkdoT3D6l/jRRmMcrJd5Sz1Zzme0poH7NokTYcuvgaDitYpkM8rGBLykUW3iBzwrdmYvEvEbMbqw+hBDupzxPuzkjNwcdhwbXPQj0SFslYtIAxcQZQNjDw7Qv7BeSovaOAx6E2eu3LAY4BkA9/NxU9MGtduw45bRVfUmXMHl5ZXPfNfmQxQ0uODW+N6CGT63KjhZnw0Au3nvBTKZnFZwBagO3wuJXt6QIgrm/sgVk543QU/gVjE2pBzFJ3G7Dlf/RaekCRWq6OQMUSJm24Z/CQMTxNqgme5ohCe3CfgeeJbkfkoWibkS6R2GioAn8P3XcqMTxy4gGm8249WNTp7V+2JliOZ2TlVBiByK+uyD+tq0JexBmta9HGbaWutqDBTIyTGcapvwwroLY9gklWM7i7Q+2kX0t2xgEYzHgt9mOn8Bsxf/8zQHew8wkh3TK18AoAix1okNy1wFik0V1WNpkVW7bYPUm3vyPJMwcLWxchRwNp7gG2LS99ycTp2CHZ1kiaGd35lRO7jUd37o0B9MWmXi5UJXdbNpUrNYHH5qhZv2yraTgWK7yGHw6MuCxwXLzahX8vKE4aHxh1rHb4qWLKoOJCW/BVCQqjEnRNSNiGPuDl6uPzuPvk8sT3QpA4kFoXWlp+mQhXRgXbrY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(7416002)(66556008)(66946007)(8676002)(4326008)(31686004)(921005)(66574015)(66476007)(36756003)(186003)(5660300002)(2906002)(8936002)(7406005)(316002)(110136005)(6486002)(478600001)(6666004)(41300700001)(6512007)(2616005)(6506007)(31696002)(26005)(38100700002)(83380400001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnNkL1Y0YnBRM2FRSEFSUEFKSXFBdys5ZmxROHNtYXo5ZFgyZ0hXVEI2a1RC?=
 =?utf-8?B?eDdJbWhReVdmUHo1VWVVY2QzY3pFYU1WRnF5S0t3MnpEak1jT1BLZlgxSEVs?=
 =?utf-8?B?a1hBcmJwbS9FTlZRMktsVkhnQXA3Ulk5VEVuanFlZDdVaWxDZXNPZkZaSVpa?=
 =?utf-8?B?ZDRJZngrTTArLzUyOVc5K25vc1NUVmZKUWZLdXhkMnNHU1lvLzNWcnN5OWhx?=
 =?utf-8?B?TEJ6a2JYYlIxUkdwM1ZyTHVmeVJYWjhTejdWdFFBcndDUFg0ZmVzVEh6elc0?=
 =?utf-8?B?WVlxV3lGWjJqLzlsd1ZCdkxwUUZkcnJpYTJqd29SRXpKQUthVWJRNmJVZVlC?=
 =?utf-8?B?WHAvVkw5cEVvbUR6ejM5U1l1SDBvQzFHeFFOUjdMajFXb1VQZUtNM3NDRU9F?=
 =?utf-8?B?ekdNSk1qemZoK05kQytYamsyTitrZEFvakxFcGc0YlpRR1RlY296ZzNDaURi?=
 =?utf-8?B?bC9TbDBqTG00WXAwUzRqNmxodjhTWVowd0crTzZjV0l6bmh0UWZ6N0FSSUtq?=
 =?utf-8?B?UUs3eXM5YjFOU2FwQWM1NldYdlNhc0FPTFRuQ3lMQzR6VjJjdzJmZmxUV3Nu?=
 =?utf-8?B?ajRvYWlhY3VIZ1hQRThIaEhYNGVBc3JIT0twZjdFUnIvTTViSmE3VlVDOENS?=
 =?utf-8?B?UFQ5TmRrVXZ2a2tiaXkrUkJ5R2diZUF0YlZkMGRFL3dpaktnMnBOaVBUUS9s?=
 =?utf-8?B?TER5RVlFOHMyU25JT0RHVjJzZWloTm1ISHpSNGVFQXN6eUhxWFY2OFBucUhL?=
 =?utf-8?B?SllJV3V6QnFHOHVaZWhaSmJLblNlNkpKNDlmcTdNWnpieldDQkJHQ3RrUkdK?=
 =?utf-8?B?dDFFU0tEbzlScnFGZlNMYjRrT1ZsMEczNVh2UjAzNVdrclJaRzJ3UmdySUsz?=
 =?utf-8?B?bTBEQWd1UGNXakJxSWY5WTRIVjBpcDljWStFMzZMcDZPajBxYWR1VGtRblhh?=
 =?utf-8?B?Wlo0ZE9XWVUveDlzN3pESmN1eFpCYlZiS09lK0UzRGg4UWRPSkxkUnZJWFFR?=
 =?utf-8?B?YXpsYXhKQ1VkM2I4dlhhamJyME92VnlmRVZpWFJiZlRHLzc5UlpHNVRFVmNm?=
 =?utf-8?B?WTRGemZQNGcvZk4yVGZ2azZuYVVrWDJQSmFqVWZJdEx5RWpxcVFpMGIxZmly?=
 =?utf-8?B?eTNZSURqbzFZeFlldGM2UVpQT3lEanZvVFEvQUZZZTFvcVJhbXl6bTVFUERM?=
 =?utf-8?B?aEpBb3BjdVN4UUs5dGEyUUxTYWVQMFduQ1BYSE5MdXltU1c1cmhGM1JrcW1v?=
 =?utf-8?B?TXlPcjdUZENLdEk0WksrRTgzY0F6WXRTa29NWmN2WlJwU1YxMTFERlE5a0s0?=
 =?utf-8?B?YXVMY1BoaVF0c01GaEFRenVKWlhMYkEyUHZzZnNOMlZjY2Fvd0xhWXA1Uk5O?=
 =?utf-8?B?U0RYR2pmWHgvSm5GUWJnZ2NFTzBqWmRGTmZ5eWZLdHdyeWVhTS9HeDN5NzRU?=
 =?utf-8?B?ZzVUcVZrSnZjTDh1UmN5bHF5OVJ1cVhld2wxRDZjNmtuQUlBYnFxY0hyVnJh?=
 =?utf-8?B?cHRzOTNrVGp5REZzenY2VFk2bloyVmNYRUV6K3huaUw2a0dWWFU4YkVPNGFP?=
 =?utf-8?B?VFFwQnpxNlFuZVhtWGZzbjU1SXYyTkFwR2N3UHJmMjIweSt1Uk4xRVd4cjZW?=
 =?utf-8?B?dklmMGppVlJSVGZsYk51ZVRpNE5SV2RaSHdBaEpoenNpamI5NjVBZk0xejhx?=
 =?utf-8?B?TmIySUY1MXB2Szg2T1J1OEcxSFg1RjhrVnBpWTFVa24xU0drOERaNEhVOGcr?=
 =?utf-8?B?VkIvallrV3BUVDB4MFJFOFk0WmptbUJLUU1zcnNETldGc05jWDJ3RE03M1RS?=
 =?utf-8?B?ZWNOc2ZRd3Zwaks2YmorbUROeTdSYVNxcUhrekw2MXhIQ09SdTVMZXREVUto?=
 =?utf-8?B?VTlIR1pHc0xMeW91NkpYMTY3cmJVTE9EWXV0MHZIVGsrMFVuVndGVGlaWE9R?=
 =?utf-8?B?TUJyTW5aelNNNlFlNFlvV0xvY3FRbncyRW1YRnlUZHZDRVhxK2E5NGtKak04?=
 =?utf-8?B?MHNOQnlSbVMreWhJdmxwQWlRZlVmbjdEWUxjZC81eHJic1doVEpZNzFFWXhk?=
 =?utf-8?B?WnlWTmFUTGlRRU0xeXJTcHpPVkVwUkJwVkRsUzkxcHlKZnRvKzAxTjBCMGN0?=
 =?utf-8?Q?BMMjt9L5JlYolxgAYc2AgQyJI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e18351-2cd4-41b9-f3c2-08da8be9ec5b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:16:43.8561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2uzCUa36if5xNJgp6hjWo3+LnOorUhKbWbiHjxBFPC6dUgghPP+e4hbLY4ArK3k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 17:37 schrieb Dmitry Osipenko:
> Add documentation for the dynamic locking convention. The documentation
> tells dma-buf API users when they should take the reservation lock and
> when not.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   Documentation/driver-api/dma-buf.rst |  6 +++
>   drivers/dma-buf/dma-buf.c            | 64 ++++++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 36a76cbe9095..622b8156d212 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -119,6 +119,12 @@ DMA Buffer ioctls
>   
>   .. kernel-doc:: include/uapi/linux/dma-buf.h
>   
> +DMA-BUF locking convention
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/dma-buf/dma-buf.c
> +   :doc: locking convention
> +
>   Kernel Functions and Structures Reference
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d9130486cb8f..97ce884fad76 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -794,6 +794,70 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>   	return sg_table;
>   }
>   
> +/**
> + * DOC: locking convention
> + *
> + * In order to avoid deadlock situations between dma-buf exports and importers,
> + * all dma-buf API users must follow the common dma-buf locking convention.
> + *
> + * Convention for importers
> + *
> + * 1. Importers must hold the dma-buf reservation lock when calling these
> + *    functions:
> + *
> + *     - dma_buf_pin()
> + *     - dma_buf_unpin()
> + *     - dma_buf_map_attachment()
> + *     - dma_buf_unmap_attachment()
> + *     - dma_buf_vmap()
> + *     - dma_buf_vunmap()
> + *
> + * 2. Importers must not hold the dma-buf reservation lock when calling these
> + *    functions:
> + *
> + *     - dma_buf_attach()
> + *     - dma_buf_dynamic_attach()
> + *     - dma_buf_detach()
> + *     - dma_buf_export(
> + *     - dma_buf_fd()
> + *     - dma_buf_get()
> + *     - dma_buf_put()
> + *     - dma_buf_mmap()
> + *     - dma_buf_begin_cpu_access()
> + *     - dma_buf_end_cpu_access()
> + *     - dma_buf_map_attachment_unlocked()
> + *     - dma_buf_unmap_attachment_unlocked()
> + *     - dma_buf_vmap_unlocked()
> + *     - dma_buf_vunmap_unlocked()
> + *
> + * Convention for exporters
> + *
> + * 1. These &dma_buf_ops callbacks are invoked with unlocked dma-buf
> + *    reservation and exporter can take the lock:
> + *
> + *     - &dma_buf_ops.attach()
> + *     - &dma_buf_ops.detach()
> + *     - &dma_buf_ops.release()
> + *     - &dma_buf_ops.begin_cpu_access()
> + *     - &dma_buf_ops.end_cpu_access()
> + *
> + * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
> + *    reservation and exporter can't take the lock:
> + *
> + *     - &dma_buf_ops.pin()
> + *     - &dma_buf_ops.unpin()
> + *     - &dma_buf_ops.map_dma_buf()
> + *     - &dma_buf_ops.unmap_dma_buf()
> + *     - &dma_buf_ops.mmap()
> + *     - &dma_buf_ops.vmap()
> + *     - &dma_buf_ops.vunmap()
> + *
> + * 3. Exporters must hold the dma-buf reservation lock when calling these
> + *    functions:
> + *
> + *     - dma_buf_move_notify()
> + */
> +
>   /**
>    * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
>    * @dmabuf:		[in]	buffer to attach device to.

