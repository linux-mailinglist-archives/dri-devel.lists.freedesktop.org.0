Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E641B51033F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F6810E7F4;
	Tue, 26 Apr 2022 16:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDADD10E7F4;
 Tue, 26 Apr 2022 16:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUcSs2pRnifUGakBvXInzCFx/1gSkCw0nnsLHr5o0R6bO7QKCmaSbrfK2SISHCi8l1wC8ibyfqc9NrXUQyU4qbzhKCHFBAAYPJpLh6v5zPlXqC5oHX55t695dXlR9vlGFVFC7qAGBJXY85BL2XS3fhrAPCb2Iau9Dd+5mRIGYQyIF8gFe7w2sIwhHG7pBO7KvSTrfSEsOvYO5gh10nr3aX1Aeg/thsqvbsldx+5EYJyTHykYA3csg5Lr4kJwsEI6uicTbW53NaC93RLjBy303JAAYZl0bRHzif7RwQoCtEtGBRGxmAM7BmT59sTgxg3/LOTwDF4wLmc9xRiMFunVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9jPrMfyJ4N4KhQhrcwhyH5H1ubRRsxtjdksLzLyAH8=;
 b=TpHPrQE92XW6Ax8bMioe1RUloJvba7/vneIbYV3q1epL/6Kr4ubJkqUEyI53pYq1Q/0xvpvmeY9O+jqaWPu4+NEsBIMabPnKACnaUzY+Mj52FQNVLyTknN3NV+A48QZQ4pOQMp8Lk8/25XGuaWN8OrI+gpuKfCJ1vnL3hiX+rIDSUe+XLSdHUjhvFDUuXFjwEhGGIa3vGMlLQn5oLxM4G5xBjIIiyRq6DmSIZwg786tFme7rpNP+dWYSwBDQEe23l/b4O6YiTmzqhNfcchV69SazLOHtYPyoVjMIgLeIOOrO19ebPmCP3aQgeq8WqRPjG9J3mxJOFFOwzO7bO5k9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9jPrMfyJ4N4KhQhrcwhyH5H1ubRRsxtjdksLzLyAH8=;
 b=gl5LU9LsEFUFYiHUGUgZ8SCn1mOW3sME5zEw5QQXewZZYJHcCpa0mQVYirEv0OM/UTECxZojU0jOn47+nXt+QQO+X91e+Wm8wAkA2LnG/rrTnj5L3Hbq8QMrxQdOi700drqanOavT/F9gUzeVgb2ALMlNNRkpTW6bizNOb+m2Jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by MN2PR12MB3501.namprd12.prod.outlook.com (2603:10b6:208:c7::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:23:13 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::2140:f05:1314:30b6]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::2140:f05:1314:30b6%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:23:12 +0000
