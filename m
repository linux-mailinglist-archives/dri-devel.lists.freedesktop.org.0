Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BC7A89E0D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3DA10E76F;
	Tue, 15 Apr 2025 12:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iCig2TIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCA210E76F;
 Tue, 15 Apr 2025 12:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uquAowrAOCRxd2tyE9390qH2uGZ7Nbfj37H2BXclJ3mtV/fOtqDF87pDnW+32fkqp6Y2b3DCMGsYT7C+HBIzbvgtpcwDKCgZ4O8KJNEy9pIy+M4775xhi7YjjOzHckljA9F/fCFHYv2hxyct97CTE+NFaAORCgwGY9FDr/zOA5cwMrZ1dZ0wI56U92EotedP5JYQttZA85jzlohpPnkJDZ7P8TOwva3+O+ItcM7phzBFq9kcK+AME3w7xbema3SUljFCpYeP45ncFNPzgiNvMz87Lsah0RMP7PnJijS+2wwLDy2qBefI1NnczP4ZZziCklWDelSEV0lFahs0YVD/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0i7yRz3m47DJFTyrT5uktzDHyHOMEpA9Olhy9FozYqg=;
 b=kyTeVsPtEPoo6ExzBt1XjsKeOlkhinf01GuMy+t/cH2kiZqmpqD+jVoU1T1Y6lKkGooMzaCU3UcTeegF3K64PqxaXdW5t5CuNbT97iLNXQs4fdM7JIMSMfsn9UU7Gk2szyDI3JgTzagCsNiJmgUfJ9bqUewAVk37G6kuVsqyxrXO90MLNor2fJu3CWSfl6HhbEqt8tLcKRRH48w6ytX3habQw8UOrSUu4N5RA2P8lFXkOnyQsYSdSN+AUoqA7eK17Q9WQKfearN7Qb0vuI8ZLx2zB7scL2Bei43TdkDTc1gQfOkWCbdwYXwGMFvvCkAAGxbfESWD/HleEugPRbGlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i7yRz3m47DJFTyrT5uktzDHyHOMEpA9Olhy9FozYqg=;
 b=iCig2TIEtRqNuPSVdLgxt77R/7IwBgrTBcNZ56CQLmBMSBjG9ORgwHIlIRahkAlqTzjHkN2w/Nad2z+YT1yqUA8ngevt4AidVmmNP8RKeoOGLDln+cYyDmcTz5LVJF7IfFIsIZYmbTHA1fdPhKcEk5TUA99JxITczRAfejMR3P8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 12:29:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 12:29:05 +0000
