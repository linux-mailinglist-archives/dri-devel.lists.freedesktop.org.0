Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA82D1269D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4478510E3B4;
	Mon, 12 Jan 2026 11:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F5i2gqfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010057.outbound.protection.outlook.com
 [52.101.193.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950010E087;
 Mon, 12 Jan 2026 11:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIGfojc2npUS8XSdV+ZQ9XlwQDkrNEYBqEZlWbm0mreHJkW9gtned6bKX2WA0jM6Cjs4JoPgHloLV2dWzZuAS0H7SzHUCpjuitbcIVd4GBj9P88nQMAiK37phl0R/4uXzAFTi7GkDARq9r8WD5dI2WAlN1K0b/NAxp0kb/gVpKY7BMc4eRNFeo7AdFRTeXYVAsGiHHaiv+78j5jBlX05K8W5Phg38srZgB3EwTtfng5Hr/STNt+XpsCRg9bBKTGgxaTspaqxf60W2PWvErfEiFE4oLWlgGuy6vMouSlDw52aoG819NnmPb9FjuHpX3lKYqAKlwpvNAxcLrI2hU9xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCUIF3VGIt7Q0YEDuky8I7yKeI3DdgKdqxu8WbuUpKI=;
 b=MewhDBDObFEccWJp2sPiaGAej/cAZxb82T+Efkob61nZUOvNqaKTbMWvoZHwA+/0I5Dj/3dI77jk4z07GfV8owVW/5qgQ/GjiLkUYqEuL7GJBwyCUoVUWdOhRgEaY6RIngpPGzrDMImxuKKR7RnM0VQLVki6LNGecnUcroOaRJKpdnnssAwMkbS9V+bNqZa2u/jqDGDO2RIcIfEldj0xyrySaZYXelgOtxut7zGJHYJsR60WJoFY75485PDkbaXPa8rmwk3WHpNGPOZQmKyNkoLAwwpwXP4a9ixd47DHtTzmwwEa44QaQIvFy3tPo3Ta2bExY0AVvoTBCPSuaEzY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCUIF3VGIt7Q0YEDuky8I7yKeI3DdgKdqxu8WbuUpKI=;
 b=F5i2gqfPA6sVzu4gF0oTm4wGgQJcGsAfRxepySc+uC21yjRvpDBf8zaSwn9vqy1hzfPhJOjbAN7SfpsWnH+1B2XtGT+44GjunUpyqJ9INJSDLUc9cKGn8WiEKTSUfVBtKsqtPDs+x8DOiC94dhPPvvpIEYqHz1CpNgtrsZC97wE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:55:28 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 11:55:27 +0000
Message-ID: <ee4e502b-7b49-4ef7-b7b7-20afba189e1c@amd.com>
Date: Mon, 12 Jan 2026 19:55:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
From: Honglei Huang <honghuan@amd.com>
To: "Kuehling, Felix" <felix.kuehling@amd.com>
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <ab5d1bb7-7896-49fd-a9ea-19294f4f57ca@amd.com>
 <dc1f5de7-40c4-4649-8f2f-0fee4b540783@amd.com>
Content-Language: en-US
In-Reply-To: <dc1f5de7-40c4-4649-8f2f-0fee4b540783@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KUZPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::14) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|DM4PR12MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 17637cee-030e-4d30-aaa4-08de51d17a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3FMeTlZUUptU0ppNFhmSUU1WVFLb1p1UDhudXpTd1l0NEcyeVpnNVEzSlZh?=
 =?utf-8?B?OG9hN2NWR3dZQi9kM25ZSFU1SnJZZ1BLQWlFRzJKSXI4Qlc0KzRXbytiYXdM?=
 =?utf-8?B?RUIrOCtHVmNHYTR1aFAxNVNtdXpQbGRMcXZDSmNvU2IrVDZpQjYrM2JDNStz?=
 =?utf-8?B?SkZhTlpkUFJ5ZnZVYTVmWERjUDZINXdKdERuM1ExbWhyVWg3V3UyVmg2b1c5?=
 =?utf-8?B?ald3R3ZuV2hCNGo2TGpialVIMk0xWnZ1akt6S0RrUndsejduQUpCTVZzd0E1?=
 =?utf-8?B?NlR3TVIxekR2eUkrMlVkcGdCdDRZT0F2bDhWTC9ZWlZ1QllLWnMxdHVXL0Vk?=
 =?utf-8?B?bSsvK24xMGVMcTlSN3AyeFhTM1NWRWxqdnFDeGsrVnc2K3EyQmIwZHNyd0Vz?=
 =?utf-8?B?VDR2U1BxQTRKMkR6THdUZERCbFpGUEpLVTlvUWJBNlF0SExqVmVQcm41bVVU?=
 =?utf-8?B?NDE2OXp5Z1Zka1ROcVJRT0dhL2JOUlhKRU1BZnQyUU9TZ0dDVmZTenVYcVVk?=
 =?utf-8?B?amNQYTVWOStYSVIya1d4cmlMNmpwVWV6TzJ3ODUvaExsanczK3lMaFhIYXBX?=
 =?utf-8?B?TTk0RU1DNk8ySytZZTJKUXNjbDd5Rzc5UWwxWE56WmhvWVJ5S1ZtQitOWkh5?=
 =?utf-8?B?TktYZWtQcWxWa29WclIyRmJpRFhiMHFhWE1rZ2NpSUozRHkrbVF2aTJxRXp1?=
 =?utf-8?B?dzZEcEpRcVJGa1Nhc002S0VEaE9xY0hvUDViN1dGaUMvaWRiN1YyKzR5cGVt?=
 =?utf-8?B?am05Y2NpWGZjbkN2TWw0RDdJMnNkZVBnQ1BZcWZVTk9wejhHcVNvZnVpbmRC?=
 =?utf-8?B?T05aWmJGazQ4R0hrUzZMZFJFVkYrWlAyRnRraWJBa0RrYWFOUHd0QVlzN210?=
 =?utf-8?B?TU9JNWlraFk1UTBaRXZ2eFplY2txRUJpMmZwa0RpbHh0UXVPcUJEdkhCTjZ0?=
 =?utf-8?B?UVZZUjNlT0R1a0NCcUVQMU5WVWE3Z0JhQlh3QVhxQXNDYzBJeXB1NmdLeTU5?=
 =?utf-8?B?c05McWZLUDBlOG9kV2lJREZTK0c2dHdGMXo0U2oreXFFL0g0bStlWTBNWnRZ?=
 =?utf-8?B?MndKZVphWWc3L1VmK0dRVVplY3VXY0VqWjN2VVJDaGxtNWtxNjJJN0UxcjFZ?=
 =?utf-8?B?Y2xwQUVjZmwxekw0eTBEZjJqT0k1dVZ2TDA4c2hsUzRqY0g5eXQyMlhwQ1Zv?=
 =?utf-8?B?UjhRTGpZYnZlZklacjlYU1N1U1IzemFXRWhzY3BYV1Q0STFGcVhPb1FDa0Jm?=
 =?utf-8?B?Y0tWeGo4VDhIZk9xQlZHY2VWOWJuQzFUL2NGUE1INVFtT1VMdzBNUitNUmdk?=
 =?utf-8?B?TzRVQ2hXYy9ydTA3YjdiSUwxVTduVGV1bk9DcWJKQ0F2elg3Q0V2YWN5Q1dm?=
 =?utf-8?B?bzdtb2laN3l6b2ZzYlhqZnE3d3JVZ3F2dGpTNXlkb0p0MmtZbXk5TmlOeWFi?=
 =?utf-8?B?cUdnS3B3L1VTckcxOEhMVi9GRzM1NWsrb2hjUHJNaDUzMGhJdW4vcVlpOEdh?=
 =?utf-8?B?SzJtTWxTQzRQaENsT1BKVnZ4cytjNG1TUHBxSmxMc3VBVlRvbld5WGYrUmRn?=
 =?utf-8?B?Uzk0ZTYySEpaOXhqQjQzTjQwbURWZVpYZThDakI3ZzhlZWdaWlRsOTZ1MWVa?=
 =?utf-8?B?VFF5dURoZ1oyNGtKdk1tZ2NsN0dvRDRRN1pZanZYbkJLTTZSMFFMNlVjNWtB?=
 =?utf-8?B?YnN5eUJUSTNBMjE1YWxJVXQwMnJIaUZ3OGhBV1lPNlBoQ3ZKbFNKVEtTUDR4?=
 =?utf-8?B?LytvOGp0dmduU2RPTHNZbFhFSDBRamtrUTB6dWc3UEtoSCtLOU1qOUQzSWV4?=
 =?utf-8?B?R1JKTGZEVW9OYi9iUkRWdDY0c1BuVE9qZXBDV290aHR6MXcxWXUwVW5OTllE?=
 =?utf-8?B?Wk5YUDBDWnVCWWJBckdUd0VPekQ4a3ZlamU3U3YyTDVOMlNJcG5ya1poRnFG?=
 =?utf-8?B?TVduSGRJdzh3MWg4bzFFRWVmRjR6bHdFSnIxaXpXeHFXenJBS2RjY1Q2cTVI?=
 =?utf-8?B?V3RaNllsWmZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVNTT0o1eXovaUNmMWVNRVBYbFBoWmJ0eXh1NXg5RkE4dEUzVHlBdGVwSld6?=
 =?utf-8?B?Qk43TzVKekg0Mm1URnFOWVhhdFpaUHZmZXR2VC9IUzhPNmRWYUxRQUJWUEdQ?=
 =?utf-8?B?NmZxUy9YVUdqU3Nrb2g4K2FQVk5tT0RRYmtPUnpKUStjN3NrZlJrNzJjb3FP?=
 =?utf-8?B?RkdWNVlNUmV5TERKM1pLZGxlRWFTRmhzeVgrd3EzdWdnL2JVeGxicXJwYnk4?=
 =?utf-8?B?a1h4K1ZKZkNEZGhOdGEvUDRHamMrcGhOVXlrT25MZmlOanFtbnErV0JMbnZH?=
 =?utf-8?B?Z09wVXUyN21kMGNJM0I0WWpOQWJqODZIdEVtdFYrWjI5RitBTzJEYVhqUFRI?=
 =?utf-8?B?bnJZV1dwZ0lob01ad2Nwa0RSakh1bEFtSzJUSzVGNHpFb3BXaVBxZXBGVjdn?=
 =?utf-8?B?dUJuQ3hUQTh3a2FObWlEdTZUR2ZnUjZBUCtRYWtMRzU0bXlyTzFkVGt0TmJF?=
 =?utf-8?B?K0RYbXZPYTJkVklOUnhWbmtaSTY5Z3orQUg3Y21RRE1RUXdZamNYdStvSW5J?=
 =?utf-8?B?YUhEcUljV25RTlEvOGU5SkJuU01XVVp5MXFUVHRwNm5QSnI5dVBoYzJva0pD?=
 =?utf-8?B?TmJiVDROY1RKUmtwSWJKT1VEK0dGdlpzSWU0N1NpWThDZlN0MGRINXZQRXJG?=
 =?utf-8?B?cjZaeEh4QUtZYzZvcmFLUmtPYW40ZVdSMVdDVHRscmZmS0JFcmdVemZoZXFz?=
 =?utf-8?B?a3pDQ0lrVnJrbStCUXhtMUJuZWhVMDI2QUwrUWxaSDBmWmFrcXhGSGZSZDJj?=
 =?utf-8?B?djF4SHg3NGpIWnhHRnJXQlJTQ0Yxc3hLT0hlNE5mdXNHQmxQWTVBbDZmN1RQ?=
 =?utf-8?B?a2ZhQ3M4SWVmQTJFemxyeDR5VFcvb1Jrc2cvOFBkOFREMk9QTUV2OE1UYlBo?=
 =?utf-8?B?U1plUGVDWUZPN01WaGQ4RG5KUTlPUnNVRHNvcDJPaDlFeGpmM2FzL1E5VzMz?=
 =?utf-8?B?Q1BuZjJ2WE9NMGlheWNxZDM0RTNocGlqWUdzNU56cWJMYnhXemNIS3ZyRGht?=
 =?utf-8?B?MjRITTZXN0k3T3MrbEQ5b1ViYXdhZEoydEFreXIrekV3cXRoWkhldGhVdEF5?=
 =?utf-8?B?TTBFd3FHZzU5blh5QTQ4VGg2bzhGR1B6djByWGl0bnJTQ3dVZ2psZ282elp3?=
 =?utf-8?B?SW9YbzZlQzA5VVJvVzZRMExkTGFhSDJvVmFWUEozK1FIRE1vdXo2K0hxc2Fs?=
 =?utf-8?B?eVkrUUQvbXdXTDk5eDNxbWNvMnUxamthY1JEVmszTCtnWmh6WUdsUEU4eVZG?=
 =?utf-8?B?ODZRdXF2RS9tRWtiM1Fnb0dXS3MvVk42aVYzNUEreVVYbTM1anJIL2Y5V3hI?=
 =?utf-8?B?OGN6QkJtaE5Uc0lpTGFUdGJjSVpuMWE2bWFsRnB4UERjVG42RGhIVDlDSWNB?=
 =?utf-8?B?Skc3cGdVQmxpcnJzUGpQNDVoemxKZm42Y2x6U1FDMWd4aUV1ZHhBbklmTStw?=
 =?utf-8?B?VlBRVGVCSXY5c3Z2enJnbWNGcVN4WURZZkRNZFp3YnUxR2trcU9UTTlwZmd6?=
 =?utf-8?B?bmJQMlV5N1BWQ2hqczhkSUx4ZldnS3k4NUZ3WW9vdmNHOFFUZ2ZEWjcrekk5?=
 =?utf-8?B?d0RFQ1hFeFV4WEhqV2lYZmFKNHFqUVNDNzJPN2lBWmg1d2g1UnpxOGVaV2VM?=
 =?utf-8?B?L2hIRm1Obk9Lc0hCdTUzMHNWa1lwd2hmM2V4bUhqdnl6MXVqU1hRTi9kNEFt?=
 =?utf-8?B?eVFTc25FUUYxd1p1Zm83KzBQV1FNWkp6NVYzVS9lVk5jOC9td3UxYnlZcWtO?=
 =?utf-8?B?bzFwZEZ0OFdOTm5Obms4WHRHMDRYQlhaMHd2c2pWV3E0RWRQcHljRjJMYktM?=
 =?utf-8?B?WDNhWEdST081WExFS3N6dWVDYjg3RVZpSFJINVV0L2xrUFBLOXptUHV3VUtY?=
 =?utf-8?B?UHQ3cHdTeStWNENWN1ZNUTBlVjVYM1FNNzJRRW4yMS9YL3VYekZVM3hBdFZF?=
 =?utf-8?B?aDdHam5nc2szSm4xOGNxcjBma0YyakZ0SklWY0c5T2tlL20xRlBxK3ZKL0NY?=
 =?utf-8?B?VmtqNENVK2FaNXAxeXJoSTZjYXNFYlNOUC8zbit4UFZuR0VVZ2YvRHNzdDQ5?=
 =?utf-8?B?V2IyekFRRnhmZDdMc1hLSHEzRmp3M0I5R2t5TjZRa3QwQjJmU0h0dmR6QjNx?=
 =?utf-8?B?UStSVExYZkw1eW93VGtmQXl6QXBDeVczdmQxNVMxNStvZEMwNFV6VUpFbXFF?=
 =?utf-8?B?Q0pKbGRTQkFZSDJiL3lwR0FhRzdHNGRYdE5IQTVRb01vZTh1UkMyTDNRd1Nz?=
 =?utf-8?B?VFZ1b0JoNk9KdkNvUTErS1NXVFJTNTNLRlhJa3dod1cwRnpIZzZHVzNtUWVG?=
 =?utf-8?B?M2xOK0grM1F4bStuVGVDS25Zd2xqdURGeUNxOVVLRzlVZm43ekxIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17637cee-030e-4d30-aaa4-08de51d17a41
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:55:27.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LFq945EjsyuJGda3twqnakCZnoQc1U0JMy5rASJYmyyLrkG8Syb241Shwg1R9dp7WY050btakDa45D4yqoZnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6326
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


