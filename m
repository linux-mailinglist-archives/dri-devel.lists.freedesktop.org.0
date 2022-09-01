Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF75A9103
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900C810E62F;
	Thu,  1 Sep 2022 07:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A7E10E5F8;
 Thu,  1 Sep 2022 07:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYF6CATeI+6DMfZ2tRRlKduD8WPzHMv6bSYyirIfsQu2hQSZuuCBYXLnNhIbQjuOSb1Zw04E5IKL1SFnAggA30jBLh8KBwl8wlGVdoszP5rOxkubv8msRT1fjJ6ZVON65L0rfqCqKsdf20VkOqEubVB4VEB8Z3jlknyg4JUAmgyMuwM2squqFyVPLFAp6OI3hn1P/z+cLnlMzVsTOW8Vf5L5K0cPnt8RXTKN9ukn6R06PhJ8jYbbVgFCZSKUiXokJibF6LIZGnUS9/vCpfgkyvTwj2XuMG8pIWd9MZwitYFAS8FjLjT2FO55Y0gG9bEm1DGcD8SmyLQSzCyR2Qegjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6rZhHYcnVAQMefbqlbTnswcKBiw5jcMh1AY9IE3Tk=;
 b=Od6Xl8ZThS84xk0Rk/lR52x3IgyukWM0sjhepRr10A5G3USqphH/eDF90x76pNUhNOV4Uwg2xty7SG+mTTLy/IPgKvQyBurw7Fa9G4XsCHtgtW37yaAicnyx4MKXXOKJVfOUhlVC4fjdPqzCf5UopwROC1cNsyq+gpt9HJHMgVzmgF/8hGI+SeJVyAh4tV973rXbd9SCXBslKxzCab1jqDIQmIrwBuhIrZ9E32wKG6FwOq/1/dT7SaQlMaORZS9UL7ZpiwxfBvBHV4aNpbbjpiRLjQydR/kIf3bXlh2wSWvZRN919MvtCU41m4DWM1xT2n4TMuog+4dbmxcNXJ3wSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB6rZhHYcnVAQMefbqlbTnswcKBiw5jcMh1AY9IE3Tk=;
 b=oVczly8sePR3s3duE7P+4uNT72RxjAKYAKkF4EuQ6O/6i3gHPxpD8jkTRGoftXQCTtdREXCrQaJYEhVDUwyWuIPzEIItN4fjN61NFaZgMXKvb1CxEZsCO2rpwbW8Yo1VoLJKLr+aUdl0RdAfWar2vXo4/naHdzquJirUQ5n7UE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 07:46:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 07:46:18 +0000
Message-ID: <23cc241c-5710-895e-eb33-3f12ce8e865a@amd.com>
Date: Thu, 1 Sep 2022 09:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 20/21] media: videobuf2: Stop using internal dma-buf
 lock
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
 <20220831153757.97381-21-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-21-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd114ec9-afa8-42d0-86bf-08da8bee0e0c
