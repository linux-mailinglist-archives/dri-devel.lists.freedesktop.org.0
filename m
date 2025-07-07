Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9EAFAF6E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61010E307;
	Mon,  7 Jul 2025 09:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MIp8C1NF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA6410E307;
 Mon,  7 Jul 2025 09:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzH0QTBnPDnvm47unlMPQtOm3ELUB6Zd4vUPqj6QuI8johY5wmSuuHIuKxE00kMAAz38uC5PfeCt/iX5TSDD/ssmOh+vHigltmGm/gN6mfs3cNDCHZ3tCpqsMdH+038uLpwiSRUJLR8pLAZdg2JsaPnXYb2WV4Cyk+4cWIXCgu5xIc6YYHl1dwiUjLSeqP2Gx5Z56keB6X/KQji6i0eHqvLVwO4wMi6za4E5y+mAejHY3cHkbqv/1PeAAO8qqaD7ruFLk31yO2uzZwlph+4tmQMLoMzd1qRGVbBIBAb+3xqAVBvyMDaJmu5i71Et8l94pckDH6V3gkjyN1tWAMmwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkpWajyTkVbtW50HOrzE2K8N8qpm/2+NxXKMMl9Z7xE=;
 b=gPdIuQf7NKpRj1hEOjHVVQUfw0Rrjjm1EtEY7lqw/QW1PAnF/i8bXBsAFjFQFQiP0nHoOxWDZPwpzeNUpMVsknO3Zx7Ci5cvEQY/+52VZOZlrKisWDVpsvHtIw0fiqMWd1H1/c76FZ83bacJY0vfzb9/TSRJ9Oao1+EtKtHwoMu54ifH/VtAGVDWa+Dif9qI6TWJteAy5p56ci0h2uuvQiOHwiPOcFgzguTHZ71m4+saKC3Hdf7ayP/r1nz73ZPD/CYQcpqaTjiULCQhy7SJmENzFrmR5vXAPzRTbHZnSxDFzUlnAVV8ClTKQGMmG+LKxCAUXmEcqOt8EIO3Y2ixsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkpWajyTkVbtW50HOrzE2K8N8qpm/2+NxXKMMl9Z7xE=;
 b=MIp8C1NFsPZHURIcIK86ArzPBKY+4Yky008ioTPgzZdNS3nnrFUlU0pOwEMr7ERD0ykUBWkCVDiPq0fTM6N0kt06Fk0JemnfqZlLJ44Pt8suZhefvbzOnV1rKe/vIBWspMxw9ND5TvmW0XMxbeL9BI9m0d/vHlbfJdx+9EnTYFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 09:16:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:16:53 +0000
