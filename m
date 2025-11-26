Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD83C8C033
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BFC10E6B2;
	Wed, 26 Nov 2025 21:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N8CDUYvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010027.outbound.protection.outlook.com
 [40.93.198.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA6410E6B2;
 Wed, 26 Nov 2025 21:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnKs9PJjFFzp0oeWd6SNVE5l5P11sU3/JYA1KGIV84T6jhgeGAaDIug2b3dkP9hiB5BkcoFSHsOWKBcMfBggtqquSbpqSzvgyHRpZ8J/w9bJLZrliyzfXBuS6xPdzIBbtGuFDZzGWa4bVtaxzR9Lf+AnMQ3kq9O8z8Jgv2tmArIIQqPxJIaP6wrAeR5nJREsihY+AablZL0y40RBQoehZo83HwTh8mRjwdcf6JdJx3XDlwxG3uh40E6bqFpZuDrX4ZeEH/j95TtH+qRX6R5hALyNffcTkxliHpHMoOEPbSsuFhvnDw+jRmwupSEYMtTWTIKoi8dbwYzCvDlQT3m4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHlW8/oJ4zIHq+v4Zi0lfEotXpacSqDYoS8n2MUHM3M=;
 b=bfBWapAzXj6sPiTgcp6JYiNvaGMFQBhjF+P9CG9ApLybDbNZ1S098qldIeDiF0GdPaHRGA9JuQNilzzs5YBb20MkDRIXhKFD5E/cTEtcEg7xUdVB+zMUSIPYL7fepr3qDaj8zG8jglTzRqQ9GIXhbi920pCsJlgoALSN3iC5QvWl4IbmaYb7vSv3UzDawT1XsZrbLvv0H4OKKbqOjymOMT+tZTlnEirxmr6RKMrooiOi3KWpQ7mTVAk2+rQLOm/D5mwHe0IaFwTSiSJnRUYjA6IRjJQUeL0K7p3S/+y5CRC87tjw8B5gyFJ7hF1QXeVkC6h8d9gWp+N/wNwuICgKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHlW8/oJ4zIHq+v4Zi0lfEotXpacSqDYoS8n2MUHM3M=;
 b=N8CDUYvR4nDCFEGNustCGqX4t8u9/X/15jqSiCinsBR4rETYccLCf3u6EX3FKbuQbON6BYIYAIzVj5ABbYWBRihGOPb5XD7Cl5dveZobBsYtlQgpG/zXScraCvB6JJ2rBFLJIMnDeS+wgJIh2bt8JlQrqSLHUXvpTRyQ/ndY8S8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH3PR12MB9250.namprd12.prod.outlook.com (2603:10b6:610:1ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 21:24:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 21:24:32 +0000
Message-ID: <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
Date: Wed, 26 Nov 2025 16:24:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] amd/amdkfd: Ignore return code of dma_fence_signal()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-4-phasta@kernel.org>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20251126131914.149445-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:208:d4::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH3PR12MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e3ef13-d4de-4f77-be5b-08de2d3230be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2hiWkV3UytJQy96WVpDQ3VUZ2RHSVcrZGJKQWNiNVcvYzF0NHNCVFpraTJz?=
 =?utf-8?B?bVJ2S09uR0xFMDMxN0hoYzhLUE1MMksrOVF6SWh5Ukc1VlczZmlST1dmRkFa?=
 =?utf-8?B?ZC9YSjNkUWR1TE9IQzNiVjhiODJHd29aOWlSYlQ4ZFliZC9XbTd0YUY0dzN2?=
 =?utf-8?B?dnNuQU5rb3ZydHQ4ZmpOOVRuRU9qVEVneWdqV3FlU2xRTXlTRWowdjhRWnpB?=
 =?utf-8?B?QmJ1NFFqeXpBaW43OFA5a01tVlJya1ZRMUNlQXc1WUlYcDNTR21hd2VLSFVp?=
 =?utf-8?B?Z0ZNOVcrMlE2RkVGOUxLVEQxek9BYTZZYzNCNlJ6OTd0U2hpZm9BN2U4RFlm?=
 =?utf-8?B?NiswMW56MEZmU1Jic2VBT3cxbHRTT3Q4eGxCQlkvNldVemlPVnE5aWFCazhZ?=
 =?utf-8?B?dTlTSWJ0Y3ZtOHBVWW9oYVpkVDJQa0VBd2NVVjVMWEZyUFI0VTlJTFFhWkRa?=
 =?utf-8?B?YlM0VEVqRHJBbndpYjhydGsyRnpuM1pvRWFzeCt4SmduNk0xS1A1OUJjWUx6?=
 =?utf-8?B?bVUrV0J4eElJZHNzaDcwWXVNVVFXR25tdXhuS0p1T2ZPanRDNTdSMStFUWVi?=
 =?utf-8?B?dElTZldaZFphcTJ0TVBITVRzOStFbUxQQjVPUUtYQ0hIMkkzSnZhQlVQRnly?=
 =?utf-8?B?d3JlQ25ZRGl5ZGQyM3Q2M1h5QlhWdkpuUVVGY0NaR1AwNzU2S29kbktzOVZa?=
 =?utf-8?B?TUNReW9telh2RlNtV3lpMnhOVmpCbm5oWjNPL3VWd3owazNJMGtsWUtvR1o2?=
 =?utf-8?B?RWg2b0RzcXFPdmMvcDFBM2g1L1grd2pETDZ6L0R4TVUyb1ZwMk5BSDBISXZB?=
 =?utf-8?B?TElvZFpzZ0hQSU80ZldRNjlmTzJBOXJOYi80NkNMTHB3eVFreUQ3T1FXekxR?=
 =?utf-8?B?c3BsOXpCL2djS0xaUDlXeDJzNFl4clRqV0tDSWdESURLUjhyeTZQM0dTNGht?=
 =?utf-8?B?aU0rQmJubUZlUTVnZmUrUHl3Sms2dXc3TEROeVhwaklJWmJma09MazJrZk85?=
 =?utf-8?B?dktvOWx5R1p3Tkp0QWxXbWN4THVaYUVZYWVvYXVpVTlxVWVUWU56SWh5TEx2?=
 =?utf-8?B?YTRmclJFTzNoVVkreFB0dWhrNlJzWFN5OStWenRWTll2T2RWTGZjcnJpQ3hq?=
 =?utf-8?B?eEJaWXl3QjZBWm11eEdRQ0xEc0pOVUpLZjNuWVk3elpETWZjejNxcWp6RUww?=
 =?utf-8?B?NzloQWlsK3FHaUE0aFVDS2Naakd5NVN6VEJwcjgzbUZMczJiV1ZPNlBxaHR5?=
 =?utf-8?B?bVg4eVpKR1FaTmF2UTNyQU9wdjFYeS9WaXdZUzRZcDIzZVFJekF3TzVNckFJ?=
 =?utf-8?B?LzV1MWlLLzEzWkVaTXRVZDZIeFdXbUhqa01mMWp6dndqMkxWSTllZ1RNcmJn?=
 =?utf-8?B?MEE2SFFOUWJqSkRFb0FtUWlBbG9oUDRnZlkvd0EyUTZja3hpUmdlUVUvWUFz?=
 =?utf-8?B?SStvblRGTjlvMmJ6Y3MzTHZTM2J5YUJGMEIybDdjbWxjNk5sWW5ZZ3dvUU8x?=
 =?utf-8?B?L29VVTVHZExGcHNRRUNGbklhSWkzQnRFeFI2QkVzZXgvTlNWc2xmUW1MM0pX?=
 =?utf-8?B?ZzB0Y0ZiUTc1TzgxVVE1M21zM2lhcGpxb2kzVHhYclRISjVRWWpjNHRZVFVp?=
 =?utf-8?B?RjB4T1FVZks0Wk9OOGkxUThMSkVSMUt1clhpaUR2ZktpS243L1FBN3I4Wk5p?=
 =?utf-8?B?VklvR3Q5MnVBd3o4S0tXSUlFY05Wa2x3N1hPMUlldTByaTR6ZDBHanQ5Nzgz?=
 =?utf-8?B?dU1QNzIvM3VUZlQxQTAycjhaZllxTGpQblplbFBxN1VKSkhQMWhyejFjMzJ2?=
 =?utf-8?B?b1JWMmhhdk5oMHVoZEcxVm90Q1BzSnhKZlRjL3pRRkduQUhBZTFUTHNkYjJ1?=
 =?utf-8?B?djZyNk1zTHRSdVdxVlRyTkoxUXZEMnFLNnJNa0FOVHVJbUk1SEdNMXVTUjVU?=
 =?utf-8?B?cGF4RjIwaW1CazdENnBPNDRhMjl5Um83WGtVRVU1UEprbUt4SFhpVVNzQ0tm?=
 =?utf-8?Q?zfPvcK8JwwNRWoWbqZRGQ+i6897I+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1pDaVNCMHQzNkw1RWwydnNDNGZlMTliZ0ZGYTFzUFVtaVlma0JDejhnMlBH?=
 =?utf-8?B?Vk1xOFFja01GK2ZUajZlTzBtS2RmYmxHamtMamlsUmVubnlSSWFQN21SdFd6?=
 =?utf-8?B?aHcvRVFKeVVpY0FISDJ0c2xnSnhOS2JRR0JOTTJ3bEhYSE1rRUoxNGRETkFs?=
 =?utf-8?B?a3MzaCttd3drMHdvaFQxQ2Q1SVFXMjMzSjI1WERHWURPdGRnSXprVjl6VHE1?=
 =?utf-8?B?VWRJbFphZ1N4b0NQNkpCYzN1U0hGbGQ1cXpJc3RHYUpIWm5LanpmZ1RSUVVw?=
 =?utf-8?B?Y24yaGo2WG9GZldaeGI1YzJ4bFhBM2ZPVDZPOFV1RmlhTHI2S2pOTUQxeWww?=
 =?utf-8?B?K1F1ZjNSVHJSTUpQeC81V1RIOGlmS0lwRnVXb1RmMnRHUkZOKzNpSXRxaC9u?=
 =?utf-8?B?c1hrQmRLNmVZN1RiUUVaSlBKSmVOU0xEMGtIZktEZ2NtUVNLcU0zWmh0Mm10?=
 =?utf-8?B?cHNaUldvSGtjZ2h5VDVINWo0ZVJ0aDJjek43clBxRjVUMEtKa1dwc0kxRVBJ?=
 =?utf-8?B?NnZyT2dBL1FNR2REc1RqVXdrOTdkY0N2NGNZR2drcU1WdzNWZVoyZkpiZzk4?=
 =?utf-8?B?VFJYRDVMUGVlc3FNd0NsZll5eTNFS1ZnN3dWZlpxVG9XMzBBdzBCV2NWWG9t?=
 =?utf-8?B?bVBXSUY3SksyMEtLajI5OXhPUFdrMUwwOE9reGN3MXY4MndVajM5bm9NQmxt?=
 =?utf-8?B?YmRqTVdnZVpUNHU1aHhKV3I3VG9jS2RpWVFQRFhlMTR4VkdQbzJacXVaZVlQ?=
 =?utf-8?B?UVE5bGJHTmdnNlVuYldJeVpPVmU2My80Z0RhTXVkQThsalhLbkpkclMxTERT?=
 =?utf-8?B?ekZPaHZvOEY3QTBBbVFjZmVZTHN0M28yQ29MQzc4OE4xSHliSGxhc0ozRUpM?=
 =?utf-8?B?alBHWDBUZ0NxWnlPWTUxY0MvVWcvSkRhaTRZVjd4TWlnQ3NwRXNKNExkcDM3?=
 =?utf-8?B?a21JTFVGYlFPNDJmRnUxM0c5cnZEdC9NMnN1VTg4MU0ranlzTVo4TWtQb0xx?=
 =?utf-8?B?OTVPeGxHSUsxa21LTXN2cDB1VzJJYWFyL2dXeVg0R1dPMjFzbElNRkFMYk9s?=
 =?utf-8?B?YzhaZFRmamtaSklPMHk2SFhvTDZCcXVmR2lIQXl6MWV4cDBJbkJRMnQvWG5D?=
 =?utf-8?B?d0Nta1Mwc3VEeDRVbmI5dTFwNW1oai8rR29HTEw4by91VW5pbEJoY2lYaFVr?=
 =?utf-8?B?dnVLbXBxNkJ6VzN4Zlh0aGVOUWhkYnlZcW4ranVYNUVJVFg3dy9sbjI2Rk5C?=
 =?utf-8?B?TkRqbkQ5QkcvSCszSFJTR1FCUm1iSHdhOGM2Q0Q3aStQZDN1SHZYOVB1VzEx?=
 =?utf-8?B?K083RXFyT3NHZHB3T1FSWkl1K3Qya2ZhNS9BbnVTQkd1bUI5czNlRjVVODNT?=
 =?utf-8?B?cnEzYUxnTTRORkxiY2c2cnRnUTJub0YrcEx6SGdsbGF2WU43S3ViVllhWFRy?=
 =?utf-8?B?TGNUdlhhRUk2b2pDbEFlSVJtT1JxS2U4V0s2ZWJsZE1mdWlXaWdqRk45R29m?=
 =?utf-8?B?YWhJdXJNaExTMHFJUm5GUzgremVkMlRDdTh4WVZGbW9yVUxDNk1RaHMrZzk3?=
 =?utf-8?B?Q1dQMDBMeU1vM0RNTDhFelByaWtoTFhKdGNnWFk4YWViR3NlaGpXWlZ2Q2Nx?=
 =?utf-8?B?K2VIcjllUW4rRmJUMXRCSmZ3N3FCM3lTU1pYRFVINVZHdFZ1WlpwM2JTRUt4?=
 =?utf-8?B?cGlxdk83ejBDVWRvSFhXMWFnYTNST3NiLy9QYXJ4UGdmWnhQWVdBcmYvVnlm?=
 =?utf-8?B?dFhhMmN2VEFoVUxOYmFVczhQUmx0cDN4Uk9UUGxuR1BOcFQyNWp3K3R1T3dw?=
 =?utf-8?B?Z01YcUxmSGd4UTBrOHlDN2p4VjRjaFFxYkFTWTdsZHJWd2NjSkRuYWxmT1F3?=
 =?utf-8?B?amlEalVMa0VrZlRjbkN1YnFxak5KOU9hYkFnTUpBcGJVZzZ0eEVVT2FtbFdj?=
 =?utf-8?B?MCtPRU1CV2ZhRUMxNE5JUWpLWU9CSjRyS01PNjN1UTJQVnU1Tyt2ZTc2c0F2?=
 =?utf-8?B?RTJUU3l2UE9Vc3dlUDFPZUVRQW1oZUlOcGRST0IxckhKRmJUK2NxREhtVURW?=
 =?utf-8?B?cHd3eWxLSjM0UzNGR2dQOXlwUjJQbVJJYlNwUnhLNk1md01BNzYyekZYWFcv?=
 =?utf-8?Q?An2hWjIAgfWCz4CDyqUdE0/6D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e3ef13-d4de-4f77-be5b-08de2d3230be
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 21:24:32.4097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O/6AMJ1DKQAuTmejQ/A+hq22KbkhMeLZ6swdjoJcXQojvrsvhxkE8nJrSlf6xxrEXDx5FPJ9/nvhrlZFxKLyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9250
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


On 2025-11-26 08:19, Philipp Stanner wrote:
> The return code of dma_fence_signal() is not really useful as there is
> nothing reasonable to do if a fence was already signaled. That return
> code shall be removed from the kernel.
>
> Ignore dma_fence_signal()'s return code.

I think this is not correct. Looking at the comment in 
evict_process_worker, we use the return value to decide a race 
conditions where multiple threads are trying to signal the eviction 
fence. Only one of them should schedule the restore work. And the other 
ones need to increment the reference count to keep evictions balanced.

Regards,
   Felix


>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..950fafa4b3c3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>   static int signal_eviction_fence(struct kfd_process *p)
>   {
>   	struct dma_fence *ef;
> -	int ret;
>   
>   	rcu_read_lock();
>   	ef = dma_fence_get_rcu_safe(&p->ef);
> @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>   	if (!ef)
>   		return -EINVAL;
>   
> -	ret = dma_fence_signal(ef);
> +	dma_fence_signal(ef);
>   	dma_fence_put(ef);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void evict_process_worker(struct work_struct *work)
