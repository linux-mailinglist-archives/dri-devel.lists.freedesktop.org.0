Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C24ACDA63
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA5810E7A4;
	Wed,  4 Jun 2025 08:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aImXTgtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FA210E7A4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:58:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjWGux6i+wpUV0GPX0Lr7VKpmLQx+CL4drQGaNONTchHewDeULBssL+OTWm5YEXpGZEiIu4AYFJE/bvMKm3rWwDWmh4dq0UHoQLgLSfLebq6lv/jQFYveKtn0M2CKrjA7rUwU5112Z8Y/D5gLEjIRYuqswgvV64PLdXGAwf4zZVoYo6aBvzoOv872YxWyYozlGZnLxQcjaeGaFzrk0sZ5cbVRqRqxicihajFzOwOp1yS2bEura7Oh1vEnUgKrRU8G2n/j0WlNXbma53OhdAiPX2jtxdqpR+31/OYlKgWWzL8Pu1ejir9jCeFqiTUh6nwEDTrEqgWAhKo+KTSgKLgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmNDdksQU2xyMQPkLHheXs/lbTFRYeUUfhaq87FBLWw=;
 b=uiUyhz9kqr7JSMNFPO/rJn4Cpk4QWVsPXipkd7YQ80b1QqG/DlTt0HaUY7l2EQLjatvHTLsEJ3g5XOrhyStHh/rOS40MIVSz769525iS1bEd1Ezw5tKR5xewrvaBl9iHRLiW8JhLqVa5oLYrl7EnRitGWUbLTf9qGcoMrjY+XPs/DxbfSInRN4U7fx+KL8ygu4sGf2DucB8uJ4Vl3v9qgwjX/jH3nynF1NJF6y4vYAWELe0zXWFT1xWP0Rus4Fs3+ShFWNwHm3n0mjibzSpZsY+V+6AcTZg8rgD8g/5Evsa0NiZDhEV1HMTvkEnXhuBe4E2Kjc6MVSnfDyWELhugEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmNDdksQU2xyMQPkLHheXs/lbTFRYeUUfhaq87FBLWw=;
 b=aImXTgtDdlyCfTt3pOEszzBoah/3h6bzu/4l3n33niieM1AaQdyZIBrc5w6seDOJWB49AWi+bQbj4brBzXBzZgh2St1YPiRMPmvaftDUXJnhK8gmjtU23mzkEb5dO2OT4ZtfWRLVHtJBXTfTQakFSfBhgMrFwE5qv2YML6JeBz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 4 Jun
 2025 08:58:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 4 Jun 2025
 08:58:48 +0000
