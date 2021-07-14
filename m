Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FD3C8551
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 15:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165C66E2C0;
	Wed, 14 Jul 2021 13:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7AE89D1D;
 Wed, 14 Jul 2021 13:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia998np3B4r49km1PWfagls8cH/ADdAybu08eYolTZt1rLwXALi+fo7OOZacCchgIjzbnkWF6eJfGA+fx3N982ewQ1T9TlSMNYNMDlr9KiQdMt/kfO2bKbRK09GdpusPbCtVL4hM/IFJm4l8cQfP1SuxLPIE+YYVoYimjuK7CR8/xBEetLlS+qUmtf8tIQ4Pfeh7xBWeWEVnYT+nzt2C67tR5CznID7Yrc7BYS7XPIgHi/9JtP04d2FEhL4qreeEDc6dE1Zx+brMnlNUu0jiDPVYT54UWjaefcqI3Z5VNXQnoFkOrXjDhx5zT5pptmJGTXEPiyzGFo2x0poV1HMY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQfwejAnvp4LZ1s04Vp6v1QD/Zedb9GT/K0bGU+UUVg=;
 b=VfFTibRKMSjORy2kUCTobqM6yMsxBT2u2BCsuBFiY7gMr3wWM1+XJ7fZCp/o3oC8Zbal3/+gGZ357Fo4iW9lx3uIm7ALUaTR6S35c6gQyo9id5fRcEJ6P34ddvFq7Ep7zSj776EtbT0O6iCx6DAr+jRVm/YoCeJuB5/rZtwp2QoITR9Fcabk1cV+8TTZsdKO39CxtEpGweFywiMAMudj2GijFp6ovfrfx28iVa2N4ccN5ddyZZLhm2SQv0wF4slRpMZjT2V6hauwbf9Dv1Lc0CeN8wPN9j74NnifKSbu1GO1VKhNx0XIOeKVFK5jxlXVU4ljOHHmHL+pHUAQVOUmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQfwejAnvp4LZ1s04Vp6v1QD/Zedb9GT/K0bGU+UUVg=;
 b=Jg0iAvLC46CYK3sTQhXVAgBtDjQi/TUHQyIVpUw80ZL9DF38g2qy3W2XmJpvy90JJeBf2cvqPWlmeKcHxDVKAR0Zxl1NdGDW2SZZEF9JfGb0DDit+X4YbPO+5DeF/25FilyaIATwVWQvne7Xfcmr2RKbtbu5dM/f+xfyeaBA4es=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 13:28:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 13:28:38 +0000
Subject: Re: [PATCH v2 3/4] drm/amd/display: Add control mechanism for FPU
 utilization
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, anson.jacob@amd.com, hersenxs.wu@amd.com,
 jerry.zuo@amd.com, sunpeng.li@amd.com, aric.cyr@amd.com
References: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
 <20210713140612.2721113-4-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ee26b06b-f1a0-5a8f-388c-13c1072ae03e@amd.com>
