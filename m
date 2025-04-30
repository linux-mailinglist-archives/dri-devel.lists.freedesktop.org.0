Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27529AA4949
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 12:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309810E0DF;
	Wed, 30 Apr 2025 10:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0PMNmCYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B410E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1Z4TFy7c2z+EzNFG5pRWmDuLgiI6lw31lsKrq++Uw3kTcoeXhPy9IrKsd7limFGlSWgadJNCcrLuf2cKVirPWHDMIRuOq7kJ0zYKPmX1C1bEnUEqh0mIXEwcRoALckKaQJ5xgIuWL4cslpQcm4urSa57txVRiwXJNvEsyYNQXLV5rHWJDjXFKvP4tS16n9AFSZcVYmNnwhNsTGUfpd8XnkSNQxL6T7/CwVE5wQgmHi7llojptSna1jYF8IeOF57E2fCN/85JXLxmO+bQhJfBzWWMA9mNjM3/aAB/pE6hwy5TN5G+OiHSRhBHFqIU+Et1QX1Ig/eWQzRSYEoxRV4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3+0uvAilTGUFX349uW9rgVMs6bqT+hIq/+Z/B6LVhU=;
 b=VyLXc5+zPb296f8JBBqapD+D3rpQM+lQ4fDWCvtOyxPyR3+cLRW3D5WB9xjSVV/O2qUOmdn1vxuFP5HTn2tPc95iOIvRzcLiW1wPFNeA7dnYO3mdz/G2Kte9bKCdLJpbVvrgouw7nqPlcUjCazuC6MVg3kcVa4CqBDfhNrZ/hYccpu6K5D3TsNUJ8skU9V8uGbFMzxpjFoo5NgALF1MEYEDzmeSXNLWWKPJZZhY0kYM2Ud1uDvtXVgOiE4q8YjPjqJ7DSasRXn/fDw7hszQlXghjh+OkmxM9/YcBlfQ0/tiAUrmq8ObsVguqPltXxEwJoOEF/Veye3v0jyKkOZEjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3+0uvAilTGUFX349uW9rgVMs6bqT+hIq/+Z/B6LVhU=;
 b=0PMNmCYYqKUS9zO9qMOH/XoiC4xqbj2WbX9MO6LAyIZO6m/ez2CaqJgVOb3wfSgA3NcdIPbSTh4uptwFAJ9m399/Ct92VdwnFrSm+67mBvug67yGVDqp4hCrkZxTtrH0g4zpeLZGZiZsioY2pPz1nWj7iwvNqWL9KOXOWFlrt6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 10:56:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 10:56:48 +0000
Message-ID: <c9547d90-61cc-42f5-ac48-5a8dcf3c374a@amd.com>
Date: Wed, 30 Apr 2025 12:56:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf: add flags to skip map_dma_buf() for some
 drivers
