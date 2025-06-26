Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C17BAAE9ECF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCF810E8AE;
	Thu, 26 Jun 2025 13:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="efulm2ww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4700E10E2C7;
 Thu, 26 Jun 2025 13:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbNbQXg8PDzySRQUxkjBRaAopurtfPGM9z38L4u+Fno3Trn1Z4yE+OCApcx5M3S5Gc0FtKuX1ZgMdWvbnvn96yDctvxhQvcTdk+8nBMiw4guRMhkd1y7e21QtI3YzZd9T1X5PsVzyHDVW1Dhovfe2JbQVjd4CZ3tdiHCQ8pN9l5GmUgY6oV9doWdMowl5vprVuMzvOB4twaWRHQXJvfuuw+biZfC64QJoGCOMwhyL6teSflIadNG7GlXG2YeQJZlrGYVlLsCsS1PHaTT1S6V2f+tEfxChGii0o2ivF1lKTmNunlYkwXpfMcv7E2v4/PcR837PCKpTB7ti0IBSKNC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmMDWZ9eC3fq5Ov37dZpvSphdGv97PC2Qf+9vK3FyPA=;
 b=ueQO7ktmp8U24ocaVpMqpJo6kwaGMcfbmS/IBWTXXdAg/02elW5U0LurwAQ0GuMdEqAXGGKlzOnVJ7qlK0pVmcGv1kie/uTihPMt6J6ZmsTQ6AyrBwniJVtJI571vXHF0nnxhj1jF4SbBeSUdwnx4dG6uSjdSwK1V7e5tNpNW6GAbs4NL9W7NSH1AjiJuDEMwu0YD+xmasaQ/fxEcl0HQRYn1UeJT8/jErh07HIADeW4h8SFSLzyylR24kMchizwWwSFNumWDwr7RxodQI9TVXGaOZXoAY5Fl+/N3xO5o8A5sn6f1SVnyV88tIPw9jgFtf8ySzuL4PR5jqbZcHu8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmMDWZ9eC3fq5Ov37dZpvSphdGv97PC2Qf+9vK3FyPA=;
 b=efulm2wwMYdkedwsxxI+LXmpt8ablLiBqNBAg/qKTREHx9VNQJyzzJaEe9kHLBhETkgo+0/4lGcTEEBxFqm1T5fu6A0vR/bj/VOmKLZll9wLe7nuwg7p+x6n8ka0FHa/TcooPMFNZuS3qbNhVCckXKFGuo58pIo4B73qdlk9Pbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 26 Jun
 2025 13:31:58 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 13:31:57 +0000
