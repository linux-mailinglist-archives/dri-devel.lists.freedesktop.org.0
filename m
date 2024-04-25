Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B64E8B1AD6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FC611A197;
	Thu, 25 Apr 2024 06:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BQg/+9PW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986E411A196;
 Thu, 25 Apr 2024 06:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgsFzy+UeZO/wSW4ntrawcL1kDWUBbyRKgRy9oCFt83EfFta00WTs8a4Zx86oWyWewPW1aAro1tQAymYapknYzw5r74Ttxw84mxHFfJPt4BehUpwgORs8/DPhm5cjZfc1JVRgBfTzG55eueLXcJoFBzrj6Js9pHkV474kHGfE91euGVJ0mTmHejXMIPLLNXCcS0UlhqfDkVCV4jLMblFfF/83jwkHDFFZlgpzvoMsEP4IJUW81cnNin2vISD1+eAblnVE5/e+dG41YXdRdv+DZQ1Zcj88u0k1y5LkKWKyf01MLuX8yCBHjqAWHmyXZH3ra+dKjdp3PVoOutrqQA4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeFEYa+SB+Qow7yzVt9yNcDemgdkDsGGTv/tzP3RnLI=;
 b=mG5XAaeFeOdbEeFeExzMxYnVHXcOxHhIfIH4NLZ8DeRyN4FsciEJu49Woqf+7MyF2z+F3OtmsjEe2clgXpewiPWNL2nxjtPrTZhBJj5Y1a8Pt8fjHNDJUkh5oBpBYkkqbb7V68lm9Oi+oWjTPC/tkm/yukZYNCrMiR0lk7XduzDNu1cx6TSsKaL/jFMjLC4agsrOjsBembaodvr4iJvGKXC6d/I2hc3gUEPt+6h6ysuQJoGe1bL1GEInGkk3ap9gvx4i9Z2DnXKqUNY7z74d43SBHj0aAUcoClpMXZ6IZZUGVmNYGV2GMeEr0PHPJdoGMVimqRkDoFlqki8+NQemXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeFEYa+SB+Qow7yzVt9yNcDemgdkDsGGTv/tzP3RnLI=;
 b=BQg/+9PWqAQ6qmD/ZZKwP00jP8Y+bUSI4lS/m36YY4+hA9CHhc1JINFWC4NlIXRk6K6OjbU9MOrTxVS9Pm066DF9d1uo3l+nz9cZQfWllaaljP/+W1Kya4O0zRWlIYUfK2IFNLrwyE0l/Yem7JWiZRYZ0Oc+DHTBNcbFu+zksPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:20:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:20:21 +0000
