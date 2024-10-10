Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292C69987BC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92D10E0B6;
	Thu, 10 Oct 2024 13:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xPmcEznn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94DE10E0B6;
 Thu, 10 Oct 2024 13:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZuLHU/b+IZGXYRzP+M1zWMt5+Md/mBetqJ1fBmGXXp34YsS8SLAXNycRdLYVxKSIX0eK2JUJv1o3EodsQNoRNwy1SKooxEAGzV4/UhNTxByFQQzy17PFUS7/HIZvWPH1Iotfe2D68Evx9UY2B21NVv0meqHSsLVoFJ4trln7/eR33UFNjvcNMKzmNBNptVFXzhDJ7RUI7xTaN078567SW1ehoZ9kEppyqkVMzeHMnHgXdVNmJC99Ev1t1qk+ItJ0VezY7ATR8Y5s7DEkFUYoHCPYG3O7JAqXK0Wtsy+c862WAT3Pw+k6wJH3RlCfebhLgb0VgygvoZJNuzYnn+LpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0/DMiHsFvm4Nsi5ObybOhlPWLWoq31fWwZSptsGQM0=;
 b=UGZ0jqoC893Em1jlpKkh+zvwifMqjMbxrnCPIIjbKb4c3LtU6DimPqjnMe6+0xFcTxicLG4F8bqsCcsF0rN9qHobghVACMlWdZKpx01GhqXTCQd7xq/TUIRn77oF/ECTZjQb0/cs2wxismTxKFDA9o+GqYDUL7avApAVuqkQygyIskO/wTI3mrxQIYjBrWneH+VyR9EY7e9rG2uRNccMdn97GTYnKxYCaj822NAKOaK7NMMc859NRhdlyJsY2rfqA6ZY9HZSw55aCGuvWM+RlegpHYIqa/Ukbl0qJyAhlocLqnmOKIPOaYoI5ERPDyz4r7QTLLzxyxNRigxMIt0pWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0/DMiHsFvm4Nsi5ObybOhlPWLWoq31fWwZSptsGQM0=;
 b=xPmcEznnf16eVDeHqdgFJ2DeUj4Bx74xs32cVxBVvgeDdD8nhOv/E0cqH/w82ZNHd3xn92szbP9rgFTm6osibvDms42Qp4duzkIEd3nhPstGUc/WbppGsVsJidTmqf/Y9srFwZLXIr7nXtcxFmX7MPdeoXj+cChn7VQs4lypXos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 13:30:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 13:30:44 +0000
Message-ID: <a975f84c-f74b-4825-8111-0c883cc709e0@amd.com>
Date: Thu, 10 Oct 2024 15:30:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amdgpu: Fix potential integer overflow on shift
 of a int
