Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632DA96331
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C551710E548;
	Tue, 22 Apr 2025 08:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QjiCblgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58EB10E548;
 Tue, 22 Apr 2025 08:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTkpmjPcADkHA8aR93biRSTzPKu4Pr0UXB2hrw+xdvIOhqtJoxmapWKW6IbXIwZVpphFC1QqnZKCxYAMLhbLhFSvxMMbuDQFTZk9wHCwMMfroFrYFcwjOdkGohJCiQdqzVQ1c8VVqRP8seegGeIrSkd4D7A6Zr7+lujdCWDFPUBrMpa+mhayFGWptCYKC/519VtG7a9KNiogVFok8+RZM2BhHQm/a++RIiX7VPny1DepaLdamqn0/CbiWAfPCOgyABTNvx2pqwQzm6wvXAdLkYp/9ianJdu/vm49CflTkdxI0WtJ6oNJpSuL9o0rHdp9Q/5OQwsBeoDZ2BvEB8P8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wlUGhM1sezdZyN048v04UTGrzoLHxvE2A+CrIrvPGA=;
 b=mCPthaTyKGUnI+O2cRjaAQkhoV08lmrFKZyQzd2yS+KzF6igmaEwmzpI4wJ9mk0QFYC1LU9TC/ggiqBvSVLsFW/7rlYqmWLrQMsuGtPwwmvl5/tzq/b7pE5yUA4ljYWtXSDTOQ+ZiqN9xvBwNHgG7cGAWIbQ+QjGqXa0sxrMWdkzQVpOQGi/zU75WjTlT4R9BOAlRHNyV3Gg8VbWAS228V+bwq+maK8fmmQAyp+41YJ15b4hnuesZdALHB2hQ+X1Qx+esgOj0pTh2JUSM5e6rVpVBJERuR0LvJ9EhQhGNXmdrXbes+Ep6veWcqTEJAGvU+roYt0+2qCjG3X9uV/Lww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wlUGhM1sezdZyN048v04UTGrzoLHxvE2A+CrIrvPGA=;
 b=QjiCblgjinGlhZgpqkXEHJu9mxtfdlkeR8rb381JdvGEG2h2lQOb1CLowY30oinakWtoNrE3Q9T+FT2/LtnHGYGLIfGb1QWZhABwv7Za6/yhb6u4o0RClHuV7E2oH2AnIPEnV0bzsda3UPEQ2iMYM4S/5r83GQ56iXlcKFkhWro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 08:57:43 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.030; Tue, 22 Apr 2025
 08:57:42 +0000
