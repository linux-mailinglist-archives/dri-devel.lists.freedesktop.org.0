Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122B3CF5BB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C046E090;
	Tue, 20 Jul 2021 08:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6A6E090;
 Tue, 20 Jul 2021 08:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nio29w6kiFF/DXS9L+8Eluv9CINqf+Rud5PpQglQaVmxX0SM38hYtcAq2/By4CqMWx3Hy0ETsV0vAGdQRhTb3GgS8lODcu6ALz6ivegkljGuwbqrBAOYQymtjpWYJno719Q8zPoaFLBBxt9/bFFSSN6VlEjOKbUaxTC4F+WxGoaWdGXN4AohOaH1tAxLjhXkoHEw9X4CET8k8BG865yXP4jOELUZjfI81Wdf4wdkAW8F05+k0sKwKNfbpkweZnhP7pbepyAvoZ26W/DtMArgzGNp0TWuDVp8TUMlMzQL5mdR9vDBakS3a6/xNT13Z2gFVgKG3TwZ9SRHNYLB30xpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8+xt52t+YtWB28S2AtkO8Sxy6KtM1DgPbZMYXltuRE=;
 b=kWi4ghYloVhrNiZuoLP80RVchzhoFTxM/TGveFHbkjdEeRtm2XH5f8vdE/Dg+XeYY32dHubPSxjS6fZ+/ODcJwwRAIvaH/bBpg17zlkuazPWW1PQGxEid06FZi4oduDmaH1e5Hh1LGNwtJY01VaZN4/0+nHSM4Zi3fx1eCszJEbATlHYM+cwMQDFtNkE7UurwL0VvpuP0hosezSLvkK32zx3gWHTRf9Mma/pyh862uzdq5tEj2c2HQ4YccTu6cBrJ4XWOerX577ZHsvNZpXI8T0q5clQN33RfAUvIim3fZq9VHZkKHC9GYYcwh8FBQy5KwJzKbwgrERUSlPn8LNZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8+xt52t+YtWB28S2AtkO8Sxy6KtM1DgPbZMYXltuRE=;
 b=MZGkMdVh1TpSkvRh40+ZBZ3J4X+80awHfDLPApzenjIzNBbB70XDgELUVxS9eoIZnhJLIVw5mpn7soqZW8pSJdAGICBd67R29ntVLbcnINqoi3SEfLkB5UEUIcbLhdFQ7ePgvEufahxKkriGiAF2GEgCAi1AsJVzo/tsq4enkN8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 08:09:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:09:38 +0000
Subject: Re: [PATCH v3 1/4] drm/amd/display: Introduce FPU directory inside DC
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, sunpeng.li@amd.com
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
 <20210720004914.3060879-2-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8c92d369-6c5d-9a4e-3f00-43b44813314b@amd.com>
