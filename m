Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D63F44D0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 08:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE37A89864;
	Mon, 23 Aug 2021 06:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B506D89864;
 Mon, 23 Aug 2021 06:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+qCARzd7+ziomVwZL8uRJ5C7FUgpO7nlkWQHZQ4jDn9zv5J4Qz89/d8rAX9o/tmuRj8Tti8O++Is7jkLyFyWTC8TpumtyHB0tU5mQVZktJFe0nH2yn+ik3RkF3fJ3OZfDS0U36G9FBjvA5Zojfcx4ehS/gCKyXS+BuYts2YQUhHWoBjUcFq79YbKDbQgfbybiZd1MtFqlemO6srfiKRbgX+Y1GbFzCX8IM2UmlOfLCicx7/qgXT3bjhHP5mXdIhtgfJQoFM7K1tvFQfZ8XLF0iAqqRa7zqcDnlo8obsG5F37mAm4DDZVTxpKIgpIAUTS42r5LrIpppd9uhe8zcj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqusKTX2DGkspUIAvdYoBHVQZcz4nkjA2Drl/rtNNqU=;
 b=LIUQUogslyRolzDSgq9zKPu2HKD7IYNiL85QTnyVxRtFGbZwN0JLPpMMLwb0sLXfmP30H1T9/bHEJoxGM3zlU7VuTQwqkfM/nZYW+OqIJT8D/p1TSaDDATSdUK1mtq+Cr/BUy1iMpaLiTzU5Uy2D3Xh7O6Eu9wBkkT12CJvFBCIryLva2STFwl42DffOUChBoA04xi+zSSihnAyLRGv0r6mn35yAlTpBD1FGNYfHW2/YkUmb49spQTx6Cgzvoaa8vC3qzOuaVg3Tolc65O4RhHPb8sHl4Krd8UE/WmcF0bQzyG0tqFuue29ycYWj7pU96ENDcUOcvqloJaHnYLp3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqusKTX2DGkspUIAvdYoBHVQZcz4nkjA2Drl/rtNNqU=;
 b=0r2kSow91rKR88aI9npv3iIqDvnkBjU4rRYXatngH6dBWAgMbxfRgN8eMskHcSITGImOZKkw1Z6M9KrzqZy1WYhPlQXROOJ4rAdO5UlLSBBedGhoZrJVurEGrnmxr4gYJO1UEA5o40Eoaj/v8coUvcs9BX3ZcXg4bhxMBYIOYPg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 06:16:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 06:16:31 +0000
