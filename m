Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1313D6FCE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 08:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3234E6FE8F;
	Tue, 27 Jul 2021 06:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96976FC9E;
 Tue, 27 Jul 2021 06:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afp2CCJnVRu3AvXYv6OVGWsHyMiHLXmoGyQ1p4HHsCEo15ucwfjMLWvHX/KXGEFz87FTHfoD2McfRvCSCZ+NaYOvvJB0V9nHgRB6QkpMZO2kT3qpFW8KjH/bX5fXlE49UiLCVc2Ohna/tRxjrNBJfMDNsyaGX5bEIL1RT7joNAEupFr1NefyobD/tyyoRzKbpxSFJQ4biLRCs4KItUki/wcMZfke7EUY/jAX4krNdGUFzb/996g9XAbf5bGK7EjRzZ/PMZoiPzJY0gGy4Jc9GQmqYvZFrjInvyC9VZfRiPZja/jt6ra2N/x7faaj34ER+gTjtks7ZeTALVh89c5f9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+FBjOAnMdVV0leuoJcE6nk+XtZnl3grIOJ7fjK+7ns=;
 b=lTWjr4Gt6/NXlV6QD364eXtzG/gJ8yKptd0lLHjvER1M9qVvze7Gvu8SJKI80x/Txqu1q0+JiaXs8+htC8aVLQxobIunZsAWVEgA7+b+DMx9AbunMWTmht/ofiRUqqfISVhe+4hJR7BuC6tPjQswDY+wLNBoQMV5fcDCYHAdiz2xaNUdOY85xIQ7IAut7UbnKbBEHOzgIIBH4pdT94Gv2dy/5fmWk6+SxQhc+He6UhX6PGLfJ9iA87xdr2xYZ2ZGtJbtOSOOcde6UwiTtHqSgGy027AlOdSK0SfkANLSlxxgkfe+VLfOZG/Sdd1F5BQ7y7qHgPPRW/XVbj1JaSBsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+FBjOAnMdVV0leuoJcE6nk+XtZnl3grIOJ7fjK+7ns=;
 b=L0qfCXbUcV8vsX7se61Nmh2SQjvHbWZ8lUuuyirGVxoPdHOVfZwVEVJ6fZ+SRbS4UnEiYk2yVk4q51N71zP257di/NvWTiPA6B4bpH6Rwk9CIQYmwI29Yic8skRNtX1/chnAFnxD4XRfzOg1PdBznAAvsRHkjeHy6UYGrPW0uSs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 06:57:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 06:57:57 +0000
Subject: Re: [PATCH v4 2/4] drm/amd/display: Add control mechanism for FPU
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, roman.li@amd.com
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
 <20210727005248.1827411-3-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14c9f310-73e6-83c7-9841-851356ef6761@amd.com>