To: oushixiong1025@163.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250430085658.540746-1-oushixiong1025@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250430085658.540746-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:208:120::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: feb944fa-4829-49b0-03e9-08dd87d5b475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGFMUEd2VnpLS1lZR3VIMDZNMW1FU2Z4Yk9MakMzNzZkUTdxQWJIams1YWF0?=
 =?utf-8?B?ekl1RkJiNHFVWnBQdlV2eTgzYjdWeGtlS3JkOFY5MDVHNjZseUtLcXlERXcz?=
 =?utf-8?B?SFNROWtDZUdBUmFOeEMvdjBRNTA0WXFSelJKMzZxTkVHMHgvSW9SUVhlcWVY?=
 =?utf-8?B?a1I4K1hKWUpOVkw4UU0zVEdEcWtPclhrdTRlTzdpMS9nZllWVTBFcWl0NkxY?=
 =?utf-8?B?eEQ3VzVyQmNxbDErMHVlUjV3MmlXV2xvSXM2S1J2RkR2bzR3dXhJT0EvdGFZ?=
 =?utf-8?B?eWFFUGkrT3NtTjBCNkxLczdVS2pKRVgvNjd6OVZUeW9LMmdyNXhJeDYzK3RD?=
 =?utf-8?B?WmxyTjhOdUhCclNCMVdacUhMaWlVOHByUmpiSm9pSnArWWhNT1BIWkFBeHVv?=
 =?utf-8?B?dkRWa2gvMmFuZHNCS0cxMll2TU4xTFpST3phb0YxQ25ITk9zQkVjSEJzeG5K?=
 =?utf-8?B?cjAxbDN4TTNZU1RBOThBUXNPQ2QyL3JqcEFRdXBKa3hyQjFERlEwMFFrbGNV?=
 =?utf-8?B?alhmeUxoMEhURnBUaFZRbm9jYWRVSlltSnBkWW4rbmZNRndYUVc0WjdZVE5n?=
 =?utf-8?B?aGRrSEJPS0tjS1BSUUx4SU54Q3k3OTJiTjMzTHJRTnl0NDcvd1JrclhYczBL?=
 =?utf-8?B?RjNTaGhKakRUdW5kQ1V0dEpoaURxbFBmcHBleHFmdUltcHJITEdGWXRNbEFL?=
 =?utf-8?B?NFN2OEF4SFZvVThldEt3aHNlUXdGVEpNZXEzQlRjbXhvRFZCVzFyT0ROVGs1?=
 =?utf-8?B?ZHNlTTJ0U082b0dreU1jWUFBNXBEMWVmOE1zY0VvLy9VMU1ONm44dzRjMFpI?=
 =?utf-8?B?b1BWU2ttcTJvMHJjR1JoWUdTQzJnaFFlbnorYkRYQjdhdEhVVTd0TDBtN29E?=
 =?utf-8?B?Y1JlaHl3b01vK3FDTHRPN0I1TzJDd1VicTY5NFhGNlJwaFRONVk1LzkwM0Zv?=
 =?utf-8?B?WVdsRUZSaUFra1JpNHZ0TkQwZHdEeTMrWm8vaExrR2JWOVBmT01RMFpEMlFC?=
 =?utf-8?B?Zkp1VytjTGphalpLR3YzQVRrU09NUkFRRFN4aXdQZ2ZuWGhxL0JzNWdtMEpE?=
 =?utf-8?B?ckNxQXAxMEcxbTdTbk1tOVJRczV0clkvN3RPTEE4ZlNRdWs0M1Azb1dON21t?=
 =?utf-8?B?U3g4Q1VWUEJwS1AxN1UweFFCcGN6VHU1Z21OKzk2WkxwUTh2UC9nVlUvQkQ1?=
 =?utf-8?B?a2hMOEtkTDFZWVlvY2x3R2ZsMC9CWDYzZjRnVHpYTTNwU1Y1NWpDRkRKejdo?=
 =?utf-8?B?SFcxakFrUXpXRXJaUWJkZ2RWN1RTQzVJUHlNVDVHN1pjclgwSmVTTms2Z2Uw?=
 =?utf-8?B?Ly9maTl0Y1NQNmN3cyszdjN1ekdyd0xMUE42SmV0N21KODhDUlNwNzNCR3pF?=
 =?utf-8?B?RWVuMWFmeTIwVFZMdGhuNUcvMm5XbGhSOVd3aUQ5eU1BYnRNVXJIYStFa28x?=
 =?utf-8?B?R0ZZYlB1T2JKSm9rVnBmNTdkTGFBekdSblQ5ZWp6Vk5qem0xT3YxSXlZenVl?=
 =?utf-8?B?eXJNV2ZiZFJRUTVtNGgraVkyT0M2UFhmQkVJMGFlWUZLMm9pTnVJVEdLcWll?=
 =?utf-8?B?dko1d1JKSk83MUJndExhbTRRMG5kb014V084aUF4NmVoOUYyVlZncGRTeGUv?=
 =?utf-8?B?M3FmZmVoc2w5OGpWV1RzWjFEZVYzMHE4MVFMclBVdVpoSEFnVnMwYjhqOEU5?=
 =?utf-8?B?d1NIRXRCR1gvbmFIclJZMnhpZ0R0WGxGdUlsMXBjWkJkbUF3Y01jUDNqc2Ir?=
 =?utf-8?B?d3NwUHNoUWhSYlNEdkp5MVBwRkhMYzdoYm04bUsyUVZ2N3VGKytIR2dvMk1x?=
 =?utf-8?B?Tk45bGVmK3JNNDJmV1VBMVBJNE1td3VYRGtuMENGM0dwek9WNHNpU0pFaDJp?=
 =?utf-8?B?eExsT29uR1IyeTdkRGpyWnB4cDR5LzlDVGJ6VnF0RkZmbzNHb2VkbzVSQktI?=
 =?utf-8?Q?HyEOO54yTSE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3d0NUJNbzRVR2czc2ZFKzYxUWEzSW5PcWVLVFp4MkNzaEtuRStteVh2Nlhq?=
 =?utf-8?B?cldBYm1vZXFOWjBxLzcwTjJLRjZhZHlDMFlKaVp3OHpJOEZZVmlCWk5BQTBp?=
 =?utf-8?B?NVJML0tpMmxRSTM4ek9aYmxzb1Fib3lpUWtjYWZGbFRtOUxhSWFZNlRUUm8y?=
 =?utf-8?B?NHlOc2JOTEZiY0hoK0pJUUNaaDFlbU5QdE5XSzNOUExQU2RETzRIVmUvQStw?=
 =?utf-8?B?YjFYRFQzZU45M3VZOTM5VGdWRTNQcEN5UG55ejV5ZWdpMktSWjdyMmwvRndG?=
 =?utf-8?B?REovOXk4VStXZUNxenlGOHVtbWUyd3UxczIrMlpSQmV5LzhFWjg4UVd3Qk5H?=
 =?utf-8?B?R0hMV0JDRWFZT0tjNjErb3VyQmpzZVUxZVRPT1c5eUgyZ3JEVlIxTDd0dHQw?=
 =?utf-8?B?TU42MWc2bFhQNnhVRk12WXB2bmlObi9aYXNIb2pDTkY3N2ZvWkprcmRsT1Zl?=
 =?utf-8?B?TUErRkliaUg5QjNFc1lrbW9NR1BCM1JvUWppSzQwbWUyaGFnTkZtTG4xUGE5?=
 =?utf-8?B?N2trUVRNSDBOc3pEVWRVTHhmeE8zMEJSc2loZ01weUdjYnNzU1YzNWFPQWkz?=
 =?utf-8?B?L1ZaVUtITjdvYjhnR0U2NFU4RUppVEtPcFdGUnc0M3o2VFE4VzU2eko3d2tR?=
 =?utf-8?B?OGd4WGxIR1NiSzJOWW52d1NZRGcyaXdOOVp0eUZwWWdXUU1HMzlFaXJiV2Y3?=
 =?utf-8?B?Y3JGNGJManVZRDg3Y0RteUgwVlc5RUdYczFKdXkxNXRVR2FiaW83Wm05ajNr?=
 =?utf-8?B?TUphSXJaRjNpTnFOa1FvcW9UVnF2aWN1US9QVTBVVTAyQjZZeTc2bEpZbEt0?=
 =?utf-8?B?N2dWS3FvbWNGUFlZR3pZVkxTSTNuQm5LcmtzVkFabXFsNnRod0VucVNLWm8y?=
 =?utf-8?B?eVdXYkNYRVVTS3pQZFI1WWZQV2JsSFluWHVlQ1BFOWxKTjloNGF0eGtpb0RY?=
 =?utf-8?B?c0JBUnJ3QWxaQlNoKzlPbmJRU0FReEprWC81OCtuU0NBRGpIL3EzVDFNRmhi?=
 =?utf-8?B?ZldmWGluVFJaZlZtSXhpc1BBaS9qNG5vb1JPSTNaeW1JdWtZWmUrbTh3cE5y?=
 =?utf-8?B?d3Fya3RzVUo2ZlV2UTBCYmtjMDN0NEx5VkUySnhmZEVWY2daTTEwTmZIYlJv?=
 =?utf-8?B?Z1RsYmdsdXk3THR1L0todmh0ZW5CRVJyZ1kxclN4MVRkL2hrM3dQMUZYdjZN?=
 =?utf-8?B?ZEFReE5QaWJaMmkwbFRjV3RZUnVzbmxXeW1ESzc2MTlldEQ1TThrdXpxOXpj?=
 =?utf-8?B?Zy8wblc4SEEzTUZ4Qm1RQUFrVmlFdVcveXY1bTg1U3ArZFlTUGNONzE4aWxx?=
 =?utf-8?B?ZmZjRDhQRWNGUy8rSmFkRzJxT0Q3U0dTNlE0UDVoSThxYTNMV3Z3U005cDNX?=
 =?utf-8?B?TjJLOG1VNU1mZVV3L29EQ21ESlZzazNXWjNQN3pmaGF0RkRJTmJqZERwNEph?=
 =?utf-8?B?OFp3S3JvMzhyTlRVSyt3TWxBL3pJZU9oTTZhamxXOFZpSUxDMzdJR0pGdVhw?=
 =?utf-8?B?T3NWU3R6WHdvWDRySDRscHlMV0xNdUFBcVZXaXlqVnQ4dkw5ZFBTQ2pnakxk?=
 =?utf-8?B?cTA3MElBOEhIU2d2a0sxeG5CVmZPNEZHQ25xZk5TY1lHZWNaV2FDUElRY29X?=
 =?utf-8?B?TFpaUnRnVVExcmtld080VVNZMHBmWG9Lb08xbFA3VkNNSGdrN2Y4eEgrR3Q4?=
 =?utf-8?B?dlpmMVpRT3BTZDJOc08zbnQwUTd2KzZTU295UEYxZG9NVHB0Z0xSc2FBcXJR?=
 =?utf-8?B?YlFIVUtBeFlNdFZ2RytVTHBjN3dkbDlFM2FNUTZ0MTFyNU9SRExLeTZ5bnRR?=
 =?utf-8?B?Nm5YMFBEQnczOU1YR0laYkhJY3N5R1QxRDlMZWUyb2pVRVBNM082SURwR0d5?=
 =?utf-8?B?RlNiL1pNL3YrT2R4cXlnU3NDZ3dPS1V4Vk1KazJwanhKcElnQnJ2b2k1eDFU?=
 =?utf-8?B?aDRIVkloTXl2VEtVU1hlekNja2dYeWI4eGdGT09QVER2aTVGYUNoZDY0Rmhj?=
 =?utf-8?B?UWhNTXNIR21FY2JjdFI2eUEyUDFIa0NJcGpEOFZCNlFTTEwycmlXYWNSYlJE?=
 =?utf-8?B?UDVvTUU5M01EaEdTL05FVzEzT2JMU3BjMGd5VG9hRVAzZzFqZVVycjc1WDlM?=
 =?utf-8?Q?spbVsBpVOnx48miADzdV/D3pf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb944fa-4829-49b0-03e9-08dd87d5b475
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:56:48.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OcZbmYELv0QGEEX3zrePdU5inV7jfjF+rTiXK/glo0xzUedYDn2Evrhk18LjBk3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823
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

