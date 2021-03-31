Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 005353500A2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672C36E1C0;
	Wed, 31 Mar 2021 12:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A476E1BB;
 Wed, 31 Mar 2021 12:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKUlSqqSDzb8Y21EVJdJHaSwNbPYy/X5FyeRjlE5fdblrkrbT+sWXwxgnmQoOJhujNtu2v/bCteKBR4DuKaO9EVkpwO18Xr2gWQdZMV3NJ1ZfGCzKv6iT7sZx0ndY6aOTLibH3VGgxlMujwF7V979dUQmVQJJaxENKcd5o9mQQxIpZNIYozdqAQa8XzpHQo9YHUnF2pNC4OTbSaH4n+6s421OV4D3nMWbSj0+HFvVNL5YH6EZvMXlor1B78EiUnc77iSBvExwa81iJcoK6Z8ymjE/TnbMpn0zNxcBqsl1OdrEjf8GW0/YC586o/De4iKrEtSG6c9QBwszOjFTxDzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxvGI2Zex2WczN85pQRsEpFjy9PUO9MOLPr7SXhOAj0=;
 b=NqENuSoJ2c/+KdPvYh9WGtq1fXXWa59Jazf4zKn3YVEwtytuCZYdChfAiXN7MhWuM5K4ACbRTpYZXjvxwHcqNMWbw84VgD0rhRJPQWSm0oa9Qga9PICMxozuwdplxTfI1S113lkBJfSoBFoDgYDdA0rPKxEbKDbl39G/75r5Ma3f1AghWbJI7FYaZIGfTYaMRjjvQRs0lmUVN1AAnaknCknuUE6FQyF5vDdZdBIwEk6YxDQy2XERim+yQMwO1YCm7tRMLYBAwK12GG/188UTI4TiUd03TRfX72F7ScTa2C61gWMl5rBjMjbscD5WS97EiwSDGWTgBrwZBQ+Fq1kApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxvGI2Zex2WczN85pQRsEpFjy9PUO9MOLPr7SXhOAj0=;
 b=Di9g+FBxXF1MtAw8gyFWN6G6+nP6Q9VDwsjEw7yxvfTpdka5YIfaabj9ImwMNHogxbZPbPqV3bRJJ2TRI+qlGlL0QblL7uXs8DkTnYb+XOv3qB/1O6gr4L63RDda3f7Pwm2/ZDvx57aV5MxKKLQRu2akBEFNEd2vfUmjI/1yqKo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 31 Mar
 2021 12:48:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:48:00 +0000
Subject: Re: [PATCH 4/4] drm/amd/display: Add DC_FP helper to check FPU state
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Zijlstra <peterz@infradead.org>, aric.cyr@amd.com
References: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
 <20210331122502.1031073-5-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f73bca63-0aab-faca-8aff-9481246c291e@amd.com>
