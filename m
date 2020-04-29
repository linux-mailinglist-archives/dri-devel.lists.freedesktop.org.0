Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39191BDF4F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 15:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411256EE8E;
	Wed, 29 Apr 2020 13:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770079.outbound.protection.outlook.com [40.107.77.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1F06EE82;
 Wed, 29 Apr 2020 13:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl9XCdybvKcfsT099dKHsc1IkUGuBpDuHR9bIjfXtzjPZvS7JqQ6l266un683PPC8pYJLXcTagV/pF5jqnioPLoTHOCzq3gVheFolPCsBtjPh9kHPLoy8Xn7SzskA1xkD4PBA86wCkGvGajIU8b1LF1RnQ1rvL/1IIYXe7YQJc8NOQM/f3SO7deS0ITMzESkQDjY02xOZftTHRD/ZRckpQOAKY6V1Bb0vAO27iXcIatFqItfQyJlV1ZXNSavO9ZcwSzv6WhM3lEkTz4YGV+yTkKiOxk08/x5zXPIpYWyvD4bYwStzAApyZ/2QuIL2gMwJaRLZ8pPbDLySy1XZsbmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvA+WSYb2dGKrEV4k4eB0Qwmh5TVFB9p0qSjaxQ7BbM=;
 b=d9zth7IxQWl8nDxIGSF0XDm7AVylAq+0y3/kW9Zn4CbqRTUuPdtQY6g+flWfknXBJwJGwLzJcMDTugnMFKY922EDFgPEeRlZtX1QgQBrnaFkVMD+ev7TrY6bTg2VVibEq9308Fn3zYrjBzx8rFeBcGoNGhr+K14Jksu6//Jt95z7x820BFqq80Rel0GMnWPBPRXZIi0xvDA0wWIlsIIr6680nsKaNhpJGewEBEbTsAZBoJlDvAiQ9J8tUSXw0pjGAm2QPoZgG69nPXl5VPwNph25kZBdjIP8y/tsedqL+Hh1MbfVffDE2LODekzRuBknXGL7uiqnhElUn9lY16XmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvA+WSYb2dGKrEV4k4eB0Qwmh5TVFB9p0qSjaxQ7BbM=;
 b=RlMBYovTGY+neSoqQ156wpeSKjnyfkSwKHO/l9x9ugZ3VBoQJObLacYZpzfzBFRRDAFt+M4HeSbkbxf3c3EbJy/nY1gKB307cSDEURCGDnFUcvbVbyqUW6v5LbivMNUhIYt3aJgBd+9VFFBaK1/Uh2dXVDFKgMr/oq3d1+6L6wg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BYAPR12MB2966.namprd12.prod.outlook.com (2603:10b6:a03:df::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 13:42:10 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::fd29:4119:9ef5:8210%7]) with mapi id 15.20.2958.020; Wed, 29 Apr 2020
 13:42:10 +0000