Message-ID: <50506fc2-4b42-4b40-8a87-0f36f4664513@amd.com>
Date: Tue, 22 Apr 2025 14:27:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 2/5] drm/amdgpu: add drm_file reference in userq_mgr
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417161042.120981-1-sunil.khatri@amd.com>
 <20250417161042.120981-2-sunil.khatri@amd.com>
 <4714e132-e875-4a16-b94b-0d5af0418b7f@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <4714e132-e875-4a16-b94b-0d5af0418b7f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: f65e1dd9-735b-4032-bdd3-08dd817bbddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0MxVEpDSWIvVmNadm5nRVQyYkp3dXVvRC9raDJFSHpndCtmWFhlaDZ3T0lQ?=
 =?utf-8?B?bnRwbkdUNUNuNGh0S1R1N0xHbXNqRFhVcDNDOHQrZXd0R0hGbjJSYks5TUZK?=
 =?utf-8?B?YVh6SVpGV0RYNExOSzNtb1VENjd2a2FGaElaZlU5WW8rTkJXMDJPdDJNd3NJ?=
 =?utf-8?B?THJxUGxxYjBOTmFiMUNZb2NOKzJoS0Jla01ETmQyU1BjQmFLeldoU3c5SVpR?=
 =?utf-8?B?S2dXTjZ4bE55c2pqTzIzSzJENC9lYmNyckhManFzYW9lREpqbWN1b05WOGl4?=
 =?utf-8?B?dUllNkZhWVNFQXdWZURUT200cUE4U0dSNi9YQ09qNmY3NlJjdHdpdU9EQWdw?=
 =?utf-8?B?djBldjFPbStwRzBlTGlKSTBwZTlNeTFscjR6d2x5Wm5iUlROMk5tVnlEV1JU?=
 =?utf-8?B?NlQ0NDJUL2IvcU93Rm9mZXdLcW5QTjdGbmpwbzdCWkNGYWxvMTltY3p1a0I5?=
 =?utf-8?B?NEFIM1BLSDdTemJRUVNKRS9IZ251WmEvWm1BYXF6L1dwVlI2YTJqQXdoSWJS?=
 =?utf-8?B?UFg2UlRWZXdvNFRkalR5eVpqQ0RpT3R3amszbzdvSk02UzlLZlIrekxJZjZ3?=
 =?utf-8?B?RFlUMExXUDZpdStWQmpRNVBRM2RjTThZQWY3TjRHcDFDN1ZIMVZNYm1DdXJD?=
 =?utf-8?B?bGpUSjFuZXdKUUhIOVJIam84ZldKbFJLQzkxdWdjdks2M1VYTmpwdk5ETnh4?=
 =?utf-8?B?LzVXUEZwZWRqYnVrR1I0bUxETTczMEdpUGtxQ2kvYy9EZkJ3MmpBWEpsdzZu?=
 =?utf-8?B?Y1IwMzJTaWlxRDM0Z2g1VDR4cXBScGFvUitjVW12Qmo0QmFkN0t5a1RwWEND?=
 =?utf-8?B?aS9CcXFJMzJJelkvNEM3VGZ0Y3hBank2R280Z081Rkw0Qjl5ZGtlOStIZWdT?=
 =?utf-8?B?bU01ejNiWEhCQktZNW85Z3g2WEZQUlYzWDhEcFN0cnRzdXIxTFhUM2JFWnNy?=
 =?utf-8?B?UnBUbHhrRFdRemRGSHJmdHVBTWZvQzJmYU15a3JNWTFsRmNwU3l4NEt6SUpm?=
 =?utf-8?B?WGdzWXRxM3UzV2FhMXFlZG5ybitpSDV1SEFkSXdVQjFMem5GT21lRWNYNWE3?=
 =?utf-8?B?MUxiOUx3OHRLN1U4aGRTZitJUFFsUC9KTkl3TC9OOUU5VHI5VkFoTHJpVVJk?=
 =?utf-8?B?VTEyWjZMU0ZtOVR2ajlWdEt0OHRjVWFSYlJjdE1tNzh4ZTZhZ1MzYVg3ejJ1?=
 =?utf-8?B?SjR3OHY1QTRYNytrVlNoVGpCSWNYckFEYTJzRmtDVUorU0c2T0dnejlmME1k?=
 =?utf-8?B?dTVDYlZoZ2hvUWNHYm9SRjhtWm5rZm5YWG9NOU1XaU9QblB1YVdWRzlDUFFo?=
 =?utf-8?B?T084NmtneFdXMjJhdlovaEtXY2xxWGZnZitDYmQvNTNDODVML1lWRDhES1R1?=
 =?utf-8?B?VzR4aVVyVnRWMlNjbU4yZ3hESklKeGR1VWpGWVpxVS9tQmRLV01MUTBLK3VL?=
 =?utf-8?B?TWFGYVZoOUg4T1pabnNnVDYvM3BITmtxQUxmSFl3NWNWcWloYldXRWJCL2Yr?=
 =?utf-8?B?MC9FTUZ3eWo5akFuNDh6aWE3b1FCYWR6eXB6TUhWQlFOYlRLRURhd2lITWRH?=
 =?utf-8?B?U0xJSEJycEVkQ1kwTlU0cC9EWVdseXI2UGMzWFB0enMyUFc5QmlBRFJ4elli?=
 =?utf-8?B?RkVSVDBER3p6UkJhckg4eVVpaEZkQktLZzJQWDRkVkllamZSaGJSbFFQL0lz?=
 =?utf-8?B?MnhGRlBRNUpFWVNXa2t6UmZGQlVTSlU1TWMrMGJzbWZVNVNUa2tHSXJQaDNY?=
 =?utf-8?B?ZTlFVURwRi9NZTlqZGNwcms5U08zSXJmV2VsUDVZa2Q4RUpCa2tBUmJjWUVE?=
 =?utf-8?B?Q3VETlFhWm0yNVZaUmc0bVc2U2hac2Q2RjlsODNjT21KRlZOT01zcjliUk04?=
 =?utf-8?B?VGlRT3dvbnZvdUp2Ny8vQ3hRMDVZbFpzYzdKK1JOQWJEa0gxNTVoV0tCMmE3?=
 =?utf-8?Q?zlCWhO6uTKA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2RNVzdla1F4ejdFdXhheWxMa0NaQXFOSG4zeDhqZkFMWlIzcjl4elNSRWh0?=
 =?utf-8?B?MENwQ1VYb0VVTVRPaWd0aVFyZ05aOWdrTXFtVklLS3Zsb1JLR0x6QXNIeEhr?=
 =?utf-8?B?Yy8yUERnMmRLYy9BUk5CT3NNRTJKVG54c0p1cUNJNHRpVGtib2Q5emg5VTZ4?=
 =?utf-8?B?L3Rud0g1aWJqTXIzNlUzWkZNMzN4OG5tc3RMVUFxQWdEYmRmalBvcDVxaSt6?=
 =?utf-8?B?NCtNNWZmaUlueU5MWnY0VW5CMnVadFBhYTlCVlVZUUpGUEVBYVM5L2g3TWFZ?=
 =?utf-8?B?N0hLQmM2QjkyM2JXbFJsQytGa1FCTmZPSlFDbThmTGxERHVuU2MvTHhQNCtE?=
 =?utf-8?B?YlBiVWRmRFZPbGtiOE1HWGtnc0crbXFvZmtPZ3phdmh0bUxrTXhBR1ZmbEJP?=
 =?utf-8?B?amlkQXpvM0hYbml0SllnWmNEcjk1Um1wZEdkS25wZVgvdDVWMDNMaWpPQll6?=
 =?utf-8?B?OGlGTUppZnBDQUFRODVuZFhzckJ3aXdyZnplQzMvRjVZZUxQcjNrcS9JRXFU?=
 =?utf-8?B?S3h4azV6QmRrNWp1Zm4rVktwV25qNTZKeXJMYUZ4dDRMckQ3YzlqMmM1R0Ry?=
 =?utf-8?B?bEtWTkdCbGljWm1hVytMdFNJSFF6VDVkUStMRVFHL2lERFNvR1E1RnpBOWdr?=
 =?utf-8?B?VitJSFc3cTlBTWhSNm5xc0VKZE51K05FTFFzcmVwL3JjbWI2WGgvdG1iYklQ?=
 =?utf-8?B?Nk81bnYxNG12OEd6dS9OMzFNRy9STGJYbFZDTHE3aU01R2ZvQkY0ZzQwY3JD?=
 =?utf-8?B?TW5pOTVzUGhMT21CczZ3V3NsWmdBb1d1VDg1ZjYwblllUVo2UjBnUmd3MG1C?=
 =?utf-8?B?RnNPNC9hS295bndBZENybUJvWmR5emxSempHOFNqU0N5V25kN3ZIc3g1Qjcw?=
 =?utf-8?B?d2xhSStoZ1JPVm5PclRDN2xSZDZsQitnd1p5RW5acHdadUFSRFFQaXZ0MGp6?=
 =?utf-8?B?V3Rudk5qWmxqdnJ6djIyb2t5ZWZFaEJPa3ZFWFppT2Q2WUgrbzFCOUxLV3g5?=
 =?utf-8?B?Y01wM0xTMlh0Qm1ZR0kyc3czNlZDS0kvck9TNGhkaS9RUGxJdFJ0OHJkL3BQ?=
 =?utf-8?B?WUJ3V1M2NEJpblJCSHpuaFFvZWoxaERpRHNZVlZtYzhKWElmVFA5bWJsNE0v?=
 =?utf-8?B?NE00M0k0WjdGRTBnNUdOWkxNQkVtempqdTBTbkxVZEQva25mWGRLMWdDL21C?=
 =?utf-8?B?bFlJcjZpTHp1QzNvc2gxV01hdm5iZzlzOU4wRVJrUWdhNEVMZm4yM09taHRC?=
 =?utf-8?B?ZEZQU2dXZ0pELzFMR0Z5THZBeTlQQU5FYjZvaWpqYTVxa0Z3UTVvMWRmL0hz?=
 =?utf-8?B?MU1aY2NhUWNEUnV6SnNhNDZZbmJjRVU3UVZ1S09JRTQvOUZlTEV0UlIrektm?=
 =?utf-8?B?eEI2UmFZM3E0aEJuaE9KSmtoek5WVjEzMWV3b3dBblBzZUZQcytZUVBHTDQ2?=
 =?utf-8?B?QjUvNXZRYm9rdnpFak91VWtqYkxYT1lqbUpQQ05NdlIrY2tGUjZ1b0ZzRDBT?=
 =?utf-8?B?NVBGR1NuZzNrQXFlYmhCb0lSRXlybEtZZjhHaTF6YzlrZGRDUEk5ZW93U1p4?=
 =?utf-8?B?N3l3Vlg1OS9qZHBDOVZPdUJtNWFDMU83Ky9hRmtyZVlPbERldzVMOWgzOTVK?=
 =?utf-8?B?MTFTRDhES2NEb1FuakdtdW02VS9FS3lCWEptZHFEUVVyQ0NRV3dCNDIwZ2tJ?=
 =?utf-8?B?VGY4UUhSM1N1RGYxU3BaWGxDYmY4T2E4WThDOGI5a2llQm9pQjhuVi9DTXl4?=
 =?utf-8?B?dzJIbnAwRGt2WUlPTHo2NlBFVy8vS0EwbkNvNmF2NVhXaS92NW9MdEY4eGhK?=
 =?utf-8?B?K0FZQ2s5TGo2bVVaT0x4ejRmYnRWS3ZwL0ZaNmZGb1MrVVVRSjQrV0ZwU2d6?=
 =?utf-8?B?b09VNXZxRldwS1dsaGxTUmZnUGp0NHZ6ckpPcTd0eUFjQlV5UWR6R3J3eUly?=
 =?utf-8?B?VzR1OE5jUGFuY0ZIZGhndzZrUHFNL0ZjaDFvY2Q4T2pLWkVrNWVrbXFxTWZz?=
 =?utf-8?B?U25EV3V5VmpkUkpBUk9aSC9ZeVRtbnBUcVdxY0F5ZWl2UjllMU5IT2M3VUdS?=
 =?utf-8?B?bmVSK3hUVHZKVE5yazUrZHVJREVUR2JBcU5seERCQkZNc1Z3S3ZoVFNpTWJ0?=
 =?utf-8?Q?cjnS+GK4pedGQ+/LTL8AJjxGu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65e1dd9-735b-4032-bdd3-08dd817bbddc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:57:42.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQ+f9d2Bz20qXHJAwEMUNNotgaXCr6cizU59Mm0AAZq3iNhDxd7dqSCZMxC6P2Ra0rB/5/NTmdEzWb/Panv7sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243
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


