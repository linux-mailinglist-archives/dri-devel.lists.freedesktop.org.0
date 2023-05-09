Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C191F6FCAF3
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21D910E14A;
	Tue,  9 May 2023 16:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA9E10E14A;
 Tue,  9 May 2023 16:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCTA0AwMj0g9prl3fyijwBVnVrweDIVLsO8AHCMpk88TrQ8ZLN6ocs9MgsRDeaxvpUkvSX5gPOG7eFC+/x8v06rPTa2Ov5vzZRPkhJ+RQVpx1zKZ0kqbsQHJrWGdqbsYmb4NhgNlglwNeIdqBgUteiPndNXbyVn5bPmQhv63g1paAvdb5jx/+Q7fcmKx6X9N2dHuwDhM0xuMtpU1STUa7/iHf5lwwCg0RddNIhu6/3PrCYSmINiGCZqJo2qZHvACWqO+/2S8yFy8pejtNGZX/3mO7rIH7wF+e3glNRANBe03J8CC4RgDGDpU2XefrTpz4qFSbP59N6vYiGmLANlU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6KLbwcyri4fzjwWZJOPMwH3AH+uaclI/ZV1aqmR2t4=;
 b=U1CAP6fiZTFtY0rVnEuQPYOxryNi2o4CXNprUoTLHZff31/bOVTLF91BMAOvvPRuxCy5WhxJPue7n4v+o2dIH30sF03mT3qHly6Qn8dp7LE/dJjyuNXo/v052BL62cGaDm0GWbe8l3CxWvrH+98BA/3TAkrKIZ9hbcham2IryQrBSbBAOwGd8ANpxok5ypbYqYtBuIgQB0ZbE3isvipz1lsaahljRL643736wIGAnUw11L/1cipxGvyvZmE24yBLgIQVEjEfDwXLm7cSO2NKdmZlpDsiMAZz1RFIBPM/LFDtTBqQEuXLUnQMpC1sqr6OhjtcF05GrINA+PvQn4HKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6KLbwcyri4fzjwWZJOPMwH3AH+uaclI/ZV1aqmR2t4=;
 b=MCOMA9lDBlVgBIbKiZZy+z+GpHSeNq1lWFnyXSGI0tCmKM3aVK4P8j6l1LEnofGx5qLaHm8eHu+dQVSeU450WxWYufbrb1Eggwlgdtw7Fk2RIwPW6hRgKKwPpOOn+KeFsYvdgaxZLoehZY2NBRWXOLwg3YHdYAOCiL3n58g3B08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 16:15:24 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 16:15:24 +0000
