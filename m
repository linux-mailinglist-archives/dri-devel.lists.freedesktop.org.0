Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6B9149B4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3770410E416;
	Mon, 24 Jun 2024 12:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sAeMCZMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6E610E414;
 Mon, 24 Jun 2024 12:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRCLGGCsPqkffJkIA7h6L0nspSfPVeVTeRRcTpRVYKgb+L5rDeG6cDvo3ARWlDd5bt8X3DNpMEBg8iUzU+1jTcIP3LZrpj5GcUbRo2zVqkShjGubq7h8s1o8IpA+NeZzpfXyiKv7o3DD1hFcdzO6Br/XvOSs3ZI1iVAMid/qO2BW2Cxpq29owGoeAPVCFEi27CFh7AgilERZeVJ0IM3d21nx00qrVhV2o2XJr9QseY67lGFCUIHRh5S5eLYvVBzsTz6u4CTNQVJ0cXKqjRjDquDnybi+6zZd9eA44e1iuLcqd/+eHEPZvZbGrmIndWD2LCjOy7KGwW6l58v+vCcuSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5UK+CF8AAfH3/0/rq8TMHvCUFUQWVwfmZK1rkRoYTU=;
 b=LnxWuLxlMqlpCJOdOdcXG6D2VenBxk+6ApQIvtmmCVHYXOWgCNFHCbzF1Zo+WHldtbK2m7btqzIUmTqBUUyYApo2TF18CaHvAv+XL5u3ngUPUkxYPrgJMJ3Gnhxrgq5rqW0VG+ttIpr2GXACplVJr2jC43Oh4hV69J6YleZYf4WVPRO4psryxbfoKz4pfWhjECRYIItyAgt3tyTpPZN8MDSuft+w/1yOv5cwlJTPSgyfH0CK4fG8QY3D/Z3/ic8Sqz5Rafd6+0CBOzA7C/3UdV4EbnQFIsxeVdYn961rlb/QHByGcydHyzIaucPjwp4Qi/ZtNahw5H2yEqh73+UMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5UK+CF8AAfH3/0/rq8TMHvCUFUQWVwfmZK1rkRoYTU=;
 b=sAeMCZMcGglDjQKo69T8v2IaHgZdu62Oy1BQ2BiGLQa1J0z0E87hwUjmCG5f4khkmIzmZR2WNAGaD3xQlHEz6iDymFENbK+JI/+p0ebrzBVVMs4kTuubY1eRvfavM85y1/feGPBn0MkiTjjbKQKSRlroALYdIj6zaW0VG8y9pMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7166.namprd12.prod.outlook.com (2603:10b6:303:224::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Mon, 24 Jun
 2024 12:21:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 12:21:38 +0000
Message-ID: <2f5884bb-7eca-4273-8bc6-c376341ee930@amd.com>
Date: Mon, 24 Jun 2024 14:21:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Add a flag to allow drivers to skip clear-on-free
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240624100721.24331-1-nirmoy.das@intel.com>
 <7d576b58-81f7-4f2c-8932-70b96764c634@amd.com>
 <dd330f73-d83f-4894-a48b-aa2ad004a82e@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dd330f73-d83f-4894-a48b-aa2ad004a82e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdbf4da-5f92-4765-87d4-08dc94483235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTZOb1FOWWlneGZtV0xqV2VnRXg5OEhOVi9NTVNsOGxWRk9vY25XMGU3WC9K?=
 =?utf-8?B?S3hvSG1sWWdVUFB3T0FoS0Nkb05jN1Z5aEVXWUlYTkJCSnhta3E5VHhWaXRi?=
 =?utf-8?B?OFFNaEpJSnNTTGlPZnNBcHhaenlIVUxmLzV2dUlwWm5KWW1wSk5ZdTJBd211?=
 =?utf-8?B?Z1dvZVpFM2l0REFNc0xTQkJqTnkrdERycGFTZ2tsQmh6aHdLdDljRDVLVGNS?=
 =?utf-8?B?N0hZcGtub2lwMnJneE1qNUNJMHpWQjVORmhtczJFUlVYNzdiWEsyTUtxS3Vt?=
 =?utf-8?B?dlBUTXhKbUhacEVmOWdVdVNuc2R0WDBTUkJUZHgwRmNQcHJXbzZhWGZQc2Jy?=
 =?utf-8?B?ODJrM0dsK3cvcVd2eXk1Y04xdXc0MmJmR1RiYXdINExZVXZKZTBCM0pOR0V6?=
 =?utf-8?B?anZJeDhWaVFncWZUbjYxV2kvbitrNm1FYW96dnVGSHFGNHlCQUxmUHRsMXUy?=
 =?utf-8?B?Q1JmejF5NHlqTlgyS29hVjZTTU81RVNHNHdJd2NpeklER21aa1I2NHI0MWV6?=
 =?utf-8?B?NUovTlVTc3RTZ2JrOXYzNllTUWYxangxeDdvVitXSXJmNGxZd0tyMUsveE1R?=
 =?utf-8?B?cXdBWDd2Ym9aQlNFWVNIQm5mbEZoNno4VWRwZWp5aEpyMEJFVkFCa2lQSDFG?=
 =?utf-8?B?bUpwL1UranlBRkdrSFF2VlhTRm5rTWw3WmNRNVlPN2pTOHNrYWhSbm4xQXNR?=
 =?utf-8?B?MlF0SGJFeCt4SEZTREQ1NU5RTDJaekRvbDV0ZEpTS0FsZFNUUi96bjV3ZDRp?=
 =?utf-8?B?REdib2JYREhNckVkcUNjNURHWlQwY3B6U2dTbVpxS3hsaXJIcis1YWQ5T2lD?=
 =?utf-8?B?V05NV1NuNzFidWlFVDN1V1pkMUF3N0haODVUS0JiRTJaSFVPUml4OUJ1a3lh?=
 =?utf-8?B?YStoSnd2MlJTQmluZmpiU29FZTFPL2djQWFpWVIyblJZTHlnSno5U2dsNWpP?=
 =?utf-8?B?TU12Z0JxY3paaFRSSEErUjFuamFVL25JYkpOOEtpR05ON1pCWDlWTWJFUndj?=
 =?utf-8?B?UnR2dEFFbk9ZK1UzbEJLaDdYcUpMSHg5SWQ2MkZkenpmWkxBVEh1bE5IYlFK?=
 =?utf-8?B?YmRqK1phL1VYY0V6dm1JVmdobjVTdUJTT1NPczFFUThGT2p6NU5BeGNrdytO?=
 =?utf-8?B?N1B4RldiYnpucUh1R3ZGT2YvdElURExPNVAvQzV4V0dDYmpVVG96T0hlZDZu?=
 =?utf-8?B?WDhzeE9HRGNkcDFoSHM4cEhtYzFJT09DRHVjU0NVNzJBNmJldjBINlFabHVi?=
 =?utf-8?B?aHdUaE9weFhLL1h0M2dsNmN0ZURndzhCOEt1R1AxYmNVVUpJTUVCUnAxbmVB?=
 =?utf-8?B?SXlSakt5blZjQjRFQndOUFU0aS8rU3ozNXd4RS9id01JKytjMDdoeEVMUlFG?=
 =?utf-8?B?TXBNbmRXVHhtakJGK2lqV2Izc2xDY3hpR2xvOGVTbklta0pUYXBySTZhdkRI?=
 =?utf-8?B?Wmk0Y3l4R3ZzL0hqMFVsbTJzbU9VdkFXN1IxY0tUVGlOY0NLTks5YjkvZGV4?=
 =?utf-8?B?VWhoOWh3bk8ybGpGb1Fsa0c1ZWFpbDhBK1oydDZtR3FicEkzKzE0aXM2VmhK?=
 =?utf-8?B?WWNmNmVOcjYvRGpYQjIxMzJMbWMzMmxGZ2ZMRkN3eDl3TWdab0xCa29EanRy?=
 =?utf-8?B?cWk4emFqa3hkN0xzU3FxU0REWGorL2ErTGVKbEV2eDlISE5uVWtiTUVXK2tl?=
 =?utf-8?B?dG5xdkdFbGtuTUUxaWVORDVTMGZUa2Q2TGMrM2ZuUzdiNEZUaUpYbUlwcVNu?=
 =?utf-8?Q?yS/KRHjG9Xja59tbz3YeLjGaRLjUdJdO/ieJ5Tg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnhOR1o0SmpBeWVmc3VjVHBJQUk3MUVQVFd0WEc4L29oRzNxVStQcWJKSVZV?=
 =?utf-8?B?UGJNYWhBWkZiN1ZTZmFVZFNDU1g3MUtuUmxPdTh4M0JGOFEzbUNvek1tQ0pU?=
 =?utf-8?B?Nmk4N1FRQnRjbVRVSW5ucjlBdENMSlozT3h1WmNpNGowUGNDRnBiZ0FpejV2?=
 =?utf-8?B?VU1sQm1WdWNEM2QxZnhsWDcyZjBvT2xEV1J3Uk0xMXU5eHhtREtKSGhWUkxl?=
 =?utf-8?B?eXJWb1NLM24zM1MrM1lMWGg3aHdheXVvN0V1N1J2aTVSbU5HUjh1SDBtTlE0?=
 =?utf-8?B?dWFYd0J5WGc1c3ZoZWdLd3hYbUZBYlVEVkNKMjdzMk5zYnN5aFRSbEhPNGsy?=
 =?utf-8?B?VzQrK3loeXZmY0dsaXBuU3Fqall1THlqWFUyK2FUVXpRcC80WVB3VVlGeS9S?=
 =?utf-8?B?MzNScUExSlFpMzdSb0xqUG9lbkRZQmE4aXB3c3hsVTdOVURFaHI3ZVRxS21K?=
 =?utf-8?B?NjAyeVU2V0I1dHdRRWFWa3M5eHRYcTUxaGtSS2hSeEhvcVpBcWp5dU4vWlJ2?=
 =?utf-8?B?c2s5SENwVmdaSmdsVk1hU29PQ1V0a0JzNnBjaVpicWhSQ2ZDSTVVdHl0dTNN?=
 =?utf-8?B?VUlMYmgraEtwSWtVc3YwbnUwOGNrc0FNdkxBQ0ZmS1V2TGhlbVU5OGJWUjll?=
 =?utf-8?B?SHp6cXdkS3ZCemZFZGJRcUlPQkl4SW9DRGdBQ1o0Sk13cng5S09EaGpVa2tC?=
 =?utf-8?B?d2JaaDk3WlFhMllCVWNqY1cwVzJ1ZHVoM2l4SWh4N3N5c1RzMVJtdmtXMG1l?=
 =?utf-8?B?bFAzd0J4UEt1VjhVY1JzK0E0VGdkQ1BmRGtVdVkxRDgyTkoyMWdkcGRuWGts?=
 =?utf-8?B?Z0VsbEg0NEZ5bHVlcEN2STEyNk9CRnV1blJ0dE9BdHFSVC83cHhJMysxZElj?=
 =?utf-8?B?azJxc0o3em83L1JFZmVFTmdKdW1hUll6RWkzQksrQkQxYkZmdFp3Q3pYWDlX?=
 =?utf-8?B?dEFqODZjTWxZd3gxOTQ4cWpmcmZJckdzSHovZFA0aXRUQnEzSDBkYUFQN1kv?=
 =?utf-8?B?Z3huSExqVEo2bFFDem55SkxCQjRjNS84T1dGaUJPVTI2Nk8vdGlxQW1VdDd1?=
 =?utf-8?B?U0RnSm00b2V5eGhkWXZDbjFta2p0dXlUU3pTUEs0QzFDVmtDeFUzK25oMXpm?=
 =?utf-8?B?a3BuM3Z0dFkzTEUrQVlscnkxQVhxbmR0U2tWQW9Hc09maXJkTVdMcDlzQjNv?=
 =?utf-8?B?SEswUjQ0VXA0bEFBMXA3Zm5IYnUvYUpySk55VTl6U2VjZy80QVVGZ05yeVU0?=
 =?utf-8?B?M3c4eUdEQXo2Z1VuY25JS3RaVGFRR0tPNGorMCs2NVZqUzQvbFlHdkFYeTR1?=
 =?utf-8?B?MlJsMkdlQkNuMU9uQkptRklaVWJoRGJvdEVwNm4raTJNZUhHR0R0ZHVSekhm?=
 =?utf-8?B?cGdpVW1JSXAyMXZXeWVsRlIwajlDQnl3OVZrNWdBTnB0a1IxOFgzV3diSnJ2?=
 =?utf-8?B?Z1g4NnUzT0NEQ0JNdWlSR2dkOWc2Yk5DWWdvZHNrVlRJSlJvVDh4NFI2T00v?=
 =?utf-8?B?VVlkTjFiRFVaV2xIbzVTZmxDaC84Tmdwa2oyNGJlMEQ4OExYaFBBMGdVRmZl?=
 =?utf-8?B?SVdxb3dod3N6ZzB0MVJXTEZ0ZjA2ZXF0TklvdjZ1aWhpVUlQaWgzYkNYWCtX?=
 =?utf-8?B?aWdJbDhOM1dBbkQzVG9LcjdlV1BZQWdXbXE2dWd3a2c4V0dTMXF6U2laUUEv?=
 =?utf-8?B?OG9VTmVSVWd5V1lEb1ZpOHJjOGdYSVJBRTRVdVVsQ3pDV2NwUFhtZlpOUk1T?=
 =?utf-8?B?cVhJdTN5NmpxK0tuMTdGWEk0UFBkanhsVnM4eGF2c3lweER3bHZxV1h1Y013?=
 =?utf-8?B?VGpvTldoT2grcHNFSTQ2SmdIaVNnME5uaXF1UjBzdzBMR2N4R1dYMGtNS2J1?=
 =?utf-8?B?bS85V3d5TzFHQzEzSEI5Q2ErZXF1ejhtdHN6ekJDZTN5dTBFeWM1Z1VtTlN0?=
 =?utf-8?B?UzVtM0g0MTJ0MzJTN2ZzV0hTTjdCd1AzTjlqMkg2aEEybFhqUlczdW9RbTVS?=
 =?utf-8?B?WkV6QnI5QWtjaE1oVnp6OG9PdC9BUEMwVURRQk9TOGJQQXRpc0JhcUp0Wjdo?=
 =?utf-8?B?dWd4M2N1em50Mno1UUpOcWJ6dFNjY2tEM0FESDZ0TTR6K0M2bitlZlpxdmNs?=
 =?utf-8?Q?8d0PJHwu9U/KKAjkqLmCBwCH0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdbf4da-5f92-4765-87d4-08dc94483235
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 12:21:38.2008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwSDLOvn7Egz+NFQ9+0Kxxu2RIZx61oWYUQpGbopy9Hi2gRREregBUudg1CJuIYW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166
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

Am 24.06.24 um 14:19 schrieb Nirmoy Das:
> Hi Christian,
>
> On 6/24/2024 1:39 PM, Christian König wrote:
>> Am 24.06.24 um 12:07 schrieb Nirmoy Das:
>>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>>> releasing backing stores if they want to skip clear-on-free.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Thanks a lot. Could you also please help get this merge ?

I can push it to drm-misc-next, but for that I also need a patch 
actually using it.

On the other hand feel free to merge that through the i915 or xe branch 
as well. The patch is small enough so that it probably won't cause any 
merge conflict.

Regards,
Christian.

>
>
> Regards,
>
> Nirmoy
>
>>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>>   include/drm/ttm/ttm_tt.h       |  6 +++++-
>>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 6e1fd6985ffc..b78ee7524bcf 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool 
>>> *pool, dma_addr_t dma_addr,
>>>   }
>>>     /* Give pages into a specific pool_type */
>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>> page *p)
>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>> page *p,
>>> +                   bool cleared)
>>>   {
>>>       unsigned int i, num_pages = 1 << pt->order;
>>>   -    for (i = 0; i < num_pages; ++i) {
>>> -        if (PageHighMem(p))
>>> -            clear_highpage(p + i);
>>> -        else
>>> -            clear_page(page_address(p + i));
>>> +    if (!cleared) {
>>> +        for (i = 0; i < num_pages; ++i) {
>>> +            if (PageHighMem(p))
>>> +                clear_highpage(p + i);
>>> +            else
>>> +                clear_page(page_address(p + i));
>>> +        }
>>>       }
>>>         spin_lock(&pt->lock);
>>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool 
>>> *pool, struct ttm_tt *tt,
>>>                   pgoff_t start_page, pgoff_t end_page)
>>>   {
>>>       struct page **pages = &tt->pages[start_page];
>>> +    bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
>>>       unsigned int order;
>>>       pgoff_t i, nr;
>>>   @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct 
>>> ttm_pool *pool, struct ttm_tt *tt,
>>>             pt = ttm_pool_select_type(pool, caching, order);
>>>           if (pt)
>>> -            ttm_pool_type_give(pt, *pages);
>>> +            ttm_pool_type_give(pt, *pages, cleared);
>>>           else
>>>               ttm_pool_free_page(pool, caching, order, *pages);
>>>       }
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index 2b9d856ff388..cfaf49de2419 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>>        * fault handling abuses the DMA api a bit and dma_map_attrs 
>>> can't be
>>>        * used to assure pgprot always matches.
>>>        *
>>> +     * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
>>> +     * clearing backing store
>>> +     *
>>>        * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. 
>>> This is
>>>        * set by TTM after ttm_tt_populate() has successfully 
>>> returned, and is
>>>        * then unset when TTM calls ttm_tt_unpopulate().
>>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>>   #define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>>   #define TTM_TT_FLAG_DECRYPTED        BIT(4)
>>> +#define TTM_TT_FLAG_CLEARED_ON_FREE    BIT(5)
>>>   -#define TTM_TT_FLAG_PRIV_POPULATED    BIT(5)
>>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(6)
>>>       uint32_t page_flags;
>>>       /** @num_pages: Number of pages in the page array. */
>>>       uint32_t num_pages;
>>