Message-ID: <5fd5f5c0-a711-46d8-b2e3-abe7d993ac5b@amd.com>
Date: Thu, 25 Apr 2024 08:20:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/18] drm/ttm: Add option to evict no BOs in operation
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-6-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-6-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a53dc83-58cd-47a9-f366-08dc64efc8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1NHc3EvMk5WYy8rdFBPdXBDemI3OG5PYkRyMlNaZjFleFBDdC9SdkhrR1d6?=
 =?utf-8?B?UStxUXRzbDVTM2QweDFuZW40UW1BOGFmRS9iTUNaWXhCKzN6ekxHUXcxVGNE?=
 =?utf-8?B?djF2b1NDRVVKajFEbDU1Qk0vK0VSQy96ODZOMXVlcjdPcWtkY2JES3A2SWNV?=
 =?utf-8?B?S2IwdmE1Q2c4TkJCdUFFdXZ4dlY2Qi8yVGF1VTBXQUk4YVdDVGNiN3ZxNXpQ?=
 =?utf-8?B?dU1WYjl2aVBMWTRoQytjZ01iTHcvSGdPZTN2c0xZSXlpWkQyTUpxNGNZdzB0?=
 =?utf-8?B?UzI4V3VITGwyRE9ZYUZYT2JhOTdkb3IzL0Q1MWcvazNzRzF0MTkyL2EzYWJy?=
 =?utf-8?B?SDN3SER0Q1hnc3p6dFY4R3FBSGVCUkxucTRnZEl4UGJxMXRPTjFBUld1SHVK?=
 =?utf-8?B?RUNHRWFHTkhqOURtZGszYTF4NW5IT3lVR0o1Tk14OWpBUG9sWXBmYlp4VWpn?=
 =?utf-8?B?QUlJT1BHanl5ODJtOVdDM3Rzc0ZrY3owNDEwaGN5NHVhQnVKbTh3QVh1YXlM?=
 =?utf-8?B?SG5EQ1N5Q3AvbnFZZERDNHRETTdtRDFvUi84MWoyQ3JhczJGeEJBSXFzOGhM?=
 =?utf-8?B?TWRUc2RyclhwY2VUVFlwaVJkZ2l1S085em5OZ3NvbFQxenRZN2lRQ2Mzbkht?=
 =?utf-8?B?UDlGUS9Pb3pVMnBzR2pIVGN3N0lqYmd4NWQ3aUdmRklDbTZTS2liK0RURTBG?=
 =?utf-8?B?R0d0TTA5UUQzNlpZZ2wrbmYwSmNaR0tyWXNBYW1XN2dvMmo0TUoxbGdoQ3JC?=
 =?utf-8?B?NEFnVkpkaC9RMTNBN3hiWE5SNmV6b2lHYUdGbDJlWS8xc1hSZWpSS3RBSzJt?=
 =?utf-8?B?VEJHTFk0ODZYelBaM1Q3dWdPcVl2UnM2RURWWVhBWTdnTGt4SklrUkJhWllK?=
 =?utf-8?B?RittL3o5VGhvTlRhb01PRDVTSEgxSWpiUlZYa3ZENFZyUFVLOVhmMGdnM2Zm?=
 =?utf-8?B?b1Nvc0pKRiszeWs3cTFIY2xrNWQ3VEhhL245aTFQd0FoU2RZZm12WXJHU09Y?=
 =?utf-8?B?cm9wQ1RuKzZqdk9JN2NpbGpCNVVMdzlrUllvNUhJSUtBN3lINzhUeityQjZn?=
 =?utf-8?B?emhYclVUNzdxOGhuREo2R1JXSnBwQnhzUGVRTTZuZ3lGVVAvT21KZHBERkpp?=
 =?utf-8?B?T2I0enVHYXBGNDZEN0F2VEQ3Q1ZOMkhETzN3VjRZWmxEcnpEamlxRkIwTDFw?=
 =?utf-8?B?b2tUQXpoWXFuSVRYVFMrdWpEQTR4ZVJrSjVLSjNYSURPSUVxam91K0NvcUJt?=
 =?utf-8?B?S0RKSzhqMk8wKzBxRTltbDU1WVhURU9vajVZdkcwdi81dHVURWp4Y1dRaWFN?=
 =?utf-8?B?UkJSNkxaZXlMZ1lrcEx1STdKcHdzNWFTQ3kvc2JaeFd1Sjh1SFd1MkVxbWdW?=
 =?utf-8?B?U283L25Dbmx6TkJYdGJCVi9vODh3TzNodWJ2ZitHWmZKWit2OFMvWG1VKy9l?=
 =?utf-8?B?Z1ZlbmdKdFphZzZkbDFld2twVFBvZGZ4V3VsVEZzNXFpWG0zSlRmNDVVWm1a?=
 =?utf-8?B?OFJ1L3I4Zm9UUHdvdWRDNWRZTVg1YWVoRzlCZnlvbWIrcXVXQ2puZWdyQnNv?=
 =?utf-8?B?enVZNWxkaU5pcjAxa1pVaEhERDBwODJOdnN5QmsvUCtER1BMTnN2TEtQNmRn?=
 =?utf-8?B?UkdYQ1VHUFluOHRoRDZieVRFSGRWYVEvQmlveTlFeHhwVER0OWJ4c2I2ZkdW?=
 =?utf-8?B?Y25sSkVSSExEYTZnZy94QklMbFFOU2YzWXVMdG5nTjhRR3BJSnZ5OUlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTJtbTlQZUhyRWswTG5DWjlnd2VpVjhMek40UnUycmVzWU81ZjllbDJzcDUv?=
 =?utf-8?B?Z2IwcHZMTEoxeEVzRXdRZ3BiMHUxallmRHRyMnhaQTljdHk3MHZkNWhObUJz?=
 =?utf-8?B?dTArT0RGVjlHM1ZLdkFxZG90WlQxR3ZDNU9pSnVKTWJ3YlpkM1VBOHU0dTNw?=
 =?utf-8?B?N1RFL1lXenlSY3FySmM0VlhMdnpQejRmZHJlaWJ2RnkwMElBckUvMDE0OWZN?=
 =?utf-8?B?aUlYN2dCVGZRdGlIZ1B0WVhnZVpEQWg0cGdtV0huZlZqamRNTm91Mitld2V0?=
 =?utf-8?B?NTN5OEUzaDIvZis1NHRiNmdMT0lrMWQyZTUzalltd05vV0JsOW1tWjlVT29Q?=
 =?utf-8?B?djN6cmtocDlzVUFhZ1pEcUJIMzJubm5UME84ejJLeS93TWltZUlFSk8vNFVO?=
 =?utf-8?B?ZW5JWHpTRzFXZ0ZPOXV1bCtmQXN2eTFaeTJUTS9pRXYvbzRydDFRazQ3Qmcv?=
 =?utf-8?B?YVh3eGZrelhkeVVxVEdzeE9MMHBLY2lZNDZuNVhTdks3dy9ET2NUVzdTQ09i?=
 =?utf-8?B?WklGUGJHTEdmREtUSy9ENmdONU8vU1dORTNGdXM2c1FrbGtHclYvVlo0cXlk?=
 =?utf-8?B?K2tkV1hRN0VGdVJzMXA2TU11WWh1aDBDTTlUaHZIL3ZoQkVFSUhDZTV0Q2xx?=
 =?utf-8?B?OWs0a0VyL0dRS2FrbUdobFJudmtTblE5c1NWeVFLQXJhS2trZ3Q1Y0YwY1Ev?=
 =?utf-8?B?N1pvMmVxc21hWExvV0ZzVS9zcUtBVWJzcUFLRUZJZjRoY09yWVVZZW9MVGhh?=
 =?utf-8?B?T0dFQld4ZFlhRzJ0UWNIRndER29PbmRCSkE2YnI1L3NoOGUxdGhPZm1zSHRX?=
 =?utf-8?B?NC9KYnRPOFhQc0hSMHhjYmpRVW5CbnkzYU15VkV5eWZzVWJkYndtdEJvclVO?=
 =?utf-8?B?ZjlTZDFEWmx0MXhUNnJDYWF6SHNVOWFrWGw3KzhzdDhzM0sycmo2cDVmblpv?=
 =?utf-8?B?aWhMVFY4cXVTbU0zbFFUOStaeWZCczNVeTdWc05GKzBSZ2lDVVVUNHAyWEpB?=
 =?utf-8?B?ck43dkkrbkkrY0JFU2N4Z20yeU5oKzV4ZEtCUUZDekdWZGFlTkJEbEJpNXF3?=
 =?utf-8?B?a3JPblBNbFkvaEN6eHJCMkVwMk82cTRCVThnNnU2ZG1renpzUTA3Rk10cENY?=
 =?utf-8?B?Ylo0cHZla0ZKZWJYazBKLzZNZS9zV29KYmdxbDRsZWJtd1VlYXhOcjJOYUZk?=
 =?utf-8?B?V3R3NjI2NVAxem5JdjFsOXNoRFBBS0dRS0hpZEtXY0pFekdBMHl0SlBmQ0lj?=
 =?utf-8?B?MjBqQzM2UTVrci9hMlpSQUdyTDc4bXFYZFFDOW9xSXJZcmJrR3daVDFuZm02?=
 =?utf-8?B?b1VnNUg5SFZOV2Nlb01welNZaFdnb1BQTEVURUlNanhvcHh1Q3Z1WWV1c20x?=
 =?utf-8?B?RFpnU3NUTnAvbktxWUNmZXNoY0FaeWEzZUhzdFVYRDRldEl2L3NEejUxc1lP?=
 =?utf-8?B?MXg0bUR5aC8zamFDUndNdW9aWURIVGE2MlBYQmxWTFQzTUtpQi9lM2RoQUVz?=
 =?utf-8?B?V2IzemFwNzNWSjRKZ2FwaUJVYVU3ajEzWXBiOGRNaHF6K0EvcmxwdHZCNmlZ?=
 =?utf-8?B?SzgwSVhCSExGS091ZzkxV3ZDbERGMlBEVGxxMTVTWHhHb2s3bWVUem9xWTZr?=
 =?utf-8?B?R1d6SUJsVVhQTnZsVTExYWxtZ2F3djBudWQyZ2RIT3FjRmFWRDVJald1TEdq?=
 =?utf-8?B?MkxMT2xmT25XYmQ3QVhkYkF4aG5MaUhkS2dHMWhNcXhnczdobGZKVHU2VGJT?=
 =?utf-8?B?Qy9TZTN2ZU5BMSsyN2tqSHB2RzVZUGdZb1lpMHhPckd3bmZUK3piSFVnOE5z?=
 =?utf-8?B?c2U0T0Y3OEcyMGxZaGMzR0lGeHYxZzVSTkZMY0h4VlVBdjlITUdRbjJzMFQv?=
 =?utf-8?B?WXpnYmgvTUlmK3d2aUF4TEpTa2p2UWpTbXpGV0lHWjJLUG90b3VUbmRZNzdR?=
 =?utf-8?B?RUtLWGREajZ0ajhqb1VzbjB0S3F1b0prd28rN3Blam13TTBiU1AxclRDOVYy?=
 =?utf-8?B?NG5NZXlCRTNHa2ZNSXZmOUVDQ3MxK29hcnJuL2pOZ2tvazlLZHR6MXl1MU9B?=
 =?utf-8?B?eXh5eWkya214OTFzNktaOEFQblY2QzdDbGs0aHBQa1V1aFZWQ0V3NndsMFBU?=
 =?utf-8?Q?gejxCWgOXh7g91kSS8+nn7o+D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a53dc83-58cd-47a9-f366-08dc64efc8e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:20:21.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kyxm8WiDBI9gVLf9XYBarvawsj8xHoyH2MrvPqjKIOuDZmpHJpCN2HQpOO/1LJtY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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

