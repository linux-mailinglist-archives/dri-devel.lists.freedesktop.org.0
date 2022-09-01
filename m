Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3B5A8EA8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 08:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84E610E5D5;
	Thu,  1 Sep 2022 06:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F2210E5D5;
 Thu,  1 Sep 2022 06:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK82JKVXMMEfjra4ba+Bbnyw4cyJHljQyH3Dupfx5ODHOu+mNpiLSKJRBocoP7hJoGiuBab3ngkHRVk454Py8fdfSHs8RkyAj3yBdx+6fAFhoWI2AASdv/d2s0jMeJDIuHeoduPavY3nOi92VfU/l63LhkBDNNuDNNrtVPZ2++MEOtSY0cBrQWXpXZ+rUHOg5KkgfrvSzAj4P8YVsu3vepaZBdwakvWX8u0Euloz1pypTfSIFXZK1gqNPA2DUK4RmKly/zOcLe4cEAZ2sQaupVmwMQEeGisUkbJpIou41gMihLlCcEgAG7iltFB16fjmAcUkW/swt8x8rzmtfm/fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPV+fN/IgPonO2d/3mQjufZK877q8riVBr0uiCKDOKs=;
 b=MxBzX0ycYn7NuOzR+d0reLv08HGaVCZUjdk6L8HW85q9rU/N35LAdYPmE7kl+dHu9sLpPJFXWnDEm1xdAkeUxgtE3/K+UhYkDr/0BkoQLeKDm3Yo5Tz2rjIDWAikGihAWEIUsGCuu3GJ2uvcAFPGHaqLVLJV5r87fMYr4RuPyosS1JaPW/MBAmlZVLr5df0nO7CIFYRzzhmOyeerWDDxmWBQzYFlsrwE15/Z8xcK9+7ZA/T9PBSSBOcCMIX52Wq5UOWeOxPLh6xAjcPsdq8TEjs9wmClrXYOHsRO6bwj/72CRcwNie2oGtZ92Jg9HlQJm1UjSNGo5F4FRa5b6GXctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPV+fN/IgPonO2d/3mQjufZK877q8riVBr0uiCKDOKs=;
 b=EDEVblmhCaWwc0JcDYL8iCHEA+Q/XIDPzMYYzjJYCiod4e+Bo2QQMufj3WWEB22FjQ1bTwz0Hjo9hSQKe19+r1t1Wy9quBs/Cb0RIrVqakS1cWubGEW/abT/gMDGt81dAYzy0xjJXQHdzLNw1y+4WIp367b7RU9aB4iClVl+s8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 06:49:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 06:49:16 +0000
