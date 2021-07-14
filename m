Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E33C8558
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 15:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6DD6E2D8;
	Wed, 14 Jul 2021 13:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42106E2C8;
 Wed, 14 Jul 2021 13:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Va050JMZSMnxR8SahEYLq7ME/0vnvqFEsWFne9nEihMYg2ZcwraaPLG6AOxe/97aQVxsdJr4mxu1rvJ0f202rhN5m/vfh/snfsZTNYWt0GUBbPXWBwnfBz8GbpXO+s+Tu4jyrGNx3UCRPYSwHixfW0b1WFzJrADouS/eid2C5u4Tejtjstwm9U6bSPAobmNItJVz1EQu2c41JcIWo3mlHWMI5S8wC+So+fTaq/6REnBlaC0eAH24buUhpQbZSQ5s4PZaB2Zd5OVf8rBTapFJppEXRD8GWIivJNMzMcSsPz1+CLvDq0+jPFmh+sVdPPk8UVLtphwpV3eXsBcM+6b/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8oKhMC67LbkbnIbIETgAAi29THxVte7vAH+QdMrgcY=;
 b=CMOt5I10IJ/Gbma+4t+nB1aIPaeItRhUp+6UJwbaZ1V2uwfia5jkXlBV+KFLTqChgvwO8BAvXlbKHm9j/VlVqU/KO6Mvt/XQSp6wGiRJQZgtiSkGS84HWmw5n7/+9WG/U0fFcpaInkcZnqYW4UQSmSX+QRGHtctmpulZ8rR88oz8Lx+YOM24Kke8InpAQZtYtIYjHdF8m6zeBBqTZDQT6YmpAdA7UxSbLJKlvsEo1PCGivNRdE60eGca2cqAgrST19joFjwSPjZGUsBBWeW3hIjEAaZGIvfikhVw5OglDGaOW/SfIagalQdjjo5q1M4SXRdAuqU1U70oV9lbLz44pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8oKhMC67LbkbnIbIETgAAi29THxVte7vAH+QdMrgcY=;
 b=P3CZFGkWDdZVDI7wkduTFu+/WCPRcEyJltw6JLGkxnTnFsoDPE3YtE6rM4TmdM8oHuCDHPpQUfWaoYO5YJsRNZZ1WEZqWNNLU+dYIM2VtyzeoXUr34vgmo+zl4xcZPHTepx+TMWH3Wp9peGIVOVrmEJ0LNRS005eauqkclopt9c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 13:31:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 13:31:18 +0000
Subject: Re: [PATCH v2 4/4] drm/amd/display: Add DC_FP helper to check FPU
 state
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, anson.jacob@amd.com, hersenxs.wu@amd.com,
 jerry.zuo@amd.com, sunpeng.li@amd.com, aric.cyr@amd.com
References: <20210713140612.2721113-1-Rodrigo.Siqueira@amd.com>
 <20210713140612.2721113-5-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4eec1a65-1c2f-1598-9443-09a0c415b869@amd.com>
