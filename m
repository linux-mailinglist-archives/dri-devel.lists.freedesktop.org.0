Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B75A8E70
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 08:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F42010E5DA;
	Thu,  1 Sep 2022 06:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2079210E5DA;
 Thu,  1 Sep 2022 06:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6z+nWYSe5o2/Whe6E+VgMHFNa3/OMt2THSM6kPHalPa/KX9gD0/wSHgfNY1LfRzntD3Dq7rAt/EfbHDXE+JUzObKVPo2/e2REKayfmE8h8CWaFIh6lUMTKmpOyjXZQJR20FqeQCgQ+uXQKeJ3oqKPa1Vnqd/jETy53CsPGACvYFxJtkfjVVbkH0eyUXvf+fF43/ZKsI6NfIrw0mrpdOA2eEvW8Ph8JsP2tNCRp/FX7C8lQIf6G+3U8/YNbATALO1B4mUmWjKUZT3vOO5tY1EJWyvq18h+TXc9fGwSdDUYU6LZxHr350GG2AcJEIVcXpnYbu4asedp5Tj8iUH3GN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BNAjZXyvIcCnEaVAEYj2ATw8Axwa4g12OM8Jd+Ac9A=;
 b=NyFYsM2iOSkvqaJDdRsXRwKCJVXrxIRiT6aM5sJGyku0AX8fZdXFqZmc/ydK4TrLPAY2r3VazD1GEFgryU/i7EJ2wd+itKirtCEjoaHVHydSYab1EPExFTKuks7hngsoxSzRg2kZjdXnvUEB6wXx6zYHLIgorjm6pr9uAQjmsVdYhrTpMvUkv3xrjU4CmWojLJF8J2+4IhoFX4JMbTsKbcEKy5NWw2eUJ3mFg4cqmoz5VH4WxmLFI/Zqb/GYa6tFn9QXHho+FCcMMPmAQHlOUFziNL/2jKHomNrwPnEESy/Mo3L+eelcaCxsNFu5A0VwRA44DUkcdj9i3lJiw0p3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BNAjZXyvIcCnEaVAEYj2ATw8Axwa4g12OM8Jd+Ac9A=;
 b=Hp53nflEvH07z68rk3W/XWgfOdkEqm7WT9ILbvLTbnxg8Ij8Hl9EKAJV8gSFCPjdfdaARYDJbmmPrZbbmGcYHFy5Rs/FIGTTSwox2Y9RSHCyJ7nWQQ69XGZ61QqXI9C+4xcKcOw9YgoH1Y1d8aRiGpkBysgi0ETeHx5mObGR/VQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5156.namprd12.prod.outlook.com (2603:10b6:610:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 06:42:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 06:42:39 +0000
Message-ID: <708d3284-f363-9eae-eb68-3687e39e83b0@amd.com>
Date: Thu, 1 Sep 2022 08:42:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 04/21] drm/prime: Prepare to dynamic dma-buf locking
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
 <20220831153757.97381-5-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-5-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d3a9da6-9ff3-498c-c857-08da8be529d8