To: Colin Ian King <colin.i.king@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Leo Liu <leo.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241010112204.636188-1-colin.i.king@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241010112204.636188-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0395.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b2bc8e-89b3-43ce-8ae9-08dce92fbe1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTJzcGZTTkN2N1FqMS95dWxwR3FxUmw2dUlrVmVKak5aV3gzVWJuOWo1RUEz?=
 =?utf-8?B?RmRLdnBubElLTGlvbnhTTTZsbkJRczlDWlhoQ0MrZHMzK1FKOVBtbTdpOEdr?=
 =?utf-8?B?Q3JzRHlENGkrSEFXSmplTnR6eHE5YlFGUEFLaHEweHlwNkRIR2lxMFpZbEx5?=
 =?utf-8?B?L041ajJtS2ZxL2NqRGxhWWJRRHNzbW1ZaGUxZjZjTXFTa0JwbE5JZDQ3ZFZ4?=
 =?utf-8?B?dldickFUdWdDbEFRb1pGTys3SlVQRTQ3VGxCdUxCUGZOek5QaE85MFNNcy9O?=
 =?utf-8?B?anQ3VE1FTjNuZkpueWE4MG4rYXpMdDFvUmgydnkwTFBZd1c4dGVDcCtkbDhm?=
 =?utf-8?B?SVFyb1p5aC94R2ZJeUJ1SmRPeVhxa2xoQ2xUdlVrSlgyQVRqYnRzVXpNQWhw?=
 =?utf-8?B?TVlBQ2x2SS9OVEVWYVZtWktMYXAwcE9OVWVHT1VrWDBERGlicC9HcERmQVph?=
 =?utf-8?B?bVQxanI2aGtZSXVPQkpHU3ZvVVdEbm43Yy9nYXA0Ykw2U0NkVXJlRWtOOHE1?=
 =?utf-8?B?M09lMTVsN0hwYUxidUVoanNRalRpSThxbVRlMzlaODZzRjlGZkw0NHJNeW0x?=
 =?utf-8?B?ck40UU5XL09BQkdVRDMwRFFQMDc5QVF4VDYvcVE2ZlRMU04xNTRHNEorUTAz?=
 =?utf-8?B?Q215WE9tbjdjRDlkbWx1RllOSGduT0pibVJpazFQazZKYm5jQXRPbXFiWXBu?=
 =?utf-8?B?U3BySGhSd1BnRHdiNVN4YzdncnM1Mm45Z0doMURMNTVQR0I4a1JNTG1jRFI0?=
 =?utf-8?B?d3lYZVRVMWVqd1lvaERWazRCRUh3S3hpUjR5ZExDZWR4VUhUQWVOV1h1NXh3?=
 =?utf-8?B?ZHRvU3l2dllSdDBmOWVYSHJRRm4xeUE5dENGK29MNWhTNFk0WDFEd2lId0dz?=
 =?utf-8?B?WVBtd2J5Z3dlc0J2d0hRdmlod3Q1eXN6SzZOQVlBY2creE1qZFYrOUxTWG1P?=
 =?utf-8?B?S09JMzRmTUUrSnpOdkF0UWZpK1lzcG9FcHJoWHBiQkQ1dmRlWG9hR3hxTzkv?=
 =?utf-8?B?TEJ1RUovcFAvYWl0UHpxWGxRRFp5SlBFZ0JpTko3ODczU1BrVkZ2citpMjhH?=
 =?utf-8?B?NGpyWWY0UjYwZi9pZFNBdHk5Vm4xOWNHclVpRU83UDZObDN2VVZHZExMVGpI?=
 =?utf-8?B?Qk50UTcrUlZ4SUh5S3ZHMUQyOGtEeUwveVo5Q1pEOHpnM1h5TDdBYW5DOXJ0?=
 =?utf-8?B?clJrSmVFUVllQnZJdWsweEF0RzA1amF5R3lMK2xaSUNwVGs5MmY1NEJjeVFR?=
 =?utf-8?B?MWpmUlBDQUIwU24yUWpWK0RpRjFBN2JUQUliZmh4cmNhdFVlUlFzRkt3enl3?=
 =?utf-8?B?UEpIb3E5RGpaQVl5K3RFeTlSR2xnZStWaG41N0ozQ1ZScXo0QTlibFpNSTNh?=
 =?utf-8?B?UmovRlUvNFFoN0FvZmdzdis1ZkRkMFRkK082UUxZeEhHYS9lR2p3Q2xVTFJE?=
 =?utf-8?B?aXA1OWpjaDlmL0tIdVpFWWRnYnZDdXZPTzJiWW5GRlJKcUFvR0lxQVdZckcv?=
 =?utf-8?B?MTk4QjVTWXQ4c25sTlljU0o2WDJ6cDVobXFmczlOMENKdDJmMUYwWHR2SnBn?=
 =?utf-8?B?V0JsU0VEWEVVbVBqV3czWXVzVEJEaTl2ZE0vcmM1RnZTUEU2NEtXUzB4amJn?=
 =?utf-8?B?dERPQzV6RXkzbUMwTUFoaWdsTGE4U1BiSUNXa0NTRmxid2lRZVZWZVlVODV4?=
 =?utf-8?B?TmdWcEpkR1hXMG52cUk0WThCc2hLZU9ub2FrOW9INVNKZHd4Y0FDTVRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnNRZGNsbWRnaE9zNzBiWUhIanZsTTVGMFhuL0JEK0VtT3VWT2FOa3QyYVVN?=
 =?utf-8?B?OHQxODVabjJscThXeFpWcG11eXVpY05Nbm9ydHZuTUJkeUxtM1hUemY4MHNQ?=
 =?utf-8?B?YjBPMXNpZUp5bTdvTWhLcFJqbVBoMUpMZ1NnTUhXdDBOaDBpNEgvQnFsbWM5?=
 =?utf-8?B?TEdRQVdqWDM0anZuUDJOSFpoNDZqM3JIRUV1czdGM0NvOTY4eklxR0FRQjBT?=
 =?utf-8?B?UlMrN2g0dGNMazlsN01sMnYvaUpOMU5XNTJtY0FMZUM0SURoanhnNDJIa2wv?=
 =?utf-8?B?Snl3N0RDZ3kzZy9IOTF6Wk8zbllFUVhwOEw2NG1rUzhONlhpdHBvRVJTcjkr?=
 =?utf-8?B?SDhlajZEKzR5eEhxV2Vtd05MYnI3RlgvRU96ZHFqSENqSXdaNTExdjNrSUht?=
 =?utf-8?B?YVRtQUdDcVhBdGhWTUZlMHROWk81Z3g2em1uQ0Fzb25NVGJOcUg4YkVPR2x3?=
 =?utf-8?B?aXV4UjVqZWJzVTJzb0ZqUEpmaHpqV2JYRjFkWlpBV2ZmU0J6dmg2aStGM3Uv?=
 =?utf-8?B?NmUrRTdjNUlpYTNyRGdHU3ByZ2FMbjkrZDJlQXBSREhrZDU1MVBFQ25LUDZw?=
 =?utf-8?B?cm1IOHJCbEs1VFptR0RpclgzSmV3RnpOdWhvajQ2NnBOTW53MmE2SDlMZWZj?=
 =?utf-8?B?ZGczS2Fxb1lXQ2dlOWJpVzhCZ2YxRmlpQWNKL2hKOHo1cHFCWXBiWHVZNmhU?=
 =?utf-8?B?eGlzZCszNGhpR1hzVWs4akhFTlEzNWJYRTNmeC8zblZtc2hsMEpxZjFtRDdD?=
 =?utf-8?B?MFkxQmxHUTlSdyt2dHViUWdZb0lEajJMZnY2ai81bDJnYkFEbXRrMEIyNVVC?=
 =?utf-8?B?S04xeVBzNU8xd0QrZEp2OFFPVXVZRklNZWRwMnR4cndSSnF5SjcvVGdINXU4?=
 =?utf-8?B?N1EyeXBiazA4YTdiV0FDUWhTZVRPRjZ2U1BTdGxyOW84a3R4MDM2MWlPaGNS?=
 =?utf-8?B?QU5hRkpEYlB3US9hRTZ0MFdSUWNSQ2FxckhpSU9SWnBia0RIMGVEeExwTVRh?=
 =?utf-8?B?c29BNU5vVE1qcHBnQVlUWWttVWFJVzU0SGI3bFF0bEx5b0pBMGk3ZUZ5eURG?=
 =?utf-8?B?M3dKVVBaK3ovN0RDalBqK1hoY25YcmcvNHlxUFE5SDlQQXJrWnJnL3pnbXRt?=
 =?utf-8?B?d1RnWEl5NzdlR2VwdTJldHpNT01vYTdCZG1KSjA2TWw4ZVowZG5TWGdOM1g3?=
 =?utf-8?B?U0FCRWJURkdpaExiaFhuVFlzYnkyM3l5cFUyOUFJSFdycmNpaU5nckVwbFp1?=
 =?utf-8?B?MjRHV2hNY1RsL1lmTWVudVRPNTZVaGR1S3U4Tmt3WldJWHFMWERNYzl3NlUv?=
 =?utf-8?B?T0VzYjVMSml5RERqOEo0TDFGaCttVmVoTW1SSk5xQTV2Y1JWbzUva3A5Zndx?=
 =?utf-8?B?b3dpNTlLQWc2Q3JTSzVHUGRIZ3Z1dHlkNHI4bEZDZVFpZG91bWtiVmJPNlVp?=
 =?utf-8?B?eEJJUExwdGZ3RW1DNUJmcmgvMFRKSFVoekVlbXBtNnNQd0RwYnJkMWl6bk4x?=
 =?utf-8?B?eXU1Y241QzFGa2JJR3YxcEZNMjVxZzhON21iZ21oYnViRnhCYjcrR2paNnFm?=
 =?utf-8?B?eDk0Q2ZvRHJyemt5SUU1QzdubE5WY0V5VElQazR0OHd6MVk5ZXptQ1dXNDBG?=
 =?utf-8?B?SXZydEY0a0RueE1Qamo2UENuaWtYUTAzVkpUNmdhQVU5TEcyRzhUZEQxNlRp?=
 =?utf-8?B?M1JQWHo3ZkFjT0RSeXd4T2lyUFE0ZlVRclJJbk0vWG9keGxCZXRWM3c3V05r?=
 =?utf-8?B?Tk1pV1o2ZXoyRnBXdEttTkJ3SGxUVHNFOW9Zdk9hbkZjbUQ3ajB3SmNOTW51?=
 =?utf-8?B?Ynd4MFR0KzQ1MU9LdFowOXRhTXNCa1hQTEk1bHFoSlJ0UTI1a0pWOTViRFhM?=
 =?utf-8?B?OWt1WElYZkNIR0ZjaHZNSStvdFhXM0xGdUttcWxBWE1KeGJPZG1pVUN3SXhY?=
 =?utf-8?B?Z0pqdG9xVEpxbUhsQmRYM3lsc2pQMkk3aWRWR1JCLzFvNEZKRFdXaGI1aytM?=
 =?utf-8?B?cHAzcjZFNnRyUmloWVc2UlJOWWxucTFxMHdPTXY3djhFTEJ2MENGaFpxY3Av?=
 =?utf-8?B?OU94MnZOM0tPbVpDbjBpeXFyTFlKcE9vU2xIR0hrclFMUjVPTTR5SG4rZjF3?=
 =?utf-8?Q?wg1agra4GEtWWtJnV5WDiIrlF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b2bc8e-89b3-43ce-8ae9-08dce92fbe1e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 13:30:44.5033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skBATaU5wFeimebryiATcn6w3waWYPUaa87PL2zg1MbaK1EpywLdG83+s76OORGV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246
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

