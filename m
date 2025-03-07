Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E34A56474
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2620410E107;
	Fri,  7 Mar 2025 09:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y+JJqoqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F9810E107;
 Fri,  7 Mar 2025 09:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agxR9vJ+yUoGl63cepQfvLnSl05NNGXuFpnLhFP0bfTGNqP/U79gHBYHoG4snzUF9kn1Fp5so3HSdeaHIwz0cQ5DUBPGHGE9d9UXCeSt+0uI5OzIMo9uvPNkHlcS65knU5ULFRtzmLZpWfkiClp5f+hzI8xi5GJMr1DvEtLoHGfCqZi4Ym13pTrgoGdiKWjgTgIqnaePqywwPq87PHHjh7q5KgTOuBiUVSAMX7znHEGEsvClxmGf+QP4K1LaGGsbsE+6DIumE19hY5nNy1uMIHXQLwOa7oPAWuJa5iRi2bnu8nX9fwcK52ZwDSEPN2kPUQn4F/mVTJZ1sG1/4ZNuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xqmZpxd+MjnzeN8pyjZvCtVH3NttJDiEH4sjGhjkhY=;
 b=P3HqMNKCOsbgF01WjqMJHcJmf5LjEOGEQeqozI3zOlsHrK+lKMMP1tv6WSDkwN/EX46DIM3m5SCcA75Xo2Qd8MFbn+yKRaPpW0SV8CZZTsEBU27155jRORA9SJETlrlGSc+tT9iSf7GlLC+r5xZAcvduJ9FTof2ySVDgmG1OK4vYcY7ht+MA8iNso5gfZCypBMSHzw9vEJSXbYJ1kMt6Yf/3nvLf+RwXBl7u30r+v+AG+2h3p4x/gOR3fvsw/RPn5u48l5jSyVlAQ1POA1ihXhiqFNVVe0ziylmO12hz+IhsX+vGhKhThwbZj+aS20pgGiQRx6gs9i9wlfN8NQPLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xqmZpxd+MjnzeN8pyjZvCtVH3NttJDiEH4sjGhjkhY=;
 b=y+JJqoqj4rGhqdRIcDGOGrzF21TxEqXz7Hr8LWezcfyQSD913By8tIoiYV0g80YElJEIx4kc2kjpf9dreO1LiaJnKJyPvEzvNaMmmSvOj0R/KszLSpAV6VMnOlKeEMzXCNSNyFhuxXqPqdMUuHX0BTRcDb2IU5p0YoMg5VN4m3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9105.namprd12.prod.outlook.com (2603:10b6:806:382::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.24; Fri, 7 Mar
 2025 09:59:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:59:11 +0000
Message-ID: <f7c678d2-6c51-4a03-9604-2fb031854617@amd.com>
Date: Fri, 7 Mar 2025 10:59:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/drm_mm: Safe macro for iterating through nodes
 in range
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 dri-devel@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-2-tomasz.lis@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250306222126.3382322-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: b42f88a5-38df-402c-0c92-08dd5d5eb55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1BzVGt4MzJnUnlmK3BFbGtLYmxzckhpWU5SU2pzRm1yL2h2YWxZOGMvRnRO?=
 =?utf-8?B?U2p2a09xS05aM3I4aXc0Z2NYNjBVd1V1UHVQMTFMWnB6WUJ6YWpGdFI1UlZt?=
 =?utf-8?B?OGwxWXBhNDZDY1VlSDM0ZlplN3lYbkhnbkY1OHg3STcrOFBobWtjUXRsNDl3?=
 =?utf-8?B?SHE0LzU5YWdObWVkNTRWS2hOK2wxeE4zRnN3cmptdlQ1dzhWbmdsdmV2MUFa?=
 =?utf-8?B?bXJyNjFNY3ppVkpFQXlYY01ZajhJUnYwM3V0T2NQNzdLdXlDcUJ4S1N4TXJs?=
 =?utf-8?B?Yll3WS9tM3BjdDI0ZVlWdW9WTjBtUVFRUTUxamp5UUlVQVFoUmRXeFpIZmlX?=
 =?utf-8?B?alRlNHdqWjFlVmVVNUxJOTAvYTBIMFNlY1FjMDFKZVBvVExLODJQVUxlbEp0?=
 =?utf-8?B?MGladHNHaHBiOVY1bXhndHNpb1RLazk4Q3NvV2xKUDVLR2ZpVy8wNG0wdS9J?=
 =?utf-8?B?b1IrYWtPaE1MOVl3TWhneGxhdk1UTTJlNVM5eFJmMWo0bkoxL01JeDFqbW5E?=
 =?utf-8?B?VXBrVDJ6L3VUbGIwc0R2Ymo0VGk5MThpTWpFMU1TK0YvTkY5anUzNnhya1ZS?=
 =?utf-8?B?SWVCZVlZaVBPRmIvSG9TVlJ1ak9mZnZLTmxhZzdZZ1lGNk1GVWUwNU1SZkJo?=
 =?utf-8?B?akZTMEp1U3E4dzhhZUNFNkFNZG9ja1pMcjRxd1d6c3E2RUoxV0Rvd0s5Ni92?=
 =?utf-8?B?MmZramV0aEhEOEVxWUpmeEdRZkxiYS9CYnpxTDlpNUdCNVNGMHNJaFEwTEZU?=
 =?utf-8?B?U1lJT0JsZWtNbytpbGx1TnFYK2NWNzV0UmtNMTljSnZhWFZiTDlYNzBGUDA4?=
 =?utf-8?B?Yklmak8xQWg3RkNYUkI2YnMxeGNzVG95UWxlL0pjK3NWWEh0OHV6Yis0YUVB?=
 =?utf-8?B?dnQ5SHFGRlhMSEFJakprVlFYdURVVDl1WmQrajU4aEhrY2FNQlJzdGZGcXlv?=
 =?utf-8?B?b204WFhlM1ZVbWJNT1l5OUhaWkxPRmZPcjY0eEs1UTlCQWV3M3lUcS9Ubkl2?=
 =?utf-8?B?YWV0a0FIZytqNEFyZzZDYllQWGViTUdWZmpuVnBOdVFyQXZ1QUorYk9wVStY?=
 =?utf-8?B?eGhhcU9hUnd5UlR4b1hTN21xeHBSS1JtYmVyUlM4VmE4ZmtzUGNkYUFuSGla?=
 =?utf-8?B?MHViSmEyaFdYNXFDUDZNS1kwWTY3YnlDNDZyT2tZNHJDMFJubllWZ0ppRmM3?=
 =?utf-8?B?ZERGbHg2YTAveGlnMEZpK3haN0dGTlF1NzViTVBrTHJaU0Rpc043MHJ6RG5K?=
 =?utf-8?B?ZGJ2WGptTllsVnZBWVBya1RvclNXOGJjYnNsWEg4TXJ0MUcrbC9FVlM2T1Fz?=
 =?utf-8?B?V2tRSmhVRTVXRFM0cmtsY083cVRBQ09DUzZTLzhzSi9UajZkZUZMTHJDS2c4?=
 =?utf-8?B?NkNqNDRmUFJGb1FLMHA5TVNJaHVsQVRRazY5NGlaZ1hPYlFETDhXRE1YUGtG?=
 =?utf-8?B?aXFBL0RHbmVCUEFRZ29yUXVxdXRRWGpkeWJlVUZlOTdud2JISHYrL0ZyMnF0?=
 =?utf-8?B?MGkyOTVPNnVDQlFBKzQzSFhNb1Iwb2c0V3k3TXI1eGllUkx2bHlyZFRRMjhI?=
 =?utf-8?B?MkQrZTBXS2c3a0cwMllXakZucWdIdm4wczhFMkRSRTVvalprTkhHMG1oR1Jk?=
 =?utf-8?B?SGdWT1VNQk5LZnF3VnJnT3JyV3IwY2FvRU0wdzRId0x1TkIxUVU4aHFrM2JE?=
 =?utf-8?B?c2dGc2VVK0l6SkFMNUgvRmxNNFAyeXQrOVNEYU0reXdqaHdaeEt4UHNxNnJn?=
 =?utf-8?B?K2EwdEs3WFRJcnVMZ0dTL0FOVkdyWWIvZXB5WGFXOHRDYkVtWWN1ZVZyVVRp?=
 =?utf-8?B?MXROUkJ4S3hVRTk1WURxRHlFQk1KSUF3b1FnZXY5OWxvNG1mYXZ0TUFIL3oz?=
 =?utf-8?Q?cEHFmkZKfTrxc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXYzQ2Y3M01BTlJkQ0pXQU9ub1lTbGRMQ291aDlQR20yR00vWFV0cTZLNmpB?=
 =?utf-8?B?dTZBVit0SHZka1F3ZjRSTTg0VFpES09na3VWZnN2emM2TXZrYUV1WDl6Tkcv?=
 =?utf-8?B?L2FINThoVExZZmw1VWl6RmNrTHErSC90TjBQZWZzRlF6enlrbEcrZXRPcTRy?=
 =?utf-8?B?MGVoWVFmb3dVOWFOc05KNXRVM2Nwc1FESEh3cm9saFFUSGRsNjQ1MlRSOEx0?=
 =?utf-8?B?V2pjb2pQQXc2SWFjb0svZzg1NTRCUmRaZTBxMUdVYmcrWlI0SWIrOEJLWEgx?=
 =?utf-8?B?WVZHWnhBdi9hMHZlbHIzdmdWS3NCeFdNcXg0TXlIMGd6OEpGUnp6SzVXd1Ba?=
 =?utf-8?B?U2lrQ01MajEvdUErRHdmR3FvT2pHdkkvSy9LYldNUWhORTl4NG81OFpyMWh4?=
 =?utf-8?B?N3RDeDg4Z3RJQVFPVFo3SWo3czh2T0RBaUpGRGk4NkpORDBYdlZMbE5MUHkr?=
 =?utf-8?B?SEdzaTJlREFoeWF3YzU1OVltSm1CTEhQbFFUODByQTlFeFF2M24zUHlTTUY4?=
 =?utf-8?B?NTlyRDk2TFJjcWtKZnFsdUdrY0o0dHh0SkNock9HVkh2MzBPSWZsODYvZm1T?=
 =?utf-8?B?U0doY3h6eERXd3dEamo3WGR4bExVRjBIQTI2dlRUSXI1aEtBVU12dS9yR2F1?=
 =?utf-8?B?cnVwQTMycHUzdUwrVlhOR1lGRmY5M2JSOWtlNmdES0E0MDRWbWR6MTRkQVkr?=
 =?utf-8?B?bm1kcERDdUNzUVFkY2diZDZJc1cxdUVwcGk2ZU9XL0JjVFNNMjFjQWZodTF1?=
 =?utf-8?B?MElnK2JKVGR3T0Q5RDI0ZmpOY3o2WVE4UnRNYWdlaFI0Yjd3citKa1VwRytC?=
 =?utf-8?B?V1oyOFJFaGt1VThMcmtiaXEyRjZFbkpMOEpQWGo3a3ZycXF2OEFVSkUvSXBp?=
 =?utf-8?B?Q3JjVEdRYVlMdEcyUm12UHM3SUhNd2Y4cWMzc0h3eGM0TW42ZXVMVThudmJW?=
 =?utf-8?B?TUIyaVp2dG9BZFJ6bVZYb3kwQjVQWVNiKzJXY1FoSHBqTXZ2VHdibXd2aisz?=
 =?utf-8?B?dVlHdXNuZjl4dmg4cThCT0grM3czSng3MVQwa1EyUkxtMUk0YzltSXlCWlEv?=
 =?utf-8?B?bm8zZldneEt0bGFBYjk0dHBVa2pUOE11SWhxVEl5VTdGeTZuSUtMa1R1cmVs?=
 =?utf-8?B?MGJRelQ3TDhVbE9QdFZUZWI5TUo5eTJxN3dNaXVtRVlZcW5GVTBxMU0vRHMx?=
 =?utf-8?B?R1ZaQnp5L1ZIajhZb3p3N3pqZ2lhWC90TXRPWGp2VE9PdHJzOEJyczludk1Q?=
 =?utf-8?B?eEhtaHVPckFiUWRSamxEdmhKMzhKSzBkNlloZlYrUjNXdGI0N0VXT0xVUDVw?=
 =?utf-8?B?VjBBZDdSYWp6KzRNYjJpeTFhYTBFemNuSTNPRjBPZUlJM2psRHhxSTYzV1hx?=
 =?utf-8?B?MFBFNjFCazE2VGEyTWhLR0F1Y3RtZmFVQUlyMkdJQ0wxQXdCV25NM3IxT29x?=
 =?utf-8?B?eEhWdzV3Y2ZvcEcxWWgwZzlNTnY3YlFDZlJ6RUt6YWlPR3pkYzJGRzVMek5I?=
 =?utf-8?B?ZjF6N3Y5UlZtZ2ZIdFVsSTNKSnFmT3FpQ3FrUXpxcmxLNkhaMExFNnNDTVB3?=
 =?utf-8?B?clp1NE1FUzBWb2wyc1I4QXR4N21ROEQ4aHltbThTd0tJWlhrbmxiMmlQMDZj?=
 =?utf-8?B?dFBjdGJ5MGl6L2VTSENKR3hqK3VZdFR6cWc2NkUrYWNBRy9ZOWtIUlF4bjdw?=
 =?utf-8?B?SENRRW5TcDJFVFRiTGpaZjdDak9Gb2RmeTJmc3BOL3ZEdml2TGk0UngvRHMw?=
 =?utf-8?B?WW1nSk8rSEZsK0pmTDhCR1NRZWduSTF6cmljZnJENTBxRUM2Q2x1QklYcit1?=
 =?utf-8?B?VkNiUTQrRVczd3VNamxLLzRkbmg0MDV4S2dxNXlUN3lOYTgzVFNkYUg5KzRq?=
 =?utf-8?B?MXRMRHFoVTZvMmI5dWErWVM2eXRiRnFzeGw1UGRTSEZZNVpiSnBaRnpsMWp2?=
 =?utf-8?B?UFU4eENrZ0FYcExHaXlQTCt1MXpNclBYQmFWUDMycWIxMUNjejNzL0pUbHpn?=
 =?utf-8?B?Rit1ZW0xM0ZLNVhjcDBlMmZSbThmRGVWamphaC82WVl5MXNYQWc4Q0NEMlB6?=
 =?utf-8?B?RGJjWUxSRkNDYUZUaWYrUkhaeHFtdzNMTjcxRU50bm1zZGM4dmxud21MQjRB?=
 =?utf-8?Q?Cbbe6bgUpvBNwFro2Ma03FohH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42f88a5-38df-402c-0c92-08dd5d5eb55f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:59:10.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHx6w7p3Apm/GQaTPGKc6B5DGv17WgLZ55tiqTxr8MlKD+/syPhblM9MMr3h5ksG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9105
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

Am 06.03.25 um 23:21 schrieb Tomasz Lis:
> Benefits of drm_mm_for_each_node_safe and drm_mm_for_each_node_in_range
> squished together into one macro.

Looks sane in general, but the other patches who actually use that never made it into my inbox.

Please send them out to me once more and maybe put Arun in CC as well.

Thanks,
Christian.

>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
> Cc: dri-devel@lists.freedesktop.org
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
>
>  include/drm/drm_mm.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index f654874c4ce6..43e99441f6ba 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -504,6 +504,25 @@ __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last);
>  	     node__->start < (end__);					\
>  	     node__ = list_next_entry(node__, node_list))
>  
> +/**
> + * drm_mm_for_each_node_in_range_safe - iterator to walk over a range of
> + * allocated nodes
> + * @node__: drm_mm_node structure to assign to in each iteration step
> + * @next__: &struct drm_mm_node to store the next step
> + * @mm__: drm_mm allocator to walk
> + * @start__: starting offset, the first node will overlap this
> + * @end__: ending offset, the last node will start before this (but may overlap)
> + *
> + * This iterator walks over all nodes in the range allocator that lie
> + * between @start and @end. It is implemented similarly to list_for_each_safe(),
> + * so safe against removal of elements.
> + */
> +#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
> +	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
> +		next__ = list_next_entry(node__, node_list); \
> +	     node__->start < (end__);					\
> +	     node__ = next__, next__ = list_next_entry(next__, node_list))
> +
>  void drm_mm_scan_init_with_range(struct drm_mm_scan *scan,
>  				 struct drm_mm *mm,
>  				 u64 size, u64 alignment, unsigned long color,