Hi Felix,

Thank you for the clarification about the render node transition.

I went back and checked the relevant DRM code, and I found that it is 
missing some infrastructure and it seems like the SVM is not supported 
in drm.

And most current hardware platforms utilize the KFD driver, we must
rely on the KFD infrastructure to enable this functionality. The DRM 
stack currently lacks the SVM infrastructure, and building it from 
scratch is not feasible for immediate deployment needs.

Therefore, I plan to continue with my previous direction to find a 
"minimal impact" technical solution within KFD.

Regards,
Honglei

On 2026/1/10 10:28, Honglei Huang wrote:
> 
> Hi Felix,
> 
> You're right - I understand now that the render node transition is already
> Appreciate the clarification.
> 
> Regards,
> Honglei
> 
> 
> On 2026/1/10 05:14, Kuehling, Felix wrote:
>> FWIW, ROCr already uses rendernode APIs for our implementation of the 
>> CUDA VM API (DMABuf imports into rendernode contexts that share the VA 
>> space with KFD and VA mappings with more flexibility than what we have 
>> in the KFD API). So the transition to render node APIs has already 
>> started, especially in the memory management area. It's not some far- 
>> off future thing.
>>
>> Regards,
>>    Felix
>>
>> On 2026-01-09 04:07, Christian König wrote:
>>> Hi Honglei,
>>>
>>> I have to agree with Felix. Adding such complexity to the KFD API is 
>>> a clear no-go from my side.
>>>
>>> Just skimming over the patch it's obvious that this isn't correctly 
>>> implemented. You simply can't the MMU notifier ranges likes this.
>>>
>>> Regards,
>>> Christian.
>>>
>>> On 1/9/26 08:55, Honglei Huang wrote:
>>>> Hi Felix,
>>>>
>>>> Thank you for the feedback. I understand your concern about API 
>>>> maintenance.
>>>>
>>>>  From what I can see, KFD is still the core driver for all GPU 
>>>> compute workloads. The entire compute ecosystem is built on KFD's 
>>>> infrastructure and continues to rely on it. While the unification 
>>>> work is ongoing, any transition to DRM render node APIs would 
>>>> naturally take considerable time, and KFD is expected to remain the 
>>>> primary interface for compute for the foreseeable future. This batch 
>>>> allocation issue is affecting performance in some specific computing 
>>>> scenarios.
>>>>
>>>> You're absolutely right about the API proliferation concern. Based 
>>>> on your feedback, I'd like to revise the approach for v3 to minimize 
>>>> impact by reusing the existing ioctl instead of adding a new API:
>>>>
>>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>> - When flag is set, mmap_offset field points to range array
>>>> - No new ioctl command, no new structure
>>>>
>>>> This changes the API surface from adding a new ioctl to adding just 
>>>> one flag.
>>>>
>>>> Actually the implementation modifies DRM's GPU memory management
>>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs 
>>>> similar functionality later, these functions could be directly reused.
>>>>
>>>> Would you be willing to review v3 with this approach?
>>>>
>>>> Regards,
>>>> Honglei Huang
>>>>
>>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>>> I don't have time to review this in detail right now. I am 
>>>>> concerned about adding new KFD API, when the trend is moving 
>>>>> towards DRM render node APIs. This creates additional burden for 
>>>>> ongoing support of these APIs in addition to the inevitable DRM 
>>>>> render node duplicates we'll have in the future. Would it be 
>>>>> possible to implement this batch userptr allocation in a render 
>>>>> node API from the start?
>>>>>
>>>>> Regards,
>>>>>     Felix
>>>>>
>>>>>
>>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> This is v2 of the patch series to support allocating multiple non- 
>>>>>> contiguous
>>>>>> CPU virtual address ranges that map to a single contiguous GPU 
>>>>>> virtual address.
>>>>>>
>>>>>> **Key improvements over v1:**
>>>>>> - NO memory pinning: uses HMM for page tracking, pages can be 
>>>>>> swapped/ migrated
>>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD 
>>>>>> unification
>>>>>> - Better approach: userptr's VA remapping design is ideal for 
>>>>>> scattered VA registration
>>>>>>
>>>>>> Based on community feedback, v2 takes a completely different 
>>>>>> implementation
>>>>>> approach by leveraging the existing userptr infrastructure rather 
>>>>>> than
>>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>>
>>>>>> Changes from v1
>>>>>> ===============
>>>>>>
>>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range 
>>>>>> registration
>>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special VMA 
>>>>>> handling
>>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>>
>>>>>> This approach had significant drawbacks:
>>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on- 
>>>>>> demand paging
>>>>>> 2. Added complexity to the SVM subsystem
>>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>>> 4. Could cause memory pressure due to locked pages
>>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>>
>>>>>> v2 Implementation Approach
>>>>>> ==========================
>>>>>>
>>>>>> 1. **No memory pinning required**
>>>>>>      - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>>      - Pages are NOT pinned, can be swapped/migrated when not in use
>>>>>>      - Supports dynamic page eviction and on-demand restore like 
>>>>>> standard userptr
>>>>>>
>>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>>      - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>>      - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>>      - Zero changes to SVM code, limited scope of changes
>>>>>>
>>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>>      - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>>      - Multiple non-contiguous CPU VA ranges -> single contiguous 
>>>>>> GPU VA
>>>>>>      - Unlike KFD SVM which maintains VA identity, userptr allows 
>>>>>> remapping,
>>>>>>        This VA remapping capability makes userptr ideal for 
>>>>>> scattered allocations
>>>>>>
>>>>>> **Implementation Details:**
>>>>>>      - Each CPU VA range gets its own mmu_interval_notifier for 
>>>>>> invalidation
>>>>>>      - All ranges validated together and mapped to contiguous GPU VA
>>>>>>      - Single kgd_mem object with array of user_range_info structures
>>>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>>>
>>>>>> Patch Series Overview
>>>>>> =====================
>>>>>>
>>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and data 
>>>>>> structures
>>>>>>       - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>>       - UAPI for userspace to request batch userptr allocation
>>>>>>
>>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>>       - Add user_range_info and associated fields to kgd_mem
>>>>>>       - Data structures for tracking multiple ranges per allocation
>>>>>>
>>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>>       - Core functions: init_user_pages_batch(), 
>>>>>> get_user_pages_batch()
>>>>>>       - Per-range eviction/restore handlers with unified management
>>>>>>       - Integration with existing userptr eviction/validation flows
>>>>>>
>>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>>       - Ioctl handler with input validation
>>>>>>       - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>>       - Integration with kfd_process and process_device 
>>>>>> infrastructure
>>>>>>
>>>>>> Performance Comparison
>>>>>> ======================
>>>>>>
>>>>>> Before implementing this patch, we attempted a userspace solution 
>>>>>> that makes
>>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU 
>>>>>> ioctl to
>>>>>> register non-contiguous VA ranges individually. This approach 
>>>>>> resulted in
>>>>>> severe performance degradation:
>>>>>>
>>>>>> **Userspace Multiple ioctl Approach:**
>>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>>> - Performance loss: 60% degradation
>>>>>>
>>>>>> **This Kernel Batch ioctl Approach:**
>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>> - Achieves near-native performance in virtualized environments
>>>>>>
>>>>>> The batch registration in kernel avoids the repeated syscall 
>>>>>> overhead and
>>>>>> enables efficient unified management of scattered VA ranges, 
>>>>>> recovering most
>>>>>> of the performance lost to virtualization.
>>>>>>
>>>>>> Testing Results
>>>>>> ===============
>>>>>>
>>>>>> The series has been tested with:
>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>> - OpenCL CTS in KVM guest environment
>>>>>> - HIP catch tests in KVM guest environment
>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized environments
>>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>>
>>>>>> Corresponding userspace patche
>>>>>> ================================
>>>>>> Userspace ROCm changes for new ioctl:
>>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ 
>>>>>> ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>>
>>>>>> Thank you for your review and waiting for the feedback.
>>>>>>
>>>>>> Best regards,
>>>>>> Honglei Huang
>>>>>>
>>>>>> Honglei Huang (4):
>>>>>>     drm/amdkfd: Add batch userptr allocation UAPI
>>>>>>     drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>>     drm/amdkfd: Implement batch userptr allocation and management
>>>>>>     drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>>
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 +++++++++++ 
>>>>>> + +++++-
>>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>>    include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>>    4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>>
> 

