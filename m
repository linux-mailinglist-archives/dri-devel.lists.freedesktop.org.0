Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A277ADCA2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A326E10E2AB;
	Mon, 25 Sep 2023 16:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BCC10E293;
 Mon, 25 Sep 2023 16:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+GJ2yl8kCe91CK1WvHkAja65YWZO+9+inViaybLGZHachUj1ADuHemXQ5wigr4Pgyqgo0XD+gqmOKqWJ9ADaFSUt91Qx/eKvqZFtzFTHTyFzvuFByBZTfL0U8/XYawZCJkFMIFB+A9Sknc6KX7ty/9/nyRKtq/ZcEt4LfUKOrBbWfhWEpsJG97ok7I5YB15XvzU3IVQTVvCQ56ygtEP8DicBkrgTNSL+nNIoXReIzRpwAAjimaYOlY/CVrS4XJL4EYStTDJfZ+NbPu803ZRQk16L1drcOetDp68imE6TNvReUUG+r6uF0+JxerGITUnVtx0OcsB11nDSw6IM0kdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ucQJEVc7C9j3qbbMYL762ro6CHEpqRzUTEc3YeMWt8=;
 b=Eez3H3+X6G8RF/PYecP8IA0sU2NBlsedbXTXB/S/NDmLIRrLK55SiWfTI1ft93702N/1FJ+zDCt7Nd3a8aKJBJbt8DHFLF+WskSPlCmBGzyb6qN0XmxvVD11i1sKLqUblV1ucO0p8X3NmjmrPvNghHU20j6rFVhR7qZqhGWt+rrUmZ8C8jmUw1llfPX5myY5vfG8s0WRdGxM9fQsTnBZz++jx2I011DfgcKO7X69ZjqmQEruKnhE8tQNDjlg21NDeO21JZJlnPAmAGQ0wLYOJ7HmlI3Jp6yvHidNn5gOacIui+2WYxzHEEuTja9xi5nAgq1Mvd3QF47ScCfNBg85FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ucQJEVc7C9j3qbbMYL762ro6CHEpqRzUTEc3YeMWt8=;
 b=ViX11Zhy7SNRcg7T4/3OFGoEuil0CtTgQBJ+ilIhL+LMl3N0IEoJljJrjaU1d5Pw1rSYcw8lkOy4kb8zxOgJ7eVxnFvs2Ngux7Sqk+faoaKGZAtOKVIWZ+jM3MsmZB7sMRWP9dfwiB+8NpWD7h0F4ISVQWN4WQu//71WP4S08T4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 16:03:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Mon, 25 Sep 2023
 16:03:36 +0000
