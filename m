Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743F3F44D8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 08:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0612989875;
	Mon, 23 Aug 2021 06:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10E489873;
 Mon, 23 Aug 2021 06:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHgWkN9MXLcAURBDkYFb/I4I1XthGmS9aG09kMAXE23XpJxSu2nBGcMvEHXxcTL1sgjMzFk4mFTtSiPafgDhfsxSBjlULCHd+6VbwW/b1COZri3tWeAAEIkiAqSv8gao26cOLKMhYayxyDHtlWso3FNZEUgTMd1MazSPvhH1zX3Jjo9WjcluDTC7gQCNWMiRsVzi/oJTPkiOwXH8Sw+MTvP2kGdqMwe2vWjaEsoDaQchpG7MZ6RRgEtxhQ5RaUrbzJnsISEWIG0EwPdYQY6R7idCFULAujHjfo6YoZy2PSL/l9M1fSOOLNd/1oI8VXVPAUwXQY1FtfQJXq2w4EXWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VQgYHl390qqAgGIT96LLWcaCg53KiWGlF3AQgInWG4=;
 b=ihRk5TPSf4Z+Goxb/mzScqJat59BwjWerQeqbt0tB2oApdBE5x/I8o4S+pNJxiXGPma+HRHo5tQxMbB9R3AQrD6BaKT9ZjOqIslNoOJSabdrgAs4dVT3dbUwc8YOqrv4eX0ESbPivy1W73UtUuR5fTAZ4p2lruNRFaoMGTD6eZUO7d0PSnTFIrLbNigCoLvvM38rYNfrt1GTQLAOSqtTuHn72KOoWDhtjNVr5w1obLTMBTSvmi+X8UhhmIZbWLsViDpubIyo+XOR8AaAUxzeZwVJe/QMstKpf7XnRm5m9E5nsQNO07ffrKbuuw0pqan9pzV583V1IzFUBFD7wjasgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VQgYHl390qqAgGIT96LLWcaCg53KiWGlF3AQgInWG4=;
 b=KZWXuREZs0y8NLEqTX38ktnG0udAZOsTT/tvq0fd36i8T4eC4hPJ2cyuoH+3elNwMkG4fUsWifnKGzB4R6J68QFsaneZv5vah94UeUGKG9oUUmsM+qfckwttjwA3zifl+2mUnPojvzg5rpVKW2J65ZoDuktcLOIIK6x269A9oEg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 06:17:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 06:17:34 +0000
