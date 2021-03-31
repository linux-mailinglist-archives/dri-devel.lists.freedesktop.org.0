Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4C7350095
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4521A6E1B8;
	Wed, 31 Mar 2021 12:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6AD6E1B8;
 Wed, 31 Mar 2021 12:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTX4ulvcf8AbftFG2710794e1x3hsYGPKceBrbu2sHa7xNqqYYOnDpRb66g2A5fa1Tvj+6yipgxwzTAoXsobDUuhYhyyvotV+Mm8rzlYwTjxZXsUHwjgyQ2zSmPX4jVwTLodhCuUvcwAd49kLM0BhcFQC5OfFpd/Z45kKc0MA0yUfDXB8vBKVBZS1XbhDJAQEqBA0zgwhB9x/8mSYRlxvxZ5UCeorPLVM0jtEvGD+SYYYg/kwQqJJUQyeepYtF2mkCCRy2duDQJFDcYlNukzxJLcP7Lj4QXuvoRG6IWBUevsF7nWRPxNgx10bSpAXzjPml5omih+Vq9FMzjzc670zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+A58sn/VTZu6qWucRgDn3kIiNVm1ev5+wesFLXsomc=;
 b=FfJykL+IgcRScZAE0Pv2jc/sCLCkkwttsmXs7lX/1DddV2zzjEepr30XAFFY5jqof3djnXqRR7UOk06YKYPMAD29QBGKpasi9ij4o5eP+eDGlSeZEkXlveTp5ZQUKyd7JwPp1fEQm9NiRf0V1FO7vDQwQJdlnklYXmz5VMtEfzU9D9bao0ehrVlwAGe0W5YD00+OZ/ZRya448UdN1c9TMWkvqbMQXkdN4Fz+XZtdwN45Js7SvAqJWukZfzrCpwRHFnntJXj03kdxFXMlK65D8j5ZxPTtY1N7adMbSzHnRT95C7noVzZxo3DI2Z0arkmlllRuWoxeC3hN3uNVEHvoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+A58sn/VTZu6qWucRgDn3kIiNVm1ev5+wesFLXsomc=;
 b=HWdgRmAXXaLMiSupV18haddMLzAkx2yteBhl1fRcNIyVr+j61eghhV5D2ZbUlR6BLw7+m4EGqM8uKQBoiIQqiBi4ikQVWNvfkUUmXA32DKlI2c7oFyH8VoTdRnwOxR2/sfS70Puhp160gHi0YfBJexeZBC7E2vbkf3elpBqSZaU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2385.namprd12.prod.outlook.com (2603:10b6:207:4d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 31 Mar
 2021 12:44:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 12:44:44 +0000
Subject: Re: [PATCH 3/4] drm/amd/display: Add ref count control for FPU
 utilization
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Zijlstra <peterz@infradead.org>, aric.cyr@amd.com
References: <20210331122502.1031073-1-Rodrigo.Siqueira@amd.com>
 <20210331122502.1031073-4-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b7c06a38-9a15-630e-61b0-07752776d660@amd.com>
Date: Wed, 31 Mar 2021 14:44:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210331122502.1031073-4-Rodrigo.Siqueira@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:46d6:1b43:479c:c70b]
X-ClientProxiedBy: AM0PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:208:122::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:46d6:1b43:479c:c70b]
 (2a02:908:1252:fb60:46d6:1b43:479c:c70b) by
 AM0PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:208:122::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 31 Mar 2021 12:44:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 668247b6-034a-4b72-3979-08d8f442c262
