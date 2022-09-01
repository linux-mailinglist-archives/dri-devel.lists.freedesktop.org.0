Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0685A8F27
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B746710E5EC;
	Thu,  1 Sep 2022 07:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6300210E5ED;
 Thu,  1 Sep 2022 07:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPzSCi8k3/7ttIhxg5dXw4/AAqegzMiOEUcFEOd0BKieVYx+9VsAfpU9a2w2ZAJTtqHhrM550K4FUJIcduPgeEfMgVKOIcwiCV9IoB/kXmTnK3qi58k6UKMgm9X7IB+qGbM43hM6TJ+8ZnMbDeo5kfqcwwG/o86PRinSsIOKWj6Qwv2XwvqiJK3K5bIYlHeRflgMwE7S+727bmqpINNOFO/c8Jzfh8+XK9a5DUxQUl2pvdASZ0HdaYFGoIFTCZgP39j9wShjZ/mXkXBywG2LOhQOw5wgnXsfTDnWKDGiNop4Z8fzQHR149vWrsX+oZeTJ9XfkoJkZ3vSfGajAtTqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vC5z9Pw4VGhrPJSUH+dcWrH3COwcVlAwYmt0ib+q3LU=;
 b=VFmXvf9fjfqQ6nC6lexsvelhSaIMbkCxH8HfImq3FpjhxsYmRm3XHGlWk504Q6AXSh4CCJwJbhEV9EElMOutq2+b2q7QIP7Lms9YXl0rKH//rn/NUHKyJMmX1sF9Zjef+NwD5fhIJFw1XZPuytePERM0d7pr2yw/Eo3/UBd+V9ANA16870UDQwzyLeLxOArPbWRM0PqpR99HIJenIpMU4U+aGqhoIqi6Wfsd1PJhXsz8lHp4HDoHy2P346rtt18s/T15dyOoVzGWyiG6fx4cYNUYNOOknVO1qm0QnWT/XoZUAGIAsXQQutCVbixec17DrimPwqHn/j+oUUEys7LFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC5z9Pw4VGhrPJSUH+dcWrH3COwcVlAwYmt0ib+q3LU=;
 b=Kxwb2nY1uF3p7NWp2c1+Z0+JCxwcm817j1W2lNk+GUraCj3H6qpMyX8+vPVgRkN1/pHJwJ/eVZ1aNDgq25/ZUZX2mOFX85rui4FWsIlrvlTzfhrdPkaL/pe/E41+4SFyxaRECuSlSGUuy6a6gU37moGMXfz23nhqexZ2rFqLrgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:05:05 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 07:05:05 +0000
