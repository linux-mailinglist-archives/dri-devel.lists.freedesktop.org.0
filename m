Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC1D3A5F6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ED510E320;
	Mon, 19 Jan 2026 10:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="daeq5mSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D485D10E320;
 Mon, 19 Jan 2026 10:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYhPcNa55dJBjOAgb7ys8xkfEEoIm8TR2X9fZK0eg0CqDv8rh7u6nL+Hcf7tdx57zYzA/PNlu2VmB3XOdFIAI9lrLQk2/VkCGqEuirZb+xvOH4ISOas3prXkcVbxMWPvNwYv28vokCeSS0bq0XFIpC2Dj7hO6QSp1tzYAY2lHU5QopE8ZwbtVgjOYb7MyCzAKhRI7O5p5i1fU2xuM/E6jy98er/pqDaHRm3oFhXwoWJThdQeVBv3tcxD/JlBJEb1bKcgbzPRQwfxpWUpfvE25Q+mVSHbMtwvciSgktF8/jRdvHaZjYvUTBQfAo7B44Jn4D5OpcgOZ96gNgZwAU/L0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5J5B22JfMFKxjXVfYMZAjnMIyGnXaUzR9ufqMmg07Zs=;
 b=RS/kSCarI5Hc6DTf2fv0H48F1X9e9ezlG/+/7qPV4OFx5hhXNsLqzP9wqGv2w0+1mZ0skI/aKLb/Jht5fV9DzIcvwA3RGs3SgiPzpaCz1hC2wSGdcQ3dZI44hMyi1ehqlGunj+BCpCtLwgAl72ge9yBNnbh85+z8jR18yGh/YZ7ZRRn/A91KX/f0Xj4DmAmxTZ10vfSgsjLCiRUTlSmC7PI7NJR6uyc53TRjXYGre0hHBJaOpIxP0ih6qnVVg4l5l24g49lYNSYpEgYwoUXlYV7sZ/0o88vPihNPMu+TyiSO6q8y1CoowjxsAxaIaD0makp/A0M6xYVLvPICmy6G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J5B22JfMFKxjXVfYMZAjnMIyGnXaUzR9ufqMmg07Zs=;
 b=daeq5mSveIyDyZe+ZJUsYGARmKqTq5yp0iN3goE7qSz4PF8RBLja2oDOgsEAtAwJw8FmRlkcgnWyZOYJkAu+VzwXqCX6Vm+DPRv+hz2T7d3Uovj3ZgsctJmPYcPLpYuynrI8850t0LDVao29G+7+4+curfJTni57WNpjGdZiv0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 10:56:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 10:56:37 +0000