Message-ID: <267056ea-144e-43ba-82e5-71d6c68f0540@amd.com>
Date: Thu, 26 Jun 2025 19:01:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-2-sunil.khatri@amd.com>
 <c8ca63e2-41b3-4eb9-9ce1-25cc5cbc3f8b@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <c8ca63e2-41b3-4eb9-9ce1-25cc5cbc3f8b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|IA0PPFAF4999BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d046caa-233c-4c3c-6e3d-08ddb4b5d288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3V6SDZJeDY2eUF0MlpwUGFXMHA0clhHczI3NEZwdWVaKzg4Q0pTTEtYNXZi?=
 =?utf-8?B?SS9zL0FKUWJZQ0xLYzYyZmgySlFNdjYwWWMxWWlPS05Lc0JtL29iMU5HZ3hn?=
 =?utf-8?B?aVh2SGkwbEZ6OHU1WFhjLzRBUVMyTTZMQmpiT3pRRG5zK1JKWU9jNjUxL3hz?=
 =?utf-8?B?dk4wVW9ENVlqM2drTHlYd0M1ZUxIT0F2VzI3d2ppSlMzcjF2R3MrRGVTbzBC?=
 =?utf-8?B?cXZ3bElVL3ZQTHdkZEc3QjR4N3h3UXQ1WVkzQzRKRjBHSFNINVhNeEVWQUMv?=
 =?utf-8?B?R3JCbFdMa3R3VnM5MCs5bWdFZnQ4TWVNWGJCeU45UWtpU1JXaHNuNzIyRnUr?=
 =?utf-8?B?UVFwZDJveFZQRWJhRFZzNkFTaVJpQmZ3aTJaN3c2R2tCbStLQ25DNGcra2Np?=
 =?utf-8?B?MlpuZkt2dE1oTXN0MEVTVHNLSmRZbWl4Ri80RURhbGpkMGR0NkoxT2ZicmhK?=
 =?utf-8?B?eFd4d05UeXJHTTRqMFpjb3l5cVRWaHdBVlc0YWlrU2liZmxqTk55LzQ1amJJ?=
 =?utf-8?B?Mkk5WjZ6dWtSN09QanZzcGN6dGMxRGIzZWJVN2NhclBSaUhPRjlSNTdEdlkr?=
 =?utf-8?B?N0pXQmxCazBYY3JabHFuN3VkY3RYc3BOMVJjS0Y4WEd3dzFkRzNTNEloWWV6?=
 =?utf-8?B?QThOcXllUmhzVHUwdzVsSEhDYzhWM08ydVpHNm5FSFFzK2hKWVYvWWxkVkNL?=
 =?utf-8?B?Ukt4elh3dWVLbVY3ZW9XSzlmaFJhb3c1c084Y201YjBkbit3YnF6RGJjWktL?=
 =?utf-8?B?ZUFZMHRCWDZJSGFSaFc3ODAwU2tKb1BVUWRrUG0wS2VBUU5RNGdkbVNGWmhi?=
 =?utf-8?B?UjIxbExiUmUzdGViZkQ1WmlCeDJHeTJNWGZTV1EyZE9LdG9uSW9tL3llMWFx?=
 =?utf-8?B?RWRjQWxQWHAvN0xCUUUyNVNPaXBIaTJMWGhteTRXejkyRWVzbjZiUW5jQWky?=
 =?utf-8?B?UXdzc2ZzMVMwN1JvSCtndEtreTZ1RkpBd2VLOWduUGlMNEp2cVcrMU5CRDNQ?=
 =?utf-8?B?czRoLzFvU0ZqSUZ1Nmhnd2thT0Y0NktLdGprRUNQMEVTTXIyTEhCM2xobEpJ?=
 =?utf-8?B?ZW15T1hhV0kzeHhnZEpKeDZOcDBUQ2oyNHY2S3owaEY3d2sySzVEZ3lGMW8z?=
 =?utf-8?B?aGRvdVlROHJVWnFpbmF3Nm5wMW03ZE1QeGVxeWlLSHdiYVlMQVB2ck1xY0pk?=
 =?utf-8?B?QnVPYUt3U0ZBY0pnSzJVemNLa2I3MDQxV25WZUVqeU96SnBJczJjd3FBQ3Jo?=
 =?utf-8?B?dmovN2dGOFNJU20wcE4yYW80NkRxQXkrWnIyNGlFVXFKbXpLYWZEdk8vcW16?=
 =?utf-8?B?WDVEZ3NxYXlkcSt4T2tDSmtTQk0xSnFRc2VVSTRPdlMrRnk0SnlXWXQ2SStP?=
 =?utf-8?B?QTlONStWbndudGhaU3J4TDJRS3dCM2xQUHA1N3RQMGV2UlE2L0NIMDRaNDUv?=
 =?utf-8?B?ajVVenhDb09WSm0xL2VYUk1IMWM3WURpUExITmM3YU9vcU5RYjR6UTh5cHFx?=
 =?utf-8?B?ZCt0L2lwblErbkVhYUlraVhjSExjbWZ0aVJxYlRWRmJLYkVWRjNVeWlmS0Ja?=
 =?utf-8?B?dFptZUdYNHpWbTlGTzRUc0w4cVB2Y3RHWk5aUVlRNnQwYkZoQXRPdEFvUjR3?=
 =?utf-8?B?REtOVisvazRiSGo5a0NzUGdTb2ZSZUd4T1lFS3h5RUhKblV4d3dDNDl6VVgv?=
 =?utf-8?B?eHFpS2NFUTA5S1lOV1JGaHFtc3A1RzJKUk1NbU9SQnBGOXk5UXZVeWUxeGVU?=
 =?utf-8?B?SXE3K1hoaTdpY3RPclJRQkZYcjJmSVlETEEyMm52WGNuRHlEWGk3djcyTEtL?=
 =?utf-8?B?YnAwUlI3SUx4RGE1Qktyc0QrUit4cEM0MkoxYTFndEFadjF2MjU2OEs0Q2o3?=
 =?utf-8?B?eThzYzE0YloxOWxDSjBMamxJang0ZEZNZHc2V0lWNVF6YW1jZlNkS09TQllz?=
 =?utf-8?Q?DcY4c+lkGA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxyaUlpZHIzaUI2UWxjTkZRTkI1UHNpeENyaGdKYWE2TWw4MzBqcGt2eG1G?=
 =?utf-8?B?UTNTb0xIMmZjeitFZXRpUGtIbzB1MGNqWHp6Mm5kL2FvT29vSm1xbWVSZjEr?=
 =?utf-8?B?SWpzZXVMQVpadDl3ZCtqSjJOVlN6dzZRM0EreStKaS9teWtkampvY2VMUlRS?=
 =?utf-8?B?Zlkxd1BKV3Vva3Z1MmxDajRsTlpvaVArL3RLbHdKTVY2TGNoZGNGbjBlZ09l?=
 =?utf-8?B?dWROMG5PQmJHczhTYWV3WjA0VWx4bGFiZlJkTkJhdkF2dW5iZlhxQmpaaU4z?=
 =?utf-8?B?WnQ5VzRyYjUvY0pRZzVIMGdGMTk0Wi94TEJJTjVJVnV6ei82cVRmcmNYV2xq?=
 =?utf-8?B?ZXJjcnN1UlAzUTRBVFNFQWRlN3E5YVlkTnVJeFBST1RnREp4c2gzSXZBWExm?=
 =?utf-8?B?UGNRWmN3L0xpS09LV3YwWjdFcW45ZFhVN3pENDdvN1JqL0FaMFdZWUdreHBC?=
 =?utf-8?B?QjFRaTlKYm8vOUUyMTNiOVJSV1RndTJ4S0U2Yy9Td1JXM1ZjSG1kSFB3WFBE?=
 =?utf-8?B?VnFSYzVjUzdlZS8yZ1gzOGVSaDZFZ2puYXg4a0dtRWZLb3o2TmY5WEFsbWZx?=
 =?utf-8?B?UFppcU5ZMHNGUjNUWWE1eU9lTG5NTWh2MjhzZlZ1ODE3ZWlWZmt0NUxSbHpk?=
 =?utf-8?B?RzZFcldNdU1iRUhaTDF3d25Fb05tRnRMMnV3Y21iQ1hycjcyUGtKaFdxY25u?=
 =?utf-8?B?dTEyc3RoOFpVTTVkQmVrcStyejVseXpjZ0NEVy8rOTZueEoyL3JDUzRYa3BM?=
 =?utf-8?B?eldoS1I3dHY4WTdJZ0hxa0RxL2VJV3cxNDVNUWZMb281T245ZzdzOGxpbm11?=
 =?utf-8?B?OVE1dTZRSnExd3lXb0JrUHRDejRjckV1UXI2UVRRbUxLdmNzc0k1NTAzaXlD?=
 =?utf-8?B?OXFZTE15SnVuZ0dCeDFQMHBRcW1MN2ltUUNNSDVtSE5ZY25mdHFKcjYwTEQ3?=
 =?utf-8?B?TnpBZDdJbzIyeW4rQnA2Q1lKc2RBRVJjNURPaHRkY0UzbW0rbVEreDhybVRU?=
 =?utf-8?B?ZUxDV3BiU2E2WnFLZTZjNmVVSFRoVldJbElhVVpxNlRWaEpTVCtlV2plUk5O?=
 =?utf-8?B?SElyanRad2tHeVpJQ0NobkVRMFNuWDdsWUwyTmY1MDM0NVJqQWx2OThtM2pr?=
 =?utf-8?B?T3pqV2hVbFk2TytoV3kxNFNjT0t1d3N3NTRBWXZlelBOcDNpK2JXRGJEWlhI?=
 =?utf-8?B?ZWk3NXQ0c05TMTFMNEJRbXl5YUdZSlAzOTE1UnVqa3l3by81eGNOV2M1NmJR?=
 =?utf-8?B?THVSbDRpaDBJaVZrVHY4VVk4WmlnM0hFMXd5eGU1SW9zdWcrb2tFSGVzWjBt?=
 =?utf-8?B?djRQOHl5SGIwQWYzSGVUVENUTUV3TVcyZVZBdFlpc29sKzRsM0REdzIvWEFz?=
 =?utf-8?B?emkrZUtYdE8yMTZNWmR4TlVOSEJZQUNaUjNhOEE2NjBhaUFBTU95ZnNWZjVX?=
 =?utf-8?B?a21NOU9QRFJxdVR1SVZDRjZxRW9hWklxa1FMYTVUQWkzS1dlbkNtOGJPUXZz?=
 =?utf-8?B?a0hDKy9MRitNdFpKMnZFa29NdkFPZ0ZDMXBIcjNmaEJHa3l4OC9KMlJlU1Ex?=
 =?utf-8?B?Z2VOTWIraGRPUXA5d0RFbVo1ekdwWG9MZVZQanZxczNCUTlFMDJSQ2h2UldR?=
 =?utf-8?B?MU5lNFJpcGhqTHRHUHJlci9YRDRiUTZJMTZsSHg3c3E0TjM2N3EyMEpHS0Er?=
 =?utf-8?B?U3lMZDVHcjdINXRGbE5Pd3NWWU03STZvc0VUMUhER0h2RW12NWVJVEdjVEpE?=
 =?utf-8?B?L2xuOXlpaHRQZno5R25pQVJwMUZkOVZqdC8wVTJsTFZwb1l0dEY2YjlWMGd5?=
 =?utf-8?B?bGlhU01VbmpjZ05oUGQxVlpaWHBwUUl2cFI1RDE4NUZpbjRoZ29Ga3U4eU1L?=
 =?utf-8?B?QVBCVXFTdmQzeVBTM0ErWU1PMDJYZStUM3pPNFdkQkVQVWlzUTlKWVpCM2dk?=
 =?utf-8?B?MEU0bFhCWGhCd0x3SU54c2pVSm9XWmVFbEFsL2htYVpFZTIvd2lNMUhValFp?=
 =?utf-8?B?UHVaTU8zdkI3SWRkRmd4cUhsT05ZaVZ4YTdGVDBKU29HeHVHdlFxWkhNV3Ew?=
 =?utf-8?B?WEJWYlVwc2tlNDJUWCtzb0N2UktKUU4rM2pGZDNwTWphTEt2aVM4dUhBNkN0?=
 =?utf-8?Q?mZcAfeRtKpom8sf/PvKKkTsA0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d046caa-233c-4c3c-6e3d-08ddb4b5d288
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:31:57.3556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2xEGZ13pQv6sq62X4D8/tH+1OycInCEzvHDBt6F6GbUsWtILALRCJhvK+j97/is93veRlqLioDpKe+gqbpsGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF4999BF6
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