Date: Wed, 31 Mar 2021 14:47:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210331122502.1031073-5-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:46d6:1b43:479c:c70b]
X-ClientProxiedBy: AM4PR0701CA0009.eurprd07.prod.outlook.com
 (2603:10a6:200:42::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:46d6:1b43:479c:c70b]
 (2a02:908:1252:fb60:46d6:1b43:479c:c70b) by
 AM4PR0701CA0009.eurprd07.prod.outlook.com (2603:10a6:200:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Wed, 31 Mar 2021 12:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11cd3815-7e93-4126-568f-08d8f44336c9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43359C7BC7A6B24554A03A15837C9@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sn/tQPqwJSIVBm47fC1ZgdT1j0GH8ribTssY5ni6i1pBdw3GzFkxFrvMKjxUl6f79LQSWu6PbqdKSnTYECmWVCSSYaXMHAcolBFy8wKSM9bfMElF+CkUoeVXEBBxuFXFRSBwUq7CckmLsixA3KPlR6j0BA4id8OJtc5nfdOsDGLXBXhc0ddyq5OMgVVgR6OrM027aGkI/j71S37fa0BVgNrokV4dmrlOr++cgYhuXY5RL2VyWk9t56/KTdN6kGm06RWdCqzmbU0pebCTmfAkwzS/qwvZw3+w5xQs+Sxb98SvOoFm6xpZz4BiLjKlhwX+ZkHhQZpuPdn3+aD2HIwK9gY0ebswrXXeV8AZcofksdi92ozIBRcXFX7md99XCW80+OTdcChyJ/YcnEbw1SE0M/t87DDCk0InkxD8W69xGneDxbTqfaYigd4Qyg51RVEyIXL/srI0FRk1YOsJcXfb7KQFQE1QmmNaPoBT+RbqUhGyGi+uZZkGkoPF7fxup26CKxVc8nQymW9D/GbFHr+FVBJRpnzemCgU89Gf33+UbH7WL21vYyEp9XDBkoiwxWKzZ8F5pFDrZLsFt9S6xzDuIQZJCwyH1BqKqhTvmaYAn3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(52116002)(31686004)(316002)(110136005)(6666004)(2616005)(31696002)(2906002)(478600001)(86362001)(4326008)(66476007)(66556008)(66946007)(36756003)(6486002)(16526019)(186003)(8936002)(8676002)(6636002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzZ2b2FRMjBuMG9oWUZCRDA4cFc2eGVhV3VubmtRK3lyNHkrY2JndVhkQ3k5?=
 =?utf-8?B?S1hEaG1KbWNvRi9BcmIza2xScVRyMU0vMWRFYmNrOWVPTHpCMWNlMlpadUxa?=
 =?utf-8?B?V3lCQzgrMS80bmxuZlBkNUtGRjlEUmhNT2k5Nk9UVVFLY2dCSHNXakdhbW9E?=
 =?utf-8?B?bzZNcGhLMitEU2U1SFBNTjBGdkJrTG5XNzlia1orMnFkWDdEUHBTYWR4ZnYv?=
 =?utf-8?B?ZEF6aCtJSzJvY2ZOWktSUWRUS2hQUmJveTlSMG1aNEFvS3ZndlYwcG5VSjZj?=
 =?utf-8?B?SWszVm1jVk8xM01KZUdEejI2Y25ROGRBWElCdFdDczdzeVJ0TXVpYlNoYXJE?=
 =?utf-8?B?NC9ITnZLQ2pTYW9KYS9ZRy93SHNpSHZ3dWRBSGZ0b2xOaFZZWi9tQ0x6bzEw?=
 =?utf-8?B?blByOHFKdlhhV2RjWGpSOEdkY2F2dTIzeUx0Si82WGJoQjd1dTBwSTMySTlu?=
 =?utf-8?B?S1ByYmZ1V3NSbVRDaGtvbWdGbW0xRGdZRnpmSTE4MFpsdS9UMGtiS21FNXl6?=
 =?utf-8?B?QUVCV1JoYkhCeU8wd00rRk1ZZjdQSVMvbElhRGVlOTFNTldSRHNacXp4aVJl?=
 =?utf-8?B?VEpRbHNkeWxEamhhMUF6UGdYVStzRXl0RCtxSnNWTW5lL0NPbkJlWlVmcW5U?=
 =?utf-8?B?NDl5K0pMNytwRGkyY28rdENuZll4MG8ycVRObVY5UW1UQS9DQUNOWnN5TWsx?=
 =?utf-8?B?ZGlLRExKTWRyQUszQnNkZVlsdW9GMk4walhhY1FRYmFRbnVzZmVXa3FTRkxV?=
 =?utf-8?B?cDJJZk1nVmdZYkhycUdTWjk4alJpRFlLN3Q1N2xnUHpnMGh0UVNzT0Q1SE1w?=
 =?utf-8?B?Y2kyVG1YVDdzd3FNa2hxb0xWR0JjWWlNTFhhcGJIOU82NTdYRTQ4enpwMWI0?=
 =?utf-8?B?d2F6cVo2a3JoRDY0RzN4R0FmMGVYb3VzRndVajc4SnAzenNnTWsvTGlYUFFh?=
 =?utf-8?B?QmJOU05pSEs1RmwvS0tFaWFkdXU4TUlXSmFPUFVXZi9NVUdJalBvRWVjUzUr?=
 =?utf-8?B?d3RGS2pCSUJkeFV3Z1dmWDUxWlV6dDE2MDU2ekRCWUF0M2tkejhRUnVWQ0RF?=
 =?utf-8?B?MnA0N0ZzNGx6OGNxUDlPUXdOYW1wbXMzQnY4cFcxSFZ5UkJGbkh0bFArdXRN?=
 =?utf-8?B?Si9JQ3V0NGlaNGZQZTdpMk9Jd3ROT1prbWFrVEFCNmVkcFJHdjB3VFZYUDJP?=
 =?utf-8?B?RFY1dkdwYjc2OHdBSzVVZDZNdWczS0Z2cjV5S2lIZ0FoV0N6QzNLR2ZVWklC?=
 =?utf-8?B?YzhpNTNpbHFVaHNZZ2lLSUwzWDRMNGpxMGxHSWF3NXBDL3M4bEMrcUVjSElW?=
 =?utf-8?B?KzdJVGdtTUtXV1Ryak1iTDBZZXFYRm5uVUNxTC8rUUI3eGlKN2sxc20rSmVm?=
 =?utf-8?B?dU5VRDZsVmdFWXZHczZOK0ZSSzRUOFRwSGk4RzNUN1VFdUdYMklsTXVkbXU4?=
 =?utf-8?B?WkVhSWxGSVExT3J0aDBMTTRJdi9yZW5OME5WZTJ3Q1VoL3NsMlpQS240dVFX?=
 =?utf-8?B?b2xKeTg4a3VjcGxwanVxa2xoa0Nrd3NvMUdFb1RWLytjbDNHa1FNcWU5WXZs?=
 =?utf-8?B?bXU5ZDE1S2dKS0NyTmsyK1Jabm9nUGhzYitCc09vZVBRaGlBcUlpUzdNR2Vy?=
 =?utf-8?B?S3N6bThqWGNrWHJGNzRFZkJEQ3JjRzhlblNUbkoySFcxcTQrOXNBamVza3BC?=
 =?utf-8?B?NUF1UnNPLzk5UEMxWFNYSmNPbVZQR0xqbHBySmRFZU95VzByMGEySHpqalhx?=
 =?utf-8?B?QVRPWjZESDlieFFjU1JyY0l0ZTRhbVdwOE42dk5DUkZSeDhaSVd5TzFVampj?=
 =?utf-8?B?R3d2SGMxNVVpbUU2b1M1ZG9jR1BnRTJYOVE2S3RleEIrQlYwbFpLN3Ric2x3?=
 =?utf-8?Q?IO7T5gyyuglio?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cd3815-7e93-4126-568f-08d8f44336c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:47:59.9991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttldOIpLBUakmdVsZj+b55CFSFAiW0otRg90FILfu4IkxKxFiRslAVxLEWEQxvny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.03.21 um 14:25 schrieb Rodrigo Siqueira:
> To fully isolate FPU operations in a single place, we must avoid
> situations where compilers spill FP values to registers due to FP enable
> in a specific C file. Note that even if we isolate all FPU functions in
> a single file and call its interface from other files, the compiler
> might enable the use of FPU before we call DC_FP_START. Nevertheless, it
> is the programmer's responsibility to invoke DC_FP_START/END in the
> correct place. To highlight situations where developers forgot to use
> the FP protection before calling the DC FPU interface functions, we
> introduce a helper that checks if the function is invoked under FP
> protection. If not, it will trigger a kernel warning.
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 34 ++++++++++++++++---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.c | 17 ++++++++++
>   4 files changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 5dcefe193523..0d95f680b62b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -40,6 +40,25 @@
>    */
>   
>   static DEFINE_PER_CPU(atomic_t, fpu_ref);
> +static DEFINE_PER_CPU(atomic_t, fp_dc_enabled);
> +
> +/**
> + * is_fp_dc_enabled - Check if FPU protection is enabled
> + *
> + * This function tells if the code is already under FPU protection or not. A
> + * function that works as an API for a set of FPU operations can use this
> + * function for checking if the caller invoked it after DC_FP_START(). For
> + * example, take a look at dcn2x.c file.
> + *
> + * Return:
> + * Return true if we already enabled FPU protection, otherwise return false.
> + */
> +inline bool is_fp_dc_enabled(void)

I would rather name this dc_is_fp_enabled() or even better directly make 
this dc_assert_fp_enabled().

> +{
> +	atomic_t *fp_enabled = this_cpu_ptr(&fp_dc_enabled);
> +
> +	return atomic_read(fp_enabled);

The handling with fp_enaled is overkill. Instead you can also check 
fpu_ref for > 1.

Regards,
Christian.

> +}
>   
>   /**
>    * dc_fpu_begin - Enables FPU protection
> @@ -55,12 +74,15 @@ void dc_fpu_begin(const char *function_name, const int line)
>   {
>   	int ret;
>   	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
> +	atomic_t *fp_enabled = this_cpu_ptr(&fp_dc_enabled);
>   
>   	ret = atomic_inc_return(local_fpu_ref);
>   	TRACE_DCN_FPU(true, function_name, line, ret);
>   
> -	if (ret == 1)
> +	if (ret == 1) {
>   		kernel_fpu_begin();
> +		atomic_set(fp_enabled, 1);
> +	}
>   }
>   
>   /**
> @@ -75,13 +97,15 @@ void dc_fpu_begin(const char *function_name, const int line)
>    */
>   void dc_fpu_end(const char *function_name, const int line)
>   {
> -
> -	int ret;
> +	bool ret;
>   	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
> +	atomic_t *fp_enabled = this_cpu_ptr(&fp_dc_enabled);
>   
> -	ret = atomic_dec_return(local_fpu_ref);
> +	ret = atomic_dec_and_test(local_fpu_ref);
>   	TRACE_DCN_FPU(false, function_name, line, ret);
>   
> -	if (!ret)
> +	if (ret) {
> +		atomic_set(fp_enabled, 0);
>   		kernel_fpu_end();
> +	}
>   }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> index fb54983c5c60..e782dfa640bf 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> @@ -27,6 +27,7 @@
>   #ifndef __DC_FPU_H__
>   #define __DC_FPU_H__
>   
> +bool is_fp_dc_enabled(void);
>   void dc_fpu_begin(const char *function_name, const int line);
>   void dc_fpu_end(const char *function_name, const int line);
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index b58edd012038..d0771e29c243 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -2351,7 +2351,9 @@ int dcn20_populate_dml_pipes_from_context(
>   	}
>   
>   	/* populate writeback information */
> +	DC_FP_START();
>   	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx, pipes);
> +	DC_FP_END();
>   
>   	return pipe_cnt;
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> index 32b23a182428..1c8a97d342c0 100644
> --- a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> @@ -42,6 +42,22 @@
>    *    that deals with FP register is contained within this call.
>    * 3. All function that needs to be accessed outside this file requires a
>    *    public interface that not uses any FPU reference.
> + * 4. Developers should not use DC_FP_START/END in this file, but they need to
> + *    ensure that the caller invokes it before access any function available in
> + *    this file. For this reason, public API in this file must invoke
> + *    ASSERT(is_fp_dc_enabled());
> + *
> + * Let's expand a little bit more the idea in the code pattern number for. To
> + * fully isolate FPU operations in a single place, we must avoid situations
> + * where compilers spill FP values to registers due to FP enable in a specific
> + * C file. Note that even if we isolate all FPU functions in a single file and
> + * call its interface from other files, the compiler might enable the use of
> + * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
> + * responsibility to invoke DC_FP_START/END in the correct place. To highlight
> + * situations where developers forgot to use the FP protection before calling
> + * the DC FPU interface functions, we introduce a helper that checks if the
> + * function is invoked under FP protection. If not, it will trigger a kernel
> + * warning.
>    */
>   
>   static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
> @@ -84,6 +100,7 @@ static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
>   void dcn20_populate_dml_writeback_from_context(struct dc *dc,
>   	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
>   {
> +	ASSERT(is_fp_dc_enabled());
>   	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
>   }
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
