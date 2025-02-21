Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C19A3EDBC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 08:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E6D10EA2F;
	Fri, 21 Feb 2025 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5A5WDF5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141410E106;
 Fri, 21 Feb 2025 07:56:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7TIgzJJ/aTXRdVHF3f53AhKaBN0XbeN33/gkKnMVKWgPRenk0HIO6wEvahmT2rexb7HPzl8C6yo0k7+20neUYV57fPEzHRYYH2yaC261Ys8fDmv+NPzH8q+akHn6PkFGAHHUWL2A5yVSKXVGW4lmn6qUoz5S0sVVsuPz9MrPsvBdpzxEg1U7RIxiOx7kdGoMR36RdyBX2M8sBS06WZGLeFGSOP7nG2K2icOEQSd6+uwbtCapiZhjONbflXSSJpJHuzjMDTRs8izTPMDE4n5e5HiKk3EWQUi1D68us7wg181/ldJy+lYO9IriLUVZG5eBh0xmitWiUXmJGELJ0oSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5UOjxDb6dOTaQ0pgBwv9hKcR+AGcI80cpfG1xI8eIM=;
 b=IXpoVfLoRqY2nYr4sscCvavtUHDAKekyf5VUE0KPIWXU2ICmAGtvOQnTIZ6vakC0GlM4mB91Vy3cKBRKBmXcefLY+vaN7j3sn0Juyul6XQx0kQx6zeq/8O/81w+swBsRGaHZdex8SmP5DXEcRjIHtujyeMKwfLoEjyFkgnQEa3NH60N4/hDBX8jTqykGgRCBROgBNmnRaDRnJl6IwgRZWF7Lnl6WHJnXVTveew+XLltgnFmSY39WB7kc8tcNxKMrSbNAqMsvPGWdh62zrhEAzx8HKbguivRnTshzpN57KjZdy8/aC4wfckftGqS+rhAkmp71FdNNPw35pAGCCsRATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5UOjxDb6dOTaQ0pgBwv9hKcR+AGcI80cpfG1xI8eIM=;
 b=5A5WDF5WBxEmzRoTIkty5ZuXP4zmway0YiRgM8s9uVdFoPxqGH+LOc/C0ipsqi+gD4HklbvvMW184HLcD6+9mWCUpu8d9PIxu80Z2uwkgnYA9B/aKW02hWCCXQ1X+wnHUWoZpdsP38vcSvZb8+LryLbC11H0rSeEfFTPZ1rlfM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8899.namprd12.prod.outlook.com (2603:10b6:303:248::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Fri, 21 Feb
 2025 07:56:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 07:56:37 +0000
Message-ID: <b32a4ce7-6701-4328-a31d-6efed0c539de@amd.com>
Date: Fri, 21 Feb 2025 08:56:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/amdgpu: Trigger a wedged event for every type
 of reset
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, siqueira@igalia.com
References: <20250220162750.343139-1-andrealmeid@igalia.com>
 <20250220162750.343139-4-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250220162750.343139-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2a745d-676d-49e9-2f2d-08dd524d4495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NSY1ZncmFqQmRNZ3h2L0JwREpHSVVtcDdnTWgrd2ZKODUyNk4vVmZzd0pa?=
 =?utf-8?B?eVoxUFc5Y0dZMStMV2d2SDZqSkRXUzdQUnYrWURPVGw5b0pWTjV3eE9aenl4?=
 =?utf-8?B?VDMyR2h2bUtQZXhGcTJoMkh0UDVUQit6M0lVd0FDUm1ZMFpSbUdnQU1qYmZq?=
 =?utf-8?B?ZjVVV2x1bTltTXBYLzhCR2RBcjFpRFc2MEhyOXNQZFdyWVlrLzhrWjFOREJo?=
 =?utf-8?B?cjAzRTZ2MHhLcHdiMnhFQzI0U1JJNG9QUFZOQXpUSlhoaXZmSzkwUUEyelZz?=
 =?utf-8?B?WW5RVytkKzQ4bVBuZzd3WElIRmJ0MTZuT3VzSGNXbDYvaTVwb2kxWnkyamx0?=
 =?utf-8?B?YlhteFRKRFp5QTV5WGJML0Fjemo3SFJMZVhodXhDdjJCbHdldTFCZTgzcWto?=
 =?utf-8?B?MWl1Vm42Z1BPK21jSkFkcTdFMGpSUGpka294RUN5dnNkRUZNWjQ5QVRRa2k1?=
 =?utf-8?B?anR6SllUR1JDUld2UUZBOTc4YWM0ank5ZFR1YlR3NUc3YmdtcTlTaUdZN0Rp?=
 =?utf-8?B?VDE0aEdyY0FLZG1rbGhETVlJVXB1OSttSlFWNkpyc0NWbnpSakp0Yk00TDdi?=
 =?utf-8?B?MEx5bENxbW1WRXhJVmp1NlVIa252SUt1ZDFkYS9DdlYvUkg3UVlxaEF5bjR6?=
 =?utf-8?B?VW52c09neXN4VTcxOXRQa3BRV2N0YXdBMjkzeFV6UUhRSUJVZE9TSlFzdmpa?=
 =?utf-8?B?WVV1ODZ2NmdTa1hpemJkMDJkYytZaFpUVlZBVkJqN2xWb3g0MlNDNVQrT1VX?=
 =?utf-8?B?aHBCVjdRN05Hd1ZGZW5NTWRHdVYvQ0ROWFpLT0dSZmxZSDl4V0VtQ2hobEdt?=
 =?utf-8?B?SnhRc3lhS1BIektkc09IQUJ4M2N1QjVsL0QrZFNjNjIwbUE2UFZGWjVPOGNn?=
 =?utf-8?B?aWtNTm50dm1kYlpUMy9pUW1SeUsyaThzMytKNnhEelJEa0lnKzZtenJBTEY4?=
 =?utf-8?B?SHE3R09FdjJvQ2FsWlFXVC9LdjYzamZUMkhzN3l0R2hYckVBbkgvWG5haGRh?=
 =?utf-8?B?SFErd0MrN1lIV2VGVlNTYlIxTG1XTTNYZ2kyMVhaZXpZMkRZeElNQWJjVkVG?=
 =?utf-8?B?Y1YyeXZZN1A4LzZJeEx2VXVVTk5BdTN1OFVNZVZBVlhMK0tKczBCSEZ2Slhs?=
 =?utf-8?B?WitSUFlMM1FsbHBmSE1xclA4OC84Y3ZGMUxmVnI5V3FJOThNVW5hNllIS01j?=
 =?utf-8?B?ODE5WHBidlU5S0RWejFBRysxS3ZEL0xPSUhNRlVUOEZjWXNhbStidHI3WEw2?=
 =?utf-8?B?M1U4eU8veHMzdTdYZnRtejA3d2syaUNWbkFBTFllWUNqeVdtTHhZc05hK0ho?=
 =?utf-8?B?bjJwVHdRRkFmZXZPbDdpNTZyd0dFZks4M3dJSjQ3WXQzWm55MmVybEM4WHpo?=
 =?utf-8?B?SmluQ0RUU29rMWhzc01iQjQrQSs5RDE4eGxBY2xtYmNMQWVOZ2tad29nNXFs?=
 =?utf-8?B?NzdzOTA0cnF3YnlFVGZTVGtqSTRhNEJLMks2bnRSMEIvbU1CWlpkOURId1RF?=
 =?utf-8?B?V3B1RXQvYUxGaGc4QS9BTDViT280Y2FIbmNJcGs4enZWTkwwVURyS3ZlNnNy?=
 =?utf-8?B?cTBKSUZUVnpCakcxZkhOejNnR09uVTQ5SHE5aHJVcTdLU0dNbVhJR01VdVpj?=
 =?utf-8?B?VEdSQUxQYWwzcytYMXFQUnJJeSsxZzB4MzNTVlFGR3NpN0Zscm5zVlNkZEx1?=
 =?utf-8?B?dDRybFRENURkdDJiZFhEdWgwaUhzRkxNTzZhMGVoNWRid2sxRDlZSmRDcnJB?=
 =?utf-8?B?MFRYY3Q5ei9KS2l6ZW9DZ0NWUmhEMU9CMHpQTDY5UEVlbUNYYjdSeUhaUDJU?=
 =?utf-8?B?aldBeFNoL1A5S3l2Y21sTHEvWVk3dHlzV3pxSitlcG0razlRbE1uVGhXZG1j?=
 =?utf-8?Q?gXWAEdAfhr9Aw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEFGa0xqdDU0ZkVFMUZtdzFhQXJmQ2RhUW1pSERiOVo0TFkvNzBzZGl1YkdQ?=
 =?utf-8?B?RTZRMmtBUHgxbkRjNEFYUGNXc3FEVXdCZlY5YkkwT2RoNDc5SmYrZFU5dTNC?=
 =?utf-8?B?WmY1bWM2TTZqbnd2b281KzBEczJaQVp3VWFqZ0lJSGNYMjUzc1JpTXBNUmkx?=
 =?utf-8?B?VUxkRFltdFl5RVR3TEVBSUN4MERzb3IrY0czMklrSDRSSmF4Ny9sUytCZzcr?=
 =?utf-8?B?a1Z0R0Rta1ZrRjVsa2w5ak94NWRQVjdmVkxCVlRzb1dHankrWVJsOVRkdU5v?=
 =?utf-8?B?bUVnRjJEb2lwZHZ1dGl6VjhneEdMSWNlcjdteUgxd0Y5QVh0V3h5ZFNHTmNQ?=
 =?utf-8?B?Z1lCeDJrQVdEZ0I3TU9uRkYweVByUXhVTXJKS3YvVnRBTnZtVDl4TTM1TGFp?=
 =?utf-8?B?WkpCRnJBM2piSkliVzZQQ3ZrWUl4eklRZHJYaFBxNEpMMUFlSXFOVnR1WUdI?=
 =?utf-8?B?eW00YyswOGE2V1IycVZaSzMwcTlKK2FBbHI2NFNSUExDTTNqcWJVZzg5MC9Q?=
 =?utf-8?B?MGVoUHdPZ0s4Rlpyc2JHSHY0VHNZRDQ1UjBiVTZvWjM1WCtUS2c0clJIaEpq?=
 =?utf-8?B?Q1h4eEprQmlaY0NYWkphSGlPS01UalhabzdnbXY3a0svd3VHM29QeVpMcUlO?=
 =?utf-8?B?d2hhWXNhUEdabFJZOTNaYi9VQ1F1V0hDTUJXVmd1Q1JEeWZOZDFSaUlXclE4?=
 =?utf-8?B?Mzdqb2FleVdzSTFwSzBzVU9qc05LWGRwb0RvVzV4UkJuNjgzdlJlb1hRdlJo?=
 =?utf-8?B?bDZDaGdpbXpHRlV0Yjk3djdjdnRmQTU5MDFZQW03ZkRWYk03cllPSmEybWFY?=
 =?utf-8?B?bDM4TG9CSno5S2F5cDFTN1pkZlBiNTBZa0RqejQvRXNwUmRLeEx6UXUwVjNl?=
 =?utf-8?B?VFo4YTZFMTRKdFF0TWZINWZ2TXVWRm9VYzYxMStIZVNKNUVKYVlNbnA4WFlH?=
 =?utf-8?B?WkZTc2FKbWsyYmJUS2M2K05uL3FGeUtWWlVOb1NIR3RySU9pN0JHUk5jdnor?=
 =?utf-8?B?b0R6N2ZCMVVzLzJTV21IcmUzNlREUjB0YWY4NmdwN3ZpQ0JXbGdLY09US3dC?=
 =?utf-8?B?SE50NWROTnhJSkQ5T3B5czdWeXRBMWdGeDAzeXJuM1AwZWVQWnB4bU8rSVlC?=
 =?utf-8?B?dkp6eXBQYTVtcG9qT3RmaWJLZy9ZTlFFN3FRQ2syZmNsNTdrWE54TlZFOEJh?=
 =?utf-8?B?YjBsMXJzMCs0NHZhR1RsODhJM21QdjlZSW0rbFBHeE5oTVllbER4RktXTlB4?=
 =?utf-8?B?bEc1NVZBRUp6eDY1KzRkZVkrdXA4R2tBVG1vSVJQU2R2UUtyMm80WWVQQzR4?=
 =?utf-8?B?My9rd1p6L0FyOWtMMnN4L0NMcjlFcWtxTFM3RzhQSFNjc25uM3ZRVXFQK0Fi?=
 =?utf-8?B?NUx5R08wL3ExREdJZEtyYmRpUWE2NTA5UzJDL1Y1OUROakM4QmdUYWpkeVF6?=
 =?utf-8?B?L1ZscG9LOEpZWUZrbHZMYnEwaU1DSnMrZUVVaStQZmVyYXZscWwyVlFBL2JU?=
 =?utf-8?B?MXpZYWQrUDhkdXIyRlk3WmRRWGRMNERNYTJDQ1Z2eUJ5R0JTNUhjMjBWU0lU?=
 =?utf-8?B?RlpHMlprZENmOFdCZkJEc3pOTStxeTByemJkTTVWY29RdXJPUFVlMWFVTHpG?=
 =?utf-8?B?dEhwanlvaEVNejRlUDBDekVWV0ttaW1ZTnNTRkJHMUFodzFPNTNBQ2taYnli?=
 =?utf-8?B?d0pMc0ljMTdlQVZXZVEvR01mSlhycUo3RjRMNW05ejN0WHg0K01TNzB0MG5y?=
 =?utf-8?B?LzcvNVZHMVI4ejJjaFBTL3V6am5FQjlnbHZaTzFRMnM1RDltT3Rld2VrTExM?=
 =?utf-8?B?dmY5elE4Z0gxcG5sZjlKc2dwTjh6RHdQOFNCOUtRUjVCQWlUMTBHdkZCMXBE?=
 =?utf-8?B?aGsrd0tLV0tRbWwzWUZjdDFvbXI2R0tITDVvOVZncHlWdFA0eHdjS2VBcjFW?=
 =?utf-8?B?WGRsSzJUL01xN29iMDB0ZkZxakZUSDRHN0wyWkdxWkp4V25kRTN0N2Y2dFNR?=
 =?utf-8?B?dVZzYW1wait0S2MvSXVSVEgwYzR4dGg2OCtmYzcyTmQ3cTMyeTlpb1Y0T1Mz?=
 =?utf-8?B?TENvSDF2a0haYXNiSzdiS1NmMWV5UU1LcGVWR2txVUU4Y0FIRnFjSWM0WlRy?=
 =?utf-8?Q?6tdPR//Ldod3o0+Rz/lYQ7x0a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2a745d-676d-49e9-2f2d-08dd524d4495
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 07:56:37.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IC8bLdbXygCfr1pjOW47ttZ/vIyfe++Gh5qT7/mg9bEOTi11CeRzRqfNgSwDray
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8899
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

Am 20.02.25 um 17:27 schrieb André Almeida:
> Instead of only triggering a wedged event for complete GPU resets,
> trigger for all types, like soft resets and ring resets. Regardless of
> the reset, it's useful for userspace to know that it happened because
> the kernel will reject further submissions from that app.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Keep the wedge event in amdgpu_device_gpu_recover() and add and
>     extra check to avoid triggering two events.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 698e5799e542..9948ea33d2c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -91,8 +91,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	struct amdgpu_job *job = to_amdgpu_job(s_job);
>  	struct amdgpu_task_info *ti;
>  	struct amdgpu_device *adev = ring->adev;
> -	int idx;
> -	int r;
> +	bool gpu_recover = false;
> +	int idx, ret = 0;

We usually stick to "r" as name for the return variable in amdgpu.

>  
>  	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
>  		dev_info(adev->dev, "%s - device unplugged skipping recovery on scheduler:%s",
> @@ -141,8 +141,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  		 * we'll fall back to full GPU reset.
>  		 */
>  		drm_sched_wqueue_stop(&ring->sched);
> -		r = amdgpu_ring_reset(ring, job->vmid);
> -		if (!r) {
> +		ret = amdgpu_ring_reset(ring, job->vmid);
> +		if (!ret) {
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_stop(&ring->sched, s_job);
>  			atomic_inc(&ring->adev->gpu_reset_counter);
> @@ -170,9 +170,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  		 */
>  		set_bit(AMDGPU_SKIP_COREDUMP, &reset_context.flags);
>  
> -		r = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
> -		if (r)
> -			dev_err(adev->dev, "GPU Recovery Failed: %d\n", r);
> +		ret = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
> +		if (ret)
> +			dev_err(adev->dev, "GPU Recovery Failed: %d\n", ret);
> +		else
> +			gpu_recover = true;
>  	} else {
>  		drm_sched_suspend_timeout(&ring->sched);
>  		if (amdgpu_sriov_vf(adev))
> @@ -180,6 +182,10 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	}
>  
>  exit:
> +	/* Avoid sending two wedge events for the same reset */
> +	if (!ret && !gpu_recover)

Ugh, that's rather ugly I think.

Probably better to just add an extra drm_dev_wedged_event() after the amdgpu_ring_reset() call.

The soft recovery should probably never send a wedged event in the first place and we plan to remove it anyway when queue reset works reliable.

Regards,
Christian.

> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +
>  	drm_dev_exit(idx);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }

