Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B83857D3A0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 20:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65338B782;
	Thu, 21 Jul 2022 18:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B557B8B774;
 Thu, 21 Jul 2022 18:54:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8njWLUP+H/W0W2jd69BswhSrlrXwZuLBpAaNqcnBBGgftvAevlAK4tn40apSaO1Uyl7V1dTHVcbq0Gh5/0+HKJanV6k00yY7r1vnOY180BIx7VPYpDDHQEAjZ9OgcGE/fUc3EcxFVdsMOhvQbThB/i36l8iHR26mZ05/RqlZisNua42XShcKmFlJqlLJeWgKpw437C4wWZKfw8Rs+/TXe+hfWAnhBe4KVZ9hTdmoOPY2HBKeemG4nxGVbQr8o8J1saXUxnVYm6aeKm0ZxIDBLKMfrEohh37oIsGHaJVn8TNPgrEBHx0If+cgWmy+I4swv/JgfpylEAM50SoQwcTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXvV+byU2dLkYi7kJtHwZ3ZCgs6b4Ey2DHZQi41jnWc=;
 b=EjLN6ARCG+PB4DUzAIjFfZwIS9wAMe+K7H4jXZf7p4/zEkH2gZTe59ZhGh/jpa8qGxHH/pIs7ZIN2QpqGU9cR9EahwPeFqzt/EVNR7hn8FS3Fvlw871pgfDykGsZNvuFA3fiwMI2o/+L4lEWlwhv/g5oKFcNqWeUjW3ZdHbr/j+/YJhMpULOt8rvvsqP69XQiHWkovQlWJb7FC61zNs3stSBMqniAj1BnURpJTSRHpNyU5MhsgyKl+mBgyDJ4HzMQCl1Tro1mFPuAOCJGvIOH1qH8eGrmiczb1DBJx+HfpicKON9M71bAlQ4w1m49x9ZDbPHc7hdDFW300FVzHFnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXvV+byU2dLkYi7kJtHwZ3ZCgs6b4Ey2DHZQi41jnWc=;
 b=uSQU5CPRU7fAovG6dorHcx7OS4EMNg9jSzuMdHuNXhE1p/eZHwMABi0gPN2qeSP//y6/KdL6idMYtAX/f8/xIBeV2pYiM58hLVgzc1FyD/hkACIu+Bsm7WDyHgCFPMPLZiHvfnZ1JlZI0ILcWcQKAk+thBn8KRx33jxBVOLdAUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 18:54:39 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 18:54:38 +0000
Message-ID: <142b8bf0-c725-31d1-6a04-6038d8b06c83@amd.com>
Date: Thu, 21 Jul 2022 14:54:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] drm/amd/display: fix soft-fp vs hard-fp on DCN 3.1
 family for powerpc
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220720193208.1131493-1-mwen@igalia.com>
 <20220720193208.1131493-2-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720193208.1131493-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:610:20::40) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 410e23ee-604d-4d20-12f0-08da6b4a7669