Subject: Re: [PATCH] drm/amdgpu: switch from 'pci_' to 'dma_' API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <d959876c2c61827a0607f5de29fdec10c47dcd86.1629667175.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4421bb63-3e77-0646-a647-c387a5df060c@amd.com>
Date: Mon, 23 Aug 2021 08:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d959876c2c61827a0607f5de29fdec10c47dcd86.1629667175.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0035.eurprd02.prod.outlook.com (2603:10a6:208:3e::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 06:16:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6925ff55-d919-4f85-0220-08d965fd8c7f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4224F92841714D437F0FEA3D83C49@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfL90Q0Fwb9v6Lu2jb+nJkFHx4UjVjoZt6LYnyx8taEvSfBM2qzsxhew+UTwSF0zsia6rMNOPmM42OACDgtC7xF+lM32ME9ybhmeAaWcXVc/0cec8J8fUOmS/1PfXB9cNiQUIgkNIl1I52RGxQQ6gHvzejujVvAdCI0IELrHu3MfrCksJKbpUmUVoTSLJUAieNtuGcMXEs9TCd5qgrlHrYQkoEa6QAHhNQj89r1rFPWtAM2pMwMIm+ZAFsVKHg4WWhGU7XrAu7QO2bL9n8BlkJ9Rr5c+kQTxHFBsNpvjhuDmNBoxuiDX32Xz6cmZWLxtkGO5bh86Mvio0e0G+8qoW7bPSdJlW5raQK7lBtOa2DpmUseMFHa1J6f1JsX07MFYoIp0yOa8HW1FLXXbJEqf2rI/x3RAaQnwLrDQ8f+JwJJ+PE7eAb/mTVaPY4ju28SlMGP3N2Ad/XiwWGK7FdhPMmLzbMOf3xYa8TgG1oK/DysxA/FNUSeDJIgYUD40aDXoaoUCf6YCeKs7XOdVsBNSqNblZNz6LvbPTacSl0y6coO7JYfestN6YL6M1BFAmcIpXexVi21VoDuiIweY6tqbyOnT+LTVruvIysDSm9Hdy+YFfWZJsX8UV6ogadSzQgf1nIgvm6MMWC9N4rKZCGXmJkBe5See00CzoRyniycXancL/ArFdJMW0hSbgAO3s57UGnCskIdhKROpjjN82m21TUWlcH1CDbQsmPCAybfgu+AuN+UZFfiZkH9fu6pWrOdfiqQkf5nMW7IKhjnB3B0hkZx3krU6nHJekA53j3s3szbcKSSDvopbDHqU8zIPnPR3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(16576012)(66556008)(316002)(38100700002)(2906002)(66476007)(2616005)(4326008)(36756003)(8676002)(966005)(86362001)(6666004)(31686004)(5660300002)(8936002)(186003)(26005)(66946007)(31696002)(478600001)(956004)(6486002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTJ4ZXFYMWg5RnNvVG9mbS9YYksrbFRBR2cxT3Z6c09JaWZLajBEYzJHMFdE?=
 =?utf-8?B?dEJ1R1EvMG5WSlQ3cENrUVlqUnRYYWhQMzlmaXd6Z2xIWUg2VUx2d1J3cFJj?=
 =?utf-8?B?cnRRdm1lTE1jYjF5NjN6aytaR0dQaUlzK09iZTVZeEZ6c2duY09hclJjMXNy?=
 =?utf-8?B?T09wT2ZpWFpEejIzdzZTelFPS3ovTW5vYk1DdnIzVE9Fd0ZvVE9Pc0VNRUJS?=
 =?utf-8?B?SmZHRm44d0JYbWtOTDZRNENHRHpxRmVkNkdxVSs0bTZWZmg3Y1AyclBBWlRs?=
 =?utf-8?B?anBxS05RYTFtT1QxR1ZxSEtVSlpmR0sycmp1bTVHajd1NW5UL3Z5MVQ0RUdJ?=
 =?utf-8?B?a1lHQkZoWDVQQVFHNm9PRHZ2SXBMZWdGWm9Od1M4dFh5THBKSWQ1ZHE1VDNX?=
 =?utf-8?B?ei9PdkVPZVBldmJkZnRsL0xIV3kwdnYrVTBVZUJWbzk4UmR3SFNEY1JJbjhi?=
 =?utf-8?B?Q0hyamEvUkd2S3BDcFp0ZnR2bjVhRzFOWk9IbEZYK09HOVBMUW41VytQRE1M?=
 =?utf-8?B?RFFSYjJ5VXdSWDFQdS93bFJQV3ZGNkUvQ1VjQlVRTkxHaG4rcEJhTUZZTWhz?=
 =?utf-8?B?dXJiSzNUaEp1Q1loamFiV0dlSHNkZGRTRkgyMlZhYk9laURwditEQWhySVg3?=
 =?utf-8?B?bGhmRTZNQXpTN0F4RXJWK3FGR2RmMVA1bXdzNmZjUkszQ3JKUDBFRmdIVUNm?=
 =?utf-8?B?MlhFUStXNXVQU0ZMNUNzMXIyUTdyVG5SZDk1WkFvcnpZcGl3TURYcHptSFoy?=
 =?utf-8?B?MXpmR1h6SW1hSnR1OGo2TWszMjE3akR1SjVBYXpYOUhxeDcwdnE2N0w2RHg2?=
 =?utf-8?B?TXVsR2pLbVhOT3QvRlMrcmxtcGxWaW1aZGQrb2l1K0NNVzFGemx0V3kyTHU4?=
 =?utf-8?B?eHdqR3ZVSERXVG0ySkRnWEgwS2FIcEFoSmhDZk5ibTBQZ0s4Vjc0ODVnRlFM?=
 =?utf-8?B?QmZ0TEtsaVY3R0hPREN0MVVwRFJ2NDdmMkc3djlROTMwWTd6dktpU296YXNh?=
 =?utf-8?B?eVcwWWVlcTdoSVlzNllzR3R6cER6RzZtSXBlL1BjM1hBYjZ3OS9jR3RTTnVR?=
 =?utf-8?B?cnl6b1BFWXIxL3p0S2QxdzRHN3FJL2U4KytIdU9EbTN2LzRlWjEvUm0rTlVq?=
 =?utf-8?B?V25QQ3ZlKzR2TFNLN1ExYjE5ZTA4Zzhxd3RwZnRuMzdLRThBMUhqRE0wN1J3?=
 =?utf-8?B?T2VhOHVnUUg5NW4zWmFzRkhjMzdlakRhVUVvY1Z2K2lGRzk5YzdVSUEvQWww?=
 =?utf-8?B?clQ0Y2xQL054dmJxZG00L0xQWWlqajRpQTUvd2lwT1VDcU1LeTFpNmZ6TXE2?=
 =?utf-8?B?dXB5czM2Y2cxSk5HM0s3RjdKYWxQL0RSckJ4MzdBM3M2NEtXY29Ld0xyRzRy?=
 =?utf-8?B?ZE5DaTVqRnRKNkZ4V2F3cnVvcDZ5T2FjUkJsVzhTSWE5OEZEa25FbHg1Y21Z?=
 =?utf-8?B?QU0zaW1JKzNCRk9ScG5OMWNVcHE2VStaZ0NpNS91NDM2UDNrbkZWalNISmpL?=
 =?utf-8?B?b0pLUUt2K21ZdzBJRkIyN3h0VHU5d0FMQXhxVkxHblFjdVhxZ0FBWlJQbEFF?=
 =?utf-8?B?Y0xuQkJ3WU42dTAvekZoQi9LSGpaZnpFMElqZ05UdVdHUk1qNStNOTlRWDhV?=
 =?utf-8?B?THFpeXpLMVd2aXBkcFhpSFlzRitBTXdjNmdrbVdPeUZOc282NUxwTTgzR01p?=
 =?utf-8?B?R1NoVWl0TkV6emEyV2JmQld2M2hUMlZxWU5hc3J4WmFObkpLTjNRdmc1dUFX?=
 =?utf-8?Q?hUMx68O+kTQEiN8UoDEjbmqiyykSUHEuip1baxH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6925ff55-d919-4f85-0220-08d965fd8c7f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 06:16:30.9709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcpIYoH9pBSiPSH8aL2RIRyleMMgc15r7ANjN/ZHn3NwgxRCYXz3sfmS+EbPfeAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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

Am 22.08.21 um 23:21 schrieb Christophe JAILLET:
> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script below.
>
> It has been compile tested.
>
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
>
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
>
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
>
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
>
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
>
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
>
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
>
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>     https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index b36405170ff3..76efd5f8950f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -76,7 +76,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>   	if (adev->dummy_page_addr)
>   		return 0;
>   	adev->dummy_page_addr = dma_map_page(&adev->pdev->dev, dummy_page, 0,
> -					     PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> +					     PAGE_SIZE, DMA_BIDIRECTIONAL);
>   	if (dma_mapping_error(&adev->pdev->dev, adev->dummy_page_addr)) {
>   		dev_err(&adev->pdev->dev, "Failed to DMA MAP the dummy page\n");
>   		adev->dummy_page_addr = 0;
> @@ -96,8 +96,8 @@ void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>   {
>   	if (!adev->dummy_page_addr)
>   		return;
> -	pci_unmap_page(adev->pdev, adev->dummy_page_addr,
> -		       PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> +	dma_unmap_page(&adev->pdev->dev, adev->dummy_page_addr, PAGE_SIZE,
> +		       DMA_BIDIRECTIONAL);
>   	adev->dummy_page_addr = 0;
>   }
>   

