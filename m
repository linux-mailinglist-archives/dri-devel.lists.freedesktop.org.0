Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0B6F8436
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 15:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CC910E608;
	Fri,  5 May 2023 13:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274B410E605;
 Fri,  5 May 2023 13:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/d+BO1bPL6DEHkEFLij60vtd2I9my76gsYXh7I+jr5g5L3ZN1wyu5gNv6Zbm+d39Mx0Tl1ey6sZfN9+gpF3DN1pPFJ8obJX9WkzYPjrDSLMbn7aKSIsUdqpOTn605rfsdBEVUwWTyHC687l3dANoQnEtqBI0yzmd/AW+Yl/uSgnxOm/5vTeuaSxfIX8lZchDO5ysxrlG93fc87eSr0ptDf9Wx4nt4gkuDV7oGs6pffL02Ytgmd0hRNpBTcmi6lH/+auJZJw63HPjbnVpO62LOdtvpo4HRKOAJgc8ETthopHrXNY6b18OgLLWRqXnzTbFKLMaYVar1bXMONN2q+nqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYuoYWfOuDXarAZuWxHU2kXFba0p9YkhD1DFRM322pI=;
 b=AFJwVkR1/IbaTmBGlZGiEa2erZEVRwIK0bXrrM2IMsG6kvjiOdTbU3t6o7e3ELZO7JIyHkqPP6QPwFWmmvPbabOKJaR/zEyWeHh6jwtN4wuMHjNxc/9xKbuNYGt6SS1DEmKV62JFeUVI83HYaamTTm/WqY9kymA3JOwuoP9FDeSeBhLpDsOt9zWSWeN6kXEmO+tZjduAYtjoPJmxu1yAPB/fJoEPQoFowpkDsIooal6SHjOIKekynLkqIx/l/mTrIidra375F8oqhMgXb3izX0zSUoa4zsJUT3HYl9gqydPWa/HYmHufQKDWCBNTJvxS/X8L3+ANrbUGE7EdZQ7s5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYuoYWfOuDXarAZuWxHU2kXFba0p9YkhD1DFRM322pI=;
 b=iqbEu+rOjwrevL+00HuVf7Xq92I2LP2FeqLLyNt9Wu17b+4exDtwZQwaGn7ooPuXMroqqWyq+8QsuAQLq0JPF2x2LOb5bVVu9vExGjRLqUnRwHPxPUxGNry/di08e3Vqhcc0xoFN9n+2NdTzc2a10lvvqF7ZkQerJQ/RnvlilxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 13:37:40 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 13:37:40 +0000