Date: Wed, 14 Jul 2021 15:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210713140612.2721113-5-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR0P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 14 Jul 2021 13:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77134063-4fd7-43b5-b97b-08d946cba93d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3837D92FA4E6E8E49B0354BA83139@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54B22bM9CCVlEXIt2utYDwmV6oQQ9tG4uGQ2F4mFa9P4wYYZ7j1QSJjYAH2c8rQ+mBidh4pF+hRsbh2rhNJc5EccEdWgRimGJ/AqFmUug0Os8N7fDjcINeVsaJ3dBRnSAl9VX1qG/Jdnucg6ANsWTMEx+zy/nlqxz1kD6MMXcDgsZSnlHvA/N3YwiKBBowhkixXy/xjHowGaYRw8r+z+KImImd53rLNF3TjsMOETvfgSiR5oIQCeRi/HEqsBkfO+WeD9T11BPbakZoxBGECd2mwK2RJu+1B0S/Cg2LVRT9TaK0a12VDhGfJ6GAQvQKWP4BE6FpYWkh+gMyIhg1ftfTUbNHGWvLLFQ2VBJ70Yhc9im3wuBD3bgV5VyHbQdvKRHkNJnh3wLd6oDnFBLBXMhHuoXqfV2Fe+3MYrhYH2dXCSxlihwNzhsNecXtP2x3SMUzRTVyZkHVr9P3XCyQeqU3gGua7i4Pa6W+1EPyAHtF9xlf7iislrJ9997IE5YThQXfgG3Kl7jb5jLq5Q4RP2//3QW12BUetMDQMd2+V3NHMq5RcgKUh1UC3SfbJObDkQ3gDRDuEQIO9z3iHa/x5u5x8OzEMmzx6R/H6EygFglfkU70w5XPEO6PgwbYgZKmNH1HiUnXnMmSJflUUz6zKgM7MOrWTfjnnGyI4C1NwGuyns6pBRfspGRfo+NZpdyjSBSvWhsV5r8jjVqDPnNBRr9vRLA+pYzrwRYnBldwXqTomZlzXefgyO87jtgSpHAo4i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(66556008)(66476007)(66946007)(6636002)(2616005)(186003)(478600001)(86362001)(6486002)(31696002)(36756003)(83380400001)(921005)(6666004)(31686004)(110136005)(8936002)(4326008)(2906002)(8676002)(316002)(5660300002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clVCaHo4K2JnRUNPVFROQnhNS1EvdE5wbkJyV0FyYWlLdGk1MTd5NEJVYzUr?=
 =?utf-8?B?MU1wdTVkWDlmZWpXSUlyYVZXbWJwdk16VUN1SW5uVTUxSkJ5S0Q2Ty9HVlky?=
 =?utf-8?B?Y1hXd1lTV0pEc2QwWmRmSWV3amU5VURhM1JtOHV6c3JjV0pDWFd4UFBZVXNZ?=
 =?utf-8?B?dnZTcStPbTZFSWtBNDhaZFdkU053bDZUZ2daSys5RXc1NEhDMVJyb0JXMEhv?=
 =?utf-8?B?V2NXd1dZTkhKeXVtU3U2Z1B2RjdlbXBRZDNIaUx1QnQ0Y3c4b0QyTGlXVjhp?=
 =?utf-8?B?dU5lbUdQYmZXM2ZZVlBJVjc5RkVsaVpiTUY2UFVHaFhUeFlzdVFTdFlnTml2?=
 =?utf-8?B?ZU5hWDM0Z0JXWDlyWnYrcVpYUktNbG96UFRhRzRpbVgrZ2JsZUE4V1FaSHhl?=
 =?utf-8?B?QlpRQzdXVkxuZk5sVVpuV1ExekY0ZHovVlBSOElCelhCaXVQQkV3cW13dHhF?=
 =?utf-8?B?M2NNVDZMUzVtNWtjS1lxU255ZlhESDZJQnBIZDM0Vzk2Z1lRMDlJeUc2WVU2?=
 =?utf-8?B?b3ZkYjZLVFFjM243MmM2VE9qVDd0cDhucENJRGd5UTY0cW5yNTFtU2dNdlVh?=
 =?utf-8?B?d2xvRVVIZFdNTWtyQ2FGOFJ3VFF4TnJvQUtiNENqdFhjLzM0QnU4SGwyc3hP?=
 =?utf-8?B?UnplUWtFOFpHM0N6YlhOZitjN1pYU08wbHlhRWpqdkZqZmpwakkxTWpHMEhL?=
 =?utf-8?B?K0JqNEk3SlBvdXRPbzVYZU80QUtmZjFOYVQ5ckxWQnFmbDg4QkJPMmw4V0Fj?=
 =?utf-8?B?U2x1VXBGeEJzaHFFZ2IrYjZ0UGdZQ2xJejN4c0QwV3B6ZzlVVmFKYmZYNkZs?=
 =?utf-8?B?bEtNNEZZcmNuVnhSa2MwRFF2SDVXWU4yd3dJVi83YzdiSmora0RLVmhlY1lt?=
 =?utf-8?B?NnFQYjFWZTZGbmZnd2pJQXB3cmY5ZjFHeE1NNUE4UkNMOVYydEh0ZXR2Y1l2?=
 =?utf-8?B?UStnUHBtc0F2T25VSHhJUTUyc1ZTNVFXZmQ5bUdQc0x4T0IyWWMwRXJVb3Rm?=
 =?utf-8?B?UFBDbGRkZDFzNW5TS3VsVWQzelg1OVVVVER3dUkzeityVUxGK1BYMmtJcXRs?=
 =?utf-8?B?NmVLVXY2WnJCVkJ4czgvQXJWQTJwMUNkRWRNV0VwKzVZYytFYzF0OEhBMXZO?=
 =?utf-8?B?K09FRFZBTUVVNmtMb3gra1BhaWF3SytPc2c3bk9DR2tFcE1tNTlKdit5VUVU?=
 =?utf-8?B?eFVoY2thWEZMQ0NQRnFxaXg0SnVhRnFPS3cxd3JadUx6MGNrbG9pRjA4WE45?=
 =?utf-8?B?TnEzd0RSOFFwcmdkUm9QcE9BK2pLamRCNG52TTY3K0JhVVRRbkhhdUg2SCtP?=
 =?utf-8?B?NDh0d3ROQlViY0d4NzltOWxydjNlSmwrbm5ka0RSWUJaQVNQekMrM2hiRmVZ?=
 =?utf-8?B?RGU5cXB3cmIzTklZNXh0ckgvZzBFYWFxNHZmK3EwRzF3dFpvOUNNWlNEYUNX?=
 =?utf-8?B?amxiNUtDM3drYm4wZ0NseWxaQytYRGVzL2E2TWZ3cGl6eU1vQ1dLZ21sVUVr?=
 =?utf-8?B?R29oRGtZbWRtcVZwcXlTcUROeDZHWTcveitubEtsZ2t3Ly94OFJwb2U5bjZL?=
 =?utf-8?B?bG5yVWxZdVNZUUwzUEsyS2haeU5NRGtwUUY4Wit2UU5ZTGF3K3M3eDY2K3N3?=
 =?utf-8?B?RjFQZHBmUmJaSWphdWVSaFh1elpYcmMxS2FKeVFYMkRIYzROclRuZWFCWmsz?=
 =?utf-8?B?NnlFdzNjSFNncVlCeDV6eEhVOTdVTWh0Q3BKOEJIT291UFptVENBb2ZLS3RT?=
 =?utf-8?B?NFU1Y0hENEJrdi9HbnpxWjFsUUZQd1BPRzZvamRNWmFScmtTd2twZXRkeUpw?=
 =?utf-8?B?U1orZ1orL1Y2V2d3b1lYYlJkQ3J5MWlOQVBrZnIxTWJKbmlSenlVd2pFcy83?=
 =?utf-8?Q?Vw2FksKhUDkbC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77134063-4fd7-43b5-b97b-08d946cba93d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 13:31:18.3314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Mh1SSXLqGYmz2iAjCEzA3RsjRu7O+C3W0lhcYXFgeCqDwozP8FP+Y4IZZ5GUhOX
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.21 um 16:06 schrieb Rodrigo Siqueira:
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
> Changes since V1:
> - Remove fp_enable variables
> - Rename dc_is_fp_enabled to dc_assert_fp_enabled
> - Replace wrong variable type
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 22 +++++++++++++++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  1 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c |  2 ++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.c | 17 ++++++++++++++
>   4 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 73179e9e859a..74153a2816f9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -41,6 +41,28 @@
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
> + *
> + * Return:
> + * Return true if we already enabled FPU protection, otherwise return false.
> + */
> +inline bool dc_assert_fp_enabled(void)

