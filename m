Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B89C738A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 15:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8E410E71A;
	Wed, 13 Nov 2024 14:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B6xa0nqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2110E710;
 Wed, 13 Nov 2024 14:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vmj0GEMkXl7jDylCCbSS8myAokaP9NsVszuIZaAOstFATa2dCG3Y482T1E6/DQ8VVQfTHrVZXg+yZl2HrsmyEaGhbqsRblsf5V/QtpQ17ecred87+IH99WGL1JeVUfFVWAioTlqXOWap6M+C4YF+ATwrpQsf7+Lmo5D4NGg2DVnnMWP7inymmt1l8E2IJ4nlxdq9ceAZMIFAZzJPJcmJyOgQE9t6iFImG/UEBxtldb5WEA2y3CV6+Rhm/vbaRGyM8Q4C/heikRTwyAeDfsc0ddqvzKeibTX1qYq1BTSKYFJpm18dRJBrXS1QUrHpIFmPLHSK97YDSGnh2tveeuDMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlX6JBYjq4nxJsX5xnxb/lQXGcKlrFT6ttvCTKnEFAg=;
 b=R8Doe246022OacwV0LPLq/or8osqBTG+MNrVUtid1YetgLQkBPBYQvVbH1GcnOjlmEmr2R8NEAB7cZyUCVlXfv+cnLZaO4XJA2AHO4eZtDfNelfpJRjZSrpNqkZAzvWQPrI8aq0rj9NQwS98yVwhLcONOybSb4g/NCk1osZ4l65DKhZRGf13zI8IXUAG7RN9r5WaSdj8gHZo+uciCkF0U/i4rHSC3osumWiIBJI7lnbulKYzKvdsx0m7TzLZb2ZJLa7PB8OR4tX3FFpZbMjsm3o9AGMdPozlwEMss6ykOhrRM39Do90jWx9j6bEdxUCIpSfrb/YzpXlJol3smrWNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlX6JBYjq4nxJsX5xnxb/lQXGcKlrFT6ttvCTKnEFAg=;
 b=B6xa0nqR26OB/E9BMGUhj6+pjaHpGrEyQHHA1hJJ4E+WaGHP7dDSRugPdt8ynmB+fcxoz45mzuiJwSmIs5DMDxpFGEwxl4E+fTNWvqBkevweST2mFq4nRfP/DITzpICGUmGqtSxDcRJ9l5NX1laekB27PAGiqeXozpp70mHQNX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 14:26:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 14:26:45 +0000