Date: Tue, 20 Jul 2021 10:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720004914.3060879-2-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.10 via Frontend Transport; Tue, 20 Jul 2021 08:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96dda72c-3ee8-4763-7cdd-08d94b55b819
X-MS-TrafficTypeDiagnostic: MN2PR12MB4566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4566174500FD24F37AB0362783E29@MN2PR12MB4566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cC8i/E48bJM7+/S6Gk/mshWPreDJxByYbD/3GVgGepiqCk1faRX0c0K1CvUia2svJ2p9Q3V+4op+gpoSXyRcguxkE6yBdi3uEaXrnSlGRuuFzMzVb7l+0LmFDxjGmUGybjUiO/ivLIuZ8jwm2XNWfJ0Mvu5x+tjQVSEegE27743EtjAu6XLJUklNFUXMzQ7GcKoRxRqCLDrT7q3InhHyYGOSHlA/2W2qUHXFZNICCc1WXm4jbsG4CU2Y26oIEOXmYMKFBVdPtneoSu6KrdmZJNT9h1UCx8zqqSiG0tkWCgZOUXmepz7dIIixOGEbPiwCQL/3R/6LdSwviqdGLa04VFYFhtSwRTXSJTx9QjTRMo0L55LSgHyxuZw3rSvbToS6oEkY113jvhEgs6lpWCfnvXBY8hopb5snGnaK3GImR3rJLUnvGOxLUNQ6g1lJx96n3XdnxrE4LrNfn3+oncm8q6AeXk1JOjnx8jbXhpU6RiVQ/SvQnvH39gxMfwoyBr6OArG3EQRlz/WarRKvDNzAZTk286C/1B3o3bJZy8w7FCT7kr9yuG1PQy3cRbFxZINchC7w+wtXtsuoOB4ZXRiRUniEWtDtD4e1+pguEdBK25QxrJrFeBwTAvCSStsD9CsM4DRz3fWqRddn5eFmIUrLhBE4kOo/vosLxW7M+hDsQr82itWiH5N4NBt5wK4rYxVU70p45tYQS6JdklcUuujkkdP9CC4IBOccY3Omd1upWwhPMg3WYKSwSka9xSm0Kz5e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(2616005)(54906003)(66476007)(6666004)(8676002)(6486002)(316002)(66946007)(8936002)(110136005)(186003)(66556008)(6636002)(4326008)(478600001)(31686004)(31696002)(36756003)(86362001)(5660300002)(30864003)(2906002)(38100700002)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9hNjBYbTIvSG9XTHdFZTBlSy9UUkZJamxrYThWczZYQm02ZHdDQWd3WUFh?=
 =?utf-8?B?NzJlTVBXZDBiUnBCL0Y2MVVjclQ2RWdlY3YxaGJWUFMzSjNBYXpxd3pqaW5B?=
 =?utf-8?B?NDA1bkhOcjNISW9FbkNjVFlYSGt5WU10aTBhOG1WT1k1bmF2VHlnK00zVnJu?=
 =?utf-8?B?TmxoY3FhQzZIU283S2tudkhQeTVKRkVaZzkwRDVNL1dOaUxac0sxQk14MmNY?=
 =?utf-8?B?a3JWL2E0c0dabnRRSVV1T2NveU84UDVXN1o3blJoaHdJc1g0Z3prUG9nVWk4?=
 =?utf-8?B?WHhOUGRtUzR5d2dJN0h2a3A1UEVVU3pYVGNiMHlIZHB3aDFNY21PWCtEUVFG?=
 =?utf-8?B?UENNS2xsNExsRk11NXc5bTVWTk9IbVdMK3JybmpPbVV4YXdOK2lwZ0UrbmI2?=
 =?utf-8?B?SUhvalk5ZXl3MDlndlVYUmF5c2xSUVR2L2g5eXNTTFo4QWFRWGJQd1R2SVBl?=
 =?utf-8?B?YTFpcUI3bTRtejZ6WFRmc0htV25hUHNMRnNyTW9NYTZDS295NUt6R3UyNGty?=
 =?utf-8?B?MjgwNytSWVZRUHE1Uk5FQlMrVjFMQUlUWk5IamFCSGxiVkk0ODEzN1kxL0pq?=
 =?utf-8?B?NXMwbXJrQzI4R2hKK1RDZFRCL3BGNTM3YzdtcXM4bm5ZRFJWayt6Qk9mQXA4?=
 =?utf-8?B?M2gyUEVPcGloTmpqQXg0OTBjQWF4UktrOHZ0aGVwUGZseEI4RzMxL2pPSG9n?=
 =?utf-8?B?ODlWbHRLbW5URWVmRnJRVjROdHBDWjNmZlk4b0JISDBQUnZhZnBKdm5rN0hh?=
 =?utf-8?B?WTE3R3FuMXlYMUc0ZytheWY1ZVpUV1VEZDVOWURtdjVua3hnN0d5azJ3bVpt?=
 =?utf-8?B?SWRWWXpCNTlyM0FiSVNtRm5SNmVBdDNSTHRFV3d2TmxOUzlLWXQvQUNIaUtr?=
 =?utf-8?B?Wm1rcy9nRTVzditoTXV3ZVR0ODk0SEhIN1ByRUxJRENRcWdDaHRJL0VuSUVa?=
 =?utf-8?B?MWJGeENiWm1vaXlJWFlIQlVRTWNPMlVSemVCTFpWYXdoeFZLa1pMK1NNTUNz?=
 =?utf-8?B?eVdWYi93MkhMWHloc3VaRVJJUlg2T0RSTWJ5S2YvVXM5MDA0MkVCamw3MFNa?=
 =?utf-8?B?OVd2L1RoQUY2K3JtSHJONVUxdS8zVWorNnpsUERYOGowUjc2UklrS2Zta0Vu?=
 =?utf-8?B?MUg3aTZib3R0V3VtWnlXT2Z0MzNKWmgzeFA4bHQ3cDdhejJlYVBBU0d2Q3E4?=
 =?utf-8?B?WExraG9XcnVKV2d1ZzJUQXVNK0xNLzhTNjhSZWdtb0x2NVpac0dacnU1T2lM?=
 =?utf-8?B?c3ZHTzZWWmREMEZUUFA3ZjMyeGl0eHBsL0FFa01hcTBnTFFJQ2N6ZXVjOUhp?=
 =?utf-8?B?ZWFia25CR0VwL2RQU0RmUmFPaVRNWXNjdXFIWmZVTlluR3BMQnBvVlR0QUtK?=
 =?utf-8?B?RGVHOFNmaWFwNEtYS3RRaU1VeFV4ZEZhMThjc0dLaXJDbjdzTGJoKzkySjVS?=
 =?utf-8?B?VUZFSG0rWFZiVllZQjJWR1FBQ3BGQ1lMVEQ2RTVaTmd0cTJ5SmgvNEg4YkFZ?=
 =?utf-8?B?bk1YdHNTK3BsUDZDZm53S3NnVmt4ZmxTckQxTzhLeDY2dUZjYUxKaWVGRkJt?=
 =?utf-8?B?d2dTVmFQNFA1NnREK2xwN21CT2xCMmZXdFlObzRlekh1dVkrMTVBZTMwdCtE?=
 =?utf-8?B?OFE4NTVvd3NTMjQwVnpwKzRTbnZRU2lxM1pzS3doaWVwQzF4UmNTMjhraXJU?=
 =?utf-8?B?VmtSUnhlVWJ6RVNzVXIxMjZDZUdiQ2tXNjB5ODltN2pHbTZ6Y1ZXVURmODhu?=
 =?utf-8?B?ZWkxeDJLZkFjVGlhSWQ2cy95QkhFaFJQbTI3UVBrR2FrOXgwcFROeVpxczhk?=
 =?utf-8?B?SEMwSE92TnlSQnFKYkg1UmxEOHZDR2g0TmY4Z2d2VWQzS2pEK1IzcnZGbU43?=
 =?utf-8?Q?9yOfLUlgLnnAH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dda72c-3ee8-4763-7cdd-08d94b55b819
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:09:38.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Frx6O6was3RmCwQyIcSKutXotmpGz/rhsEJpqudU9QiYKrfK6e/UCpvCArxaXIg4
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
Cc: kernel test robot <lkp@intel.com>, Anson Jacob <Anson.Jacob@amd.com>,
 dri-devel@lists.freedesktop.org, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.21 um 02:49 schrieb Rodrigo Siqueira:
