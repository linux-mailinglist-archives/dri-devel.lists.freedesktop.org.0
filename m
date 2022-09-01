Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56855A8F31
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368510E5EF;
	Thu,  1 Sep 2022 07:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3188C10E5EF;
 Thu,  1 Sep 2022 07:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LySZSym/1ofn10k2OZAx7MzvHo6Z4rv2wJxL0s/aZTg48+Zg395YN0yfT4RWB9Vfh8xo5yMLg3EQ4KoUmnRZfTo4maosw/rwfAe8lJODNU1mZk9/LLuLjyDGdoUhz4YCwGAtF5L0p17PAPDrx0iZk6woNXpTHMbZaG+ixfCHFkIMu4lwATZWVzGrNmwxZCsWzZpKEsTBMbS3OdRJ3GxyCC/NfRZuIa1DDnNWHnW6aAtEReIH/iE+efNvOHRl0KuQBqdo+uMsppIc6ecaSe3UOLh5CWwqrdE/5o5c0JfdgiUy4f6yGK9GzzSN0XS+T1wMr3IOsXkuyqqG/boFCYZDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVoZAvAykywtX4NrDLqL6ABhPOsFJxEw5nAvPK4+FRY=;
 b=NaOP3Mn41tcO5cc5lzGau2sz512QGLxVV4QLo5PKfgX52tXBwbL0ZlWNwi1Mj7eRPJzsC25tvzGxeey9YmRJzqVx/8L+6C0WP1addW+c7A2niz+x7xqLYX6drb8sl9lQ14TnXRAR1ZFCGp9CIsYfIshHv8ftCpGylLvr163xmrzAycikr4NHsHb0BySTKwEzubmz1zqUh34Qkd+Hdjl8HTJTbiJbFsh+tSYdRe0oiyffkDIPqeSaY72cgcSpVcQxl69gnlur8V+w3Od9331kQy7l08ux1xEsym/tm9gLDG2pNG9m0+Aljbvo4W+rwBaw04JqX6sqjE1bzUJcUmy3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVoZAvAykywtX4NrDLqL6ABhPOsFJxEw5nAvPK4+FRY=;
 b=uuDN0X3R6Wk0l/PE2HzfGGvz15Yz/WN+2HciqkalvDOEhSuQjNv+hK1erh2x2gmOd4Ks8xTzUuSzmAKRLF15/HvzdtOWkSJ5DtAtGXMFJe9EufMt39ccaO3Ve/7qQc2k2cishyNwltmWI1Y5kfVetlwCRuktlqI/KHhXR1nzKUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:05:43 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 07:05:43 +0000
