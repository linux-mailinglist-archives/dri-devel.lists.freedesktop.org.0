Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC1659FCEB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A3012A856;
	Wed, 24 Aug 2022 14:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BAC10ED16;
 Wed, 24 Aug 2022 14:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUI5psnn9YU88ESkQsnWyG7rcl64OJ0HFnQy+NKXu/3hgGBbyryJqkMXNM50xs7AcnKggsGtidGGtKncR4lMjc/zmjhv7JObR12jzchpaTlURCy9zOipDk66ih+tHS3u9TAr/mChASsUXdvrRsyxfRy4KC6adfhpmws1i1gfjMYnjiWC1PLNLrnfCRPQ+Eji2ERhdbFe/pcanj4PhOPAykZ8flSCoZhMjnoor8pJ+8UVuOhYIVBGLGAOCBl5aTWMvmIf+iwmBA9thEJ4cXW0iF2P8vPH4VIP9A3qWxT0EbBR/KuO3hfcuAaEwivMENQn+uWNWnfbKSMfWZcBjI+4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqPUQCej5vuqxvtj8Chlk3T/0EwQ6MX8daIfGCr7o8M=;
 b=Q/zpjzsd8PKzPRAiGtKOrNm8p3Q2b3e9k4ieBxDDyjh3EzefJ9Me1ZYtYK068+Rf4ZvEUam/56iYSNLWZlrr6RmaxFmC9GcKvAPuMehh989ef8FXBMu6lNNBYOjCeUeoTuhIKAbI9rw+w3/wZBHGX7BbKnvBxNuXfL4Eky+pL6EsN21RXyb8jzxiUMWLRlcT0e9ugLTt8n2ZKj8C+9s6Sg/0rX1BBNWrlomGiS9Q5FeUcg390XHLcsy2OGNafpV1JWwjg0uMTd4Ix7iudzEiWJHkENSurCy0kQKKLZwln0gR0ozM+PY1NphkAL5wFdM61fzZRWJlk2EOKClnFMdjPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqPUQCej5vuqxvtj8Chlk3T/0EwQ6MX8daIfGCr7o8M=;
 b=Y//LBNIdSuEbi5KCGlt4AFPCl3nZqXVMxwAGSM0Xo5DjjgK3mybzaJy3nO/JGgUaCnA0OnmX91jzkmUpZqAa2s7ZIZidepaK0UpO6DCUtdG+3c1KxaIH0m+AIRiU17Sr+vqOtpsh3tZCYF5XPGSW/+O6p7nJ+8XLC5jSnKUTPfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB2648.namprd12.prod.outlook.com (2603:10b6:a03:69::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 14:11:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 14:11:15 +0000