Message-ID: <fed8e5e1-18ea-cc68-328c-3d36c5ff98d2@amd.com>
Date: Tue, 26 Apr 2022 12:23:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd/display: protect remaining FPU-code calls on
 dcn3.1.x
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220330230204.2473636-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220330230204.2473636-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:610:58::16) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a55260-6e62-4be7-c9ab-08da27a10f07
X-MS-TrafficTypeDiagnostic: MN2PR12MB3501:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB35016ECBD3F0BDE81BE7B38398FB9@MN2PR12MB3501.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBFxSl8ItQ3SzbFmo3yz4jFuu51KJFx/9E+yci/SsSQRsla2hr+Df3bwUE2F8ciTC/CqMwtIPopLJHlVLIKmStXoMYpTQVsI50I47aV1IoLvfk4wUzpr0FYSlVhuCdaNPlauQ6+qGVcfrZbZQ7yz+MjSt5s1fef33j346DfVSiWXgHVrWztp9ZbdFI8Pf+4ZaKmtjubh3IKRIa0A9+Qla2JOVhBnWpqXYV2x9Obd3QttpKLOVKQSK2mF8U6vKrGX2w/yHXdKeyLrl3g5KiKStxgSEz1wuOUeKiYqasTOZRxe6yhOgmN3q8BCdlAq6zrnVmehU7vGPuMr+0bJOjXn16FenCOtiB29T34fMlsfs01dmI/GlVgdcfmEP1UrdEWxlbPuTfl47sqxxqNmIU0zWi1tV8Kxkv1WSDjRdWpXe9VrfcpidRMrB/P3KkRawtyKZZWyDTUUxmEQ0Ss24D+o4XUc3AIpvxsUW3QXyjzi9ZUBKLtYFtj2DNDuDc5Mp8BDJ5S3XmxLbs3qa9PyxL8oNMI/0C9hQ9b5FZe0o4vhct8tyQh4YTnTsab03ogAVbxSv2hwno84PkNqCtIqDft9vlVH6ZDhGh183fZERJZKgszGa4wCR/KILmJNt9/KPpLbQ7w8ygw+UpxpcqD0OGtgl0Pqjt5VBnSJX1OoKq5COOBb5p6HOkYpENVHyFkqFuIQCRoF3f+wB/gqgDy48ro9jEGuU1OBQtB5heE5tqGb9h6Pwalro42V3HF5BHSWUhEXOiZ0wskGHQMYxGeJlCt1OrEGjIcHgCt1mLcgSggBY1m24axZlihT/sQ4b++xUrj4b0Ly5uXXHqzxaU+mv6jA/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6486002)(2616005)(86362001)(54906003)(8936002)(508600001)(2906002)(31686004)(83380400001)(5660300002)(4326008)(36756003)(186003)(66946007)(8676002)(66476007)(66556008)(6512007)(6506007)(26005)(316002)(53546011)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG5RTnhwM1Ivam5iSjJURUFENUNSc0E2dFg4S1lLNEhPSlJtWldPSFRGNmVL?=
 =?utf-8?B?VU1pMHMyWFZkNGxMVFhIVVNtbXM2cENNV3R6QUdaN21qK01ZR2phVWsyelVJ?=
 =?utf-8?B?QVRhSGtxSEJLaHpwcWtXSG1XOWNRS01WNG9nU3RDS0Rpa2FGUDVYSEhMYjE3?=
 =?utf-8?B?U2J3SWZGUE5WVHd0TGNKUS9SRmJLMHhYSDQ0MVRHZlNkaTl1MnJqTjR3WXJV?=
 =?utf-8?B?Vk1XZTdYdTgvYlhsOFhyZ1hwUjM0Z2V2RDZCQWxSOGlndzlodjgrWEVZU0Fp?=
 =?utf-8?B?NVhSOWtTVFg3Qk9ZcnVxcG1VZWpNdWZWQ2t4akJVZU1uMVNEOG1aMHJXK1lp?=
 =?utf-8?B?ZFdic1JsSXNCS3NHZ0pRYmlrL01uMUlneFUyWVRwSmZiUnBpdG55ZkpVOUMy?=
 =?utf-8?B?MkswUUVpL0V5NFhVcGh5TTd1Q3dmZGZ3T0dRaGN4SjZyTXBrL2kwRkNPcUVq?=
 =?utf-8?B?UVo0NVh3ZEIzOFFYVzZQUVQ3dGI0d0MwRlBtQ01mR1JDeFc0NVNJKzRwQkZm?=
 =?utf-8?B?LzlSTmF2M2ZyV2JTdndGc2JiUngyRHM1bE9BMTduRGh5b0RnK2tHZUdpbVpP?=
 =?utf-8?B?VWRUYzZ3Sk9VUFlCWEVZQnAzcjYvK2lhM25EREZxbzF4bExlUjBybmpkRm9q?=
 =?utf-8?B?Nm8xNEFWalVkelJ0UVdjSzBGdi9XVEFCZ1I3LzJ4eHE3czN6eFd0TGJ3K3M0?=
 =?utf-8?B?ODVoQXEzMm43ZjRmUWRoZXNqdHg1T1dwTnRSWFZ3NmY3Tm9ZSVhZcFFobUxO?=
 =?utf-8?B?U0hyOVh2UEJ6dlFCUUlDUnB1MnpBVnB3SG9ReisxRWFCVVR5NDFYQmxxVjVq?=
 =?utf-8?B?RTVyZERaNGlGMk4vWmI3aHhEektBYUlTeGk5enJTWnAvSzBKUmNqdGg1ZzV3?=
 =?utf-8?B?NzNuSHFsTjd2Yk1sWndkdkFtNW5ybHJyQm0zKytMMlI5bHlBNjVMNmROdXIv?=
 =?utf-8?B?UEdhQ3l1WkJjQzVCR0JIRm9nN20yTVZSL2NKZnRTM2FzbWFCdjNxZTdWMWpD?=
 =?utf-8?B?TFFxWStsNTB0S1pHOVVkb2pBTXkyWTcwS3BhaHNQa2NxM2ZWbU1sOEhuV2JV?=
 =?utf-8?B?MEpBM1pWWGk2UEVSbWJuVEZTWGNzZ1lqVmJMbDBQMWRRQVU0ZjRsdUh6MXZT?=
 =?utf-8?B?ZVNKQXNKck56YXFadzF1YnBmVDJaMGxLc1U5bFA0VmhVNmZTdUpzWjVnWld6?=
 =?utf-8?B?Qnh3NXlYSWZ2OHdnZ1FFeUhWKzAwQXNjZlY4bE54ZDNBRmlDcmxpYy9FZlYr?=
 =?utf-8?B?Y2xEQUMyZ3E1bVo5OXJPMmlIWnRmdHp2Q2ZaNTFDVStYSGkrOUVPQkI2TmZJ?=
 =?utf-8?B?Qlg5SUhSV3dRUVYxOUNzaXRXcUZOMHlmQ3lsWmdvdjBFU0l1NDdKaDhicG5o?=
 =?utf-8?B?VTNpWGc5bjBxbWxBK2xmNy96WXdPdVB6Y081bmRCZkJGbEpCZW9tVCsxdzB4?=
 =?utf-8?B?Z1huVG9KWExXdlkrdTRVbzVWT2VZdnloMnlrQWhMell6dUU5V2YzSUptbmRS?=
 =?utf-8?B?TCt5OUM4VGZzdXJhRGtzNTJ2OFZBam1EUTFQVFRYUHFwUGR4U09RKytRT05Q?=
 =?utf-8?B?aEJXWG5qc3gxbE9QM3VOd3lMOUU0a1NLQVRQVktSUHFhOUd4a3hiSGI5T3NU?=
 =?utf-8?B?dkZqa29rVEJGNnEzd3NDSklpOVpKRlRiZU9CaHY2eG5qZThrZ01yUHdkR2du?=
 =?utf-8?B?NjlFK1RCNFVkdFJWQkNpd1FXNkoxTFpCZ1RtSHpRY3ErWFl0MUZXWUhGZnVj?=
 =?utf-8?B?cmVyTTFpN3lzRzZ6Tno4WGtyWmx6M1BlZllBcnJNeU9Qd0RBS1BWMjJEZC9S?=
 =?utf-8?B?MXIwN2NuenVoQ0h6b0RrMUpadEt1Q1NhWTFNRDZVSnBCNVNEUHRUZ0RTeVp1?=
 =?utf-8?B?ZWdDS3J2R09FeVptWkJPelBjUHg4UDJybU4xVFR4SEx4a3hXdTk5ckFueWpu?=
 =?utf-8?B?Kzc0a01qczNsdmMyVWZiUWNnSXlQcEU3dEpMWE1wUmVxSjMrS1FTd2NuY0Vi?=
 =?utf-8?B?RzVqS0Fja1lyVFVoV0pHMjlrZVRneWxyL21kc3Vib0NNQmhuUnhha1djYklK?=
 =?utf-8?B?TGp5RVdtdFBYb0pUZEpYK3NQTHdjRjJvRDZxYW40OXZLdEJFMWdlWmc1bjFh?=
 =?utf-8?B?NEN5SFpUVzRlUXVlS1M4RmUxN2s3OGNZaVZuOTA4cWlsb2tZZ0xueGZITElh?=
 =?utf-8?B?Q1BqVU1BS3Bob3BHMFkxcExLV081YkZ5OVV5RGpWbUFVV1RRVkUwU081eGQz?=
 =?utf-8?B?ZEVJaWM4Q08wNGQ0UEVjcFU2V3FoUWtzaDU5NGJveWhUTzdNQ3dXNlpFbnpS?=
 =?utf-8?B?enplLzJoOFJnNnRYSlJVS1RsbnQ0eWYyamZJU1QwL2lyc0ZwOHErUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a55260-6e62-4be7-c9ab-08da27a10f07
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:23:12.4701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzv8UNhmqZtMvx9xGq2AgtbrVXLeV4xFdHjJHnMkOu0caFPYq0VdSqtwAOByo8Q5kv79jUxcem7Bacv7n1/bAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3501
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chandan.vurdigerenataraj@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx@lists.freedesktop.org,
 Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-30 19:02, Melissa Wen wrote:
>  From [1], I realized two other calls to dcn30 code are associated with
> FPU operations and are not protected by DC_FP_* macros:
> * dcn30_populate_dml_writeback_from_context()
> * dcn30_set_mcif_arb_params()
> 
> So, since FPU-associated code is not fully isolated in dcn30, and
> dcn3.1.x reuses them, let's wrap their calls properly.
> 
> Note: this patch complements the fix from [1].
> 
> [1] https://lore.kernel.org/amd-gfx/20220329082957.1662655-1-chandan.vurdigerenataraj@amd.com/
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../drm/amd/display/dc/dcn31/dcn31_resource.c | 25 +++++++++++++++++--
>   .../drm/amd/display/dc/dcn31/dcn31_resource.h |  9 +++++++
>   .../amd/display/dc/dcn315/dcn315_resource.c   |  4 +--
>   .../amd/display/dc/dcn316/dcn316_resource.c   |  4 +--
>   4 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index bf130b2435ab..afdfec74ed08 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -1735,6 +1735,27 @@ void dcn31_calculate_wm_and_dlg(
>   	DC_FP_END();
>   }
>   
> +void
> +dcn31_populate_dml_writeback_from_context(struct dc *dc,
> +					  struct resource_context *res_ctx,
> +					  display_e2e_pipe_params_st *pipes)
> +{
> +	DC_FP_START();
> +	dcn30_populate_dml_writeback_from_context(dc, res_ctx, pipes);
> +	DC_FP_END();
> +}
> +
> +void
> +dcn31_set_mcif_arb_params(struct dc *dc,
> +			  struct dc_state *context,
> +			  display_e2e_pipe_params_st *pipes,
> +			  int pipe_cnt)
> +{
> +	DC_FP_START();
> +	dcn30_set_mcif_arb_params(dc, context, pipes, pipe_cnt);
> +	DC_FP_END();
> +}
> +
>   bool dcn31_validate_bandwidth(struct dc *dc,
>   		struct dc_state *context,
>   		bool fast_validate)
> @@ -1806,8 +1827,8 @@ static struct resource_funcs dcn31_res_pool_funcs = {
>   	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
>   	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
>   	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
> -	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
> -	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
> +	.populate_dml_writeback_from_context = dcn31_populate_dml_writeback_from_context,
> +	.set_mcif_arb_params = dcn31_set_mcif_arb_params,
>   	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
>   	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
>   	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
> index 1ce6509c1ed1..393458015d6a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
> @@ -50,6 +50,15 @@ int dcn31_populate_dml_pipes_from_context(
>   	struct dc *dc, struct dc_state *context,
>   	display_e2e_pipe_params_st *pipes,
>   	bool fast_validate);
> +void
> +dcn31_populate_dml_writeback_from_context(struct dc *dc,
> +					  struct resource_context *res_ctx,
> +					  display_e2e_pipe_params_st *pipes);
> +void
> +dcn31_set_mcif_arb_params(struct dc *dc,
> +			  struct dc_state *context,
> +			  display_e2e_pipe_params_st *pipes,
> +			  int pipe_cnt);
>   void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
>   
>   struct resource_pool *dcn31_create_resource_pool(
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> index fadb89326999..06dd064e5997 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
> @@ -1726,8 +1726,8 @@ static struct resource_funcs dcn315_res_pool_funcs = {
>   	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
>   	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
>   	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
> -	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
> -	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
> +	.populate_dml_writeback_from_context = dcn31_populate_dml_writeback_from_context,
> +	.set_mcif_arb_params = dcn31_set_mcif_arb_params,
>   	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
>   	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
>   	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> index d73145dab173..5db96ab38dd2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
> @@ -1728,8 +1728,8 @@ static struct resource_funcs dcn316_res_pool_funcs = {
>   	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
>   	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
>   	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
> -	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
> -	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
> +	.populate_dml_writeback_from_context = dcn31_populate_dml_writeback_from_context,
> +	.set_mcif_arb_params = dcn31_set_mcif_arb_params,
>   	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
>   	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
>   	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,

Hi,

Sorry for the delay,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Also, applied to amd-staging-drm-next.

Thanks
