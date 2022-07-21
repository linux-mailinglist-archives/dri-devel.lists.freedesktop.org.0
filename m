Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EE57D3B6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 20:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CBF1131CE;
	Thu, 21 Jul 2022 18:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD06112A82;
 Thu, 21 Jul 2022 18:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLDrXeuMg73ps0Ejolqd7wEANcQogOWVPfvufGktifP5JTyn7d6mg8vlx00bpccVWAO2bQxXdaYmTmxULsVt7HmUSz1AlmWpZeBy0brDO21g6m8Tpx3GzNd4RtDzywZ7p/AMd2regQU5aUVSb2vTsBp8NbKBNsCCrXp7Cghy1zL2q04KnVtF56u6P4uE8BsYgEzKq5TdwuVvjbblwvznWwEbbFtfWbrJPS/+n89k/deY/ge7b751NLbyP85R3Kif61w0i9vyXGzFjCLfTHdR7R7saxGZtwfq8h4uJUTwZmQTuznuVTNzVuJvFUkAe0933BivhEvAW3HV+MWICUi/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDshuuGsk/POBEC43ZIS2vYIyuqfux+YfqPsGUxK3ko=;
 b=Uim6ybeSSPw0cGgnEYHu5qkdO1YFHgcNSiT5Idx9Z4trs4HNh30SpjhMpXRKeVXXwLV4THy5cTEtff6/kVXWBMHGdwsxvIFY0+TxLotIu4PnARGItGi1vbkDV8WxFe7bwlpkA2w2vsT2wwtFLb3Iwz9LB5EjYns/K57R47kZER59oUKE/ZKqwrmOIcmGNwlIthTuFtukmgm8fSsC1Sn1pFTLv4lyICVw7OIJ1iuYe1WohIz85OuP/VFOFpCxtxBInCrBU9xX4joUXXrAtjso/8ELFE6tfpbTFBvIggf5KN83rXP8IXvMA91ADV4hMzq5eBOHwRkkEl4KXmgqmaSfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDshuuGsk/POBEC43ZIS2vYIyuqfux+YfqPsGUxK3ko=;
 b=qpuwOHi2mba/St/ikwLLC9mssuy4+LoeMkLAvNZCLBT0qnqTbyMXg0OGfQwfzg/baXbLEzx4xgy6NE9fWdaq7JOUpSMT0FWbiHWKq+MVFJ8rMpuInkDMrZhdkNH4vmcguzMNjABSHeNfquj2fHOjw9nnpYP54eV16NfTTvGH4as=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by MN2PR12MB4567.namprd12.prod.outlook.com (2603:10b6:208:263::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 18:57:37 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 18:57:37 +0000
Message-ID: <199c41a1-1034-db1d-c63a-eb43dd07871a@amd.com>
Date: Thu, 21 Jul 2022 14:57:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] drm/amd/display: move FPU code on dcn21 clk_mgr
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220720193208.1131493-1-mwen@igalia.com>
 <20220720193208.1131493-4-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720193208.1131493-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:610:e4::18) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5fe5528-f916-4f2f-a68c-08da6b4ae111