X-MS-TrafficTypeDiagnostic: BL3PR12MB6476:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8bGvlaHXaN12Im2ujqLDdmErSpFg4R6CPW0ohFUxoLAao7rvqaM5J+xJuAvY1eswrwole8/p4STuwBAT3pfkdVhore76AJ3POWIOSCr1EoCgDouxaBKhtAVpvnG5uVFSnPFxuXsazae+KLVYqMztiNR0JEUqlLY81N4ytu6zzMmpQQCmcI+S0sFmssBTrejIEL3xKmA7ENKRXCdeMK4MI4L71SKzL+4FIRzmV6UrHW2sWJFiTLc1lrcNKS8X8JNsA9ZIszra3CuEGbKeZ63OrjttkZE0qkzpiiX9yk6mJvkCwZKaz2sgbXCCUYhBHrZPulJaKX7cxMMcfZolI17qDF9pokER5uPIzrNYoyAXqvXRWNZnkPFO3cDXA3VF/gB2Tkv4TLvMunPiXWJkDtXG1OalPrEQxX9IKmEC2O3QPEe7yWZwZGwc44gnVriGsKhlpRc9gLAS9+AvPtsw7VnaBIQa29KGw6mXRon/TYlUaudsi4s+ZGSXrAYXK+YBJNgiKAhu0+KUnKzdQmpuz43aUEQBwcKD0XAYq1DTLWfeGdEydCI0yz74Lct4t20tjS2Jo+Q9m7NeLwnPtoCI+LJbwVgbyD5z/bhYQL+CKghdhJ4n1stwwDkMoWE02bJWY4Q5A7hxSrJAJhHL+lQ5xqLSCfMpMiLAUmp+j7crl1Inla71AFYzSHiqjfgKqQFsEKqs0T6xth62EIrdHiU7Ab27Bk/vdb8az9h3SiZyJoIaskxhd5jfjfoiEcgjT9gx1fGVuyz4yaxuk6HzmRSZUR7nrM/JEIagKitcrgfr63RnIahQzGFjHQbrxG8Nh5buCNJCXNb2RGmwUNvUZMki0uM0/dNzHNHlZEzXqXZXt0zg/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(38100700002)(31686004)(83380400001)(6512007)(31696002)(36756003)(186003)(2616005)(26005)(86362001)(316002)(54906003)(966005)(478600001)(66946007)(66556008)(6506007)(41300700001)(5660300002)(4326008)(8936002)(8676002)(6486002)(2906002)(53546011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUdVRlY1czVMVFV3OG4wZlBHaGtUMzJkWENNRFExQ1ZiVGEwUDVSYUF2V0RT?=
 =?utf-8?B?WUxBczZCVW9sbXhScndjaUFoZERMT0J4YS95UVlETS9ra2VoZFYrak56cjdO?=
 =?utf-8?B?NkNEL1grcVpDZWRCbEhmSFM5R1hPczJWZFRHckFwMTBRK2ZXajViWU1mTGJ1?=
 =?utf-8?B?Q2tIbVVCbjRPUWtBTERCL3NndWJkenlGYWI3ajRBUTE3RlFUcVdhY3Y2N1pm?=
 =?utf-8?B?NXM0Zjc2aHE2b2NVVDZBMzcvZDVLbEJ6eHJpeTNpZWdWRWNrYWhsUWNNNGxM?=
 =?utf-8?B?TWpob2h4cUFCeUUycjlkUHpwM2UzQ0RtYURmcVZQOURqaG1hYmhNK2lwNFp2?=
 =?utf-8?B?d2F3bi8wS1B6ZkdDYnUrVUNPaVVWNy9ORzNUZ25GMnRRM01LMGlKUFpVNW1H?=
 =?utf-8?B?YUlvcXUyY3Q3ZjRTSDY5R2F2YjdiY21EdTFSS3dCVEJxVjA0N1pKODRNSkk0?=
 =?utf-8?B?dEFqaUZGU3YxMHliK2ZRcVJSUmVLUWJHM29nWkdWSW4vUjBxeGY5TVNWZlFH?=
 =?utf-8?B?MGJnK3VGRHQvcWN1Rjd0N0UwVHFQcUxIbThlclJmVzRhRlpRYlN2Zk9XRHlR?=
 =?utf-8?B?ZGZORDlUWk54UU1pU3hBMGZWZERHc2RqcUtlTEMweDExU3R4djdCVVpPbXcv?=
 =?utf-8?B?MWp6a2c0NlhFQ0dvd0NWTE5sZkdkUUFlWnJ4cHhaOHBmM2M0TjFaeHpLNnBi?=
 =?utf-8?B?R0JoeHc1UUlOSFBXa2tEdXk3NE5NekUzUmkvSGNvVzJxSXlPaTlBcys3TzVD?=
 =?utf-8?B?R0cxR054TklRd2ZGREQwYjRGNDhUUksvM2tGd2NYSTlPQ1FHRm9qRGJhUUJs?=
 =?utf-8?B?Qllkd2FLamJ5SG5USWhkajQ3bTJtTmt6blN4enlVeWRPQkVNNnJKd2hmNEUv?=
 =?utf-8?B?QlY5TW1xMTJab2ZTWUhpSzUvYkZVZVFmL1pQV25rWlI5YU5rNzVxRHZyQkgv?=
 =?utf-8?B?T0dTMEpMc2dhVEVMUWt2ZFFoWVBtaWxkaHBscE5zQk1HU3NPT2lCemlIOVh4?=
 =?utf-8?B?Kyt5OE1ENkJvYklWenRLTGw3K3JxR0JGK0FML2doRDFTaUhOUElxejF4NW5s?=
 =?utf-8?B?Vm00b294VDQrN1ZoQUQvdmlkWjlqRVp4dlJiWEVhNENzODNIYnI2RGRmZGFq?=
 =?utf-8?B?elJQSUtZWjlZcUs1OFA4MDlxdDgycEdwRTZJWEJjQnJPU3JUdXFZSCtQL2hU?=
 =?utf-8?B?UkxNZlhrNGFGZnpmVGxjdXlYRit5dmlpZW5yTDNGVDV1MFVyaEV4bmhERXVp?=
 =?utf-8?B?QmgrK091SGVSQ0hwOHNMMHBKM2YyemJMQ0tkcjZ4WVY3NExYK0N1aVZzOVo4?=
 =?utf-8?B?ZkhFQkROak9jTXp1ZFl6UlRLQWd5MHlZNEtoWEFJZW5KRXppVnVvZXorRkJT?=
 =?utf-8?B?S3EwQnlLZjJkWTErbytwZ29HN2ZWNWZrVkhoMDhLbzVTdjloanRXdHpYNW5R?=
 =?utf-8?B?eGFyQXlHMU9vZkVrRHZwclYwNUgzQ3NZRHpyUGlMODJycmIvMVd0NGt3NDMx?=
 =?utf-8?B?UXE3WTZPM3MvSUs5NEZKZ2I2cmJDSWdqT3ZqNFcyWk03eFkySVgvdDdWZUpq?=
 =?utf-8?B?eVZUclJRdGJrMHBpelM2QitSN3BHa25DaGxvRUlDVE1Kb241UEUxOUV6Ynp2?=
 =?utf-8?B?SFpNUEdLd1VnN29IS1h0KzFHL1NBUjZKazc4U0RHc3l0WUZHYWFzbUdrSjgy?=
 =?utf-8?B?L3pZdlZKQmg3RkxLc09Pend0UG5hUjZ1cXdBTVMyT3V5R1k1d0hHUzg1R2xW?=
 =?utf-8?B?YXhzZkFvdjNaMW9QUkhmZHhUSHZ4elRYKzIzL096TmdXZ2Q5SUFYb3gzUEpT?=
 =?utf-8?B?TWJNMXl4TTd1MVgzV2dEd2hlR3BUdTFyWjJVVzlNbjhVRkxUNnhvazZXaTZ5?=
 =?utf-8?B?NmYwRHp5VGNLMlF2OXd6RHFHVThSSHBNejB1YXNsTnJTWXdNRk9nK2NiYmVx?=
 =?utf-8?B?VjRseGQ4cUdSQmE4L2ZCVGxXRnZLbWNac1hheERlT3MrMS92cGE5dHdiWGQw?=
 =?utf-8?B?Y2p0N2FTQ0VWbG5kcWNra0RtZDhVZjZHa1ZyQnlCU2hMSnRrN3VRUFJraG9u?=
 =?utf-8?B?RTRYcUJNd01nNW1KNnpRdjU2QW5UK3FzUGlNeW1DNS9WbVJKU3Z2WkpuU1Vn?=
 =?utf-8?Q?SXDsUFklMZF0ha3hc/dd7aE+f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410e23ee-604d-4d20-12f0-08da6b4a7669
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 18:54:38.6727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0ZOMrwbrdLuRXmzGQPZs9C6lUmgGeppW+vWx4b1oJxgHG8Jqz+6gsbEcus+b+hKvdj5AModHBfc/x37pXVE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-20 15:32, Melissa Wen wrote:
> Move remaining FPU code to DML folder that caused compilation error for
> powerpc. This patch depends on [1] to prevent the error below:
> 
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o uses soft float
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_resource.o
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o uses soft float
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn315/dcn315_resource.o
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o uses soft float
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dcn316/dcn316_resource.o
> 
> [1] https://lore.kernel.org/amd-gfx/20220716195144.342960-1-mwen@igalia.com/
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c |  5 +++--
>   .../gpu/drm/amd/display/dc/dcn315/dcn315_resource.c   |  5 +++--
>   .../gpu/drm/amd/display/dc/dcn316/dcn316_resource.c   |  5 +++--
>   drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 11 +++++++++++
>   drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |  3 +++
>   5 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index 178d40c0d70a..929b712cbada 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -1663,11 +1663,12 @@ int dcn31_populate_dml_pipes_from_context(
>   		pipes[pipe_cnt].pipe.src.immediate_flip = true;
>   		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
>   		pipes[pipe_cnt].pipe.src.gpuvm = true;
> -		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
> -		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
>   		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
>   		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
>   		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
> +		DC_FP_START();
> +		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> +		DC_FP_END();
>   
>   		if (dc->debug.dml_hostvm_override == DML_HOSTVM_NO_OVERRIDE)
>   			pipes[pipe_cnt].pipe.src.hostvm = dc->res_pool->hubbub->riommu_active;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> index df2abd8fe2eb..1a5f5977f962 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> @@ -1658,11 +1658,12 @@ static int dcn315_populate_dml_pipes_from_context(
>   
>   		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
>   		pipes[pipe_cnt].pipe.src.gpuvm = true;
> -		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
> -		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
>   		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
>   		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
>   		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
> +		DC_FP_START();
> +		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> +		DC_FP_END();
>   
>   		if (pipes[pipe_cnt].dout.dsc_enable) {
>   			switch (timing->display_color_depth) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> index 070fe10a004e..53dea466348f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> @@ -1661,11 +1661,12 @@ static int dcn316_populate_dml_pipes_from_context(
>   
>   		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
>   		pipes[pipe_cnt].pipe.src.gpuvm = true;
> -		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
> -		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
>   		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
>   		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
>   		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
> +		DC_FP_START();
> +		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> +		DC_FP_END();
>   
>   		if (pipes[pipe_cnt].dout.dsc_enable) {
>   			switch (timing->display_color_depth) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> index facac3daeaca..e36cfa5985ea 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> @@ -435,8 +435,19 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
>   	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
>   };
>   
> +void dcn31_zero_pipe_dcc_fraction(display_e2e_pipe_params_st *pipes,
> +				  int pipe_cnt)
> +{
> +	dc_assert_fp_enabled();
> +
> +	pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
> +	pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
> +}
> +
>   void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
>   {
> +	dc_assert_fp_enabled();
> +
>   	if (dc->clk_mgr->bw_params->wm_table.entries[WM_A].valid) {
>   		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].pstate_latency_us;
>   		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_enter_plus_exit_time_us;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> index 0a10de80c1a4..4372f17b55d4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> @@ -31,6 +31,9 @@
>   #define DCN3_15_MIN_COMPBUF_SIZE_KB 128
>   #define DCN3_16_DEFAULT_DET_SIZE 192
>   
> +void dcn31_zero_pipe_dcc_fraction(display_e2e_pipe_params_st *pipes,
> +				  int pipe_cnt);
> +
>   void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
>   
>   void dcn31_calculate_wm_and_dlg_fp(

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

