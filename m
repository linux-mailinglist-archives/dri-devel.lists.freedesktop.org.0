Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3DC5A8ED0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 08:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF19510E5D3;
	Thu,  1 Sep 2022 06:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D4A10E5D3;
 Thu,  1 Sep 2022 06:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+NDT6Y+cLtD9vAzvH2t9Fv2VsNuuQK+rTPl2GpXRfFZGAhR1/Ns+WK+2xR2/O47ZRo8Upt11THjEN6kWzIMzBm83m5cDMH5TYJ1tzVAE58lJjz5/fyNiebKj1BACEKfzFRCJGyA1gYyw/v8uzXOxLYgMF3I0NIJyWChD+kioXLvIfGSAYiXbP4CM/CDprp2P+pxvjnntyI6wiuIi3y5jGZkhhjsouP1HVFyuQQBGxXuft4wkvz5yVFfDEzTdeeMoI1ZHRITIfx6d/skpjBNMdiS2WXGxrGqhumFFZfXyIorPD4OPr7Qlrbkz5tL9pdR5bBzb6LbbwOG6keusKcpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnV0CizH8dcvktIq5eI/9X8XK/uSA7GZIMmjPPdXKmc=;
 b=ISiKeu2muqDjAay1K330TnEW3O8WojWoXLKE5qtD6K4s2oCPF1tUEXeMD4L3uYm5IX0wqTUm/uW1TgNxOkyA26EVdx06/2KP1MywcXTNVz0wKGiKDhQbIpI5Xw4cNyS8ak5tDlMzJkPtVNeFMscUQD5cDQyGzhM1AItLBLMpRfboHf13mbGG8XxyWzsX9XeO2/Sbr+DU+VdudN3cvtcu1vDtmuTGembURgnnTGspj5S8E+r66AzHDliHsRb+jxJK3TrwZnu+Y4AAT+JgiM2r+N3Klw7a5z7vrk69M0ciWuMRO6ENW5cfblMoanXSG79lbWqmBD7gXvjmH3Zp6Ljfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnV0CizH8dcvktIq5eI/9X8XK/uSA7GZIMmjPPdXKmc=;
 b=Q8ecf3GmZF1oZOeqqBCb71xeHxp/0+R7o5ez6u/cPjjeI3RdxTd2yhLKbMu278QJhJj6lhOjRCSaId5tmr0/tpM7wEqk4GaAhHoWG79Xkdqp8wUcJnowgj8R38aZiyszsmIeJUfXYNGujy+59wIKVCXPaD10Ct+yUo25yqFUlHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4315.namprd12.prod.outlook.com (2603:10b6:5:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 06:54:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 06:54:33 +0000
Message-ID: <99e9d22b-5787-cc3f-eb6f-ae137f0282fd@amd.com>
Date: Thu, 1 Sep 2022 08:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 10/21] RDMA/umem: Prepare to dynamic dma-buf locking
 specification
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
 <20220831153757.97381-11-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-11-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307beed9-aa49-4c9e-27cd-08da8be6d397
