Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7EC9B550
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C913A10E00A;
	Tue,  2 Dec 2025 11:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qfz6D4BM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D91C10E00A;
 Tue,  2 Dec 2025 11:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWjqKaygsWJY2e6qW5Yt9WcwM/rOIMcO7pmvad0NbJ/vFY2ln1o9FsQr+hGSETQL/H0H/6mm6odPoRfONgdpLOY1YUdrA5XW1wWRb1rtPmWzBhpXuZz/t7dVReh96lN6tqBCsZoaYIShLyH30xb+jQx2ZIEDhuXZL6AiKpJFQ4b2v99xxk0ht89ATjVv5qccUxTvdjKTjUOXJ+WLzWFuWpefvN1NY58zY3F5arYpmRc8sEu7GRQ8OfaotV5i8tU+E+o5Zy70tVo9U5j6iC+oKYJh0abIzEPg3YOo0pEenPVMwSHK51oCCCI3v0YE3PnZfwa7lNgZcIfrDT84xcCt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWl3Y4K6TOJss2n2CvTvx5Nj8cqC37d13iKUeFo18lk=;
 b=bcQzdzZy4JRB8/6qpNPm9r6RkdrUrWbjfCabCMSxuVUUHwnnBUMDd5bmWcBN7QaATO5o9r4l92IJQEBeHiS3Q+bLJ30eju931qW1wwLFRWcJDI49huqdp5KTJcAH9XtLkVnU8VGPmFq2YkULl0o4UqjsRD9uNlp873xEmX+XFhsmVPI+0BIhTZyIIfqgggncGyo0hDliZ40YqBiRtHfS4/DN3kUcNZuAtK5lV38xDEOaa/3IFnHX7REtEx9Q6wqCrxP0bCpS7ka9v/0S12BWZ9Zfgq5GO1zmAbNcMNa+Esn0VxMm9cB24gNKaRbIXoRfj7eZSiPwriIjeCHzBno2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWl3Y4K6TOJss2n2CvTvx5Nj8cqC37d13iKUeFo18lk=;
 b=Qfz6D4BMSHJxkcimgek5uqqcBdjpUc26o505iybS7KiV9r1aHy269YqOi9Vj+35F/KXJWO8ieZEBglhnf8Fel0VXB1SgtPJTnoTKZgWFvRw5hlZJFaktwCbUrC64YON9OvjyGCS36xXn4ipr3yvUuy0xc41FErHktYV/u3CJHIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:43:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 11:43:08 +0000