X-MS-TrafficTypeDiagnostic: MN2PR12MB4567:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IsgGEclk/+qL/6aDNA8TeaefucF7U8Fc17geWRq8FNYb6sJKBNjDu2apez9WSqxOnm//gDzagVaxJAokrkM9Yk1tuh30flzA74sGRgswZ+um0R9VDe+HiAz0Y3sK9RuyC/yZIJc/+aG+KUTPU1E+1oFb7B3ZmTMq84Eo3KQUiPNAPPniwt/PrPm9nnEX0rBfXBo01RqA65ZKLQSa32EFKANeireoYEU99bEg+nKfaEe9s0kRdCBKArN8Psz/N/slwGrKHI04dp2i/eaxkDQZsdyg9FltPym2f6aZkj1ZIIjZW7IxwtGBTFWW6qJCeY78PEE5d7pqSxSNljSWVvLsVWmEcQWpzbpZSiWEUc2Zh78VBs6eTwED41nGUXCbXByImNrKt6KSfi15v8V40DD1K7gAdZ1JiqAJA+S5I0MXeNAfiCfM2LTDR/sR36j6l5j/MC/S0VHdakufTR8LIXpy4AO5NajZfvP1PWCBVzoKtmP/QoMUFYMewTiNjsdF6cCdljvsIZaBDYqThncCElLLmRCJbhOxFu2naIwIHUZCPUVw42qlyhEuhtfMvTEnOU+fhIleDC4vXIpaKjBvWChxeAMYmnyAWjJPNGSMvnAuBM2eRD3CfMMQ23dbg39XkiQZls8VoQYyXvk9/afcB/xPnZ3dr4OR7pna3yPVjM/9pRQrdyBsLUR4RAUb8W4BiE/gzK5XzdUPb478hZ51utlBZJALpLvtMj01taVLZC3WRrZY/56Qxn7+bMUJMtSDl1GbRR+IMVaEvtAAvqUu8ClR9/D2tK3iOmmiS28KkeP9Ur/COa+h8sSmElkXmFDEHBsyqQcAr/8ShcRAzsqo5CtvtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(30864003)(36756003)(66946007)(8936002)(2616005)(66476007)(5660300002)(66556008)(4326008)(2906002)(6486002)(38100700002)(31696002)(86362001)(478600001)(41300700001)(316002)(8676002)(186003)(83380400001)(54906003)(53546011)(6506007)(6512007)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b29xVm1LT29PL3FKUDlVWkJSY0FOUytadzlDUGx2SnpKVko3YVZnVmxLSkY2?=
 =?utf-8?B?THBSL0dOSlcxUWtoTTBnYzJJckxOamFSM0wrMi8zUVFwbWpMQ1dvU1NrQU55?=
 =?utf-8?B?SVhvTTVaSCtNclFzdkczcnJKbG9lY2VTSUlWR1V3Vlk2ZVB1djlqc2lpc2hG?=
 =?utf-8?B?NUM3OVNmdVU3QlBubzhqSzdLY05IRW5HdDBYNVlaN2MzNzR5VWZUWTlpU0RL?=
 =?utf-8?B?UlN1L3RGS3NtN2taUnVKalljaEtyVldOUmdnU2xsdW9oaklFWTdhN3d4UzZY?=
 =?utf-8?B?UkMrL2lBdGVpTUhiQ1VvWWdhb2Y1ZmJqVTYwUDB2NEZsdnIweSs1WXNaUGw1?=
 =?utf-8?B?QWM2M1FZdWRuMVpvRXpTdlBaRTU5T0FZclBTdDZrTk1oQ1JSb1NteC84Nml5?=
 =?utf-8?B?alJTaGo1SG5TNXNCWEcxQnR6a0JVUTlRa3c1eFR6UlhPTERpNm01QUNHZDE1?=
 =?utf-8?B?NG1qdmRpUXVKTEhpR3loYkNYWVA5eStGbU9xWlhLeHUrL25wRkFUSnBqT2E0?=
 =?utf-8?B?RGxHY2RBMlRXVmQ5amU5MzhUSGY5RXBBOGtHUWJGZDZGaXhyZVJGM3ZKMmx5?=
 =?utf-8?B?d0liMmFZWTN4U2Z3ckQvTFZjNGpYNjR0U0c0bmZUdzE5bG9uaDQzaSsrd2da?=
 =?utf-8?B?QXNpSzR2TVozNy9KSlNaTklWOHhuNHdxU1pSUDVSV1FVV1gydTM5SHFkWGk5?=
 =?utf-8?B?eHp5bk9tWTBpcXhuTEo2QVlXcnJCSWEzdFNUMm45SVoyR2pYZUlmWCt0OG50?=
 =?utf-8?B?QmZqNnNHcFFkMUEwRnZleVNZditreThiMUFYczJWY0lleGRCREdSK0xsYmd2?=
 =?utf-8?B?bUhFL0tQa0EreFBHV1M5U21SY1N1S0hPU0pjajFhY2p6dEFBcVpSc0tud24r?=
 =?utf-8?B?K3pxbllLYnNhQVNGeG1GSTFUY0QrRy9xazdockc1ZWdHWklyeDRiUktSc3Y5?=
 =?utf-8?B?T24yVTFNTnhaVm1rREw1ckFWTVlza3JTRkpMN2ZGMnhobDM4QmVub2l1Q0NX?=
 =?utf-8?B?MjN1K05ZUUlpMldZeldrZ0J3anRKUmtpUldvSXZIcGh3VEllcjV3cy9MRHBi?=
 =?utf-8?B?RDNxQUJCcVpVMm13Q0pTb0RmQ2hqRnVYSDRCRExGaStKZFhtRUJzSDhURHB2?=
 =?utf-8?B?VkRXV1ZuakZEV1dBaFY3cXhRRDlTNENJQ005cTBWZHFOYXBjaHZBcDdnRnFM?=
 =?utf-8?B?dmxrUW5MVmY2akFHQ0c0MnN1Q3kzL0lXMWJhMmR6Q01iaGl3cXI5enV5dzEy?=
 =?utf-8?B?OWhzVG5hUXhQUFF2bGp6dWxSMTZvM0JUbUxVQ0x3TG9mM1Mzb0VCT3ZJYkhE?=
 =?utf-8?B?UUx2MVloWU4wNmFiU01qdmxScENtYTJXUkFERXhtWVhTQklOd2NMV3NFSzdu?=
 =?utf-8?B?UDY4UWJlQ2FFSFNRODFxbTNDcUVWZEVzdmttTUpHdlA4NE15OVRkZHFHWGF1?=
 =?utf-8?B?M095TWM2TWVNTmdpVENkbEFKekdQUE10UFZHdlZiN0xlUmFaeHFXMDNCcUVM?=
 =?utf-8?B?MGwxVnVFcnlMVDhUcmhYZUx2eEJ6b0VuVWlNeUdCNCtIZE1jK1gxenRKZy9Z?=
 =?utf-8?B?cjc1VTlZem51ck9DTCtiaDI4djgrb1NDMnFvcW9yamhtaXl3SjJKN0NXS0dk?=
 =?utf-8?B?eE5Td2x1eE1UNEE4OHUxOStwMUpKRXd1M3RzTXRwd2xZWTJ2VE5SYU1zUkFM?=
 =?utf-8?B?Yk4wa2swZEYzaFQ0WHgxQ3ZtdExTWTc2cThRYk5BQVhQVUp2TkpHN2hoKzVU?=
 =?utf-8?B?T3FUUWJqamx3dmM4Uk16Ti8wSzZYWU45MXJ0OVc3KzJnM0lSNHZYTnBlUW1h?=
 =?utf-8?B?NHcxUjV4blZocm5JdTVNUTdZbjdiQ21LQ3g3UFVRTUFlc3ovN1N4SmJ6ZEtE?=
 =?utf-8?B?YzZqRmFVTmJpRmRpRlNTeHUxK0JNUzBjL3VCUmJsbWZJeG8yTXFQUkpPRkxo?=
 =?utf-8?B?NzNocDh5RmM5bFhOUnhWRmNsZmtSQXAydlYvUkJ2SkFKb29tNFYwZU0yN0d2?=
 =?utf-8?B?NzNWdDdxTHQwVDR0N2xRKzlnVldOWFVlVTRPNHBHN0ZrcE1LQ1l6SXFxYVNB?=
 =?utf-8?B?OFNWaVkzY0NLRkJrcEdEbkx0b09jR0JvTXFtakE2d215WW5YZFI4TEF0L2N5?=
 =?utf-8?Q?ZXV3DMWBEs6uP55ib6xvqCO48?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fe5528-f916-4f2f-a68c-08da6b4ae111
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 18:57:37.5378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEcFuMGfUdw+wq41m9GX+fQ9v3fl2ppDuWo6fLWwwFXyuTvjhDc6HOTpclh5R6Zr2Zhrl2ctmobCfOBKX5G0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4567
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-20 15:32, Melissa Wen wrote:
> The -mno-gnu-attribute option in dcn21 clk mgr makefile hides a soft vs
> hard fp error for powerpc. After removing this flag, we can see some FPU
> code remains there:
> 
> /gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses
> hard float,
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn21/rn_clk_mgr.o uses
> soft float
> 
> Therefore, remove the -mno-gnu-attribute flag for dcn21/powerpc and move
> FPU-associated code to DML folder.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |   6 -
>   .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 234 +----------------
>   .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h |   7 +
>   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 235 ++++++++++++++++++
>   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   2 +
>   5 files changed, 248 insertions(+), 236 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> index a48453612d10..66dc02c426e9 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> @@ -107,12 +107,6 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN201)
>   ###############################################################################
>   CLK_MGR_DCN21 = rn_clk_mgr.o rn_clk_mgr_vbios_smu.o
>   
> -# prevent build errors regarding soft-float vs hard-float FP ABI tags
> -# this code is currently unused on ppc64, as it applies to Renoir APUs only
> -ifdef CONFIG_PPC64
> -CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
> -endif
> -
>   AMD_DAL_CLK_MGR_DCN21 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn21/,$(CLK_MGR_DCN21))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> index cf1b5f354ae9..0202dc682682 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> @@ -26,10 +26,9 @@
>   #include "dccg.h"
>   #include "clk_mgr_internal.h"
>   
> -
>   #include "dcn20/dcn20_clk_mgr.h"
>   #include "rn_clk_mgr.h"
> -
> +#include "dml/dcn20/dcn20_fpu.h"
>   
>   #include "dce100/dce_clk_mgr.h"
>   #include "rn_clk_mgr_vbios_smu.h"
> @@ -45,7 +44,6 @@
>   
>   /* Constants */
>   
> -#define LPDDR_MEM_RETRAIN_LATENCY 4.977 /* Number obtained from LPDDR4 Training Counter Requirement doc */
>   #define SMU_VER_55_51_0 0x373300 /* SMU Version that is able to set DISPCLK below 100MHz */
>   
>   /* Macros */
> @@ -613,228 +611,6 @@ static struct clk_bw_params rn_bw_params = {
>   
>   };
>   
> -static struct wm_table ddr4_wm_table_gs = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 7.09,
> -			.sr_enter_plus_exit_time_us = 8.14,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 10.12,
> -			.sr_enter_plus_exit_time_us = 11.48,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 10.12,
> -			.sr_enter_plus_exit_time_us = 11.48,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 10.12,
> -			.sr_enter_plus_exit_time_us = 11.48,
> -			.valid = true,
> -		},
> -	}
> -};
> -
> -static struct wm_table lpddr4_wm_table_gs = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 5.32,
> -			.sr_enter_plus_exit_time_us = 6.38,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.82,
> -			.sr_enter_plus_exit_time_us = 11.196,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.89,
> -			.sr_enter_plus_exit_time_us = 11.24,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.748,
> -			.sr_enter_plus_exit_time_us = 11.102,
> -			.valid = true,
> -		},
> -	}
> -};
> -
> -static struct wm_table lpddr4_wm_table_with_disabled_ppt = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 8.32,
> -			.sr_enter_plus_exit_time_us = 9.38,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.82,
> -			.sr_enter_plus_exit_time_us = 11.196,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.89,
> -			.sr_enter_plus_exit_time_us = 11.24,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.748,
> -			.sr_enter_plus_exit_time_us = 11.102,
> -			.valid = true,
> -		},
> -	}
> -};
> -
> -static struct wm_table ddr4_wm_table_rn = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 11.90,
> -			.sr_enter_plus_exit_time_us = 12.80,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.18,
> -			.sr_enter_plus_exit_time_us = 14.30,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.18,
> -			.sr_enter_plus_exit_time_us = 14.30,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.18,
> -			.sr_enter_plus_exit_time_us = 14.30,
> -			.valid = true,
> -		},
> -	}
> -};
> -
> -static struct wm_table ddr4_1R_wm_table_rn = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.90,
> -			.sr_enter_plus_exit_time_us = 14.80,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.90,
> -			.sr_enter_plus_exit_time_us = 14.80,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.90,
> -			.sr_enter_plus_exit_time_us = 14.80,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 13.90,
> -			.sr_enter_plus_exit_time_us = 14.80,
> -			.valid = true,
> -		},
> -	}
> -};
> -
> -static struct wm_table lpddr4_wm_table_rn = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 7.32,
> -			.sr_enter_plus_exit_time_us = 8.38,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.82,
> -			.sr_enter_plus_exit_time_us = 11.196,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.89,
> -			.sr_enter_plus_exit_time_us = 11.24,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 9.748,
> -			.sr_enter_plus_exit_time_us = 11.102,
> -			.valid = true,
> -		},
> -	}
> -};
> -
>   static unsigned int find_socclk_for_voltage(struct dpm_clocks *clock_table, unsigned int voltage)
>   {
>   	int i;
> @@ -914,12 +690,10 @@ static void rn_clk_mgr_helper_populate_bw_params(struct clk_bw_params *bw_params
>   		/*
>   		 * WM set D will be re-purposed for memory retraining
>   		 */
> -		bw_params->wm_table.entries[WM_D].pstate_latency_us = LPDDR_MEM_RETRAIN_LATENCY;
> -		bw_params->wm_table.entries[WM_D].wm_inst = WM_D;
> -		bw_params->wm_table.entries[WM_D].wm_type = WM_TYPE_RETRAINING;
> -		bw_params->wm_table.entries[WM_D].valid = true;
> +		DC_FP_START();
> +		dcn21_clk_mgr_set_bw_params_wm_table(bw_params);
> +		DC_FP_END();
>   	}
> -
>   }
>   
>   void rn_clk_mgr_construct(
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
> index e4322fa5475b..2e088c5171b2 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
> @@ -29,6 +29,13 @@
>   #include "clk_mgr.h"
>   #include "dm_pp_smu.h"
>   
> +extern struct wm_table ddr4_wm_table_gs;
> +extern struct wm_table lpddr4_wm_table_gs;
> +extern struct wm_table lpddr4_wm_table_with_disabled_ppt;
> +extern struct wm_table ddr4_wm_table_rn;
> +extern struct wm_table ddr4_1R_wm_table_rn;
> +extern struct wm_table lpddr4_wm_table_rn;
> +
>   struct rn_clk_registers {
>   	uint32_t CLK1_CLK0_CURRENT_CNT; /* DPREFCLK */
>   };
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> index dc60b835e938..eeeae52fe6fc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
> @@ -42,6 +42,9 @@
>   #define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
>   #endif
>   
> +/* Constant */
> +#define LPDDR_MEM_RETRAIN_LATENCY 4.977 /* Number obtained from LPDDR4 Training Counter Requirement doc */
> +
>   /**
>    * DOC: DCN2x FPU manipulation Overview
>    *
> @@ -650,6 +653,228 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
>   	.num_states = 8
>   };
>   
> +struct wm_table ddr4_wm_table_gs = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 7.09,
> +			.sr_enter_plus_exit_time_us = 8.14,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 10.12,
> +			.sr_enter_plus_exit_time_us = 11.48,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 10.12,
> +			.sr_enter_plus_exit_time_us = 11.48,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 10.12,
> +			.sr_enter_plus_exit_time_us = 11.48,
> +			.valid = true,
> +		},
> +	}
> +};
> +
> +struct wm_table lpddr4_wm_table_gs = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 5.32,
> +			.sr_enter_plus_exit_time_us = 6.38,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.82,
> +			.sr_enter_plus_exit_time_us = 11.196,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.89,
> +			.sr_enter_plus_exit_time_us = 11.24,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.748,
> +			.sr_enter_plus_exit_time_us = 11.102,
> +			.valid = true,
> +		},
> +	}
> +};
> +
> +struct wm_table lpddr4_wm_table_with_disabled_ppt = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 8.32,
> +			.sr_enter_plus_exit_time_us = 9.38,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.82,
> +			.sr_enter_plus_exit_time_us = 11.196,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.89,
> +			.sr_enter_plus_exit_time_us = 11.24,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.748,
> +			.sr_enter_plus_exit_time_us = 11.102,
> +			.valid = true,
> +		},
> +	}
> +};
> +
> +struct wm_table ddr4_wm_table_rn = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 11.90,
> +			.sr_enter_plus_exit_time_us = 12.80,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.18,
> +			.sr_enter_plus_exit_time_us = 14.30,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.18,
> +			.sr_enter_plus_exit_time_us = 14.30,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.18,
> +			.sr_enter_plus_exit_time_us = 14.30,
> +			.valid = true,
> +		},
> +	}
> +};
> +
> +struct wm_table ddr4_1R_wm_table_rn = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.90,
> +			.sr_enter_plus_exit_time_us = 14.80,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.90,
> +			.sr_enter_plus_exit_time_us = 14.80,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.90,
> +			.sr_enter_plus_exit_time_us = 14.80,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 13.90,
> +			.sr_enter_plus_exit_time_us = 14.80,
> +			.valid = true,
> +		},
> +	}
> +};
> +
> +struct wm_table lpddr4_wm_table_rn = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 7.32,
> +			.sr_enter_plus_exit_time_us = 8.38,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.82,
> +			.sr_enter_plus_exit_time_us = 11.196,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.89,
> +			.sr_enter_plus_exit_time_us = 11.24,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 9.748,
> +			.sr_enter_plus_exit_time_us = 11.102,
> +			.valid = true,
> +		},
> +	}
> +};
> +
>   void dcn20_populate_dml_writeback_from_context(struct dc *dc,
>   					       struct resource_context *res_ctx,
>   					       display_e2e_pipe_params_st *pipes)
> @@ -2068,3 +2293,13 @@ void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
>   
>   	dml_init_instance(&dc->dml, &dcn2_1_soc, &dcn2_1_ip, DML_PROJECT_DCN21);
>   }
> +
> +void dcn21_clk_mgr_set_bw_params_wm_table(struct clk_bw_params *bw_params)
> +{
> +	dc_assert_fp_enabled();
> +
> +	bw_params->wm_table.entries[WM_D].pstate_latency_us = LPDDR_MEM_RETRAIN_LATENCY;
> +	bw_params->wm_table.entries[WM_D].wm_inst = WM_D;
> +	bw_params->wm_table.entries[WM_D].wm_type = WM_TYPE_RETRAINING;
> +	bw_params->wm_table.entries[WM_D].valid = true;
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
> index aa892193e485..a6e1ad0f38e9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
> @@ -82,4 +82,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
>   				 bool fast_validate);
>   void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
>   
> +void dcn21_clk_mgr_set_bw_params_wm_table(struct clk_bw_params *bw_params);
> +
>   #endif /* __DCN20_FPU_H__ */

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

