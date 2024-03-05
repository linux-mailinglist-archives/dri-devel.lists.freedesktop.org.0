Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2C871FCD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF34810E212;
	Tue,  5 Mar 2024 13:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AylKaqgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A7410E212;
 Tue,  5 Mar 2024 13:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdTMwxmv6vNBY5gzdvbgjIRX47FM3vSHaV9WWaFfqEBeQ6+K8ra8yxh6+2sXN/eufMGgx0m32qOVSYY7MoxoRhKC//GEj2z9lHfDQdnd+jC672mfYBNP/Kw4Y06UPCoNd6G02TyRRHKUXBs3ypeQ3+rMNra5Vl9vB4iFqUN9kBMc/Bhull0V5tnhNAjEKefn1FT8R7yyxjYZvVCWQ5DYA+5CkavfMcAijRQSjLRGLqN4M2nYM3eXb3xg8ncgvdb4smK8XNIW6QLxWWSCIhEctUwuYAfWxDYXWb6ZnUyeaUmBJqPPwDC57OL9rHPZnjduIMDcUYhaXS2BHdLK+8Su6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkBHYJ/pxOczWgA4E6KNeVYJPVjtkkMNAiWcc7ig6tA=;
 b=Vc8fsxapq2LKrDwdtPjahrmVKdxLHnZnQKSW9oGqtDWjM5UIxPfSK7vjmP0sklhmmNw+X8+ldaNUHLiexXbFw5ldckcYcDO+v5kLJPBGVCcdFX8cwQl5wV7a9KjlsXV2qPP3xcmf0KD4dQdNWxoosMzhZ7oIboDO4Rt306RXC/6fMfx11uDg2c9En9q9nUouHITHd73bJDV2wPWAZkpAZ5dnZIgw2GCUU2B7D0chEeqtLKYvwFZV5JvIG2tCEwvTqp/CloYjL7oBI8Kg89Oo+7yjO9jD6OXNYaHW/CRGspXr/ph7dFsd234Wk48cPRVa7XQwOrC3aG90QVdihQlwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkBHYJ/pxOczWgA4E6KNeVYJPVjtkkMNAiWcc7ig6tA=;
 b=AylKaqgF5Xl5kXl1SRHxe8D59SgVGZyrbuUBCenz3KNzvu/w6X44erAyaYlClNdyjiAX+V77B60Uj+gtEqBvzY++ElbrymzIGAls3rRU3aTBiwMAbxfzBJvimUm3DfubfJ2yMlT3KVi3F77LHTW9vsKYTvcLcqM5u0lSf14beOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 13:10:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Tue, 5 Mar 2024
 13:10:37 +0000