Message-ID: <624cdfa4-2953-00b8-5890-e40bc1434f2d@amd.com>
Date: Thu, 1 Sep 2022 09:05:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 14/21] media: tegra-vde: Prepare to dynamic dma-buf
 locking specification
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
 <20220831153757.97381-15-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-15-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:203:2::30) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c228fbff-d746-4c28-f09c-08da8be862c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fsLeTNEnDZxtDEHxBLmQvang/BuX/RxTFWjK6l4bd4ItyPuFcO84fWWPbFYjanitYxy2wGNfc17+2IdfWd8zPvsxVmUsOs8XnbQd2+vEK+ylvBfpkBRloyn9MsWFq9UjNeJlx4Ak3K2rvNjo4SO08NVpPV/lyJr10lTra5RiGHpEYG8uk1OT/JnDNL7/jfwmRFY1KO2H2IyABTTrt8+b6PiwdZMtWajWs31umGQHE8bKNvXWs6Weeaws3bOA0h65EvzcZVgP7NWLZ+XeDWd/O7zWEyR+7+PSCf/IxcIsTh6F0hZ0cEAWNqpNZ2bAedjkKL4Rg/eefuEvnn65FgPHCXswfCWwQqcNzC37vFFtzOMkX0rY6Bu5JQeLdIh72n+CuCrAykeqrfozjuuLBEO3CzFBVYJhNaxROwVVCgudBubdCtXc6K/fbyAOUQ61ZMwOz0qX1+MOMKpvhVvXmDA3mbCvs7H+XwNGvXCln8hF99Ox4hdfDmcgHZC2ChMy1gPefPOFglJNHvmO6mzZk5HuoWmFvDTOFtniXUOAozdUJpL9fAyn+yAwDJg9zJraEfvLkc6X8QUKRxOO7be/F5n8tSDVMq40bNwVBjW2BFjTVbnJGv8UzY1rfdfCM6SOPOImTNojBTCOW9C9PuHMFb/kKRsQo9Ox3amC4PEVVi8CvrxRovx1F87cr9DX/UNtqtcx3DIAVVbVbkRzpj94OnERXMS7t0LSVmbsGLSU9UKF1+P2S5hNJ8hS4MkAoADNv/jEHdjX7EfarWOQfa6guI+UFanW0MD/PEPjjkNt2jwOLFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(41300700001)(6486002)(26005)(6506007)(316002)(6512007)(6666004)(2906002)(86362001)(66476007)(36756003)(31686004)(31696002)(478600001)(110136005)(66574015)(2616005)(921005)(186003)(8676002)(66556008)(7416002)(7406005)(66946007)(38100700002)(4326008)(5660300002)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDBJMDFCUjhhQ3VXc1Y3cVQ3VWhjM0lwWEtIS3Zwb3p6eGIwL3kyaklNZmRT?=
 =?utf-8?B?dzhEL2VDWjZHeXJWeXcyUXlPaVM3ZXBLdkJqUEJ2SzR3enpHVzcrK1FkdjVS?=
 =?utf-8?B?RFVMLzVFRnVrUS9CWis5V1QvVWcybnRkQVRUU2xFQnpVKzVsT0FKRlZSWVFK?=
 =?utf-8?B?RVBIM1RVY213eW05TXNnNTVWQkFCTkdiWXZKbDZrWkpONjRuWXJkcDhGQmVR?=
 =?utf-8?B?U0VUZUQ0bDNXTVMvbkdjdXk2RTRpL2hMOEljVUJRTy91clB3MkFYODVOaHo1?=
 =?utf-8?B?T1EyMkpiZzMrOUcvUFB3OUZUTnc0RXhWN0pqNG1lVm5meUJOR2JuSHdBdy8z?=
 =?utf-8?B?Q2s0N0ZDTHR5Z2VzcVZqK2VxVVUzUURVdTY0SG1GWEFObm5vWUU0Um0xbXFy?=
 =?utf-8?B?R2ZqVWNIeDlldElJMlZ5L3VObFY3Q0VicnN6dC80OHl2TTk5NDZoL0dIajFs?=
 =?utf-8?B?ZksyUStCZXNDZ29zSVJac2dLcEhoVlJzSHVHdVoxeHN3dmJmUXNib2d3RHE3?=
 =?utf-8?B?eml6Y0E1SDN3VnRKV2RvNzB1ZTlIS1B6RDlPYXMvbFc4QkN5dGhpaHVkY0xn?=
 =?utf-8?B?T1pDbE16MTcyOEFGNjVGc2x6V00rSnRYbGxhYzF5ZXJQUXhzMmtnbm5vcHJk?=
 =?utf-8?B?SElRTFhGOENhaVRGVGY0TlprK1dyeWRNNEhJY21hWUd6ME1ISlRTLzJFVE5i?=
 =?utf-8?B?a2V1aVM4RFZEaE52U1lRYml0K0p1MjZPZmdlQWRVdkRyUkpLRFp5SFd1S3Vm?=
 =?utf-8?B?YlUwR2trcTVTZGNsVW1Wenp2TE5CUzdDTkducHN6VkhwT1EzbkIzTk8rZXpC?=
 =?utf-8?B?cC81SEN3YmNkNlQ0KzVnZEZaMGYxSGc0L3Y1UnlJYW1teTlYV0daaXU4NG5x?=
 =?utf-8?B?SUFJZWk4TEMxb2ordXYwMnRpeFNGVnhrTnhsYnZBYkdWS0QzTVFTK1JRcjZC?=
 =?utf-8?B?L0xKV3ZsbzlXVHYwUEkrbndHcHFNYVpLTmZPc3NZanEwclIxWWxkQlo1eXM5?=
 =?utf-8?B?UWppOERxYnl6NnFCYXRTWm5QZTB4bkNNZU5uK3R6dDhiUEhzenpFT04xSU5J?=
 =?utf-8?B?aVQ0SmIvcGphTVk0K3J4NUFvZmlmSHU4WHhkR0VYMXZGVHhxa2FLV0d5OG5Y?=
 =?utf-8?B?Qm9FUFZ3SFI0TnpzRGtSOEVoSC9sN281aWx1UmJ1YVFiYjBpSUNyYjJzMXBE?=
 =?utf-8?B?N2E0SzBUS3dJVG1waHNWditvcEVHQml6YVlmR3hQbzN5N1Fycnc1NGFZTG9v?=
 =?utf-8?B?QlFwZGhqVkxIaThJcEVQRk5mdGJlbDdqMi8xK2FiWlNEWDM4SHFLUVZGVFVk?=
 =?utf-8?B?M01aWkUzQWo3eXlub0tnbG15aXg1WGJmUktVRVVtOWcvRDlma1kvM05HTlpy?=
 =?utf-8?B?STRndmgyNDhoMGoyaUJPc3I2YlQxTUJ6Qkp1WHZPYXRlT2NFTnVvZURncGsw?=
 =?utf-8?B?QlpsM3VoUlptODRPSXVFSDl5ZE5JaXRpZVpWUjdHdVJxTHBjRm93bFZoSkwr?=
 =?utf-8?B?Ylh0Z3RkUW05YkpFSDlFT0xKNy8xZFVSMHYvdHpPbXkwS1N4QWtIelFpeDVX?=
 =?utf-8?B?Wk1QZHFjVStHKzRhcjN3VHFOdXpvMWRrYTBIVHFFcElQbmFNR2xxWTcxclpV?=
 =?utf-8?B?c0tYWWNhTTJud2xEUzB4L3BqNXo1SStPaUdWRkRvL2NiOTNqdzcrdnhXcWFo?=
 =?utf-8?B?N2Z6akRTKzRBaExOS1Vud1dGK01pZDlmS2NQTlRhazg2dlljL2JoZi93Nmpk?=
 =?utf-8?B?SDQrUFFuaVp5VmZpRUN1ZkJPbFJtdHU5OXR2bHdlSm5IT09LanloM0FNbkMy?=
 =?utf-8?B?QU1BdFlTelRJVnIrclNNMXFsYnVQUmE2V0x2alJKOEUraVNuKzJISVE3TXBB?=
 =?utf-8?B?T014KzJNa0JhVkxKeHA5Q2d6TVV2YXhab3JDby9ZOUdudXpDKzduODU5TXdM?=
 =?utf-8?B?TzZ3aUdXRDg4VUYwVWJWNVJPcFdFY0lib0tKbWVYSzhEVkV0VTBhcDlNTjdJ?=
 =?utf-8?B?WXJDaXdHMERUOExrVk9naDd1SWY0Q0ZTNUtVS1RuUHVieXdiK28zTjN1Q3RH?=
 =?utf-8?B?amJackdaajhMU20xQ3hiSERMeXVucXVzY2pVREUzdmNZMUk4cllYMGdGVnMw?=
 =?utf-8?Q?fuRoD8uVV68XVC04lWIvID+pM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c228fbff-d746-4c28-f09c-08da8be862c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:05:43.7093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5xJLBjck23PA3lcjtOyiCBXc47FcTNjk7EmTrwrdphvYlgfGOZvzcVEt98AWE7G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
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
> Prepare Tegra video decoder driver to the common dynamic dma-buf
> locking convention by starting to use the unlocked versions of dma-buf
> API functions.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> index 69c346148070..1c5b94989aec 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> @@ -38,7 +38,7 @@ static void tegra_vde_release_entry(struct tegra_vde_cache_entry *entry)
>   	if (entry->vde->domain)
>   		tegra_vde_iommu_unmap(entry->vde, entry->iova);
>   
> -	dma_buf_unmap_attachment(entry->a, entry->sgt, entry->dma_dir);
> +	dma_buf_unmap_attachment_unlocked(entry->a, entry->sgt, entry->dma_dir);
>   	dma_buf_detach(dmabuf, entry->a);
>   	dma_buf_put(dmabuf);
>   
> @@ -102,7 +102,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
>   		goto err_unlock;
>   	}
>   
> -	sgt = dma_buf_map_attachment(attachment, dma_dir);
> +	sgt = dma_buf_map_attachment_unlocked(attachment, dma_dir);
>   	if (IS_ERR(sgt)) {
>   		dev_err(dev, "Failed to get dmabufs sg_table\n");
>   		err = PTR_ERR(sgt);
> @@ -152,7 +152,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
>   err_free:
>   	kfree(entry);
>   err_unmap:
> -	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
> +	dma_buf_unmap_attachment_unlocked(attachment, sgt, dma_dir);
>   err_detach:
>   	dma_buf_detach(dmabuf, attachment);
>   err_unlock:

