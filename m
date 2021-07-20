Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D453CF5D1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE0A6E296;
	Tue, 20 Jul 2021 08:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E0C6E296;
 Tue, 20 Jul 2021 08:11:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfhQnC8g3wQvsNpZkCRXtlqfEPBATHqVlvPIK+vpwApXt7/yRm6CJiWZketB7TqAmxBWRVk57TlA/2ckEe3Ov+u6DsVSarZQZkGFC/VazMVwMH6e2bL0uPSoh/oZxb0kmPFUSf8mv9vhHyBj4mWQNfPEsB+K68rXjyRfe0szb6StUkN9u2I0CN80yYFtTJOZQrmL3sAiawJJO/FoGGPmaTVGN5MzKYZ/2GvZ6YFcg+Y4EXeVvJ1lvrg9kptLcMn379Xobp4AFG5ABi2eibGSM6Ijnk5B6y14aKzC8rNER6zD7BL4Ctf6kj4CZccdGMUKvKzacG/z/ePjQVO9uxGvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JLg6qiPVCAimI7mcPF3/xD6BNWVx5BQAzPArHYmUwQ=;
 b=gkJpFrTcFvZUgDzvRaO1PW+nhajIy0oTjABkDeRAunzyakKURTFIfgV/daFuu+qb7ozdavHGTn5xngGSPaJN9cx7H/OBuR4xHkzMljj9xA9CyaWTY/pu1rRE2GueSeNw/MfuB5zW1quBIru6Gk84djJLyJKDXFdIcLU+NqrKJLh1byN/SPTAywdWHlszg6kE8hqRWxOWCrfR0EWFvZGq3qWXO59zOS9FgXS0OlziwogQotLI/VP5pmXnWWJRtJANh8AN62WftP503zVj0M+7tGtmgaw7OGRc7vXzLbl92m6lL6s+GmV+CD7a74rxm2SLRlXPqruzPT2M8s9qYJ7IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JLg6qiPVCAimI7mcPF3/xD6BNWVx5BQAzPArHYmUwQ=;
 b=kJDTmMSS0Oa6Chn5KgsKClhgqnGJx2RF4QQDD9y0yG065mwgH+wkYRBfj2Dqzn+f459ihUBGPFYfCOquMEkuXS2Atzs9Yea4OPkk4YjqGmTw+LtQBrkLUO7tkVyA+n5tWq9FXfnXifOZsaFNfT9U02r4vsoEemezukPkc+FPPrg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:11:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:11:32 +0000
Subject: Re: [PATCH v3 2/4] drm/amd/display: Add FPU event trace
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, sunpeng.li@amd.com
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
 <20210720004914.3060879-3-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <88027c93-b254-875d-c640-8aeb6dbdd0ac@amd.com>
