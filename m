Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1993D6FD7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 09:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE9373074;
	Tue, 27 Jul 2021 07:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1236A73074;
 Tue, 27 Jul 2021 07:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEZarTgZn3oFjWma3RxV9jX0XE+Y7kQcunX9BPi/iqE8ZuW7Upeet6KuU779dddxML+tILAw2i1AMGV1fEuXRFfo+m3gGwEMZPalYjFHNUVNY6ITSVsu/k6lCUMD16HGyjE7gsoHrNShU2RUlu5Y12AUWecZWwb1p0whwCm5Qa4Q+hlaT0kXZdtHtUxl3s3g5MCfAE5DsVMN1cQ/UEkUn13+NnZ2QNJ7vyPNkeezlSdZZvtTdOzsXAyReNtIatjEKBMgmo5eM6h7RvBHrE5+jk8OjG5+8rngvoNEbbDN8NDsIF9eJZc/lt3xY+/DexO8ZLqev3XKVAkfNWKf0ZiMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgz+m6Hh6SJsVBGYUtAAYX3augXIXd3tPMiQ5Mc7VHA=;
 b=mwxZpvH0C+OKpWKHPg9Qt0EFKPTE5ahrJI9tjlDPU2WpUE1LKe9V8K/XM7rXxmDXs1XvM28Yyo8hDq3I+/5YoKnCBSv7uWuvQYyNbhWQUzwUGd7/cI/ALUrWDFGvw5TPlyLtacIjsf7/X6ddZ0AsqW/yPLfnpvNXJ4we1RIue0F0M5kQXqCOejYaPxUKYoJjRmCYa3We+EcAZ3FNEEzsqlmm0kfcJgtW6+fRtAxJjO08DJFWMq6j+4whwpKE3jLMfv4JjlKskixVhDpw+IGbQoeGuE5n8j+BWnFXnTgeAqMmJhaQ2fKUimGpTLqxF6/ItJ+aJZHcmLFRe0qNGIAi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgz+m6Hh6SJsVBGYUtAAYX3augXIXd3tPMiQ5Mc7VHA=;
 b=q+snA7zjd7Qs1ssusRQoRyjiGrOfsvQSsC1zOVEGmMyZ1sw536uyHfnYWhp0rCzcOIrl98pG5R/RdyJcIpqBCmKKrwTk5EoiLShiL6rCvSWJnz3xxxsOieQvXTCLTkDkojia0ihs8Lfngu4LlbhN45rQmsJ29k0Q16unPuKdPWo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 07:00:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 07:00:18 +0000
Subject: Re: [PATCH v4 3/4] drm/amd/display: Add control mechanism for FPU
 utilization
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, roman.li@amd.com
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
 <20210727005248.1827411-4-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9af7d914-4934-d8d1-403d-a2c5f113ddf5@amd.com>
