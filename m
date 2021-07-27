Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5762F3D6FDB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 09:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C077320A;
	Tue, 27 Jul 2021 07:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02F73292;
 Tue, 27 Jul 2021 07:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCYucfdR8hIMxmMe+N0BjglNNqt635ihIBKH4aYHLYLG3OlAcVSp8H20Ieenv9hw6nm9ympuuLHIP6oQmLNnJgaYP+EKAi0hgJBo6C7MGJFpo20iAvLn5w7IdHpiJVvWSU+OHe/Z2rTsFg4uApgZilBmoGH3QQLdcNIe5yqwnddIFTUbFMJ9MvQGGxEDqVhtYzgNbNmwj8QNYka+Fn1B+MuuKBXiWu8xHRqNoR+Qk3DAg4eC+FUi33nTuA2JR3i7gBUrOsC03XuTNQm1L3U9L2mMhHgjC3iZ0fNPZA9VC9w4YOIDAlCVBq0nhwXygblewvF2B3dgJ681Uwu3sANkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4FEo0fdhUnvT9ZRJENPIFsln9khwh64xqXcXadXILw=;
 b=dBajwDmg+RHXQcoT9YFuXiY3MBvAV/1iVNVL9tQCAIzGVUQMlRdvD+NZ0jEiyN4ecf0MtO5XNFfqNq3Rdk1P/n6fNDq4c7oUnL2ih42oh9332NZTJOg8wAAlZh3cOrWlo9V+fv97bYKw516u66u1E6+CgkqgOA2mvLi9bCqqLsJrb2ldCFp96Eomt20Pyf/R1d2BpiwxXzT6KBsdvwMb0Hf+S6w2Smkaia6Av3H5LAputHu0mij0CNyrRDCkYOtpbiQcF3h+cC1xmVfk3LkDAJE9oXbNXzAgO/3hPK/VvHi4W7fK7rXScvTwJQ9YE5Tm2FGFpfFz4OT3CyClfTpixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4FEo0fdhUnvT9ZRJENPIFsln9khwh64xqXcXadXILw=;
 b=xuIB1t7/vtOgOv9YGACgXGbxMKoAgF+PSusQymJJjoQMXuCstgGgsUgzvCUNbblMHWQzMUlrKKrWvDwwD8IkJrBwrq1mu0fyCnBqFd/2/yx0yXRjNbW3fXUFwMtvqg2qXo6KqeL23yVtS74tMTxENUF93wv9iMQApJL0MCT0ZoY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 07:02:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 07:02:03 +0000
Subject: Re: [PATCH v4 4/4] drm/amd/display: Add DC_FP helper to check FPU
 state
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sunpeng.li@amd.com, roman.li@amd.com
References: <20210727005248.1827411-1-Rodrigo.Siqueira@amd.com>
 <20210727005248.1827411-5-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e9ee0520-45a5-e30c-69e5-dd7cabb0ed86@amd.com>