Date: Tue, 20 Jul 2021 10:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720004914.3060879-3-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Tue, 20 Jul 2021 08:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6de38bb-fa28-4fff-4c7b-08d94b55fc33
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43026EFAB3A510E16929322983E29@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yc2eO6B5InQ+rMjyVfTNVia/j94E56nN2FZQ0BTC6qei4w3SV0IEGBt49bMe6fRTaku9GKWL+yHm4zbAzYecE/GU7bzyF4ehkaH6soDPL8AmUFrjpJu28dTeLyi9Ar3p3VjWNWrlWmMebBa5LDXYw2VfI9DDQDieZIs/UqRVFGoYuiPEgceaaA7UFsWoXRg5WfzDjl3iSnmtB+GgLmb9dAFzQao7ksVmS+npVh1wIa5QmFBP/2ruPMybaCkDScnuLggyKk/Wq6GIbUJtHHjcstSdRfKybOLlAQP+nLojXO/D2UEJ7sCiStkDbj4ZrwochDXdyxn+PSMa7XlifMFm6eFQlpRnRmEXG60KisuFDe34b7i7mBb+y+V99rmdhixoLhNRK89xs9s728M91JR+5LcJ6Cr2aVj0o+TJgXgNbISt/0tV/8cRdHrfWz2FbX9iNQVsjN0mX6ixyZDSxDBj7ZUDboo47XUmR6enrEfAuvI+0wxKfEAa4Z+Vp4J74fjajlyLOI/C1qFQQy+DS/Tnm+/M0QnA+5MY2tF/vMRYebDHXKxzxKJElcOYB9y1IlawiCVO8+Sgz8a4pbzr8Z42zZznytowUYahdEUS5re0W6OpgItxQUw5lseR1YLaFzBufqxAW44WfAtuoG0nyTcC2trZZGk2Cy5Bu+xsW3lwQIBvK8z/Zv5urCOE6xhz6mqoFO3nhFZxRfXtM/f4Wjk/LQj+LINMqWm4y4HHNGU+dic3vU6lZPc6deoSKN/FVXJB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(4326008)(66574015)(6486002)(8676002)(6636002)(38100700002)(478600001)(186003)(31686004)(36756003)(6666004)(2616005)(110136005)(316002)(66476007)(66556008)(66946007)(8936002)(83380400001)(31696002)(5660300002)(2906002)(86362001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzRGbHFOVU0xT3M4bnZ3Z0UrcTZ0d3llcit2dmxQUlBaNm12Rm5TZHZsYVFW?=
 =?utf-8?B?V1pKMit5ekRTcmFOZWFveUlqbUxlZUYzNXJ4aVgwMW04cHBIdkJwTTFqNlhO?=
 =?utf-8?B?c1NXVWhZL1F3d3MxengyZ0JHLzYvYTJ2NklCM3M1WjRiMml1WCtXK0FmMTYx?=
 =?utf-8?B?R2xyUFpreWoxNGR5bXZob0liZm5acTQ0QmI1WWo2RjZpV29vUVlBMUNXK0RJ?=
 =?utf-8?B?SGpaanlHS0JkU0R3TEhDS0lNQmxQZWx2TGtIN250SEhGWnZlMDNoODYrV0dE?=
 =?utf-8?B?UVhtaHZGL0I5M1BNNnAwek9neEp3Z3BwSFQ2a1E5OXhId29Qb01sVkl4bUVu?=
 =?utf-8?B?c3ZEQ2RrUEN5dEZodFVwa3R2Q0dwenVVZlpHUk1nNjBLWlZLTTdTMGU0VURE?=
 =?utf-8?B?dDZRd1YyenZxdUVLMm9XaEp5b0NYWlV3bWxtdWxFSWpxTVljR1RjcmI1N2xh?=
 =?utf-8?B?SUpqMDdBSHh1UXl3STJsNEdGUUxRMnpLbEtkdG44TkdnU3Y3SzdnZjU2cmNP?=
 =?utf-8?B?MDF4UzY1T3hndGFoM3ZGb3JNWXJndC9RcGhhblBNVndRKy9HdDFKejVZdTdx?=
 =?utf-8?B?eXJwd1YyUHFMR09rYlNDMVJ3TVBsWTVZOWwzcVRpMUlVaW4veHk1Z0JYYWhm?=
 =?utf-8?B?aHFEazNsUkFmZEFPbkVoRVhJeU4rY2dmWnRFblZQaURlVlF5MG9qZld1SG1O?=
 =?utf-8?B?T2djVTVQaVUwek9GTXRJWU9xYjJ3QjdmOFlnRXYzWkFGWjZSeFQvaEY0V3JQ?=
 =?utf-8?B?dkZhZmRIczhaWlhTQnIxQ3hKV3JzOFR2NmZzSFVuUjBxK0FyTCtpM1lRVWp3?=
 =?utf-8?B?ZEdYS0dLRWlSL21TekFER25Jc3d0Y3B0STBOR2V2MmdsUStibm92RWVLMEtj?=
 =?utf-8?B?cmJia3BZdGRIVFlWQTlzVmYzQlUrelYrbi8rOWZjNjhJbHVmRHpYWWFCb1FT?=
 =?utf-8?B?MHc1RUlYejRFOEMvV2NXTDZXbWpvQUk2cGxnbmgxL2pkc0FxamVmd240dGVI?=
 =?utf-8?B?NDJxZjNLTEZmTFQrVDc2NGdYS0RDUCtJQ0dORWx6aUhYbnRNbitDZlNiSDZw?=
 =?utf-8?B?b05PdkptZW5YR3FtZkNzZ09WbHdaUHBPeTZJYlVnQlNXU2JEc2JBa1BwSkpQ?=
 =?utf-8?B?MXJVbmUrRVNuNzBJMm8yVlBHaDFURDViQkpUbEU1MGJmZGZkc3cyeDRqdW5U?=
 =?utf-8?B?bjFJVi9KTitkMVdkdDQvK1VIdGRZLzRQdWluWHFaRkFBRDBwTy92eENDYUlJ?=
 =?utf-8?B?U3B2OERZSFNqU0cyNEdCSThua0k3ZDRhREVZYlNiZ0VmMDZhUXJka3JrbU5p?=
 =?utf-8?B?dnZqU1ZhOG5xOEZQR05DdGMzcEdycis5UEdUMWJ6UDJEd0I3ZXRZK2t3MjlU?=
 =?utf-8?B?NzZxVGZRUUd2Vmo2bVdmSEdYNEY2VHpvcFkzWHE2Y2Fub3MxdjdtUkJ5QVFU?=
 =?utf-8?B?TmhyaWt4dXl1clhnM0pPQ2VUbnNtMTA2RmI3T0NVbFlHRlM0cVBNUno3YVU2?=
 =?utf-8?B?Rnk0VlBNV0xPR1BVOXVvR3drZlpkMzM0OWVxcm5yM0RJVm54YjVnWUdQdkdy?=
 =?utf-8?B?bTUxelNSTnlhRXFGaGxFM0REdk55MElNSEl1TTZZOHFoVVZWMUNyR21Ic0la?=
 =?utf-8?B?RnNpbnRjMWxLRTZ1NlNGRlp6eFNYWVNLamNCbzhVY0ZpbWpLRHlDbENlME56?=
 =?utf-8?B?VTRrUWd5OXd6NjJQZU5IUFNQYnlIMnd0QXdhWVN2N2pwbExwSEFZQWUwbGVG?=
 =?utf-8?B?NDc0bkNMY3dGcHpPQzJKRjl0NlFHU3RZd0pPN1JIeUEzakJUYWFnOVREVmxj?=
 =?utf-8?B?UUdGY3d0YVM4VlZhZmhSZ3BIcTBsb1lld1lmNVJLK3pQRFZUWjdmdmtOMVZo?=
 =?utf-8?Q?UySBxpLZ4G6rS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de38bb-fa28-4fff-4c7b-08d94b55fc33
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:11:32.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHvJwRZRNGlgxn6jw1vG1lWARTlVsPZA3CK88KsFqgARUryZc88yDrg54kpPn0vO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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
> We don't have any mechanism for tracing FPU operations inside the
> display core, making the debug work a little bit tricky. This commit
> introduces a trace mechanism inside our DC_FP_START/END macros for
> trying to alleviate this problem.
>
> Changes since V2:
> - Make sure that we compile FPU operation only in the context that DCN
>    is enabled.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Aric Cyr <aric.cyr@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  4 ++
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 64 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
>   drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
>   6 files changed, 128 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index 91fb72c96545..718e123a3230 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -27,6 +27,10 @@
>   
>   AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
>   
> +ifdef CONFIG_DRM_AMD_DC_DCN
> +AMDGPUDM += dc_fpu.o
> +endif
> +
>   ifneq ($(CONFIG_DRM_AMD_DC),)
>   AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
>   endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 46a33f64cf8e..230bb12c405e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -637,6 +637,27 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
>   		  __entry->refresh_rate_ns)
>   );
>   
> +TRACE_EVENT(dcn_fpu,
> +	    TP_PROTO(bool begin, const char *function, const int line),
> +	    TP_ARGS(begin, function, line),
> +
> +	    TP_STRUCT__entry(
> +			     __field(bool, begin)
> +			     __field(const char *, function)
> +			     __field(int, line)
> +	    ),
> +	    TP_fast_assign(
> +			   __entry->begin = begin;
> +			   __entry->function = function;
> +			   __entry->line = line;
> +	    ),
> +	    TP_printk("%s()+%d: %s",
> +		      __entry->function,
> +		      __entry->line,
> +		      __entry->begin ? "begin" : "end"
> +	    )
> +);
> +
>   #endif /* _AMDGPU_DM_TRACE_H_ */
>   
>   #undef TRACE_INCLUDE_PATH
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> new file mode 100644
> index 000000000000..d5d156a4517e
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include "dc_trace.h"
> +
> +#include <asm/fpu/api.h>
> +
> +/**
> + * dc_fpu_begin - Enables FPU protection
> + * @function_name: A string containing the function name for debug purposes
> + *   (usually __func__)
> + *
> + * @line: A line number where DC_FP_START was invoked for debug purpose
> + *   (usually __LINE__)
> + *
> + * This function is responsible for managing the use of kernel_fpu_begin() with
> + * the advantage of providing an event trace for debugging.
> + *
> + * Note: Do not call this function directly; always use DC_FP_START().
> + */
> +void dc_fpu_begin(const char *function_name, const int line)
> +{
> +	TRACE_DCN_FPU(true, function_name, line);
> +	kernel_fpu_begin();
> +}
> +
> +/**
> + * dc_fpu_end - Disable FPU protection
> + * @function_name: A string containing the function name for debug purposes
> + * @line: A-line number where DC_FP_END was invoked for debug purpose
> + *
> + * This function is responsible for managing the use of kernel_fpu_end() with
> + * the advantage of providing an event trace for debugging.
> + *
> + * Note: Do not call this function directly; always use DC_FP_END().
> + */
> +void dc_fpu_end(const char *function_name, const int line)
> +{
> +	TRACE_DCN_FPU(false, function_name, line);
> +	kernel_fpu_end();
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> new file mode 100644
> index 000000000000..fb54983c5c60
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __DC_FPU_H__
> +#define __DC_FPU_H__
> +
> +void dc_fpu_begin(const char *function_name, const int line);
> +void dc_fpu_end(const char *function_name, const int line);
> +
> +#endif /* __DC_FPU_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> index d2615357269b..d598ba697e45 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> @@ -37,3 +37,6 @@
>   
>   #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
>   	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
> +
> +#define TRACE_DCN_FPU(begin, function, line) \
> +	trace_dcn_fpu(begin, function, line)
> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> index 126c2f3a4dd3..2ba49aef370d 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -52,9 +52,9 @@
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>   #if defined(CONFIG_X86)
> -#include <asm/fpu/api.h>
> -#define DC_FP_START() kernel_fpu_begin()
> -#define DC_FP_END() kernel_fpu_end()
> +#include "amdgpu_dm/dc_fpu.h"
> +#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
> +#define DC_FP_END() dc_fpu_end(__func__, __LINE__)

This still has the issue that you don't correctly handle other 
architectures than x86.

I'm pretty sure the kernel bots will complain about that.

Regards,
Christian.

>   #elif defined(CONFIG_PPC64)
>   #include <asm/switch_to.h>
>   #include <asm/cputable.h>