Am 10.10.24 um 13:22 schrieb Colin Ian King:
> The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
> arithmetic and then assigned to and operated upon using a 64 bit unsigned
> integer. In the case where the shift is 32 or more this can lead to an
> overflow. Avoid this by shifting using the BIT_ULL macro instead.

Advait Dhamorikar already came up with a similar patch which also cleans 
up some other occasions.

Regards,
Christian.

>
> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 95e2796919fc..136a0c8d8c7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -357,14 +357,14 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
>   	if (!adev)
>   		return -ENODEV;
>   
> -	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
> +	mask = (BIT_ULL(adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
>   	if ((val & mask) == 0)
>   		return -EINVAL;
>   
>   	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
>   		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>   			ring = &adev->jpeg.inst[i].ring_dec[j];
> -			if (val & (1 << ((i * adev->jpeg.num_jpeg_rings) + j)))
> +			if (val & BIT_ULL((i * adev->jpeg.num_jpeg_rings) + j))
>   				ring->sched.ready = true;
>   			else
>   				ring->sched.ready = false;
> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>   		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>   			ring = &adev->jpeg.inst[i].ring_dec[j];
>   			if (ring->sched.ready)
> -				mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> +				mask |= BIT_ULL((i * adev->jpeg.num_jpeg_rings) + j);
>   		}
>   	}
>   	*val = mask;