On 4/30/25 10:56, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> [WHY] Some Importer does not need to call dma_buf_map_attachment() to
> get the scatterlist info, especially those drivers of hardware that do
> not support DMA, such as the udl, the virtgpu and the ast.
> 
> [HOW] skip map_dma_buf() when dma_buf_dynamic_attach() for some drivers.

This patch is based on outdated code. Please see drm-misc-next where the mapping during attach was already dropped.

commit b72f66f22c0e39ae6684c43fead774c13db24e73
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Feb 11 17:20:53 2025 +0100

    dma-buf: drop caching of sg_tables
    
    That was purely for the transition from static to dynamic dma-buf
    handling and can be removed again now.


Regards,
Christian.


> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/accel/ivpu/ivpu_gem.c                 |  2 +-
>  drivers/accel/qaic/qaic_data.c                |  2 +-
>  drivers/dma-buf/dma-buf.c                     | 29 ++++++++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
>  drivers/gpu/drm/armada/armada_gem.c           |  2 +-
>  drivers/gpu/drm/drm_prime.c                   |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  2 +-
>  drivers/gpu/drm/tegra/gem.c                   |  4 +--
>  drivers/gpu/drm/virtio/virtgpu_prime.c        |  2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c               |  2 +-
>  drivers/iio/industrialio-buffer.c             |  2 +-
>  drivers/infiniband/core/umem_dmabuf.c         |  3 +-
>  .../common/videobuf2/videobuf2-dma-contig.c   |  2 +-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  2 +-
>  .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  2 +-
>  drivers/misc/fastrpc.c                        |  2 +-
>  drivers/usb/gadget/function/f_fs.c            |  2 +-
>  drivers/xen/gntdev-dmabuf.c                   |  2 +-
>  include/linux/dma-buf.h                       |  5 ++--
>  net/core/devmem.c                             |  2 +-
>  22 files changed, 41 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 8741c73b92ce..5258a66ed945 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -183,7 +183,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>  	struct drm_gem_object *obj;
>  	int ret;
>  
> -	attach = dma_buf_attach(dma_buf, attach_dev);
> +	attach = dma_buf_attach(dma_buf, attach_dev, false);
>  	if (IS_ERR(attach))
>  		return ERR_CAST(attach);
>  
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 43aba57b48f0..c13c64d59143 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -803,7 +803,7 @@ struct drm_gem_object *qaic_gem_prime_import(struct drm_device *dev, struct dma_
>  	obj = &bo->base;
>  	get_dma_buf(dma_buf);
>  
> -	attach = dma_buf_attach(dma_buf, dev->dev);
> +	attach = dma_buf_attach(dma_buf, dev->dev, false);
>  	if (IS_ERR(attach)) {
>  		ret = PTR_ERR(attach);
>  		goto attach_fail;
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5baa83b85515..dd7fe5fbf197 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -904,7 +904,7 @@ static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
>  struct dma_buf_attachment *
>  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  		       const struct dma_buf_attach_ops *importer_ops,
> -		       void *importer_priv)
> +		       void *importer_priv, bool skip_map)
>  {
>  	struct dma_buf_attachment *attach;
>  	int ret;
> @@ -941,8 +941,6 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  	 */
>  	if (dma_buf_attachment_is_dynamic(attach) !=
>  	    dma_buf_is_dynamic(dmabuf)) {
> -		struct sg_table *sgt;
> -
>  		dma_resv_lock(attach->dmabuf->resv, NULL);
>  		if (dma_buf_is_dynamic(attach->dmabuf)) {
>  			ret = dmabuf->ops->pin(attach);
> @@ -950,16 +948,20 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  				goto err_unlock;
>  		}
>  
> -		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> -		if (!sgt)
> -			sgt = ERR_PTR(-ENOMEM);
> -		if (IS_ERR(sgt)) {
> -			ret = PTR_ERR(sgt);
> -			goto err_unpin;
> +		if (!skip_map) {
> +			struct sg_table *sgt;
> +
> +			sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> +			if (!sgt)
> +				sgt = ERR_PTR(-ENOMEM);
> +			if (IS_ERR(sgt)) {
> +				ret = PTR_ERR(sgt);
> +				goto err_unpin;
> +			}
> +			attach->sgt = sgt;
> +			attach->dir = DMA_BIDIRECTIONAL;
>  		}
>  		dma_resv_unlock(attach->dmabuf->resv);
> -		attach->sgt = sgt;
> -		attach->dir = DMA_BIDIRECTIONAL;
>  	}
>  
>  	return attach;
> @@ -989,9 +991,10 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
>   * mapping.
>   */
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> -					  struct device *dev)
> +					  struct device *dev,
> +					  bool skip_map)
>  {
> -	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
> +	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL, skip_map);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index e6913fcf2c7b..26c94834e6d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -479,7 +479,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>  		return obj;
>  
>  	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
> -					&amdgpu_dma_buf_attach_ops, obj);
> +					&amdgpu_dma_buf_attach_ops, obj, false);
>  	if (IS_ERR(attach)) {
>  		drm_gem_object_put(obj);
>  		return ERR_CAST(attach);
> diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
> index 1a1680d71486..7e1a82828b87 100644
> --- a/drivers/gpu/drm/armada/armada_gem.c
> +++ b/drivers/gpu/drm/armada/armada_gem.c
> @@ -514,7 +514,7 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
>  		}
>  	}
>  
> -	attach = dma_buf_attach(buf, dev->dev);
> +	attach = dma_buf_attach(buf, dev->dev, false);
>  	if (IS_ERR(attach))
>  		return ERR_CAST(attach);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..8e70abca33b9 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -949,7 +949,7 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  	if (!dev->driver->gem_prime_import_sg_table)
>  		return ERR_PTR(-EINVAL);
>  
> -	attach = dma_buf_attach(dma_buf, attach_dev);
> +	attach = dma_buf_attach(dma_buf, attach_dev, false);
>  	if (IS_ERR(attach))
>  		return ERR_CAST(attach);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 9473050ac842..6015f6beb8e6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -305,7 +305,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
>  		return ERR_PTR(-E2BIG);
>  
>  	/* need to attach */
> -	attach = dma_buf_attach(dma_buf, dev->dev);
> +	attach = dma_buf_attach(dma_buf, dev->dev, false);
>  	if (IS_ERR(attach))
>  		return ERR_CAST(attach);
>  
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 2fda549dd82d..1992241fdf54 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -287,7 +287,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
>  		goto out_import;
>  
>  	/* Now try a fake an importer */
> -	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev);
> +	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev, false);
>  	if (IS_ERR(import_attach)) {
>  		err = PTR_ERR(import_attach);
>  		goto out_import;
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index 30cf1cdc1aa3..41fb4149409e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -114,7 +114,7 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>  		}
>  	}
>  
> -	attach = dma_buf_attach(dma_buf, dev->dev);
> +	attach = dma_buf_attach(dma_buf, dev->dev, false);
>  	if (IS_ERR(attach))
>  		return ERR_CAST(attach);
>  
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index ace3e5a805cf..e5527c9d10bb 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -79,7 +79,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
>  	if (obj->dma_buf) {
>  		struct dma_buf *buf = obj->dma_buf;
>  
> -		map->attach = dma_buf_attach(buf, dev);
> +		map->attach = dma_buf_attach(buf, dev, false);
>  		if (IS_ERR(map->attach)) {
>  			err = PTR_ERR(map->attach);
>  			goto free;
> @@ -470,7 +470,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>  	 * domain, map it first to the DRM device to get an sgt.
>  	 */
>  	if (tegra->domain) {
> -		attach = dma_buf_attach(buf, drm->dev);
> +		attach = dma_buf_attach(buf, drm->dev, false);
>  		if (IS_ERR(attach)) {
>  			err = PTR_ERR(attach);
>  			goto free;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 4de2a63ccd18..6d9d1fe342b6 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -326,7 +326,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  	drm_gem_private_object_init(dev, obj, buf->size);
>  
>  	attach = dma_buf_dynamic_attach(buf, dev->dev,
> -					&virtgpu_dma_buf_attach_ops, obj);
> +					&virtgpu_dma_buf_attach_ops, obj, true);
>  	if (IS_ERR(attach)) {
>  		kfree(bo);
>  		return ERR_CAST(attach);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index f7a20264ea33..9f524b9ed425 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -293,7 +293,7 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
>  		attach_ops = test->attach_ops;
>  #endif
>  
> -	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
> +	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base, false);
>  	if (IS_ERR(attach)) {
>  		obj = ERR_CAST(attach);
>  		goto out_err;
> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
> index a80f7cc25a27..1296af4c2f7a 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c
> @@ -1679,7 +1679,7 @@ static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
>  		goto err_free_priv;
>  	}
>  
> -	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent);
> +	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent, false);
>  	if (IS_ERR(attach)) {
>  		err = PTR_ERR(attach);
>  		goto err_dmabuf_put;
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index 0ec2e4120cc9..ed635c407cbd 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -159,7 +159,8 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
>  					dmabuf,
>  					dma_device,
>  					ops,
> -					umem_dmabuf);
> +					umem_dmabuf,
> +					false);
>  	if (IS_ERR(umem_dmabuf->attach)) {
>  		ret = ERR_CAST(umem_dmabuf->attach);
>  		goto out_free_umem;
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index a13ec569c82f..362f5b555ce2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -786,7 +786,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>  	buf->vb = vb;
>  
>  	/* create attachment for the dmabuf with the user device */
> -	dba = dma_buf_attach(dbuf, buf->dev);
> +	dba = dma_buf_attach(dbuf, buf->dev, false);
>  	if (IS_ERR(dba)) {
>  		pr_err("failed to attach dmabuf\n");
>  		kfree(buf);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index c6ddf2357c58..4f9a4e9783a1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -632,7 +632,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>  
>  	buf->dev = dev;
>  	/* create attachment for the dmabuf with the user device */
> -	dba = dma_buf_attach(dbuf, buf->dev);
> +	dba = dma_buf_attach(dbuf, buf->dev, false);
>  	if (IS_ERR(dba)) {
>  		pr_err("failed to attach dmabuf\n");
>  		kfree(buf);
> diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> index b34244ea14dd..d04da2d3e4da 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> @@ -95,7 +95,7 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
>  		goto ref;
>  	}
>  
> -	attachment = dma_buf_attach(dmabuf, dev);
> +	attachment = dma_buf_attach(dmabuf, dev, false);
>  	if (IS_ERR(attachment)) {
>  		dev_err(dev, "Failed to attach dmabuf\n");
>  		err = PTR_ERR(attachment);
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..aee6f4cbd6c6 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -778,7 +778,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>  		goto get_err;
>  	}
>  
> -	map->attach = dma_buf_attach(map->buf, sess->dev);
> +	map->attach = dma_buf_attach(map->buf, sess->dev, false);
>  	if (IS_ERR(map->attach)) {
>  		dev_err(sess->dev, "Failed to attach dmabuf\n");
>  		err = PTR_ERR(map->attach);
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 2dea9e42a0f8..51926ffdb843 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1487,7 +1487,7 @@ static int ffs_dmabuf_attach(struct file *file, int fd)
>  	if (IS_ERR(dmabuf))
>  		return PTR_ERR(dmabuf);
>  
> -	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
> +	attach = dma_buf_attach(dmabuf, gadget->dev.parent, false);
>  	if (IS_ERR(attach)) {
>  		err = PTR_ERR(attach);
>  		goto err_dmabuf_put;
> diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
> index 5453d86324f6..9de191b6d1f7 100644
> --- a/drivers/xen/gntdev-dmabuf.c
> +++ b/drivers/xen/gntdev-dmabuf.c
> @@ -587,7 +587,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
>  	gntdev_dmabuf->priv = priv;
>  	gntdev_dmabuf->fd = fd;
>  
> -	attach = dma_buf_attach(dma_buf, dev);
> +	attach = dma_buf_attach(dma_buf, dev, false);
>  	if (IS_ERR(attach)) {
>  		ret = ERR_CAST(attach);
>  		goto fail_free_obj;
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 36216d28d8bd..1ea25089b3ba 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -598,11 +598,12 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>  }
>  
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> -					  struct device *dev);
> +					  struct device *dev,
> +					  bool skip_map);
>  struct dma_buf_attachment *
>  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>  		       const struct dma_buf_attach_ops *importer_ops,
> -		       void *importer_priv);
> +		       void *importer_priv, bool skip_map);
>  void dma_buf_detach(struct dma_buf *dmabuf,
>  		    struct dma_buf_attachment *attach);
>  int dma_buf_pin(struct dma_buf_attachment *attach);
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 6e27a47d0493..8137ecff9e39 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -202,7 +202,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
>  
>  	binding->dmabuf = dmabuf;
>  
> -	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
> +	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent, false);
>  	if (IS_ERR(binding->attachment)) {
>  		err = PTR_ERR(binding->attachment);
>  		NL_SET_ERR_MSG(extack, "Failed to bind dmabuf to device");