Date: Tue, 27 Jul 2021 08:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210727005248.1827411-3-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2PR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:101:16::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae22:6310:9a31:9877]
 (2a02:908:1252:fb60:ae22:6310:9a31:9877) by
 PR2PR09CA0024.eurprd09.prod.outlook.com (2603:10a6:101:16::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 06:57:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 379d89cc-bd43-44f8-00b0-08d950cbdd72
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4221DB973A19D52D5DA1753B83E99@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BdL1E9xmLoZaLSPDd0yOn8sZmFpZcTtHSj2FCRrMZVWXEj4N1Fa1InOiPvp/kkN+F6AP89+w1iYL0+NIL62vI2ECcEpA/GderUytCL4D1XYiGdzJxOt9dUVfmcymTgadRHXPCs1PaWJ/diwK1dHh2W3i/DaHHRTK72rEizjsZKv4sz0KhUBMK2SieThfoT8EwwN3pLk9SYfPyaVjMu2ItApnX0TLU+UNd2uW5pb1rR7gXfr28UM2eEedfmAvlj24ghJ8A2VQ6bdNJjp4M49hl8KEL4n7euGcBCFT0UPNkh/xZAYSz0nb6l0xhOd0fQppdzs6NukPy7qMAePYWdCPiDi3ek5+wRoXf+O5abpAkYzUMw224W9ydORWAP/Kyi87V+rCyfEVZwrnKBOlWfPH1YQWjp4aXhyhpKKxXgmgLYGP2tbf/SU3twioAVg+UEOVAbE9VXoPokWNipMaGWsD9UmHaoO9Xq4SxCzjmyrEBI6K4nxlGfeceLgWsKmBZHkD5oibaSFnU2I0WonurYJlxASDuNbydJFO2fmOu9dK7uP5YNA2Z14VaajfY6VAx1kL0B8L2LkxQanZ+mWTGi11AsQnQFqr2aRheeGCfChssLMNI2eax3pJW97oc9mZ4iB5kuU79iaLR5KG6rLUfLHaIIYBi1jtW9Q/B5Q9RCgu2Z4oNMaWXd2aQLmCXBCjfP5oDA9OT4zslPJQ7g6wMW3aAJ2HmALArWiSs2ARc0Qvovvrs+VOfTZiYG82qnah6N2R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(316002)(6666004)(83380400001)(86362001)(54906003)(66556008)(8676002)(5660300002)(478600001)(66476007)(6486002)(66574015)(66946007)(36756003)(4326008)(30864003)(6636002)(38100700002)(31686004)(2616005)(2906002)(31696002)(8936002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVAwQkU3b2l2M0FURURDZkMrLy90NERTRFFSallWOCtDTTh3UFhWckJ2M0N5?=
 =?utf-8?B?K1E5SUZ2OERsQ2hIbGxEVE12bzMxMUhaaXhrUHhBYzU0a1VqVjVCODlEMGxr?=
 =?utf-8?B?emFiVWRraEVvRkFIeEhDbkU2RTR0Q21ITUpBaVdtWW5SRTZjRmdQWFpLVll5?=
 =?utf-8?B?OE1rTDhvejhETjk3VmV2V3B3K1ZKMGNOa1JHaHdKcXM3N1krZ3RXWkEza21h?=
 =?utf-8?B?ekVOTUpIQW9vb3o2eWVUZFduS3FiaytLbXJBdHFObHZ6UEpoQTFGNjg4QTRS?=
 =?utf-8?B?c3Vrb2pYOWUwWHZpYVIxZCtGVFI1a0NYZ2QrUW5uMmozT1cvY1lxZUo3RUVa?=
 =?utf-8?B?NEV5N0dWKzdKZHBFQ2V3VVcrWGl0ZEY3ZVp2UzVXNkwvTmR1RFJ3bStETlBI?=
 =?utf-8?B?YVlXdXRXdG40SkRJL3dnMXJrcGhsYjNaUEVhRmNQMHFKWjJxcGl6c0t6VFUy?=
 =?utf-8?B?bEMvWmovR3RMckpQTUFBM0pZK3pTWXNCbzJNY1Fpd25oZUlNUXJza1JqUThZ?=
 =?utf-8?B?emllM2N2UHEyczlxYWN1QXQrM2ZJU0lZdEdqeEhLWmpTT0NOcmc3dllINDJE?=
 =?utf-8?B?bi9STU9Ua3NKaDNCY28weWNQTTVMb0ZlR1BLcEZCOEZOYzVIT1NKbzlBaEU4?=
 =?utf-8?B?UVpPWitMN1FTNlc3NU1yRDNtU2pKN0kxTU1OK2M1Vis0a0VEZWh5WjdZR3Rn?=
 =?utf-8?B?ZGxSTzhuNTE2Rll1MmpjcmZnWlROMGJZcy9vMWp1YnBwVFVNQkVMOXY2ckdu?=
 =?utf-8?B?bEx4WHN6eG82NTVYaXBQOE85NHBZTVVKRHVmeFZYSmFZdkRBU0VEVEp2VHpt?=
 =?utf-8?B?NDljTnpvb1JFemJjdnpORktKVGp0ck1zMHAxQktVVFFDTXkvaWx1NTVaMEMr?=
 =?utf-8?B?MDlQeW5Yb0Z6RFpWUzRNMERWY1ovV2V2Rm9pT2dmOVAwVWJRNWFvRHNMMkJh?=
 =?utf-8?B?YlRuOGNKbGo3VHJKN2UwVG9uOUJaT2ZhSUx5UlZjWllSZnB5Vnk3K3gxMDVn?=
 =?utf-8?B?NXRmVjB5cC9JbTdUT2NScW9jRU5UdFpEZTlaYktQRGl1UDhBYnVRa21Sem9E?=
 =?utf-8?B?Vi9DSGhacGVnMW9Pa1dSVUJKYlJCQ1crbXhoMWlZVk1kYUJRam5hK3hEdHRW?=
 =?utf-8?B?NlRKM3hEMmZlT2M4eFJzMGRKVEg3eFJwZHJsdFpUd2xQVnBQbkNuemt3RjQ0?=
 =?utf-8?B?L01SdzdsekdLWllpTXBIYk1aaGw1dGtCaWJDeTl1dlM0NkxKNzFtK203MHEw?=
 =?utf-8?B?d3hRNmVOZlBZaktLSmIxZjBUNkxQZnYzRVZhMjV3OUkvd2FPYjM3KzMyZFI0?=
 =?utf-8?B?U1VlZVZXL2dGSkdxdmR5SEl4UkgxZTNpZzN4WThUU0ZyREtFYktUdXk5UFls?=
 =?utf-8?B?Z3NGY1hnL1p0bkZ3eTRNaEZrbER2M0I4NUVNZ1pHeDBGLzN5aVBiWEFDSDhI?=
 =?utf-8?B?VE85OWJYb21JY00xRmk5Q3dHUDlYMkRwakJrRkxKWkpiV1dlU1daVUEvVkY5?=
 =?utf-8?B?YVlnazJGZlRPL0l3WXY3U3Bic3NVMEhRSWw4KzVFV0tWL2hiVTQzR2FBZzdJ?=
 =?utf-8?B?RjZzZ05PSnBxUktFUkY2QUZCZ3UwQXgra1dWc25aSVl6TTdIdHpiUTgxWTgv?=
 =?utf-8?B?U0xxc3ZHNWpORDFzYzdpSlFJRm0rTXBjTUF4VVVCNlFERXNVRXB4UDhBTEc1?=
 =?utf-8?B?OFlXYXF1K1BNNEFZUEQzMWFaZW5YM0tqdWlFSUZGSkNrd2NBVVNzZ2VvclhM?=
 =?utf-8?B?UW9BQkptS25iNEppWTdsY3lQSkc2U2hGTUVKaGxadGVscTFRUmlNZXY4V1Rr?=
 =?utf-8?B?cWdGUUFORXNEZFdXWlFSTXFVeloxanE5QjBhZWlVMTdDODNJMTF1Z3FTd1JL?=
 =?utf-8?Q?9MX0qWeEfptJg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379d89cc-bd43-44f8-00b0-08d950cbdd72
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 06:57:57.5034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNAGrXuRWROLY/0Gst9DLAYZL9jIu1PmQqpbtSme6rXmg6mLBohwgi/WTQhH+XbO
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
Cc: Peter Zijlstra <peterz@infradead.org>,
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
> - Christian: Move PPC64 code to dc_fpu_begin/end.
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
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  4 +
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 96 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 +++++++
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
>   drivers/gpu/drm/amd/display/dc/os_types.h     | 35 +------
>   6 files changed, 160 insertions(+), 32 deletions(-)
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
> index 000000000000..d4ab27bf8d04
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -0,0 +1,96 @@
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
> +#if defined(CONFIG_X86)
> +#include <asm/fpu/api.h>
> +#elif defined(CONFIG_PPC64)
> +#include <asm/switch_to.h>
> +#include <asm/cputable.h>
> +#endif
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
> +
> +#if defined(CONFIG_X86)
> +	kernel_fpu_begin();
> +#elif defined(CONFIG_PPC64)
> +	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> +		preempt_disable();
> +		enable_kernel_vsx();
> +	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> +		preempt_disable();
> +		enable_kernel_altivec();
> +	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> +		preempt_disable();
> +		enable_kernel_fp();
> +	}
> +#endif
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
> +#if defined(CONFIG_X86)
> +	kernel_fpu_end();
> +#elif defined(CONFIG_PPC64)
> +	if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> +		disable_kernel_vsx();
> +		preempt_enable();
> +	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) {
> +		disable_kernel_altivec();
> +		preempt_enable();
> +	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
> +		disable_kernel_fp();
> +		preempt_enable();
> +	}
> +#endif
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
> index 126c2f3a4dd3..f50cae252de4 100644
> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> @@ -51,38 +51,9 @@
>   #define dm_error(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -#if defined(CONFIG_X86)
> -#include <asm/fpu/api.h>
> -#define DC_FP_START() kernel_fpu_begin()
> -#define DC_FP_END() kernel_fpu_end()
> -#elif defined(CONFIG_PPC64)
> -#include <asm/switch_to.h>
> -#include <asm/cputable.h>
> -#define DC_FP_START() { \
> -	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
> -		preempt_disable(); \
> -		enable_kernel_vsx(); \
> -	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
> -		preempt_disable(); \
> -		enable_kernel_altivec(); \
> -	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
> -		preempt_disable(); \
> -		enable_kernel_fp(); \
> -	} \
> -}
> -#define DC_FP_END() { \
> -	if (cpu_has_feature(CPU_FTR_VSX_COMP)) { \
> -		disable_kernel_vsx(); \
> -		preempt_enable(); \
> -	} else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP)) { \
> -		disable_kernel_altivec(); \
> -		preempt_enable(); \
> -	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) { \
> -		disable_kernel_fp(); \
> -		preempt_enable(); \
> -	} \
> -}
> -#endif
> +#include "amdgpu_dm/dc_fpu.h"
> +#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
> +#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
>   #endif
>   
>   /*