Message-ID: <e05bf889-453b-4d9b-b596-4c5263254fb3@amd.com>
Date: Mon, 25 Sep 2023 12:03:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] drm/amd/display: hook DCN30 color state
 logging to DTN log
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230913164329.123687-1-mwen@igalia.com>
 <20230913164329.123687-5-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230913164329.123687-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::36) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: d301af4d-96ce-4834-acec-08dbbde0f978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3yt5aWlxbvlBDg/UzYODKmsMV2PQRYO/Xq+VKfvKlaMj/+DuySct4h3GaW17zQZDeZZb+J16h30QCbAKM8wGSlMGCAJuTzpXzipfAq0bHsmgi4D/ILi+woXQylFpa4nJtkJi1ZjQt7qN5rzJ+4JKXFs6IDJHVxvESyi/+reJOEk/b1q3F8J3G2P86iuIG1dZx56Eqky+d3qKo1zWZlpsv+MhDBfUg1I9cC5hkgTtPQL22/sIuE9eBIA8Y2++B/ehQ/qwvSM4HwuZqeRlHgzfmD5gMlCiIqwEwKAz9HH3ususVP1FEcN4Z7mo36QMMX9EOOjLd0EOdCXctjS0bqp+l2qi3F2ebSYV5YDFTVWgPhdxdljgiWZQinm0eUb5IQ/3G5wHbiuOElumzoD64Aqath0xUGPH6rcr9Xo8s4NaRSCkDSNtYMJL5bCHVBLDepxhcPYSYAy33a+9f9dA12ubG8sQkRNKtN2Z08aEXWb0vDUcWt6Iza3JtExkdelfEHtNtiwnrWrrgTVRUGiMtXTr62vfVjS9yU9ghmP7jrrCzlBSYZVT9J4q8yCy9AknXOJLBrg2+sskVDgMWJonVnlF2qfMRvyVDcvw/KsVCISqIOUV/smaMTj1ErtGJk2pUAZhFiWeLxxCpSx8nWbSJRPSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(6666004)(26005)(478600001)(2616005)(36756003)(31696002)(86362001)(5660300002)(6486002)(53546011)(83380400001)(38100700002)(6506007)(6512007)(4326008)(2906002)(8936002)(31686004)(41300700001)(54906003)(316002)(8676002)(110136005)(66946007)(66476007)(66556008)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVN5d2Jld0Zad2JubjdJWk1zbzl5VWZubEpsekF2UjA5K2pQZEdxU1ZiMWJs?=
 =?utf-8?B?NllNNXFkbFNCUUFFbUdHTnlLdzZ4eG13ckZIZTByWGhjVG04bmZmRitKS1hk?=
 =?utf-8?B?MG5aWGQ1eGlNSWxwUVg3OGk5Q1FJOWFVRUNtMGtyemc5V3J5aHFwVXRxb00v?=
 =?utf-8?B?VUJmZURCTEJiSW5WRUZOZStRV2M4aGF5UFhTd1ArQlVOdnFYcFZ2em5PK0pC?=
 =?utf-8?B?UkxvNXkrOEFPaUl1N3Bpd3l1bkd2OW5mNDJtMDdlRGpzcmM1SDB5S2FMRG12?=
 =?utf-8?B?YWIzMkptOW5rSDhwbVczZ3NSSWlUek9zVEpHZHo5YnRhZzYraDNCS2RhK28z?=
 =?utf-8?B?ODN0T29NT0tsRUpoLzVCREoyOWtxK2s2YzZqYVQ4dzVqRTRjUHdEenUvL3ZU?=
 =?utf-8?B?OVBQR2l0UjFWRkFzWXp0ci94NVpJcXR2cWFiZDBCcG91aGFlWERSY2FHR3dY?=
 =?utf-8?B?QmQ2VGhibjlQNlpHYmFRY0VsOVE1OVVWZzRhUDV1ZzJjMnRtTDNLbFlzRDJw?=
 =?utf-8?B?TWZOYUU1M0dRbVpyUVVOaEdtbVBPaTZjNEdFWjNQOHA2bVNCeDlzd0MxdkQv?=
 =?utf-8?B?eGZXSWR1azBRTW5QQ3NXYnN1d2p1WWhWcGdERm9GRk0zNGoxWjVleXpwOElD?=
 =?utf-8?B?RjNBemdKMTVoVGl4R2FnN2Z6OURicE9lUFFNSnQxYTdGeFpVV2lWOFVpd08x?=
 =?utf-8?B?U09LNEowcFVhQTlvVEJXM08rb1hqSFVEZUhpb1ZrazR4WlZQdlpSSElSMk4v?=
 =?utf-8?B?Njg1QVFzRDQxem44S0orV0o3c2ppYWdVd1dwckdsYUo1KzY0UlRPUzBVeXFX?=
 =?utf-8?B?bzFpU2lxYTlWcFZuUk5pa1JqN2hRWlpldllKd1VkcEZsM2pBT0xFaUt0ZGFB?=
 =?utf-8?B?NHM5SkpGbmFhU0h4Qk4rbjdQQkVOUzFOZS92OWJFK3d3RFN3b0pzWnpTTFZL?=
 =?utf-8?B?L2FaVDFsZEVYZms3WGJjRjd0eEpyRUhPZDA3aXFzSkJ5am50VjlVVml4K1kv?=
 =?utf-8?B?V29pSHEzcnNvRXloUnp2Q01YSDB2bU9IRVkwQnVxSkMyNnZkbmtRRThSZ3ps?=
 =?utf-8?B?c1FJOWpVaTdkT0habTc2MEpJQUdPSWVvMS9ZdjdRTE5WK2tKSmJSaWszY3hq?=
 =?utf-8?B?L1l4T1Qxa01CMFhhaVpDd3dMMXArTC9lRFJwQTRJY21rKzhZRWxPMXdQZFJm?=
 =?utf-8?B?WVYzdk0yeldtb29GZUFONVphQXllRUJYSzQxYmR0Ykc5KzFlb3pqNHh4bHM2?=
 =?utf-8?B?dTA3Mk9RSC9pSXZrTk9uNGljN2YyZWhaK2NtV2J3M01tbTN3SXlSaVFUY0tY?=
 =?utf-8?B?anFIb1diKzBONDdDN01Bb0YwU3BUdjNwV2J5Yng0TUZ0c1k0TzNMSnMwTnpk?=
 =?utf-8?B?R1pqT0w5NjZ6MlRXRjAvUGJYMnVYaUNaOGhWbHJRVDVOa01mSkRMZEhvWSs4?=
 =?utf-8?B?NlVwVzYreDFlU2lWMit0dnZkSnZTTitPWTVSRU1JcW0yMnZzRy9hcUU0YkU5?=
 =?utf-8?B?SGY4aExJVnNyNXZLbCt5bkw1RzZOZStyd2RPcVdDR3B2cm9FYWZGZStVaENy?=
 =?utf-8?B?cTJ3NEtrcHM4TllqeG85OWZ6MitsbUNEeUpKMG1STTZXQy9SY0N1TlZxYkVS?=
 =?utf-8?B?NkN5d3ltckwvMERYejhOQU1qUDIwc1B5U2VOaVZ5bWlaZlQ5bG5IRDlFdTU0?=
 =?utf-8?B?a1lxN05oY0RqS3lydk1Wd3JUTGpUMDQ1cE9iOEZEYSs0YXZEUmJpaE9BT0p2?=
 =?utf-8?B?SXZsK0hkeGtzRVJ4dVVpR1dqL1Rnb2dFZXpuNWRKa3hBZkxZS1cyb2JXU2dz?=
 =?utf-8?B?WXV0QVJvb09uTndOOXdQNXJVN01IcmhrOFJMSEYvMWZETTV2a3RBMlJldzY1?=
 =?utf-8?B?enJlcDhxcURIbThsTFYzNVVMVS8yVVJCaDRMTTYzcFdoZHhwU3hYTnpGcDNO?=
 =?utf-8?B?cnJSeHc4V0gvSEhoMkI4bkNSRHlFUkFjWUFMSVlwYU9qZWFSeXB3aXRRWFlY?=
 =?utf-8?B?OEwrYkw3RkV2YzFqc2cwYjVmVEJvcmxtaTIrNThjTXgvdllHVG9iMkRYTTg4?=
 =?utf-8?B?Y2ZmOXNxd2U3Z0NOYUdkZW5EQU1oRjFYNGFUT3RLT2MvRmZQZStVaytnRlNu?=
 =?utf-8?Q?MPZuP/QPHpY68NHpiX0DG62Sg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d301af4d-96ce-4834-acec-08dbbde0f978
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:03:36.0122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POkQ4LuofTgFKXoBgUCDejL8dYAaHB1ck+FsAIiGa8017w8pIr3Vkxb+nJReeb+6D1HygXq8tYVjcRKqOmclSg==
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
> Color caps changed between HW versions which caused DCN10 color state
> sections on DTN log no longer fit DCN3.0 versions. Create a
> DCN3.0-specific color state logging and hook it to drivers of DCN3.0
> family.
> 
> rfc-v2:
> - detail RAM mode for gamcor and blnd gamma blocks
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  5 +-
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 88 +++++++++++++++++++
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |  3 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |  1 +
>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |  1 +
>  .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |  2 +
>  6 files changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index a0c489ed218c..9255425ef794 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -358,7 +358,10 @@ void dcn10_log_hw_state(struct dc *dc,
>  
>  	dcn10_log_hubp_states(dc, log_ctx);
>  
> -	dcn10_log_color_state(dc, log_ctx);
> +	if (dc->hwss.log_color_state)
> +		dc->hwss.log_color_state(dc, log_ctx);
> +	else
> +		dcn10_log_color_state(dc, log_ctx);
>  
>  	DTN_INFO("OTG:  v_bs  v_be  v_ss  v_se  vpol  vmax  vmin  vmax_sel  vmin_sel  h_bs  h_be  h_ss  h_se  hpol  htot  vtot  underflow blank_en\n");
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index 255713ec29bb..47119ae80e98 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -69,6 +69,94 @@
>  #define FN(reg_name, field_name) \
>  	hws->shifts->field_name, hws->masks->field_name
>  
> +void
> +dcn30_log_color_state(struct dc *dc,
> +		      struct dc_log_buffer_ctx *log_ctx)
> +{
> +	struct dc_context *dc_ctx = dc->ctx;
> +	struct resource_pool *pool = dc->res_pool;
> +	int i;
> +
> +	DTN_INFO("DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode"
> +		 "  3DLUT mode  3DLUT bit depth  3DLUT size  RGAM mode"
> +		 "  GAMUT mode  "
> +		 "C11 C12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34\n");
> +
> +	for (i = 0; i < pool->pipe_count; i++) {
> +		struct dpp *dpp = pool->dpps[i];
> +		struct dcn_dpp_state s = {0};
> +
> +		dpp->funcs->dpp_read_state(dpp, &s);
> +
> +		if (!s.is_enabled)
> +			continue;
> +
> +		DTN_INFO("[%2d]:  %7x  %13s  %8s  %11s  %10s  %15s  %10s  %9s"
> +			 "  %10x  %08xh %08xh %08xh %08xh %08xh %08xh",
> +			dpp->inst,
> +			s.pre_dgam_mode,
> +			(s.pre_dgam_select == 0) ? "sRGB" :
> +			 ((s.pre_dgam_select == 1) ? "Gamma 2.2" :
> +			 ((s.pre_dgam_select == 2) ? "Gamma 2.4" :
> +			 ((s.pre_dgam_select == 3) ? "Gamma 2.6" :
> +			 ((s.pre_dgam_select == 4) ? "BT.709" :
> +			 ((s.pre_dgam_select == 5) ? "PQ" :
> +			 ((s.pre_dgam_select == 6) ? "HLG" :
> +						     "Unknown")))))),
> +			(s.gamcor_mode == 0) ? "Bypass" :
> +			 ((s.gamcor_mode == 1) ? "RAM A" :
> +						 "RAM B"),
> +			(s.shaper_lut_mode == 1) ? "RAM A" :
> +			 ((s.shaper_lut_mode == 2) ? "RAM B" :
> +						     "Bypass"),
> +			(s.lut3d_mode == 1) ? "RAM A" :
> +			 ((s.lut3d_mode == 2) ? "RAM B" :
> +						"Bypass"),
> +			(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
> +			(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
> +			(s.rgam_lut_mode == 0) ? "Bypass" :
> +			 ((s.rgam_lut_mode == 1) ? "RAM A" :
> +						   "RAM B"),
> +			s.gamut_remap_mode,
> +			s.gamut_remap_c11_c12, s.gamut_remap_c13_c14,
> +			s.gamut_remap_c21_c22, s.gamut_remap_c23_c24,
> +			s.gamut_remap_c31_c32, s.gamut_remap_c33_c34);
> +		DTN_INFO("\n");
> +	}
> +	DTN_INFO("\n");
> +
> +	DTN_INFO("MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE"
> +		 "  SHAPER mode  3DLUT mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT"
> +		 "  GAMUT mode  C11 C12   C33 C34\n");
> +
> +	for (i = 0; i < pool->pipe_count; i++) {
> +		struct mpcc_state s = {0};
> +
> +		pool->mpc->funcs->read_mpcc_state(pool->mpc, i, &s);
> +		if (s.opp_id != 0xf)
> +			DTN_INFO("[%2d]:  %2xh  %2xh  %6xh  %4d  %10d  %7d  %12d  %4d  %11s %11s %16s %11s %10s %9s"
> +				 "  %10x %08xh %08xh\n",
> +				i, s.opp_id, s.dpp_id, s.bot_mpcc_id,
> +				s.mode, s.alpha_mode, s.pre_multiplied_alpha, s.overlap_only,
> +				s.idle,
> +				(s.shaper_lut_mode == 1) ? "RAM A" :
> +				 ((s.shaper_lut_mode == 2) ? "RAM B" :
> +							     "Bypass"),
> +				(s.lut3d_mode == 1) ? "RAM A" :
> +				 ((s.lut3d_mode == 2) ? "RAM B" :
> +							"Bypass"),
> +				(s.lut3d_bit_depth <= 0) ? "12-bit" : "10-bit",
> +				(s.lut3d_size == 0) ? "17x17x17" : "9x9x9",
> +				(s.rgam_mode == 0) ? "Bypass" :
> +				 ((s.rgam_mode == 2) ? "RAM" :
> +						       "Unknown"),
> +				(s.rgam_mode == 1) ? "B" : "A",
> +				s.gamut_remap_mode,
> +				s.gamut_remap_c11_c12, s.gamut_remap_c33_c34);
> +	}
> +	DTN_INFO("\n");
> +}
> +
>  bool dcn30_set_blend_lut(
>  	struct pipe_ctx *pipe_ctx, const struct dc_plane_state *plane_state)
>  {
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> index ce19c54097f8..cfb3646d6740 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.h
> @@ -52,6 +52,9 @@ bool dcn30_mmhubbub_warmup(
>  	unsigned int num_dwb,
>  	struct dc_writeback_info *wb_info);
>  
> +void dcn30_log_color_state(struct dc *dc,
> +			   struct dc_log_buffer_ctx *log_ctx);
> +
>  bool dcn30_set_blend_lut(struct pipe_ctx *pipe_ctx,
>  		const struct dc_plane_state *plane_state);
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> index 0de8b2783cf6..58e4d7e1753b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_init.c
> @@ -68,6 +68,7 @@ static const struct hw_sequencer_funcs dcn30_funcs = {
>  	.setup_stereo = dcn10_setup_stereo,
>  	.set_avmute = dcn30_set_avmute,
>  	.log_hw_state = dcn10_log_hw_state,
> +	.log_color_state = dcn30_log_color_state,
>  	.get_hw_state = dcn10_get_hw_state,
>  	.clear_status_bits = dcn10_clear_status_bits,
>  	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> index 61205cdbe2d5..227e611f25b8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> @@ -72,6 +72,7 @@ static const struct hw_sequencer_funcs dcn301_funcs = {
>  	.setup_stereo = dcn10_setup_stereo,
>  	.set_avmute = dcn30_set_avmute,
>  	.log_hw_state = dcn10_log_hw_state,
> +	.log_color_state = dcn30_log_color_state,

Can we do this for all dcn3+ versions?

Harry

>  	.get_hw_state = dcn10_get_hw_state,
>  	.clear_status_bits = dcn10_clear_status_bits,
>  	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> index e0dd56182841..a480c1092486 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
> @@ -343,6 +343,8 @@ struct hw_sequencer_funcs {
>  
>  	/* HW State Logging Related */
>  	void (*log_hw_state)(struct dc *dc, struct dc_log_buffer_ctx *log_ctx);
> +	void (*log_color_state)(struct dc *dc,
> +				struct dc_log_buffer_ctx *log_ctx);
>  	void (*get_hw_state)(struct dc *dc, char *pBuf,
>  			unsigned int bufSize, unsigned int mask);
>  	void (*clear_status_bits)(struct dc *dc, unsigned int mask);