Message-ID: <9eba2527-a06e-4f74-a7d6-93f6f91e00e9@amd.com>
Date: Mon, 19 Jan 2026 11:56:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0394.namprd03.prod.outlook.com
 (2603:10b6:408:111::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 272541fe-1544-4749-5878-08de57496ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUY1aVJ3MWJ4ekZGK0FUMmNzbWJka2NXR01DS2YzRzJBRUtYVjhhb0VFNjdW?=
 =?utf-8?B?ckFObng2MktBT0tWOFpEMVBMMlg5Z0NPbGY2Q3dDdHNvTmwzVHVVY3dMV1BK?=
 =?utf-8?B?Sy9WcDR1Wi9tY0pFb21FZURSRzV0cGhNcE90cHd5djhWT0NnWkJ3VmNRalVy?=
 =?utf-8?B?NWpZdDl1cmcyRllVejBZcnA2ak54YlUyK004QVZyN2lqbDhZemRCY0FmbUkx?=
 =?utf-8?B?QzFDR1l4MjdRN05meUlRaTBmTTNqazVsTmxsU3F6WmxoR3U0QkdaZ1RKRnNG?=
 =?utf-8?B?enVoSmVJcGNuRElhN1BtdUFsUmhjV2I4a2hmTlJzVGVnZTRNcVorNHZLOGJp?=
 =?utf-8?B?ZzJEZ1RmS2o5anQ2SjBid2FWeElQekNPZWZwUWozTUZSbklxNndTV3RkTDBj?=
 =?utf-8?B?anB6T0VSYk03NnJ6bWd1b25yTVdhcVFBbmNBVFJMU1A0U2wzREZkamVwZk1t?=
 =?utf-8?B?ZkNWaTFDRE9mVzVuU2ZkSVpxbkhBb3RiZGYzUGNBMUkxeUxxZ2JiNDZjMEVh?=
 =?utf-8?B?VmV3TWsyeG5uOHJXVlYxeTg1d1VuN3p6bzcvUXBBd1IvZlJRREs4Ymhicmds?=
 =?utf-8?B?a3RMTHVLOFMrZ3haYXRYWWMzWVNQTFlFSHI2cWo1MHNFcFNDRVNBUFRpNTAv?=
 =?utf-8?B?UkZ2MmRvOS9Yd2NhVlRjOU8xamdSV3RwcWhuOGkrWXczZVo5L1hscHNidW5x?=
 =?utf-8?B?NXpOZ1JFakZZbEFQV1REUW9xbXZnemJjUlFoMUZhZE1zOHJZeWhyUkUzeEE0?=
 =?utf-8?B?RU93UDUwMjhzMytzREFldm1pS2Y2amxqMjJ2aFRpRm1pc2V4WTArQkdZbDBU?=
 =?utf-8?B?L3gvdmNRaVhVemFYZnhqalZQK1JyL2M0STRRTzQ3Ky8yYWw3eGZaZFZvRGh5?=
 =?utf-8?B?eDJMRnpCV3pCWTN5UFJwRWFYb2Ria213RHJZanlPRFpWQWkyUHVrV3BnOXlj?=
 =?utf-8?B?bkQ1TEFiVHlMR09hUXJmM0x2bzNPYkJMU1hrZlZ1TndPT3Z2NDduYUZxSzRp?=
 =?utf-8?B?V3J2WG5BWTNwdTV1eW55YlQxaVBCWjNFOXVZZWpGM2pkZUtEZkl3OHZQblp0?=
 =?utf-8?B?RkdmOEkzMmlwNXZMRVg3dkpTREVSYlV6SkdEdm43RWJzekEwS1cwNlFoWGNl?=
 =?utf-8?B?TSszdGh6eFdvWkppbW94LzBFNnpzcXRFcHRFU29BUElVMkloOGpCcW5lT1dm?=
 =?utf-8?B?em12cTRHOGNLeXFxSHdkeklLcC9UbFF5dFB1YUs2eU4rNlF2emp4TUlwZEZl?=
 =?utf-8?B?SitaaVA0bHcxdnU1Q3cyaVYyV3ZFVXh5K01pMVVWY3RhVERPdXpPM2ZDZHlB?=
 =?utf-8?B?VFZYMW5xaEJTMlpocTNlVjFnOUlLdVJDb1FVUXBmTkhIMW1UOE16NFgrd2J0?=
 =?utf-8?B?L3R0ZWYreUM2TUdMSS9Vdnl2bThqQ0JMK0dMS1BMZFZ4NlNaVVJjbHdhdkhG?=
 =?utf-8?B?OWtKRnEyejJicmt4ZmxLVzNaVnNOQVMvQTh2YnF2NjBYS2FYSFZHVHNUa3Fl?=
 =?utf-8?B?ZUFtMnpmSnpuYjVXSFV1N2JKZ3ZTemF4bWZDMG5yU1p2Z1IweTZSV29DbU9E?=
 =?utf-8?B?UkZyRkJIb21KM0FuaElzc2YxSG5BSkszMHkrb2VXQ1NBcjlVYjFuNEZnWnBC?=
 =?utf-8?B?c0VaVERHOTNUcG5IRVcwTytaUUFlWlcvUWZ4aG0zWGk5MC90MTRIa3NQL0o5?=
 =?utf-8?B?bTN5UitYNDZaZWFZY2lRSXhIcGRldGxVSEFjdHFYeFZRblIrVHp2UXJSQVNx?=
 =?utf-8?B?THpoaTZYSnZ5aUxnTE9vNjhNWXBaVS9QUytnSzZnVFZ4UUN0RFE2SGZzODZu?=
 =?utf-8?B?UzY0OVM5MUpocWVrK1cxK3Z5K0RIUDJScUJHeE4xM3h3Z1FJekNDY2tHUnhx?=
 =?utf-8?B?UW54bnQvdEhSaWdocnRESW1YZ2ZDcFlHaXQreWVxeEZwR3VFZ3R5bHVraGhD?=
 =?utf-8?B?NDNENlJKS1JoODFQelB0ZG1BdWVWMnlhSW9YSUYvT1hmWnVTTHN0U0RQKzhO?=
 =?utf-8?B?NkpWZHFGSzRZZ0hhMHZHcWpmbzBZdU51YlpScU9ka1RySmZaU1Z4NG12VG9u?=
 =?utf-8?B?em9MeUowci9HQlBIUkNTUlFOUXZXNnlGRGlIUlRKbXo1Sy9MM0VSQ2V1WXhp?=
 =?utf-8?B?MkZYenJpeWZtemxLRFgyUlZHZjgyNXAySjJGM2phMS90RVZqck1WeVJCMERn?=
 =?utf-8?B?Umc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTNKeXIyYjBqY25VcWFYL2cxQzhPd1pmTGd4SmU5K2RtbWVOdFlIQzVmb3N3?=
 =?utf-8?B?eEcxa2g1WHhDcVl6VGoyQU1wMzhCbVVVd0VHanBLa09tRU9ZOC9uM0w3Qkd5?=
 =?utf-8?B?a2lSZDZzdC9qMlFHbUZyaC9DVStFUnQxZnVGNnlWZWFjSldCaUdrZjY0TWxV?=
 =?utf-8?B?OXQ1OTZwOUc0UythVStXN3pZMU15c2hwcmRPZVp0Nm9NYkxhYmw4enpUa2th?=
 =?utf-8?B?ZERVeHA1UmlPaWJwUm1heVBnd0I4RldNWTF1NGJtRHRJbC90ekFRb2hFdWU0?=
 =?utf-8?B?NU9aWTlGem9uZ1pkQTRDK2ZTVjJPOUdpRGxsWEZTNkJDSW12cHRwODZLcmNL?=
 =?utf-8?B?a2pHQzBlNG9aSTU4bVhBYTdPSUF1S3NGQlVrR29SY0ZEVStRdDJ3MHl5VVBF?=
 =?utf-8?B?QUY2by9BMW5acjFQV0Q4UWZzbklCWU1Nam5XVUtMTjVoWkNyMzFCNGpYcmhn?=
 =?utf-8?B?MHIzZlpBQWg2SzhjZnRjaEp2dGRnUXRXZ2UwN0hFTGpUR3hLclBVdW9KOC9V?=
 =?utf-8?B?MDhZTTJwaHpDQSsvZnNFTUE4VjVYaVJJaUlSbWcvaXZFcXkzNDQrYUxPdGhx?=
 =?utf-8?B?NFAyMm8ycFE2d1dZc3IzYmlBaElhQXNaVFVkMjBlRFVhZTY4MzlyeXFhejBB?=
 =?utf-8?B?cVpmbDdmVU9CdlErQm9sV0loMytOSThYSGszWUh0RGdlTDZPZ213LzE4aFRh?=
 =?utf-8?B?MFRpRTh2RkM2Zkl1cnkwWW91WkZQbU4rUFhZMVpqYmF2T2l0cHhBR241akRX?=
 =?utf-8?B?eDdJUHpoQklTU0VPZlFaMHI2K3Q3NGNiV2NzQXc2eGtuMUZnNy82NTR6Tm1y?=
 =?utf-8?B?dEpvYWpQRnZSSkZ0Rmx3NUJSZ3VLVFBhd3BWRUttd2t1SkZpdklkUXVGa1FE?=
 =?utf-8?B?RFp2c0ZkR3ZjMnpIbkV1NVl0cjM3WmVJVkZxM2NpK2tzdm9iWXZ3aEhHa1BO?=
 =?utf-8?B?WWIyUHhLYlpTUFN3anIrVWQ5NCtoM0xjQ2dEalNWRURVc2FxTnFMOFZEOEVX?=
 =?utf-8?B?YlNMcThseE52SXloZ05RZ1kzUlZUQnJFWXRUVE5HSktxLzNsY3ZEa0lmbVNZ?=
 =?utf-8?B?c3BSZGpGRlMwL0NJdCttWlNjK1d6VStNZXNPTkthUkpXMmIyaTBta0E0eWhZ?=
 =?utf-8?B?TUdvcmFJTkI2ZEFNTElNeXNnVENRRDdYR0wwcDBVMHhlYlV4L0luQUVwd3Vw?=
 =?utf-8?B?Q2FDdTA3Z1U3SGFUZE5jTGlFb05wV3BEbkNzbGh3bHRwMHk2eS9Fa0RVVHpM?=
 =?utf-8?B?SHdEUUVHTjZmdiszZEJSK0FSS05aUVEzQTNON0ZpRVNjNUpBT05CUzR2Q1JE?=
 =?utf-8?B?ZjNtTTN6bzVaWWlCWDRVWDByVHdOSThaQnlnSSs2enRNNUNtVGk3dm5wMmcr?=
 =?utf-8?B?OWxod2Z6SDlvb0djMmhVNmd3bHB3ZTRDK25Jb3hWd2M5RXFYdGJGVmZieXpC?=
 =?utf-8?B?bEIrQSt0S0hQT2toQ1c0WGVCRGNuOGsra3BqcmNHcitTSFJLWVlxaHdzME5K?=
 =?utf-8?B?S01iK3pGdnp5TjA2Mk8rNmtXMlJ1OWlNUllqV2UzYlZiQlhEaHhhOGZ2M3Ro?=
 =?utf-8?B?aHlNSkt6bFM0LzVwQTByUG52L05lYnc1OVREeU41dFlieDdORnB3MzVwUVhD?=
 =?utf-8?B?ZXdmaGhXZjhKSEZwM1QvZTh5cEdmbzgxMkVwOEgzYTVKeEg5TnNodGtRQmhq?=
 =?utf-8?B?ZHRaSDFMay9HWkpsYkhtOW5KQzgyNXUvdlNmSklwUUl0ODF3Qm95REx3d1Uy?=
 =?utf-8?B?ZXhrTjdQTm5MYjg2TFFlMHRRQy9QeTJvcW5EUHB3N0ZWTlVGTCttQ3FrK2hw?=
 =?utf-8?B?c3pUUnhVL0xobW1NTU1mOGk3TDNJK3Y0OXBYWCtRNlBEcHF0SUVFZ01VYXUr?=
 =?utf-8?B?OHA5clptbnBjWDJGRlJhTEFHK1ZaSHdKcElGcXNMamphbHE1dDgzT2NtQktW?=
 =?utf-8?B?TCs2clhKVENDS2E3U1lGMlpvKzlBWkYzREMrUnR6MEszalNNNjdnUjZhRW96?=
 =?utf-8?B?RjUyck5JSlY3QmprTDhHbjhDa3o5UjdUR2VaRmNsWjNNWXc4ZGorbkFCSkZJ?=
 =?utf-8?B?MnRLYTNTZzUzQU9abHg4bzIyRm53MUZTVXdQRFhVZlpkQXk3cGFJdVFmcU9E?=
 =?utf-8?B?cjd4K1pqem1sK1FZQmE4Yk93andDUVBKekhFYzFhMldmbkpVZW9WbnJoNEZL?=
 =?utf-8?B?UkkySVFSRDhLUVIwLzUyQjg2WkNib25mR0FHdkp5emNLQ0ZDaXdWYXpjYVNQ?=
 =?utf-8?B?K0RaZWFhVmNtU21hRjB0T2Y0Vi94YlRydmpWaU1qdUxKS0VNU0NlK1NVSUNB?=
 =?utf-8?Q?HnpKRGA4egU6rU4unB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272541fe-1544-4749-5878-08de57496ac1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 10:56:37.2044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71Ob/ahZDo+new+8LaAlaElOj4PDkQ58m0R0bMuoumfp4pVgiGDEV65MbL0LZ2lQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
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

On 1/18/26 13:08, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Document a DMA-buf revoke mechanism that allows an exporter to explicitly
> invalidate ("kill") a shared buffer after it has been handed out to
> importers. Once revoked, all further CPU and device access is blocked, and
> importers consistently observe failure.
> 
> This requires both importers and exporters to honor the revoke contract.
> 
> For importers, this means implementing .invalidate_mappings() and calling
> dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s support
> for revocation.
> 
> For exporters, this means implementing the .pin() callback, which checks
> the DMA‑buf attachment for a valid revoke implementation.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-buf.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 1b397635c793..e0bc0b7119f5 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -579,6 +579,25 @@ static inline bool dma_buf_is_dynamic(struct dma_buf *dmabuf)
>  	return !!dmabuf->ops->pin;
>  }
>  
> +/**
> + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
> + * revoke semantics.
> + * @attach: the DMA-buf attachment to check
> + *

> + * Returns true if DMA-buf importer honors revoke semantics, which is
> + * negotiated with the exporter, by making sure that importer implements
> + * .invalidate_mappings() callback and calls to dma_buf_pin() after
> + * DMA-buf attach.

That wording is to unclear. Something like:

Returns true if the DMA-buf importer can handle invalidating it's mappings at any time, even after pinning a buffer.

> + */
> +static inline bool
> +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)

That's clearly not a good name. But that is already discussed in another thread.

> +{
> +	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) &&

Oh, we should have renamed that as well. Or maybe it is time to completely remove that config option.

> +	       dma_buf_is_dynamic(attach->dmabuf) &&

This is checking exporter and not importer capabilities, please drop.

> +	       (attach->importer_ops &&
> +		attach->importer_ops->invalidate_mappings);

So when invalidate_mappings is implemented we need to be able to call it at any time. Yeah that sounds like a valid approach to me.

But we need to remove the RDNA callback with the warning then to properly signal that. And also please document that in the callback kerneldoc.

Regards,
Christian.

> +}
> +
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev);
>  struct dma_buf_attachment *
> 