Message-ID: <e30428ce-a4d1-43e0-89d3-1487f7af2fde@amd.com>
Date: Wed, 13 Nov 2024 15:26:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241113134838.52608-1-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241113134838.52608-1-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cca53fb-aaa8-468b-5aa7-08dd03ef3339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODllM1U5TkpWM0NYbGlPaElpcVFXdk12NmlueVVKdjlYbWZhaTlWYm1WVGZU?=
 =?utf-8?B?QVUrREhoSmdWOHUrTHJTc0dwM0NIenNYWkNBODdGS0FVSmV6SHNuZGFoUlVy?=
 =?utf-8?B?aDUyMmdRS25kUERhUzBSd3BEcmpZTUhQaC9Ma1JPcHRqU29pTDk3b0NpUlhS?=
 =?utf-8?B?aWRBWFRqRENRVnpsOEVMbFRGSTIvejBEMkJ5MlNHeHpVUDd0bzJuWE8zeEVF?=
 =?utf-8?B?RDJLd2xPVWZIbGxkMVdkbXlzalFXQ0VVRnNidS9qcmkxTkRPVWpGaGRDNXZi?=
 =?utf-8?B?TDFJL0h4OXZyZVpvOVhhR1BRTTBQVlppcTNkL2lQKzJoOVA5QkorVmhaS1Rl?=
 =?utf-8?B?bWdhaFlYL092UnBuUEphL2FrUFFGbUlPZ3VWM01nTjhNV0ZOMHRya3VseHZl?=
 =?utf-8?B?N21ZQ3duTjZwRWFyMmlFQ3RpY1NlYk1yTkdLUDJjSWZ6U09RQUFZZ3RQdzhv?=
 =?utf-8?B?SlRLRVdZRHR6c3JEV1gxSFZiRWM4b0lTWWlYWW5YTEljQXZnMEZpeGR2cDBI?=
 =?utf-8?B?YUpWWTlRWHhMeGN1eFpyWWtlcjNUTFY4UGFGZEdHZyt2WnlvRUdvZ0lKUUo5?=
 =?utf-8?B?RHJ6cVdaVTdsakFicDZRQTU5LzVjT2hKcWIzSGg5cXlJNVF4bGV4SENzN09x?=
 =?utf-8?B?NVN6elZ0RVVTYXk5Qnd2V00yL1JPRjBwb253QkQrZ3NvbXB0NzVHSzFXcTJi?=
 =?utf-8?B?d3hxVS8yc3dzcWhyRUltUTZ2VkJMUC9udWJzYTFYNjkvNHdMZlB4NmF3VjY4?=
 =?utf-8?B?L1N1ZkNXM2FONDNtUTN6NUR2NExzaDk5Nm1lUTU3bGEwY2JDUVFrVzNVbEd5?=
 =?utf-8?B?OUhSVFN5YTFPSm8zTHdZejhEKzg5VzhkZjFTRzVkclBjQ3lTWHFTRVJHTXhS?=
 =?utf-8?B?SHhnQ2hUU2FpT3E3U0lJMGtKQ2FiQm1DWmNyVlM2dVdpLzh1am5MQmxoSHgy?=
 =?utf-8?B?VEVpdEVlRGEvdExYckZYeHNTcFBwU3RQT3hkMy9WUmVhakVMWHFqSEFLVHQ0?=
 =?utf-8?B?bGdGTXR3aU93WjMxNTFMN3V1Vi9KWFYxeVEralg2cDRDdW5ZRUtzMTMwb3do?=
 =?utf-8?B?OWk3Vit1K1hWemZ1WjFWOW9PR2ZqRWlRb1NuUyt2YXdTZ2ZCYTlSMkFvcGFD?=
 =?utf-8?B?Ky9uR2VFMXB3MmpucHFaWnY1U3lENmVEc3NmUk1tVHh0WU5sTk5kK0huUGVw?=
 =?utf-8?B?Q2RaWHZLaUZpZjlYbGNuVlVZeG5qZXZmckovVk1laWZnQWNlR1VIN0QycTgw?=
 =?utf-8?B?ZWh1L2M4U2hmeVN0bm9zNjNQNGZxZFV3RE51MFQ2RWN3bGN5cE1SK1VtWWVt?=
 =?utf-8?B?VmdhSFJsVzBGTlZaNm1LcmR5WTZzYUVIVjA4Z2RTVXQyTnhoakpXbUR2clVm?=
 =?utf-8?B?QUtpcUhZRjZ6S2k4UmVQbGxqSXg1YkxpZG5Ebmd4YVNIVk5hQndxT2xxc2ho?=
 =?utf-8?B?YS9UelNldXFsZzJ2ZHhqLzJXOHU2cW9WSXZYZml0K29rN3VaaUo4Zk5QYjNK?=
 =?utf-8?B?NndoZ2toL0VLSEtQejdITVJsNlVtdVFSN2p3cWVFd3NSWXNrNW96MnZSeHFm?=
 =?utf-8?B?QXlXVjRzb2xKL3BPVDFEbFJUMG5TVFNDWFh5bFNWeFNhZ251VC9YN2FmOWRL?=
 =?utf-8?B?VExOdDArOFlGUms4NHJQNHQxWDZrd0tXS3hzU3hYd3F6b0JNbm9CQXdyTmEv?=
 =?utf-8?B?SlNnaTVLVjlQb3F4MVpQakZYVllqaDVGcUdNdDNaWk8vZ3Vvdzh4ckFZVnVX?=
 =?utf-8?Q?q2cnSNxHEJRgtl5ODJFGfdGihZXvv4h8tVxvxAi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnZLeE9uUGcwTkFMR3FzbUlGUURVUksySlFQdXBFV2tQeWloWU9mZjBhdkUz?=
 =?utf-8?B?b3FVVElmRjRiU3JKMWFUL3hZbk95Rnhsd1FjbmhPa3ZpUzgvcFhwZlpnaXN4?=
 =?utf-8?B?K2xNbXl6SGxwdFpwQnIzaW5Zb3pHWVpOREdReFl6WFBpRHpoYzRiaVlKaitD?=
 =?utf-8?B?WmtVeHBEVnAvbVJUL1pvWm0xUHVvSXpJamNwNUJ3UlkzRldqUHRoQWZqTENR?=
 =?utf-8?B?UnR0RmpaQ1BkRkFjU3RWTzVIb2xGd3R1djB5OXM1T3dsWnpyUmxOazJ5VHhw?=
 =?utf-8?B?ZDhGY3VsMjNyNklqeWkxVDJ4UHlvbnRQNDVBd0h2M3orL0p2blZlNWhNdERS?=
 =?utf-8?B?amNLTTJwSGE3REV5aXhEb2FmN042U1g2Mjk3Qmp5ZGFMY0JLYzdhSmE3R0RQ?=
 =?utf-8?B?RmR2Zm00R0pQT2phUzNsSmdIdjYvRkY1Yk5FV293WStaOER1QkdvRy9oQ2l1?=
 =?utf-8?B?V3E1MTRiRkZFRmZlT1NUeTVWME1aSnh0NHplQ2lBejB4MERUYyt4U0Vqd29j?=
 =?utf-8?B?Vm5rZUtkZVQxWjR0NU0wMDJlczMzeGhKS0ZxSW5BU0JQY3YxSXJZbFNzR0Uy?=
 =?utf-8?B?NEhsS2luVUZQTGgyNEtUb0hDb1ZFTnNMZlNjYnlrdHJwTmR3V2VPQUlEUTNu?=
 =?utf-8?B?NWllWXlSVDExalAyb3BacW5aSEhDeW16cndaRTdWN0RUcERBd3ZheURyeHdL?=
 =?utf-8?B?bk84SC8yWXJuVEhScTUvTVROa2E2ZTNNUmMyZkFyMm9EQ0lNR1lBa2Z4VkpT?=
 =?utf-8?B?Y2R0U3hoTGtNSklkSG1zREtQSXl1UDZyL1Y1bDJrMFRtY2hCK1VIWnNnaGJP?=
 =?utf-8?B?UzN4QzI2eG9GSFJycjlaS2FoSnpXRlUydURwMGw5RllQK2RRdUZnQTFtZHNJ?=
 =?utf-8?B?Z1BJUWFRRzBOZnVYbU41NCt1Sm5wRzJJQllPUzNuNmNGb05YeVRxS0FUbzBH?=
 =?utf-8?B?MUpKYXFDbXY5MWlJVkxBcjFoeWxDRGQyYzBIM3hMVmtJTTFhK0h2NFF5NUh6?=
 =?utf-8?B?UEFEUytrVnJFYVdYWVNnSlI2S2lUQmxCZlRXK003Rk9FSld5enVlY05Fd1ps?=
 =?utf-8?B?TnQ3NWdOaEtmeWIyRmRoaFE4bmdzQk16bXNuZitkN2h1NDM4ZnUzQXpDYVdh?=
 =?utf-8?B?ZXB2clBRU0hxUC9LSHk3WHZKVTJwOWJwNHFUaGZudm42S0c4R2hGOWVYb1hD?=
 =?utf-8?B?T2w5aWJBNUpFc21HSkNoWnRpcy9qVGlxbS83WDYybVBMNEVsT2hhWWtMU1ZS?=
 =?utf-8?B?MUF0eUJJVW5UTXg5YkZLQzE3eUJPN2QzeDFJTDQrU084OGUxQjFtQ3VMMGNJ?=
 =?utf-8?B?bktNOWNhSXFidUtBOG9rZWwzN2xsTHlmU0l1b3FKS0tQUXZaZlJzOW1oS2g3?=
 =?utf-8?B?OHdHdFcyQXEvZERUT0R2Qnh0U3RHK1JBUEM4UG5pVkpuT0NEd3plMVM4SFli?=
 =?utf-8?B?c0FsNmtzN0hsTm5DUjQ2Lzl2Tk1iZ09tYndtWE1uZHBXdG9icUVBbGQ1OSsx?=
 =?utf-8?B?VTlKdUFaeCs1bDY1TEgwN1lOTkMxdGJ6WHlNUlVpL2ovUEVxMzJJMVhDS3pM?=
 =?utf-8?B?UVYvY3V2OCtxUlVSOE5QRndla24vTGVPdlJEYWlIUzh2VVlXMG0yMWg2VnNq?=
 =?utf-8?B?TnpmcStkUGVXK2VuTGlWOUVnUlhsZzV0bGtlVHBzUC9sVU9NbDVkYkxnQmtO?=
 =?utf-8?B?OUd6WXliS2ZFSVJ4d0JuNXU0Z3NFdVl0UjU2d2s3aFdEaWREVVZ5STFRMURK?=
 =?utf-8?B?MFllZjJscU5MSzB2YkhlUFVobEloUFQwMDdxcGFraCtMSHlSc2FLZUNUS1Vk?=
 =?utf-8?B?RkFPSlJXTnpkaEJlRzY3VHpOZ3IzY1pZYWdvWURiTG95bE5vU1FvdlZTaU4x?=
 =?utf-8?B?NzhHNDZRK1hkRzFmZjNaTHB0cXVEbUluNDh2WFR0VUR2bmhTSmR6Y0NDWkY1?=
 =?utf-8?B?aHpwaHFXanRZVktHUnA1ZEZiVWgzdE9reS9Jdld1Sk5iODlyZzJ1SmpwSUNm?=
 =?utf-8?B?WmtPSFVaS0RIUzExdDRTUGZJVklyaE5oTGtZbys4ZTdlUHljV3dkRnVpWDh2?=
 =?utf-8?B?eHVGQzl0ckdlUmJJemszR0Q1NlN0b3FsK0NORndwUnhOZUZIZXVjUjZWUXNt?=
 =?utf-8?Q?yg2Kj7l/JgTtrRA81vcbamFX1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cca53fb-aaa8-468b-5aa7-08dd03ef3339
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:26:45.0538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GICgcbWNnrFIIALXom1A0f67uznGUZocLgVDdVDnCYhuBikxCnF+jQkUYaFkoOI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
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

