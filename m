Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A101B57D3C2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 20:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D0418A521;
	Thu, 21 Jul 2022 18:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7C414B65C;
 Thu, 21 Jul 2022 18:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGkWY8MTFNRaJA2m/7ncwFaH8Y0pAKq7OSLQ1fejmQIJxxDtDpMW12cL7Fpa0xd0MpUMDzRNQOVLul6M90Lt8GXsrDzTtTEfnJ73AnCWgP9mG6NfHJ73N6AAk5B5OO3jv2XE6OsNpZMOP+XoEYQFWepZvwugzzPn3a7nwPKd+7zdMjqMjvsBWaR4BsKgJ3F7b6ee3IxHC0F5V9Z3KH99efn8R6JkjVSfZ8MG+ge0f5A9JidwoOECv4uZ4aotx8Y0clbNQ6bzdbqXwG1MrZMmwYe915hXRXGqAoiib17zZDYBS0ToZy1Djzez7efK54I2TKcceeV6GchnycmV7DVllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg+kvo5HzSb1CfNZYQjk8XQgzaB+OkKRbRvyFXwYtUE=;
 b=CTMJjG9eAwgj3uMe5oanOmmt8bAiIpKVtxtK/IuZAHhxCCnOZtZQ1StItKlgznzym+jxN82ZeeM8OxbY2W2uOEHeo+9/JGxIjg15RGcC0eQm7oVteqHVqIlyDC3TD75hsneEXYVVcqnzQNVx/MwnSyIpYs8zMyvBS8Ur7FanIpHPN0DAHJmrZoLkR2C835b6D8JCble6vXGI9wVCCrC9T/urFlxKEjjRt0CTJsa3dFISoWcyJia/exJIBO1yWRva0q1RxSqkwHgsTVMg+s/y4cmifWPICwiBiosVxOPhWWg0a9kxZ33C9UYMU66qyGMTxQHObjlUQJEb/PPojLOADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg+kvo5HzSb1CfNZYQjk8XQgzaB+OkKRbRvyFXwYtUE=;
 b=jqoufacRsWVdEICbdRfZ8G4BTYaK2vzaqfRNRt3LujaK2HVSXRlLgiUkzvpjlP3muMr229gSNMWnzX+6QwQw4pCjJayZiWDqBKu4AO+IX6oBgekb3aAPdRw1CMr0tcdiyypTBjeHvTitE3XW7U0oikZI+GN5FBJJcMQMmrN0nrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 18:59:22 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 18:59:22 +0000
Message-ID: <301c29e0-e520-1235-3ec6-0592b09ddbd1@amd.com>
Date: Thu, 21 Jul 2022 14:59:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/5] drm/amd/display: move FPU code from dcn301 clk mgr to
 DML folder
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220720193208.1131493-1-mwen@igalia.com>
 <20220720193208.1131493-6-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720193208.1131493-6-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7848cc99-8a7a-4d4b-16d8-08da6b4b1fb0