> The display core files rely on FPU, which requires to be compiled with
> special flags. Ideally, we don't want these FPU operations spread around
> the DC code; nevertheless, it happens in the current source. This commit
> introduces a new directory named fpu_operations that intends to
> centralize all files that require the FPU compilation flag. As part of
> this new component, this patch also moves one of the functions
> (dcn20_populate_dml_writeback_from_context) that require FPU access to a
> single shared file. Notice that this is the first part of the work, and
> it does not fix the FPU issue yet; we still need other patches for
> achieving the complete FPU isolation.
>
> Changes since V2:
> - Christian: Remove unnecessary wrapper.
> - lkp: Add missing prototype.
> - Only compile the FPU operations if the DCN option is enabled.
>
> Change since V1:
> - Update documentation and rebase.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Aric Cyr <aric.cyr@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/Makefile       |  1 +
>   .../drm/amd/display/dc/dcn20/dcn20_resource.c | 39 +--------
>   .../drm/amd/display/dc/dcn20/dcn20_resource.h |  2 -
>   .../drm/amd/display/dc/dcn21/dcn21_resource.c |  2 +
>   .../amd/display/dc/fpu_operations/Makefile    | 58 +++++++++++++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.c | 84 +++++++++++++++++++
>   .../drm/amd/display/dc/fpu_operations/dcn2x.h | 33 ++++++++
>   7 files changed, 180 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
>   create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
>
> diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
> index 943fcb164876..0de4baefa91e 100644
> --- a/drivers/gpu/drm/amd/display/dc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/Makefile
> @@ -35,6 +35,7 @@ DC_LIBS += dcn301
>   DC_LIBS += dcn302
>   DC_LIBS += dcn303
>   DC_LIBS += dcn31
> +DC_LIBS += fpu_operations
>   endif
>   
>   DC_LIBS += dce120
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 1b05a37b674d..f99b09643a52 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -35,6 +35,8 @@
>   #include "include/irq_service_interface.h"
>   #include "dcn20/dcn20_resource.h"
>   
> +#include "fpu_operations/dcn2x.h"
> +
>   #include "dcn10/dcn10_hubp.h"
>   #include "dcn10/dcn10_ipp.h"
>   #include "dcn20_hubbub.h"
> @@ -1974,43 +1976,6 @@ void dcn20_split_stream_for_mpc(
>   	ASSERT(primary_pipe->plane_state);
>   }
>   
> -void dcn20_populate_dml_writeback_from_context(
> -		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes)