Am 13.11.24 um 14:48 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> As commit 746ae46c1113 ("drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM")
> points out, ever since
> a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread"),
> any workqueue flushing done from the job submission path must only
> involve memory reclaim safe workqueues to be safe against reclaim
> deadlocks.
>
> This is also pointed out by workqueue sanity checks:
>
>   [ ] workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work [gpu_sched] is flushing !WQ_MEM_RECLAIM events:amdgpu_device_delay_enable_gfx_off [amdgpu]
> ...
>   [ ] Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> ...
>   [ ] Call Trace:
>   [ ]  <TASK>
> ...
>   [ ]  ? check_flush_dependency+0xf5/0x110
> ...
>   [ ]  cancel_delayed_work_sync+0x6e/0x80
>   [ ]  amdgpu_gfx_off_ctrl+0xab/0x140 [amdgpu]
>   [ ]  amdgpu_ring_alloc+0x40/0x50 [amdgpu]
>   [ ]  amdgpu_ib_schedule+0xf4/0x810 [amdgpu]
>   [ ]  ? drm_sched_run_job_work+0x22c/0x430 [gpu_sched]
>   [ ]  amdgpu_job_run+0xaa/0x1f0 [amdgpu]
>   [ ]  drm_sched_run_job_work+0x257/0x430 [gpu_sched]
>   [ ]  process_one_work+0x217/0x720
> ...
>   [ ]  </TASK>
>
> Fix this by creating a memory reclaim safe driver workqueue and make the
> submission path use it.