Message-ID: <209b7e69-594d-4e40-8173-42643f94f2ba@amd.com>
Date: Tue, 5 Mar 2024 14:10:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add ring timeout information in devcoredump
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240305115843.3119708-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240305115843.3119708-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 974ac721-d103-4b1e-b428-08dc3d15a64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aw2s+oWklpirNGJ9Fcoi3qEW3dQiwyMCSyOLUfrfprEAKyAe2r+2tS/71IE2xWWazLuwZcNeMtlQu7p9ikfMe+6RQ7qW666fhlX2xGJU8MsOipBUlJNugfRUSdvb74+9W5eKyUd9WRDPNG+OFFTLRjKN5CUlBh3kA1X/kl9Nj2upYeHQcE/iMQ+MtbeDeFzQiFnFZs8Fx//4r/1ExZKot1QZePX/6Kjj7pBZmJhptHtrg2sOUWLRX0N1EDYQqr+bujh8X1CuJrV8GBR+dRQUZX6uUHUg5IZ9QrH6srIguJRRGx0bgaeaHzeJpEgbdgaepfWbRwqreAf9bLtbYA5hfiiul+TC1wsSvVovPo4XHZtZR8idQupolRMeJW/lQnSDmKrLbfTeGxuX7vPaDuAf9rGXOMs22Ni1VAd6zt8+EbIlaEtxcoiJV+ogj5sVh1LaluP6VJZOIQcCu0khAWBLfOm9t9vFiZTNk9h9CPRVjARpL7FQ4xzr3r2tv+lG2FZgq+FWGhi+1mJJfGUL4VQSDr2gU3QrycLq/l8LXlQDWKIf4vQ/wk3H0QJXYwssPYyYP6VBbjveWMws9zPcLNgs214NK7TThJy7Q/bxajFKENL9Jhw9HdjgMjtMXwZ44gRv86aUSkjiKC9Ees50iR9vdmtxjnlK1JQPQ8hqNiEo8oI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhZb3ZQRXlGUW1LamdFcmJNeVV6L1dCRjJrbWFRZjdJd3NkaE40bGNybWRQ?=
 =?utf-8?B?UHRYakVEa2o0L25rKzluU09VRDN5UjdpRzgxZUdQRWtDTlpQaXpSNnFVdkpm?=
 =?utf-8?B?ZEpFU09lS0Rwbk00Y0E2STBWUUxLN1dYZitibXJmRG1ZV3BZTHMxS0hqem03?=
 =?utf-8?B?N3JhNEpnK0g5Um1jS3BXRG5SWUh5NlJFNldveWhUbGRYNjhFQ0g0aTVmZXhp?=
 =?utf-8?B?SFU1ajBqckRzUFRrV2tjUWNuOTNScFNlbnFFelN1WnZMQUs1ODh5Z1lDaDNm?=
 =?utf-8?B?OUcxbGhYd25YV2JhU01qYUNhdVZWY0I5TWorRm4rN2VFZ2xaMUhrWVo3T0x5?=
 =?utf-8?B?Mkp0dDZvM2xWM1JaMFR6L3hnYzN1L3BOVG91Y3hsOEwrN2tUMjlSaERYNFoy?=
 =?utf-8?B?M2UrOWRhWlFveHF1MXFlNmx3aHU2bXpwdG9WZmVoUDhONVdMUjc1YXJIUHcx?=
 =?utf-8?B?eUxLNzBndFRCQithSXRzT2NhdHZhV2MyYm1NeDk1OFNaY0cyVUgyZnBZc05n?=
 =?utf-8?B?STc5dy9waDUwb1VSVW5EZCsxdEljaDNEY1NaSWxnb3BoRmJpMnFTUzliczJW?=
 =?utf-8?B?Wnl4azJ2SzI5a3dlVHlnRFRmVHBnZThNRzdGOTY2dktjNXlESFM0V0ZKVzhH?=
 =?utf-8?B?NEozc1A5cFcyNEVZSmhHSFpWNTBrTXdSS2dhSStOM2pzOU5uUHBSZlJBVW5P?=
 =?utf-8?B?b2xXV0pTdE9GOVdUUGdJSDNkZWlQYWVCUmlSZUNQWHFRSm00RElpZDVDOUVL?=
 =?utf-8?B?U3RUNGNMQ0hXMGtoM1A5eVBmZXpUZzdJa1VCMmhKczh0NlJBVE1qRzFWb3Fs?=
 =?utf-8?B?d1RUMXhNYndrQmZ4b3Zpbk9EcHBvUUxScm53Ly9UMXR0czYzSEZkY05TNi9m?=
 =?utf-8?B?T1JwUXhnSS9KRGQ0aUFMdmU0anJaWWM5UjM0WWVZZkFkMUh0WHZwN0pHME9v?=
 =?utf-8?B?Qk9ITzVzOU9Ma0VwVVJMVmM5VzJCTk9VN0lzeUF1L3haVXM4ZEwvWXNVNGpQ?=
 =?utf-8?B?dXNxeGtxaFRwUVFwL1hzL3dBcEVFejlFc0l1dUhkWE8zS01mcWQ4VHE5d0V2?=
 =?utf-8?B?STNpd1BjcU5iRFVYNE9QbnlWTlBXcWdxNlBqOVFHMCtpY3FZZVlxQUVFcURs?=
 =?utf-8?B?cWtqTHB4NVFBUkNMUS9Nak45Zk5uTEZlZ2JJMGpKb0YwNTB1OXN5UVVlZ0ow?=
 =?utf-8?B?eU9VWGlnTzU3MlFqNSt4djFpRUFld1NDenV3dDhiQldhREJvU2xxZUVJVm81?=
 =?utf-8?B?VXFNZHU1OFNkZkFUNjF5ZjdiLzE4Z0l4UTZsQkpiWDQ3SmpMdXVxQUdiYVNl?=
 =?utf-8?B?R0tZVUFZSGtsbk1wc3hqMFdialVESTNsbjVnbWc0VVVsU0txUnR4NEtHY2dm?=
 =?utf-8?B?UTBoMHZBNkt2R21KTS9LQUpEYVFETWF5VTRvNllkbEYxQS8rdGRFTEhCZXNw?=
 =?utf-8?B?cjU0QUZ6Q0xDMWNVK0JEQTFoRmcxR3dpY2o5cWM3OW1ZdzdOcm4vYjBwOTFF?=
 =?utf-8?B?VWFDNks5TWNxbXlzbjNuRHdyVDdiNUVWVlQ3NVIrbjJLQmlmNEg4QTM4RnFr?=
 =?utf-8?B?QjFZLzdHOENidExEWGNzQVBkVnNtVXowM0ZYOVdXWDRQellJRFFlU0VuQktt?=
 =?utf-8?B?MnhqUFpCb01LelQ5LzFLSVFkVlUwUGhQSXhpdjVGUUErdzcwMzhJVUNPL2FS?=
 =?utf-8?B?WDgzRlBPNjhqd21qMFY0eFY2RHlrWDJNVlRsaXpJTkNweHBUcFh1MEk1L2tW?=
 =?utf-8?B?cEJmQTczcytqek1VWTQyWE1hL3A3anhPd0xCM3ZXY29TNEJ0RUxSR2JvbWxZ?=
 =?utf-8?B?dFNCemwrUklUMDFuYWhsWHpmVTdMT05STVZaNmszS1BLU1RWWlJTS1dJN2VU?=
 =?utf-8?B?TlNWVytmMzUvbHdIZmxkSFJxSWo3eCtac0JEUzhQN1RkWlVKM09HOHFQeDVB?=
 =?utf-8?B?Z0RZMW5Cd01jbGhEdFVOcUdrUTExN3ltaXhOcVhXb2VxUVVTT3NGVndoM01o?=
 =?utf-8?B?REZ1OGRWYVZyMml0VnJIc1BrRDZwWGc4M1gycjNYOHo2R1ZnK0ZKTFNDQjlS?=
 =?utf-8?B?RGxmOW9mUTNvQ3ZzOEZtMm9tUllkdHVNa3hkQmlzRDQzR1NFeUpmZ3FzaHhy?=
 =?utf-8?Q?MueY23IGKAKJqIguIgBfptduc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974ac721-d103-4b1e-b428-08dc3d15a64c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 13:10:37.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xej7xob2IuB1b41OWiZs4N9BUpv1ctFnO2JMmVKqSa6dxAA7ZDuz+b4grqfQOsIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
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

