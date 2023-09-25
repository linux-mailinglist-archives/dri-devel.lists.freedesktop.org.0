Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5CE7ADAB3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B2810E26C;
	Mon, 25 Sep 2023 14:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F70B10E25F;
 Mon, 25 Sep 2023 14:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvEDfF1OizrS/QOGSHZ601Wru+cBHojB0UXP0Y2k9n5WyEJQ7IX0lXEBthgyHUyinWoEBUgU5uK+1rz/L9QhhX+Meom52+aI2yhWPVK3Fh3Pyoom1CYYedXswC89EuLE35yWZaifLiH+HuehL10sAf8EKbxdolOaFzo9C6tFUY/Ls/H++UoQ7C/134fN7/VZSDwgoj9lQvSDWb2ocVnMrB4z/AeRvxUEKs1sysCPV/uIZiwOzT5U8jfBXPDMwMBnLo3Vn77P0VA01TREZxMYZcklMcZFh/HhzikI86XZIcRT2qqfgdqGY1oU+h/fdLNbmbKE5R/ofB4Rc5xzk7NCWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6rz4AffK5ZPF0NWyzL//o9SVTGisa+5XBk1ebOUPcE=;
 b=D0NQpyEGsOxiJxaY2yxf1G6SMHNNAKi+gPXffiRViVFRnpYmvh52bIr2F2ws+eCI+3cETCuSGfSTVjYa6X1rgYydT3Y3+abIBNN8RVt6o/62vE/kp0cfiqvO12KC1DV9uF9t2g8ahyyhnMVRr3W+Pwx8kngK/3BmDW78YEGwaPkT9N8k+eJZ5S9p8M3+tUUzvwEWNVkxCmCR03RlbqFyRlSdGfQ7MdcHcIeuewvnGZw2luW2N3wENDi6e+NmjykvFW3SFsL3s0x6MZJMaasRux/T59+u7me7Vj1Gb3qUGPEcLAtcHT5TiDoPw3Q7/wxUAl/6jpQiZ6SgtvZswNE/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6rz4AffK5ZPF0NWyzL//o9SVTGisa+5XBk1ebOUPcE=;
 b=0FZiSj/FWKp3AeIPdcPR7F5kllWVmGWhm580I1MyNx3jZzUv6Yns8nNSoo9HwiaFHmgtlDDnEVYJgGxbYS9fTf9LAdRzxEkwLMarKo1zLIcujQ+TuAhg0J8Cks/QnZgtcdsFL1KB8Z/cLNvKaHtgpwBHsKXteX/vkYjM0ZubsoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 14:55:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Mon, 25 Sep 2023
 14:55:26 +0000
