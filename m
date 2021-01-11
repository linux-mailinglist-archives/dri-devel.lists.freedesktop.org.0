Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A52F0E8D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8F6E056;
	Mon, 11 Jan 2021 08:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521C66E056;
 Mon, 11 Jan 2021 08:54:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3IfjQt4K2iRU1HaeOZ+NVbPlQicIQH6HO5iWlTyvUH2DJ10rYKqAVKGrCcJIHUNnxuD5xgEOYUfpvfJOyJVjlToUfJiR+OzfnpSQy2tbNtgMJ9s8baLW7DSrkNrdwLChG4kME4hdzLFf8zVg9XjQnc6dTA8XdTLjaQK8COqMeYfUqLJuG03O94EwfyRtHc0F5EwQCh59U7GGgbBQkjI4p79Vjp3MsiovfviAGyw7fSTrVNkxHQzahT9WVTnXcQbhiRcD6mzVIAIO7cxeSt4zg9ixtPPnfA2pNp7B+/+7CbMWJXyxOdcY8NrclflnfY+oUgYbWBlq/FOq9SjFTx4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnnTru+9HHdVfv/+bZILeRJCHJSsZvO39nzlrL+QO5w=;
 b=BuxMT0XZn63K7UmGY3hPacxK5bE+qDIXAMg9fwmLgWS5JlNHbz+VdWiVBrX8QiNr9eQ2SetSEfv+G9IdEzr25Ou1L/NcFKGqSpqnykCBIA9tfkdzzLay3NBrBlMm/BW6y5EDNsB+FuVChPa0z04P1Vwo4f1F/y3DgxINxa+Z0QNHjoR+mP9xYRDNTgZyY15Ye7Ud6Ba4Sk6NovUYWcjELmOhTPHJmkL/FFTfDpPCSMNaa+bGv0m97gsYGI2FcmC1G2Re0z6Yb5fUI+9J5AeuD0H5Fwq/zG46t0glPdsNFzXKZ3fWQ8MTnVSVR7X2arG6RvtXG6W+dxfU8MEiWPIhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnnTru+9HHdVfv/+bZILeRJCHJSsZvO39nzlrL+QO5w=;
 b=vUrNIkPUSl0LVoCKGIa9Oe6Z1BcK7j/G59b/SG/GjeB+ebypA7uQzepKzMPk4A3h5GIAYO11tDDnZweuRJkYsZmbJFdaDd1+RwJItaa6iYQpz6lhHjH50bFaP1mN0LANt/I2+CKgxHtvQv/ONgNaa7O+5uvFu7tASUMAu1B+rA0=
Authentication-Results: raptorengineering.com; dkim=none (message not signed)
 header.d=none; raptorengineering.com;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 08:54:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 08:54:03 +0000