On 6/26/2025 5:28 PM, Christian König wrote:
>
> On 24.06.25 13:34, Sunil Khatri wrote:
>> move the debugfs functions from drm_drv.c to drm_debugfs.c
>>
>> move this root node to the debugfs for easily handling
>> of future requirements to add more information in the
>> root directory and one of which is planned to have
>> directories for each client in the root directory
>> which is dri.
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c  | 37 ++++++++++++++++++++++++++++------
>>   drivers/gpu/drm/drm_drv.c      | 19 ++++++-----------
>>   drivers/gpu/drm/drm_internal.h |  6 ++----
>>   include/drm/drm_drv.h          | 24 ++++++++++++++++++++--
>>   4 files changed, 61 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 2d43bda82887..a227903c29c4 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -44,6 +44,9 @@
>>   #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>>   
>> +static struct dentry *accel_debugfs_root;
>> +static struct dentry *drm_debugfs_root;
>> +
>>   /***************************************************
>>    * Initialization, etc.
>>    **************************************************/
>> @@ -286,16 +289,39 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>   }
>>   EXPORT_SYMBOL(drm_debugfs_remove_files);
>>   
>> +void drm_debugfs_init_root(void)
>> +{
>> +	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>> +}
>> +
>> +void drm_debugfs_remove_root(void)
>> +{
>> +	debugfs_remove(drm_debugfs_root);
>> +}
>> +
>> +void drm_debugfs_init_accel_root(void)
>> +{
>> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> +}
> I think that this can be done in just the drm_debugfs_init_root() function. No need to split it into two functions.
Sure, Noted