Date: Wed, 14 Jul 2021 15:28:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713140612.2721113-4-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Wed, 14 Jul 2021 13:28:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4b9c7c-47d1-486a-28a4-08d946cb49f7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45668EAF0F7BE05BCC5FB5A383139@MN2PR12MB4566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixPhHAxEdm9OcJtxp74g7+8kmFH8iSeXJM24xl8lGA+PgcA/NJhL1mriD9fiqtPj9R/jY5NVgxFTzz3iYcs2ThCjA1PPE4j/O4UJRvxLDucQ0VHE8hJeNNgJb87OpBWEIHpPPg3OUr9HAVw0XTDXUDiXgs0h4BIPmpAH+ByiVscQUATrGfZVjIWk78w0rT4H9U41F93Y+vY8Q+8u+9VGjt5BScE82RIXqNtTDBq4t9h5cyhwFGJiGooqN3bmQyQdxTcZZ8h76W7eogEh9PofSADY4ndxVvFm0g+7cRlcpsW7toz5hHFrSkt7tPW0ZkQ+4QUMtIJ2g+X2HgTl3sP6w5SL41gJCW6pcy316PhOp81ODRmPfrrS86I5FEMrQd3k1Hoa2+SvbmMhZW7yA28T1wFYu8dME/iplmuZJ2hSdBcbD8C87nLV+sTIMxY9iXbf76F+dXrnCH5Px+22ucgydcKzl0V+CpiATABRDIZkR53clo6amXFiOG4KFz1WNuckGWdxAJPcRFSyihciLd9XVO4Mhul86Jb2EP92/crUYdJmdA8msDAEiT6yOG911yQgVoi1cAIopvhkoIzOF3uGD8jCJXjl/kTJKfh5Nr6im/y5/CzG6RjZFpZJc4evGmgaqZUxz8tfMUHGUJg+lyICvFznEM/9nVkjGf2FIBvrNUQvEC99gEYWGdCqWdjGt6CsnbkKrpRDKK8tB93bRxe371dz/nMlaDoBUY7V4UtJpnuQz7yFUzeBqZ8ve7r1SdIM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(316002)(2906002)(6636002)(31696002)(110136005)(186003)(83380400001)(86362001)(36756003)(478600001)(66556008)(66476007)(66946007)(4326008)(5660300002)(38100700002)(31686004)(6486002)(921005)(2616005)(8676002)(6666004)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWUvWHNlc1R0ZERPSlpLMGpGZkNsaThuTTlaTTdKQjZUV05yRmFWa2NzRkQz?=
 =?utf-8?B?Q1haUnVwR1FmME5mYnhVeUZQMmxraFR6NUNWUThxZms4T0hGSkhneHpsb253?=
 =?utf-8?B?SnhkSDVFU0NEWFByQlVvMk92SG5jUlZtRmFKMGJ4dnJSZlVSV1RZdStEY1A2?=
 =?utf-8?B?S3ZONlBwM2JRdGVZTGJJTDlkajdwOCtXeHRMN2lvUUpabVNRZWY3Yy8wbnJj?=
 =?utf-8?B?czUrTmNRaU5KSmZDYzlNYXNQb251RklPOEEyNUliYkNRa3pjS3dFc21EWGo0?=
 =?utf-8?B?TEQ3QzNwRWdUTGdEUXVtN0swVUxNTVYxeU5RajBnUmZrTDgwNzhTRWJyZ1Uv?=
 =?utf-8?B?VDFvRU5qMFhoYXc1QjF6V2RGd2t5ZHd4NGd4eW1URkZKM1lyeGFGV2NsZzlk?=
 =?utf-8?B?d0xpY2ZQMUdoUjdhSHFoUlQ4L2xyTHZySktYSEpZanlLYmllYTZiM3d5Ull3?=
 =?utf-8?B?ZndYcmRhYmtuUnRJQ0tIQmQwakNocjZ3ak9aVndtQmdRd0IxMWYwRklrT3k3?=
 =?utf-8?B?dllsdGVRZ2pPQVBnUTBKZ1JLYTAzZTJCWkIvbE9ZRjc2Q3pEUU40YzNSYkFq?=
 =?utf-8?B?WlMvc0FPektzREZQOW9ZaFFqbVd6cEtxNlRVeHFPcHhuMmU4RzBDbTEybVlU?=
 =?utf-8?B?b3BWZThuWWdoWE1FQ3BrOUJGMTREZS9IKzhWQzIvM1RweHFHUEJBTW5aY2t0?=
 =?utf-8?B?MWdKbko3QjlzTktwbTVZNHBpUWdkR0E4TFVWZk41TjhITi9ZVSt4OWxjM2Qy?=
 =?utf-8?B?YnFUeFdDSWZmMW53NDNKSVJOcjR3bDhNdWQzSWN3WlRIZW1ONEk0bllqNEp3?=
 =?utf-8?B?VnRkeWtpL0oxUVVHU0RhYW1zSS8rcXBYdWczQWFhaXNpZTJnNERmVDFRSjBM?=
 =?utf-8?B?RnVnZGY4OVJ5SzhLZUg4RmNVL05VMWZiYTJQUzc2bFJrMHRVTGYyblJMbkIx?=
 =?utf-8?B?TWlINzdXdm1xNWszWi9yYTUweG9MVTNhVFJWZlhqQ1N0NFE3Nk90Ny9SR0Vm?=
 =?utf-8?B?TzdwbXBiSGEzUVlESGRIdkVjWDF1K3d1eW1OTnhncEU5ZzRKSWpwemczenRU?=
 =?utf-8?B?VHpxWXFZWEVzS0VkNXZvOE9ZcXE5L09FSitjQTN3UWhHTGQrRDIzZmxLUVRR?=
 =?utf-8?B?Rld0THBHb25qei9JVUpZb3RmajlvZ04vVXRmMlB3WklNSmJtV0p3MWUza3NK?=
 =?utf-8?B?dkYrSExLd3ZnSVVVMURIejdrZkd6bjNHMjRpVkRZSVRxREN1eVd4TkV1cFRT?=
 =?utf-8?B?dGdwNnIrNG05WkVJYmhyZGhGQW1tTlZmSWFrWDFreldCc2NGbFlZU3RYWXQ1?=
 =?utf-8?B?aFU2djhKazVuUWdHM3puL1pVRUhRNENLUU5oYUF4eS9raXlHak9XQ2JZLzdQ?=
 =?utf-8?B?NFdTTlZXQ3habEJLTUxmdk84QXVtZmNwdnMvd0lUaWJxUkhuZlNXZWZ5M0c2?=
 =?utf-8?B?cTBXM0pWWWVjVDZVQk0yTk9hRHhYaFEzOW0vcmtqdG04WVhHTFFYUTBoeG1k?=
 =?utf-8?B?cjR0WVNWeTdROFhKMXN0MEgwd1VYSi9FRWJ6TnlqeGNDT2g2ekhWVHVTNE5Y?=
 =?utf-8?B?bVpkUzBTZVFQdS9TanhWYTRrbGpqL285WCs4alNHQ3dweWc3cGU4UGl4YkMy?=
 =?utf-8?B?dTRmTUFMTlYydVZJbXBINWFFOFFvdks4Yk56RjJSbVR1TkNKTkV1M1MvcUkx?=
 =?utf-8?B?VDlRckJKdGN2NkRIdEpOdXpBUnZhZDNvQjF1ZjVkSjlHSTFBa3RvRHFENVNI?=
 =?utf-8?B?bXNSWE9UVEFtczh1Y3JFLzdiMUNpaXVMbk8vVzZaRTYzNFowdzRPQjRXYm5M?=
 =?utf-8?B?RE9WOEYwZ0x5YkVsREc4UG5SOGQ5VnViRkZyVEd6Y0ZQajBaRWxIYnp4QW1r?=
 =?utf-8?Q?0QAPKq8jjhGdq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4b9c7c-47d1-486a-28a4-08d946cb49f7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 13:28:38.4774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rr6uPbP18SLH3NSpSYjX9EVzbbGkvsxTidOWc53SbDk5JWRg3Bh5iZ4cQbZnizS+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 16:06 schrieb Rodrigo Siqueira:
> DC invokes DC_FPU_START/END in multiple parts of the code; this can
> create a situation where we invoke this FPU operation in a nested way or
> exit too early. For avoiding this situation, this commit adds a
> mechanism where dc_fpu_begin/end manages the access to
> kernel_fpu_begin/end.
>
> Change since V1:
> - Use a better variable names
> - Use get_cpu_ptr and put_cpu_ptr to better balance preemption enable
> and disable
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++++---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 36 ++++++++++++++++---
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +--
>   3 files changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 230bb12c405e..fdcaea22b456 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -638,23 +638,26 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
>   );
>   
>   TRACE_EVENT(dcn_fpu,
> -	    TP_PROTO(bool begin, const char *function, const int line),
> -	    TP_ARGS(begin, function, line),
> +	    TP_PROTO(bool begin, const char *function, const int line, const int recursion_depth),
> +	    TP_ARGS(begin, function, line, recursion_depth),
>   
>   	    TP_STRUCT__entry(
>   			     __field(bool, begin)
>   			     __field(const char *, function)
>   			     __field(int, line)
> +			     __field(int, recursion_depth)
>   	    ),
>   	    TP_fast_assign(
>   			   __entry->begin = begin;
>   			   __entry->function = function;
>   			   __entry->line = line;
> +			   __entry->recursion_depth = recursion_depth;
>   	    ),
> -	    TP_printk("%s()+%d: %s",
> +	    TP_printk("%s: recursion_depth: %d: %s()+%d:",
> +		      __entry->begin ? "begin" : "end",
> +		      __entry->recursion_depth,
>   		      __entry->function,
> -		      __entry->line,
> -		      __entry->begin ? "begin" : "end"
> +		      __entry->line
>   	    )
>   );
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index d5d156a4517e..73179e9e859a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -28,6 +28,19 @@
>   
>   #include <asm/fpu/api.h>
>   
> +/**
> + * DOC: DC FPU manipulation overview
> + *
> + * DC core uses FPU operations in multiple parts of the code, which requires a
> + * more specialized way to manage these areas' entrance. To fulfill this
> + * requirement, we created some wrapper functions that encapsulate
> + * kernel_fpu_begin/end to better fit our need in the display component. In
> + * summary, in this file, you can find functions related to FPU operation
> + * management.
> + */
> +
> +static DEFINE_PER_CPU(int, fpu_recursion_depth);
> +
>   /**
>    * dc_fpu_begin - Enables FPU protection
>    * @function_name: A string containing the function name for debug purposes
> @@ -43,8 +56,16 @@
>    */
>   void dc_fpu_begin(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(true, function_name, line);
> -	kernel_fpu_begin();
> +	int *pcpu;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	*pcpu = this_cpu_inc_return(fpu_recursion_depth);

That doesn't make sense. Please don't use this_cpu_inc_return() in 
combination with get_cpu_ptr().

Christian.

> +
> +	if (*pcpu == 1)
> +		kernel_fpu_begin();
> +
> +	TRACE_DCN_FPU(true, function_name, line, *pcpu);
> +	put_cpu_ptr(&fpu_recursion_depth);
>   }
>   
>   /**
> @@ -59,6 +80,13 @@ void dc_fpu_begin(const char *function_name, const int line)
>    */
>   void dc_fpu_end(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(false, function_name, line);
> -	kernel_fpu_end();
> +	int *pcpu;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	*pcpu = this_cpu_dec_return(fpu_recursion_depth);
> +	if (*pcpu <= 0)
> +		kernel_fpu_end();
> +
> +	TRACE_DCN_FPU(false, function_name, line, *pcpu);
> +	put_cpu_ptr(&fpu_recursion_depth);
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