Date: Tue, 27 Jul 2021 09:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210727005248.1827411-5-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae22:6310:9a31:9877]
 (2a02:908:1252:fb60:ae22:6310:9a31:9877) by
 PR2P264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 07:01:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afaa6d4f-f190-4ab8-7a12-08d950cc6fd0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB383775A32BFC8F1019847D2983E99@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BEnWsSrtlnXS77aQqc/ETG+GslQOKtVS57WscvjtyKR9A9ogs+iaNJePwp27OGSwwOniAiWIpwVzo6yzUeENs/gMqTjNueMbiLnG+voq4N5jEC6/20JHDVWlfDGHmGkhfIWxasnxnmPGDfwpSE39GB/oPAj++bY0VyVcvZP/ZSTDnwp1SSbLMahjrZ3wQ4RwCY64RGk+JJYKamTiRt9fFd5qu/pyE1xAdJ0i5qwqwADTy7Xi0JOzYiF5Rqk17IGfF7mUIA06oH3gOeCfrt5kMYqfQ4oV5c9tN9fswsyWAXl75y7NFP8gN3h4B3/85GUFR0jm5zPgGAPhnB+cp6iWFThh0dAZIMs771EZ9tWQ51RiAVn4rlxAh6bles/OrQwwthQnFqUFQPEYO6GhwBRORX71d2Pb9Qp3k5VqmDYJtbvbVqoVEBUbZzsC9t0PsRiRZYkNwFonj91uXrCkoLJA0qWWNfvrR4XlfjulDUK+FAhqU5udF1yjC8Fu46mGWoSmYhBYNfotRc7JR7Kh5rdSJ4d1iwuc+HltQwEybHkbrzyxTyp1pFexTTI/yeFOyKiXIplTZWhaIMKIBZJqNGy29W8RYEOSo6ay4gD2vrkWSBnMwzHZgfBGDe2cb8oqYXzduldYUIrQ3nw5LV2Ygu8BH4c6TxaFTuHbbK+27UjBd5M3mg3mNOhUwTv7OmcGDkUYHFran3+o6xEuG1xIvIrfeYR6zmwYKiLsJ9FK6dDZgtRur0EShzNK0Par7pEaRFMi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(86362001)(478600001)(2906002)(2616005)(6666004)(8936002)(6636002)(186003)(31686004)(8676002)(54906003)(316002)(66556008)(66946007)(66476007)(66574015)(6486002)(31696002)(4326008)(5660300002)(83380400001)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTdUM2dhSms3bXNZNjNKbEhZOEdDNXZNbThyV0JKUElUc3A2amlQWUNqbFR3?=
 =?utf-8?B?cmNZbXgwK29UdldFTUdPV1VRejFMQXgxcFlRNEExcWNHNGZySXQ2cHhrc3Yw?=
 =?utf-8?B?SUxsM2pEbzA1Z3gya05NVEtzU3FIanV6RE1MbnVYQWYxVVZQVUgrejBJb3Rs?=
 =?utf-8?B?SmVwaE1ITVprUFdxSklBZk9Qd3VHZFNDemlaWFdJbmlWbDNIaVJUS2pvNWRu?=
 =?utf-8?B?eGtuWUtoN0dLRXg4eG1BRlM5RnhlMm5oeXhVbkhJZDFmaVZZOUw4UklJRWdH?=
 =?utf-8?B?bHRnWFZNNU80N3pjb1BjOTlZc05VWm5sMEdhZmo3N3U1WmZnb045emI0YVpj?=
 =?utf-8?B?NTIvdE05WUxxZ1QyMzF5QWF2aS9DeGpob2xURk1rVlNFZnJuMWhiQ3VuNUx3?=
 =?utf-8?B?MDQ1R2QzTDBRSjdESm82SWhCT3V3YXlINjZSekV5VEpzaUQ2V3Z6N0xWcXhK?=
 =?utf-8?B?MVhMUktUR1lKVjV4ck5TR09BWWxRbjBlL0JtUkxTRTZaM0FseU43enJuWmF0?=
 =?utf-8?B?dWtsNDF4TVRPWUtJRU5lejV1MzNyM0V6eFpjamNUbHVFNFhyR3NtYkNmSTNo?=
 =?utf-8?B?N0g1aUpnWnpXOGJvalczU3FDYyttV1Bwb0xvOTF5R21kd2RyNGZvQUd3enNZ?=
 =?utf-8?B?MWd5b0JzMGpCWW1seDJQZmhrK0lCTG5jMENyVFZtR3lHSzU4T1BzU0VhWTg3?=
 =?utf-8?B?dkpWS1NEUUVkZFNTNUpuZEZvVGthUXFtTUFzUGNESzN2anlUSG8rZ3NSdWVs?=
 =?utf-8?B?L0FKM3lEMm51VStTbnNXck9FL3N4WWZNdXJ5TWxPckFMNnJMR0llWW1XN3ZI?=
 =?utf-8?B?bkJrS2huWHZjbmhVcmc2RCtkWithSXJia1pqMWhQWW1ham0rUlp1R2dobXdT?=
 =?utf-8?B?bFlNc25abzd0ZVJEK3FKTUh3NVZiZnVFZlZUVWhqR29nN3J5L3VPZ25OdTBk?=
 =?utf-8?B?ODNzeTB3WGdDSnRvQzcvdlRqaGZTclIycU9yVC9leEhvZWYwVmNLQjIwQlND?=
 =?utf-8?B?V1N6b2lIVjV2cmFWMzFGTndOeGR5UUY4RTd4MWYzTzZxMVAwc1B5aFphY2xI?=
 =?utf-8?B?alJSOWtidHZuVGdrem5sdlE1VzE5Y3ZHcnZGVVJTUGtCUzdoNTVIOHF2LzVn?=
 =?utf-8?B?WjZIcHlpazJwZ3JGS00zbDkyV0Z5UXE2ZnZ2aGVhVkRGUytwVHM4OTZzUEdk?=
 =?utf-8?B?c0h2MWptRkJ3d2NHeHJYbnc0eWhyK2ExQ29FamVlcCtQY3RWTFlZYU8yS3dh?=
 =?utf-8?B?eGI5Zk91akV1UWhPVGRYTldBOUdYaGE3WGgvd21MVEZvNUp4bUVXUzlHM1lL?=
 =?utf-8?B?QUFEL1JDSTlFTFNOeVduMWVtajhjeVVuV2tlTG1mOUNSWlIwNTRnMFdkMlVR?=
 =?utf-8?B?NTRDc1pUejdFQWVDZDVGNVJ5WjFGUzdNVUlUNXJwZmdqRm1VWHplS3BENUtJ?=
 =?utf-8?B?YlVNNEs5S1NvM0JndS9nTHgrZ2w0RDhPYW9ycVdCY2F0cDlCdnZ5Wkt6aGN2?=
 =?utf-8?B?MFczTXJCWmJsTkQwNkZWU0hUazU2SjVXSDFRRGZ2dEhaNGhxVUdwYitxSUwv?=
 =?utf-8?B?Yjh6VzV3eWlnT2ZGaWF5dUpFNWhEeVkvVGVpQ296WnpuczFwbXlWZ24rekx5?=
 =?utf-8?B?N2dxR1lSU0FFK0NlcWdjYjQrRzhtTlNhNmtUNUpSSGV1bU5XYW5SK1Z2MnJj?=
 =?utf-8?B?dEg0d0ZtTDN3cTk5QVNkL3hJZzN3L3NndVl3TENnZTljR2FkTTlFcndKcURQ?=
 =?utf-8?B?TmcvOGlTR1poVUFYM0JKMFd3MXpKYkV3ODBLYjZhck1zSDNRWnoySUhGYnJx?=
 =?utf-8?B?Sk1ZSXM5b2MyeXdia3dFUXdGNFo5RWdhVVpueDJwbnd5NkowMjQ3d1BnM2Zo?=
 =?utf-8?Q?iQPQQGECqjESx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afaa6d4f-f190-4ab8-7a12-08d950cc6fd0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 07:02:03.0479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSuGIZbX252S0yCnJwH85uUtNsUt7L/qwHFCnxSe2hi0XkcLKc57sz1SakxoKAOD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
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
> Changes cince V3:
> - Rebase
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
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Dmytro Laktyushkin <dmytro.laktyushkin@amd.com>
> Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 19 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
>   .../gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c  | 18 ++++++++++++++++++
>   4 files changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 33807d746e76..c9f47d167472 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -46,6 +46,25 @@
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
> index 988d7c02199c..e3e01b17c164 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -2357,7 +2357,9 @@ int dcn20_populate_dml_pipes_from_context(
>   	}
>   
>   	/* populate writeback information */
> +	DC_FP_START();
>   	dc->res_pool->funcs->populate_dml_writeback_from_context(dc, res_ctx, pipes);
> +	DC_FP_END();
>   
>   	return pipe_cnt;
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
> index 8f0f6220327d..c58522436291 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn2x/dcn2x.c
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