On 4/22/2025 2:07 PM, Christian König wrote:
> Am 17.04.25 um 18:10 schrieb Sunil Khatri:
>> drm_file will be used in usermode queues code to
>> enable better process information in logging and hence
>> add drm_file part of the userq_mgr struct.
>>
>> update the drm_file pointer in userq_mgr for each
>> amdgpu_driver_open_kms.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index 3d319687c1c9..3de3071d66ee 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -1436,6 +1436,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>>   
>>   	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
>>   
>> +	fpriv->userq_mgr.file = file_priv;
>>   	r = amdgpu_userq_mgr_init(&fpriv->userq_mgr, adev);
> It would be cleaner to give that as parameter to amdgpu_userq_mgr_init() I think.
>
> Apart from that Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks Chrisitian, i have that in mind already and will make the change 
when pushing to asdn after drm patch [first in the series merged and 
pulled back in asdn]

Regards
Sunil Khatri


>
> Regards,
> Christian.
>
>>   	if (r)
>>   		DRM_WARN("Can't setup usermode queues, use legacy workload submission only\n");
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
>> index b2da513b3d02..29c1360d8c8c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.h
>> @@ -79,6 +79,7 @@ struct amdgpu_userq_mgr {
>>   	struct amdgpu_device		*adev;
>>   	struct delayed_work		resume_work;
>>   	struct list_head		list;
>> +	struct drm_file			*file;
>>   };
>>   
>>   struct amdgpu_db_info {
