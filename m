Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13354E6F22
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 08:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9348110EA5F;
	Fri, 25 Mar 2022 07:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55710EA5F;
 Fri, 25 Mar 2022 07:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9+Ub0BTa7yqz0F5a5caUoc1ktE1hkjwndMkvMCM+JSPw29OprmQIu9yJTOhZrOzxldv/J9joAfOMpjH1hmqm/PlIIvb5MFDWcbG4rEIzQirHCB48Kr+oXmlyuFsrqlRZLWFy+ZvsoA3zfGCDJJbf8ZrzddeQSic/OZjH2SgKXbBh2v6Zl+bhkrth0GQRL6XtIR6rm6+ElDmfgstZNV7Ocjh8cRXX+YqEDYKhPsJeDgEgQj57zwGPJaEwpFgep8b6PNb0Kjqici6lkhatcc5P+vaD1LWO5jPyxlkIM/x6tsPN2QwoNaErsNNnMjKok+Ob6PuXJUtIrY5CVlybXMUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLSMGydjOr5gHGnvrSQ87odKYNkssW8EiHuRFXQUYPI=;
 b=Rv4K5hd1cve0BFFD2lUVT1aoDXiHcYdJAsaAOMb9pokD22nVxQUT3QpsdoqNWfwGC8hLgZlwGG0gVcWVjYORpOCaCyITJJ6zlEEWdHHYycumbc4JJFUwKJ33KrPbTOre+7OAIwf8MgiGc3cpweKSThjaYfO1mfqvrBlEy1vguJlpHOf3MiHsGGYToHtY2Ff5jkAWCTlUAxx1QG8Zjj+r3OCQc9tVwubmblpFhAdVnwGfPjv/blyhgTwa88hU1TCvxYXEZsQmGKKmeP8Qplg6iVF2BsS3mYrQIamzQy3J31xlxAlAbnsA47XywHwJn8/9NPaW3lxlE7LUoelM0hskZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLSMGydjOr5gHGnvrSQ87odKYNkssW8EiHuRFXQUYPI=;
 b=jY/CFU6loAz+eNc+2dpYjKKsL3MQQ2tSyXz7fcCZR1q6kUjY8Kn12+d1ykYIdaeo65T+2nMsSL/vlIsanyE+07PNxcQwkoHQvvFydd/xfjSIN4FqEX8GwktUMwcnly09rSqawZt9xAUJGF98R94l52QkQUnA3lx/dsdWG6ulsHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 07:45:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 07:45:28 +0000
Message-ID: <982d233d-7e30-f44e-f49d-473c3c41721e@amd.com>
Date: Fri, 25 Mar 2022 08:45:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/qxl: fix qxl can't use in arm64
Content-Language: en-US
To: Cong Liu <liucong2@kylinos.cn>, airlied@linux.ie, airlied@redhat.com,
 kraxel@redhat.com, robin.murphy@arm.com
References: <12eba824-ee80-0aac-56ed-e13084c9cae7@amd.com>
 <20220324104928.2959545-1-liucong2@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220324104928.2959545-1-liucong2@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb4acae-cbbc-4dbe-49b2-08da0e336e05
