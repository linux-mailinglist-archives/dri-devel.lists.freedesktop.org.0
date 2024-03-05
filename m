Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178EA872107
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E7B10E186;
	Tue,  5 Mar 2024 14:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jyQKXNrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857D710E186;
 Tue,  5 Mar 2024 14:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJTzbWxncX4Jr4RVu6g4ehLSy57OoodoP7LHeb84HwHKkDJkLRTdie/brTO5X2Ap+YpqMaIRJiObzzarC4/yBKBoq9L/UuslfAQnr4MmctC8QdQVMdefs93xbHbBtBE9D8x7T3UdRr8LHKKCg/1A8LnZCUhYgfRycnzGiuw5yIg+sY1m+R/+gC0iNEA06Q/ndY/LskO3vzUw1xW4M4bk1S7lWwdLuFFtowtyL8sbr91RlOIUYnc7DbqX5lgveIk0hospwaE9/A1qCElSHIfjzvughZuVGyq4a41ltLYixSMm/cdsEnZS5lWL3jTywYfUNYdiO4T2mEx8ab7eyj7gCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/RYnXqfVMyrpzP7so2DFKnPKZL6qoXhgFMadFdMyRU=;
 b=IMzCcKhs0b0ijHkS49TCH0BRyRzle8MOpjaclM6Xe0RJI9AH12cmCg7iWkFpOjGW6OAHeBHOYQTTx47wHKKHnkTvHP++UiU5v8yoZTzuOtvVixZfKeJpLy+Yg9fBqqRmJfQ3+jjFNUpblDEPTWAvJ+88tV67zJbCcAtgf3pg8BMdu7xvKILu3DLiisxGtb1SUBvQczygiwT63JeP5Ny29igkHRLPNKOT4phwud99z6iCYgjld1ryyFGn8iFf5XTKkpacyR2WI+HtbMmlPSElfxrcrp0vFU82RGfyNKY1ccGqa7T7CvNTIIFthiTM+R+qW6BgnhSWxwe3tpf/BkTQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/RYnXqfVMyrpzP7so2DFKnPKZL6qoXhgFMadFdMyRU=;
 b=jyQKXNrreB1Lqv2LFH2JIP8i2IC4VW35c70JrzdEQUw83B2/Fp6zaf1ZepHIJlcbA06s0wu2d4ep6Xv7yE1bPprG2e1Opikp6gIlAINzXErzuzEB1l08vflXl4zEXXsVCJ/czN8DhetjLYjiUOa3T2H3cG30YutE6RyI3kYvchc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 14:00:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Tue, 5 Mar 2024
 14:00:00 +0000