Message-ID: <7108c7c3-865e-c74b-b993-1227f31a0ef4@amd.com>
Date: Thu, 1 Sep 2022 08:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 08/21] drm/tegra: Prepare to dynamic dma-buf locking
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
 <20220831153757.97381-9-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-9-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P189CA0045.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:458::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2e243b5-b0a1-453e-2ddf-08da8be6169c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViNPMCT6YUsrjN4C0212f9sdI8meg/rmTjuFjKvSUparj4FH3lWoT0Vy6WqkMavrm2vEYfpK+Llp+eCMWJ0PSQqNVDUCJFkvmCgnwmsiucgk9b9HeOe0F3DmMoTHGY1DZY/jBtN4F5yJQ5CcqxBMS/lDSXNjtDsskI6yzHjX3a35f+XOmhwoUfckYh9gkfw+UBDpiPxkPbZomH7dPCHzzBlC3jCeIKvi9C/oe2vniy6lrufsdoPDOjAf/d0tF1aEJ4f5xO0jVsLc5q6F764ytQtrUKNrIiHYONdZIGXT8LPY6RbIJncht7tC1Q/seLop8vtwQP4SWWaiw6PB41sFm7Se9ot+TE5NR1R0ITQ8ga0aDhMxBO9j6eEDZ8Um3IjEL2tt+rOI687PhyZ8endNT7YywBL//CKZRH/rAPUGl66dVNLTOYp+xGGIexTLyCP3A4G488WHR+COkt9OKvF71Di8COhb11BKMLcVVJklDhYHuJyE3ZzEhraHPVLVtdmqVBwvT/lkqIBRikS2KyTDrF3ltvM5yfGosBQsLnNxXxvMA4FK/xGrpRAwYwzKgLBCZXs57VyQVvX9wANGjfjjB1seTx5+BQHWguL0yUd93SzukAlsR+8EE5ryEiWUQxmqpKWZ9mvMvEJ2S9npUqpt3Z73Qt2V36ACRjlRM7YrJ4WeNNs2mh/KAZy4viJ5RGol3gRxdGtO7E9vQ2pJCQmVqf6f+tCjzChpOTUukc7zpiYq0aDhRS3BGb59bQ7ntRW9UaNl17JmIWXsBBlJ5BJ39Ia96F7DCFjOoqJ4XFzRpoywJZlOEwEMd//BsqQrZZU9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(83380400001)(38100700002)(66556008)(110136005)(316002)(66476007)(4326008)(8676002)(66946007)(478600001)(36756003)(6486002)(31686004)(6666004)(5660300002)(41300700001)(8936002)(921005)(31696002)(86362001)(2616005)(66574015)(186003)(7416002)(7406005)(26005)(6506007)(2906002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjVVbmxuOUxGVUdNbVFGYXp4WXZ3cDdPMkVIdEdOUnFIVUd4UW53b2ROTUc4?=
 =?utf-8?B?REREK2tMQTdrRDVxWTFXWWRpM1AwQU9hdzV3OEd5amZBb3FWL1kvNkxPbmZm?=
 =?utf-8?B?K0M2cDFYL1ZreHpCYlJsSGtZczFZWW1PbVY2bmRqVXgvTWlhK0Z4Z1RiSWFD?=
 =?utf-8?B?TUdXKzQrNURNQlpEbE5IL1B5RC93eXIxaG52bGVxUkJqdWMvVTVXTTBxdkdo?=
 =?utf-8?B?blcrVEk1V0JYbDN5ZGRIZEVlZ1VLdm41ZHFJSm9KM2pZaFk3Z2NJUTU5YU45?=
 =?utf-8?B?YzQ0blpjaGR2K1lKYW5udktqS0VnQmtqcFR0ejFZVE1ITjNKcWZoRVpwdGFn?=
 =?utf-8?B?TVFVK0ErRS9Sc2tiOElZSkkxcmt3Z0xFU3EwRVNENTMxakJDNUNzOFc2endH?=
 =?utf-8?B?bG1LWTJpeVdqZHlmUFR5MnozK0xLaFJxSXUyL2lLdUZUWHpBelNxdmh0Rmwx?=
 =?utf-8?B?TWZza0dKWUNhRk9NeTZhYlFPUjVkT05QTmNNRENtUnpzOTkvNFlCRnJUV1Qv?=
 =?utf-8?B?bjBQZzFDS2ExRXRhSWJRayswQ091cGZ1RlBjL2FNcG9ZaXltdXFoN3hlMjg0?=
 =?utf-8?B?dkIydzl0MU9kRTlaUHZ6Y3FvV0lXOUdPLzYwcDFUYUNHRFhrdzljUTliam9P?=
 =?utf-8?B?c1E4WGVQMStNMnhGNEszbzlTVkM0U2pucE8rZk5vL3J6OXdaWCtBdEh6bmpY?=
 =?utf-8?B?ajl1T1FmM2hvNWVBc1FUdzRSb2lXMno4YjhzYlNFWTE5N2ZBMU1PQlAreEhz?=
 =?utf-8?B?ZmU4c0JUYjA1NThlczlNSDNhWUJVMXIxcy9yY2pseERwMjB3T1R3NEdhL0l1?=
 =?utf-8?B?bHZzY2gvaHpWbTUxUCtLcUNwdWhvVGxUZitnZHZMMk1wV0lrSHBDSk5FS3U1?=
 =?utf-8?B?QXZ1amcrSXU3azltS3hIeVdXTjhtVmp3NU1NNFdBcHNCRVdEOEsyMk1mR21w?=
 =?utf-8?B?dk1TcWd2emozczBCUGlEUXFmTis1WUNqVlRMaFJsQlNiNzFsRThVL2lNV2ZV?=
 =?utf-8?B?NEFaWDlnSUVtWUl4NVByNFhMUXVpWE5mMVY2NmRxV3BnWWtmMGUydjlPWnRE?=
 =?utf-8?B?Rjl6VENJOTcyWXB3WmNGc0JLTkI2T1AxMGp0UnRZaldhNmNtVk1VaStPRUo3?=
 =?utf-8?B?RW9XRzNYN3V2cVZOZi9UWXRESTRFS0JOelhYdDFUbzdpSW41ZVYzc01vWFZP?=
 =?utf-8?B?YnNPU2FublRFL3YzMWt3OTVIZ3FUVzBFMTZ3NTlxcXRxSjU2TjNrQ2hXSnJs?=
 =?utf-8?B?MWdycDZwcXpUSGdsTlg0WUJvbTVjOWcvTnF0TzVLNVJLekRmakhsNzE2WjNH?=
 =?utf-8?B?VVZLZVNicGFBUTNCaHg0OTM4ZlVxQmVXSXlNNlZIeVFyRDhjUVFWVW83NE1X?=
 =?utf-8?B?aWJCU2FlZlZvaDB1T2FVUFk1cTdhUmYzTzdMakw5R0E4VUdlNFFacWZlOEJl?=
 =?utf-8?B?TzNzYyt2azJXNkQ5cllTQm9xd3hBSmpqSlIrcG1LSHNRSXVpaE9XU28wdFor?=
 =?utf-8?B?bjFmWWdxMHlZTUo4RFc3dDF6U1o5dU8xbGlhOStHRit4NThZeWhOd1VwTW1m?=
 =?utf-8?B?NVFmV0lVL3lTSUVzM1h2K1ZkNjI2U29OSUhXMXN3TFRUQ2VwZnZmd2M1Wk9X?=
 =?utf-8?B?cHAvYmFmNGhSc3FTamhGSzRCVUZoTTdxSFJZTFhreE1GU3BPSHg4bDF0TUVs?=
 =?utf-8?B?cUVIZEQ5endJMzZCSk51K1FpT2cxNXJqelVqcjdQR3JrRVJORlpvSmVGS3NR?=
 =?utf-8?B?dGVMekd0cy9LVWI2ZmFnc2lYQUo0SVZGWld0VkdhTWNyU1MxOGQvdVZ6NW00?=
 =?utf-8?B?b0ZFbjFGelVRWks5WEl3UjdoNjRlUk5UN3NlN0RWSVhQWHZvY1duZUl1a24w?=
 =?utf-8?B?VDFBWlQ0RldmKzU0RzIwOS83QUtVMjJYblo4aGQ1WWgrMGwxNTliSVJJckdD?=
 =?utf-8?B?ay9ya2NIczBpV3dUQWtoZUlvYXg1WFdrUU1qV2xDQzFvWi9mS0lEdjZRR1ZP?=
 =?utf-8?B?NDhqaStleENNUFlGU0hYNVkyNXprTkNqWXhNa0pWb1krU0l5WTdPT2pSclV4?=
 =?utf-8?B?YmVydEcvRTdHSW9UQXhPMnh6cVN1MlJFcngvYis0L0JiVlBLS2lRVHc5bjJk?=
 =?utf-8?Q?RNBNDJiJ3tT74c54wYf2wtBGY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e243b5-b0a1-453e-2ddf-08da8be6169c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 06:49:16.6294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQm26iAz+Ydnnf2Sc1GurjvLZy0uzFmUkttuA2nmkIazZdgnldYVSgQ8pmGf0q9V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
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
> Prepare Tegra DRM driver to the common dynamic dma-buf locking convention
> by starting to use the unlocked versions of dma-buf API functions.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/tegra/gem.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 81991090adcc..b09b8ab40ae4 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -84,7 +84,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
>   			goto free;
>   		}
>   
> -		map->sgt = dma_buf_map_attachment(map->attach, direction);
> +		map->sgt = dma_buf_map_attachment_unlocked(map->attach, direction);
>   		if (IS_ERR(map->sgt)) {
>   			dma_buf_detach(buf, map->attach);
>   			err = PTR_ERR(map->sgt);
> @@ -160,7 +160,8 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
>   static void tegra_bo_unpin(struct host1x_bo_mapping *map)
>   {
>   	if (map->attach) {
> -		dma_buf_unmap_attachment(map->attach, map->sgt, map->direction);
> +		dma_buf_unmap_attachment_unlocked(map->attach, map->sgt,
> +						  map->direction);
>   		dma_buf_detach(map->attach->dmabuf, map->attach);
>   	} else {
>   		dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
> @@ -181,7 +182,7 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
>   	if (obj->vaddr) {
>   		return obj->vaddr;
>   	} else if (obj->gem.import_attach) {
> -		ret = dma_buf_vmap(obj->gem.import_attach->dmabuf, &map);
> +		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
>   		return ret ? NULL : map.vaddr;
>   	} else {
>   		return vmap(obj->pages, obj->num_pages, VM_MAP,
> @@ -197,7 +198,7 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
>   	if (obj->vaddr)
>   		return;
>   	else if (obj->gem.import_attach)
> -		dma_buf_vunmap(obj->gem.import_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
>   	else
>   		vunmap(addr);
>   }
> @@ -461,7 +462,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>   
>   	get_dma_buf(buf);
>   
> -	bo->sgt = dma_buf_map_attachment(attach, DMA_TO_DEVICE);
> +	bo->sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
>   	if (IS_ERR(bo->sgt)) {
>   		err = PTR_ERR(bo->sgt);
>   		goto detach;
> @@ -479,7 +480,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>   
>   detach:
>   	if (!IS_ERR_OR_NULL(bo->sgt))
> -		dma_buf_unmap_attachment(attach, bo->sgt, DMA_TO_DEVICE);
> +		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
>   
>   	dma_buf_detach(buf, attach);
>   	dma_buf_put(buf);
> @@ -508,8 +509,8 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
>   		tegra_bo_iommu_unmap(tegra, bo);
>   
>   	if (gem->import_attach) {
> -		dma_buf_unmap_attachment(gem->import_attach, bo->sgt,
> -					 DMA_TO_DEVICE);
> +		dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
> +						  DMA_TO_DEVICE);
>   		drm_prime_gem_destroy(gem, NULL);
>   	} else {
>   		tegra_bo_free(gem->dev, bo);