Message-ID: <d7ed5f0c-0511-4833-86c1-3e1bae579ef3@amd.com>
Date: Tue, 15 Apr 2025 14:28:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/nouveau: nouveau_fence: Standardize list
 iterations
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415121900.55719-2-phasta@kernel.org>
 <20250415121900.55719-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250415121900.55719-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: c34fd9fe-61b1-43d3-06d1-08dd7c191c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGQvMVhMZGcyWkdQUE5jd2QzRVNqV3RlNWhsZi9CZzhVSGp6Y1FUZEtIYVFH?=
 =?utf-8?B?QnI4UFpWbEVoWEpONWpZUFYvakJZeElWSGt4UU4zaXpiYUFBdWRkZDNreWJQ?=
 =?utf-8?B?aE95emNmMFBEZ05Ld1E2eVVQSDBlMGdhQTR1bGpnV21nV0FnNC80WXgxZEV5?=
 =?utf-8?B?MEo4MVMzT0FPMVo3K25pQkJSQTNIUSs3OHp5TUl6b0lFR1Ivb0JYcGVUR1Rn?=
 =?utf-8?B?bUhGbjhRU1RJbTZ4N3lwN1cxeTlBa3l5WGVqbWM4Q01XbitJSDBlQnBDNTh1?=
 =?utf-8?B?dEFCOWE3T2FvZW4yUDlNS0xoZGVrb0EvQ21teWxXcXRWZlpsZjFuTVVST0Rp?=
 =?utf-8?B?aWU4SFhldkFBNnFzYkRBNVhTQnpRdGVYTkVSUU5ZbHdwUFZHVG40ZWE3TnVo?=
 =?utf-8?B?K3FSQUdBNzBPYWFYVXcrRXpRNnQvTDQvMTE0QWUyUlNTMXcySTd6SnRkUXk1?=
 =?utf-8?B?eEVyVzBrSVRUYmhKeE5ERmtNR0xnN2hXYjZDb3Bpc0xxeUFXNU5CdUFQZUdR?=
 =?utf-8?B?dkR5aHpIYVZVVUFVZVNON2dmL1VWS0NKdi8wem11UFNmVUdLbmVuV0Jnc2VK?=
 =?utf-8?B?c1ZIM0dxRFhabGpXZE5hM2FDQkFZWFlPRUc0K2x5cW4wS1FpMFdQNWU4eld5?=
 =?utf-8?B?LzdId3V5ZC91MFY2SGlITm9ubGVDM21Sd0ROamtqbTBSMzY0dVFBdHEzandH?=
 =?utf-8?B?NlY0eFY3VElkOU9SNVFXejUzbGk5M3NRcjBpRkhzRVhlRVQ3WVZDNy92bnJC?=
 =?utf-8?B?QS91UHQwRzhUa2RCT2xjYnE4LzBRYk1xeklGdXVwb3gxWlg3WlArcTVJMWVP?=
 =?utf-8?B?b1JkRFpxTkdsTzR3c1diYjR2TFJwVUZKZWxyd1oxMnZ4VkFPUk9QNEUxd0hU?=
 =?utf-8?B?MUowdVlJK0tmTHNsS0lZT0taSkxhd1NKZjQ1QVBXL210dGRvRFpEcUREclg4?=
 =?utf-8?B?dGMzY3A3b1VQbUlwcGNSL0VVaE1Wd2ROVGU5YmNGRVlXUE9QNUVreFk1NGUr?=
 =?utf-8?B?aStHelVEQTNwSjVBa3B3Sm13Ly9DcXVXbEdLcms2SE1pYU50bi92N1VDdXh5?=
 =?utf-8?B?Snl4d2xVaER1aEdsR0Y2UjVJWGYvMDNiWkJIL0pNSkhOTUJ0SkpuSkxsWHpz?=
 =?utf-8?B?S1Fqc1YvWk9mZUNXSnphZlVJOVpWNzZFQjYxdkQwRHZ4bDM1aktuQ3FJK0ds?=
 =?utf-8?B?NnB6eWNabmYrems0VXg3UGU2ZFhON3NrT3dRR01WM1lYd2JoUDBRWVpNd2ls?=
 =?utf-8?B?Zmt2NDJOblZRZjFMSFpobG9uYXJHOXZydXc5Z3BzZ2hqUnNvRSt5eXlOV0x1?=
 =?utf-8?B?enF1M2c5MUpxS1ZnYWVFTEdCdGFoSzNuMGtKQm0vUi9WNm9XdllQS2lVUFM1?=
 =?utf-8?B?VENGc0svNktkNEZUZWJtVjZPZE5POVFTTnZQWEtjc3RLd1NiVkxlZk5zREIw?=
 =?utf-8?B?eUU0RVhRVnlndGVzSUluVVVScXgrQ1BEbFFRZStKUjNNK29RdWdvdmZpUi9M?=
 =?utf-8?B?WUxwRG55T1ZTZ1NKYzJ3KzRSbXM5R3o4S2NnL24rTy8vd3Q4Mmk2bm1UeFRh?=
 =?utf-8?B?R2N4T0U0Tk1rQjVsQ1IvY3NsMmsyUGFvRS9NYUdNaFAvbk5ZNC93b25VbWJJ?=
 =?utf-8?B?U2hnMDBCK1lFeUJCZjV0Y2tmL0xrdDR3ajVlMHdPa3lKYVMvRGtmaWpGRUIv?=
 =?utf-8?B?VHFkeEFaVXZxcEpxNk9YdC9tUjl2Rjh1OHRWbW1sc2NFM0tieDRMdi9aOW85?=
 =?utf-8?B?VUdMdHQvNlZmRG1nQWNHRkxWTDNQTk9QdHFIS3VlaVhmVExHVU5IbllMV1BO?=
 =?utf-8?B?RFNORi9MM1hDQmdhTU8rNkFsc0M3VXk2WW9sb0JiUkszTys5ZllLVkRWUDl2?=
 =?utf-8?B?KzhPL1JjV3pNTjVYYzI3Snh6VEdLZjkvRVByS0xNKzFxZWoxVG9GU3ZaRlky?=
 =?utf-8?Q?FoqDbA+2L9Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlNpc2M3U0ZyKzlpM09Hc2dPMmRTUEJJWTlSVFp1WWwxWHBKalpabmtlbEsy?=
 =?utf-8?B?QkNKaDQvdGZSaUFaY2kycUdLWkVIUGZLZURQNTZZMGJwVzRTRy9ZRHY0QXVj?=
 =?utf-8?B?VHcwSDhDREpYa0pTakRmd0VSUU1pTG5rS0c2ZFlxZ3ZFbTdtL2RmUndmc1A2?=
 =?utf-8?B?UkQzR2grRUdxTUswZG5ZRDdaVkR3UVBRelI2UDc4ejdQakt6MW5SSU44Zm5H?=
 =?utf-8?B?S3pocXRaRzdLWURYSDFzYkViaGE3cUNpS2FSekxVdXN5Y2hGK0YrOEpLMXNB?=
 =?utf-8?B?YTBCdXdvZXRNcWZuOXhlQnl5c1BTQ2hPT2xTajBSb3IzZVBpQXZHazA1aG9K?=
 =?utf-8?B?WXVSWngxVDNldVVUbVZhZVhHS3Bua1pYR1pjVkJubXg3eUpTSWhQWmM2Qk9W?=
 =?utf-8?B?bTUzMVhrSEJVd2FXa1lQQVQ1ZE5yeXF2ZC9NQlZBZ2xoQ09Qc0cwaytlYW5l?=
 =?utf-8?B?L3RZcWZNNjZra2pmMGxqZ0xHRG5sVGxRUlpBQ1BOQTh6ZVB3NU5laEMrbGNN?=
 =?utf-8?B?REhhc3o0VE1sWGYwaWFEeE1zTXR5Z3VhU2d3b1JlakNtSGFqb1ZCTDFMb3dx?=
 =?utf-8?B?alFKb09rTnhYZno1SzloWGFjUTFPR0RSMzlGVWhrcjJ4amN5STdvS2pJM2Z1?=
 =?utf-8?B?b2tNeSt2ZTdHUWYya2FYdzhtckpOVlh5Q0JJV1U1Sk9pa3R6VTBEVHpOcFlO?=
 =?utf-8?B?OHNWWGhFTGFRZ1lCaU01eHRxdWQ4YWl0bTB1UXZXOEpBcFZxRmR5ZC9ySTJR?=
 =?utf-8?B?NXNuRHNsQklnaEtzbmR3bWZtdWYwRTE4dk8ydEpqalVyWEp3aGxpSHFQOS9h?=
 =?utf-8?B?QVRjbGJNaTJiZ2pjZ0ttYW4xMWtsRVQwWjB4LzhtV2kvQjZWTzU3cVUxdzBT?=
 =?utf-8?B?L0NNbEF0UVhxZllhRTY5REQ4bTVlYkdYb093aGJmdHYwSHFhNE9PK2tSdC9U?=
 =?utf-8?B?RlF2NTBraEtmZVZ2M2FvTmFoYWNWcTJGcnpNalJZaTc0d0tTRUdlajYvOVdN?=
 =?utf-8?B?RUJ5bFZxWThMbFFMNUhsNFVsKzhlVjRYczR3SDVHS0lJNkMvSlBjYlVMd0Uw?=
 =?utf-8?B?T1Yway8raytnU1FWSHVuQTZYaTJXQ0pGMGI5OHZyZkdjc2xjUWV0VXRLVndt?=
 =?utf-8?B?a3FaZlR0bjM1WnFTWExVV0Q2R0IxaGljYU1GaE1OWmVjNThDdExSbW1sS2pN?=
 =?utf-8?B?MWJFNmRpQkxkclYxODhyMzNCVTI3Z1lQMHRvamx0VXB3WUZUQTVzMEZUREd2?=
 =?utf-8?B?SzczWGh2RFE5aUFjOEJrQllNYklSNjdtMXdOM1pRc1FEQ1kwZnNwYWVHaVYx?=
 =?utf-8?B?SXRWa0FyU0Q5WEhGaFhyYlpFVWl5bjZaN01FRDV3QWZ6Q2FPV1k4amw4QTAv?=
 =?utf-8?B?OE1XMVE4OUtwZXJ0WnIvekNudjBHMytKUzFuQ0IvMHMrUnIyRTQzMHVlTytv?=
 =?utf-8?B?MmdhUHRRYUEySUx2V294UG5jN0J3bThGbjZ3QXgvOSthYVFzQmRoNkM1ZVJP?=
 =?utf-8?B?bGVTVis0U3RoaGhhcHRiTUx6Q3gwVVRUaG9lYk5WN3hWT3hNK3FxZnRrcW9s?=
 =?utf-8?B?SnBBRkh4eXdWejF1eURxOUJQQzBJcVJnQ0pucEN0amVTOTNUQVRaOURBZHZj?=
 =?utf-8?B?aGl0RzdyczUyejQ2K3A3eVlmbFBGTnZFdUFVOTZWajNWOHVhTDJhYXdCUVR3?=
 =?utf-8?B?dkNsOG5CcmVLbE4vbjFwalZ0cTNqN0l5SEszLy9MdytRaWI2VkFlVDJYTlhh?=
 =?utf-8?B?S1FkOW4wMmdYV1p5ditWSXdFNGVlM1B1TXVZSWZPRHFvWWtoSnlKemwrTWFn?=
 =?utf-8?B?WkI4bzNhRjI4bUVSQzd1S1NOanFlZWVCQ2gvbVA4dVdXRnZTRXVGVkNDZ0la?=
 =?utf-8?B?VUVHRVdrcDZsLzdzcS9FVXlwaWg0YlZiWlF0bFVEdkVFaWRXYWlCTnNGK2FE?=
 =?utf-8?B?SDBYaFhiN1RKTVBuU0JzN0ZkVVlGQmpIYUZGVUxMeU03alliZ0ZzU1IyUGNI?=
 =?utf-8?B?dXpFN3VZRHpXUzM2d1JEN3AwNWU0RjNRdUx3TTFXc2J2dnVUaDBYdlFhSlhx?=
 =?utf-8?B?a3hPWlhCc1dxQXBxK2haaXRudGNVaWgyL0g4Sml0dHdsNWkvU3dmVThYYVpv?=
 =?utf-8?Q?cQcShG9oDbtnB+HtLTKB16oit?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34fd9fe-61b1-43d3-06d1-08dd7c191c64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:29:05.1980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqaBr37xNuuYrLCCozgsvnhqJWlqKeO4Q8ubVLGLcwQyqNbUFSBy2bIHghGv/o7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056
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