X-MS-TrafficTypeDiagnostic: IA1PR12MB6579:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDTrE6/8Mv1mrdky/3amp/NFyMpzPKtdICdbaQyFr6T9Rnbzsmey4GyLeOK3iMmHw1waYra4HRifJl2RgsFthQL2IK3a9Gc6MFTqyiKdqXsgJBJR5kkr0F3eJQm9NxnUbpA6tHDoGCZ41QIANgwp726LB3mtb7Gf1F86NX808ba/+yXJD3BBldLxik/N5aQwe3R3aYaNUha5A9GmIQT6qDFXtPMl5mOhXdJWeP0CJDgcu8vetzUkIOvXnL1OugJnRtOYYHwsmzjGRA+wZkNpjoH+/TSxyoYx2/Vbtu3dIyHRxfPXFTK4fPWtYJ/l/wFaAHb3skaqirx0sU/qmzbMhoiRcrhv+eYXD9uuuoX9d4h2aa0dfhaiHAlicVj46mZSoHfWYVTZcP1Y+zAu+EZLpONEilzWpLdXc/M+DUUDAwn//xt2Ne2YBDxrDuQQ03PyIaewQap3excE/UD+5bnbRq9DsCJf1iMeBdfB3jqP6xITGBZ8JoiJdaI0twGvyqFqGfIn58/bAqd3RpgUEcObdkr7kjnR5pwYlIhp/MdgI3fHHOBtPPm/7GxW9O+A8A+oIbqOfqY/XV1CEyusPP2en/8MBzAqxjzBMHol+AgVCjyfwNcVg2/SxmRA7Q9+ixJUqkPModvL8aTI36hFR0xhdFC3kzp6JZoOAu/LzvQe7x8N4J/R/B9X8Yxpoe/kXb8TzvVgxbswBAt3VpynMP0NG/w0nRRVtP9ws9s/fz+SX86/tFy75ynnjBexzqrGKnZn23xj4ij4NZ4eZz7WIsrAr+mxHU7cmKkDB951bMz3sWYuCLwlaw4SYO0G67wR1jf+1kxkYLXBEAr8onznt8Cuvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(31696002)(36756003)(86362001)(5660300002)(8936002)(6506007)(2616005)(26005)(83380400001)(31686004)(53546011)(186003)(6512007)(38100700002)(478600001)(54906003)(41300700001)(316002)(8676002)(66476007)(66556008)(66946007)(4326008)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjRKUFFyajdxdDRsMDhQcEVETml4c2ZZRjhna2VUSG1BNUhpQnVYbXg3UHFr?=
 =?utf-8?B?NEFJSGo2NFdUU3lENTZQUXB0djk2ZjM2TkdNVnpUdmhqSmpKUWh4RjJ4RjAy?=
 =?utf-8?B?ZWNpZWJ1YXhPZzA1cER0QndIWEIwY0pPR0thc1BPbTEvOGZoY01yWTlnZ0p0?=
 =?utf-8?B?ek4wbjVaMVl2Q0dOdXEzazNoM21EV2liQ21sZERZMjZmRldNeVQyOXp0aUNo?=
 =?utf-8?B?RjZ3VDlrNzdJOGVUbW9BaE5JNW5NTW03VEI5VEhqbEI0eURmWkQyejBrL2hY?=
 =?utf-8?B?VHpKVkNrQUR6Zi8zUVRFcWo2VXMxYlJPUnNHQ1ZRVUdsa3k3RFdLeGpzUjF4?=
 =?utf-8?B?M3ZJdUJFSEhEUFNkOGNHL2VFSjJEMU9SdVZuUVRxNXgzQlpxa3Rva0pWYThD?=
 =?utf-8?B?VDZFWlR6SVZGVENvSUhzcTBVQUZ4WUUrREtJektvRHdZa3R2cFpPbmF3cXdk?=
 =?utf-8?B?cEErUmR4RkNDZ3dwRzRvaWNNd1VKWCtNUlZHcEg1dGpWSUxvWGw0K29Va3ox?=
 =?utf-8?B?UDV1OEpJUjhVRlVNVGpJUGNVNlhWd1N0d0J5Q09BOE9qODVGZUFNMWRlM2FN?=
 =?utf-8?B?amsxZmtMQnhTSXI4UlZ6aDkxTXRrcVRocE52bnUwbVUrME9CSDRvaXIxcVhS?=
 =?utf-8?B?dWVSQnRMU09EaEdKZUpzaXI2RE1CWm4wSUwzUVdLVEtKdy9mNFNERlF2NW8r?=
 =?utf-8?B?UzdpaXVtN0FqVGZaOVp1bnZpOGEwRXpBZS9FaXR0ZEI0NktuL1QzRWFaVFR6?=
 =?utf-8?B?T3NIRUVtbi9xS0RGcGNxRXNsaU9Lek9FQlZUSWl1dEpQVDRjaGNjMktkazVL?=
 =?utf-8?B?YkM4S0t2TGtFVXYzVmpTRGNJckNCeVNyR2oxK09FVmJEWGgvek9CV2NzZ2tt?=
 =?utf-8?B?ZG9SaGdTeXduR2J6WmgyS1pQZGpnZ29pdVBkOHJhOEE3RnM2VlRJNXBJcVoy?=
 =?utf-8?B?bmhuRk85WWN6OWV2Vy9sMzM1akE2dVViQnBOa1Z5UC9RNENKMnI0RnZJNmMz?=
 =?utf-8?B?ZlptM0IvZXY0cHg5S2MrRGdGQXVCZmx3UUlnd3ZJNXVRZUUybEhQRk5wZUpD?=
 =?utf-8?B?TEFNNTdBMk04RHVHTk1oWDNqVGRKYXJ5MVByTlNabHBObW1sdzJXNmJtYXJN?=
 =?utf-8?B?bm1pMy9XUWZMS3N0K3pTam43TWlYMzEwRlNtWUJzRVFpcWl5czJMSEc4TDFI?=
 =?utf-8?B?ZDZvS3J5elRGSHkzK0ZXYjdBOUZCelZNaDA4ZTg0UkRPZmE3bklaTGdQWWo2?=
 =?utf-8?B?NUZybXZtYlZYZEJ2Q1VNalJCcEs2ckZRYy9Sb3NzQmxwN2lvN2RGYVkwbWhG?=
 =?utf-8?B?SDYwRUpmbHRKS3EvUS8va3J2N1NyTUNkR0wySzNsSjEvM0lkeTdhYXNJZTFy?=
 =?utf-8?B?YXZ1K1pNcnB4dG9SR0hyWW10RUwyUDBLbjlZTFdxVzdwcFI5NENkRUFqaUhn?=
 =?utf-8?B?SWNkNFlGLytZV1VlZVdXVDNhdnRpcWhWa0paamc2RGJ4b2pMcnAwUEdjV1lH?=
 =?utf-8?B?U0M1TU5BblQ2VzNLMlA3V3JvWDBPd09neHl4cGwvd2ZsdlNIcUJnMENkWC9r?=
 =?utf-8?B?V1MwUi9mTGRJN3d2eUNaU2pSN0FKVlRjNSsvQTJEdWFTN0dsQWs4TEdGcHph?=
 =?utf-8?B?THNvbklJTVpwZTBMdk5qVGVyTThSNTczQ2pDemh6Qll5dnRocGEwYXk1MGpF?=
 =?utf-8?B?UFVvUStkdEhzVWVPeFZiT0hSdFV3RXkvWDJiazEzMVpMM3hac3h2VVR4MFFp?=
 =?utf-8?B?UHVqY3hHQWt4YUhwWDkrdS84NHpCNFV4ellvYXdtc1BQSDNqVFZqYXJzWVdE?=
 =?utf-8?B?TjVwZ244bkhDa0hUSktHVndSbk5oSFd5R0RYelpnM0drMjYxSkE3alpidEdB?=
 =?utf-8?B?REVjQVMyK0RKTnVWakJtNG0rOWhNa0JjdDJJcDlhckIybThTdEQvbWZBSkVo?=
 =?utf-8?B?MFMvTGM0amU1b3JINzNOSjFySXk3aExtYjdnOTlncnZ6dm1HRDFadVpsMy82?=
 =?utf-8?B?bURBT0hwTUQzNVBVV2E2Y2IvSXZLeVRzSXU4Y2daOGhNSkxabDdRR1pUNVBV?=
 =?utf-8?B?U3NDT2o2YVdkcTUzZ1BySnoxcjNsL0NYdDc4MFhBVklYc2lKVmZzcjcwTFgz?=
 =?utf-8?Q?8J8O+WGQOml3rUTjWTrIL+lCl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7848cc99-8a7a-4d4b-16d8-08da6b4b1fb0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 18:59:22.6105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8NLOWQBxr2LFmmPA5kjki9M/pv6eZ37C+MMjgk5XEo8BOlllhXJ0COs1yhB7W4sE+GRPIRq/vG1lB2hna8bHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
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
> The -mno-gnu-attribute option in dcn301 clk mgr makefile hides a soft vs
> hard fp error for powerpc. After removing this flag, we can see some FPU
> code remains there:
> 
> gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses
> hard float,
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.o
> uses soft float
> 
> Therefore, remove the -mno-gnu-attribute flag for dcn301/powerpc and
> move FPU-associated code to DML folder.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  6 --
>   .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 86 ++-----------------
>   .../display/dc/clk_mgr/dcn301/vg_clk_mgr.h    |  3 +
>   .../amd/display/dc/dml/dcn301/dcn301_fpu.c    | 74 ++++++++++++++++
>   4 files changed, 84 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> index 15b660a951a5..271d8e573181 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> @@ -123,12 +123,6 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
>   ###############################################################################
>   CLK_MGR_DCN301 = vg_clk_mgr.o dcn301_smu.o
>   
> -# prevent build errors regarding soft-float vs hard-float FP ABI tags
> -# this code is currently unused on ppc64, as it applies to VanGogh APUs only
> -ifdef CONFIG_PPC64
> -CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn301/vg_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
> -endif
> -
>   AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_DCN301))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
> index f310b0d25a07..65f224af03c0 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
> @@ -32,6 +32,10 @@
>   // For dcn20_update_clocks_update_dpp_dto
>   #include "dcn20/dcn20_clk_mgr.h"
>   
> +// For DML FPU code
> +#include "dml/dcn20/dcn20_fpu.h"
> +#include "dml/dcn301/dcn301_fpu.h"
> +
>   #include "vg_clk_mgr.h"
>   #include "dcn301_smu.h"
>   #include "reg_helper.h"
> @@ -526,81 +530,6 @@ static struct clk_bw_params vg_bw_params = {
>   
>   };
>   
> -static struct wm_table ddr4_wm_table = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.72,
> -			.sr_exit_time_us = 6.09,
> -			.sr_enter_plus_exit_time_us = 7.14,
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
> -static struct wm_table lpddr5_wm_table = {
> -	.entries = {
> -		{
> -			.wm_inst = WM_A,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 13.5,
> -			.sr_enter_plus_exit_time_us = 16.5,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_B,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 13.5,
> -			.sr_enter_plus_exit_time_us = 16.5,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_C,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 13.5,
> -			.sr_enter_plus_exit_time_us = 16.5,
> -			.valid = true,
> -		},
> -		{
> -			.wm_inst = WM_D,
> -			.wm_type = WM_TYPE_PSTATE_CHG,
> -			.pstate_latency_us = 11.65333,
> -			.sr_exit_time_us = 13.5,
> -			.sr_enter_plus_exit_time_us = 16.5,
> -			.valid = true,
> -		},
> -	}
> -};
> -
> -
>   static unsigned int find_dcfclk_for_voltage(const struct vg_dpm_clocks *clock_table,
>   		unsigned int voltage)
>   {
> @@ -670,10 +599,9 @@ static void vg_clk_mgr_helper_populate_bw_params(
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
>   
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
> index 7255477307f1..75884f572989 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.h
> @@ -29,6 +29,9 @@
>   
>   struct watermarks;
>   
> +extern struct wm_table ddr4_wm_table;
> +extern struct wm_table lpddr5_wm_table;
> +
>   struct smu_watermark_set {
>   	struct watermarks *wm_set;
>   	union large_integer mc_address;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
> index e4863f0bf0f6..7ef66e511ec8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
> @@ -214,6 +214,80 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_01_soc = {
>   	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
>   };
>   
> +struct wm_table ddr4_wm_table = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.72,
> +			.sr_exit_time_us = 6.09,
> +			.sr_enter_plus_exit_time_us = 7.14,
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
> +struct wm_table lpddr5_wm_table = {
> +	.entries = {
> +		{
> +			.wm_inst = WM_A,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 13.5,
> +			.sr_enter_plus_exit_time_us = 16.5,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_B,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 13.5,
> +			.sr_enter_plus_exit_time_us = 16.5,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_C,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 13.5,
> +			.sr_enter_plus_exit_time_us = 16.5,
> +			.valid = true,
> +		},
> +		{
> +			.wm_inst = WM_D,
> +			.wm_type = WM_TYPE_PSTATE_CHG,
> +			.pstate_latency_us = 11.65333,
> +			.sr_exit_time_us = 13.5,
> +			.sr_enter_plus_exit_time_us = 16.5,
> +			.valid = true,
> +		},
> +	}
> +};
> +
>   static void calculate_wm_set_for_vlevel(int vlevel,
>   		struct wm_range_table_entry *table_entry,
>   		struct dcn_watermarks *wm_set,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