X-MS-TrafficTypeDiagnostic: DM6PR12MB4315:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezeKQnlO5zA6F3MTU9NXidfFlkJIyZs9v1dzgZH9iWqs6cnFmPv/fc76pPlB3CXkMKjYt4MuJ0DtGysEboLN6KAPsvyVFhIl8XTxHNfi4oYPasG2babZGeop7LiDJ3rU2X45HUFmgxfuM4SxKr4HTdsl50TrNTnsdUX8AzeSEIYbiT2SJjtKD5cePqZ5SI8xNIsy9HeuubV4hDOAex1WPc4kiKDReFE0ExZoITB4HjWiWV+m3jhZgF0LM5E/MCnV9sW301CCts1/CGnkUS3b4IuUuSNTDqS6xOY0K5k1GuCcHirupxASA/aIWtlU7/mhf3eK25/APnmcrMZcck2RFI9fra0un1sLbV1u2mCu6kplOBQzmwEnm7PbVR/enlzRmH4Yiy1clwZcv8eZ/3FUvo7hwgrP05L9JQYIzxpuMUalCd7Qxyatv/WPaSAxq07XuWPRkezyOrygt+DEGGPvDfeujHlqIEqO/lsPdXuvyKU99p58E7rvK/z3Lp4Vt2MpQ3cyP5KdZsb9ZskOE5lNPB5i5kuxCmIthfkZgkkOOvxeBACuyCNx4f46xLcJ1VGNgQjo1St/J7Oe5X5een6eH5rRCG4Ruf1NPUAbmAQVmNxUv5Eux5r1CLetE2Qv6x4RfpTgclSO4ZedN1kGJBsbTvaG5utpQ6lHZld7/acIKmDFHnThigTnEOiA7uFerQbSmV9K7dGP00C5snyf8CcUxjTcCNeGMxzLfWW9oHihjp+cV2y2R7nvHeNJrLY16XMbyvX+vXFlxthKr79rPs49Yf8af5SIhzr76RJ4b38uTmy/COXjj0vpGQw3vtEjUxjt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(31696002)(86362001)(41300700001)(36756003)(31686004)(38100700002)(6512007)(66574015)(6506007)(6666004)(186003)(2616005)(26005)(110136005)(66476007)(8676002)(4326008)(83380400001)(66946007)(8936002)(316002)(6486002)(478600001)(66556008)(7406005)(7416002)(921005)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUZjUmJscWhsNHFNNWNVc2kyamF0a1N4L1NZbTlIdHg4TDRuRnBmMzM2N0Ry?=
 =?utf-8?B?b085NzBEMENQb0x0Mk9EdkhOSWZkSWxEa1NjOWE3RVNrd3RpVjJhWkpaaVRT?=
 =?utf-8?B?RFFpakZVUDVKU1ZpQkYzTENUR3IrQ2tuK3NUL1VJZ0pDNXU4YlFhVTJFeWtz?=
 =?utf-8?B?VU9JemVuWTBWQmNJdG56YmZ2OEpaQ1BXSDBXK2F3aHJLemorSnlBSEtxRzhk?=
 =?utf-8?B?dnFDYWpDaE1lYUZySmF5YzRaS1lqdXRmWWJWYm9ubWRUaHQ2UHR1cFkyOWM0?=
 =?utf-8?B?eTRyRWZwS1ZGS21TRm9kTDlRc25UNXZPOXBmZFh4SFVBM3ZNU0E2RjF4ODdV?=
 =?utf-8?B?R1hGMjQyOEZ1U3ZlSyt4RkpkNmZUVkNmV3JnbWFsa3FNNzFCbG9UWko5azI0?=
 =?utf-8?B?MzZ5cU5mRG9lMm1pRkJPMndtVzNlRG14NlU4K3dWelJJSWhPNHdyZEFvTWN1?=
 =?utf-8?B?RUJhcjN5eVBJZWwvR3hTQlovcU1sRDJxems4ZHlDVFVJQmZaZzJUR2g3bTha?=
 =?utf-8?B?ME45L0M2OVREYWl3UVNYeFI4aGxWazV2N2RQemlpQzNkNno3U2tKTGRoZ0Fj?=
 =?utf-8?B?ZGxIdnZTTlpvM2FvSTN6WjVKZStEakN4REYxeW4wRUFqUXhhbC95dVpBMEMy?=
 =?utf-8?B?QTVGc29TeGtWc2FJcTRmRzlra1htekM4TkExR2NtVzZQTUZieElGWkRvY2du?=
 =?utf-8?B?Nit1NzVyZ210NjhMYk5qaWtWTXgyc1BmTzFYYzJQZlhrV0lGQU9NcjZUTW1s?=
 =?utf-8?B?YnlwNFpycFREVEJ1TkJKeStENk5Ec05VU01HQUdObmdIRXcwZ0RsWmZKd1o1?=
 =?utf-8?B?c215N2hIMXVOUkQ5N3M3MWpiWWlMQXkzUE1yWFNZclB4SzN4RVQ3MTkrZmp5?=
 =?utf-8?B?NG5aVzEySkpKOWJRNW1SYmFSZHIxODlGd0dhdml3cDJCS1B1eGY4R3l3Q1lQ?=
 =?utf-8?B?ckhZZlpjWFJNRkNTZ2ZmM3NtUmtFbHQ0QkoxemxhRERPcE5UeThMY0RoUnBw?=
 =?utf-8?B?QXdtWUEzM0hhdkZNMEFJcFJMdzVWUGdqVTN1eXRqZ0h4UGxRZDNOcUhkWDJF?=
 =?utf-8?B?TXV3TVdwUlZqekNCY1JuQ2hvaFRuYmhWZTMzbTBES1BNL3I5MzFQM2ZmR1Yz?=
 =?utf-8?B?dFQzejRtYUlpbEhwZlN0endYellzbk9iVzJ6Z0d2cUhCYW1oc1lZenZ3SE1Z?=
 =?utf-8?B?a0cwaytmTkMzeVdoRVk4VnBmUzh0L1BidWRrQjNpdGtmM2VIaE1IcFppVTVW?=
 =?utf-8?B?S1lQV2t3ZnpjZDlTK25HbXpkYld6YVRvbWlMNTl2R3REKzJIcHZ4SjNYT1BS?=
 =?utf-8?B?aVVseXkvK3VweXlxOGU4b1ZOdGRBbndpb0J5RjR1blVXTGM4MVRscVFudlpt?=
 =?utf-8?B?TE55T25PaEorOWJ5OUlFTG0yMmViMTFkTEZBUElyQ0FpUGR2dElOU2t2UnpL?=
 =?utf-8?B?T25Pci9hTmdSdGdnU05DR25sYW43bWI5KzlPdlNHdVpIT3pzVmtlbkZESmZG?=
 =?utf-8?B?M2RBWnRlSDZNWDViR2p5aENsYVpLQkVObW9iSGJtWjYrRnp5RjByOWFldXBM?=
 =?utf-8?B?ek1RMTg3cUJoQkg0MW9hdDlHZDV4NG1uZStnbkZTam0rQzJBVnYvUjNVUjJv?=
 =?utf-8?B?T0s5WWdjZVRTekg0dGZHZWF3UHNIU092citvVUpDcVJkZEZKWmZWSWxlRzBS?=
 =?utf-8?B?Ulp6d1MzSU45Qm0rblpmaCtGejByWG9OeEFCUFFmKzdRRERMc3I0aDdmZ2cz?=
 =?utf-8?B?L0VuVDFyVGl3WVVnUWxWNzYxMEpLcmNmV3AxdXBMTTdpVVZBZ0k4QWk2UjB1?=
 =?utf-8?B?UDVVSGZlak9HZi9SclZYWHBnWmdwMVRXODF5Y2ZuVHlzVU9CUmsvanV5Nlpi?=
 =?utf-8?B?RDVVK0NTaXVGaUhvRFhIdzc4N0JXZGQ1NVFPaGI0czlQK25mN291RmIxWEM4?=
 =?utf-8?B?T3diMGpqalNKN2dqUHIrQkFjd0ZWVW9YemdjWWxwMFl0cGthZHdJTVF3ZWxI?=
 =?utf-8?B?eUgxSC84ZFoxbTRXVUdseDNjUEZ4R3Q1Ky9yWFJ6SHl6QVhnQjFvVm1DQ0kr?=
 =?utf-8?B?U0lqNmxJcHFHZTRZaHN3SW1xcEIvQTVmalBJMHVxMjZObmJiZytqK1UzMmJC?=
 =?utf-8?Q?+a15ShS2/2B3hYxbFLm99S1+f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307beed9-aa49-4c9e-27cd-08da8be6d397
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 06:54:33.6859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oU9/KTnB6nlu+f+6YJpX8z4UxcGCbDL8WeNjfrmYPO5JDurNWO/L800I6nxkIh0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4315
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
> Prepare InfiniBand drivers to the common dynamic dma-buf locking
> convention by starting to use the unlocked versions of dma-buf API
> functions.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/infiniband/core/umem_dmabuf.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index 04c04e6d24c3..43b26bc12288 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -26,7 +26,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>   	if (umem_dmabuf->sgt)
>   		goto wait_fence;
>   
> -	sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
> +	sgt = dma_buf_map_attachment_unlocked(umem_dmabuf->attach,
> +					      DMA_BIDIRECTIONAL);
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
>   
> @@ -102,8 +103,8 @@ void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
>   		umem_dmabuf->last_sg_trim = 0;
>   	}
>   
> -	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> -				 DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(umem_dmabuf->attach, umem_dmabuf->sgt,
> +					  DMA_BIDIRECTIONAL);
>   
>   	umem_dmabuf->sgt = NULL;
>   }