X-MS-TrafficTypeDiagnostic: BL0PR12MB2385:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB23852D99DB38660E033CAE6C837C9@BL0PR12MB2385.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gn//M02p1RPggLVOA5dlcR0fjGJYnmnRih7cSlXUPwZEthoLZ4enhUA8PD+RyHBA+BtQlIUCZTzfgg9AmS1x3emTHOxyha3FfY31ITIUEh0tldY43X+CnRQJh0L11ICWlyKY0vp08zBdSf9ovYC8nHnYalCkaH/DNgq59IewwJu1ub0UyzIfyxHyCqAO1AUt/Wm+ZEHUNd9+8MvGl4+xki0uRMBQSBfLClpt95sEbjSH0/17dC9S0YV0ZnWxBUYfTHVmAqsZKL/dRhoNg4iBvEcCStgV66s2v+y6WK2BuK76DFZAMrrgPgMvdUG9/SIcpfZ539rif0KogyAox5+tDjEbT8SM8lgSD5Yn+KOml2KbDDoB3NfY1AVbmQlkPs5O3G4C0n9tTzLPDcFyzseBwhT3FRcAC0yNbgAAhFw0UjivmchwcXcV77uBz+McJPMEfwFPqhDXXO4MBYQUz08oAxrqTdMF1g72hBs75BL9UCub4dEU3WRFNLADvc8bwgnq4ke+T13iFlnhEjCeVuMpaTM0C9oAqbUcx/1u6y+yn/BQfIk07mtF7ThKwXLNmR6nqDRxir1LNQ1SEcDKlGQFW5Ir/+8yPfFMUm5KHRxuejypuE2ipvk544oyJl94MTgl+yAjxajzr/xMvmTD2p9Yeqz5kUg7Y3Ip9jNTpPQ54pHHxQsC91zDUegQZgoCTdoQWpDUnKGC2kAvdWKQmvHc4E6MBBigH0fK/FzO7ezP9R0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(31696002)(5660300002)(16526019)(31686004)(6486002)(186003)(2906002)(6636002)(4326008)(36756003)(2616005)(38100700001)(66946007)(66476007)(66556008)(6666004)(8936002)(478600001)(110136005)(86362001)(316002)(83380400001)(8676002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K0tCNzdpZkQ5Y2MrUWxOaCtuTDBOU0FWckNwdXYvejZrY29qTTZHWHJNOUVD?=
 =?utf-8?B?NkRLWURaMlBWMTQ2c0k1Y0h1U3BGNXltZ1BDdXhuTUtONkc2K2drNUNWdXMx?=
 =?utf-8?B?SmsvbjhtUTZtWUF2dEpVVDlQSTB1azNJKzZVNW9IaFQvNWZ0dDZ0VmxkKzFP?=
 =?utf-8?B?a09TZFJvWHgyaHd2TWxFZGw0dXRoZTZpb3Vydzd1ak52bTFVWUtjOGhkRVJk?=
 =?utf-8?B?QTBuOHNTa0cycGtSYVBPd240UUJibGZTeVFZNzZIR1BUOEFZbkZYdkd4YnR0?=
 =?utf-8?B?VStpOEo0YnNFZXFUR2RocmxpYVN0TkpBSk5qSW5WeGcxSmt2U1ZjcWpWVENm?=
 =?utf-8?B?U3p3bXNjRWFjUWJndk1VdmR0V0xSdGRJMWVRVmpLOVFXZzhSWWE1RkZXaFQw?=
 =?utf-8?B?Z0g1R2ZQQkFmaFNjSHg2bTRaZjdBZ3UyRUJtc2FydGF0Lzh2NzZlMVNxS1VJ?=
 =?utf-8?B?SEhZdjNNMVFVWFlCaFpvS3lVTGFvSVNQNFlNWWZMNDBDN3YrNVZXajZ4aFEv?=
 =?utf-8?B?dm55aGcwU2NuUjJXTlRHcDlNZ05uVHJtTEQwMW1HOFZNR3R2R09FbzFnVGQv?=
 =?utf-8?B?bm5EcHNLZkd0VGZsKzBQK1A0OXlQMm5OeDdrMW5qMVMzNTNpMVR2Zml5YUZk?=
 =?utf-8?B?eWlTbU1DUTZVdGlXWXdJV3c4TVRHajFpTXozVVEveFhJMVY0TGRDWEY1TW5N?=
 =?utf-8?B?Nkk0Rnk4MkNCc0M4aVFsekdINjdockVITDFsT1FadXNUaTFWUkkrdGRJa1pq?=
 =?utf-8?B?MktYd3JHOFBLTWlEcnRpbkF2akdHSmQ4OFppWW9Xc2V2dVR5U1VXdDhwTnJP?=
 =?utf-8?B?aTY2eDNTb0FGQ3p2NjlsL1VkaHZpM3oxSjhLb0o3ZldYUXJ1NmR3S2IzUXMv?=
 =?utf-8?B?Y2hka0pYV3pKRTJxZ1B6ZWZzcGVlVzRSSjBvMUkxZXJOUmJrWFBEdFBTVWhG?=
 =?utf-8?B?Qk92cElhMWprajlIM3NVRXN1STBYZEI5NitJZ0dZeTArMC9yQVpORHhJbEVD?=
 =?utf-8?B?ckJNeTh3RmI3QXNPbHRoSWRVcnc3d1JNclpIai9aZ0hLelcvR1ZKdnZ0TTFN?=
 =?utf-8?B?RHZLK0svdGJuOHcvbTJ5SGtEUE1FZnU1VjZnL2tBRnhyWkQ4Y2FXK3FZNW9x?=
 =?utf-8?B?czhTdVloa3RRalRBTHg3aTV6NXFJRVVzNlRVbGVlL05rWVM5a3dNSEVMQWk4?=
 =?utf-8?B?cTQzOVFIZVFPbHFSNFhCeDJJOEJpaHVPNnlTMFYzeTQ2aHlpVll0ZC81S0NT?=
 =?utf-8?B?M2M2V1B3bFFyc1A0VXY5ektJYndxL0JHUjZZNkQ2MkcybjBhY3RFTDA0L0pC?=
 =?utf-8?B?QVBiTS90RlFqNFJHeGJzTjBHRi9KOFduc3RWR29BM1gxWHE1VW9xb3NlSE1M?=
 =?utf-8?B?S2doL2NxN1RkNFhDQjNOQ2QxRjZtYVdZYXQ1TWpJVStjQkxLeURQOWFwdUtH?=
 =?utf-8?B?VnpxYVYrSCt2WXozSjhrU2dYbGhQWlp4Z1E3T1pkdTNoeE5RV21NbVVFbVY3?=
 =?utf-8?B?Y3hnRkFMUS9NQUY4ZWdPVXZZbisrZ05SRGpzT3hsYkFSS0JpQ0VVbVhPSVMy?=
 =?utf-8?B?cjF1RzNYc2tITVEydkUzMURWUTBhUUhxL0s5TGJuWWl1UXdOSENEMVY5eHAz?=
 =?utf-8?B?Zi9GQ01qS3ZjMzhZbndYOHQ4WGM0QkxQb2pXQmJ0eGFFMXhjc3FubHlJSTNP?=
 =?utf-8?B?ek9vZWNtVldvK0NndkROazFGZzBDczFRMW5xSHFqZko0NVlyWDlDNVk1OWY4?=
 =?utf-8?B?NVJlZjRSUGs2aURZNFRLUkd3UUtmVG04TW1ZWWR1M2VhUWlIUzZxc2tsUGhH?=
 =?utf-8?B?azZ1dFc0dTJNL1JBMFZWQlZ4Y3Uwa2p6UEhNTGJRR0xWaHRKeVptbjQ3dko1?=
 =?utf-8?Q?WMz3twNIWeP/s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668247b6-034a-4b72-3979-08d8f442c262
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:44:44.3088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jei2Gp+mftSyTGLptI/AVrfn9CpSV3w/asp+dMoRulMa/hdEeDJYDRRG8RtZ3yHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2385
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
> DC invokes DC_FPU_START/END in multiple parts of the code; this can
> create a situation where we invoke this FPU operation in a nested way.
> For avoiding this situation, this commit adds a mechanism where
> dc_fpu_begin/end manages the access to kernel_fpu_begin/end.