Message-ID: <800f41b1-0a6e-4d68-8ffa-acf9e4237878@amd.com>
Date: Tue, 5 Mar 2024 14:59:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amdgpu: add ring timeout information in devcoredump
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240305135738.3162878-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240305135738.3162878-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 74cf05d6-405c-4974-f79f-08dc3d1c8c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpReJj1o6pstQbaqHDiLviFjsXDmeaHeI8MX4SJXY6dPVNeRYsbRovGNbGLqFIvhwpqIqZagGY7+abA4XIuiObXEm6z+V93RTfMNz60pRUWO6AnOhXp9y62bSkNCibCc5v8Rxk/WZqA5GCxP4zxSzcYDSS6q8GVq3P0zO8XwsPZo6/vC24FAM/ZYj8rXX3mt3AG3hr97F9vqsPjo+aumU8w7E+0X0lBlqsiFej+w+1uO9twOWZS9x/o70ei6aNGnJbcR4hi3ooQE2FatiqsDq3RW+iybTtEv7kOWHZoscDymCv/7U6JCI/kU+24wMMJTmqanD5MT9YbYsIjYWEWqzlq37MzlUeUAuSb2cd7Rl4Kc1Ndz4SmA7bHX4kMZg4bfXD8qQekFpK5ZinGHkDRq6IOWy9kIsl8H7sl1vgHlf7NcRdw5Xk4aoTFVomu4kGqxev1rHc/coa55qk/ykhLoPYReOjjSbxug0iHfOZulWeWjcjuB1uAFfqDdX3rqpU09iV0Z2kdhwXTekMRW5FeoZPxnRmtEgrkRQNoFFI85u6MBS9Gjm5ct0WpjOiCx+4wdsV6ckv3faow7YWaRiPg+QnNwPYVRrV3KzwYrH1V31LdbLFADldoJMPaEm1avYFAprDGi5xSVTB2B0eH0ZKk1xYI56pRd4SArDwLLa5VUUEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTVPOTJKb096VDNUN1UrZzNMdWxad1lTOGh3UzFoV0VYMUVNK2xqcEQ2Wjl5?=
 =?utf-8?B?UzFxMXg2K0hXQlM0bGJXeDRuSjU3VU5JSlBITVY1K2c5Y0Z1YWFqSldyT01U?=
 =?utf-8?B?dkpWR3RIZCtObTZvaXBHSThnZmM0T1ZUNzd3Z1orNHY3RGRycERSMko5YVlN?=
 =?utf-8?B?ZG5LSmdrK2Fnelp0Rm9xWTdMUHROYjUwUHRVZzdWNG5CNUVKemJVa3R0Vy8r?=
 =?utf-8?B?d1FnMnlLUVdyZ2ViR0dVUXVQNDNLdWpQdkExb002dFVhTzFWWGx0Z0w5aDlC?=
 =?utf-8?B?RUxhaGtVWXZHRU43blhEYlZHYVhSdVN0aDJHU3oyeVlKVmJrMmlDS2NLNm9a?=
 =?utf-8?B?dnFiM0JObTV4aU8rS2hsUkFXUjhqYllVeXJGRnFHY3BxWG5qb2pqUlk3ZERD?=
 =?utf-8?B?YUIwNUhWWHJqWHRYYllSRGhTK1lJeXZCTnAra2dKYitZQ25DWE42aUd2ajVr?=
 =?utf-8?B?NlZBa2RiUXR4akhIUkx4MkQ3eGxOQmNWWDg0K2poTGI2dkdIWCtpdkx4Qk5s?=
 =?utf-8?B?UXlEVUdXcUp4VEZUbE1SYVl3bjRDS3NIZFBXNWNVZmlqcFhEU2hkWXgyVnJE?=
 =?utf-8?B?ZlA3aTc4UU42VjBNS2Q3cm9NeHU3RWE1OU9rUldGVEZmelJ1WnY5Z1Q2VlVz?=
 =?utf-8?B?WGVZRWJ1MzQ0K2pSZEp2VGZsOEFETXRXbWxHUWFrZ1NNZWE1UVZGZmdZL2pw?=
 =?utf-8?B?eHJxUC9waGwrY0VrYnNRRmVCWTh5T1Fhci84QVptYW1VbXZ5YnBXMktsL3g5?=
 =?utf-8?B?MTdxWWVGSVhyYzJPdW5Dcm0xYTJnUTNndTZkc2pkbWVCVFFBV3R3V0RZZlVv?=
 =?utf-8?B?eXl3V2s2ZlZLblN6d2VEc281a3gxVjl2OUg4VE8zUmdmbzYwK3dmYzBlWEZw?=
 =?utf-8?B?NkZXellJUzJ6RDZ2S2VnUmVTWW1acytmRElWbjc3cXdyWi9WR0ZiQXFNaC91?=
 =?utf-8?B?dlp3WWhHZ01Tbk03NEFBSll2STZPVHI3WW5XTFZod2QxeitoR3B1OFc5cmZJ?=
 =?utf-8?B?cmVDMjFYNlNVOGQzYkM0aVptRW9vbWQ5RUtza2JDRll3Yk1CYnNsSHMzdGZn?=
 =?utf-8?B?OStacjBRYzM0OHJ4Sjl4RUpoZEJiSjlxWXhRUHRBb2txa2xtaU5UUW9pY0RL?=
 =?utf-8?B?SHJkSngxZlVwNUJHS04zU2VwcGlobzN6VUI4KzhVaCs3NkpVOGYzeFEyeEUy?=
 =?utf-8?B?YW9TMUw0MTIxeGQ0eU1XdEFuanJOeUZiOGt0S29Xc0NKSTVROGFtcUhteElJ?=
 =?utf-8?B?TTRxM2V2amI2dzhWZjlJR0w3cnJicHFwY3MvTDJ4THR4M2dVUzZCMkkvekdB?=
 =?utf-8?B?YVVZWi9Ub2E0RHk3Tld6V0puclVkZ2hHditJdEtwZ0hzUHVjdlJPRlgzOE1B?=
 =?utf-8?B?WC9jcXlkNTkxcjJPQm44ZmhoL3hJRzhRUWZpc0xZWUJLc25lRHRqalQyMHRQ?=
 =?utf-8?B?azltck1uQmJaQkE3VWdmQzJDNTlZTjl3UmxMSytlZDdNcW8ydEtSbVpyYWVo?=
 =?utf-8?B?QXBTNitNcVRTd254VXdYVFNJTEJtM1F1a1BvUHllTVdtbGZUWFRRNzlhcDlK?=
 =?utf-8?B?L0JvTExZNy9tV3Y2Q0tkeXhkK09md21ycnl5MGJycnZ1TXU1d0Irem9Qek1h?=
 =?utf-8?B?ek5hRmhJNjQrUXNLVTVROENaTERjWTViTmtVdWlDdkIyRndpUjJ1QUF2LzFy?=
 =?utf-8?B?U0Z6Y2VkaVVXdlY4OUZUNGp3SEpMWXArRkQvZUc1QXdkWWpYOU9sblIwdy9J?=
 =?utf-8?B?Vm1CbWRNUC9UQU0weFd5TXcvVHBCV04waGFwOGYxaHhkdWVuVDhmZ1pSbDI3?=
 =?utf-8?B?QnVPNWpKd3BOWitndHoreTJBVWUrVkdmNER5WGJFbDBoWXRDd2FZZlBJeWZq?=
 =?utf-8?B?RCtaU0JDZFl3S0doVnlPZG9pWjIvMExxb0VGYkNGckk5Z3ZjdDhLc2o2ZUxH?=
 =?utf-8?B?NDlnazFNQUNFTVNZRUd2SEVreHVySkFOK2Niajkzbm9wR1ZuQkd5MEoyc2RZ?=
 =?utf-8?B?RWRSaG5FYXJZa2VqS2FQMFZmRDdKT3JHR0R1OWtGdGhSMjJrYVRoOC9rT1JM?=
 =?utf-8?B?bmg1SjliS2ZKc3hMRm91Vlg0UUZ5S0ZxOW51Y0JuWCszSHhQWFYwUitEaXVq?=
 =?utf-8?Q?pcfVkaDIHA8upHR0LAC6yP+mS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cf05d6-405c-4974-f79f-08dc3d1c8c63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:00:00.4716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdBF8QVXLoAQl1UUOT8V1sMy2Q6aH9O+qyzjys1jt7Rn1kwCKdYpU9sGjuJehUDg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
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