Message-ID: <65ca3be5-53c6-4d9a-a298-f744779d4fbf@amd.com>
Date: Wed, 4 Jun 2025 10:58:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: handle undefined printf arg evaluation order in
 debugfs
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20250603220901.1217161-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250603220901.1217161-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: f3720fae-0eca-49ae-b25c-08dda34604e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlp1RFJjRVpnaG12ZnQ2c3JydU10R2FtSjVaVnFSaU9GaVlkMkppMFRCSFBJ?=
 =?utf-8?B?dW1EdDg1U0l5b2ZGTC9uY2tLK3hpUWdhMFRtZmlIeHNEdWtQMHQxbExzbEda?=
 =?utf-8?B?bG1LR3g2Kzc1TGhScHZhTDI5VWYrQVUrbXNkRFp3d3laZnFPSm84d1pLK3RM?=
 =?utf-8?B?bmgxT1NMUG03VGpnS3FEQVBOTVhZclVTYllNdlBOL0UzZ3kvK3hUcHo0cXhF?=
 =?utf-8?B?WUtxWDhScUdaeUlQUFNIZEtlTElVUDNSOVdFc1drdVlxUDNVL3BHeWdTQmgw?=
 =?utf-8?B?VTlUcEdjeGMrSllwSjZiUC9ONlQ5UXJyQk8zbjZEOVdRcHB4NU9UN1BGZytG?=
 =?utf-8?B?eW1NTUlSd1RxV0NaeFRoa2NuT01zNzRuTytyOW5EU3BxUVp5VzlldlpyMVVF?=
 =?utf-8?B?S1BkdjhhYW9NdU14SzRWRW9kMlJUWFNBR01NUjh3Qk5DQkp0czROSzYvN1Y2?=
 =?utf-8?B?dlFMdFE3dFY5UE0xdHVxeG5Ld1phMW5zRGJacHNJQ1dzR2JGNlNma2YvUTd2?=
 =?utf-8?B?cE1wd3ltNmx1Q3l0MjRUSHRBUzROdzNZZ1dkUWVoNWFQQ1pNZ3RyWUk3TFNs?=
 =?utf-8?B?VDNhdEk3TUhjQlJpaFNnL0tIL29rUG9oNTFrOFNlMlhxSFNPMUwxdEtrVFdL?=
 =?utf-8?B?WlIvb2FPckFETFcyb3NCSHJMYUlsWHkwc1hhcnFCR1crTWcyalZGaHJkSGh6?=
 =?utf-8?B?Z3ZpaHFHL0xsNFVQcng0R2MwMGQ1YURFZDEzMVc2MDJRTDN2UjhVYmJxbzFK?=
 =?utf-8?B?TW9hZFE3SFRsUnFySnlNRDBYdUh1T2JnVXFIMk4xd0xPbnd6TlhXdVYxV21L?=
 =?utf-8?B?M2I0NERQWEh5L3B5TFkwbTlVeXJrZmY4ekV5d3RaVVArSmJhd2NGdGhvak84?=
 =?utf-8?B?SnlSUTVzRDhTRWEzdmdkaDNIalFCUGQ1d2tTc3hMUUNHYmM5eEtWSll1UklR?=
 =?utf-8?B?Z0x0cXhMZ0prSkdOVUc2TVlwc0wwdDZ2T2c5M0R1VkN2SkNzUWxjeHFoM3lk?=
 =?utf-8?B?YkFnYXpuditOQTdCREZ1NUFKcDlJclJ4UU03dFZkeHBneVlHSUlEQ1ZES1Fj?=
 =?utf-8?B?cWFnU015OUNQbFhOS0RaL2RmT0NSQzhONmppdnUvY05rcm9YVlJNM2xmMGpV?=
 =?utf-8?B?VWVOMktNVHhCTEFmUS85YkdxR2hvOXl4WVhIckNobWFTMTRPME84c3VrbEgw?=
 =?utf-8?B?M2VDekc0UnpsZEU1SlZkREtmUU5XTjkwbG1nc0I4UXViR2dzbm9kL1Q2VDJP?=
 =?utf-8?B?NjNsekdWMVVOZ1UzZng0TWhIQk9RM1BtVVE2clltVFp5S01iYVYrbXg4UUdz?=
 =?utf-8?B?eGVGZnhmOEpQdTNtbmdrUmFoTjNuNWVDNU1XbUNNdU5RZjRaL3dWbUFNai9W?=
 =?utf-8?B?UndUQy9QRGtXa0FCQUlBVmhxaVYxcG5UYUw1TXFOc0pMMUQ1YXZBd1Qwdmd5?=
 =?utf-8?B?VmVMNHlWckI4YnNDRXpHb3lzYkxkY1Q0SlFpNTgrVDM1OG9hWEFOTXdLUXdJ?=
 =?utf-8?B?eUlEbm9CWUloYTVHaEhtUDFDaDVib3VEWkhzOEFmZURPcUV4b2RKRTY4TjVj?=
 =?utf-8?B?ZGltUm41Q0J6eTBiRDJXZy9xc1JZeG1CaGtQZThSWnBvWGhkVEpaSWY5Z2xM?=
 =?utf-8?B?Vmh0WFp5RFRpYm1zaWYyMFc1ek1Yc1c1S2crNmJNWWkzWExPbVU5TkMwSUsr?=
 =?utf-8?B?QXJWK21vY2ttVFMvQUs1UTBRaE8rd2VnbG9LMGpaUmt2b002aXNQNkE5ZnQ3?=
 =?utf-8?B?QU9jbTdxMnNJeDNxbVBRZXJ4SnFlQVJJK05zYTBHaHhIOFZPMm84b2VXVkFi?=
 =?utf-8?B?VHI4V1FuZ2ZMUjl0YUtxc1lRSmZXTGZNOTVwTHpvSE5rdW16YjNYeFhKN3gr?=
 =?utf-8?B?R1FoQzg2Q0FMNHdGaWJCdFBaanhVdE5RenFKMzJ1bDgwSUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1c5ZE9iREJmdDdycHU4bzF4MldiQkplQ1h4OStKQk1rUUp5Z2FsSVlpcTdj?=
 =?utf-8?B?VjFqUjMvWEJBckVOaUxjNWsxYzNUU05rY1BobDhFNGJSNWJJL2FZVFRTdHF1?=
 =?utf-8?B?MkJBQURCZ2FUR0oybzFuQkJVRVVWd25FaTFGYXkvMFVSd2VVRVNkYmJzbExG?=
 =?utf-8?B?cGxaOEdidXZlbFR5UVQ2OTN3eWY3Z3F2djZzMW5wNkc4UVAzTlB5REhoZlln?=
 =?utf-8?B?WEgvOUh2WCtiNXQyWnhkUE9QTlJNcnBlQ3lVckw5b1UrZVZrRHNnNFFtd3Jh?=
 =?utf-8?B?a2tSbExPTmdublZGM2pNeXlyWnR2dEZ1eit0Z1ZXekcxT1ZLZUxxc3hXb1pt?=
 =?utf-8?B?SzZvUy9qOHRMWFl6SjRiU0RiY1FpaHRMd0EzRzJacXpIYlhSNjJoakhzaWhK?=
 =?utf-8?B?V0dXQkc1ZVlGaXNhYUVod3FkOVBCR083TVdsNVFKb0Rrb2VtcjlhM2xCRkJq?=
 =?utf-8?B?MXN3YkR2KzJUTU52STI2MVdrUEx0dkkyWUpSS2pVUDgzcHFMNGhXWU1PVG16?=
 =?utf-8?B?dElQZ3FLQnlLbm5SS3hITjNiVndnRHVoaFhxL3dRa3lCUm9Cb2Z6REcxVyt1?=
 =?utf-8?B?SlJiNGcvenZTWEFnM1VvOFo1S1NZR0RsT1RvSVJkK1QvS1hHRS83b3hFekFK?=
 =?utf-8?B?dTBxanVYNnBVVlVITEdmZ1h2UGlOMExVeDRyVWhSZWxWays4SzhsaXA1eUVq?=
 =?utf-8?B?OGJqQTBDUzFZajNsMjRadDRoMnJXL1ZVR05TamFaS205bjFRZE1nS2RPRnFD?=
 =?utf-8?B?Zk9seWdjZm94NzZKRFVpYlVNTVMrY2lvYzJ5VjJzY0xyQy9mTlg4RHlTRGVC?=
 =?utf-8?B?ZWhyWVBscS9WZktTNys5dWdEekpSQ2FWZ0J3V2V1N1k3Z2dXd0tHSlJNWnhN?=
 =?utf-8?B?eDdhZm14cUVFU04vWUFScllTdFUwbmc2ZUFNTjFKdjVGRUdPaFNuTmlxWGpY?=
 =?utf-8?B?Q2ljcnlXaWlydi9MYXBhL08vMG1jKzBZdlhvanZjMGxROE9LNy9jT0ZUdCth?=
 =?utf-8?B?UndDbFMyWWFxaXYrZGlidVVtbWIvakM3NkdnN1RLQjFQN2VEbVA5QzhIN0NZ?=
 =?utf-8?B?ajhmZ1h3bE1IZGdQaXBGYTJndGFhOFU4cXpFZU9aSUlVaXdvclhHWFBmZmEr?=
 =?utf-8?B?SmtIeDUySEgyRkQ2SjFxaXhOSDd5a1NuKzFaNU1CN3FYcUFtNUFyZzJLL3pz?=
 =?utf-8?B?alZ3MUd0WWdHc3dvRnE5bzFnYkVOcHNLMEtERzFTQVc0TDFSV0NkSTF0S1lQ?=
 =?utf-8?B?RmhTQmpsTE9ROHVDNExBYmE3NVZnbjNxbHlQQmdTOUMyc3lISzEzbW1RNi82?=
 =?utf-8?B?K2VFU3o5dENQdk8reDU4UDB3cm9QSXlkRTRtT2VZMUlQV3lLdkdVKzZpY09k?=
 =?utf-8?B?SzU2TWRLRUhubTgzZWVRaWJ2MEtxUWhPQzFtR04yS2tVSmpFSkxCMTR4eEZ5?=
 =?utf-8?B?Z1Bqd3pua05HWjhnNUd0WGx4azZrb2czOER4VytnMFNIdzQwUEV4bXlIdzdr?=
 =?utf-8?B?bUhLZk1zRm1ybzVzK2FNSTl5UE9ibUVVeXVQV1IyVU5HbElVLzBycWhtNXdt?=
 =?utf-8?B?TlBrQ05VWWNqVk51K1JaVDJ4YUtSSGhuQUs0MzQvOS90UTFxNWJPZ285SzVI?=
 =?utf-8?B?RGpxTzNpRGRMYXJBV0h0S3Vkd0poREZwbGJMRHNGRjVZMVJxMC9MMFc4VWhn?=
 =?utf-8?B?amZXKzdsQ3czcGdJMnFBcW9kckJ3MG94TnVqMWJyaWlTM3ZCNWxlN0JlZmoz?=
 =?utf-8?B?cmUxSUJwYWQ2dG1mTVdhTjdWb3BzZTRqa1hyNGpybmxVYUN0eWRmYVZXdUpi?=
 =?utf-8?B?QUxSaCtLV2ZReFZYeEFVcEp2M2l5OUEyRkNJZTBwYTQrNUlKOUk4ZS9nZmFU?=
 =?utf-8?B?MjV4UzgwdmQ1VUlrczhEbkZCZGk2b1lpcXRWeHVscjk1RUpkUjJ2ZmRMT29I?=
 =?utf-8?B?Y3QwSHd0cWVQOCtrY0VGbjEyakJjK0dGK2w4NFdSZjFZempUdFRLVFpIbnQ1?=
 =?utf-8?B?c3FobUNKS0lodVZLSWVoQWhzZU1OT1hGT2Vxc1BKNVlsaTlIT3BPNEJpRDNQ?=
 =?utf-8?B?SG9GdUNDTjNDdk5aOGg5OTZJZlcyS1ZudFNQZDVhRmlvV1ZyeW9VVERwUkNs?=
 =?utf-8?Q?g0IqOoMxUXXWWpU58Yq9SMoMv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3720fae-0eca-49ae-b25c-08dda34604e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:58:48.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xIPgByVh4niKUb0n4zNeWdDd+tIs3yg5xYLxP0UV2vSc4te7zgTooqqrKnGvKuM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130
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

On 6/4/25 00:09, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> When you read this debugfs file it's isn't guaranteed the count
> will happen before the scan, but I think the intent is that it does.
> 
> printf argument evaluation order is undefined.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 4b16946d3248..14f5aee69ee5 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1280,9 +1280,11 @@ static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  		.gfp_mask = GFP_NOFS,
>  		.nr_to_scan = TTM_SHRINKER_BATCH,
>  	};
> +	unsigned long count;
>  
>  	fs_reclaim_acquire(GFP_KERNEL);
> -	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
> +	count = ttm_pool_shrinker_count(mm_shrinker, &sc),
> +	seq_printf(m, "%lu/%lu\n", count,
>  		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
>  	fs_reclaim_release(GFP_KERNEL);
>  