BTW: This is not good coding style.

Maybe use a different editor or re-read the coding style document.

> -{
> -	int pipe_cnt, i;
> -
> -	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
> -		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
> -
> -		if (!res_ctx->pipe_ctx[i].stream)
> -			continue;
> -


> -		/* Set writeback information */
> -		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
> -		pipes[pipe_cnt].dout.num_active_wb++;
> -		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
> -		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
> -		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
> -		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
> -		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
> -		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
> -		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
> -		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
> -		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
> -		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
> -		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
> -			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
> -				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
> -			else
> -				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
> -		} else
> -			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;

Ideally you would only have this chunk in the FPU specific directory and 
not the outer loop around it.

But it's at least a start, feel free to add an Reviewed-by: Christian 
König <christian.koenig@amd.com> to the patch and commit it.

Thanks,
Christian.

> -
> -		pipe_cnt++;
> -	}
> -
> -}
> -
>   int dcn20_populate_dml_pipes_from_context(
>   		struct dc *dc,
>   		struct dc_state *context,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> index c8f3127bbcdf..6ec8ff45f0f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> @@ -58,8 +58,6 @@ struct pipe_ctx *dcn20_acquire_idle_pipe_for_layer(
>   		struct dc_state *state,
>   		const struct resource_pool *pool,
>   		struct dc_stream_state *stream);
> -void dcn20_populate_dml_writeback_from_context(
> -		struct dc *dc, struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
>   
>   struct stream_encoder *dcn20_stream_encoder_create(
>   	enum engine_id eng_id,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index f3d98e3ba624..85385144e2c5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -35,6 +35,8 @@
>   #include "include/irq_service_interface.h"
>   #include "dcn20/dcn20_resource.h"
>   
> +#include "fpu_operations/dcn2x.h"
> +
>   #include "clk_mgr.h"
>   #include "dcn10/dcn10_hubp.h"
>   #include "dcn10/dcn10_ipp.h"
> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
> new file mode 100644
> index 000000000000..7f6f90c3f267
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright 2021 Advanced Micro Devices, Inc.
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a
> +# copy of this software and associated documentation files (the "Software"),
> +# to deal in the Software without restriction, including without limitation
> +# the rights to use, copy, modify, merge, publish, distribute, sublicense,
> +# and/or sell copies of the Software, and to permit persons to whom the
> +# Software is furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice shall be included in
> +# all copies or substantial portions of the Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> +# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> +# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +# OTHER DEALINGS IN THE SOFTWARE.
> +#
> +#
> +# Makefile for fpu operations component.
> +#
> +
> +FPU_OPERATIONS = dcn2x.o
> +
> +ifdef CONFIG_X86
> +fpu_ccflags := -mhard-float -msse
> +endif
> +
> +ifdef CONFIG_PPC64
> +fpu_ccflags := -mhard-float -maltivec
> +endif
> +
> +ifdef CONFIG_CC_IS_GCC
> +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +IS_OLD_GCC = 1
> +endif
> +endif
> +
> +ifdef CONFIG_X86
> +ifdef IS_OLD_GCC
> +# Stack alignment mismatch, proceed with caution.
> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> +# (8B stack alignment).
> +fpu_ccflags := -mpreferred-stack-boundary=4
> +else
> +fpu_ccflags :=  -msse2
> +endif
> +endif
> +
> +CFLAGS_$(AMDDALPATH)/dc/fpu_operations/dcn2x.o += $(fpu_ccflags)
> +
> +AMD_DAL_FPU_OPERATIONS = $(addprefix $(AMDDALPATH)/dc/fpu_operations/,$(FPU_OPERATIONS))
> +
> +AMD_DISPLAY_FILES += $(AMD_DAL_FPU_OPERATIONS)
> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> new file mode 100644
> index 000000000000..95a0b89302a9
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
> @@ -0,0 +1,84 @@
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
> +#include "resource.h"
> +
> +#include "fpu_operations/dcn2x.h"
> +
> +/**
> + * DOC: DCN2x FPU manipulation Overview
> + *
> + * The DCN architecture relies on FPU operations, which require special
> + * compilation flags and the use of kernel_fpu_begin/end functions; ideally, we
> + * want to avoid spreading FPU access across multiple files. With this idea in
> + * mind, this file aims to centralize all DCN20 and DCN2.1 (DCN2x) functions
> + * that require FPU access in a single place. Code in this file follows the
> + * following code pattern:
> + *
> + * 1. Functions that use FPU operations should be isolated in static functions.
> + * 2. The FPU functions should have the noinline attribute to ensure anything
> + *    that deals with FP register is contained within this call.
> + * 3. All function that needs to be accessed outside this file requires a
> + *    public interface that not uses any FPU reference.
> + */
> +
> +void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +					       struct resource_context *res_ctx,
> +					       display_e2e_pipe_params_st *pipes)
> +{
> +	int pipe_cnt, i;
> +
> +	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
> +		struct dc_writeback_info *wb_info = &res_ctx->pipe_ctx[i].stream->writeback_info[0];
> +
> +		if (!res_ctx->pipe_ctx[i].stream)
> +			continue;
> +
> +		/* Set writeback information */
> +		pipes[pipe_cnt].dout.wb_enable = (wb_info->wb_enabled == true) ? 1 : 0;
> +		pipes[pipe_cnt].dout.num_active_wb++;
> +		pipes[pipe_cnt].dout.wb.wb_src_height = wb_info->dwb_params.cnv_params.crop_height;
> +		pipes[pipe_cnt].dout.wb.wb_src_width = wb_info->dwb_params.cnv_params.crop_width;
> +		pipes[pipe_cnt].dout.wb.wb_dst_width = wb_info->dwb_params.dest_width;
> +		pipes[pipe_cnt].dout.wb.wb_dst_height = wb_info->dwb_params.dest_height;
> +		pipes[pipe_cnt].dout.wb.wb_htaps_luma = 1;
> +		pipes[pipe_cnt].dout.wb.wb_vtaps_luma = 1;
> +		pipes[pipe_cnt].dout.wb.wb_htaps_chroma = wb_info->dwb_params.scaler_taps.h_taps_c;
> +		pipes[pipe_cnt].dout.wb.wb_vtaps_chroma = wb_info->dwb_params.scaler_taps.v_taps_c;
> +		pipes[pipe_cnt].dout.wb.wb_hratio = 1.0;
> +		pipes[pipe_cnt].dout.wb.wb_vratio = 1.0;
> +		if (wb_info->dwb_params.out_format == dwb_scaler_mode_yuv420) {
> +			if (wb_info->dwb_params.output_depth == DWB_OUTPUT_PIXEL_DEPTH_8BPC)
> +				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_8;
> +			else
> +				pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_420_10;
> +		} else {
> +			pipes[pipe_cnt].dout.wb.wb_pixel_format = dm_444_32;
> +		}
> +
> +		pipe_cnt++;
> +	}
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
> new file mode 100644
> index 000000000000..c060f909164b
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h
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
> +#ifndef __DCN2X_H__
> +#define __DCN2X_H__
> +
> +void dcn20_populate_dml_writeback_from_context(struct dc *dc,
> +	struct resource_context *res_ctx, display_e2e_pipe_params_st *pipes);
> +
> +#endif /* __DCN2X_H__ */

