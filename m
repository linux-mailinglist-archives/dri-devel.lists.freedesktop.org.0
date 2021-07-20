Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46D3CF5DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D91089BFC;
	Tue, 20 Jul 2021 08:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DE689BAF;
 Tue, 20 Jul 2021 08:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz+cTFL0rkt3tyIqpJtKFEmjNmHJujAesALTEJLRZswXU6ILwscIA5vnK1Z5zgrhiMWGCa7tJDJSBf8JBCxAYel0HdKQx2WjXLDDDkHJdNENA1WU2E2Q0Pb0fM8j3T0w7SyU0YhIp8jViNFpRawffc14Cr+yYXXO0MMllEYE2lJICWreH18sxuLVbFxNpZpvS5mADLMsTPBK63viHk4wk1dQfoPZYA2Y0P/YADcTplgXSGacNJsHHUoXEqRXV8+UOETtpmptduRpA0D2LipTbBc1KMGZCZSbgUdd1/iX5x2SEDmLCpFPXFSasazX86AFxzUXA+BjhDrsrpFTLC5RVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjbyyHngaLLCOHXdJuN4z2pSOvvnta3+Nj6r4/swzuA=;
 b=g+P5NBLyOiqLWVOsaXVOmgaf53xnQt+jaDMrkSc/l+dE7S9Zg8e9joFB9ap+BsaOgFz2lAFxJrqVznVssnKXGX5GGQ7wPbyFYU1i0iRNt3R/QU4UiouHtwvmJ2uyevoCGGf7xQsokJhwgD2IpjzOsfo8B59StGfxKCkeKvwrK+wsttYyFExH0+XKIZw9e3Gu0W1Bfb+W/ON9+pHQK9LCRjnn0A4NHKxdILFEm4cJW6F3EbhWSpKP4RvilPvNpgR4cCOCUOCs+f+IYF1L5RGKaoUoLc7LFlkgxlRwE6JAWtxmbut3JnQWmrbgsrmMF2ZXxXYwjOhuD9SYRKFdU/Pkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjbyyHngaLLCOHXdJuN4z2pSOvvnta3+Nj6r4/swzuA=;
 b=x8YcNHewCUWDbB0KO0scuBctghP4HIsgkVJ6RwPb5RUHRFpOFUio7XIgYF3jv5yzFhOp+OBNnkNLBypmHVXumMQt+uM8H7i2M+UX1GqBUr9RWTKaQSeQzP6Wu8JS+2KEaiuVqWCPTzrQXTZVoRCwO6jL5pYQ0B1QH5GSjIRjcts=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:13:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:13:49 +0000
Subject: Re: [PATCH v3 4/4] drm/amd/display: Add DC_FP helper to check FPU
 state
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, sunpeng.li@amd.com
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
 <20210720004914.3060879-5-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f3876ee5-7fd3-7690-aa40-348e57fa369d@amd.com>