X-MS-TrafficTypeDiagnostic: BL1PR12MB5272:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5272983E7777DF1962501054831A9@BL1PR12MB5272.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4zEB7ZMPrztq8B1oYzUA9ljTltG8Ke4u5NyqvQhwoa3FM1IWjA/BiV/HpUhz8liBCyHzJtauxu1aup+g8aDTvFn6XSsY7CoYFFC7iuuCqgGn4w8oPIrABvdrCQPrBw2kwzh0uYTSzMcE5INtzr4iVdMC6bMrjCZOhDqZusOnKW7RZmlL2z8NL7/3jRvvqW+VbCktSWASPV4DwibREZFwoxaE/JcLhSzhUXERx6zbifvzGmJdZIiKU6UMW6kSe/RtU45p2bgXa8cEHOW7+11boI4gRy+T7kpiUQ6jFxs75qHlRiEPXVPc3QYSNdMubWwFsoLTohExGEwe1E5fE9RLozG2+REBKBLniYGP3TFIv4v5ED9dppmtxYAZJJSGSInq8i08KRXdUykYBPrNOpAmxoy+5QJ3r3AFZgsx2Ce5ASkXEzaYvMR19H6rVIOGzAoLzqxRUQYhT5GtMuqx7cRyfWYRJ/Z9bnDiVQZr/2OK59c5ukX9jotjDULKmk7lFxxNHrpd02U2HtsKUmgZIBJkVg1TEq0JwR0sTlbSwhadRz1erG0ngLuuG8wFmgWCAeb219LFDOT8RE7lUb9+upcJkgKUjTHX1+5QFSn/nIEDybfnTY3naiWnq6Eyp0p7drLSe/3yudxbdDqyoJ5ZGB053UpfSs4FnsrYpCRtyAD9qorSL+3gRuD6KdMEg5WxTG+t3SqycpJoSzRsJn2fFgG44UMNm9jBLum4DphsP3/lYa7xgxEoaPh3/mbWCTrExLc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(26005)(6666004)(6512007)(38100700002)(31686004)(5660300002)(4326008)(8676002)(7416002)(36756003)(2616005)(8936002)(66946007)(6486002)(186003)(66556008)(66476007)(316002)(2906002)(66574015)(508600001)(31696002)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dhOUsvUWlZWmIyVmQyUDIrRzljZSswNmsxYmV5V3hBVUhvYXFWcG1nS05v?=
 =?utf-8?B?ejVSOGxDNUNuZ1JrVml0aUdMYldCUCsybWJDY0R0blFuYy81ODhFZGZSb0Za?=
 =?utf-8?B?RmgzeDB0cHNsclVuZmhyT3FyVnBnbndQODFCK0VFQktSalgxU2VxU2tWR2lR?=
 =?utf-8?B?SDkwTWppRldzQVBRc1JtZGNkSFBjSW9RUjZza0QvZlRMejM3cFhicEIxMVVp?=
 =?utf-8?B?bWNlVUovTXlFNDlYV0RoZGF6YkpwUWZ0azg3aks5N0g1Q2U5eXNRNnp6S3pC?=
 =?utf-8?B?TWludVdkaThOMDVMMjBxckxyNVJJOGV6Y3YvTW9lV0NSbThnckcwV0ZxQWk1?=
 =?utf-8?B?QWJZdWtGWnFvOTg1cVJDZzFIWTdYYmJoMWE0R0QxU3FBSStlejlCaVpYUGFu?=
 =?utf-8?B?RUJZY2pRUzB3ZjZWWWYzMlE5Um5PeG1sRmRudzdpNVU3bFRNR1pZT2ZQZVFm?=
 =?utf-8?B?djRPVFZWWkE2UGNScUYrQXlQbkZ5WlEzUGxXY2hXZnNhM1U0VFUra1dmVFVx?=
 =?utf-8?B?Y3dVUHIwRVRjcS9yVnNZcHp1RHRDMjVSTzdYazUwYWluc1BFWmdOMlJ5ZkpT?=
 =?utf-8?B?VW02OXZkc2s2L3BQVVZoYThFTmlsVDlMM0Yxc1RVVDlqeWlHQUdPY1dtM3VJ?=
 =?utf-8?B?d1NWVEVlRnBIbjZ5M2ZoYjVPRkozV25XaHJsVTB5RUlvNkoxeWY0QVd0ckpl?=
 =?utf-8?B?dStNZjFJS1BPajlHZHU5MVk4alJMOGtNcGE0Z0ZodTlxQlBWdEkweTA5NkZy?=
 =?utf-8?B?YkZhbDJicTNheFVuelNaZUJGTVFHaloxTkg1aHpmdFI5TjIrSjk0RTYvbjJX?=
 =?utf-8?B?VHJUWHcwTEdjRU50Qm1OYkErN1NrbDNaK1pPZmMzUWNDN2oxMWt5WFRFbTFu?=
 =?utf-8?B?b1V4UHdEU2M3UWVJRzBFY0lFYXBkcitVak1WbzlnQy9uK2VVazFsemtycGdK?=
 =?utf-8?B?WWVMMlVsclpPKzFiaW13L0E5MDRCNXBUR2FjMHFnL2pQUGZDME5PUWdjUHZK?=
 =?utf-8?B?RlF3WUp0R0RpSmRyQ0RveG5wVm5Ndm5SdnhzUnpHNW1LbnFmUEJNc01OWXJI?=
 =?utf-8?B?dS9FVm1CUHBTK2NsNzl1emZjL2dlR003N2d2Mlp4T25aeG5HSkNwdDNLc1BW?=
 =?utf-8?B?a1JSYXdsTHB1cEo0SFVxREMwemVsR3Z0cGZTamwrdW00aTJndXVGV1hOZjIx?=
 =?utf-8?B?OW9kY1dwVVZES2pUTCtZbVI5WmJCTEpwTC9wYzRyb3ViRU5yV252YzdjclR1?=
 =?utf-8?B?cVNtV3VJbW9kbDd5aHFISHRoYytnWFB6aGp4RERISmk1OHdiZ0N5UXgxU0FO?=
 =?utf-8?B?M3N4K0pQSDZETVQwaVluWU1XMU1KdGlWS3pPQVZZV2VKUHZjSXc5RHRVYXcz?=
 =?utf-8?B?a28zOThTNWVPdWJPRVRLZzNLUlA4TlRzZ3RRWk5zQzJobXZJOCt1dFRzWGFP?=
 =?utf-8?B?alZ0UTNOWU1rQllpZHFXNXRYOHYyejZ3bkRjZGJOT3Ird1ZWM1QwbCtlazQ4?=
 =?utf-8?B?blhUZVczdGs2NHE2NGFRWDAveG5NVWRCZlhTQVRjOGhjZG5pY0VNZkpWRS9B?=
 =?utf-8?B?aDk3WmZLNnlqSGo0OGY0K2dyNERjWXJNeDFKMDBDVlZYSHNGVzB0ZTNpSll4?=
 =?utf-8?B?b0lJTjJKVDJueUZUcGg0UFlzcWVrTFgzMVhIWkc4UVdDRnAvY0p3Vyt5TDFM?=
 =?utf-8?B?dE55WkE2VGwyVEJlQUV2QVZPbU5EUEQyeTgzbGhyQXR0Vi9LVklJbDNML3Iv?=
 =?utf-8?B?MExYemZzZ2w0aWxvNkhUSVRSU2pSenpVczZNK04rU0xuVUNwb29zMnF6MTEx?=
 =?utf-8?B?ZVhlT3QyKzY5OC9aajg3bithb2Q1ZTVYZFllVk1LQjBnRjU4c2xPd2psNnRE?=
 =?utf-8?B?cXh1RGpDd213R1F5OEhLVlhqMFRmQlZPTUgwZDJsU2tpaTVGdGt4Y3M3Umh5?=
 =?utf-8?B?NkVWempuUEU2cU9BSitYM0plUkErM21Jb1hkbjkwNjBrVU85Y29kampqL3Vy?=
 =?utf-8?B?Wm03cGIwUlpDbXp4c1hqZ09LS09SRTNpRGhqZTAzM3FPQjFMRWlGdUFNV0Zo?=
 =?utf-8?B?T1FCamVEY1h0bmNyODh0cjR4Rko0cFdPbCs1WU90TzNodk9pcDVnVlYyRjhU?=
 =?utf-8?B?Mk1Gc2dydDdZdnJ1NTNRSFBkR2xNKzM4KzFjSnVNQ3ljZHQyNm5WM3lRbTJS?=
 =?utf-8?B?dEpZcXZLU25tS2hZNUJWVVZHSkthelgrUDZpZnRPR0VwZHBnZm8zVmZ3d2gr?=
 =?utf-8?B?UFFXbTQyeEl5dWVFR3AyZFpLOENMYjNDeFpwWEVCbzlLVmoyWFBZRFB0ZXJX?=
 =?utf-8?B?NHF2UFd5RUlYVVNianFxR2YyeXl6azJnY0pGVGppMHlmL0x1R2VRZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb4acae-cbbc-4dbe-49b2-08da0e336e05
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:45:28.0026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Laj1mut3KWwdhBkUtIFWXrAAtID8n+GfsiDkQeApuenigs0Ub6AfOibhinWrQW4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5272
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, ray.huang@amd.com,
 spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.03.22 um 11:49 schrieb Cong Liu:
