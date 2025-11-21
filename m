Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677BEC791F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C046110E86D;
	Fri, 21 Nov 2025 13:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hYHSGm8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB57210E86C;
 Fri, 21 Nov 2025 13:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeIVyIWV+/8Mv6i5gscQqRB5KckUEXukodxbhuJUujeWKKLzFKYLxMRiYP0WAWNoiCkrOD0tJo6i/i4yAdGqasOEXYGHwfVNKPX0Vwbb9uTI8uFiBEgyQR57bpK8yd68nlMrhvb1Dy7GRsflL0kMLVB/Wu65GEvCsWQUx2SBTdyZ2mIFh5A0vIjv5Z60pZ6McCUj+LTKxqCKNMUwl+bCEwJVmxzCaes3oS3ze7KcX4QavrFZVa3tuXzW4/Xgrdi1HbD3BC239ainLACcSWac43fQkpLYgnj2/Dr+CHSTMhSgeItSAsBZLOEg4l+zOGTxkVNWwimebIiAhYvuL7vpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKZ5+P27rqmkViU+fJ2S3arJo5tN/PCHDW70CHSOtiU=;
 b=mZH04uRmHTUs8NA2muYnUgaIqKw/Ygg5hyR2ZCCSXlpwYkNc3JNYtm7BaOH0JY7rPXHSldn4GFkqAbZfkUnuNPcSnxBSs064qc6eYIT2S6Un/pEY1K2QtDh7ISCVkvhs+Ec7FJeR93cXtIZ4iAI7mAishmelGySaQsFMry10Y2RQD+J93Bxeq4HUVjSBGTSNnt44xKaAY74qfGl51eg/TItXVYtR+MMWq0cpW7/UyxI5SdOJqSJ+c5jwPQbO1NPRBkmuQkcoCmntp+u+xhCEzVdb+Xqc9f/Bn5D97rgvM/xrixxMuDbAoxnZwwi9ra34CAEx44aVgyce/u07U/ZLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKZ5+P27rqmkViU+fJ2S3arJo5tN/PCHDW70CHSOtiU=;
 b=hYHSGm8Q7MkOZThAQqLIB1LoKqHLgbBXbKCfelTJv5eh5vHVNt/aFi5n0pUCKXscMc7IQA+hVbdM+edg969juDqCvJrloT1tqP8i3seSqt7WwRBPZGtcQ/3EFE3NWv7Sb7hvr+NkRdZogtzvf3UD8P3+DNCnTlYv3kZiW8GW8UY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4406.namprd12.prod.outlook.com (2603:10b6:208:268::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.13; Fri, 21 Nov
 2025 13:05:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:05:38 +0000
Message-ID: <d5399128-b518-4b4e-a1d4-15c28f00e99c@amd.com>
Date: Fri, 21 Nov 2025 14:05:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/28] drm/amdgpu: pass the entity to use to
 amdgpu_ttm_map_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-9-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-9-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: d60637d4-b73f-4531-925b-08de28feaac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEFQcHRnN0JxY2EyYWZFQWwxQVAvaE14a3NwT2dtclJYZGJvYWM5dzdaL2JZ?=
 =?utf-8?B?ODFlMUdPeDNNUHJXbW4xcXBlYU5zNHJlajVOeGdpZ2lGVUlQekwxK0ZuRnhr?=
 =?utf-8?B?V0J5cFZHODY5d0RTU2JZdjg3L2tsMUk4TVpmVjV4alNyTFVRWFdYNzdoYjRj?=
 =?utf-8?B?ZWtIbElxUXBBSlJCVlBCc3dvcHdkc0krQWVVaU1DK05LTllkbXNaSW5qdFZS?=
 =?utf-8?B?TTJualFkRWtERGp6UDMwOWlTWkZLOGdqRzVyeG9Db3BhSzRadUF0eU12eFc0?=
 =?utf-8?B?Mzh0Zm16cTBDSlRWZXlVL1FheHBIQVQyY2d1d2tGdTlMOTVFY0hyd3JnNmt3?=
 =?utf-8?B?eC8xOEFyem96dUNxTWs2VGVZTmZ3SXZZRXA4WTYzc2o2SExIUUlhVDJiYitZ?=
 =?utf-8?B?bm4rTGlvbCsybXhXYStzRThNRmgzSmZIV2FaUllCamZwWkViT2pnN0U0a251?=
 =?utf-8?B?WWt0emJHRThxT1BOYmRvZXVoZmlFdUtISy9aNmdFYVJLU3hBUHVlbUV3cEV2?=
 =?utf-8?B?b1l2N05GVzRWK2F0SXYyK0lsazVKRHlYUXA5bTFVdEg4TlZCelV1bGJ6Y0Fr?=
 =?utf-8?B?bGdyN0M4V0o2bjhaTERXYmtWbGE0U25QeUhOeUtGdEw5RmFtR1lkQXVLeERa?=
 =?utf-8?B?TlhUNFJDOG5KdlIwUGQ2Lzhlekg3emkvajg5WHk1bGVVbnp5bUJxcU5zUWVt?=
 =?utf-8?B?VE83cmtRbkoxbXhpVDdEU1lzOGJjRFJ0M2syQlhJSlFlcS9zRkYwcHlFSU0v?=
 =?utf-8?B?MFZsZTNqV1RvbFNpeWtITGlyd1ZjUGlGUXFnakZybkJ0VktERCtpOW52a09R?=
 =?utf-8?B?Qkw0aUlPWGFpOE83Yms5SXgrYnlQak9wZFdGbDJDNGkzTzVmSjNWNG1SQUxv?=
 =?utf-8?B?T1pnazJraG52bE5ycjdIakZMYlJEdGRRdXJlbkJxUUF5ZjBwMHRRcXJqdTFx?=
 =?utf-8?B?ekZwdmRqT0FZNUg0T2p1WmZZOXFZRmpJbVhPcmpkVVVEMGYwWk12TjliTDlI?=
 =?utf-8?B?K0FqRnVwR3JuQk9vRkFpRXJla0U5NmZDWDh6QTE4R2FIdnFLQ0lvZG5FZFlM?=
 =?utf-8?B?V1BLSGVxU1N4aWdqd3I3M0R5NlltMXU0UkN0NlVuc0FReTJuRDV0NXB4ZTBJ?=
 =?utf-8?B?bUNUWXBHaEF5Z1JUbEhkWDU5MlVubDJSVlFXYVBCL1pvMWJzZ0xNTjhlMkx4?=
 =?utf-8?B?M2JUV3dVODZGaUVXV3ZKbU82cm1ENXJId3dFN2pLRkRnbWpKRWQxc252M3hr?=
 =?utf-8?B?MWJzSWtEc3YvVCtpTXNia2ZJUXRJZGMwWmlYQXVBcHNqWGVkK0NpRXMxaHBT?=
 =?utf-8?B?Z0hRbEs1djE4d1BHWG4vWkp6YXg2dHNlbC9KNTZzbmsrYVRMaGN6SmU2aHh1?=
 =?utf-8?B?L0ZMUlFkYmZmQTZCTlNmc01HSUUwRE8xWWNUeFdlTzNKQ1BEVkV5S0R4elVC?=
 =?utf-8?B?b0tURkJPYThuZHdPdm00dmtjTUMwUHFXS1B4ZHo0S043RXVVaUl6S3Mva0Q3?=
 =?utf-8?B?QnA2NnRUZFZYSE9lV281aVFWNlpkQlNzeW5ZYmNKRUZnVjRLeXp4czFhZE1s?=
 =?utf-8?B?Zlhtcm51WnVOa0FhTlpJSU1IWFVyejVxc1lsUTNnV2xZd21MUmFHcjBrL0hB?=
 =?utf-8?B?Ny9iKzJMVFZ5ZmYwQXVQQnhwbk5nTmhnWU5McGlUbnNsOUFDUkt3MFIyTEVR?=
 =?utf-8?B?M0FqeGJVYzFtZEFSUTM5elIvNlNzUDRxTElweWtrSGdVcnlQdzZNaGMrNXhT?=
 =?utf-8?B?WkdkeTU1WTFGU283YkFySlUrVjVqK1g0SVBVb01ZR1N2cWphL2l2UHB4RUVU?=
 =?utf-8?B?WDl2QzRHYkRvVS9jTnl0L3hjZWlmL29CTUk0NHNUclIyTWNLcFNjYThtNmxZ?=
 =?utf-8?B?WmlmeTBIT3Y1ZDlGNHV3ZE9KQkM2N2tEY0lDb3kreVRSRWw0Zlp2VlM4aU14?=
 =?utf-8?Q?ZoEF/5ojbhGAtzaYi9xSDSB0cmsdOoxF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmM4OXFyQ0JqOTUrUTVibEFxb3dVMkV3b3NhcjdmdEdTS0RKVHhFRXZHeG1x?=
 =?utf-8?B?OWwzQkJqUWRSRWVQYitYNmEyVmMxUHNLZ0J1OXRLdzlia0plMFFxWmJPdG04?=
 =?utf-8?B?V3MxNjBBbjM0aUoxRDc0RGgrWnpkT09wZGNyUEdZaVZzWXE3ODU1YzVkS1l5?=
 =?utf-8?B?NkFVVFkrR0x4YTZXbW5ZRGU5RFBGTUNqa0NTVURZS2JoOHNDVXJuUWMrVFhh?=
 =?utf-8?B?UURFeFFBY1pTaC85dnJPY2Q1TXJoNCtoTzRHTklJSXJUSzk1b0pNcE9kcEx5?=
 =?utf-8?B?eDZLNXRqVXo1TzNlNmZ5YTRualpYRXh4OUdxdEdzYVY3clNRU3ZCc1hDdzVK?=
 =?utf-8?B?TmxEVEN5d2xzUi9HVnFIeHFEQVhaVUNvMGpqZUZ0RTBWV1RxR0FGM0RJSmk1?=
 =?utf-8?B?am93T3k4bkx4NzlySmdoMHNPRDYySkZHY0h4ZVA2emhWalc0ZFFSVmdqVHdQ?=
 =?utf-8?B?ZXpiQm93ck9ldnRTTEZGM1JLK0ZucDJaWWxWL1lGZm9mUUlkSXg2aUpIVG9W?=
 =?utf-8?B?RmF1eG5rY2dVeThkamp3R0F4NC9xcVVaZVJseDQvTzNFN0NrNmViZittYUlH?=
 =?utf-8?B?UTNMaVVtc3huTThST1lvWGdlME41b1VNYUx1cHhJT1QvcERFOS9WTm45VVpE?=
 =?utf-8?B?ZTU1NTNabjFSYU1RL3RKUjd6MTFKOFlQMlFFbGlhWUNPL25CbVE0eEpoNEJo?=
 =?utf-8?B?VGdHUHBtNGZZUG5XeVBSNnh0NVY2QzkwMHF5OGZYMVRoZWtYb3d4UGFDc0RR?=
 =?utf-8?B?RjRJdUkxREJqNFdIaGc3czRHaVllZS90dlNzTDI2NjhubDBmbkdPckR6Y1pN?=
 =?utf-8?B?aktMSkpZdGR3UVI1QnA5N3dobVJlYTZtak5mOHpldVdJOWVzb3hCSHorbXBE?=
 =?utf-8?B?RzRtbVdWVU5NZytBWk9BemFsRThRQ1VsY2QrK21pbHU5OEVmWkNpRm41MmU4?=
 =?utf-8?B?YVBQQ05rY3lYbHE5MTV5YXZ2OW1BanlFbSs2TzExYUlPZnFzUE13bE1kSE50?=
 =?utf-8?B?cVNPbGhDUEhIbzhyUSsweldrY0x4a3grWFpwekFhTFpNYkY5Y3ZQQ0hxbnpv?=
 =?utf-8?B?bGlTZGlHUUk4MStOWnduNjQyaWRiZzB0ZnNPUXJxTy96SVVzM0R0MHBFZlcx?=
 =?utf-8?B?VUU4UkI0Y1ZMN1lFTkRXSUJPRWh0bC90RXZoaitBQU9IR290TE9iTGx1UGh2?=
 =?utf-8?B?MGkzNm9NaExFcy8rWXFQL0tmbDVTZDNvU1dUWFNZakxlbTFIL0djUVRLWnFW?=
 =?utf-8?B?QnFrTWNxa2NSSXMyL0dBNTBtc1pOSzFZSUkrcFVMVVdGWEN5ZnMyTHcyejd6?=
 =?utf-8?B?aHhiVjJObFBEOGZxa0xvVkpCZGVRVkNJcFgwTXI1N3ZmZHk5V3IzZUxtanhq?=
 =?utf-8?B?Y2JxVVBqMmFOVDZlNncrVmpkVFdIZkVnS0prSEhNTXhDaSs5NUJjWUluVURz?=
 =?utf-8?B?L3pHS3NTT2JkY0dKYmdOK3FNNW9DNTRNYVBxL2tXeWRXSlZuOEJJOWhMV0ZV?=
 =?utf-8?B?SnUvWkR3V0F3aUV0OVhXSXZmRWdNWTZXWnR6TXVOR3JxQXMvSXBTdkxrdEll?=
 =?utf-8?B?d3ZEMjlTT3FvaU9qS1IxaGc5ajgzZXV4Zitka29aRXNLZUtZSXYzM25RNlV1?=
 =?utf-8?B?WkVWOVJSSGpJeXd3ZTdJSU1yM2FUM0R4T0NRclhHc3A1TFBaTUpWSmovbWg2?=
 =?utf-8?B?Z2VvYzJXWXRBRUhHTm84NFZiTUFHOXJRYzJKNkRBY2lvbERIeFAweFI0amVh?=
 =?utf-8?B?Z0xKNVErOEtIWk1kR1hweUsxRjRqb0tPM2ZQdms1ZHZVbVhxWnp6bTFGRFB6?=
 =?utf-8?B?bUkvNFZ5azI5QVZjWWFxYnorcTJIdHVBSE1qQkR0UDk2dXE0OVZZQnJteWJx?=
 =?utf-8?B?WjRTQWE3eEVVam9rbXc1RjJ1b3BtRWxVajAxVnd3TXlKcFdIRFRzK01GeU85?=
 =?utf-8?B?c3NLOE5wbGlHa3FMUS9aeUVqNzFvcUtsdzNlRWFlMytBa2tOSlB4d2JPQy8z?=
 =?utf-8?B?b0Qyby92ZkY3ckttbW9IVFhlZWJXRGhUbFV0QTVqSHNvRkdJSjZGR0g5ZUl0?=
 =?utf-8?B?TnZhUmtNOUNjT1pqM1RzbXhISFg3MkdNd0FWZERSc1NHT2libG82RE45cWZj?=
 =?utf-8?Q?eZlOtmlx1nvke9xkDwxQMF0Ey?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60637d4-b73f-4531-925b-08de28feaac7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:05:38.7096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ/gC3I87jI9p8IDHgptSmAbwnS9ePIORxv4jFBrP1OEtkfZObd+dC1vuqxl/Dtf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4406
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> This way the caller can select the one it wants to use.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 55 ++++++++++++++++---------
>  1 file changed, 35 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 353682c0e8f0..3d850893b97f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -177,6 +177,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
>  /**
>   * amdgpu_ttm_map_buffer - Map memory into the GART windows
>   * @adev: the device being used
> + * @entity: entity to run the window setup job
>   * @bo: buffer object to map
>   * @mem: memory object to map
>   * @mm_cur: range to map
> @@ -189,6 +190,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
>   * the physical address for local memory.
>   */
>  static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
> +				 struct amdgpu_ttm_buffer_entity *entity,
>  				 struct ttm_buffer_object *bo,
>  				 struct ttm_resource *mem,
>  				 struct amdgpu_res_cursor *mm_cur,
> @@ -235,7 +237,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
> +	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED, &job,
> @@ -275,6 +277,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  /**
>   * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
>   * @adev: amdgpu device
> + * @entity: entity to run the jobs
>   * @src: buffer/address where to read from
>   * @dst: buffer/address where to write to
>   * @size: number of bytes to copy
> @@ -289,6 +292,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>   */
>  __attribute__((nonnull))
>  static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> +				      struct amdgpu_ttm_buffer_entity *entity,
>  				      const struct amdgpu_copy_mem *src,
>  				      const struct amdgpu_copy_mem *dst,
>  				      uint64_t size, bool tmz,
> @@ -320,12 +324,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>  
>  		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(adev, src->bo, src->mem, &src_mm,
> +		r = amdgpu_ttm_map_buffer(adev, entity,
> +					  src->bo, src->mem, &src_mm,
>  					  0, tmz, &cur_size, &from);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_map_buffer(adev, dst->bo, dst->mem, &dst_mm,
> +		r = amdgpu_ttm_map_buffer(adev, entity,
> +					  dst->bo, dst->mem, &dst_mm,
>  					  1, tmz, &cur_size, &to);
>  		if (r)
>  			goto error;
> @@ -394,7 +400,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	src.offset = 0;
>  	dst.offset = 0;
>  
> -	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
> +	r = amdgpu_ttm_copy_mem_to_mem(adev,
> +				       &adev->mman.move_entity,
> +				       &src, &dst,
>  				       new_mem->size,
>  				       amdgpu_bo_encrypted(abo),
>  				       bo->base.resv, &fence);
> @@ -2220,17 +2228,16 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> +				  struct amdgpu_ttm_buffer_entity *entity,
>  				  unsigned int num_dw,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
> -				  bool delayed, u64 k_job_id)
> +				  u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>  	int r;
> -	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
> -						    &adev->mman.move_entity.base;
> -	r = amdgpu_job_alloc_with_ib(adev, entity,
> +	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, pool, job, k_job_id);
>  	if (r) {
> @@ -2275,8 +2282,8 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, num_dw,
> -				   resv, vm_needs_flush, &job, false,
> +	r = amdgpu_ttm_prepare_job(adev, &adev->mman.move_entity, num_dw,
> +				   resv, vm_needs_flush, &job,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
>  		goto error_free;
> @@ -2301,11 +2308,13 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  	return r;
>  }
>  
> -static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
> +static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
> +			       struct amdgpu_ttm_buffer_entity *entity,
> +			       uint32_t src_data,
>  			       uint64_t dst_addr, uint32_t byte_count,
>  			       struct dma_resv *resv,
>  			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed,
> +			       bool vm_needs_flush,
>  			       u64 k_job_id)
>  {
>  	unsigned int num_loops, num_dw;
> @@ -2317,8 +2326,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
>  	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
> -				   &job, delayed, k_job_id);
> +	r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
> +				   vm_needs_flush, &job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2379,13 +2388,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &cursor,
> +		r = amdgpu_ttm_map_buffer(adev, &adev->mman.clear_entity,
> +					  &bo->tbo, bo->tbo.resource, &cursor,
>  					  1, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> -		r = amdgpu_ttm_fill_mem(adev, 0, addr, size, resv,
> -					&next, true, true,
> +		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
> +					&next, true,
>  					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
>  			goto err;
> @@ -2409,10 +2419,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_ttm_buffer_entity *entity;
>  	struct dma_fence *fence = NULL;
>  	struct amdgpu_res_cursor dst;
>  	int r;
>  
> +	entity = delayed ? &adev->mman.clear_entity :
> +			   &adev->mman.move_entity;
> +
>  	if (!adev->mman.buffer_funcs_enabled) {
>  		dev_err(adev->dev,
>  			"Trying to clear memory with ring turned off.\n");
> @@ -2429,13 +2443,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &dst,
> +		r = amdgpu_ttm_map_buffer(adev, &adev->mman.default_entity,
> +					  &bo->tbo, bo->tbo.resource, &dst,
>  					  1, false, &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_fill_mem(adev, src_data, to, cur_size, resv,
> -					&next, true, delayed, k_job_id);
> +		r = amdgpu_ttm_fill_mem(adev, entity, src_data, to, cur_size, resv,
> +					&next, true, k_job_id);
>  		if (r)
>  			goto error;
>  

