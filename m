Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7EF7ADC9E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBA310E28E;
	Mon, 25 Sep 2023 16:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4165A10E284;
 Mon, 25 Sep 2023 16:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epz6jQPolGwOPjQaI/SekMcEMJ0juq2KRJsgv06j+eye8z9oL503vsJSpOH4kEsbxOKH5SiM/TIywOWw0/uBqvk3Uix24+0QNoSwwQb8wU8BpUAglGIDV20gjByaGMao0T1d8vFxdyXO4i6CjOAXuDiRa2RybrNFGM5txAqGU+sVaimmzypuEdpeKswd7xUR+MO31/ZvcBhwrnxyfysWZua5eBboEOPh5Qo+pyRDmgPUvF9a1oJqO7fWLyMTgo1jIjoLqL5dXa4VSlBz2G3dnGAYbz413CP8LAOoJ834+u/mUSt8V3Kh1Dp9gy2hAYrOIQL25Lt2rNPD7CU7nCAVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8hMDnQhaHhH8yMx7GAW53ZOorUk6YZfdkS+h65gNWY=;
 b=cnI19RMlGvUJvOClqETkoMt0xt+T1zH396vdVuAzqq8OeEk1EGQYe8DXhgIvlqCgAhXPJbvtSMwAHrKXL4PqBiogWbFQNgCuhyteTm4Qu8rTKc7LuhNYneuRTMJI9CaGKxnKl+JImc57K9OOf4kJccOLVlT88hAWwyo5yJF0YXWloFviVq2MkbauOy17t1Nz6lGCKYpwtmt0y5vq4jLsf4kDDbyRfZA5cQ++M8c2sqA0du0dg7ZlLr+Spxybe2XlCNUwOQpmZRmBoNqIrCv+OxuTJpB91YB02hVHwF2mntiI0mmPZlsqYFzgv6zJR+dW9UyGs4Jxf+3YC8kXwZbQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8hMDnQhaHhH8yMx7GAW53ZOorUk6YZfdkS+h65gNWY=;
 b=nbYanjqnqBoRhe00L5tl7piIzFK8eWB+a5ILRoKUozsbBwrcUwD1FBCjbxgid/rvd2B0OlFFhxAJWlZ+NQhlcRxvhH7OeRLcVWXbPeCVCBjgREr+/SSceEahCZuiBxnV2hbr5VYrOItz6q5TJ+s5i7iuFkE9ry8KAQCooCyz7Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 16:03:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Mon, 25 Sep 2023
 16:03:33 +0000