Message-ID: <d21197ef-79ba-3506-85aa-559e485cfc5a@amd.com>
Date: Wed, 24 Aug 2022 16:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 9/9] dma-buf: Remove internal lock
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
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-10-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220824102248.91964-10-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0201.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76c69caa-e6d6-4c43-2812-08da85da6d0c
X-MS-TrafficTypeDiagnostic: BYAPR12MB2648:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5VSKBO3XVc60D6700YOxH3qjcLUmE2UHEi2mI+MhmJ/MabENgXv175BTq9gicdOwsbLl6DboRwf3C0R4iUsSUlzUB+FErIFQujRWLaidiKxMNQpLmrftNqJiZtlUiRPPSmACZw8ngw/BmNnOR0cwbi5crKHiRsEYZwVO7kUUOkumfcWSsa014UC5Qif5PGZB+i65ibarH3vPad91UpSDM/7CDwtU6D35gvKLk9d7iuIpALo4ma+JTP9hTu3+hhfXDk32XQmPEkNMi1HGJ4a5y+ahZiuxzUJ4n1VWIQDTlIjySXqAAhI0ov69HTKzb/el3qeYKRXbxAhDY9RnxABZUiPWmpn/xAyALiEFv56f03dptW4bVGHeUaS8wOM/q0FnjnS8WF9FdTRVuhMWvcVmqD29hXtoVU61iESxVTeccAHajR50eum37uvIo9eKEvA3AuO4IRTI3Zz6MpUlBtvg2LR97P76fBFZLZUhrF34r3eI3EYO10cQhD8bnEPaIYvsHsRD9waTEIKjmX2FoZcE+cBGnXbZKzZYoVfurESKtTUvDuiwIuQ7ekARRFLnEHrFjbMczY+oaBrmBBf/5Uy99FCaLMl9joHpNQ25ZdI6ePwg2m5eEul94KmFbcn4vATqoT2+1pZo4jjX/GQ1ltpkNkHBJngnvOnGnu+1mY1hkbbjY7iQZ8HTFI6fTtIjd+ggyVzELS14e0/7y4vK30BcGroHHHIGBXDjt7OvdjSbVNkaR9O/oxyULbWkEauoZPlmwBBRHg79EZfpjxeXkwgTm38lhqcWN/6m5N9RP1/Era0rJl3yuBe7y/cWaej4H757
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(8676002)(4326008)(316002)(66476007)(66946007)(110136005)(66556008)(8936002)(7416002)(7406005)(5660300002)(2906002)(38100700002)(36756003)(86362001)(31696002)(921005)(6506007)(41300700001)(6512007)(6666004)(6486002)(478600001)(66574015)(83380400001)(186003)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRhU3QzVEpIbHdENXZYMmJVYi95UjdFWVQ1c2Rxem1hQnd2YnpyZW1wSE1q?=
 =?utf-8?B?U2JJT0NzK1NEZ3Q2Q2w0YVlpOWdrUmI4UWdZeWYzNm9ZQnpWV0EvU0pGR3RV?=
 =?utf-8?B?eXlJTEVnTmJIdHpxbXVjMm1FZnJOdVE5dkxqM2NuTXFHdkl5dnRCOHhSTkwv?=
 =?utf-8?B?OUNuNXgwY0FESjhadlZxTUxZZ09mWFFDc2tWa1FMQzQ2K0NVU2JZSnZVakJ1?=
 =?utf-8?B?RXNzdHZkN0hNOGpveTJxZUV2T0haYUVZQW5wZGNrUWRCMGJZN05FUk8xVmZ4?=
 =?utf-8?B?VzJXV1JDalpWVWVuZWRHQ1kzZWlSVi93YlhiRVRNcERHR3JFaDR2S3hqRHV4?=
 =?utf-8?B?SkxJRThRb0Z3OVYxRUs2eVhlcVpuUHRHT1NGWGlXTTNtUnZwbnhWS01WRjdw?=
 =?utf-8?B?c1N4WDhsdUxsQjFkamNYM2VzMWhOeXZPT1Y4a1ZzKy9iS0lPUEp3UjJEVi9z?=
 =?utf-8?B?R1p2d2NtUVpuaVBlTWszZU80M3lTRjdXZkJya01RV0gyR3lkMnVUZmJvKy9X?=
 =?utf-8?B?ekxYaEJlbjcwU0paYVFmcld3bFBwUGZWSFRJVXNHMURORmN6UDdodlV1Q2xG?=
 =?utf-8?B?bW4wZWVPOTJWdnd2c2NaQ3dLcm02V2hsUENmUDNOeVNsNU5zWUNqc1VZUkJm?=
 =?utf-8?B?N04zVTZHcVRNVEp1cC8rMHg0WENGYWp0c0VGWTVHRjRNdVUzMDk1L25KVkFT?=
 =?utf-8?B?MjJPeWxneWx6K3NjY0VIdFhkOVE5dW94WThNSjcyRmVEK29EaXlLbGFVbXIw?=
 =?utf-8?B?eklrQzRsN3JTay9sOXJwVnp5VnppL1NHaGxyc0pmRU4xVnJWUlVjK2ZBcUtT?=
 =?utf-8?B?ZkNIS0lOUU0zVysrcU8wc25CeTRBeUJ1dlFBMVVZOXFKOHVJNU9qV0lzcjk5?=
 =?utf-8?B?NUVPb0JhekpLaDVEQUxNQVFmeXAvOVhZZ0ZHNWhFaGJYV1p1TFRCaGdvYTBN?=
 =?utf-8?B?U1BqdlBML3cwaXVOUksrUTducXduV2xYbkJMNHI0aWFoczNUOTl6ZEo5VG9K?=
 =?utf-8?B?QUxhdmFZNWFjbHhQWlI1eUsremV3blNFUUlPL1NDM3llcy80ZlV3eXlYeWQ3?=
 =?utf-8?B?RTRjYkI2Z2t4NUxidE5TV3NpNDFLeHB4YUt6MzNNcmJid25mdVZuZ3hqaVFQ?=
 =?utf-8?B?MExudlV0VFZCQmUyNVY4R2hSdkZEc0tnRENKZDNoK1lNVnEzVklDa1RmZGQy?=
 =?utf-8?B?dDMyaFp6eEdadVRyVCtYL1puN3RQS3VxT01ndENZMTNFblBvSnArOUJ0OFIx?=
 =?utf-8?B?ejVnUGIycnd1YU4vZ1lzem12R3NJQUhjQUMvQmRSdTJ1VVVCalMrTHlsWlJC?=
 =?utf-8?B?TlcwS0hDSnY3SCtqdTVmMnowQ25PUHQ4cTY0VWZEU2poeWo3SU9yWjNXbDlT?=
 =?utf-8?B?K3pkTlgwWDYzbmE4RzdjNU55bzVtSUlJWHNqMi9ZUGFtL1JtREpRTnAwZlNQ?=
 =?utf-8?B?QXJ0ZW5oTzJOS2tJc0E4ckF0bUY0bFpzUjFQUEZqb1kzazdJWXdIQ21LZFhS?=
 =?utf-8?B?ZXd2NnNNc3lkSTJvaGdzNHhCK01oSWpTYllLUzZ1cXRGWkYrUmNGcXRaQlNF?=
 =?utf-8?B?SXFpcllTa3EzWjN6WkRscGVGdURjS1MzdlFWcVlkcmQ1WW5pdDhhL3RJMjg4?=
 =?utf-8?B?NEh3Uk1RaFVZMFJKMW40bG9PQkgwQjlMSUd4ZzRMbExVcDJmOXVHYUQyZ2Zz?=
 =?utf-8?B?RGFDaTBBdi9LdjMzejEyRFh2cFU0dUo0cTkzMm8rVmlqVDZON1JEUFhObVlo?=
 =?utf-8?B?YUVWblVmaVZhVS9XMWVWYy8vaVdhZnhNdkNOWmVlbXZjbEE4OVgzay9Wa3VZ?=
 =?utf-8?B?cXFWZVBmQll6Q2ZiWVoyRllwRlRIQzFqYUJkVHNtVUthZjdYc1RHRE9mYjFq?=
 =?utf-8?B?dmpDUXhLZW1QeTRxZDRueklqUGpzSyt5bDhpUkxHVHRGVWJnUU1pQ2k2LzJv?=
 =?utf-8?B?UWtldHhvOU1ORzRXYTJUaGU4QVVLaDY4MHFXbFNPeldZTk1zUU5GTkUvQ1FS?=
 =?utf-8?B?WjlXRDlzRW16MXNpbUYrTEJSaVhtRFJZdmY0dzkxRHRBZUF0UUY3bGVVQmJJ?=
 =?utf-8?B?aWFwb21NK29nYTlvRkpVZHVjcTJ4bllycGJpcmlnY0lDaVJnM0lIbFYyUTl3?=
 =?utf-8?B?WHBMNDNqTklPTzV3VzQzK0dzekduNnRPWHVYTFpFWUxQSmZRU2x5MVhpbUpG?=
 =?utf-8?Q?ILnLIrs5Ygm+v/XQ6cJZqkDh2bCP9E1S12oQDCawdwHH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c69caa-e6d6-4c43-2812-08da85da6d0c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:11:15.3482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jp+ksizDe2sYMUnT835OV/S/9lhwOXHwCsiMjF3DqrQWyU7iN8QBhkiekMxXDHKY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2648
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
> The internal dma-buf lock isn't needed anymore because the updated
> locking specification claims that dma-buf reservation must be locked
> by importers, and thus, the internal data is already protected by the
> reservation lock. Remove the obsoleted internal lock.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-buf.c | 14 ++++----------
>   include/linux/dma-buf.h   |  9 ---------
>   2 files changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 696d132b02f4..a0406254f0ae 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -656,7 +656,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   
>   	dmabuf->file = file;
>   
> -	mutex_init(&dmabuf->lock);
>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
>   	mutex_lock(&db_list.lock);
> @@ -1503,7 +1502,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
>   int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
>   	struct iosys_map ptr;
> -	int ret = 0;
> +	int ret;
>   
>   	iosys_map_clear(map);
>   
> @@ -1515,28 +1514,25 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	if (!dmabuf->ops->vmap)
>   		return -EINVAL;
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (dmabuf->vmapping_counter) {
>   		dmabuf->vmapping_counter++;
>   		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
>   		*map = dmabuf->vmap_ptr;
> -		goto out_unlock;
> +		return 0;
>   	}
>   
>   	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
>   
>   	ret = dmabuf->ops->vmap(dmabuf, &ptr);
>   	if (WARN_ON_ONCE(ret))
> -		goto out_unlock;
> +		return ret;
>   
>   	dmabuf->vmap_ptr = ptr;
>   	dmabuf->vmapping_counter = 1;
>   
>   	*map = dmabuf->vmap_ptr;
>   
> -out_unlock:
> -	mutex_unlock(&dmabuf->lock);
> -	return ret;
> +	return 0;
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>   
> @@ -1578,13 +1574,11 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	BUG_ON(dmabuf->vmapping_counter == 0);
>   	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
>   
> -	mutex_lock(&dmabuf->lock);
>   	if (--dmabuf->vmapping_counter == 0) {
>   		if (dmabuf->ops->vunmap)
>   			dmabuf->ops->vunmap(dmabuf, map);
>   		iosys_map_clear(&dmabuf->vmap_ptr);
>   	}
> -	mutex_unlock(&dmabuf->lock);
>   }
>   EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>   
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d48d534dc55c..aed6695bbb50 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -326,15 +326,6 @@ struct dma_buf {
>   	/** @ops: dma_buf_ops associated with this buffer object. */
>   	const struct dma_buf_ops *ops;
>   
> -	/**
> -	 * @lock:
> -	 *
> -	 * Used internally to serialize list manipulation, attach/detach and
> -	 * vmap/unmap. Note that in many cases this is superseeded by
> -	 * dma_resv_lock() on @resv.
> -	 */
> -	struct mutex lock;
> -
>   	/**
>   	 * @vmapping_counter:
>   	 *

