Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E9AB87A2
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 15:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12C10E87E;
	Thu, 15 May 2025 13:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vKLlDk4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D632110E87D;
 Thu, 15 May 2025 13:15:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cctNnlEXulkc26k+GZ9l1HzTGTFfZ3xNuoIiB46see8MQWcJX7RlgY629HqyXNIHdugc4gsu7p8ycTsGGXK7ZjA6O0pn6G6LzC2+KTQHnhxcCxTpypJKNmwDLhv7M1RBy/vPJ52h1mnNgq6CmCk004bhty+28zOtrQMKDT0IJlJm6cNoAZxAd5qzhr2oEyrGBdIv6gMo+8jXxVKEeJ2tSIwjeez7YvtKmgghFlQMNRLM970/4h/xYWlc8ZCASXh+/HC3t4Wly7SERpNRvYwbCYklwIgRH6PUuGI+dHDItJ8KPb/Jf6MmxWSr7vG2OAQFT6Hhz1RaT2rxy8JkDRg5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1Ao8lHC7Gt0DQDKNQ7agw60LaANBTmobeC+9VNpY1M=;
 b=NQDtrpilTkNmzoYlIL2pAuesIEEj6sa2QMHOHW/SqLVZ/YmCjXPSimiNyaATPL6g1934BcsrVbeZMHslsmlfJZ2BzhPPWFvqGh7n3RaEtF9f0WpSFK7N27SYleTumJ1Yd9pKAuyTSqgBjpzreosljGL5vQMNQqPvYnHXobw9gl12svdAvxK0pqnznKvS+XYUqIUQRv3CTdnxTGb4kI4U6iFaMi6pFWnMBLuW074MLT1EqH+564VN00IwG6DTZa7J2PBdirZfiApYgJ4RqHhtPa7ULQlpsSiGVuIMP4sPyWfrOu1UsApadjdSV+nHX3Drr3WqSbzKf6HlT05RUCc9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1Ao8lHC7Gt0DQDKNQ7agw60LaANBTmobeC+9VNpY1M=;
 b=vKLlDk4FxkLw7Ww/2q+IE/Z2qlpy4hcWVK6Srr9sT1Z1kPAJZ5R4lKdWYBmo1pG+SN1fzb+nsUhkrm6sZ6lh+/pkT9lLyUfDeRyfj6bNPxfrvIm0nEtc88WyI4UvMdegbvgbXor2jU2GewyE8jk6ZnXcGVa0Q9/3hxz7PLJ7/3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7084.namprd12.prod.outlook.com (2603:10b6:a03:4ae::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 13:15:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:15:22 +0000
Message-ID: <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
Date: Thu, 15 May 2025 15:15:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb1cd6b-9b69-4cb1-aba3-08dd93b28c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVZMN29pcUc5dnp2OHBQRWR6aHpEV0twREVWYjY4eUg0OENtUGVabVA0dWpP?=
 =?utf-8?B?dGhqYjBxeDIyNzQ1V0FUd2FUUTVhUlRDOFVPaWZmV3VJZlUwYkZxQi9QZDZt?=
 =?utf-8?B?V2FEekY0cDZxcDZlNXdJaDVMWitxRkNVSzVoUHI2RjhXeDE5MHFWckM2em9q?=
 =?utf-8?B?VEs2S0UrT3VoZXlsNWRlQmpvaWJVZmFkQXl1bEpyTkMrc2dMSFBxZVBLSVVj?=
 =?utf-8?B?blptU21ENm9ueitzeXNZTjlnWGVEekk0MHd3KzZJQW83eExRNG5JRTJLdlRX?=
 =?utf-8?B?TmRURE91cVlJTkY4TWNWdUhZSmZLallPWEw1WjgzWXJudjZlT2FpOWZkV2dX?=
 =?utf-8?B?Sk1PV0pEdWg0cjZPUEVpWE5vMkhYQUJzSXp1RGlLdzYzaytrM2x6M0FGMU1w?=
 =?utf-8?B?N01QMVJKc0JKclg3eGFBY1VvWERJMkRSNnM1RW52N25lOGZZUlNrVDZHbkEy?=
 =?utf-8?B?R25YRnNxeDIxTFhjK3diTUdoWUVhOFlTOGlRS1hlOGY1Q1BRY3B4blNIYnEr?=
 =?utf-8?B?SmEvUUZ5Nm9PdnFuMFJ4bG1CSUpMRkVpQTRweUVHOTcyQnIzNGlQQzFQQllK?=
 =?utf-8?B?NmlMbG8rSnRRSkZCL1VYUnE1Unc5bUpyV2JHdmZ1dGhtUTVlTGJhckFIZmZa?=
 =?utf-8?B?cysrNDhFVTg3cE1IcldlZVRGQ1M0UkU2cHkyb1NuOXdhOCt4Z1JFaTc2UEEv?=
 =?utf-8?B?UlprMUwxU2dqNy90bDVuUzJzYUZxdWRIaUJBN2VybWd1NXFNODhsSFF2V2kw?=
 =?utf-8?B?QjlUcW1VZVZLQWdVM3lCV082aHJvR0FCeSthSlYyOGZrbWVYWnVqVGxmN3hE?=
 =?utf-8?B?QXdtTG1Ja0s0MmVoQmVmdFR2dU5CSDZLdnRRZjdaR2NCK1FsdlJDdWx3dlZR?=
 =?utf-8?B?aTg0a3Fjd3Q3L2Q1NlZvbk9TVVl5d05QcVlESG53Ly85R1RrRHlJM3JNbmhS?=
 =?utf-8?B?ZnhTaDJyNVR2VlFsd3YvU2F6MERxbmp4SjNUOUptNHU3cEpmWlNtSmZLWExK?=
 =?utf-8?B?aDRlRmpmSU1VNzNLZitnRlJVNzdFMmMxWEFHMy8yc1phRjdXNm9kcnlXYllt?=
 =?utf-8?B?ZktTSU82bk5KUTZjbUxEalY1eTRHRlhJQmdSUlFBZzlIZ29IZXNKVnBxRnZq?=
 =?utf-8?B?YXRmK0ZtTnU3OUJUd3NYSlhBR3R6YVoveEk0WXZWUG5YUHhQaFFLYUphMlJS?=
 =?utf-8?B?MnBaYkNDamY5UVJoS1F3V0VGQ3dueklTVVB5N1E2RW52dkF0Y1NNTjc4ZUgw?=
 =?utf-8?B?RjBTeWRXSFg2Y2dOV3JDN0lNdHl3UENyTVVlMFRPMEE3Wm10MWFWWmc5LzM2?=
 =?utf-8?B?LzJoTlB1QUV0M09ZVUJSck9tK1ROZFErMHZNZzZTM1NHdUdDSUF6V3VxcnB1?=
 =?utf-8?B?azlKanVNMThJamtLOVNHRVpmeGVWOW9RTXhnQ1YwMURIYkFiSGRPU0M5ZFZB?=
 =?utf-8?B?VFpydHBrK0xMRXJRd05KS0JiTWxnNXl5M3lkZGttc1JFT21YaFJIb1JYS3Bk?=
 =?utf-8?B?YkhCUkZ0Wm1zS0F3WFVRZTd5WmtoenZ1bjVvTFZCSjBDaG9GVkdBRk5YaVA3?=
 =?utf-8?B?NUg0UjlUeEVqWldEeFljWUljL0VwL1dMZWs3emVUczZydW1sOEl4NUJySllx?=
 =?utf-8?B?dm1Wd1JxT2RDOWI2RHNFb0lBQ2VzdWJpR1A4NFpnNUk3N3NxNVN2d01rS0Fi?=
 =?utf-8?B?VURDcE9HR0d6MW5KSHhNMjZWR1U2cXB3b3dLR1ljWXVXU0tLcHhBY1Y4QVRa?=
 =?utf-8?B?TkIwTHVFVmQrNFU0Y29jRG9Jb0s1T0ZTKzRCNWYvWnZqb2g5OTlGZG8vZ1RQ?=
 =?utf-8?B?QllaM3p6M1VUU2lMWHlGc3lTU2VlT1cwTE4ycnMzdFRwRGFzQ3dzS2xCR0lC?=
 =?utf-8?B?bk9sVmJwNm1BenVXazRHdlBuYXFYTUxDck5rNXJzUkxYQTRaZkY5dnAzWi9t?=
 =?utf-8?Q?jWY/sexDzjU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmFQRGdLbU5ZNVJsaG1Ba3ZqeHVmMUdJOVEyZUIwenQ0ZjFjb3JHNEJuaHJ3?=
 =?utf-8?B?azRxeGduekFua2pDaVduQnkrOHY5d1BOUnNFampYRnJKYm1PZ2VRYnZjTklz?=
 =?utf-8?B?TVE4UlpHaU1td3g1SjNwWEZYa253cGxkTzNvbFZDZWhWWGJ4RFdRdkNUbHhS?=
 =?utf-8?B?cHpHV0IwTm56OHQ3NklrcWlMYWdySG9DYUZEOVRibml2WmpaeTVsMHJtVkNr?=
 =?utf-8?B?Y0UydkEvWVl6RmJzYjBEVGVwWHBWTUNiZU1BdjdEYXY3amNDQU8wcVByYmVC?=
 =?utf-8?B?bEpxN2xlYU9EMHVNOE9wVlgvQU8wVzJIc0kzMitwa3pQUjI3RnZWVkhUZWRU?=
 =?utf-8?B?c0lvMi9zMW9pUW1nOXBpQVg3by9FeUg3NXhOQ0k5RGhSSXhmSllNTlpBUjlP?=
 =?utf-8?B?NVBHbUZ5d2c5R0FONWNrb0NtSklHcmpRdEhMeTRyU09JNjN5SkJ0ZVRUOEp6?=
 =?utf-8?B?RnZ5d2dTaklJSDB1cDJ1MnU1NUNXbC9Zcm8yM0J2aFN6TmFpRXhSdkYyNFF1?=
 =?utf-8?B?OElITzlWclZjQTQ4TUdQb0hoYjNOZDJrS1pma2syU0M4a052VUxXVDJUcXls?=
 =?utf-8?B?MHkvTmxjVnZ2S2RlUlN6OHF6QjhoczN6anpVeGdkMlh0Y3ZxaVRKbGEwclU4?=
 =?utf-8?B?ZE01QlBXNXVqekV5UzFNdU5SQkZidGY5MUFEUHlJbVBScE9pMnR5TFM3SVVm?=
 =?utf-8?B?MEJjaEdTNnUxM2pvT3N6VXRLZmxWS3A0SkxEWWxmUlp6dktJZzFiQ1VLbi9z?=
 =?utf-8?B?TUFxc1A4OGdQNFBRc2xNMHBpWnRZRThXTTZxMmR6cE83OFZ0ZXJuWWRQR3My?=
 =?utf-8?B?STFUaGZyMzlsUkRSMjAvWXczdEJDbXQrT2Z0L1JpQkJvbzBFbnZSQyt3ZHJY?=
 =?utf-8?B?c0ZiMVA5Sk5YY3I5Y3VhY2ZBME5aSWFYZUhscm5lbHZqckQ2ZllrNTVZVGow?=
 =?utf-8?B?bE5ibHVhaHRJeWh2MlRGckp2MkozbmxyRGx2cjYvZ2w3a283ZlhaKy9ocndi?=
 =?utf-8?B?dzFrWW5JUjJ5QlVFQWZUd1YzdDNrZ1V1S2h6UkgzOXhIN2txbThvb2c1czRx?=
 =?utf-8?B?RVZxclFtUE8vNjNyWlVuZVUwNUQ4cE1zK0tmZHFjL2dmb2FYOFdmTE5yMHVh?=
 =?utf-8?B?WUlad0VkTllzd0txUFVCNjYxYUpMa2NYdWs2Y2dCWGdxVTlXK1o0NHV6Tk9j?=
 =?utf-8?B?Qis5QkhuOFZUUG1ya0dXNGFNUFRNRUgzdFNNM2R2R0lSTEU0Ty92Z2FVa013?=
 =?utf-8?B?TElPSTVmMWxGVUs1anlDMCt5TG03ZnpUZCtZMXhjN0lkQTVLQlczbUI2S3pl?=
 =?utf-8?B?eEVuWVJUM1E0ZlVMVjlTTVpOUXFaMWtEakZpalFZS0pGSVVNRFIyemExNkdV?=
 =?utf-8?B?U1gzaC9KYm1ZdVR2Qm5IREZqdVhBVXZicitzNVBpWDh4YllWWnY4bjI5QnU3?=
 =?utf-8?B?VlNWeFhmUkpWVEVObUdOeFhtcjVqVjRETG82OHJ1aVVIaEdYZmcweTY2a3d3?=
 =?utf-8?B?TVBxRmRKbUFiVEtDQXA2bWduekJCZXFpb2FIdDJmT1plK3NNMnEyMk55MTNo?=
 =?utf-8?B?bmhSTHF4YjB2WXdZS3dYTW05TUoxaSt2d3BGd3pta3pnQlU3cW5rbU1qR0Fs?=
 =?utf-8?B?Y1N4Q3QrQk5hMVM3UUZBbjJhOE1OT0MySHZBSnNrODc4OGlDS0VYMVNKK3dK?=
 =?utf-8?B?TlZvYURFeXNCeXJtV2FPNi8xOGRSRU9aeFRRYXV5cWV3Q05QNi9kUnM2Wkg0?=
 =?utf-8?B?SldlM01NMkdSQ2JFL0tkR1RWT3NnUlV2VDJ2VDJOWDFPSUpZSi9KQks3MHVw?=
 =?utf-8?B?K0U2WnBDQ2hXR0RHMDcrdkIzdEtHTnhsOFFIY1V2b3JIVkJFcEhTTkFCTVU0?=
 =?utf-8?B?RFBZMGVuN0FyallHUnNjTUFxNFRyclJadWdWUmx2RmtUdkl6ZldnVXp6YkZu?=
 =?utf-8?B?YWFQTm1paUljeFBYbWxaRUR1UTlnWUlkQlZaYjQ4MjFoek4rRWRWNjVHQmE5?=
 =?utf-8?B?c2tKOW5nUnBLUmV1NG5lLzRzZG9zSkFIcVd6WHFMeG5uNU1neU1KQ3ZheXFj?=
 =?utf-8?B?OGV4dGVvYnJXTVdkQVhHaXZ6T2pRckdlWGxJaVRQMUtpWWJRSUN6dGtrcXI2?=
 =?utf-8?Q?S3op7mm3HJoRdZnWab1j27RZc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb1cd6b-9b69-4cb1-aba3-08dd93b28c00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:15:22.0868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMwUb9m6uYIgnEd3n8sTbnFkBQyzpfxGCAE1jRCeS6LeaTkytQ1RzpE7PfYPIa7t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7084
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

Hey drm-misc maintainers,

can you guys please backmerge drm-next into drm-misc-next?

I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.

Thanks in advance,
Christian.

On 5/15/25 11:49, Tvrtko Ursulin wrote:
> With the goal of reducing the need for drivers to touch (and dereference)
> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
> the fence->flags.
> 
> Drivers which were setting this flag are changed to use new
> dma_fence_init64() instead of dma_fence_init().
> 
> v2:
>  * Streamlined init and added kerneldoc.
>  * Rebase for amdgpu userq which landed since.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
> ---
>  drivers/dma-buf/dma-fence-chain.c             |  5 +-
>  drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
>  .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
>  include/linux/dma-fence.h                     | 14 ++--
>  6 files changed, 64 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 90424f23fd73..a8a90acf4f34 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>  }
>  
>  const struct dma_fence_ops dma_fence_chain_ops = {
> -	.use_64bit_seqno = true,
>  	.get_driver_name = dma_fence_chain_get_driver_name,
>  	.get_timeline_name = dma_fence_chain_get_timeline_name,
>  	.enable_signaling = dma_fence_chain_enable_signaling,
> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  			seqno = max(prev->seqno, seqno);
>  	}
>  
> -	dma_fence_init(&chain->base, &dma_fence_chain_ops,
> -		       &chain->lock, context, seqno);
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> +			 context, seqno);
>  
>  	/*
>  	 * Chaining dma_fence_chain container together is only allowed through
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f0cdd3e99d36..705b59787731 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
>  
> -/**
> - * dma_fence_init - Initialize a custom fence.
> - * @fence: the fence to initialize
> - * @ops: the dma_fence_ops for operations on this fence
> - * @lock: the irqsafe spinlock to use for locking this fence
> - * @context: the execution context this fence is run on
> - * @seqno: a linear increasing sequence number for this context
> - *
> - * Initializes an allocated fence, the caller doesn't have to keep its
> - * refcount after committing with this fence, but it will need to hold a
> - * refcount again if &dma_fence_ops.enable_signaling gets called.
> - *
> - * context and seqno are used for easy comparison between fences, allowing
> - * to check which fence is later by simply using dma_fence_later().
> - */
> -void
> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> -	       spinlock_t *lock, u64 context, u64 seqno)
> +static void
> +__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>  {
>  	BUG_ON(!lock);
>  	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
> @@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  	fence->lock = lock;
>  	fence->context = context;
>  	fence->seqno = seqno;
> -	fence->flags = 0UL;
> +	fence->flags = flags;
>  	fence->error = 0;
>  
>  	trace_dma_fence_init(fence);
>  }
> +
> +/**
> + * dma_fence_init - Initialize a custom fence.
> + * @fence: the fence to initialize
> + * @ops: the dma_fence_ops for operations on this fence
> + * @lock: the irqsafe spinlock to use for locking this fence
> + * @context: the execution context this fence is run on
> + * @seqno: a linear increasing sequence number for this context
> + *
> + * Initializes an allocated fence, the caller doesn't have to keep its
> + * refcount after committing with this fence, but it will need to hold a
> + * refcount again if &dma_fence_ops.enable_signaling gets called.
> + *
> + * context and seqno are used for easy comparison between fences, allowing
> + * to check which fence is later by simply using dma_fence_later().
> + */
> +void
> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +	       spinlock_t *lock, u64 context, u64 seqno)
> +{
> +	__dma_fence_init(fence, ops, lock, context, seqno, 0UL);
> +}
>  EXPORT_SYMBOL(dma_fence_init);
> +
> +/**
> + * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
> + * @fence: the fence to initialize
> + * @ops: the dma_fence_ops for operations on this fence
> + * @lock: the irqsafe spinlock to use for locking this fence
> + * @context: the execution context this fence is run on
> + * @seqno: a linear increasing sequence number for this context
> + *
> + * Initializes an allocated fence, the caller doesn't have to keep its
> + * refcount after committing with this fence, but it will need to hold a
> + * refcount again if &dma_fence_ops.enable_signaling gets called.
> + *
> + * Context and seqno are used for easy comparison between fences, allowing
> + * to check which fence is later by simply using dma_fence_later().
> + */
> +void
> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		 spinlock_t *lock, u64 context, u64 seqno)
> +{
> +	__dma_fence_init(fence, ops, lock, context, seqno,
> +			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
> +}
> +EXPORT_SYMBOL(dma_fence_init64);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> index 1a7469543db5..79713421bffe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
> @@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
>  }
>  
>  static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
> -	.use_64bit_seqno = true,
>  	.get_driver_name = amdgpu_eviction_fence_get_driver_name,
>  	.get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
>  	.enable_signaling = amdgpu_eviction_fence_enable_signaling,
> @@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>  	ev_fence->evf_mgr = evf_mgr;
>  	get_task_comm(ev_fence->timeline_name, current);
>  	spin_lock_init(&ev_fence->lock);
> -	dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
> -		       &ev_fence->lock, evf_mgr->ev_fence_ctx,
> -		       atomic_inc_return(&evf_mgr->ev_fence_seq));
> +	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
> +			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
> +			 atomic_inc_return(&evf_mgr->ev_fence_seq));
>  	return ev_fence;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index 029cb24c28b3..5e92d00a591f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>  	fence = &userq_fence->base;
>  	userq_fence->fence_drv = fence_drv;
>  
> -	dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
> -		       fence_drv->context, seq);
> +	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
> +			 fence_drv->context, seq);
>  
>  	amdgpu_userq_fence_driver_get(fence_drv);
>  	dma_fence_get(fence);
> @@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
>  }
>  
>  static const struct dma_fence_ops amdgpu_userq_fence_ops = {
> -	.use_64bit_seqno = true,
>  	.get_driver_name = amdgpu_userq_fence_get_driver_name,
>  	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>  	.signaled = amdgpu_userq_fence_signaled,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> index 51cddfa3f1e8..5d26797356a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>  }
>  
>  static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
> -	.use_64bit_seqno = true,
>  	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
>  	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>  };
> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>  	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>  	spin_lock_init(&f->lock);
>  
> -	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> -		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
> +	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> +			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>  
>  	/* TODO: We probably need a separate wq here */
>  	dma_fence_get(&f->base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 48b5202c531d..a34a0dcdc446 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -97,6 +97,7 @@ struct dma_fence {
>  };
>  
>  enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_SEQNO64_BIT,
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> @@ -124,14 +125,6 @@ struct dma_fence_cb {
>   *
>   */
>  struct dma_fence_ops {
> -	/**
> -	 * @use_64bit_seqno:
> -	 *
> -	 * True if this dma_fence implementation uses 64bit seqno, false
> -	 * otherwise.
> -	 */
> -	bool use_64bit_seqno;
> -
>  	/**
>  	 * @get_driver_name:
>  	 *
> @@ -262,6 +255,9 @@ struct dma_fence_ops {
>  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  		    spinlock_t *lock, u64 context, u64 seqno);
>  
> +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		      spinlock_t *lock, u64 context, u64 seqno);
> +
>  void dma_fence_release(struct kref *kref);
>  void dma_fence_free(struct dma_fence *fence);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
> @@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>  	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>  	 * do so.
>  	 */
> -	if (fence->ops->use_64bit_seqno)
> +	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>  		return f1 > f2;
>  
>  	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;