Message-ID: <7a9bcf6e-45e8-0be5-b716-5b71c9cc0623@amd.com>
Date: Thu, 1 Sep 2022 09:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 13/21] media: videobuf2: Prepare to dynamic dma-buf
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
 <20220831153757.97381-14-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-14-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0051.eurprd07.prod.outlook.com
 (2603:10a6:203:2::13) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21dc0712-a379-467f-ce98-08da8be84bf8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMgUfPhbcrWv6bIrPmIkxakhJRXzfbNRoOCVc19g9GOlKxkBmzUb8DO3gq3Il6fMhRkrFDnP3kFEZ/AbgJHoiYjIHv0RiBiwgNSrSmCE6oGn+bmJmg/QPHBctAZmItZFlAYGt/Q7Wr3xWG5auv+x4cP03Oz+32x89OkaoxCHPzWhrHerVsOUIsOx5v0cPZxVN/0GUG8DOLostVAXK2N4PQkXHQD+O7ic+QdxT7vVF42wS2hiSBZY8THRkw/vRc0ew6TrtlLWGUXvHAfWqpgI1uzB1NYqS4+S5jDKS37JQaaIklgAU3kFlwmHKAdcrJaqRDIAAu9k1aB6XAom9oNV91Zc2b3BmVwECT3u34qb8H3+UqgHPIq6q7iUqAPUfjEKIbiQYWRLzr+qLF2gxqHzbRdioNIuM/KthQ5tlcN+qoWEl64UUK4QpUmavM3tbusNfpy00LZDCNVg222VNJvutkIVVL8cwP7vVR/tk6/xsMhv0ig2pc7pcMtInaq3tmaWf+WOpjlaLbymAapRe4k9VQkkPXhhxCXvL7XmU3d0496EyAYFDo1PhaQuh83wBFn9Q0SM2Mw95ZdzWPgsdmVLVqM2H+U8KXBdpei/brIykmO7vHI7Li0z6ccWVGVt11uW4iogbPoJsoP0KkONL9sB83Emlx7fqxaBAH7sR58GMcjlom8Pphq/hahll0YdMdayWboHLyo/s2VCoQr4ZLGjn5pdJREX9SUUH/QCkeJybrDB7gveXF5iC9iwJZ+W1jiylYtpZ4Z1JfI2uF/FF/bW70Ho9Boxi/Yb2HXrDEqnURL/IMI7pUXvxN8hJawf+0mw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(41300700001)(6486002)(26005)(6506007)(316002)(6512007)(6666004)(2906002)(86362001)(66476007)(36756003)(31686004)(31696002)(478600001)(110136005)(66574015)(2616005)(921005)(186003)(8676002)(66556008)(7416002)(7406005)(66946007)(38100700002)(4326008)(5660300002)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUlXNTl5Vmd3THJ5NjJyZHZOTTZDQlJoMnRtNTg2Q1dLMHBWc2RMeWFhMjdk?=
 =?utf-8?B?dUF5Zk5waW1nS25kYUhkTjhZV0RadVFBN2ppTW53YmtKVFFOUVJzeHhTTWtx?=
 =?utf-8?B?NlJWUjlnUGpXRVkzTWh6Nzg0ZVo2RGgvdnhZR0t2dFdhZ05jT2dsNFhHSEpj?=
 =?utf-8?B?M3VYeVZGRDVja1U2SEJYbDVrRWFyL2NBSis0OHdVVXpKeGFCL1lGOU5YaGFp?=
 =?utf-8?B?UEgxbVRmQkttVzV6TU1YWVRwN2c5dzRxM1R0UVZNcWU3VTZsOHpXQW00NThS?=
 =?utf-8?B?aWpkVS9hVTl4VnFDOExGVWdKaGZDRGJTNk9YWkFGWVpsdUxQYzhWQVI1WWtO?=
 =?utf-8?B?M3d2Rlk3akIvdi80UW9lVGkyRjNZT1F1TnNGQmVRT0ExZk14SVJ0R2prcGlh?=
 =?utf-8?B?blNmRHY3dGNSaThsWmt3Zm5JaDJjV2VxY2VXbEJzTjlxaDJleUpiejdqRml1?=
 =?utf-8?B?VnpabUl3ZnV6d0xnWmR0ZFN3ck5UNE5nTm1yNmlVYXZSUTVTQ09xZi9QTGY0?=
 =?utf-8?B?UktDZ01xYjFsOUxFang0WmhQT1BqODhocVJVYTFlaGNvT05uZ2pBTWR6RTZW?=
 =?utf-8?B?dnFOVVJITVg0aFhQVHFkM2hVTUJtL1lkM1hsVDRoZTBjS1o2YXZTSzJWMHBQ?=
 =?utf-8?B?a3A1SGt3Z0UrRnpnckFkUVVLQzNQR2V3RGpqUk5ONWZ2Wk5LN3l3dFAvbEJG?=
 =?utf-8?B?a3dLR3pOVE00QnZUaVQ5VUZFSTR6d2ZlbzA4REdjR01XWVorZEE2TkR0ZThp?=
 =?utf-8?B?c3lSaFBMeUFDcWhtOTBleCtGSnFkaW52bmhYV3ZjekpWTDQxNE9ZbUxLbzd5?=
 =?utf-8?B?NFRxZm1odytBVXBFUGhDSGZvTmJ4bERZUVYyS0NLdUpVY1BEb0cwYmt6Z0Fu?=
 =?utf-8?B?dTh0U1pHOC9NY0xOamVrQXJ1a1I1WEdXdnphbDRrd0o4SldHT1pNTUM0Ykxh?=
 =?utf-8?B?UFpXS2NWT3VGcE0wUjhMTURPSlQzZDlBRFdWNWd0QWh0TUtTa1hPZ2pMeUtz?=
 =?utf-8?B?QUl4cmRJaHZOUE82T045S1lGUDlrS001SXlwTWhmVTBoVUUzYWY2UUxBUlhl?=
 =?utf-8?B?bXhEbUx4NWtDTUJadThGSVBrcm1ZcHl5c05iQjh1dms5VTZ3SCtUZU9RUFg5?=
 =?utf-8?B?ZklHenpnWDVrWnFDU2FOdEVlYm1tK2syaERQdkN1YkhvOW1hQ3FkNjVwTFVG?=
 =?utf-8?B?dzhRLzVzb2lUdllZUktUemw5eTZpY1pueGo5Z3d1MHhSNmlLSE1kS2tGcWk4?=
 =?utf-8?B?TUpEMFJjNmhlUmFwZ3Nib2xlWGRVaWNCdy9tVGJjdWtFRUdBUGxKS1B3cGd5?=
 =?utf-8?B?T0tHbUtqdXV6cTJISnhDeUEveWt1bE52K1NSLzBCTEZ6YmZ0T2QwVzQ1WW9h?=
 =?utf-8?B?MlhZSTN0WFFGSGpSOE9sU05LeUg2aGFhd0doL0pjcjgwajdHUHFKM1dKR2VI?=
 =?utf-8?B?Q1JJT3c4RVdWWlA2dndDRkJ2NmRDbWlQblJ1QUh5OC92aWttSm9sZko4SFc2?=
 =?utf-8?B?Z21kOUswUjYzNHhpYWN0Ym0yYTViaGlta21weDBHZCs0V3FscVA4QlZUZlpy?=
 =?utf-8?B?V1FabXNyZlJXb0JIR2tST3NnTHV4MDlLZmx5ZVNmZklzNFBLR3NOM2tUbFpy?=
 =?utf-8?B?SWluamtKZWx4QUJmT2NiVzhDUExmTnB2dlpiRy9nVjdMN3BQeHV5U3cvTVNz?=
 =?utf-8?B?N00xWG8rbmpLWGJRbHl6a2tDOXY3Z2Rya1VHdGVRMEh4ajg1d2oxMkRuSEdl?=
 =?utf-8?B?dkc3SVVBRTJXalltU0orSlhBTkFvZ1M3S3drT0dGY3c5WGh5RkFGMksrU2pS?=
 =?utf-8?B?TUgxbks0Y3JHdUlycTR3ZXZ0TDhJRUpDdFZJM1dJa0llR3NSelZpVXMrYmdK?=
 =?utf-8?B?TXViRXpRMks3MzJmMlhCbmM0QVl0SDZSVjdOZUNpL0wvM0FNMjgyMlJPUE1r?=
 =?utf-8?B?cjBSOWk1Qk1yNmk0WHdNc1VKRlVUampadHhVMzdQNVpGWUNhVmx0bmxsZTVm?=
 =?utf-8?B?Yy9Yckl2N2hWTG5hMkNjVDlyeUJXNFVOT1pJcUF4YmJuYWF2RkdGdDIySXYz?=
 =?utf-8?B?VWpqZmo0VWtla01Qd2hhTi8wRWthc3Vlb2M1dFRJWUdCYWFDM3NGZW1kcnl1?=
 =?utf-8?Q?dz+gZ1ELI5g2AOAefsqYj/iTB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21dc0712-a379-467f-ce98-08da8be84bf8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:05:05.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RpEALNQu+tzLmymzDbw+VcGjdnYbhaEyG+s6xrIjfGNOotqBl6TIwZsS+TqblSv
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
> Prepare V4L2 memory allocators to the common dynamic dma-buf locking
> convention by starting to use the unlocked versions of dma-buf API
> functions.
>
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/media/common/videobuf2/videobuf2-dma-contig.c | 11 ++++++-----
>   drivers/media/common/videobuf2/videobuf2-dma-sg.c     |  8 ++++----
>   drivers/media/common/videobuf2/videobuf2-vmalloc.c    |  6 +++---
>   3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 678b359717c4..79f4d8301fbb 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -101,7 +101,7 @@ static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
>   	if (buf->db_attach) {
>   		struct iosys_map map;
>   
> -		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> +		if (!dma_buf_vmap_unlocked(buf->db_attach->dmabuf, &map))
>   			buf->vaddr = map.vaddr;
>   
>   		return buf->vaddr;
> @@ -711,7 +711,7 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>   	}
>   
>   	/* get the associated scatterlist for this buffer */
> -	sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
> +	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
>   	if (IS_ERR(sgt)) {
>   		pr_err("Error getting dmabuf scatterlist\n");
>   		return -EINVAL;
> @@ -722,7 +722,8 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>   	if (contig_size < buf->size) {
>   		pr_err("contiguous chunk is too small %lu/%lu\n",
>   		       contig_size, buf->size);
> -		dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> +		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
> +						  buf->dma_dir);
>   		return -EFAULT;
>   	}
>   
> @@ -750,10 +751,10 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
>   	}
>   
>   	if (buf->vaddr) {
> -		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
>   		buf->vaddr = NULL;
>   	}
> -	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> +	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
>   
>   	buf->dma_addr = 0;
>   	buf->dma_sgt = NULL;
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index fa69158a65b1..36ecdea8d707 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -309,7 +309,7 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
>   
>   	if (!buf->vaddr) {
>   		if (buf->db_attach) {
> -			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> +			ret = dma_buf_vmap_unlocked(buf->db_attach->dmabuf, &map);
>   			buf->vaddr = ret ? NULL : map.vaddr;
>   		} else {
>   			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
> @@ -565,7 +565,7 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>   	}
>   
>   	/* get the associated scatterlist for this buffer */
> -	sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
> +	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
>   	if (IS_ERR(sgt)) {
>   		pr_err("Error getting dmabuf scatterlist\n");
>   		return -EINVAL;
> @@ -594,10 +594,10 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
>   	}
>   
>   	if (buf->vaddr) {
> -		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
>   		buf->vaddr = NULL;
>   	}
> -	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> +	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
>   
>   	buf->dma_sgt = NULL;
>   }
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 948152f1596b..7831bf545874 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -376,7 +376,7 @@ static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>   	struct iosys_map map;
>   	int ret;
>   
> -	ret = dma_buf_vmap(buf->dbuf, &map);
> +	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
>   	if (ret)
>   		return -EFAULT;
>   	buf->vaddr = map.vaddr;
> @@ -389,7 +389,7 @@ static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
>   	struct vb2_vmalloc_buf *buf = mem_priv;
>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>   
> -	dma_buf_vunmap(buf->dbuf, &map);
> +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
>   	buf->vaddr = NULL;
>   }
>   
> @@ -399,7 +399,7 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>   
>   	if (buf->vaddr)
> -		dma_buf_vunmap(buf->dbuf, &map);
> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
>   
>   	kfree(buf);
>   }