Message-ID: <c4146636-2321-b271-b480-b8693169c119@amd.com>
Date: Fri, 5 May 2023 09:39:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
Content-Language: en-US
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230505113233.3813801-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0330.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::6) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 23508e04-a494-4ee0-b161-08db4d6de5b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2krXw3GnZee41Y3O3qAwPQ3/jpa5Ym8NdrTLzJOCqECUGPJbJV/33oBfFPCt68nd0/qcbo8JMz8JbZfTXn3Am2W9Bl6DiCGrFCLe1xDBCjxN8dIdgo5OC9woh+J/tC6zUyT3w/sQodvuwOvCzHP3LDH/qVQOvBQxYIrsJgXucIbY1UGtuly1rt/ocqAj6A0kUDiNUOvAOyrqQ0SVDVee1AGUJBxg0vJ5SwZ/X+aGVg+Abza2N9cJkTlRHRnwYS0OEo3mVJiLU9ib0DwcHED5oyT0m3aMa+DuaRYPZJWcPvXn4y8qjmEhMGO+eNywgfKlUp+3pWMNJZntfji6CQrPOlKts6+8ZmSteT351k2uN2yzhE/TGJ+9kY6+qFAHKhs2zRQebm5kqdKKCnzo5tkCfBNIqCGfXMnCPKrq+R3WT+Y4hxaSBmN/680C1aFv4JwZRTXZmTDGcIBHFIg2fyCd5S/2uSlxnnR+/wcdjpSHSlSHhXrps6+rDLKEQA6Yy80B9BlnxQuBPBbjJi4yERiT5XzyIzIRwsMCZDAW9Vy4lyKECq+GyCAxMJEQQejGV0SQ3NNe9djs37sidHVWCdd1HlaRHn/k3e6nZqbmoe7SSPl2WZYjeXJTbGE9LV5r7suxR6olXqAvlMz+TSOY8kq1ukcAH5LiLs0svO7zaJ/shqNar2F4vVkICu2mQvKS57Te
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(31686004)(966005)(4326008)(66946007)(66556008)(6666004)(478600001)(6486002)(66476007)(110136005)(54906003)(316002)(86362001)(31696002)(36756003)(83380400001)(186003)(53546011)(2616005)(26005)(6506007)(6512007)(8936002)(8676002)(5660300002)(44832011)(2906002)(41300700001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajArVWR4M1RXMVlCdFB1cXEzL0VRazg2dkRjbE9HYk0yMzBNVWhnT0JoZWpQ?=
 =?utf-8?B?dkNQQkpETHJSUTZIdHZEbndzRDF3TG4xMzVMbEM1eWlhZ2JjVUFrMVFtN2ww?=
 =?utf-8?B?bis4TEVITm9vc09PcVBaRTRvQVl4Tk4vV2VkMUU2R1BWQTVzcllsck5FUVJs?=
 =?utf-8?B?emprcXY2RjJYaFRmbHdmZ3ZOU2p6QTk0VE84a012cE8wOUxpbmdSMG5kbC91?=
 =?utf-8?B?YkVWNkprcXF0Q0cxSGpXeHlobHJmTFFlQnRkWmZNRG55WU9odkprTlliSU40?=
 =?utf-8?B?WjJSbVNFcUxyRllsTisvNnJCT1hadU5TWHRGN2NZZmhiZ1VVZWF6RGZtTDFB?=
 =?utf-8?B?T1pBajNtcndNaGJwOFB2TS9wQzM3VmtiUmdKNFcwTUJsakR3SjJaQytEazc3?=
 =?utf-8?B?SmZUcW03T1AxOE9GbTVBU013QXE2cDk2aVp4QllyODBTWmRKSWZOUUtOQncw?=
 =?utf-8?B?OVJpWmxRaGFhWnhqSCsxS0l4dEFyQ2VHeTEweXlNK1dtbEs1NEJ4NzhKejcx?=
 =?utf-8?B?OUsxQ3RWOEFkeU5jUVZrcEhEVHFTMjJ4aFFmWUIrREducGJ1L0NmVU9NcnVn?=
 =?utf-8?B?RGc3NmUvNWw2akhsM21kaDgvWUxhZHMweXRVcGVQYzhndFBxSzk0clVCZVZY?=
 =?utf-8?B?cTVReEtqNlZiK0Z6K1JQQmRGbWRtRmxVVXhzTTM1VG51NlU5NDVDcUNVUnhT?=
 =?utf-8?B?VVJmbEV3R255OS9HWGxZZFdZUTVIR3ZocGVyUXAxbjhLekZQMVR6Ym5yK3NB?=
 =?utf-8?B?aWlkNDhJaG1tTUovSE45OHo2cGx0YmtiTTZJdXdGUVIzVm1EakJTTWFMZi8x?=
 =?utf-8?B?VUZsNFpQMURta01oUGdzOE9KYzNxa0NHMUxXUjdtR2dwUW5yeXhyU085c2I4?=
 =?utf-8?B?eWdCelBuSGxKUENNZXFJWDlvblFQcHVaSlJvSXhod1prY3c3RjA4WUowZEpY?=
 =?utf-8?B?amcrM2F2cExrMm83a21WRzY5MkFaaytld2pjVDgyM1REeDloREY0SEVWT2py?=
 =?utf-8?B?Mk01ZVJVWERXRkxaUldUZGJXMEhJclVOVU1BNDZqZGZNbXFDMVo1RFZQM3VD?=
 =?utf-8?B?ZmtSS1JUWWlEUUlvV3ArRnV0REVBbnBobDA4N0hKeEF2eXM5TldtK3U5UTNT?=
 =?utf-8?B?M0g1bEpFeS96ZkxIbEFjSHNZTFJyeGFvZnp1SkIxQlRZeC9BanJIVkVDbGJT?=
 =?utf-8?B?eUZzWjkwQUNwbjM1Z1N5WFgvZEwzZ1EybW5hMlc1THM4TmY5MnBPMmc4WjIy?=
 =?utf-8?B?MTE1cnUzcTFiNnp6U3c4RllKc3c2MTJGY1U4MDhDMElGMW9xQ1lEM244eUg0?=
 =?utf-8?B?R0RZMk5nSTRMQlF2ak9raXZieTh2bmQrL080aDBOckRHYmJzRW0rSmRGUng5?=
 =?utf-8?B?ZE5PdDBKNlU4eUVtZXpqUG5yRU1HeHl5SDcrb3V0WmFBZ1dZNXZleGo1RWlM?=
 =?utf-8?B?UUtER3ZQZzFrUFpsOElLUXRzSnFDY3FvalZGRGYrNmhscG5UOGJiNTNQcFQw?=
 =?utf-8?B?a0ZzeGhyZXpyN1hHK1JsdTB2QkZSenp6UElpeXB5L1Z3VUJCY0lQN0NGQTUr?=
 =?utf-8?B?THVaa3A2bXN5ZW5kbkpPMkk4ek0xUk9iY1Eyb3dlWUtnY091aWtRUGVDbW5F?=
 =?utf-8?B?Rm1BMUZPZ0RVVVFZaHhzUjBlakF0cU5UK0V5My9zdnN2eWNlYjludEF1b1Y5?=
 =?utf-8?B?d08yd2YwQ2VWZWxnUERFMFdkSzZud0Z6WHBkYTllb0NJenF5VWNIYk8yVW5y?=
 =?utf-8?B?Vjl3T0xPcFhSZGFRMnkrT1oxNVVxMzRQZFJ5QXlaOGdBY3BHQWM4dmpmbHEz?=
 =?utf-8?B?K1JtalB3TFZPRjJsdnd3YXNWTWNMS0dTR2dDTTVwTUtRY1k3U1N1RVRCSm5I?=
 =?utf-8?B?WjdhN1lVdWw3SFo0YnorQUVVWHp2WVRlNVhDSTlPQ0lIeVMrYzZHb2F2TjNr?=
 =?utf-8?B?NzBldUJLWEtqaDZhNytmMDFoZ29qd0FrakMvMnhsYUxqWDFFdzk1M2VpT0hM?=
 =?utf-8?B?Ui9SUHZvTHNvellab0hhczhSK2k0V3lDK2hqUHBZVVJmSWdBc3RmM0xiY2xo?=
 =?utf-8?B?endQazlhd2JkKzMrR1JNV2owaXZHdHdVYjhQdkVZb1M2bFNwL01CZjhaZ2d0?=
 =?utf-8?Q?7xZlBvBIFe8821TTmb0EJ+kev?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23508e04-a494-4ee0-b161-08db4d6de5b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:37:40.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/H2I7Yzl4OYfFmUAIOkT32DntulSRU0fTqcEaNroY98oNh1fMcNe1o4LHDYCDwZO454rOo52K3hY68hP0JeCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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
Cc: loongson-kernel@lists.loongnix.cn, WANG Xuerui <kernel@xen0n.name>,
 Xuefeng Li <lixuefeng@loongson.cn>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hey Huacai,

On 5/5/23 07:32, Huacai Chen wrote:
> Now LoongArch provides kernel_fpu_begin() and kernel_fpu_end() in commit
> 2b3bd32ea3a22ea2d ("LoongArch: Provide kernel fpu functions"), so we can
> enable DC_FP for DCN devices.

Have you had the chance to test how well this is working on actual
hardware, or was it only compile tested? If it was only compile tested,
it would be great if you could run some tests. Please see the following
for more details:
https://lore.kernel.org/amd-gfx/8eb69dfb-ae35-dbf2-3f82-e8cc00e5389a@amd.com/

> 
> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit message to add the commit which provides kernel fpu
>      functions.
> 
>   drivers/gpu/drm/amd/display/Kconfig            | 2 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 6 ++++--
>   drivers/gpu/drm/amd/display/dc/dml/Makefile    | 5 +++++
>   3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 2d8e55e29637..49df073962d5 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>   	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>   	select SND_HDA_COMPONENT if SND_HDA_CORE
>   	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>   	help
>   	  Choose this option if you want to use the new display engine
>   	  support for AMDGPU. This adds required support for Vega and
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 1743ca0a3641..86f4c0e04654 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -33,6 +33,8 @@
>   #include <asm/cputable.h>
>   #elif defined(CONFIG_ARM64)
>   #include <asm/neon.h>
> +#elif defined(CONFIG_LOONGARCH)
> +#include <asm/fpu.h>
>   #endif
>   
>   /**
> @@ -88,7 +90,7 @@ void dc_fpu_begin(const char *function_name, const int line)
>   	*pcpu += 1;
>   
>   	if (*pcpu == 1) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		kernel_fpu_begin();
>   #elif defined(CONFIG_PPC64)
>   		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> @@ -127,7 +129,7 @@ void dc_fpu_end(const char *function_name, const int line)
>   	pcpu = get_cpu_ptr(&fpu_recursion_depth);
>   	*pcpu -= 1;
>   	if (*pcpu <= 0) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		kernel_fpu_end();
>   #elif defined(CONFIG_PPC64)
>   		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 01db035589c5..542962a93e8f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -38,6 +38,11 @@ ifdef CONFIG_ARM64
>   dml_rcflags := -mgeneral-regs-only
>   endif
>   
> +ifdef CONFIG_LOONGARCH
> +dml_ccflags := -mfpu=64
> +dml_rcflags := -msoft-float
> +endif
> +
>   ifdef CONFIG_CC_IS_GCC
>   ifneq ($(call gcc-min-version, 70100),y)
>   IS_OLD_GCC = 1
-- 
Hamza