Oh well, that is a really good catch! I wasn't aware the workqueues 
could be blocked by memory reclaim as well.

Do we have system wide workqueues for that? It seems a bit overkill that 
amdgpu has to allocate one on his own.

Apart from that looks good to me.

Regards,
Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: 746ae46c1113 ("drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM")
> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
> Cc: stable@vger.kernel.org
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25 +++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  5 +++--
>   3 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 7645e498faa4..a6aad687537e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -268,6 +268,8 @@ extern int amdgpu_agp;
>   
>   extern int amdgpu_wbrf;
>   
> +extern struct workqueue_struct *amdgpu_reclaim_wq;
> +
>   #define AMDGPU_VM_MAX_NUM_CTX			4096
>   #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
>   #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS	        3000
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 38686203bea6..f5b7172e8042 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer amdgpu_watchdog_timer = {
>   	.period = 0x0, /* default to 0x0 (timeout disable) */
>   };
>   
> +struct workqueue_struct *amdgpu_reclaim_wq;
> +
>   /**
>    * DOC: vramlimit (int)
>    * Restrict the total amount of VRAM in MiB for testing.  The default is 0 (Use full VRAM).
> @@ -2971,6 +2973,21 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>   	.dev_groups = amdgpu_sysfs_groups,
>   };
>   
> +static int amdgpu_wq_init(void)
> +{
> +	amdgpu_reclaim_wq =
> +		alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM, 0);
> +	if (!amdgpu_reclaim_wq)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void amdgpu_wq_fini(void)
> +{
> +	destroy_workqueue(amdgpu_reclaim_wq);
> +}
> +
>   static int __init amdgpu_init(void)
>   {
>   	int r;
> @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
>   	if (drm_firmware_drivers_only())
>   		return -EINVAL;
>   
> +	r = amdgpu_wq_init();
> +	if (r)
> +		goto error_wq;
> +
>   	r = amdgpu_sync_init();
>   	if (r)
>   		goto error_sync;
> @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
>   	amdgpu_sync_fini();
>   
>   error_sync:
> +	amdgpu_wq_fini();
> +
> +error_wq:
>   	return r;
>   }
>   
> @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
>   	amdgpu_acpi_release();
>   	amdgpu_sync_fini();
>   	amdgpu_fence_slab_fini();
> +	amdgpu_wq_fini();
>   	mmu_notifier_synchronize();
>   	amdgpu_xcp_drv_release();
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 2f3f09dfb1fd..f8fd71d9382f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>   						AMD_IP_BLOCK_TYPE_GFX, true))
>   					adev->gfx.gfx_off_state = true;
>   			} else {
> -				schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
> -					      delay);
> +				queue_delayed_work(amdgpu_reclaim_wq,
> +						   &adev->gfx.gfx_off_delay_work,
> +						   delay);
>   			}
>   		}
>   	} else {