Message-ID: <c5004296-7f2b-4433-a81c-65d5672403c1@amd.com>
Date: Mon, 25 Sep 2023 12:03:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] drm/amd/display: create DCN3-specific log for
 MPC state
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-4-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230913164329.123687-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::44) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a05c73e-1118-4e86-8c89-08dbbde0f7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXw+jp8kIUVoHtFXpAjV0atgu+gFP9okEgfQeBB+qCVTQTalm2NyX3lJRwveZzAgDpjYuYY6dGnQe6YmniUpKMx3cqQA5k3LIVATjgeqVhWdyr6wOPkN/Mp/Ib9zaTZOoSohdkGddrBatTQaQNjDa33uNYDxht3fB5qn+Q5f70WV6zK5kMeQhTumdv5uKhKQeS2FV8lB9Eez+5BCEORxojyQOFmAUYvbEdvllz3Dc8S6J8YDHOVjQroBx5TteavVjfGmlJZh9H+N4nCl/dn7UIJRq56TIHJmdRuWOexSqmbd18BQy8lYm+mdcZ+IRlV7LrbnhgycM650riA6byQcizCYN7u+MCtGesfTqMtWvcrAnAl5zKFUc84utnSmiFRwY2/bVAgRbX+DKCndb7RJiyH4Z9iTLSdaRWvBRsdSk9hXRbIAIT7Ptl/iLiszYBtOExaVb265eQRVkykM14npJHhoqkUjGIrvxDq2AK5fLptwBFIy22wjj56nON6OBDjNWwsjqpvGC5pdw6BQzzvUlZkJFQDKhFzYtpWSuCC31UeULA6NWOWCU8L6shlioCR9pGomc+S7NkRkmbSFFHsMxZr/kOeRWVamifsaI/9YyiGhuJYJyuyxFjsh3wTdOig3hD2Ztovy1Sr5K71KcSqFcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(6666004)(26005)(478600001)(2616005)(36756003)(31696002)(86362001)(5660300002)(6486002)(53546011)(83380400001)(38100700002)(6506007)(6512007)(4326008)(2906002)(8936002)(31686004)(41300700001)(54906003)(316002)(8676002)(110136005)(66946007)(66476007)(66556008)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdVVS9lTmpnTVl0enFpNGN5a2ZMMG1qUnlrTFNnWnk0MkVUbi9aM3FRWGVj?=
 =?utf-8?B?REEyVEpiMlFvRGQramFma05CTDdpU3NIQ0ViSzRpaTlCSlp5NVVGWTEwWTZS?=
 =?utf-8?B?cXV3NzRVU0lES1VzU2Z2YjhzOUlhQ2hjOU5PYy93ZkxRaWZHVkIwa2txc2Ni?=
 =?utf-8?B?MGZ0d0JrblJ4VEpXcWF0T1ZaVWxCdlNuTUhjdmlPZ3lVaEFrYTRKanZ0UDZ3?=
 =?utf-8?B?QmdFeUtpcWpjNWFXTFFyM1VNb3lBMjgrcEpvSmFaYVM2d3dvWTYwOTNDLzBB?=
 =?utf-8?B?MFNiV3ZiTUlIeUpQRXBVcW5aMDlyR3FNZkNTSFprQzczV3BObGRvTE9WbHpU?=
 =?utf-8?B?c3Q1ZjE1Mk1UM3VqNG04SVF6c29hZkkzSk9uZlk2TnRKcGVFSHEvenF1Qys4?=
 =?utf-8?B?bW56VkZTeGNrRERKU0RUdmtmYk54Rlk5SGtXSEhNaGVLU3JncHFCSFdsMjBC?=
 =?utf-8?B?VzFobmtSVEZuZUFvbTZmT3A1ZkJsY1lmck9FRkdsRmhNQWZpbEQ4WXJHblVq?=
 =?utf-8?B?bzJUWTExR1FlZGtnN2VLUTRVR1pSdUdHL2RweUd6bDFYaEIxdm0wZC9YTk1l?=
 =?utf-8?B?eGlKb1JudUhQcVQ1ckxJQWJURVgvMTFKbHhGNFNIRDFEeHhibG55Z3l5QnF6?=
 =?utf-8?B?OGRkY2tCTWxLOTRHaGxWOCthdnpkVE4rTUxZS2dROTByRVM4cTcya1VUVklQ?=
 =?utf-8?B?OC9zTVRrREhBMXNxV3Y4N2pIOWlqaS9STDNpNnovL0hJcW9oMmd5b2tLTElN?=
 =?utf-8?B?UUxwdWpHOWovbUFnQ3BVcVFMTGhtYXEyS1N2SjNNZ0dOcjBsYmsxUG1Zd0wx?=
 =?utf-8?B?WVJKVnd1Z3ZjUldVUW1SL1hnYUxFeHcwbG4wb1RDeW8xcEtsMEFFc1ZzRU96?=
 =?utf-8?B?T2E5N2JBOWRVY0pQaS9WVFpzNFNKcFlVL0kvYmdHWk9GRkk4Ri9iSXRjZ2lD?=
 =?utf-8?B?ZGlIUTcyQkY1UGhpOFpzSVNmaEJRL2NYaVNBY290MVRyYnRzWm5PNU9VUm5h?=
 =?utf-8?B?aHRPeWVCbnQwajZ4ZjEvVFFhLzd4UGJ2T2grUjJRMVFIM2JBYWtCU01YQ1pK?=
 =?utf-8?B?QTZEVGhuOXlnd2VpWTltNUwvbEViSGN6dFI1bC9iaDRhaGh4ZmVlVTZML1Fx?=
 =?utf-8?B?UEN4NkM1TmxkR3NlWER2TXBLSzgxRFBCbFkwWGxLRTFjRTNxSHpRbVBhTzRx?=
 =?utf-8?B?S2hUOWdJQkZtenhOOWVFa2NqaUpJSGlhOURxNFluaUd6N0tNaFZ6cW9IZlhL?=
 =?utf-8?B?aE9YR2Q0aExsck9kZXl0Szl6Ym1JNkxFNThTQmJnZHVsb1pxam42Q1NMemVO?=
 =?utf-8?B?WitmelNSdkx5RmlHc09VWUJhalphL29WNnMzczBJN2VzOFFEVkdSTDFCNFhv?=
 =?utf-8?B?VDhYejQ3L2hOdFNodVRnQnBDempGd3JDUGxwemVacVQ3OFdNcUEyeXlGWUp5?=
 =?utf-8?B?TzNkOWlIRUlkQ29OUjBhaVVLL3FHd0FMRzExNnE5SFgyRnNNeWxiRG1hSWxW?=
 =?utf-8?B?OG9HQ3EyYVUrcmNmWG02TWdNNWlSZnUyYjNhS2p3dHlOdGZxOUZ1allsc0Z0?=
 =?utf-8?B?QXN4ZWNNbklURWhPZkpGa1BUdjcrcTFkSUY3WXhNNVB0dlZ3NmFNb3p0djNj?=
 =?utf-8?B?ajNia3NHekJleE5xRjJqWjEwclI5NzBUaGRNMTlSOVp0UVZTbTF4dTA5b1Bp?=
 =?utf-8?B?dnpZQUdpcnA1UmJNL0JpQmwyRkhDemwwWDE5TEdEV2g1NGgrZE5zZ0cwTyty?=
 =?utf-8?B?QjNnemR0Wklka1dNMStkNHE5SHJ4bDhTb0E1eHdjSjl1eEZJelNPN2R6cjdp?=
 =?utf-8?B?VmdDVlpSSXJmSnJFRndIQ0JMLzM5Uko0VzR1emhtWVB5UVFYZEY1QkEyb0sz?=
 =?utf-8?B?R0hPR3RQVUhsRyt4UytsNFZXb0xyZkRyWVRlaXZWUXlXVTNZVDM1TDBoNkJM?=
 =?utf-8?B?Umw1WkVDV09WUVk4c0p4dld4eUNUMkJ3aUFLMDlKd3ZKMWs1b3lNb3draFUy?=
 =?utf-8?B?eldzdUtmSXNsc3dFZGJTNEFYS1F2cjJtMWVNbUJXMkdqdVhQZ0FyUnR2dWJs?=
 =?utf-8?B?R3FzZ2xYRnNmWEtKUHRaeVpqeEhxL2RuTVhvNm1MU21pandWaUNaUld2TnU5?=
 =?utf-8?Q?335ILeZoxoBC3uJFX6ebLuOUH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a05c73e-1118-4e86-8c89-08dbbde0f7d7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:03:33.3976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5uaODnWQmtRwA4FUYk/dZgiSc3yhvm0/bY+4xnhx/SSoyh2LDiKrY4S42ec4U/yiFuG3S246RaHdag8hdpCvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-13 12:43, Melissa Wen wrote:
> Logging DCN3 MPC state was following DCN1 implementation that doesn't
> consider new DCN3 MPC color blocks. Create new elements according to
> DCN3 MPC color caps and a new DCN3-specific function for reading MPC
> data.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 55 ++++++++++++++++++-
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 13 +++++
>  2 files changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> index d1500b223858..d164fbf89212 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> @@ -1382,8 +1382,61 @@ static void mpc3_set_mpc_mem_lp_mode(struct mpc *mpc)
>  	}
>  }
>  
> +static void mpc3_read_mpcc_state(
> +		struct mpc *mpc,
> +		int mpcc_inst,
> +		struct mpcc_state *s)
> +{
> +	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
> +	uint32_t rmu_status = 0xf;
> +
> +	REG_GET(MPCC_OPP_ID[mpcc_inst], MPCC_OPP_ID, &s->opp_id);
> +	REG_GET(MPCC_TOP_SEL[mpcc_inst], MPCC_TOP_SEL, &s->dpp_id);
> +	REG_GET(MPCC_BOT_SEL[mpcc_inst], MPCC_BOT_SEL, &s->bot_mpcc_id);
> +	REG_GET_4(MPCC_CONTROL[mpcc_inst], MPCC_MODE, &s->mode,
> +			MPCC_ALPHA_BLND_MODE, &s->alpha_mode,
> +			MPCC_ALPHA_MULTIPLIED_MODE, &s->pre_multiplied_alpha,
> +			MPCC_BLND_ACTIVE_OVERLAP_ONLY, &s->overlap_only);
> +	REG_GET_2(MPCC_STATUS[mpcc_inst], MPCC_IDLE, &s->idle,
> +			MPCC_BUSY, &s->busy);
> +
> +	/* Color blocks state */
> +	REG_GET(MPC_RMU_CONTROL, MPC_RMU0_MUX_STATUS, &rmu_status);
> +	if (rmu_status == mpcc_inst) {
> +		REG_GET(SHAPER_CONTROL[0],
> +			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
> +		REG_GET(RMU_3DLUT_MODE[0],
> +			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
> +		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[0],
> +			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
> +		REG_GET(RMU_3DLUT_MODE[0],
> +			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
> +	} else {
> +		REG_GET(SHAPER_CONTROL[1],
> +			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &s->shaper_lut_mode);
> +		REG_GET(RMU_3DLUT_MODE[1],
> +			MPC_RMU_3DLUT_MODE_CURRENT,  &s->lut3d_mode);
> +		REG_GET(RMU_3DLUT_READ_WRITE_CONTROL[1],
> +			MPC_RMU_3DLUT_30BIT_EN, &s->lut3d_bit_depth);
> +		REG_GET(RMU_3DLUT_MODE[1],
> +			MPC_RMU_3DLUT_SIZE, &s->lut3d_size);
> +	}
> +         REG_GET_2(MPCC_OGAM_CONTROL[mpcc_inst],
> +		   MPCC_OGAM_MODE_CURRENT, &s->rgam_mode,
> +		   MPCC_OGAM_SELECT_CURRENT, &s->rgam_lut);
> +	REG_GET(MPCC_GAMUT_REMAP_MODE[mpcc_inst],
> +		MPCC_GAMUT_REMAP_MODE_CURRENT, &s->gamut_remap_mode);
> +	if (s->gamut_remap_mode == 1) {
> +		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_A[mpcc_inst]);
> +		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_A[mpcc_inst]);
> +	} else if (s->gamut_remap_mode == 2) {
> +		s->gamut_remap_c11_c12 = REG_READ(MPC_GAMUT_REMAP_C11_C12_B[mpcc_inst]);
> +		s->gamut_remap_c33_c34 = REG_READ(MPC_GAMUT_REMAP_C33_C34_B[mpcc_inst]);

Any reason we're getting (and printing) only the first and last
coefficients? Is it to avoid printing lines that are too wide?

Harry

> +	}
> +}
> +
>  static const struct mpc_funcs dcn30_mpc_funcs = {
> -	.read_mpcc_state = mpc1_read_mpcc_state,
> +	.read_mpcc_state = mpc3_read_mpcc_state,
>  	.insert_plane = mpc1_insert_plane,
>  	.remove_mpcc = mpc1_remove_mpcc,
>  	.mpc_init = mpc1_mpc_init,
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 8d86159d9de0..e60b3503605b 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -193,6 +193,19 @@ struct mpcc_state {
>  	uint32_t overlap_only;
>  	uint32_t idle;
>  	uint32_t busy;
> +	uint32_t shaper_lut_mode;
> +	uint32_t lut3d_mode;
> +	uint32_t lut3d_bit_depth;
> +	uint32_t lut3d_size;
> +	uint32_t rgam_mode;
> +	uint32_t rgam_lut;
> +	uint32_t gamut_remap_mode;
> +	uint32_t gamut_remap_c11_c12;
> +	uint32_t gamut_remap_c13_c14;
> +	uint32_t gamut_remap_c21_c22;
> +	uint32_t gamut_remap_c23_c24;
> +	uint32_t gamut_remap_c31_c32;
> +	uint32_t gamut_remap_c33_c34;
>  };
>  
>  /**