Am 24.04.24 um 18:56 schrieb Friedrich Vock:
> When undoing evictions because of decreased memory pressure, it makes no
> sense to try evicting other buffers.

That duplicates some functionality.

If a driver doesn't want eviction to happen it just needs to mark the 
desired placements as non-evictable with the TTM_PL_FLAG_DESIRED flag.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>   include/drm/ttm/ttm_bo.h     | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 9a0efbf79316c..3b89fabc2f00a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -764,6 +764,8 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   			break;
>   		if (unlikely(ret != -ENOSPC))
>   			return ret;
> +		if (ctx->no_evict)
> +			return -ENOSPC;
>   		ret = ttm_mem_evict_first(bdev, man, place, ctx,
>   					  ticket);
>   		if (unlikely(ret != 0))
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 8a1a29c6fbc50..a8f21092403d6 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -192,6 +192,7 @@ struct ttm_operation_ctx {
>   	bool gfp_retry_mayfail;
>   	bool allow_res_evict;
>   	bool force_alloc;
> +	bool no_evict;
>   	struct dma_resv *resv;
>   	uint64_t bytes_moved;
>   };
> @@ -358,6 +359,7 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo_kmap_obj *map,
>   	return map->virtual;
>   }
>
> +
>   int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
>   		    struct ttm_operation_ctx *ctx);
>   int ttm_bo_validate(struct ttm_buffer_object *bo,
> --
> 2.44.0
>