X-MS-TrafficTypeDiagnostic: CH0PR12MB5156:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aY4TaWwUa9CWM3h9LZeE0vuViOAo7bBBMpfT6gV0irN5QMhMVDMvw5K+G0q2t8zmqAQNGDrZHZWrS/JADaKmZ3mfg/1ShXR4Neu/C5MUVb6Nh1+YQgGQpDF1UsxeacNG+mquXSyhxgM1CUi/mzP85qGWIbA2NmbQ6Vy/Wf5FxBPZ0i1QL5LgINR4A8K571qSc3ELnwZtnb3ZKSBoxrCFAl6SfjyMn2vl7mvldJK9QRDwtT0cRgHE7eRDvJwFigeY2+Artq5Ropk8HA7vLn5kcqpgukXmgLKmza/IS5oiqdyThdr/qWHR/KdjtnHlA5UfuxpJm2sRtjxNEg1iTkmUK25gPDbpZhQPuti7L9oV3eUchlph6FR4X5Mrf+DFOwLxEaNNNsqEWVg0LvPcSZrGdGjJPgwenU1gJMCwsMie+PUe3BC8S1ibmPvE0L6oo277VGFz5lJGDMPtlQcPcCd8JGwyCYVfAx/GsZOq5DQ0/f6FiRu6AMbM2F2y8gJ125RmIgwS1nvYZFzkdC5iKWhocR/HLKjsl0gjH22UD+o4yMJpg4O/nSSV4EpmA5tyf4up8MEA1aB5fhTLkeYcCiHeaaKbS4hD6286UJYpi0XW2ooQdbqDxg7o+YG8QHJvZywZKXA6lrLrufeJoBPGwErpsAF59HFYUugn2BmXtZCmxXMqSGo7uwd7kYdwUPHvy+DuI0wWnFX1WLOugP19E/EajKm4+sQ2a4gI+a1Hbn1qXtEPb+UaiUyMuwTMnNIAe52FR2yqeVX1meIBXvmDtS+EZfoPE2qEQuRGOpgGRgWLJWsHYYRJ+ZsT/kUthgcwQpKa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(5660300002)(83380400001)(36756003)(316002)(6666004)(31686004)(7406005)(7416002)(66574015)(110136005)(186003)(38100700002)(41300700001)(6512007)(86362001)(8936002)(31696002)(8676002)(2616005)(4326008)(6506007)(66476007)(66946007)(6486002)(478600001)(26005)(66556008)(921005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTRZMlVCOTlPMThZbW85Y3RVRjNYZjloQSsra0JYMjR5elRjYXl1cEo1Wm91?=
 =?utf-8?B?WTB0cjJ0R2lnT1ZRZTgzWHNEV3ducHl0a2RtcklXYitlRU04Q1VrY2kvTlA3?=
 =?utf-8?B?eDErWW00aGhROVNUOVdqRnpaR1EzRSs0Yk9wR09EckJsc1ZVZVlTUS9qTm5u?=
 =?utf-8?B?VXByaDV5QzA3QngrWGlBcUg3RUFoWERDVU5ZYnZ0MzlabkorZGFnYzl1SnhQ?=
 =?utf-8?B?YlJEMW5xMUJmVFdqTHpsa1pDSHI4MDljZ0xwY2daZWlhNjlXUVI2TFIvWXlr?=
 =?utf-8?B?eXhrMVpTVnFIWExjczRSdHpaKzNqeHJYTnVHaU9FSFpMa2hnK0tUZmFZY3g4?=
 =?utf-8?B?NXZvZjM2RUxpNkZjZnkzYXY1S0VYSWJSS3lKS0lZTGRoUXVnbW5KMEdUTVNO?=
 =?utf-8?B?Z3NVNUZtUEh1SVFnajYyRE1sTkgwN1AxR1VZUGNuUjZkblN3WDFQd2xBL2c2?=
 =?utf-8?B?RWZ1Q2hjREdtNXJDNjZjNGVnYkVWdU5xSyszc2I0NnJ3d1RoRS82Q3MrRThV?=
 =?utf-8?B?cWVWS2pEbzF3Skh3SVd4WVYvdjJPaVdRZWUraWNLMHlWcGFCZ0pWdHgvTUsz?=
 =?utf-8?B?ZkZ5elN6S2hFZDlEY3lWdkh3aGpoT3ZBSE5IK0FFUGNOalJwZUpqYVVQSVFC?=
 =?utf-8?B?cFNJMVVkd3lxbjdpME16NVJ2ckRaajNoeE5DSDQrdllMcjBZY0hhQytmM2hz?=
 =?utf-8?B?QnowcHRHUGVqa0JjUmpZQUkyM1JicGtVQXlOWGxzQlhGc2lrS0FGWXBhWHV4?=
 =?utf-8?B?eWVRN1diMFhvbEtFSUgydXFOclRSQUZhOVZ1K0RlTHBsWFFmbkV0cDdzMC82?=
 =?utf-8?B?aFR4QmExUGlITXB5YzNYY2sxOEdLTjY3RG9xUGJHUTU2T3lmVmgzWXhWQyt4?=
 =?utf-8?B?c25KeFZ4dGYxenAvSjFubFl3QWQxZzI4cW9VZVRHVDZpc2oxQkxvekZIMjhv?=
 =?utf-8?B?RVU2QTdEYU0rK3FaNmY4WnpHSEUxcktQK1RZU3VoYUp4c296bFlLS2svdXpP?=
 =?utf-8?B?STdPN2w3NHZwTU1DcTVrV0t2VC9JT0cwbVNzTkJIdjVYVzdSWjFCT29WQWNp?=
 =?utf-8?B?YkNaQ21aS2NKSG1vZDkwdzYxOXQzdXpDN1JhZ2pVUFFUTTZ3bkI5dWtsMS9T?=
 =?utf-8?B?NXREOERLRVBkUnA4Z0x6aGd6Zi9DdW1BaDVIcjRha1NOMTJMUWhUeWNuZVhO?=
 =?utf-8?B?S1F5dExxWjlhR1prc3BGQjlET0VNaXUzY3VUYWU0VjJJK0hIbDk2WndJNFFi?=
 =?utf-8?B?dHRuNnVCNzMvdlM5L1BXYnVrZ3ZGSi9ZKzBvSENneUlncjMxdXVIVGE5b01p?=
 =?utf-8?B?N0tURzI0OHVqUnYzOFlZNXlTY1F5anZqTUUvYUR0bE8vK2ZEZWNkVzNPTjZ3?=
 =?utf-8?B?SFRYVVVRZmttcGt2VG1SSG1RUFcyMURsbytHS3VmdWlHY0MyRTM0Ti9TUGZ3?=
 =?utf-8?B?QWFtb2NINXhBWHY1T0Qzd2FtckVJOUtNcmRjdGdCWEpFeW1ZUzZjeG9kc2Rp?=
 =?utf-8?B?T1NUblBVeWIzalZleFI5RDV4TTVldVd6MjZvMVhYa1JBaGszdUdFVDJCamJP?=
 =?utf-8?B?T2NGSFJ6eGxXZ1M2b3ZVQ0svamtYY3lNSVhoV3V2WWUxQXJTSFdkR2NRUnRE?=
 =?utf-8?B?NGpGTDd3TkdNUXFsdVM0VFdWeWhMM1ZLeGpSeklEbW14TitsME5tc25Zb3lm?=
 =?utf-8?B?b3ZEbHNDTXlYUTVQRHZrZytOVi9LUTNhM2libW0ySUhYcXRVUEE1S29oYzZE?=
 =?utf-8?B?TkxjN3l6emlRMkFFTk15TUQ0N3Z3VHFIaE9pL3U3QmtzRXhxL1RwdHRWbUEy?=
 =?utf-8?B?UXM4VkYzTy8yakJ6b2RvcVM1N3l1NCsxY1F4RFpocmpBMFdZczNHaTc1QjVM?=
 =?utf-8?B?S1JFem5OYnorMU9ickZNRXpPVUk1VkxLa2JpR0FKN3VMeW9zVDdHRCt4M29x?=
 =?utf-8?B?Si92Tklxd05LMzlNYk5hSmhxUXJxYUhtS29raHRMem8yaG1OWDZXdTRQUHJM?=
 =?utf-8?B?bEJvbXkxSlhFaGNLMURRNzVUZ0c4bEdHb0VBamRoUVRkMUFoZU1NTzlmck5h?=
 =?utf-8?B?LzlyblA3aS81MkR2N2M4TlNTbUlpUEFoVDNqaVNTUnVhaFBnejc1OTdKem0x?=
 =?utf-8?Q?5kychvX0I8nkNI3QEUqMXQbE5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3a9da6-9ff3-498c-c857-08da8be529d8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 06:42:39.4222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYiz98BVSRy9vMtowTQs0BSqDpbdslzvNTvgG25KNatCWU5+G8knz2QD7xmAznky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5156
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
> Prepare DRM prime core to the common dynamic dma-buf locking convention
> by starting to use the unlocked versions of dma-buf API functions.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_prime.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index eb09e86044c6..20e109a802ae 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -940,7 +940,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>   
>   	get_dma_buf(dma_buf);
>   
> -	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
>   	if (IS_ERR(sgt)) {
>   		ret = PTR_ERR(sgt);
>   		goto fail_detach;
> @@ -958,7 +958,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>   	return obj;
>   
>   fail_unmap:
> -	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
>   fail_detach:
>   	dma_buf_detach(dma_buf, attach);
>   	dma_buf_put(dma_buf);
> @@ -1056,7 +1056,7 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>   
>   	attach = obj->import_attach;
>   	if (sg)
> -		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment_unlocked(attach, sg, DMA_BIDIRECTIONAL);
>   	dma_buf = attach->dmabuf;
>   	dma_buf_detach(attach->dmabuf, attach);
>   	/* remove the reference */