Subject: Re: [PATCH] drm/radeon: switch from 'pci_' to 'dma_' API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1187ca1dbaa74ca4a87db9496061243e9a810faa.1629667363.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cd7b5eb2-24c1-d54d-d6dd-c529d3eb140f@amd.com>
Date: Mon, 23 Aug 2021 08:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1187ca1dbaa74ca4a87db9496061243e9a810faa.1629667363.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0028.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::41) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:208:3e::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 06:17:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d230a880-5c0e-43d1-33d6-08d965fdb214
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422410FC73AF814B73A20D1C83C49@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dazxLpm2WRpGZcvLOkrF5mvYzSVDl+mV7B1IJFNN1yVkjF5dWdThN0i94qpNtxnD0oegX60dt96vdc5A/h6Lpl9Zov4HZ14V+i7eEsOhut6Kyr/rFcIJqyVEAaIDf0qqLPkxDQuA/AJzKr568iMuaAMZV1n3AIsIKuOQ/73ENUWAhgApGJXialHlvIIGU4kPlCadI1s3XhWWglU6AIc64yNiWrpEJ8GkXhIPhLTSQz/DM7/fnwpOsPRAEKGumkxe4wM7fepeul0dRRS2cISES4qrB7AV0EcxGLWhZNUgVdojUfk1pHVehAj13RK5vCEZK5QcoDhoGlrDSTzNKutygKaz+Po/mF7+xpIl3J3TSDRnFLsTAMkO+4ieQRPmaK/mN5FJ/S5fOWSROSZoyA6VVGVS8hDEFn1Ei4Sf8cDlP4VCcBXp63I1Gf23Rh4sI9nD6lSMeI3SejLFCcYiS1BGzjeMpEcjCkS5P+VTnBV8eHSLBQ05N06KRB16TsUASFxVORqbGIo9oo4OwpwxlrGfDDb+3ZXjknckTEB0PFWkTLcDc7ETsvokvjEvB8DbHbxPep1y8c4z4TCHXQmfkj08Mn/2tvS/6eF5BTPyaO8HgfYU1wynklcNrlWZuE+TaqWbPPBVN1K7rji0d6RPDJVqJMIRdM0qNd/o1IjgHvHo5SpyJfq/UV0seNQh/vC48p/j6oj6jXd9D64Dug3fgliMPL7o9yabYwaE+LJIZlWJNPKAXdm8qlS4/gfXS0dF1dnsDp2biOvriKB0RYFmNQYHcImMF92C4uIcMx9JcKg0ALiUFALMpUN+zxZ+wnmalA7B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(16576012)(66556008)(316002)(38100700002)(2906002)(66476007)(2616005)(4326008)(36756003)(8676002)(966005)(86362001)(6666004)(31686004)(5660300002)(8936002)(186003)(26005)(66946007)(31696002)(478600001)(956004)(6486002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE02cHR3Sm9lMkZDaTFheW1WYWZYcjBrN1M2MmtDRGZPOGE0ZWxOLzFtaXVL?=
 =?utf-8?B?MDhmTmNyUmVtNWdQMzFBN01ITGMwMXYvaUhvSkptODJabkcwdW9oczBMaE0y?=
 =?utf-8?B?eERUVWhMQ0kwdkpUWG5LTjVpa1VwVTk4UDhkLzg5YVljN09oekM2OHJoQTBZ?=
 =?utf-8?B?cWZSaTE0SUc3bmtROEVJQWwyZHFTMzhjSEhxZ1YycW9kK3U1Z3dqSS9XbDlx?=
 =?utf-8?B?Z0VEL0I0bEFXcWtsYmVvRGdXZUcybkNJRm5LTkY3RUZYT2RSRFBtZmFnc21L?=
 =?utf-8?B?WnhTNEF3b0JpdGF6aG1tVU1ZTVdEU3I4TzZwOHlPUTF5OUhlTUN3T0VxbUhl?=
 =?utf-8?B?ZlIwQTNkUnh6UGh1ejAxeExlV3RKOFAwWlAwWVR5SERkQmZVaVM2cXN0UlNv?=
 =?utf-8?B?RGhhbnFxQU55eHg4V21vMFpiSGUvVm4rSnFlYWpuWW9uRDhKQ1RZNFdxL0dQ?=
 =?utf-8?B?S0d3MjY0aE93SU9wdk9SV0dubjAyTXQ5ekI1eDFEOVBqdTkzK09oSENXUnJL?=
 =?utf-8?B?WWFRb3BESFhMVVZvSFFMWVUzM2ZHNjV4S3JUTHFIbWZMZXdtVlNZWnEzakJj?=
 =?utf-8?B?VW1JbGVwOGxkMm42RzVKK2RlVEFIcHg4ZVdZSHNOZXdRZ1FOWUtTQ0xDcjZh?=
 =?utf-8?B?aU0vcWdXSy9CKzNMNXRhNXBBSmxBcjZobHdUY1QxOFh3bGgrM3RVaHMzQ1J6?=
 =?utf-8?B?SWpBSVVjNkZGdmFuMDV0SUJYeFNVL3Rhd0RkY2lsOFhaWWpTQU9uS1UzSWRB?=
 =?utf-8?B?N3pUWFhwbjZhNitqdzVjOUNEUXA4SzNBUmJua3laRVRkQnAzY3BUYk15djR0?=
 =?utf-8?B?NHRxODhSWkVpT2NTQTJqQkZqYTJmUndKMENZaFpaS1h0MDdjWkdQSDlTUlVJ?=
 =?utf-8?B?aTZrNlFPbk40QzdjcjN0L1NIWEJ6UTVabXczOGZDb2FBU0RDcUxyaFo1NG5r?=
 =?utf-8?B?U3ZLU3ZJUHd5Z01Fc0E1SHNuSGNxblJIUW82MDJIZ3Q3OHV0VnNVYVVhWDkx?=
 =?utf-8?B?R215YjgrME8rUWtTTTQwSHFOTUQ5SURFek0wRi9EUThIMFJ2RzFGRXh0REhT?=
 =?utf-8?B?c290NjdZN0M0dWVpcXJFZ1V3NHd6OUM3MlhaSGs1b202bkJtcWJiRUhoY0FE?=
 =?utf-8?B?SFRPRVhNcmd5eXIrcW9WaDdoR0J2c2c5d2E2OUV1RU5SWExxT0NkbitZTnZq?=
 =?utf-8?B?ekZYTGlzRXZ6STU4ak9ITDZRWEl5aVZCR3VJSjRLSE5uUzRUTkRXUFhldSt4?=
 =?utf-8?B?V1M5bmNtbVJxcVJ1YURCM1IwQjkvVHlESFhBUWRZUjVjZDAvdlJlUi8vVG01?=
 =?utf-8?B?RnhFRURvZkFoR1Q2aElFaFdqTU5NbE9qTmIyYU9EbjdDU1c0T1hSM1FySDJa?=
 =?utf-8?B?ZHFVTlRibHg2ZGNzVkRoR05jclcxU0pMNHpIYlgvRThMRjBjK202YllIVlVL?=
 =?utf-8?B?ZTdZN2dkQmtXcUNrQWJFWXYzT3g1Y0d1bll3V2p2eDNWVHpWRDFEUGczNGtX?=
 =?utf-8?B?eTc5SGFVVGkya2c3NUQwRWVIamZuS2NlcVJTa1VNSXZQR3RteXU0MzFmclU2?=
 =?utf-8?B?NERuclVUZVZRVk9wWFQ2cTQwTlVDRjRTVUFhWDVQWXhoVTRNa3ZQalp6dlB5?=
 =?utf-8?B?YU4wanY1SXNJcExoYVl4a000WTd5cXI0MHdpQVJxRG1UVlRXdUwrRkFjbTFH?=
 =?utf-8?B?Rk9jUW5FTnZYMTlUZi80TXZZb0xBZ1JjcjJ3SjBCOXJnNHhtaHY2UlA4b0U1?=
 =?utf-8?Q?DrfY85oduxkJpM8sSE0DDVusSOYM3fIyWLSUaJ9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d230a880-5c0e-43d1-33d6-08d965fdb214
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 06:17:34.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxNhoWrYWq0o32Yivb8k5so5+RCKPHFIJZl2oH2C+eLEdv+lX/tB9CJhkxNFYFpG
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

Am 22.08.21 um 23:23 schrieb Christophe JAILLET:
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

Should we pick them up or do you want to push them upstream?

Regards,
Christian.

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>     https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>   drivers/gpu/drm/radeon/radeon_device.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index ac8c3251b616..4f0fbf667431 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -785,7 +785,7 @@ int radeon_dummy_page_init(struct radeon_device *rdev)
>   	if (rdev->dummy_page.page == NULL)
>   		return -ENOMEM;
>   	rdev->dummy_page.addr = dma_map_page(&rdev->pdev->dev, rdev->dummy_page.page,
> -					0, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> +					0, PAGE_SIZE, DMA_BIDIRECTIONAL);
>   	if (dma_mapping_error(&rdev->pdev->dev, rdev->dummy_page.addr)) {
>   		dev_err(&rdev->pdev->dev, "Failed to DMA MAP the dummy page\n");
>   		__free_page(rdev->dummy_page.page);
> @@ -808,8 +808,8 @@ void radeon_dummy_page_fini(struct radeon_device *rdev)
>   {
>   	if (rdev->dummy_page.page == NULL)
>   		return;
> -	pci_unmap_page(rdev->pdev, rdev->dummy_page.addr,
> -			PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> +	dma_unmap_page(&rdev->pdev->dev, rdev->dummy_page.addr, PAGE_SIZE,
> +		       DMA_BIDIRECTIONAL);
>   	__free_page(rdev->dummy_page.page);
>   	rdev->dummy_page.page = NULL;
>   }