Date: Tue, 27 Jul 2021 09:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210727005248.1827411-4-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae22:6310:9a31:9877]
 (2a02:908:1252:fb60:ae22:6310:9a31:9877) by
 PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 27 Jul 2021 07:00:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d6db74-fff9-48a7-ccb7-08d950cc3114
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42213596F5274BC3F3BC669D83E99@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVjqddZbGPLsNs774OePxpa33fZqFgvqa5iS7hZQfKJEMbDT1mR3EFxAbWy23hEwKNh69iwDZWHnXgkt3ayaTOi1Vd1TZoqi8TG2ux3vYro+mhTxlI9XsNAttX94XOn7gTKv3nC+ivulv4tt2dnpEEM+CUHkwyeRWj3UEot6tFnQi4WvoVlyaAZutP5i3x3SZS6B9Yo5lSzas/W7OCouLds/b2wTr+vH8P/gGKZ1eXCu4/5BpiPgHPWQRT9eZ31VGsRkqZ1XM2/IyBqI8JBi4Y/NGZr6zsFAL44RmjW7XvdxPpxrJIEuGNb8ifH7xvhMRDJHHL7OKQQDdw+J53e/jg5a1LPu6SXAvno3gWIFgdVBdJpkwkGVuAFMItkeNCvtlVQadkwlZa+ZPBhHEW4CYT26zYQt4E+l/90EHvAlelPjg8486O6qi8WT5KwRrTfJtw3O5JuyEr5EtanztFMtaj/x8rvTMrccYudehrIZ/i14I4HbdvjbSjMFyjLxr0VQvVz7WrMgvGKT6FoyzC7iNxIQ9dmToFTiSbEK4VhCSEr3EfhYrfTAk8fKwgvOgdpQaYLajBxtlPdbOB90+8Og/2w+45fTmMxu3cZJnqp0VV6yK065otj/5ymI8JI48GkR51AzvfBLzPRTpk/YWA8jF11M+LoeEh1FJ+lh2eUdcDvUf/1rWSI5RBJyJPSPTzlur0Q654sIms3ZFaQCKvCxFxWkX2fqe5wIakw8B6wg29o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(316002)(6666004)(83380400001)(86362001)(54906003)(66556008)(8676002)(5660300002)(478600001)(66476007)(6486002)(66574015)(66946007)(36756003)(4326008)(6636002)(38100700002)(31686004)(2616005)(2906002)(31696002)(8936002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K08vUW44VzZJVXk1eCt6TzJkUTI4bi9NVHhSSG04alRqeC9IMksybXZURjlJ?=
 =?utf-8?B?NDdNNEtYNEx1L3VEdGh1b3QrOElPMGFiOGYxNkFxbTBrZG9VMmJVdjJoT04v?=
 =?utf-8?B?SGdrdkZMMUQvWjVjNmpGbkJ1VnFGTjlaRXNzMm5aUnByaGEzams3QXYyZGYy?=
 =?utf-8?B?U1dIWHplWWJCQXBVbjAyL1dMV1lxK3MzZXpzbzFWVXRSMzYwM21zME5ucG9v?=
 =?utf-8?B?SFRxdEQ5eFh3Q1VhejZsNlAyMmJHY1FNS0Z6SGZocm4wTUFtU0Iwb2luWWgr?=
 =?utf-8?B?OUNRY2ZVL1VKa1hOM2pCaExTMDlhem44dFF0MnFmTWsyMzV4TEtra05TTHQv?=
 =?utf-8?B?U3IrQTlqUlduQ0k2MGNLLzAySUZIM3h1N1UxcVJOcmxwcDV0NjBWQmVWZE5q?=
 =?utf-8?B?MzVqTEY5TmpkRGpJYVA1SzNIemFoLzdaR3o4dGRTcGx1djVOOGs1SGtMbm91?=
 =?utf-8?B?Qzdid28rcW9jdTJHOFRRNkM1akgxTmoveERiYnlJMFVmSGpUR3RhTFBlcHgw?=
 =?utf-8?B?eVpwOTRFSG1kREFXbENYZTV5c1Vhc3pZQSt4TkpGcVdsbmJrZ2NOU0tBWU9C?=
 =?utf-8?B?bndtT0hFUXBLclNkRlA3N0x5bDZkakt1YXNKTFJYRkFyb3FqYmErejQvbmZa?=
 =?utf-8?B?aWdYWFoyZ214NmVDNE9IVi9sNHlHNWdyemwxbnFwbXc1cUJpc3dOTUhrMEE0?=
 =?utf-8?B?Sy9TeEswTll6SXdKN2d0M0lqcFRQVVB6MnNKY2tYbFVHdzNsVDZ4d2hUYzMz?=
 =?utf-8?B?NEg1Nm1oZzREWjByS05JbFRlcUpxaEpSaDFqNVBMTjRUYkFlUVN1RVgrSHh3?=
 =?utf-8?B?eWdycWRQdDRXZ2JPbmJBcE83ZlhWY1dRaDVzV2Zncm1ncGhMTlNOa3RHZ0pQ?=
 =?utf-8?B?WFZmbUxiL2ZDQU9GQi9TZTh2V0hzTGkrTk5RM1lRNVo2Wm5OTDRmWG0weWRW?=
 =?utf-8?B?d00zNUNlOXo5S3ppa0trc1ExanhGZ25PTjNaUC80LzZTaStMV0tMcGY1Smt3?=
 =?utf-8?B?M0J5eVNJNnAvZzBiZmdqaENkRUJxdVRKc1QxRkp1RU1SQzFXbHVNRjJ4SW9T?=
 =?utf-8?B?S0ZnLzFrNHpuc1dRb1V0ZE0wSS9MQXMzbEF1bFArYXNhb1FBRmpWSlZzZEhN?=
 =?utf-8?B?N1JCRDJwUytwbk53OUJ4Z2haenV2TjRpclh4V2dnMUQrak00cGtZL2JWa0lJ?=
 =?utf-8?B?TVc1ZE9qVEk5UEwzZjJhOGlRYTV4QWtBamR4amFsa1ZuL2htNHVjWjkwbGVW?=
 =?utf-8?B?VFh0OGwzaVVoU1pQWXAvRWlHYXhNYnpxbTNrN3RCdWg0VmYvcUFtVk5pTHVF?=
 =?utf-8?B?T294eWdTLzFoQ0JiOFlPSXFBckZiRUNEUldjVFo1VXp1czJBcENZN29ZNSt2?=
 =?utf-8?B?ZXlZSHhqRktwODFNZ0lNSC9kN1AwamZlcG4vU0UrWCtzLzFOTU16dW1lY0Q5?=
 =?utf-8?B?V3V3dldTdC84amFEZlcvUkVhcXRsUlkxRjRlbjB3RWFJVDFZOVhVVTc0eDNl?=
 =?utf-8?B?VXVyd3dDQWM0RVUwNnBrNWFzV3pGaWV1bDRxNktwV2NYcTNPZm90Z29qZTRB?=
 =?utf-8?B?VTlNNmI2Z2ZDZDZTMi82b0J6VG5yRWszVlptZm9JQUJmdlIxZmdka3lyczFz?=
 =?utf-8?B?UWlXOHM2VnBaa3M3Q3Bvem5lY1dkdGtVeW9nMTlUd0R5KzFVSFN4K2VhdHVy?=
 =?utf-8?B?ZFM1VW8wT0JWUm4rQzc5WjYvZTNxOUEvcCtGeEltNktaMGxSSUtpam42a1l0?=
 =?utf-8?B?eEN3dkVXeUpORXRtZGozTm1qZEUvZVRXVktRWVI0cnFXeUQwTm9Mc012dVJS?=
 =?utf-8?B?UDQ1OXhvaEJ0NkFRaFljMGVVYkZIeXpDRkg2c1Fqc0RDbUFtcnZ0WUNOdWQr?=
 =?utf-8?Q?lB5J4j34/iLWr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d6db74-fff9-48a7-ccb7-08d950cc3114
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 07:00:17.8172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYjtsaTh+GID20Mr2f4XN8o7VXwk8nBRL+NMTaX3l9SqukICZb7XYcKsemSvJh5s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jun Lei <jun.lei@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.21 um 02:52 schrieb Rodrigo Siqueira:
> DC invokes DC_FPU_START/END in multiple parts of the code; this can
> create a situation where we invoke this FPU operation in a nested way or
> exit too early. For avoiding this situation, this commit adds a
> mechanism where dc_fpu_begin/end manages the access to
> kernel_fpu_begin/end.
>
> Change since V3:
> - Rebase
>
> Change since V2:
> - Christian: Do not use this_cpu_* between get/put_cpu_ptr().
>
> Change since V1:
> - Use a better variable names
> - Use get_cpu_ptr and put_cpu_ptr to better balance preemption enable
> and disable
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Aric Cyr <aric.cyr@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
> Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++--
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 77 +++++++++++++------
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +-
>   3 files changed, 63 insertions(+), 31 deletions(-)
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
> index d4ab27bf8d04..33807d746e76 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -33,6 +33,19 @@
>   #include <asm/cputable.h>
>   #endif
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
> @@ -48,22 +61,30 @@
>    */
>   void dc_fpu_begin(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(true, function_name, line);
> +	int *pcpu;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	*pcpu += 1;
>   
> +	if (*pcpu == 1) {
>   #if defined(CONFIG_X86)
> -	kernel_fpu_begin();
> +		kernel_fpu_begin();
>   #elif defined(CONFIG_PPC64)
> -	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> -		preempt_disable();
> -		enable_kernel_vsx();
> -	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> -		preempt_disable();
> -		enable_kernel_altivec();
> -	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> -		preempt_disable();
> -		enable_kernel_fp();
> -	}
> +		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> +			preempt_disable();
> +			enable_kernel_vsx();
> +		} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> +			preempt_disable();
> +			enable_kernel_altivec();
> +		} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> +			preempt_disable();
> +			enable_kernel_fp();
> +		}
>   #endif
> +	}
> +
> +	TRACE_DCN_FPU(true, function_name, line, *pcpu);
> +	put_cpu_ptr(&fpu_recursion_depth);
>   }
>   
>   /**
> @@ -78,19 +99,27 @@ void dc_fpu_begin(const char *function_name, const int line)
>    */
>   void dc_fpu_end(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(false, function_name, line);
> +	int *pcpu;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	*pcpu -= 1;
> +	if (*pcpu <= 0) {
>   #if defined(CONFIG_X86)
> -	kernel_fpu_end();
> +		kernel_fpu_end();
>   #elif defined(CONFIG_PPC64)
> -	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> -		disable_kernel_vsx();
> -		preempt_enable();
> -	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> -		disable_kernel_altivec();
> -		preempt_enable();
> -	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> -		disable_kernel_fp();
> -		preempt_enable();
> -	}
> +		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> +			disable_kernel_vsx();
> +			preempt_enable();
> +		} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> +			disable_kernel_altivec();
> +			preempt_enable();
> +		} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> +			disable_kernel_fp();
> +			preempt_enable();
> +		}
>   #endif
> +	}
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