> qxl use ioremap to map ram_header and rom, in the arm64 implementation,
> the device is mapped as DEVICE_nGnRE, it can not support unaligned
> access. and qxl is a virtual device, it can be treated more like RAM
> than actual MMIO registers. use ioremap_wc() replace it.
>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>

Looks sane to me, but I'm really not involved enough to fully judge.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/qxl/qxl_kms.c | 4 ++--
>   drivers/gpu/drm/qxl/qxl_ttm.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> index 4dc5ad13f12c..a054e4a00fe8 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -165,7 +165,7 @@ int qxl_device_init(struct qxl_device *qdev,
>   		 (int)qdev->surfaceram_size / 1024,
>   		 (sb == 4) ? "64bit" : "32bit");
>   
> -	qdev->rom = ioremap(qdev->rom_base, qdev->rom_size);
> +	qdev->rom = ioremap_wc(qdev->rom_base, qdev->rom_size);
>   	if (!qdev->rom) {
>   		pr_err("Unable to ioremap ROM\n");
>   		r = -ENOMEM;
> @@ -183,7 +183,7 @@ int qxl_device_init(struct qxl_device *qdev,
>   		goto rom_unmap;
>   	}
>   
> -	qdev->ram_header = ioremap(qdev->vram_base +
> +	qdev->ram_header = ioremap_wc(qdev->vram_base +
>   				   qdev->rom->ram_header_offset,
>   				   sizeof(*qdev->ram_header));
>   	if (!qdev->ram_header) {
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index b2e33d5ba5d0..95df5750f47f 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -82,13 +82,13 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
>   	case TTM_PL_VRAM:
>   		mem->bus.is_iomem = true;
>   		mem->bus.offset = (mem->start << PAGE_SHIFT) + qdev->vram_base;
> -		mem->bus.caching = ttm_cached;
> +		mem->bus.caching = ttm_write_combined;
>   		break;
>   	case TTM_PL_PRIV:
>   		mem->bus.is_iomem = true;
>   		mem->bus.offset = (mem->start << PAGE_SHIFT) +
>   			qdev->surfaceram_base;
> -		mem->bus.caching = ttm_cached;
> +		mem->bus.caching = ttm_write_combined;
>   		break;
>   	default:
>   		return -EINVAL;