Message-ID: <03be02e4-3349-f27f-1bf6-ada16478c632@amd.com>
Date: Tue, 9 May 2023 12:15:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3] drm/amdgpu/display: Enable DC_FP for LoongArch
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>
References: <20230508030941.476694-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230508030941.476694-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::6) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a42082c-ede0-477e-2199-08db50a8983c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0yKUdOuH6dpq1Y/SUWfXGq148nuQqaod5aTUjsDysOpBaL3udeM9TMz//dUQ335Ir8Fjxk6jFwi1WErK3ZUHpuTIBekLvMh8cCp0V5Lj1C5Jr4L1g6kSGzEazXIL9ig3Ri+xKY79/e/76H1JbqnhlTyVYn8DYjJLSqlPdhjoMgnYLHxfwAwHCi0KETsWozgkdPlw1yLpXjKfoi8Zn5TFB5H807V9hA5TWye13R1AUq9Q3w0YT9YJXtGPNTJAcywEkBauLW0fwRc852zmjJFK10YohLGThuwkN4BX0fRh1/HqaD8alD3XycCe0mcv01AHIIwfJAFVQaJSLLqU84nYPq5EpNr8XUT6NxXTHIos4BPY88JdbBNyOA9sq1U9jK/9Ff2AoiRjakPNyLqZFDagG0O38doSALjeXdNjgydTU2z5NW+Cs1ZQQHEkyHQgcmeEj7HQnVME2RXw6RBCflwIjCzh7rl9QctDNalgCmPoD5/MXbjjvK/HxEXxE7UpTzGdq5D+lw8RcpvEsEmrY30L1nsoJWPpWgtD2zFGg6fc4eQeiCKK+msXqb2+Oz1w8PW8nEGR+GBJPGNL9Jeb1g87J0V79NPNxHGuvZYqBymTwVb9sU1xVZZQmY/sMbblojm8kgPS8B12K4fiQY5lHRVeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(31686004)(478600001)(66946007)(66556008)(66476007)(4326008)(6486002)(966005)(316002)(54906003)(6666004)(110136005)(86362001)(31696002)(36756003)(83380400001)(26005)(53546011)(186003)(2616005)(6506007)(6512007)(8936002)(5660300002)(44832011)(41300700001)(2906002)(8676002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My83L3lSdW5EdnNnQWU1MzI0RkZrWGdaZjNXdWh0b2ZzMVVkOG9ZaHJGSFdP?=
 =?utf-8?B?a1pTclNYSTRCRnlzb2lKaG9sTmZPYkNTUSt4b0p4c3Rnd2V4YUV5blltQzRP?=
 =?utf-8?B?MWtpSCtZaDBTRjR1aFdldGJTTUMwZ2lvdDRMc0lzaDdGZGNMbVdiVlJYY3JI?=
 =?utf-8?B?OTVpMVptMkxlTEpTWmtZRXZnRHg0NlpkUWM5dUpscXJCeUFNWVB3RG5DSkxU?=
 =?utf-8?B?RisyMmxIOVJrWVMzWmF2Wm1vaDVEbklFa3E4R2REb1d6Q3BXaiswRGEwNW1t?=
 =?utf-8?B?M1lxOHpvOG9iK3FYckUxNjM1WklWU1JVNGUyY0d6bUw2Z1NpSkVUUFBQa3JQ?=
 =?utf-8?B?SHUwV0QvY1BRendJemI5UDBoQWZ2VkJYYTN6ZWNyOHJRaXVEek55S29IMFMx?=
 =?utf-8?B?b2tVTUkzbmd4SFE2Y2NNUHY5ODlNSUw5YXovckY4TlZ2aXl6M05NUzJBNzk3?=
 =?utf-8?B?NVdWb1J3dnlDWUpDc0xoYUNacWZJZktWbTQxVzY3R2JiODlhRFVNRHNWUEtM?=
 =?utf-8?B?b1p6bEV1RERTMzBDN1BpYjlkaUdPSlpqeFRpbFN6bFdFUTNhK2VQUzluOVhE?=
 =?utf-8?B?SWgweGcrY0xkODRyQjJNbEdkc0tYVkt4c3VxamhnM3NPN1Npc2tkVURGMThX?=
 =?utf-8?B?TllvaStmc05ubkNkR1lGUmg1Q016WDJ0NGR2K0NqU3BWS0lzMGRTb0oxek9O?=
 =?utf-8?B?RDVHOXE3L05aenRnUUU1VFgyOGxlK0VzVisyYnh0T2NpTXM5c0dqeHhJUzhx?=
 =?utf-8?B?MmJKc0ttN213c09FTUhzRjZ2amF6YUxWQ2wrWjhTMUF1M1d4ZkVBYUl0RERl?=
 =?utf-8?B?U2U5UW0wb2JLTTRqaVdKYW5nRUVFTVRqb1F0anlNYm1ReDBUVGRZNVJxL0V1?=
 =?utf-8?B?c0hTeXgrWCtROGx5Q1hQRzNNZm5GY2szek1PQVcxaUZ5b2QwZ2ppWC9NaFVl?=
 =?utf-8?B?c2dwYXpIV25EdWtGdnR4a2RhejgyUSthUzVWNXI0OEhWYXg3WU00ODFoRWM2?=
 =?utf-8?B?OTBCMEdvYlZDQVNlaXBnWXhUMFdvWFQrMUhvR2JyeXpPUUxFRDZTTXJLMlM2?=
 =?utf-8?B?elRKeDduS2phSmlZZ256eWc4cmtCZ3VzTHJRY0xaeGZaalJFS211WFlqakpC?=
 =?utf-8?B?TzRUejhvMktqbkxxNU5uNmUrYmNiczgxOEhkcksrU1Z6UTF5THAzRWtYWkxI?=
 =?utf-8?B?dzdIVDBLQUNzNXdxamluZ0VIYjdHTHFobW1rRDdUZWFVS1JiTElFMzNrUGJY?=
 =?utf-8?B?dmNDb21UYzVKRDJTYTRjL3NqMFBBT2pvN2N4aSs1c1dZYjZkR1UzYUxmWVhx?=
 =?utf-8?B?M2lJZm9mZDJVYzh6WHFpYXdQQ0VCVnNKVmZWdCs3SkRQL1A0Qk01elpRY0F6?=
 =?utf-8?B?Z3VSN3kwNXBkZWU0SjNpMnk1aGpRQkluNGtBK2hVWlBkT2Y5SG0yaHJORUkr?=
 =?utf-8?B?V3ZkVWpzR2FtMU9JNTBINCs2emtEODczVmZUanpMbjRwMnRrV05VL01icEtm?=
 =?utf-8?B?WEF4YStMVlRRS0xuem9UTDdTNjFPQXI3enVMVnNBRzBSdXRmbW5UeEFvTExN?=
 =?utf-8?B?MktmekFIWndzSFR5eGMrWThhLzNSVVJxVUZCMXBtUmMxYzBMK3BDMzZmT0Nu?=
 =?utf-8?B?K2RZNlRTejhkRXBSTVZvMlE4WjJvNjg0RnBNRlZ1VCt4VFNEQTVmVC9vN0Rr?=
 =?utf-8?B?bTI0dzFldThYV2dNTEFQWFpqMGNpNUJRNjJTNFVKVGR0Y3ZtY1VUblRnSnJX?=
 =?utf-8?B?N1Z1UEk0bURrOXFMVEFleW91UklnUDBPOUx4dGhFRTR1ZUhvbWwyR25WQ0pT?=
 =?utf-8?B?aGJ3a1VpVEUvMkZKbDBjTnZBZ2czWFd1NEUyS002RUhET0lFYVIrWEE4UkUy?=
 =?utf-8?B?WUJWdVpQaEgvK00zWmprdkJmd0VxemZ4bDNTc1NOaE53YkZhenBHcUhLUkoz?=
 =?utf-8?B?cnNOSmdOU2FRY1N2eWlxZnNWQVQ4TGV1SWhZN0NzMDZhMEwzamxITkR4cjVP?=
 =?utf-8?B?WFhWOE92Wmp6bHNNNHp0T01iVXFzL2ZsRHdoQU52NUswK2tEK0JQVTZYUW1J?=
 =?utf-8?B?TUNlbVduZEZPUWt6WEVSMFUraU51S1A3Ry9SakFobk1TL2ZtTnI5ZHc5SFE2?=
 =?utf-8?Q?5H5xVTbU3YYznUjOk1pyKjbl5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a42082c-ede0-477e-2199-08db50a8983c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:15:24.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESAtZq1OhveTjom3m9XZ0ArmOT6CuYrMraN0COie/MOLbfipOc7+0wPetLCQnDTSbG7QnwL1bvUx9BhXYvItIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188
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

On 5/7/23 23:09, Huacai Chen wrote:
> LoongArch now provides kernel_fpu_begin() and kernel_fpu_end() that are
> used like the x86 counterparts in commit 2b3bd32ea3a22ea2d ("LoongArch:
> Provide kernel fpu functions"), so we can enable DC_FP on LoongArch for
> supporting more DCN devices.
> 
> Signed-off-by: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Applied, thanks!

> ---
> V2: Update commit message to add the commit which provides kernel fpu
>      functions.
> V3: Update commit message again and rebase on the latest code.
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
> index c42aa947c969..172aa10a8800 100644
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
>   		migrate_disable();
>   		kernel_fpu_begin();
>   #elif defined(CONFIG_PPC64)
> @@ -128,7 +130,7 @@ void dc_fpu_end(const char *function_name, const int line)
>   	pcpu = get_cpu_ptr(&fpu_recursion_depth);
>   	*pcpu -= 1;
>   	if (*pcpu <= 0) {
> -#if defined(CONFIG_X86)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>   		kernel_fpu_end();
>   		migrate_enable();
>   #elif defined(CONFIG_PPC64)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 01db035589c5..77cf5545c94c 100644
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