Regards
Sunil
>
> Apart from that looks good to me as well.
>
> Regards,
> Christian.
>
>> +
>> +void drm_debugfs_remove_accel_root(void)
>> +{
>> +	debugfs_remove(accel_debugfs_root);
>> +}
>> +
>> +
>>   /**
>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>    * @dev: the device which we want to create the directory for
>> - * @root: the parent directory depending on the device type
>>    *
>>    * Creates the debugfs directory for the device under the given root directory.
>>    */
>> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>> +void drm_debugfs_dev_init(struct drm_device *dev)
>>   {
>> -	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>> +	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> +		dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
>> +	else
>> +		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
>>   }
>>   
>>   /**
>> @@ -322,14 +348,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>   		drm_atomic_debugfs_init(dev);
>>   }
>>   
>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -			 struct dentry *root)
>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>   {
>>   	struct drm_device *dev = minor->dev;
>>   	char name[64];
>>   
>>   	sprintf(name, "%d", minor_id);
>> -	minor->debugfs_symlink = debugfs_create_symlink(name, root,
>> +	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>>   							dev->unique);
>>   
>>   	/* TODO: Only for compatibility with drivers */
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 5d57b622f9aa..db19aef9cfd2 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -69,9 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>    */
>>   static bool drm_core_init_complete;
>>   
>> -static struct dentry *drm_debugfs_root;
>> -static struct dentry *accel_debugfs_root;
>> -
>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   
>>   /*
>> @@ -184,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>   		return 0;
>>   
>>   	if (minor->type != DRM_MINOR_ACCEL) {
>> -		ret = drm_debugfs_register(minor, minor->index,
>> -					   drm_debugfs_root);
>> +		ret = drm_debugfs_register(minor, minor->index);
>>   		if (ret) {
>>   			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>>   			goto err_debugfs;
>> @@ -752,10 +748,7 @@ static int drm_dev_init(struct drm_device *dev,
>>   		goto err;
>>   	}
>>   
>> -	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> -		drm_debugfs_dev_init(dev, accel_debugfs_root);
>> -	else
>> -		drm_debugfs_dev_init(dev, drm_debugfs_root);
>> +	drm_debugfs_dev_init(dev);
>>   
>>   	return 0;
>>   
>> @@ -1167,10 +1160,10 @@ static void drm_core_exit(void)
>>   {
>>   	drm_privacy_screen_lookup_exit();
>>   	drm_panic_exit();
>> -	debugfs_remove(accel_debugfs_root);
>> +	drm_debugfs_remove_accel_root();
>>   	accel_core_exit();
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>> -	debugfs_remove(drm_debugfs_root);
>> +	drm_debugfs_remove_root();
>>   	drm_sysfs_destroy();
>>   	WARN_ON(!xa_empty(&drm_minors_xa));
>>   	drm_connector_ida_destroy();
>> @@ -1189,13 +1182,13 @@ static int __init drm_core_init(void)
>>   		goto error;
>>   	}
>>   
>> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>> +	drm_debugfs_init_root();
>>   
>>   	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>>   	if (ret < 0)
>>   		goto error;
>>   
>> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> +	drm_debugfs_init_accel_root();
>>   
>>   	ret = accel_core_init();
>>   	if (ret < 0)
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index b2b6a8e49dda..d2d8e72f32d9 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>>   #if defined(CONFIG_DEBUG_FS)
>>   void drm_debugfs_dev_fini(struct drm_device *dev);
>>   void drm_debugfs_dev_register(struct drm_device *dev);
>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -			 struct dentry *root);
>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>>   void drm_debugfs_unregister(struct drm_minor *minor);
>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>>   {
>>   }
>>   
>> -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -				       struct dentry *root)
>> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>   {
>>   	return 0;
>>   }
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index a43d707b5f36..7964dd878144 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -566,9 +566,29 @@ static inline bool drm_firmware_drivers_only(void)
>>   }
>>   
>>   #if defined(CONFIG_DEBUG_FS)
>> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
>> +void drm_debugfs_dev_init(struct drm_device *dev);
>> +void drm_debugfs_init_root(void);
>> +void drm_debugfs_remove_root(void);
>> +void drm_debugfs_init_accel_root(void);
>> +void drm_debugfs_remove_accel_root(void);
>>   #else
>> -static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>> +static inline void drm_debugfs_dev_init(struct drm_device *dev)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_init_root(void)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_remove_root(void)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_init_accel_root(void)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_remove_accel_root(void)
>>   {
>>   }
>>   #endif