Message-ID: <9276b01c-8b52-40ad-8ce5-39a8824d340b@amd.com>
Date: Mon, 25 Sep 2023 10:55:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: set stream gamut remap matrix to MPC for
 DCN3+
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230721132431.692158-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230721132431.692158-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 168f8938-dc8f-466f-f33b-08dbbdd773d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBcn4qwkfeSgLuxqIxa+gC1cWxeUlkThO3jgsNhPKKl6xeSbNOrGsbvhmsKUMDiBAkpy3YL2lmVmAaLRcw2+hWnSyRHc3Kwliy1EGd+YGGhwtfPiVa1vFx5frdB3Vbk5Y4V315wBUL7pfBvzuU9BcqUlIlhDol7k/ESaleMX41Q4flktoNggoCTnswLEIxlYcqlZTt1dxB6cIreoxAWXZr8NOCL7IXrRNesfcUjP61PY88i0IaPkt8jkbLgrfMSUjoUr6jSrNim4LVzlbZuO1Yg96qZJGr1S+wJaC55FLh0wtDYiVr6Y4kZZmYaZgEelElM55X1bOcGOsEhoxGaEXMCYPqcv9fNKD3OH9OmpPSnz9CuxFn3MdEuASpsOl0t+4e5om7MnPnLw5Z8+Ombuv5PyMXwRaeACdHXtcHUJE7Bqzv2r2HDjB+RP6zjwrZQTakyB+HBBqOSW6s8jpLcEi6QlGwC0iApo8Apt/6AeU+CmsFxwrmBMh0nDRer/aNzGqEqM+Rxog3cOasAuPVX4YOyB/0UaV8KAc9FlC77cmhbfz9E+SDB03FUUY1fDv3MHTdMuOwGM+3PaA1eqTRA5AxjuEMnPtTLd43hk9AHtqgkaAjy8txuJLX/7Rnhau1AzOL4qhWlTfhJE4NsqJCIGlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(36756003)(38100700002)(86362001)(31696002)(31686004)(53546011)(6512007)(2906002)(2616005)(5660300002)(66476007)(478600001)(41300700001)(316002)(66556008)(54906003)(66946007)(44832011)(6506007)(6486002)(6666004)(83380400001)(4326008)(8676002)(8936002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTY5dFA2cDdEekRpbTEzdUJwZ1B6SzdFN2xSOXFQcGoyWHliQWMwLzQ4WktD?=
 =?utf-8?B?bFhkWWFQRklGdC9FOGZXZ1hUcjkxSHVEREpKck43UDlPMGhnUHVWTUZTQVQ4?=
 =?utf-8?B?eStqUnAreFgrUFFWK2hkaUViUkFITC9uVm5aY0F5VitrbEFqZndMMXB4dkxQ?=
 =?utf-8?B?TkUvV01RT1VkM2VGR1lnRGRRQk1DaFE0NmNOVDkxeDBEUUE5c3VPTkI1amhR?=
 =?utf-8?B?MFR6eGJBa2k2dmJmczVuVGJPNi9ISE9qS1ZFeGoyTnhPS25KMXB3dUpEWVA1?=
 =?utf-8?B?K1hSSlN1SkZTOE9XS3B0TUQ5bEVqelFUeWNVYmxPSFlJa3BZV01Qbzc1eU5L?=
 =?utf-8?B?Q2hqTDJGcGtHZGEwN0VicVdNQWFsNnZOT2pneVF3WlhTbC8xc3RwRWNqTFBj?=
 =?utf-8?B?anRWOVF4ZUhWQWNEbWQ2K2lzdXJqVURreTZocm1WT2R0aENCczdZcVhJVUJO?=
 =?utf-8?B?NEEvSFVmNU8xa1gzd3NBMHIwVEtYNEI0RzhkbE44dmR5M2ptYStFQWVPWDhX?=
 =?utf-8?B?NDNDZG4yK1RpRGVTQ2NxTTNldk9rLzdoV2hJdS90ckpJU3RZN2Q5VFBISTRx?=
 =?utf-8?B?VHN5QnpiUjFmcTJFM2pVUk5NaHMxRjJ5eXVTNDY1VmYwZml2VUF6L0hPWjNn?=
 =?utf-8?B?eWxmWDlOZXJSWUhVWlljbWpTdTA5QnZtSTN2aDFBYUxJc0JncmpTdVZ6Y1lW?=
 =?utf-8?B?SEtlZmZ6MVhkcXQ4NE1zZ3pHcFgrZmFha21KL1VBd3ZRQlBYQ1QxLzc0eHBx?=
 =?utf-8?B?VW5UWTY5RHpITTAwMGY1Y2h2UGkzQk5COFlzVldXMkZBS2VIM0hSRlc2WWtn?=
 =?utf-8?B?UnVzd0Q1cFc2V250UW1RVXBqVk5iSDVEV0U0ajYza0xNT3cycG1lUWo1cUVz?=
 =?utf-8?B?cUZNNHF6c21FZlZaSUkwK3JjZjU3amFRRXAzVmVDbmtvb1kwVlRheU1kTkNU?=
 =?utf-8?B?YmsvQit4SkRnWHc2azQxNTI1S3hQSSszVEl1QkZpa0pWdGMvRDd6MEVZRnhN?=
 =?utf-8?B?eldRTWVscEhHTTd1cEFrc0xkWFpEdmd5S0F4OUVweUhvTG1mMkxFdTZ3V29G?=
 =?utf-8?B?UW4xZDJwV0NmdGRTK05BdmtpZ21nR2d3ZVZWRFdGVkJ0czJDajNBZ040eEdq?=
 =?utf-8?B?OU5vVmR0OUk1MlhEdURLamJ5QkRtY3RsL0xYSUtIYjh3bkpRdTRYNWF6bXNS?=
 =?utf-8?B?TVBmOGZycUUyenF0eFdWclN6NTByUmdvOXJOc0RlMzg5Z0dLUldBZmc5Wkcx?=
 =?utf-8?B?eVUvNmxLdGoxSnFvUU1ZRkoyWHJ6OVEwMzJLNXBCd0JUUElqNDNMakEwU05P?=
 =?utf-8?B?MWlVWHgwcDJXN0ExL3lrOWRpVXRpT0Z1UENGL0xFYTNaajFRdVhQdnpUc1Av?=
 =?utf-8?B?R01hUmN2TlhMVHc2OVZYUXFuWHB4U05xVEFQMHZBVnIzZUh1ZnM0Ykk5eGlt?=
 =?utf-8?B?ZnlUYUV3dzRPbHF1T3NFZDl1amRISkI0SE11RDJBWlcybGc0SEtTNjY0UDVt?=
 =?utf-8?B?OWhBTzFKTWdCOStBQmpHT3k0NGJ0clNrK3RzUnNhcHJOSDVVSXl0YThNNmUz?=
 =?utf-8?B?YXV2Znc4cUZlRHR1ZGxQRW9OQmVZRDc0WERNY3kwUmM4R1VwdnMwYUtlcGFo?=
 =?utf-8?B?cmx3Mm9sakhCeFdIU2RPZGlPOVc1UDhDVTJxc0ZMOHBSQVVpckpFSkkzZTl1?=
 =?utf-8?B?TmsvRWRLZHdzVVM1T0hHU1crYVdZVElhei84V29xbFlyaS9rQStrTXEwa29I?=
 =?utf-8?B?WEE3d3E3NzZiek51ZnBKbE91WW1zWFM0cVlHUmRDVk5BclNiZjNYVHd1dWxi?=
 =?utf-8?B?Z2VNY3l4bU9hdEhQQlFDNzBTNFNSQlJoaW5DOCsrZS9McWpBNm5CaityMTZ1?=
 =?utf-8?B?ekt4QXdnbzhYK3Z6NFgwTlNZWVFWZnNMK1hvdFN0RTV6ZDBna09tL0duckdT?=
 =?utf-8?B?N3VxQnppUWtHdXlwdWZha2ZuU3JURVpXbkdBS2pZWE8ycFIwWjhRNXhKVmJx?=
 =?utf-8?B?SDhUK3dyVVpUSUkwZEMydVpWRlRrK1pJRWRvajk5MXpEWGdIcm00RHNkdTRN?=
 =?utf-8?B?U01TREN6OS9GMGw4ZlYvdzdxeHRJdlRQZFMwbVBMQXlTVVErTzdoM1NENkJ5?=
 =?utf-8?Q?EzRVgjAUkkqJ/wFH171NSk1uj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168f8938-dc8f-466f-f33b-08dbbdd773d5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 14:55:26.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oz6jw5E+viY7Ydkriwlsp92qkqqj8LGg4oDpFIjiu79ihMIGr4wbd0ShikKgxqICf9+vFRfNf5Y76k/4JecFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, bhawanpreet.lakha@amd.com, Nicholas.Kazlauskas@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-07-21 09:24, Melissa Wen wrote:
> dc->caps.color.mpc.gamut_remap says there is a post-blending color block
> for gamut remap matrix for DCN3 HW family and newer versions. However,
> those drivers still follow DCN10 programming that remap stream
> gamut_remap_matrix to DPP (pre-blending).
> 
> To enable pre-blending and post-blending gamut_remap matrix supports at
> the same time, set stream gamut_remap to MPC and plane gamut_remap to
> DPP for DCN families that support both.
> 
> It was tested using IGT KMS color tests for DRM CRTC CTM property and it
> preserves test results.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

and merged.

I also took the liberty to expand this to the recently merged dcn35
code.

Harry

> ---
> 
> Hi,
> 
> Two relevant things to consider for this change. One is that mapping DRM
> CRTC CTM to MPC is a more consistent way since CRTC CTM is a
> post-blending transformation. Second, programming stream
> gamut_remap_matrix on MPC enables us to provide support for both plane
> CTM and CRTC CTM color properties. If we don't make this separation, we
> would need to reject an atomic commit that tries to set both properties
> at the same time and userspace may also get unexpected results.
> 
> Thanks in advance for any feeback,
> 
> Melissa
> 
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 37 +++++++++++++++++++
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 ++
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |  2 +-
>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |  2 +-
>  .../gpu/drm/amd/display/dc/dcn31/dcn31_init.c |  2 +-
>  .../drm/amd/display/dc/dcn314/dcn314_init.c   |  2 +-
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |  2 +-
>  7 files changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index 4cd4ae07d73d..4fb4e9ec03f1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -186,6 +186,43 @@ bool dcn30_set_input_transfer_func(struct dc *dc,
>  	return result;
>  }
>  
> +void dcn30_program_gamut_remap(struct pipe_ctx *pipe_ctx)
> +{
> +	int i = 0;
> +	struct dpp_grph_csc_adjustment dpp_adjust;
> +	struct mpc_grph_gamut_adjustment mpc_adjust;
> +	int mpcc_id = pipe_ctx->plane_res.hubp->inst;
> +	struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
> +
> +	memset(&dpp_adjust, 0, sizeof(dpp_adjust));
> +	dpp_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
> +
> +	if (pipe_ctx->plane_state &&
> +	    pipe_ctx->plane_state->gamut_remap_matrix.enable_remap == true) {
> +		dpp_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
> +		for (i = 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
> +			dpp_adjust.temperature_matrix[i] =
> +				pipe_ctx->plane_state->gamut_remap_matrix.matrix[i];
> +	}
> +
> +	pipe_ctx->plane_res.dpp->funcs->dpp_set_gamut_remap(pipe_ctx->plane_res.dpp,
> +							    &dpp_adjust);
> +
> +	memset(&mpc_adjust, 0, sizeof(mpc_adjust));
> +	mpc_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_BYPASS;
> +
> +	if (pipe_ctx->top_pipe == NULL) {
> +		if (pipe_ctx->stream->gamut_remap_matrix.enable_remap == true) {
> +			mpc_adjust.gamut_adjust_type = GRAPHICS_GAMUT_ADJUST_TYPE_SW;
> +			for (i = 0; i < CSC_TEMPERATURE_MATRIX_SIZE; i++)
> +				mpc_adjust.temperature_matrix[i] =
> +					pipe_ctx->stream->gamut_remap_matrix.matrix[i];
> +		}
> +	}
> +
> +	mpc->funcs->set_gamut_remap(mpc, mpcc_id, &mpc_adjust);
> +}
> +
>  bool dcn30_set_output_transfer_func(struct dc *dc,
>  				struct pipe_ctx *pipe_ctx,
>  				const struct dc_stream_state *stream)
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> index a24a8e33a3d2..cb34ca932a5f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> @@ -58,6 +58,9 @@ bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
>  bool dcn30_set_input_transfer_func(struct dc *dc,
>  				struct pipe_ctx *pipe_ctx,
>  				const struct dc_plane_state *plane_state);
> +
> +void dcn30_program_gamut_remap(struct pipe_ctx *pipe_ctx);
> +
>  bool dcn30_set_output_transfer_func(struct dc *dc,
>  				struct pipe_ctx *pipe_ctx,
>  				const struct dc_stream_state *stream);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> index 3d19acaa12f3..5372eb76fcfc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> @@ -32,7 +32,7 @@
>  #include "dcn30_init.h"
>  
>  static const struct hw_sequencer_funcs dcn30_funcs = {
> -	.program_gamut_remap = dcn10_program_gamut_remap,
> +	.program_gamut_remap = dcn30_program_gamut_remap,
>  	.init_hw = dcn30_init_hw,
>  	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
>  	.apply_ctx_for_surface = NULL,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> index 257df8660b4c..81fd50ee97c3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> @@ -33,7 +33,7 @@
>  #include "dcn301_init.h"
>  
>  static const struct hw_sequencer_funcs dcn301_funcs = {
> -	.program_gamut_remap = dcn10_program_gamut_remap,
> +	.program_gamut_remap = dcn30_program_gamut_remap,
>  	.init_hw = dcn10_init_hw,
>  	.power_down_on_boot = dcn10_power_down_on_boot,
>  	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
> index fc25cc300a17..4e724d52a68f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
> @@ -34,7 +34,7 @@
>  #include "dcn31_init.h"
>  
>  static const struct hw_sequencer_funcs dcn31_funcs = {
> -	.program_gamut_remap = dcn10_program_gamut_remap,
> +	.program_gamut_remap = dcn30_program_gamut_remap,
>  	.init_hw = dcn31_init_hw,
>  	.power_down_on_boot = dcn10_power_down_on_boot,
>  	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
> index ca8fe55c33b8..01e03ecf2291 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
> @@ -36,7 +36,7 @@
>  #include "dcn314_init.h"
>  
>  static const struct hw_sequencer_funcs dcn314_funcs = {
> -	.program_gamut_remap = dcn10_program_gamut_remap,
> +	.program_gamut_remap = dcn30_program_gamut_remap,
>  	.init_hw = dcn31_init_hw,
>  	.power_down_on_boot = dcn10_power_down_on_boot,
>  	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
> index 777b2fac20c4..625008d618fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
> @@ -33,7 +33,7 @@
>  #include "dcn32_init.h"
>  
>  static const struct hw_sequencer_funcs dcn32_funcs = {
> -	.program_gamut_remap = dcn10_program_gamut_remap,
> +	.program_gamut_remap = dcn30_program_gamut_remap,
>  	.init_hw = dcn32_init_hw,
>  	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
>  	.apply_ctx_for_surface = NULL,