Date: Tue, 20 Jul 2021 10:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720004914.3060879-5-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 PR3P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 08:13:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43f268bb-0962-49f2-79c6-08d94b564d9a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB400049B06C0F3743C1E2CF0B83E29@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rOyweliqYPTH6+yo0XTlhmophhhhrA2H6pISspyDLZYCVeR0WU9w8GNL9mNSLZK3WNp3jfnmEJBq0Qx27aHShFESVFynao6Z4hF4d6HFYevq0wOMLi+mSBPCVFOe8LxYvUqZI0P1UMMc1bNVgkJp3l2kSdyEwQzJbp+14ZXVCMbgmknLNS3gWckAlEigq2S0jhLHiKhpkoQatiT+/ZoVbud8KndPUT+28egBmyQrIlvnIdmIPV1f7uRKDbMb5vVJnOWHDMRMwPpX+EdrGNfIfp1Bn6ZSep3KFO75ZBkoOyfTUMiNWRdNLR0PmrqIjaTwucdVvtDm8btUfSc6QzMV0+To2X3LPfzLVFEUvYYXlwOF95UKkvQMamiCjQ1omY9dazh8RbUgqyg37ALLMnBf++XGmkyZhKs2jrJOL9o1QT2ZO+C0hrMPWtMb5vImQh05shorNdS13feogiWbicgaRJVT0cafnOsUuUjuQrYOF5Dbd8YFVLQvxSOyWfC8HY6NRIBjIDSu5ouaBxuo25tq2x+dumxSyFMy1dSCRciG5ENrca8OMg9aK6/LsjDg9RGH9LLONWdOPPJ7us7iRwTFAWhmPXIWPhG3WoEJriokRtzC+TxDqlCJg7xW02M6OGS7GdY11FKQ0FG8HVIrnyFKtIvLJsxn8Yx/0HX95fZDUWyqdb68G+Q0Oc70oYUWQwavmVrc9MFK6lR8m46kbOawJ3sYMNBw2WgRZ/M7iAJTHimbY3KPI9y9BVzehIAA8vx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6486002)(8676002)(6666004)(54906003)(508600001)(66574015)(6636002)(186003)(110136005)(66476007)(4326008)(316002)(66556008)(8936002)(38100700002)(83380400001)(5660300002)(36756003)(31696002)(2616005)(31686004)(2906002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0IxbllEYmNLUFdnTmFROU41ZktWblNaUk1ldW9IM25KNDR0TjQzUlUyQkpG?=
 =?utf-8?B?cjNTeTNvTDBndmh5TUplajgyRlQ4YzgxU1pLTmpxc3RQUi9FS1BQOG9LN1k0?=
 =?utf-8?B?cjcyeDVDMGpLMlRNd2pjOUEzdzV5bHFzNTNSZnJWUHoyUVptWWcxNlhyZjhQ?=
 =?utf-8?B?YlZBM1pwR285NUk1MENsNXF0TWZBMGNRMkR5YjRCYUlWajRoc2s3VjJuUkhq?=
 =?utf-8?B?bTJVb25qTjdGa3hOV3RMcGV5ZjkweU9ORy9hSFo5TURpM0dvL3ZCRW1qVjNI?=
 =?utf-8?B?S3VYd295RVBWOU05U21QZmpOSVVRU0NuNTNrK2VuaVV3NWhXQXdaU09wMUVv?=
 =?utf-8?B?b0pOUkdidnk2Q1gyWFRhSVVpU1h3dXhMUjdvRENBME1JeW1oTE5xNWcrY1dM?=
 =?utf-8?B?VHFZSmsxbmd0bVlIRlM3ZzJNWXZKcEFJLzhiYUVmNHJYRVZmN3pmOU1YV0tx?=
 =?utf-8?B?UmZnOWNVYzhxc3VpWGlmNWM2STNJYXdlbEpvbmVQcXRheU5hNzU3Z0l6L0JN?=
 =?utf-8?B?T3RKWmtadEF2WTZmcG1odFRnc25ydzNudGNmSlU5YVhSdSt0SXRqeHIzMVR6?=
 =?utf-8?B?K3BNMGE2bnpweXJEYU44VDBwSG9EdkNsUW13bGszVEpPTkw3cHBHOGFtR1hi?=
 =?utf-8?B?U1BLaGFxT2lkR0ZLblJaNGZndk9zT0h2YXZCcjB0ZWJLTmM5TmpWTHZ0UURp?=
 =?utf-8?B?Y09VT0huWFFTWmNHTytSQjZVbXNKNDdMdEdaZll3UVlLUTJyajFLU2lQbFpw?=
 =?utf-8?B?UmF3aGRXNUt3QnpTZ0sxay9kc1BPaTladGNFdXQwZ3NiTHRlNTYyckU1cWox?=
 =?utf-8?B?U3JiQlNkWjJ1Umd5cy9vMzI4SlZPTGR1WXVaelNlRlNyUjd2QitUOUI1RHhz?=
 =?utf-8?B?bzh4NDB5cDhFcE1oemFXaVFweVpBRGtMN2syT0pjOWdlVlEzdDFWM2tXQlhM?=
 =?utf-8?B?WmwxMVJYY2s1SDJLNWpQdzFoZkRUQ2M3L2RRN0s3T1ZaQ0pLa1JYMENYRk05?=
 =?utf-8?B?Sm5mblZYMmNtcDdlRzhlZjhBWHVSUFphdUZmR1lQS2hDK08rSUFVajFBemcw?=
 =?utf-8?B?MkwrWmc0K1REempQMFp2OTFRdmgwK2dySU1PNzk2MHRFOGZkZlRHdGFldTgv?=
 =?utf-8?B?N2lVTklrMklZL3RZZDNkUjN1T0lqWkJ5TlBJMHZwdW40Z1prdzlOZTRLL0wy?=
 =?utf-8?B?dmtnR2VvUkx2aFg2amRwSVhPR3VKT1Zaa094bHh0cHBuNllWNTdYSVE4OUR6?=
 =?utf-8?B?NW9ocjA5d0tVWDgxeGJPdEJoZS9lVUZTTXRkTnJ0Q0c4RU1SNUFTdGxpSEhj?=
 =?utf-8?B?dmRudis0SFJzcmF5SXdPQmhxdWp5T00ybmcvbG0zZWI4NjcwaCtHVE1sL1Ez?=
 =?utf-8?B?SmwvWHFYUFN3S1ZSRXFyT0RSbVh6dVBsZFEvQnRoRnFpY0tFU21tUjJ5SVVa?=
 =?utf-8?B?WEhDTUs5VDhkUytXVzMyS01NL1JLZ3lTd2JWZ0dyajBibjl3ZlBIeGxRL3Zp?=
 =?utf-8?B?LzI2Y0V4ZGZQNE94YVZ3RFl5aVpJc3F5RGJPN0ZGQ1psb0swR3UxZS9JaUZB?=
 =?utf-8?B?QmtUYUZtallVQ21WTEZ4TVVnMFFjZUNwZVZpaktxeW15akU3ZmJHdlpXaEtI?=
 =?utf-8?B?eDhXci9jSk9sZ1NCVUx1R3IzMUFOdng0bFZxckx2ZTBxMWR6NEFveTYxSU9y?=
 =?utf-8?B?cXRKaVNGb1dBcnB4MjlZWFIxbS9vK0JzWkRhQzVtN1h2b2F6Z25wUU0rK2pN?=
 =?utf-8?B?RWdUNW90dDI5aDZHK3VwTFJIWlJkNFRpcnRnTGcweERnbVpwUTkvby9ycVRj?=
 =?utf-8?B?Vkw3RklDSlQ2YjRibGlwZWtpV1QvYWdTVDU3V3d3d1FKbStvbVhTKzg3Ymo2?=
 =?utf-8?Q?gDeNpon5zj9y1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f268bb-0962-49f2-79c6-08d94b564d9a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:13:49.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4UJ6SEr4T/ug8cB8LFW8VNR6BJNeUs/wUIsUzYw5oVNwQR+lJInf8qgdA3q1aqX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, dri-devel@lists.freedesktop.org,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.21 um 02:49 schrieb Rodrigo Siqueira:
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
> Changes cince V2 (Christian):
> - Do not use this_cpu_* between get/put_cpu_ptr().
> - In the kernel documentation, better describe restrictions.
> - Make dc_assert_fp_enabled trigger the ASSERT message.
>
> Changes since V1:
> - Remove fp_enable variables
> - Rename dc_is_fp_enabled to dc_assert_fp_enabled
> - Replace wrong variable type
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Aric Cyr <aric.cyr@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 19 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.c | 18 ++++++++++++++++++
>   4 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index d0d3e8a34db5..107e1c50576e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -41,6 +41,25 @@
>   
>   static DEFINE_PER_CPU(int, fpu_recursion_depth);
>   
> +/**
> + * dc_assert_fp_enabled - Check if FPU protection is enabled
> + *
> + * This function tells if the code is already under FPU protection or not. A
> + * function that works as an API for a set of FPU operations can use this
> + * function for checking if the caller invoked it after DC_FP_START(). For
> + * example, take a look at dcn2x.c file.
> + */
> +inline void dc_assert_fp_enabled(void)
> +{
> +	int *pcpu, depth = 0;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	depth = *pcpu;
> +	put_cpu_ptr(&fpu_recursion_depth);
> +
> +	ASSERT(depth > 1);
> +}
> +
>   /**
>    * dc_fpu_begin - Enables FPU protection
>    * @function_name: A string containing the function name for debug purposes
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> index fb54983c5c60..b8275b397920 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> @@ -27,6 +27,7 @@
>   #ifndef __DC_FPU_H__
>   #define __DC_FPU_H__
>   
> +void dc_assert_fp_enabled(void);
>   void dc_fpu_begin(const char *function_name, const int line);
>   void dc_fpu_end(const char *function_name, const int line);
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index f99b09643a52..d0b34c7f99dc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -2355,7 +2355,9 @@ int dcn20_populate_dml_pipes_from_context(
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
> index 95a0b89302a9..3ea90090264c 100644
> --- a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> @@ -43,6 +43,22 @@
>    *    that deals with FP register is contained within this call.
>    * 3. All function that needs to be accessed outside this file requires a
>    *    public interface that not uses any FPU reference.
> + * 4. Developers **must not** use DC_FP_START/END in this file, but they need
> + *    to ensure that the caller invokes it before access any function available
> + *    in this file. For this reason, public functions in this file must invoke
> + *    dc_assert_fp_enabled();
> + *
> + * Let's expand a little bit more the idea in the code pattern. To fully
> + * isolate FPU operations in a single place, we must avoid situations where
> + * compilers spill FP values to registers due to FP enable in a specific C
> + * file. Note that even if we isolate all FPU functions in a single file and
> + * call its interface from other files, the compiler might enable the use of
> + * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
> + * responsibility to invoke DC_FP_START/END in the correct place. To highlight
> + * situations where developers forgot to use the FP protection before calling
> + * the DC FPU interface functions, we introduce a helper that checks if the
> + * function is invoked under FP protection. If not, it will trigger a kernel
> + * warning.
>    */
>   
>   void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> @@ -51,6 +67,8 @@ void dcn20_populate_dml_writeback_from_context(struct dc *dc,
>   {
>   	int pipe_cnt, i;
>   
> +	dc_assert_fp_enabled();
> +
>   	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
>   		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
>   