Subject: Re: [PATCH] amdgpu: Avoid sleeping during FPU critical sections
To: Jeremy Cline <jcline@redhat.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
References: <20210108215838.470637-1-jcline@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3c94f9d6-501d-271c-ca83-1cf4229cb3ab@amd.com>
Date: Mon, 11 Jan 2021 09:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210108215838.470637-1-jcline@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 08:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e816305a-a03a-4282-ded1-08d8b60e7219
X-MS-TrafficTypeDiagnostic: MN2PR12MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB440548CD339FB8431910191683AB0@MN2PR12MB4405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D9IFzT1/W4RKAwoVpXKzDHqWQ6bid+ccnCd+wwxv98ULJM9HR4ez6bUhAcc68IEKfFeEf4mVqK5ae51qPo0ZjnUxDvNTFt6SGtn8WTCbMpw/63Uqrh9GOtBFgMytGbDnL5dGjE3Ajp6OXkymcxMVLnpDNaR25ZKBFD83JdmREwxZ2YZgsd2zi+LrUMKiuzPdhmUUIqJikyZsmHt3KHLhRz6rO8ty/MGThfdtji4S3p51mUY97LK6hparGJYDr/jGfhwS6TpLAIgDYOp4XWwA20Jrp3rJaSo1o+z+uBeR1IvhrxmV0LtHa7ptAUKEfwbUAU5lTvynTiNUELHxvDwzrYTOyuDu0QxXdDIcQKgd7e6loJm8KLggZ886uRhnNNeMYFYNsUNbB8S4tKaT1cwPQNviW8t0BXaPyew6egciZo9Bq7xrzYfprToR3XMhWqm4PD8H6sl9WLU23PFuVQ5iSCIWSoHwY/PHIMblU6Htjrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(66476007)(66946007)(8676002)(66556008)(6486002)(110136005)(86362001)(316002)(186003)(16526019)(83380400001)(8936002)(478600001)(5660300002)(31686004)(2616005)(52116002)(36756003)(6636002)(54906003)(31696002)(4326008)(6666004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WERrcDYyekhRVEVFcWlpZ3hrckthd1JBTlgrNlVxRGN1VXIwTFE4RE9nT3pZ?=
 =?utf-8?B?dW11TDhFTXlkUDFwTjhXZTlnUmlCY1Bva3orKzlaSThWMkNWSjlZY0o4T25j?=
 =?utf-8?B?WE84YjNmb1lhUndaRWR2L21wR0xKRzdDeGFsOWtlTGMwQVVvRVB5T2Vlemg3?=
 =?utf-8?B?RGNnTEcydDJ1ei9ySlFMbkY1dmV3cXBlR1FwZ0psSm81QzNtVW85aytBUkM3?=
 =?utf-8?B?b3ZSMmJPVDZqNnhSNkJGVGhuM2lEODIxZWtlNlI4UFlUeGxtQ1BicjFxajVh?=
 =?utf-8?B?M0szSGFtbnJRZmtOemF3cXBiL3VkZ1NBNytxcXhzRmN2WGVPTVZzTkoxVkFs?=
 =?utf-8?B?T1JjK09vbnpEOVdmSXZQaHBFUytsUXdzNTVoNUVyOVVOYzBxMWtEcG5LTzdG?=
 =?utf-8?B?N3lUR3RhNEpLUXBReHlRbVVOMHhKM25id01hTTdiZGFlTDlxRDYyMWExd3N6?=
 =?utf-8?B?WVNPS1NPampaY2dLRFpzRWhOSFhsdGRYbkI4aTh5dUY1d1cwSWFTdCszRkdt?=
 =?utf-8?B?cG55ZnEwT0FCQzBmTWtXUTJVcnUvakZiMmJaL1pXMGIwVzYvWTZ0aEZxMkg1?=
 =?utf-8?B?UkR2RmVSbGNwVFpRcXRxYVRUZWdkc0VuaEJ1dEI0WVg3YUdYZFlma0NoRHFw?=
 =?utf-8?B?VG14SkdiWXBBVFNVdUR6L2hPTjB1Y0lDTTlvTitWcFVrSml1WVRqbkUxYXRY?=
 =?utf-8?B?WklKd3hSaGpGZ3MzNUNudWFzMnIwdmZ0bjhMUkcrZEhHU3hHSGZ4aWxWTjlp?=
 =?utf-8?B?aXJIdGdJVjNMVUxwRnZPUVhheDJWRzJ6NFdVUlozOCtpVUdPZ0ltazRXMDBo?=
 =?utf-8?B?L3U0clUzcE1kZmJiZmovQ0tCRll4Um9vbkNDRXg3c2FTZWs3RTJoY25iKzRB?=
 =?utf-8?B?ck5lNklYSEhqaW50MlJvaGNsbzdNYXBzd0hwQ3VIMm1ndk5NdmR2VVBOZjlQ?=
 =?utf-8?B?aWJ5Ym93eDU2NVkzMEJHYmJoOHd6VkgyOUJBSENtVFlaa1p3WXdYRTdhMVEw?=
 =?utf-8?B?Ym42c0lRbG9YNmVWOTlYQUN6ZVZSV1lQMVdYZ1FjcmVuTWZQMkNqRlplQnhv?=
 =?utf-8?B?UEpKWG1OeGxaSXIrLysyblpqM1h0dWtRTE0waC91ejN1NW5vaE5wUzl0QTF3?=
 =?utf-8?B?aFFkbG44aXMxeE9HbmVCNEJ3aklLdnBma0FlVW1saGlHNGMzTUtNeFhOYjdt?=
 =?utf-8?B?eDNDeHlDb1JXNkExZVdzeWg4YW5vN29tQXhxbzBUUFZZQmJoQ2sxQXRKR0lB?=
 =?utf-8?B?QWJzOVU3VGdXNm1VZnJhZmR4NWxpbno3MlA4b2R0ckVpWE92RjVNcmk3anJQ?=
 =?utf-8?B?UUZPbVRvZGk3SC82TXA3Y1hUeFhReWZ6QTdheEZJc09VQjNnRWFoaEpOdng0?=
 =?utf-8?B?c3VjWlZTNTE5YjVQZnptMUp0SGJpL1dhT25maVhaY09mQUkxWDlzTnEzeVdN?=
 =?utf-8?Q?PBWYiYo3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 08:54:03.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e816305a-a03a-4282-ded1-08d8b60e7219
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3M7IPGyIbv8L4tSLuROzZsD7/ElBhy7EwnIF0bG9Cs34fMVEkCHKV+LqNalwVItD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.01.21 um 22:58 schrieb Jeremy Cline:
> dcn20_resource_construct() includes a number of kzalloc(GFP_KERNEL)
> calls which can sleep, but kernel_fpu_begin() disables preemption and
> sleeping in this context is invalid.
>
> The only places the FPU appears to be required is in the
> init_soc_bounding_box() function and when calculating the
> {min,max}_fill_clk_mhz. Narrow the scope to just these two parts to
> avoid sleeping while using the FPU.
>
> Fixes: 7a8a3430be15 ("amdgpu: Wrap FPU dependent functions in dc20")
> Cc: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Jeremy Cline <jcline@redhat.com>

Good catch, but I would rather replace the kzalloc(GFP_KERNEL) with a 
kzalloc(GFP_ATOMIC) for now.

We have tons of problems with this DC_FP_START()/DC_FP_END() annotations 
and are even in the process of moving them out of the file because the 
compiles tend to clutter FP registers even outside of the annotated 
ranges on some architectures.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index e04ecf0fc0db..a4fa5bf016c1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -3622,6 +3622,7 @@ static bool init_soc_bounding_box(struct dc *dc,
>   	if (bb && ASICREV_IS_NAVI12_P(dc->ctx->asic_id.hw_internal_rev)) {
>   		int i;
>   
> +		DC_FP_START();
>   		dcn2_0_nv12_soc.sr_exit_time_us =
>   				fixed16_to_double_to_cpu(bb->sr_exit_time_us);
>   		dcn2_0_nv12_soc.sr_enter_plus_exit_time_us =
> @@ -3721,6 +3722,7 @@ static bool init_soc_bounding_box(struct dc *dc,
>   			dcn2_0_nv12_soc.clock_limits[i].dram_speed_mts =
>   					fixed16_to_double_to_cpu(bb->clock_limits[i].dram_speed_mts);
>   		}
> +		DC_FP_END();
>   	}
>   
>   	if (pool->base.pp_smu) {
> @@ -3777,8 +3779,6 @@ static bool dcn20_resource_construct(
>   	enum dml_project dml_project_version =
>   			get_dml_project_version(ctx->asic_id.hw_internal_rev);
>   
> -	DC_FP_START();
> -
>   	ctx->dc_bios->regs = &bios_regs;
>   	pool->base.funcs = &dcn20_res_pool_funcs;
>   
> @@ -3959,8 +3959,10 @@ static bool dcn20_resource_construct(
>   				ranges.reader_wm_sets[i].wm_inst = i;
>   				ranges.reader_wm_sets[i].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
>   				ranges.reader_wm_sets[i].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
> +				DC_FP_START();
>   				ranges.reader_wm_sets[i].min_fill_clk_mhz = (i > 0) ? (loaded_bb->clock_limits[i - 1].dram_speed_mts / 16) + 1 : 0;
>   				ranges.reader_wm_sets[i].max_fill_clk_mhz = loaded_bb->clock_limits[i].dram_speed_mts / 16;
> +				DC_FP_END();
>   
>   				ranges.num_reader_wm_sets = i + 1;
>   			}
> @@ -4125,12 +4127,10 @@ static bool dcn20_resource_construct(
>   		pool->base.oem_device = NULL;
>   	}
>   
> -	DC_FP_END();
>   	return true;
>   
>   create_fail:
>   
> -	DC_FP_END();
>   	dcn20_resource_destruct(pool);
>   
>   	return false;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