In general please name this "recursion" control instead of "ref count". 
Let's call the child by it's name :)

>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++++---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 34 ++++++++++++++++---
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +--
>   3 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 230bb12c405e..cd4f0d3f37fb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -638,23 +638,26 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
>   );
>   
>   TRACE_EVENT(dcn_fpu,
> -	    TP_PROTO(bool begin, const char *function, const int line),
> -	    TP_ARGS(begin, function, line),
> +	    TP_PROTO(bool begin, const char *function, const int line, const int ref_count),
> +	    TP_ARGS(begin, function, line, ref_count),
>   
>   	    TP_STRUCT__entry(
>   			     __field(bool, begin)
>   			     __field(const char *, function)
>   			     __field(int, line)
> +			     __field(int, ref_count)
>   	    ),
>   	    TP_fast_assign(
>   			   __entry->begin = begin;
>   			   __entry->function = function;
>   			   __entry->line = line;
> +			   __entry->ref_count = ref_count;
>   	    ),
> -	    TP_printk("%s()+%d: %s",
> +	    TP_printk("%s: ref_count: %d: %s()+%d:",
> +		      __entry->begin ? "begin" : "end",
> +		      __entry->ref_count,
>   		      __entry->function,
> -		      __entry->line,
> -		      __entry->begin ? "begin" : "end"
> +		      __entry->line
>   	    )
>   );
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index ff34007509de..5dcefe193523 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -28,6 +28,19 @@
>   
>   #include <asm/fpu/api.h>
>   
> +/**
> + * DOC: Overview
> + *
> + * DC core uses FPU operations in multiple parts of the code, which requires a
> + * more specialized way to manage these areas' entrance. To fulfill this
> + * requirement, we created some wrapper functions that encapsulate
> + * kernel_fpu_begin/end to better fit our need in the display component. In
> + * summary, in this file, you can find functions related to FPU operation
> + * management.
> + */
> +
> +static DEFINE_PER_CPU(atomic_t, fpu_ref);
> +
>   /**
>    * dc_fpu_begin - Enables FPU protection
>    * @function_name: A string containing the function name for debug purposes
> @@ -40,8 +53,14 @@
>    */
>   void dc_fpu_begin(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(true, function_name, line);
> -	kernel_fpu_begin();
> +	int ret;
> +	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
> +
> +	ret = atomic_inc_return(local_fpu_ref);

You need to disable preemption for this or otherwise it can be that you 
schedule to another process.

Regards,
Christian.

> +	TRACE_DCN_FPU(true, function_name, line, ret);
> +
> +	if (ret == 1)
> +		kernel_fpu_begin();
>   }
>   
>   /**
> @@ -56,6 +75,13 @@ void dc_fpu_begin(const char *function_name, const int line)
>    */
>   void dc_fpu_end(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(false, function_name, line);
> -	kernel_fpu_end();
> +
> +	int ret;
> +	atomic_t *local_fpu_ref = this_cpu_ptr(&fpu_ref);
> +
> +	ret = atomic_dec_return(local_fpu_ref);
> +	TRACE_DCN_FPU(false, function_name, line, ret);
> +
> +	if (!ret)
> +		kernel_fpu_end();
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> index d598ba697e45..c711797e5c9e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> @@ -38,5 +38,5 @@
>   #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
>   	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
>   
> -#define TRACE_DCN_FPU(begin, function, line) \
> -	trace_dcn_fpu(begin, function, line)
> +#define TRACE_DCN_FPU(begin, function, line, ref_count) \
> +	trace_dcn_fpu(begin, function, line, ref_count)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