Assert indicates that you print a warning if the condition isn't meet, 
but you only return the condition.

Either rename the function or raise the warning directly.

> +{
> +	int *pcpu, depth = 0;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	depth = this_cpu_read(fpu_recursion_depth);
> +	put_cpu_ptr(&fpu_recursion_depth);

Again this doesn't make sense.

Either you use this_cpu_read() or your use get_cpu_ptr()/put_cpu_ptr(), 
but not both.

> +
> +	return depth > 1;
> +}
> +
>   /**
>    * dc_fpu_begin - Enables FPU protection
>    * @function_name: A string containing the function name for debug purposes
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> index fb54983c5c60..97941794b77c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
> @@ -27,6 +27,7 @@
>   #ifndef __DC_FPU_H__
>   #define __DC_FPU_H__
>   
> +bool dc_assert_fp_enabled(void);
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
> index c815d6c01d64..d8183da0c2b0 100644
> --- a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> @@ -41,6 +41,22 @@
>    *    that deals with FP register is contained within this call.
>    * 3. All function that needs to be accessed outside this file requires a
>    *    public interface that not uses any FPU reference.
> + * 4. Developers should not use DC_FP_START/END in this file, but they need to

This needs to be harder, e.g. "Developers must not use....".

Regards,
Christian.

> + *    ensure that the caller invokes it before access any function available in
> + *    this file. For this reason, public API in this file must invoke
> + *    ASSERT(dc_assert_fp_enabled());
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
> @@ -83,5 +99,6 @@ static noinline void _dcn20_populate_dml_writeback_from_context(struct dc *dc,
>   void dcn20_populate_dml_writeback_from_context(struct dc *dc,
>   	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)
>   {
> +	ASSERT(dc_assert_fp_enabled());
>   	_dcn20_populate_dml_writeback_from_context(dc, res_ctx, pipes);
>   }