Am 05.03.24 um 14:57 schrieb Sunil Khatri:
> Add ring timeout related information in the amdgpu
> devcoredump file for debugging purposes.
>
> During the gpu recovery process the registered call
> is triggered and add the debug information in data
> file created by devcoredump framework under the
> directory /sys/class/devcoredump/devcdx/
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 ++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>   2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index a59364e9b6ed..b5fd93cc5731 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -196,6 +196,13 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   coredump->reset_task_info.process_name,
>   			   coredump->reset_task_info.pid);
>   
> +	if (coredump->ring) {
> +		drm_printf(&p, "\nRing timed out details\n");
> +		drm_printf(&p, "IP Type: %d Ring Name: %s \n",
> +				coredump->ring->funcs->type,
> +				coredump->ring->name);
> +	}
> +
>   	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>   	if (coredump->adev->reset_info.num_regs) {
> @@ -220,6 +227,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>   {
>   	struct amdgpu_coredump_info *coredump;
>   	struct drm_device *dev = adev_to_drm(adev);
> +	struct amdgpu_job *job = reset_context->job;
> +	struct drm_sched_job *s_job;
>   
>   	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
>   
> @@ -241,6 +250,11 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>   		}
>   	}
>   
> +	if (job) {
> +		s_job = &job->base;
> +		coredump->ring = to_amdgpu_ring(s_job->sched);
> +	}
> +
>   	coredump->adev = adev;
>   
>   	ktime_get_ts64(&coredump->reset_time);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 19899f6b9b2b..60522963aaca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -97,6 +97,7 @@ struct amdgpu_coredump_info {
>   	struct amdgpu_task_info         reset_task_info;
>   	struct timespec64               reset_time;
>   	bool                            reset_vram_lost;
> +	struct amdgpu_ring			*ring;
>   };
>   #endif
>   