Subject: Re: [PATCH] [v2] amdgpu: fix gcc-4.8 build warnings
To: Arnd Bergmann <arnd@arndb.de>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200429092207.4049268-1-arnd@arndb.de>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <f9738a59-5c7d-57ad-0d56-6455d6938964@amd.com>
Date: Wed, 29 Apr 2020 09:42:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200429092207.4049268-1-arnd@arndb.de>
Content-Language: en-US
X-ClientProxiedBy: QB1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::45) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 QB1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:2d::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Wed, 29 Apr 2020 13:42:07 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd1e29af-4510-427a-768f-08d7ec431d66
X-MS-TrafficTypeDiagnostic: BYAPR12MB2966:|BYAPR12MB2966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2966DDD6A297EC8638620782ECAD0@BYAPR12MB2966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39850400004)(396003)(366004)(136003)(376002)(53546011)(4326008)(6666004)(31696002)(52116002)(5660300002)(86362001)(2616005)(956004)(36756003)(316002)(26005)(478600001)(2906002)(8676002)(110136005)(31686004)(186003)(54906003)(66946007)(66476007)(6486002)(8936002)(16576012)(66556008)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmRjgDOA6Egh1A1JhKb54UGZC103t57l0xIq09tah46E5C/3K+j3gbv9ajea+Hi3zv+eFhRv54mmitu0SQxlNZjCOnXcccEdaXIqO0OaPvl6TKtpSuORvglfL6ZadtYXr07GTnBvkVF8YBSVvttZJlgId9bs2/58BYlDszYpqgxCQHdhA2pMbdMB5dy+iqMsb4yXvMXfLlAob4/W2s6V/cFHSB3B5n+ZDmqKJPBi/E7ObveE+QDkeojJNfYepdHIhjp1VuKhWWr7IDxlTVqZ20gTFO7SCwvCwQJFUuTzaCL6BMOhd4/bpyTcCXwY2cqiZf+GUkgOxMEhbY/UntHFrZBVCpu6tyrKd+i6P7e6QyRoNSAgagVQ7O19NZZYOnv2xM7gJ5xyVphbvPExYibr+MfEmG6BpkgvgqJgHd9Jm8/0Vm/asTPuL+jiMl6eSQPI
X-MS-Exchange-AntiSpam-MessageData: JG/QF3o9eBJQAGjTNkF5PM7OoN6ydY6Fy+69Z4v54+Aw+7Uafgvq0OEdTqU/0Q0dwa3XT3pj9YTyRhg75F5DtvJzUkZ1K4cFu25tSu1fWBozDYUtMVG1GikoDuqQFQldCyBCf9xcotMAoiWZIW64c9U90Y2ijVEGp3Fla28QkczPuSXo0Ujyt6ERDqIm6lCWiGtdbZLvz2+3PIUrLhVke3BCHjYFNU7el32HE4pUwmhsWlU+4GYuay6r1RtgQrO9en8u0ILadJXy1cIa2zcpfdpjcExEqhOy6Zclspo/wXgqjMLc0FLs0wo0/Kip6T6I1kL3lTVxvduUgjwC7XmAI8apHwtxlsTh6JRkx5K7J2xxe6NK6tdrU2/KSEX1gt0BZw6GrWtLq2bIsnvLtQAKnW5AMQnC6g+vAdKz06JgSag2DyuJurcMCoDUoj1u5mQLUWlBOtSJMJT7MRxFSiASnGFSat5o92XRFqs4x0kPpu15KcTy6lktcFHEmFvZs/EfHNLYP06d2jf51SwPELvYdZYGd02KesthngkbT4c0cIKdnirhYwQk+/9rGcOJI0gymAUI2FZnFal5OK3WHqnefpv8/WWwrKb+K/dRu6LWtRd8IWh91lWXmKB77a43GOY4nBUlSdiUxBrB2mqSi5tmT5xB9qVnBNy38F3s/zMqoU1He2kujYisE+ubbzggPRTwDw3K+Jok5UErzbm+SdtjQYiiARV0JQRWAtAgHbbzQd5id8bJK5SysE/xojgsV+giZBVaazTawKfIHGGUlATPjOqgXiPUNfSAkI8SKIfzKRA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1e29af-4510-427a-768f-08d7ec431d66
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 13:42:10.2489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qvc5krEAzWrn82ERVZfMV/pNiXRTLm9ILPwvjTqdZckWAP5FaoLql8sMauWkBqaqguAz4a7Cd/eexn6JputiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2966
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-29 5:20 a.m., Arnd Bergmann wrote:
> Older compilers warn about initializers with incorrect curly
> braces:
> 
> drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
> drivers/gpu/drm/drm_dp_mst_topology.c:5497:9: error: missing braces around initializer [-Werror=missing-braces]
>    struct drm_dp_desc desc = { 0 };
>           ^
> 
> Change all instances in the amd gpu driver to using the GNU empty
> initializer extension.

These should actually be memset - instead of GCC complaining, it'll be 
clang instead.

Regards,
Nicholas Kazlauskas

> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: some context changes linux-next stopped yesterday's patch from
> applying today.
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
>   drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c        | 2 +-
>   drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c          | 6 +++---
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c         | 6 +++---
>   drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c     | 2 +-
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c         | 6 +++---
>   7 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7f4417981bff..81ce3103d751 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8695,7 +8695,7 @@ bool amdgpu_dm_psr_enable(struct dc_stream_state *stream)
>   {
>   	struct dc_link *link = stream->link;
>   	unsigned int vsync_rate_hz = 0;
> -	struct dc_static_screen_params params = {0};
> +	struct dc_static_screen_params params = { };
>   	/* Calculate number of static frames before generating interrupt to
>   	 * enter PSR.
>   	 */
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 37fa7b48250e..5484a316eaa8 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -294,7 +294,7 @@ static enum bp_result bios_parser_get_i2c_info(struct dc_bios *dcb,
>   	struct atom_display_object_path_v2 *object;
>   	struct atom_common_record_header *header;
>   	struct atom_i2c_record *record;
> -	struct atom_i2c_record dummy_record = {0};
> +	struct atom_i2c_record dummy_record = { };
>   	struct bios_parser *bp = BP_FROM_DCB(dcb);
>   
>   	if (!info)
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> index 24c5765890fa..ee3ef5094fd1 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> @@ -698,7 +698,7 @@ void rn_clk_mgr_construct(
>   		struct dccg *dccg)
>   {
>   	struct dc_debug_options *debug = &ctx->dc->debug;
> -	struct dpm_clocks clock_table = { 0 };
> +	struct dpm_clocks clock_table = { };
>   
>   	clk_mgr->base.ctx = ctx;
>   	clk_mgr->base.funcs = &dcn21_funcs;
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 9ef9e50a34fa..7cbfe740a947 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -2683,9 +2683,9 @@ static void dp_test_send_link_test_pattern(struct dc_link *link)
>   
>   static void dp_test_get_audio_test_data(struct dc_link *link, bool disable_video)
>   {
> -	union audio_test_mode            dpcd_test_mode = {0};
> -	struct audio_test_pattern_type   dpcd_pattern_type = {0};
> -	union audio_test_pattern_period  dpcd_pattern_period[AUDIO_CHANNELS_COUNT] = {0};
> +	union audio_test_mode            dpcd_test_mode = { };
> +	struct audio_test_pattern_type   dpcd_pattern_type = { };
> +	union audio_test_pattern_period  dpcd_pattern_period[AUDIO_CHANNELS_COUNT] = { };
>   	enum dp_test_pattern test_pattern = DP_TEST_PATTERN_AUDIO_OPERATOR_DEFINED;
>   
>   	struct pipe_ctx *pipes = link->dc->current_state->res_ctx.pipe_ctx;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
> index 84d7ac5dd206..dfa541f0b0d3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
> @@ -1253,9 +1253,9 @@ void hubp2_validate_dml_output(struct hubp *hubp,
>   		struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr)
>   {
>   	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
> -	struct _vcs_dpi_display_rq_regs_st rq_regs = {0};
> -	struct _vcs_dpi_display_dlg_regs_st dlg_attr = {0};
> -	struct _vcs_dpi_display_ttu_regs_st ttu_attr = {0};
> +	struct _vcs_dpi_display_rq_regs_st rq_regs = { };
> +	struct _vcs_dpi_display_dlg_regs_st dlg_attr = { };
> +	struct _vcs_dpi_display_ttu_regs_st ttu_attr = { };
>   	DC_LOGGER_INIT(ctx->logger);
>   	DC_LOG_DEBUG("DML Validation | Running Validation");
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 60ea499c1ca8..beea5e129c24 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -449,7 +449,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv14_soc = {
>   	.use_urgent_burst_bw = 0
>   };
>   
> -struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc = { 0 };
> +struct _vcs_dpi_soc_bounding_box_st dcn2_0_nv12_soc = { };
>   
>   #ifndef mmDP0_DP_DPHY_INTERNAL_CTRL
>   	#define mmDP0_DP_DPHY_INTERNAL_CTRL		0x210f
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
> index 960a0716dde5..4aae6fb333bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
> @@ -365,9 +365,9 @@ void hubp21_validate_dml_output(struct hubp *hubp,
>   		struct _vcs_dpi_display_ttu_regs_st *dml_ttu_attr)
>   {
>   	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
> -	struct _vcs_dpi_display_rq_regs_st rq_regs = {0};
> -	struct _vcs_dpi_display_dlg_regs_st dlg_attr = {0};
> -	struct _vcs_dpi_display_ttu_regs_st ttu_attr = {0};
> +	struct _vcs_dpi_display_rq_regs_st rq_regs = { };
> +	struct _vcs_dpi_display_dlg_regs_st dlg_attr = { };
> +	struct _vcs_dpi_display_ttu_regs_st ttu_attr = { };
>   	DC_LOGGER_INIT(ctx->logger);
>   	DC_LOG_DEBUG("DML Validation | Running Validation");
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
