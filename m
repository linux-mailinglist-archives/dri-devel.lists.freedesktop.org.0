Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B3C79448
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E1F10E870;
	Fri, 21 Nov 2025 13:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QRVf/6Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010003.outbound.protection.outlook.com
 [52.101.193.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D711210E870;
 Fri, 21 Nov 2025 13:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLRHYeW4gPZphHO4PkNYm1axD3kIV6Ai9mVc7j02TBvPCkZNZM+RlHXqm54oh6AS15/zSa/m+wvuloSY7VwDuK54DqAl1UXVbUWL7jiHbTtR3c+Qe3rG/jCu3n8V8BpZxMnhsM6Icy1CcvbnXb+nOPQBhyeq8wh8w2SfBW9eZo5STiNFPOjaHGFljeNqTIjWYluYchaHIPMpUj3t6wbydz9QSckUCAhkUUuehjkwJ/njg1Fy+WMLaUQTW3HA8ao6FbXvDfqM3Qm3NifCIz8J0TbN+8zB0evCBIZU7euvEw8AYFRps6dC/P65yX8KFMTnmSsbWQOuAasPKuExhF3vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEWn30i+lcB1juNFoi8l+2ereyqFg6C2vLQWrIDo/sM=;
 b=Xf5l6Ziw1cQzPPZVL0ijWPb4pKHCJKDXWpGOVEdR3BM3wb6n+B4v6oDf47u3jUjtEWYmOfGwgx2i0PwsMZ9AIA2DUhUu1Kl5DaZY+N5p/YQ3X16csDFpxe8ihv3UlZBhaYZ89F/Gk6dvyziXiRgrXDhSlq3ilTszIFgM+kXPqhY61fzbd8yItpMFIJtbhJO3cyVRWU/4JnHkrp8u0ipw0pzMg1qhC7r8WrF/d+wiqiyg6xHxk6MBpqX+gg5Q4xBe2zhqP0MqZDaSEWBUCI/+q4wxQIEQQ0MRYgxs1TUQd4xmTLmwrS0Bol5AGrm2qE8NgMjzZ6mLocH+d6Ypb0F4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEWn30i+lcB1juNFoi8l+2ereyqFg6C2vLQWrIDo/sM=;
 b=QRVf/6Jx5a8jQfMfC0MdXG3wwZZpY46idFvUUnas1I5HLKAj7FH/5/eGdlrP56/EkYdMOkUGW+EVaajHi32MaiL5FOm9wMNu3KXS3V/oYfoq9yPFR2vq5POTRqq/SMvgpvu8SOy3M5q5yc3lBf78sMTHnIRcycsgYj3YtTZGtUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PR12MB9719.namprd12.prod.outlook.com (2603:10b6:610:2b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 13:23:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:23:19 +0000
Message-ID: <696b6fd1-9590-4395-a7a8-2888ceb8adc0@amd.com>
Date: Fri, 21 Nov 2025 14:23:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/28] drm/amdgpu: pass the entity to use to ttm public
 functions
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-10-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-10-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PR12MB9719:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fccb49c-552d-4d35-b9d6-08de29012328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eC8xblVWU3Z5NnJvbXJzNmtNTCtUam50bmc1cFMzaGx1QXo2dUtvRkxVa3Jx?=
 =?utf-8?B?N2RqbXl1Z2lMOWUwRTdiUE5XeHNrYUt2ZFkwcEVwdWVtQnFocncvZmwydXQv?=
 =?utf-8?B?MTV0MjdzMEVrZVpxL0tQSzlNTnorYWZCT29qWWl0S1l6ckhRdTZnUDhvOXU1?=
 =?utf-8?B?ZlJPOVJsdDVNa05seHl5WDh2L3hSSzBHUGU0c2E0U2VKSjJIbFBseTBYenJX?=
 =?utf-8?B?cXBJUU0zaG80U2IvaEFybGVxeXNjVGhTRHlGaXFpbVY0bDNFaEdHTXRjZHBi?=
 =?utf-8?B?NXRkRDc1MXJLNG9RaTUrV2VjRWRIM3dYMUE3QjBJdnpialZsMFk4ZGpNcDF4?=
 =?utf-8?B?bDduZ1JQSUZjWWJMalNTYzEyYVBPWWpNL1k3WlQ4RkNLYTFmcExlSHk0VFpF?=
 =?utf-8?B?Sk13c2p4cWZXMFF3YzJNTk54Rllwc05oOG01NmVRc0ZFTXRJM29DMU1hSFIy?=
 =?utf-8?B?T1h4anZUeG9vczJBQm5KQ1Z0OERjME9nWVNFY3lvaTJ6WFdpK3duN2s0T1M5?=
 =?utf-8?B?OE1meEZudlA5MTZrQ1I1MTJ1a2dvL1M2VkdwT0RhQjN1WTlkb0NNY1RVcUln?=
 =?utf-8?B?MWFXQ0hITUNNbzRNbGZTL1RSUExVN2NUY2FOVzFjV0tGUXNYVjI3cmFXSFQw?=
 =?utf-8?B?NXFNRTZKY1NZWGxtbHVuczB1WEVvODUyTEdZWjFLMnZMdGtnUVlZdU9xT1la?=
 =?utf-8?B?c05HaS9UWThscjMyUUVybnNxcjJzRmtDYjhpZWkxbWh5Qll3MytYWXlsWEEz?=
 =?utf-8?B?TG9UempoQlI5dTBaeXRWb2x1Z0tScy9SS3VQTkwvYUVBQnp4bWdVSXBvTWFz?=
 =?utf-8?B?bGVabUNHcjhHVFQvai9vc04zbGVqL1VrUlA0UkNuSkFaK2tDOFJKSU82c1Q0?=
 =?utf-8?B?bjdxdE40WjhITWphVWV4R09TeHZtUlRLS2NnblZJa04vTURDeFBGS1QrMENR?=
 =?utf-8?B?MFRBTjNKRFNVdEZzdGFoZzk5S1Z2a2NteUlvMkoxQ0dVZUo5cHBTZWdrK0k3?=
 =?utf-8?B?Tjd6SjB4ZnBUNGlnRVBVUnJOWEtlcFo4Tml4L0RoYklnS1FKa1lKVVM4aWQx?=
 =?utf-8?B?YXJOZUtqTWI4bzdFWit1OVJ4U09pNzd3Z2Z3VnFwUnFTaGdvam9YNUJpS05V?=
 =?utf-8?B?NHo3SHg5Rjh4UjgvKy9nZHppWm9QandmeTl4bllsUXFQYUNKZGxucXlmTlpK?=
 =?utf-8?B?d0IwUGx6UmFNdFZyOUFKbDN6UXpjY29HUHFSSkJWYU55ZXZMb2NPcmJyTVRK?=
 =?utf-8?B?dysxZGpTWEdVYlpkM0Z5VlhPVGZJZXhhNzg1NkFOa04vLzJ3T3poUDRMVlJ3?=
 =?utf-8?B?QWo2YmFpZlRYSTN0eElYTlpxSG9iZUg5YW5YOFplTEVFM2FWN0NCRVRidUI4?=
 =?utf-8?B?WVlLaGw4UEovVjFqb0dqTFB2aDlCT1pQNm5NcjltSnFiSTNhd2dhWUlzT1F2?=
 =?utf-8?B?ZmdRQWhURFhCbThGOW5YTWVsejhXM1FqK2Jxd09zRUhjczA4Nnl1dmV5eTM1?=
 =?utf-8?B?L0NMK0M1TDFaTlNaS3lSN2JxWUdhV0psK3h1T3pKT0ZrbDV0azZwZ1hRNUlh?=
 =?utf-8?B?d3hKdC9Cc3hDSjJCa0toNW9iQTE0bmZXNWtvNUQ4cVZOamFoSG4xQnlDSm04?=
 =?utf-8?B?TEVXbi9wZy9YME5xTnJ4VTYvd09XUXd4S21IRnphREFlVjVEQlIydXQ4b1VF?=
 =?utf-8?B?aGlVMGF0V05kM3RLQktMZEJYQzRKTGxJRGtVZGNpVExqRkhBdE1UU0hFQjlm?=
 =?utf-8?B?bnZpUVZPMVhEUXpNWEpGQUkxN1l4NEY1TTgzQUVsTEZrKzI4eHdId1BzeTQ5?=
 =?utf-8?B?YnEyaERhNHFVaElSUDkwSmMybVJ0L2kxdk9yUWgyYkJMVktoOEJUODllZlN6?=
 =?utf-8?B?djh1MVF5aEtIUUVPRi9pbGY1VytTbFhidVF0TzJsNXU4L05ieWQ1SW40NytG?=
 =?utf-8?Q?YUWgv3ic/ddZAUuZSZNU/OXwvhL3N0Gr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHV5emJ4bEhMRDIxMFhrSTA5eE5hZGNBVHBVdzRkS2ppdDY3NEJweC9odUhC?=
 =?utf-8?B?Z0RPTC8vOUxmWmZaS3N5RThZb0l0UGJSeERTeVNvQVNnayswclZlUU5lQWNt?=
 =?utf-8?B?aC9rZmxFMlRjdXl0cTRKdFZBaUQ4aTN1ZUhSWVRMNkNuRDMyQ0ZuNkRLMGZi?=
 =?utf-8?B?WEZvcFpwLy9xbmkyYWRkTlJJMnNQMldwTFVpanlobjMySitBdGo5OUwyTkh3?=
 =?utf-8?B?dWR4SEdhZ0ZEQzA2bm1KTStmWnd1cVJqSS9xbzI5UWs4QkpvYkVKQ3NJcU1n?=
 =?utf-8?B?S3pXdEprSVFtVEFuRmdWN25QWUhRWHZWTnkzOFA4VjcvSnRUMlVxZ1BWQnQ2?=
 =?utf-8?B?MmhjZHAvd2QrU1R4dUpCZjg3eFJTM0lXS3dkRmkxZHVCbUJDTEdOSHUrZ3p2?=
 =?utf-8?B?Tk1JQ1hiLzUvdjJOQ29KRHpxOUJna1VnRnFRcVBLRDc5SWd4bE1ydStlOW5G?=
 =?utf-8?B?dnJucjlqcERsREVnN0t0VldneitZcnR5a0R5S2FBa3RrOEM2QUlwbEZvR3N5?=
 =?utf-8?B?NXhvaFErSUV4ZG9JVUNuL2hLUmh4WWIwbHR5UmVFd1k3MVFrREVJNmJFSHJi?=
 =?utf-8?B?cUxKSG1wUi8rNzlPZG9VODhpM3NSVVI4RjFadWVUVkp3R0YrMkwrNitQb2FO?=
 =?utf-8?B?Y3lyNGNTQWkrbmNaaWJkeVpMc2NxVVR5SUNIVXB0WWpHczBHUUF6UjhOSUpK?=
 =?utf-8?B?d21xdW5sakpldjdBQmxWd0RHNDFuQ21TVE9ybGgvMkNSQVBpUzM0eVFDUEJy?=
 =?utf-8?B?a1YvMXRJeStXR2ZpMFc3Q1B4alpEcUZRYWVYdVNaNjBDZ3AzbmJyWVVScXdm?=
 =?utf-8?B?eEs1UkVGVi9QVTFKTHE3bzFSSUVEWDFqZjJoWHdIQU9Bc0tqSlFUQnl3Qk5L?=
 =?utf-8?B?RldVRjVycnhyemJWY2RiN0ZsQXFDVlZwVTBhTk9XWkt4TGZpbzhjanFQcndS?=
 =?utf-8?B?OW9GcEE5UjA2QWtFVkJWUnlScWFKUHdXYmRQTVFQS3BIZlg4c3dTR29iS0Mz?=
 =?utf-8?B?OEFVWS9kdzQ0K3ZsUHkzZWg0c01rb1VUUjV2RHZJL1A4ckxLY2dsQUFQSzVl?=
 =?utf-8?B?eUYyMDN5TGxxVmtscGU4MzV3ZzIxc3RVUjZIVVhPV2MrSHR0amhlNE1xR1Nv?=
 =?utf-8?B?dnQwSUVRWVRwYmlVbG5GOGMyMnBtaEtYSmIwWklvU1gwZE5KbUxGWERkeElR?=
 =?utf-8?B?eCtiRmR2SVBZTVBybnRwMWIxQTZ0M3Z2NHFkSjFZbWc2TkMvM1ZVSFJiNVpY?=
 =?utf-8?B?T3NjVE5vUjU0bjJ6b2FuVHBUT1hVM09oOGhHalIwZUcwM1dZMXZHbU9kRGhw?=
 =?utf-8?B?OEVTMEkxaW1iN0YrZzJBbUdaTTZHMkdmd0dObFQ0RHhnVkFmdFU3TzdXMmxj?=
 =?utf-8?B?WDVtRnU1bGZHcGltWU9FMGtuaGgzOCtzUVBwdWRHMmZmYmxCWFJ3Y2xFaEZh?=
 =?utf-8?B?ZnY5N1N2emczdUc0NHlNN3B6SmNSU2lkZWxZVDRzbGlSNm9Fa3h6V1Q2Mk9u?=
 =?utf-8?B?RkkyRGdPT2lSVS8vWm0ySXhnQTc1emVxYURnelByTjBSK3BOWnRmUG4yVDB1?=
 =?utf-8?B?aElQOWdKZnFVSzNnTE5xTWxGaXNHa1lOdUtRc3hjdHVLVTdjS1ZXSVBZZHZm?=
 =?utf-8?B?MkZ3dXlOM0ZVWkFhUzlxeVNRdkRFQXd1RkEweUU1amY0anhNZmxzTlRxZjU1?=
 =?utf-8?B?QkhSWG5VbGg2Um1ZaEIrNFF3NG1uTWJkQklrWXhQTXZaV0FiWHlYNEt4bmg5?=
 =?utf-8?B?N2ZFdUtrS0N1K1JVRFdCVFhFbHlML1FKcFpQbWg5TEZmYkpUVzZSNWkyNnF3?=
 =?utf-8?B?emtjMWh6S2trUXpCemRlUm1vTmNhSEN5Z2lVMXBFNnlzNmpSMjZleEtkVWFV?=
 =?utf-8?B?NjhkQ2JKQ0p6RGVwTDVNenNGanNFZ29SWmtFTzkweEQrRHpoUDFpL0o5RDBm?=
 =?utf-8?B?NWovanlBakxMZTBDUEk2QWF1cGVEVStmSnZ0aVNtU3lEOEFSRk5nczhuejZN?=
 =?utf-8?B?azVHR051QjhpTXgvWDdsWGhQcW11TWh3OW5EUkhJNW9uYzhLZTRrbmpLZy9V?=
 =?utf-8?B?U0RnOFl1SGNCVVdkM3RvQTRRZUlJTy9wcmxGamh5Z2ZGNkN6UmRya1BoOHpU?=
 =?utf-8?Q?wiMWRsVjr136+X2XJIYgThSZ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fccb49c-552d-4d35-b9d6-08de29012328
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:23:19.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGOCcVP5oSJPjK0sI/sIVNRBlcmMR6MnDNUspSo00hO2FprFRUFMm11E5x43avZS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9719
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

I'm wondering if it wouldn't make sense to put a pointer to adev into each amdgpu_ttm_buffer_entity.

But that is maybe something for another patch. For now:

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 34 +++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 +++++----
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>  5 files changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 3636b757c974..a050167e76a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -37,7 +37,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  
>  	stime = ktime_get();
>  	for (i = 0; i < n; i++) {
> -		r = amdgpu_copy_buffer(adev, saddr, daddr, size, NULL, &fence,
> +		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
> +				       saddr, daddr, size, NULL, &fence,
>  				       false, 0);
>  		if (r)
>  			goto exit_do_move;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 926a3f09a776..858eb9fa061b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1322,8 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> -			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
> +			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3d850893b97f..1d3afad885da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  							     write_compress_disable));
>  		}
>  
> -		r = amdgpu_copy_buffer(adev, from, to, cur_size, resv,
> +		r = amdgpu_copy_buffer(adev, entity, from, to, cur_size, resv,
>  				       &next, true, copy_flags);
>  		if (r)
>  			goto error;
> @@ -414,8 +414,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>  		struct dma_fence *wipe_fence = NULL;
>  
> -		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
> +		r = amdgpu_fill_buffer(&adev->mman.move_entity,
> +				       abo, 0, NULL, &wipe_fence,
> +				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -2258,7 +2259,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  						   DMA_RESV_USAGE_BOOKKEEP);
>  }
>  
> -int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_device *adev,
> +		       struct amdgpu_ttm_buffer_entity *entity,
> +		       uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
> @@ -2282,7 +2285,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, &adev->mman.move_entity, num_dw,
> +	r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
>  				   resv, vm_needs_flush, &job,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
> @@ -2411,22 +2414,18 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  	return r;
>  }
>  
> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> -			uint32_t src_data,
> -			struct dma_resv *resv,
> -			struct dma_fence **f,
> -			bool delayed,
> -			u64 k_job_id)
> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +		       struct amdgpu_bo *bo,
> +		       uint32_t src_data,
> +		       struct dma_resv *resv,
> +		       struct dma_fence **f,
> +		       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct amdgpu_ttm_buffer_entity *entity;
>  	struct dma_fence *fence = NULL;
>  	struct amdgpu_res_cursor dst;
>  	int r;
>  
> -	entity = delayed ? &adev->mman.clear_entity :
> -			   &adev->mman.move_entity;
> -
>  	if (!adev->mman.buffer_funcs_enabled) {
>  		dev_err(adev->dev,
>  			"Trying to clear memory with ring turned off.\n");
> @@ -2443,13 +2442,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(adev, &adev->mman.default_entity,
> +		r = amdgpu_ttm_map_buffer(adev, entity,
>  					  &bo->tbo, bo->tbo.resource, &dst,
>  					  1, false, &cur_size, &to);
>  		if (r)
>  			goto error;
>  
> -		r = amdgpu_ttm_fill_mem(adev, entity, src_data, to, cur_size, resv,
> +		r = amdgpu_ttm_fill_mem(adev, entity,
> +					src_data, to, cur_size, resv,
>  					&next, true, k_job_id);
>  		if (r)
>  			goto error;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 41bbc25680a2..9288599c9c46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
>  void amdgpu_ttm_fini(struct amdgpu_device *adev);
>  void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>  					bool enable);
> -int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_device *adev,
> +		       struct amdgpu_ttm_buffer_entity *entity,
> +		       uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
> @@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence);
> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> -			uint32_t src_data,
> -			struct dma_resv *resv,
> -			struct dma_fence **fence,
> -			bool delayed,
> -			u64 k_job_id);
> +int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +		       struct amdgpu_bo *bo,
> +		       uint32_t src_data,
> +		       struct dma_resv *resv,
> +		       struct dma_fence **f,
> +		       u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index ade1d4068d29..9c76f1ba0e55 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  			goto out_unlock;
>  		}
>  
> -		r = amdgpu_copy_buffer(adev, gart_s, gart_d, size * PAGE_SIZE,
> +		r = amdgpu_copy_buffer(adev, entity,
> +				       gart_s, gart_d, size * PAGE_SIZE,
>  				       NULL, &next, true, 0);
>  		if (r) {
>  			dev_err(adev->dev, "fail %d to copy memory\n", r);