Am 05.03.24 um 12:58 schrieb Sunil Khatri:
> Add ring timeout related information in the amdgpu
> devcoredump file for debugging purposes.
>
> During the gpu recovery process the registered call
> is triggered and add the debug information in data
> file created by devcoredump framework under the
> directory /sys/class/devcoredump/devcdx/
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 +++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  2 ++
>   2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index a59364e9b6ed..aa7fed59a0d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -196,6 +196,13 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   coredump->reset_task_info.process_name,
>   			   coredump->reset_task_info.pid);
>   
> +	if (coredump->ring_timeout) {
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
> @@ -228,6 +237,12 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>   		return;
>   	}
>   
> +	if (job) {
> +		s_job = &job->base;
> +		coredump->ring = to_amdgpu_ring(s_job->sched);
> +		coredump->ring_timeout = TRUE;
> +	}
> +
>   	coredump->reset_vram_lost = vram_lost;
>   
>   	if (reset_context->job && reset_context->job->vm) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 19899f6b9b2b..6d67001a1057 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -97,6 +97,8 @@ struct amdgpu_coredump_info {
>   	struct amdgpu_task_info         reset_task_info;
>   	struct timespec64               reset_time;
>   	bool                            reset_vram_lost;
> +	struct amdgpu_ring          *ring;
> +	bool                            ring_timeout;

I think you can drop ring_timeout, just having ring as optional 
information should be enough.

Apart from that looks pretty good I think.

Regards,
Christian.

>   };
>   #endif
>   