X-MS-TrafficTypeDiagnostic: DS0PR12MB6461:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HY7yeMjY4Da+bR91y3J01f9hYzkvgzrI9W1QEAGtrdocWAen0H+9fJbMmYFOX/CHE8Aij+4F3AIr9PJ92gFdHhtNJkb7oWCS6Z7o6DAMIQYeYzyca9gQUJse6tlrrOCfwATRkiPj5TIghVOOLkM7AEO6g3bnyQ+UXJ/hyO8UCS/8ZWk86ZjfWzEeKjRqfjndTDtMf5PaT6La6TgJzta6tWnafgcQFnc9+wvfZtk7MfCJvEhz42oinqObPNWX5pkIOnJPliScpUFgxGrmiLn3lK0sQhwX4JqiTG4SkrqobQ45KECtUIdge9b1e2h4cfDSI5CKe9mSajZJAgC4F0cR1IzX+saRoUO69tTZABH6mRQV1emvM75Q4fsW3e/PzwhDh96sbleurY1w+ONP8DCoKacd4iur6/ajnA542hCYo7iuBJfpA8tc+QKdLf1O1qbWvIbE5nV0KW9g2bGBqhq3bFe++urPvEb6pTLNZ7VQ6p3xJpf+L51/6UBCPjGbMplMcVSWuTdN5H8bnmUdz70iKdjWM8TON1k2vXkxmVeTQ1Qr0sfao7Xl+omVgcsyNJnA9qlVXpGrqrSIGp7LUYT7JDj1eiOgM3UXfSnOHHV0CkbRjOWhdHusT8RNpF/5eLVczQJYoSvGYYYzVPfu0wWP0nvSB8m9Jvilpag2wvud8T7AOtjX1oo522Xe6zdN9LdoDpt440ffN+WvN5rPygsbgrbC2P5N/Qq9BpoP838d4IMmwQJmP37G5J1ReMDci2Pop9suNfB4C2a6ItyZ4HnvXBjtkYPpK8i1+936I5FS0AjTPDhy3PCQgfrr1PGC0Moe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(66476007)(38100700002)(186003)(2616005)(66574015)(4326008)(8936002)(66946007)(316002)(36756003)(83380400001)(7406005)(8676002)(110136005)(7416002)(31686004)(2906002)(66556008)(5660300002)(6512007)(6666004)(921005)(31696002)(86362001)(6506007)(41300700001)(478600001)(26005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3ZlczRPaGNOd3hRV2pOdVNnUnVoak1pV0FJWnpIanFSNThFWENtbWVmemxi?=
 =?utf-8?B?Tk9tWkErK2ZuckVMZGp5NDVVZUpZcmxjVHJPSjF4QnhIWTBjT0NLYVIyS0or?=
 =?utf-8?B?TEtLVWtxTDJjbDFUdFpsaHo1MUdiR1RzY05TR1NmNENJTGhVOHlFb0NaaVJZ?=
 =?utf-8?B?YjNCK0ZnRjNya3ZvS0xkSGc4a1FHZTRZOERDVHlqZ3BYdDgrZ1pHMXVYckc3?=
 =?utf-8?B?NmFITlVTcnR4bHRucDZVbVFxbFlEcytRTDRKWHpjZjVvY280a2dDS0VqbmdR?=
 =?utf-8?B?OEhLSXc4OUYwWmUyanhRbVNqY0RPbU9ueUZDSEw0WVVGeHJiMWVoU05QTzNF?=
 =?utf-8?B?eHZqSFBLU2RyaTJ4T09wT2FUdzlLRkpXbnBFYWZiYmk0ZFRqR3VLMjg5ZFkv?=
 =?utf-8?B?alF6MHBuamp4a3htaG8xZUlmQ1lVTXhIcHB1STJXUWhoaXZ3bHBVNnFacTdt?=
 =?utf-8?B?a0o0S2pYRVpqRUxtTExXU0Izbktya2xoZWdRaS9TZzdTNjhrTi8ram1lWEda?=
 =?utf-8?B?TE5qM1R3M3pkcmxuMWlVZkpaU1p4L290Rk1lMDIyYURzUFNoZ0RRQm81aXd0?=
 =?utf-8?B?WU5UV1lNNVNsYWRJQTd3MkVWSUxobE1RNnhYTHEwTExERzdUUndGQzlZRlJ6?=
 =?utf-8?B?YVFPT0NlZ3VpT0RldFVFMjRISks0SFhqK2tSZ0dRYU9pMG5OMURxVHg2cm82?=
 =?utf-8?B?WS84ZSt3cGpYYVA4ZGVNMVRoZXlYdnBTOEhvcEV0blVoQUF5dTZHalVIZlU4?=
 =?utf-8?B?NVNWcEVpL0FWUlhSMExiU2xCRjlIZ2QrZUtOYmFIYnY0ZTE4L08yNjN6cnd6?=
 =?utf-8?B?T0dLU0luMUg5NTd1NEF6WUlWQkFYNEs0dFpVR0xCVTAzTzNCZjFNYzBWeUVU?=
 =?utf-8?B?U0MwcnQrRzEwMVovNFdiSEtHNmJSUE82bWt3bmxLa2ErY2hVLzFGMjV6T1lh?=
 =?utf-8?B?cytLT3FjWU8zU2VHRE1qZ2NYdDJXaXhtOHhYN1VyRnVaZ01oNU1NS0t3MmJO?=
 =?utf-8?B?MW5tTzNnV05YK3dtd1V0NDdSUmdPVUsyaHBYSzNLSkljMUprcWZRcWhxTnZ1?=
 =?utf-8?B?TU9Ranh6TU1uR3dFR2wyVk8yTkVoTTZsQnBxTUtGV09GV25PbVdORi95cEww?=
 =?utf-8?B?cklNYUZWYVluY2ZROUNYSXNEd2g4c3ZSblFIMktXUW5NZzFpL2NxbzJPQmhO?=
 =?utf-8?B?NzltRHRGc1ZsRi9QU05IMWVsWld2cEphUUZabXFSY1F0MzUvSGx4UnlXc3Zt?=
 =?utf-8?B?RUNnU3JpVHcvd3FVNXRCVzBTVVovRUZOVFA3MUIyalp6d1pGRTlTdSt3Qkp5?=
 =?utf-8?B?MThuV2ZHSlJad2tzdVV4VDBZSTdmM0FLY3duVklRaEZHR0kzZXB1NjA4OTB6?=
 =?utf-8?B?L0xSWHFqVDNlVXd6K0p1N3owUXFOejVpZmUwb1RjTmswanpjazF0MHNpc3hJ?=
 =?utf-8?B?OXhwNCtvYzJ3RXlJcTNHZUdJZmVwNHhPblFibnBHekowem5rOGVtVmZ3Uld4?=
 =?utf-8?B?MmpSWFFxa0xQUkxkZTBJSGM1c0FpTjZYcnJaSXVtRUlkUG0wS1VucFJETGdE?=
 =?utf-8?B?UlVQangxQytoYlZpWVJsandpendCRW1ZY0pIdG1kTGM4ZzdjL1g1Ris1N0pj?=
 =?utf-8?B?cWUvQk01MXJQOVRKNWdqcHFYdHRlL3ZsbTZYQllINFJTU2JXakNyVHBpeDQr?=
 =?utf-8?B?bEpQSGNMNUJmRUNCaU9tdk5KYkp1UUJodFI1TURGN3Vqc2tMTTVOK1lqYysv?=
 =?utf-8?B?Rll3dEpJTDJscWtNYk9rZmp6aDM2NDFrM1k1N256K0liQ3VNZjFvN1VrTzF3?=
 =?utf-8?B?akY2d2doUVZKQU1mNVZmRmdzTEdESGQyN3F5QXlGVWlVMlpyUmFQUFc0SjJv?=
 =?utf-8?B?bTNKM1BCZWNMYzBnR2JQdVBpaWV3a2tNQXVPdGRRdzJ2MTY5Y3A4ZEVIOTRh?=
 =?utf-8?B?ZUkweHlwV1pPeDVNWk10Z0RTeEVsLzhuekt6MlZNSHF1UGV3bGEwSWRIYTRN?=
 =?utf-8?B?eTJJa1VTU21CaTBSQ2FFU2JvU3F3NW84YXYyNmMzMFdmTkZPdWY5aEdKVWZT?=
 =?utf-8?B?NkptSmxCTktvenVFMUN6RkdoRU1zRTJPUGg0c1JQMTQwdGUxM2M1ZkxocHZY?=
 =?utf-8?Q?H1eB4HsNweQWCW0HB70BzFWI8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd114ec9-afa8-42d0-86bf-08da8bee0e0c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:46:18.5369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLxtFJx0qx+lCPScLqVYvHbiuZEbwwFcWElc/PZZ8hTRYZ0m2hwf5oPEikT89ypv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461
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
> All drivers that use dma-bufs have been moved to the updated locking
> specification and now dma-buf reservation is guaranteed to be locked
> by importers during the mapping operations. There is no need to take
> the internal dma-buf lock anymore. Remove locking from the videobuf2
> memory allocators.
>
> Acked-by: Tomasz Figa <tfiga@chromium.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/media/common/videobuf2/videobuf2-dma-contig.c | 11 +----------
>   drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 11 +----------
>   drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 11 +----------
>   3 files changed, 3 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 79f4d8301fbb..555bd40fa472 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -382,18 +382,12 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>   {
>   	struct vb2_dc_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>   	struct sg_table *sgt;
>   
> -	mutex_lock(lock);
> -
>   	sgt = &attach->sgt;
>   	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>   		return sgt;
> -	}
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> @@ -409,14 +403,11 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>   	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
>   			    DMA_ATTR_SKIP_CPU_SYNC)) {
>   		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
>   	}
>   
>   	attach->dma_dir = dma_dir;
>   
> -	mutex_unlock(lock);
> -
>   	return sgt;
>   }
>   
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 36ecdea8d707..36981a5b5c53 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -424,18 +424,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>   	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>   {
>   	struct vb2_dma_sg_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>   	struct sg_table *sgt;
>   
> -	mutex_lock(lock);
> -
>   	sgt = &attach->sgt;
>   	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>   		return sgt;
> -	}
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> @@ -446,14 +440,11 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
>   	/* mapping to the client with new direction */
>   	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>   		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
>   	}
>   
>   	attach->dma_dir = dma_dir;
>   
> -	mutex_unlock(lock);
> -
>   	return sgt;
>   }
>   
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 7831bf545874..41db707e43a4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -267,18 +267,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>   	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
>   {
>   	struct vb2_vmalloc_attachment *attach = db_attach->priv;
> -	/* stealing dmabuf mutex to serialize map/unmap operations */
> -	struct mutex *lock = &db_attach->dmabuf->lock;
>   	struct sg_table *sgt;
>   
> -	mutex_lock(lock);
> -
>   	sgt = &attach->sgt;
>   	/* return previously mapped sg table */
> -	if (attach->dma_dir == dma_dir) {
> -		mutex_unlock(lock);
> +	if (attach->dma_dir == dma_dir)
>   		return sgt;
> -	}
>   
>   	/* release any previous cache */
>   	if (attach->dma_dir != DMA_NONE) {
> @@ -289,14 +283,11 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
>   	/* mapping to the client with new direction */
>   	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
>   		pr_err("failed to map scatterlist\n");
> -		mutex_unlock(lock);
>   		return ERR_PTR(-EIO);
>   	}
>   
>   	attach->dma_dir = dma_dir;
>   
> -	mutex_unlock(lock);
> -
>   	return sgt;
>   }
>   