Am 15.04.25 um 14:19 schrieb Philipp Stanner:
> nouveau_fence.c iterates over lists in a non-canonical way. Since the
> operations done are just basic for-each-loops, they should be written in
> the standard form.
>
> Use for_each_safe() instead of the custom loop iterations.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 6ded8c2b6d3b..60d961b43488 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -84,11 +84,12 @@ void
>  nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>  {
>  	struct nouveau_fence *fence;
> +	struct list_head *pos, *tmp;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&fctx->lock, flags);
> -	while (!list_empty(&fctx->pending)) {
> -		fence = list_entry(fctx->pending.next, typeof(*fence), head);
> +	list_for_each_safe(pos, tmp, &fctx->pending) {
> +		fence = list_entry(pos, struct nouveau_fence, head);
>  
>  		if (error && !dma_fence_is_signaled_locked(&fence->base))
>  			dma_fence_set_error(&fence->base, error);
> @@ -131,11 +132,12 @@ static int
>  nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
>  {
>  	struct nouveau_fence *fence;
> +	struct list_head *pos, *tmp;
>  	int drop = 0;
>  	u32 seq = fctx->read(chan);
>  
> -	while (!list_empty(&fctx->pending)) {
> -		fence = list_entry(fctx->pending.next, typeof(*fence), head);
> +	list_for_each_safe(pos, tmp, &fctx->pending) {
> +		fence = list_entry(pos, struct nouveau_fence, head);
>  
>  		if ((int)(seq - fence->base.seqno) < 0)
>  			break;