Message-ID: <1c3f06a0-7678-4e1e-8f7f-d60f2171ac59@amd.com>
Date: Mon, 7 Jul 2025 11:16:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/amdgpu: move GTT to shmem after eviction for
 hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 rafael@kernel.org, len.brown@intel.com, pavel@kernel.org,
 gregkh@linuxfoundation.org, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com,
 haijun.chang@amd.com, Qing.Ma@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-3-guoqing.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250704101233.347506-3-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0384.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5183a5-12c2-40fe-a5b7-08ddbd370336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1lkQ0swcmJIeFBqRytRTXk4SmNScktJalRmR2pOQUE1b3VwZnVLbG9IUVFh?=
 =?utf-8?B?bDlza0hLT2FZTU5FNG1rRXErKzg3THY1UnNmZWFLd1h4N2MzYmxwN29yYkt2?=
 =?utf-8?B?dCsrQVVERnFVWUJmS05LSi9tUVVwWUxnL25aZFRNRnhkZUpnMm92ek5FMEkz?=
 =?utf-8?B?UjFlWjdTME0yTmExNDRIdERPYTRoK3c4bnFTTjBpSmpMdnNSMHlsSzlFZHVp?=
 =?utf-8?B?ZHZkUzFlNHF1NC9aLy9CRGNaeUlTNWZOMGx3TlBwUjBLVUZRNUlKekNpdTFy?=
 =?utf-8?B?c21LL1g1RGluUTd5dUZxbnl6Z1FONzhYc2Facmp4bVdZeFE5MHRPQW96STIy?=
 =?utf-8?B?MlNpTW44Wm9zOHJiL09ZTUE4cUllWVhOc29pWFhDbllqeEY1WlJaQ210eUlv?=
 =?utf-8?B?eEdFeUhLVXJQVzQ4aW92T0tLWEJ0ZUt6aWNhVXdXVEx2aW1Mb2IydDNLMGx6?=
 =?utf-8?B?ODVMbWkyREl5SDAvN3B2L0NpZ28zU29yaCs3ZkFTZGNuYmZaZzV3ZHc5clVB?=
 =?utf-8?B?UVpsZHZ5dU5xTnZKRXlsVVU5elZGVEJSZnNSM0piTUdxZDQrZU5oQ0ZucGdZ?=
 =?utf-8?B?dUh5WWkxQkVZVEM0bTdRcXlDT1ZHU084QVhZRy9vQjhnbUdSNXU5c1JSSUJ4?=
 =?utf-8?B?OHByL1NkTDJFU1BjdEtkVTdYQmtwSm1BT1FTaTZJVlYydDhRc2VtbjI2OUlT?=
 =?utf-8?B?T1VGR09HNDBUMnRNS29BU3JwVnRlSDYvdzJGUmNoVjBNN3g0ZFZyVGVjS3Zx?=
 =?utf-8?B?QzZGUGd1T1dna0YxWlF1dWpZbWV2UXZFSTR5SWNMTXRpNml5eXZ3TXN5TTFo?=
 =?utf-8?B?d1RzbHpiTXNkNDg3SHNXQndLS2p3aDN0M2RGelJKdndQR2wwYStJUTFiWmlS?=
 =?utf-8?B?eHFSeWR6bXJTbWpDYm00NmJDNWcyMCt4ZlZxREoxeThQZjRKR1d6Sm0wUlJL?=
 =?utf-8?B?UWw1ejVPUnY4R2xQWE81MkcvNENTQ2JrVEpZcVgxV3NVZmlHY3pqQWYxcHBk?=
 =?utf-8?B?MDFxVzN6ejJVNHJNMS8zSXFjYlpHMmtOZkhIekFYTjNndlhsYTVlaldZZlg1?=
 =?utf-8?B?aC91cHJOZyt5Mkx3VjQ4SlAzRkFFNjNtUWdrSXRGZ0dHT3FEWkJ3T2F6YXVI?=
 =?utf-8?B?U1BvNkpDMEhxWE1zN1ozOTl3V3V5Q0lJWUFwZ3pMd0FLS010QjZFeGpDeGcz?=
 =?utf-8?B?VDAzQUFJRTRnMXkwVi9uZmFLOEFqOGd4QkdTZFpVL0Y3ZHJzSy9zeGVHRnZq?=
 =?utf-8?B?SXg4dnZOdTdvQUNySHh3VXI3SlU2WHRTTWVwcEdoQThvdFUwWktxR3JSV3B0?=
 =?utf-8?B?dHJOcnpHUnErK2RiV3hDWGdvdjBwWjRjMHJBT0lFWTc4YlJ1R296MWZxN1Vx?=
 =?utf-8?B?NmZIQXprSWVIb3pJSmFOV0ttSjNBUWlmd0dxMUUwRGt0ZElwVE9uQ1FCWHF2?=
 =?utf-8?B?NUtGdmI2UGRRdWlqZEkrYzEyTFV6eGhVWXJma0hWanA2dCs3T1hUZkg3WkQz?=
 =?utf-8?B?VzRBUW56d2l2ajRMQ0gvWUd1SHJFMXdxWUJnZUt6b3h5QnF4UmJIRHluajdC?=
 =?utf-8?B?SWord0JwaDNBNGp2bzZWWlNQZ2ROYitzenBFbUMzeW56aHZkVDJGMUhkbm5T?=
 =?utf-8?B?R1pEZDJ6NFRQSG9oUkJSZ3NHUG1WQ1p5ZVM0NTV2WFdBTWFFZko3Sy93blF3?=
 =?utf-8?B?Znk2UFlyRXFaclE5ZkxGcXRVcFoxRTJXK2EvMEZyWmZSSDV0U3BFSzZJODY1?=
 =?utf-8?B?UEVpdFVxY0tab2dKK2luN1pSMm1BRTNFbURZd1RnTXd6NWZCZ3o3S2ZWYjE5?=
 =?utf-8?B?NzZDZGIxeG5hTlpXM0hYclpQeDFvT0E2ZmFyU3BMaVN3MWpNaXlXMzBkTDlq?=
 =?utf-8?B?a3ptVVc3Y2RCR3p6bTZGM1JqdC9vRENDV1gySUZpajI1YTdMRWg2aTZIQmZM?=
 =?utf-8?B?VkdualNSOXE5SWVtVHNUbTlYSmFtdUhQWGJDZFZOY29qcEQ4dERYUUFSL1Bs?=
 =?utf-8?B?V214bXNLS2lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE9PamVnMTljb01nekJnNzBvQTJGaDdIb2VTNHVEMWh3ZlJyaG9YNTNjamVp?=
 =?utf-8?B?c3AvSHMzbTlLQk5rQVptWkFmSXE5VFlCVHFvT29QWTYwcEQra28zdUowSnhP?=
 =?utf-8?B?Z2tyUjAvZk5QOCtaUzltckZiZGxZMngzMkVZL3UyYTFQeXFISFVsVXZkMC9N?=
 =?utf-8?B?dTBzVCtrdnV6b2VDM1F6RjlDMnpiMjdueVlaMjVCQ2h4NWVmSytLaDhpdUVV?=
 =?utf-8?B?NTU4MFRTWEI1UHR6OUpDaXZRUTVhTUVrWnYwdzVaNnVTVEF5TDdNT1hZYzdt?=
 =?utf-8?B?c2s1NGdvQVlwbThESU5IMlJhakZQU0doWFV1Ri9nc0xmcHdUdllRbTdHY09O?=
 =?utf-8?B?cHIvaGZtNE5ZM29uWE9PSERSaG5leTdkc3RaK1ZMOCtGNWY5bEUrS0gyVUt5?=
 =?utf-8?B?R1VvWFcyWUVxaXJycDlqQ2FIOHVXcXJpcVhhdkE0aVVMSUV4V3ZFVThNTVhD?=
 =?utf-8?B?MHhSVnlnQitBcHc5azk0eXVaeDcvUzg0MStBWURGVktUejB0MlRaNlJZY3RR?=
 =?utf-8?B?Rm44S0dJbWhXT20yczNaWmpDSFl6VEcvc2JobGNKRjdMWlI3SjZDR2orNEdU?=
 =?utf-8?B?ejl3NmZ0MEwvcFFmVW5wOXQ0ZDVaa1JnK0owcS81MkFNMTRiK0dOVW1nTzRK?=
 =?utf-8?B?eFVnWkNxc3pXdVdFeFdJWjl4SHVRRld0dVVOZnlZcHRZRWtFQjIvSDRVdHB6?=
 =?utf-8?B?eU9RMmFxRmI1MTk4cEhGQmNMVGxEQ2NJdllaTTB4MlJreGhlTXF6UktjYXlJ?=
 =?utf-8?B?a1dyaWYzSGU2N1hrZHoxZGZZdmNENVlwSXkvMmhZYXUzSFR4akcrVFpmTW1p?=
 =?utf-8?B?SndDWXQ3T0NQaE5vZmlHK3VOZGZMWWpmWG5pMUF4YWlnV2RBSGVCU3RVREtF?=
 =?utf-8?B?UG5WNjlBMDh3a3VqaHNQNTZYK0wxTCt3akRudWhPQm1FUVE4Z05IRmprdS9r?=
 =?utf-8?B?c1pkK0c5SjgvZXFxaFNWT3V1UG52VFlkWVVXUHN0ZWVUWDhSaEVUSWdoU2Vy?=
 =?utf-8?B?dUVDQ053bXVZd1VkL0VrU3BnSkUramE5MmRMTnByK2NNL0YzQ0FOdmZGOHp6?=
 =?utf-8?B?anZjZ0o5d2pEQkdGS0pHTE5zaFRDZng0K1J5NDNGby9XaVN3anlMZnBibWdH?=
 =?utf-8?B?bFhNb016KzZzOHZCbVQ4ak9UV0JOV0dTS0p3L3ozQUw5Vk5FdlB5VEhQNnEv?=
 =?utf-8?B?UHo5RFAwNkFJc0k5R3ZUdXhMTzJoNVhyL1ozTlFmakNWNXJtQkV0a0lTN1R3?=
 =?utf-8?B?dWhQdHZ0aHlhQUNSQXpyRVZMb1ViRmdmelpGVHVwUmtRd0FxdzRvbk5TRG1h?=
 =?utf-8?B?bGcxS25nS0pOZVFtVFFzN2F3Z3U2Wm9maFpJMlNUdGhneW4zZzlaMVh1Y0Vp?=
 =?utf-8?B?NVBvaXVUd004N1ZHNGJkekRIdTVwekRCMEJlbnhadzhmWW5CYW9JdlpGSnBR?=
 =?utf-8?B?dUtFdmRJWWU2RnlWcHJWUnJqR211aFVINVRqVXpXK0NOTitpak5raGRxV2NH?=
 =?utf-8?B?SkJ6OTNWV2dJMTN6UWIyY21mWVlYT01zNWVHVkhGUmhGN2pVSXR5azZkajVG?=
 =?utf-8?B?MUtVWGdKK0JINURBZWhhWWdEbU94RGcvUW1Nck1lU3BUVVloRFJTdVEzbTM3?=
 =?utf-8?B?NTFxZndqZ01sL1I1OXBhVldKUkhPbXNUUnNiS1J6ZE1BMlk4Ny8rQm5FeDhj?=
 =?utf-8?B?amlnRDZ2RklzbllrcGpPNWQwSHQvTm8wVk5xYWdBcEZBUm1KUmZ6ODhySFpl?=
 =?utf-8?B?L0NCM0R5K3g0ZnoxdC9KT3pHNkM3ajNFVjlBYVBVRVdFcmdvZ0tkVTN3M2V1?=
 =?utf-8?B?blpFVVRlV21QeGk1VFRNSVBOd1lrY0QvMitCMkxzSVBGMVhGc2dHcG9aeGFE?=
 =?utf-8?B?Z3lQZElXMzM1RXNLRTRKYUZiNzdDSjE0dFVzbGJ3VUVNVjB4MDZ2eXA4U3Iw?=
 =?utf-8?B?bnRyZWt4QnJubjkxY0s1RjE4OEphMFRYVkJkNVRRb04wY1ppcWdqM0VVc0lw?=
 =?utf-8?B?S2hPeXlaQmRPOU9ydm50YXdoV1lFVmtYVHJHdUtHNkUvREVkUGJHaVFOUWI2?=
 =?utf-8?B?MWNtMVl1R09leE9CUGJtN1BnNkxsVElEbnoxUFpGUW5VWDcyanBiVll3YlhT?=
 =?utf-8?Q?l03LRlqmdbjUcsgkLB807DPN6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5183a5-12c2-40fe-a5b7-08ddbd370336
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:16:53.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJvRgITnZzY+3IRF8WI9F1JlVxffPbW1xwESQwpVr0IWU1r2LzpKMz/b36XTk3Nk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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



On 04.07.25 12:12, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
> to GTT and takes too much system memory. This will cause hibernation
> fail due to insufficient memory for creating the hibernation image.
> 
> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
> hibernation code to make room for hibernation image.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 27ab4e754b2a..a0b0682236e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2414,6 +2414,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  {
>  	struct ttm_resource_manager *man;
> +	int r;
>  
>  	switch (mem_type) {
>  	case TTM_PL_VRAM:
> @@ -2428,7 +2429,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  		return -EINVAL;
>  	}
>  
> -	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +	r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +	if (r) {
> +		DRM_ERROR("Failed to evict memory type %d\n", mem_type);
> +		return r;
> +	}
> +	if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
> +		r = ttm_device_prepare_hibernation();
> +		if (r)
> +			DRM_ERROR("Failed to swap out, %d\n", r);
> +	}
> +	return r;

That call needs to go into a separate amdgpu_ttm_* function and only be called from amdgpu_device_evict_resources().

Otherwise the debugfs tests will trigger it as well which is undesirable.

Regards,
Christian.

>  }
>  
>  #if defined(CONFIG_DEBUG_FS)