Message-ID: <95448a54-d471-4c6d-a940-0fa590d358a9@amd.com>
Date: Tue, 2 Dec 2025 12:43:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] drm/amdgpu: fix error handling in
 amdgpu_copy_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
 <20251202094738.15614-4-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251202094738.15614-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1795f0-8a8c-4436-9d1a-08de3197f6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2FDY2hmZ21RQXR3TDcvaGdoaDBtN25WUll4a1dqZU5PNURCVFkwK2pOaXgy?=
 =?utf-8?B?blpsYzdxUG8zZ2p4T1YrRGFaOWlMNXJjTHJZZmNOR3F1eHN6STlPVElPbFJY?=
 =?utf-8?B?eTNQakZMcitGVUlWL1F2eklzczhLb2kzYy9INHRqRkVPU2JqS3VCaXRUUUpj?=
 =?utf-8?B?WG42dWxMK3ZDR01NMmdsRy9vaG9lSWFzSXZoN09lejB0QWFvSnZoOFBmS0kx?=
 =?utf-8?B?dXNKSGwySUVmeEgwcnRKenBOdUlnRjY3U3gwckc5V2pCaEZCSnBDMzZVaEpk?=
 =?utf-8?B?eWRIR2lTTjd6SUFHLzViRmpxRXVPaW5HMzhrWHNpMk5ocHZQOWhYZmJwQVhI?=
 =?utf-8?B?TTVWeTM2NDV3Ulh6V1RGemY2Qm16YUdNd3hOcTc1Wnp4WGdiaEhBbjY2Nkxt?=
 =?utf-8?B?V2dDTW9oVnVnVHRoVlRnblBQcWRENkRzTzBsQmxVOXVjMVR2QWRHVlJ6Q0RI?=
 =?utf-8?B?c1o0T0Jzbk1YNGVzV0c3VjF6WWZOUnRkZEVEdUV2bGd1dWlwY1EybGRIVVo4?=
 =?utf-8?B?bkpkTGV4UWpJa25xeGRrRzNuZVJDMUhTZHUvUmY3dkRORkRROTdCSitEMUJy?=
 =?utf-8?B?ZmFreFpzVkx2b0g0U2VGQ1lKWjNlcEVQUkxuUldGSVpZZWE3ZUlwU3dGaXpu?=
 =?utf-8?B?UW1ONVJIWExqTzVNcUxHRndPU0VWcytkck1BTDFYYmVhYWd3b3lYbkMrZUJZ?=
 =?utf-8?B?NjhQWjloV3NPRDlTbzhpQXA5aHprWFdTNFhLRmlUZklSZE94V2l1eTMxM1VR?=
 =?utf-8?B?TVhXVGlCaU5hRkZJd3VhZjNPNlBCK04vVE03K2dXSDlFUUJENUdnSWxxY1ly?=
 =?utf-8?B?MlJ6aUdDQjhMNGlYUnFWMGJYVURYRWZrY3lnUkt1TTdaVXA3eXhBNGRBVDI0?=
 =?utf-8?B?U2Jhb2M2TXRHY3Z2eEN4ZDhEdWRCVW5jNkhhSkNvY2FMTnRUL3R5MmxVQThQ?=
 =?utf-8?B?cGM5QXJOQzdVZm0zV2x0TVJ3QnBCUDZRRFB6Q3lxbXFncjZCdkQzajRCRDJK?=
 =?utf-8?B?NXN2ZmwvbExISjV0WU1GTjdQZngzL0hwL08vWW1BWSsxbmNyMW43NWtLb0NU?=
 =?utf-8?B?bzRBNkFVcjl2bmZSbnNTdFdjS0VNNTFBMVR3Ry9kM2xGUkpmNFF5QkViV3VZ?=
 =?utf-8?B?NGwwN2x1R2F6R3hNazQrY082bzlMVTQvWTFzYURRQTJZV1VsamVURm14UHEx?=
 =?utf-8?B?NkxRa0xXYVNNT2JOaUU0cVBkUmlJRlRndzY5elNCWm1SK3dtRFhlUU9jVFkx?=
 =?utf-8?B?eTZBNDRLQ3FnbW1ldmYyaE9pYVhyM2c4aURVMGlmZ1lFNzRvc2tpT0grNk5x?=
 =?utf-8?B?b3IrQUM1VGVqcFd3Ry9kaUdkdUhIYVhOcHdqeGdxQmhCYzJrZXpPaFcxMlE2?=
 =?utf-8?B?K2F0VFhyRUs0cGRQMHdnWnpCeWVIN1BWdkRqYlRPUXd4bE5WM3VKQzBFNzNO?=
 =?utf-8?B?cXI4S0U1eHVsYzFiaUYyZVpWRlhvYXpITzBOWmFaN0xmV0hhWXZUNDhQWFV0?=
 =?utf-8?B?Ykc1UDdGT1pYVE1UajhFWE5Wa2FBNTIxbEFRQVEzV1JjK0piOGhxL0lJQldr?=
 =?utf-8?B?c1BYV1NBQ1VaemhlZ2dHVzhUN1ZXaXVaclBva1p3dTZWUXZGQU5LU3IzUGZz?=
 =?utf-8?B?T2tOU2J5YnBubnZ6cG5ycW80cnMrQ3lUQVl3b1lZTXpJc0ZvWnlsUzRUb2hh?=
 =?utf-8?B?WHZlTnNOLzEzL1pmRHgwaklISkQvRzB3TWZCZDJjekQ4SHZ0VlNoWlY1NjJo?=
 =?utf-8?B?cE1kOFJvWWJtMWJqUjI3eVZQUUpKYUE0a3Z1U3BvbmhHUXpvZ3BRa2M2ejdY?=
 =?utf-8?B?Nk5aajQ0U2UvaW94Tzl6RzlOdkhZN2s2ZmJKbGxSWlBHY09DR3ltMk94bVUz?=
 =?utf-8?B?dTFEYXV0ZHdrOWNHU0xYVWIzY3FUVy9MZ0tyNmx6MGYrT3l2UTEwNFNiYTdG?=
 =?utf-8?Q?IXIhaNgJCPbYnB0+emFA8la3IUIj0Cf6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjlDK2RVTjBKQWFSTVpoS0NML1lPdTlWWEhMYUF2RFd6amh5VVl0M2JMM09n?=
 =?utf-8?B?SnFrOXFvaFZnaFFaQkVUdTBrWFFZTWh0UGtKYmJuTXRJMDMrb2pQdXJXSURW?=
 =?utf-8?B?TFYrOTdNb3VxUUdOeE43dmNidkNhUU9WcTk5Ukdmc0VBUEdoSjd1VzN5bnky?=
 =?utf-8?B?SWR6RDhieXRmQXNiczBYcjNLTEpydHJhK1VlMkxWa29CLzd4K3FoemVuVERV?=
 =?utf-8?B?Qnp0bUsxcjlZUnljM29YblRBMEpmUm9hS3J1L1NoUlhYbzNiQjFCZC9KT2Ru?=
 =?utf-8?B?cGJ6eFByeFk4VkE5WkVVV1hwU2cxQUxZVDZaY0ZnVGN1ZUN1cHhtSXJCYjZj?=
 =?utf-8?B?ZkwzQVpzYkdPUHc0SGN0a05HVzRRQVkrWXp3ZXFSb3FPVVBFZVcrZjZDY3dF?=
 =?utf-8?B?cEM0UE5iSk9zamR3UE4yVVBJVDRyVTQxbFlvVUtacU5wUi9vK3daTjJUeDkx?=
 =?utf-8?B?dFE4amtEd0tMMHNtQVVEVFMvaHdUVmxuR05JUE0xSmtFcjlNUHhrR2RpdUNG?=
 =?utf-8?B?YzZtSzNQZ2twZkZyRFlpdjloQVA5elA5SWlGalRoem5aTEQwdmZhL2NPMER2?=
 =?utf-8?B?L29RNXdvQlRYZWlOUHhKNHlpMHdtaGJObnlxL0diaU1CcTcyTStEdW1lN1hC?=
 =?utf-8?B?T3VJbk1FOVhWUWh1cHdpZFdmQVJnd1pSMDQ0dlZVRzNoZTdkNW8yb3VrOWdD?=
 =?utf-8?B?dEVFNnU2K3NFQUVqcENaUzY4MkJhSEhpNFExWFBTc21sc1p6TmtiVlFSWUxj?=
 =?utf-8?B?Zy92aFpkZy8wcXIyME9SWGw1aXhQRTlNZUovWDBlaFlxeFJOTDl6VXpOWS8z?=
 =?utf-8?B?Y0lTT1JUUjRwSnl5eTE4N3RjVGpvMmYxQWcvMldwd0tMeU5ZRlUvQy9SL0R2?=
 =?utf-8?B?VXV6aXNaTVpabmJmT2J6dXdUQlNUZFFqb3FvNkZpZTZqNVIreWtlVERlOTZM?=
 =?utf-8?B?amsyWU9sQS83blhDTEtsd3dYd1FtUzNySFRCeXR5RlhzR2h0MXY2ZE4weVls?=
 =?utf-8?B?Wmg3RUUxUzA0YmgvTHlCUS81eUtUQTllNXFiUWtyMjZnMzRNYldKbEtKazBn?=
 =?utf-8?B?ME1Gd0dQZnBqSGVXTnkveHZoSmgrY3RPc3NBUjVRUzlLVmlkRERjUlMva2NM?=
 =?utf-8?B?ekdja2VBenJaNjVWY3g1SjExZWJSWTk4anBNL2FmZjdBSkx1cnM2WHhhazIy?=
 =?utf-8?B?RFRjdU9xSHpKRTNsWjQ0MkxmS2p0Z1Y3N0wwM3RwMm1iUUlZRXVWZHhBVFRK?=
 =?utf-8?B?NFFuQktaZUQ5WG9WWG00dUNIUlVVK2tMQnV0WXVxTTY3dFNvR1pxZTFWSlpX?=
 =?utf-8?B?S2U2M0lmMW1oUmw2dzk2aHFnaGF3cWNieE0wOXNuSUZ1eTV5NWMzZnBqbmU3?=
 =?utf-8?B?aFlpRHM1dXVkZzlhSUM3bTJCdnNlV09JaFhFNmpZcG1MKzRnbXRzYzV6UVdi?=
 =?utf-8?B?R2E2TEF1NnppSEFsd3k5eGpFQ0tWOGJYaWk3TThVbS9QMmIzNHUvQVJMM0dT?=
 =?utf-8?B?WS9GQXI0QXAwbkNhWEp2SVEvR1czZlhxelptb1VHNGVpRUVidld2cnJkSmpr?=
 =?utf-8?B?dlhRTnFzaXNzWjljK09tZmlyWlhoTDNHL3dzR284V09nQy9SaEEvTXJjYVFW?=
 =?utf-8?B?NHJPR0RpejBtdThTNFZtREU4YjA1c2hiWGFYc003S2lVRm5FRHZPTzY5eTRC?=
 =?utf-8?B?ZVJGMjlueUlUSkRMd3VCZ2JnQjg2M0lKVkY3UnpEN0dhb2pmTzVVd1RKVGM0?=
 =?utf-8?B?TWYvYTZYQkxyS3BsNjFjRUE0VDF3eGhjRWJKNHorVGZtUHYzVGY2WVhEK3RB?=
 =?utf-8?B?eXN3dStjRElXbFZ1bXVrYXVDUHd4bWJrSmNING9hVWpnaWxVekh3OGpRTk5p?=
 =?utf-8?B?UWxrQVVuYVRIU29JSFp2SEdHdVBXV3IvVDZEcDQ1ckhqcVBEb0lkaENTOHBU?=
 =?utf-8?B?SXg1NEQyRWlXekdMZy9MallldFdBcFRxV1FJRmxUU1RtRnY0SUIvczNvMGhh?=
 =?utf-8?B?WDdVUWNLN3BRaU5weUJLT25QbzBRNVA4Y3ZVaGh2NmtTZDJDSG1oQ1ZvaHAw?=
 =?utf-8?B?QTU0TWd3akt1emR5cjRWN2NSQmNHMkRTdkNHS3oyS2xhWkllN0FybHJGQjkz?=
 =?utf-8?Q?ICo0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1795f0-8a8c-4436-9d1a-08de3197f6b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:43:08.5283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ch8GY32oGtwVa8p4t+ns5/pUEA3RP20pu9jPrjdB6zd6aiQMLw2yFlTUSme30Rm6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
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

On 12/2/25 10:47, Pierre-Eric Pelloux-Prayer wrote:
> drm_sched_job_add_resv_dependencies can fail in amdgpu_ttm_prepare_job.
> In this case we need to use amdgpu_job_free to release memory.
> 
> ---
> v4: moved job pointer clearing to a different patchset
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ae3ad19667df..6e8b6fd94378 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2278,7 +2278,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  				   resv, vm_needs_flush, &job, false,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
> -		return r;
> +		goto error_free;
>  
>  	for (i = 0; i < num_loops; i++) {
>  		uint32_t cur_size_in_bytes = min(byte_count, max_bytes);
> @@ -2290,11 +2290,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  		byte_count -= cur_size_in_bytes;
>  	}
>  
> -	if (r)
> -		goto error_free;
>  	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
>  
> -	return r;
> +	return 0;
>  
>  error_free:
>  	amdgpu_job_free(job);

