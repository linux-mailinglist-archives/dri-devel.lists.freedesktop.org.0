Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76888C876
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4290E10EE0B;
	Tue, 26 Mar 2024 16:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zm34060w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2091.outbound.protection.outlook.com [40.107.95.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321C10EE06;
 Tue, 26 Mar 2024 16:04:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9OyNG3mczypzDLfsnvqJVBKj/xCqLqvS5i/QSaMECGP2S22AZzpRzQLXhSoWpCJwy95r2O1IXCA92uTShqxRqHkcrSLUIgM71MAXdAqHd7hbKscKSazGNFYDisoxCIzxo47HKoklrJy3HVq4vPs35JpO/uUU8ZONOWviJ/Zy6dOqIbkBzxXYNxWlLlXZVMC6dIO7DmKyuHsV7K+M31pCPL1m0SQZjXIyyqwrJxeDHRrL24p78R2pUv1S2tYFckykUEVJPkuxka3UEfGxl4/Jb5fPWcKYVV8HwwEpOrkScFd66Zkx5acmDbxWOMXv4zvQVULMigGE4B98dmcJJQLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlM2WUgQ8IFzMds0j4DUEUxfyOFk4QfhQ3N2ivwaNhg=;
 b=JkkluEtib836Md3LGzPbAUmFs0YJTmVly7X/szagI/6rM3o7RP+2wL6PeW9OtspDdROM+RLMnYrxZHAiepNhsLw86uzYDw9/PDa8Q+r8/ZT6iJ5WjO/ANpNmJL61lbaNCpoAmVUGwIL0PIH+Sn8wUe/2ZEwojju+xlfT3D1E39UXRTBzEzu4toeYdv0m16Ak91O0VvQEBKddKevLF//MZSFy3iFKjZNlJIh13Vn5qF8r20EVeK823glHo7sylYSFegjS5nBn8tyTXffMOsw8Hlj90gmLDJdrYGSnG7Qywy6mHVodKPKPK+8iREEi6/fKYSGusY7ZutF0H365duluxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlM2WUgQ8IFzMds0j4DUEUxfyOFk4QfhQ3N2ivwaNhg=;
 b=zm34060wcM73RXDSxXp+vK7BIR693fcKUgWLWIl30iA2u52Hpe7LuP28xeLUGnGXKhWm5N3PKOjErhSgT2/wMt0xEkzIaRqpzsSObqV0gre4mY47/qgUShesWcXKSnTMvPuzxwBV5PAZhrJMDJ0cCA65OEV3hDC/oIxSn4n50Ws=
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 16:04:41 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::a084:ca6e:2c6c:1664]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::a084:ca6e:2c6c:1664%5]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 16:04:41 +0000
Message-ID: <8a3ae5bf-4cb7-4201-8388-48135114886f@amd.com>
Date: Tue, 26 Mar 2024 12:04:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
To: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 amd-gfx@lists.freedesktop.org
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20240326144741.3094687-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0221.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::12) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|MW4PR12MB6731:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZiNBN5hJyUgycB4OxG0mqDUATb9BgPuJqQhzAIx5V5qo9BYpnxj1pSEj1P5+mJByVyUeg/S+VESqV6fWVcgypXcY+SvGN2iQC4Fj9M7u6FhRcoQveGpmK5i7AviPm3ZydK3JkF59XZzwU0xRqr9vVM4Y7gSZFDcggwoRGbEGVucCfkYz4vtEOVn7BgfQ4fxQTCuTEEnpk5bXkBNNGTILIVBChu6a24oC9wozsJHkxzCq5XEucvZVn8ha/4kPCxbJ7qRyRigEgzXPHEuk+Rr2KSagl4hgFEmbDEp92i5bMSnOTPml/yvM1behHLzuCGvq89Hjh2zxAVmFLjxEYgd2sp5BXFLLoNIfLRxVAOauuGkJbaHjvSvGlUTGkujxDP0ft7O/CRHxsCVHOy1T++ZKJCg6xm+PNEOtTZrSAW0NApb/7Oi2jrQDvw17MENRX8ihRVvb5ZvECAc5g8xTGBafXfaewKCtVi5S9N0koq6FtL135a/r5zNLmqgHP+vawAEqqJ2fb41Rihja4vrS8/uv+l66dKttHdlJ9uizRv/1IGKTz0oDQAWRiykYOWK6RlzYDFr5bQR7aPt3P3V5nCpGGijJvCzaimzufOcH6DPsqJiOAa5zsgp+ldUxmqnjwk3ESTkm4oCPO6jGMMuV3SyNJNwd0UObt9cgdRqhDgXg7agETrExhgxyrHxeM68kWndrxKdaU95TFVDeBdRj9i9NVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUhnclNDTHRsREdkWi8xcEg4SWRKaTVudUNKNmRhSStpNWNycjVLaFVDaVdO?=
 =?utf-8?B?azkxSDdrQ2I0L1FhYVl0dWQ5R21HUFJpMzExc2pRR0RZVUJWMVBMMFZFZzc5?=
 =?utf-8?B?NEdKeCtNYWE2Mi9pcmNtYnRBMys1b0lnNWd0WmdxcEIzQXEwY0V4QlM3dkVS?=
 =?utf-8?B?TmFybzNSVnludFpQRzhZTmxTai9EMVpUSDdqT0d2MjBWZmpOM0p0c3h1dkM2?=
 =?utf-8?B?OVZYdmQzMHRTek5tWVYvTiswNHdkTkpWd0pMMjVadkZRb2RINzBlWkZiQ2M0?=
 =?utf-8?B?NDFuWHNVRTEvNXpWbmdzMlRDZlNvVEd5cWRZWjRaOE1UWjduSW9FMlpzZHd4?=
 =?utf-8?B?OVFxZXl2b2Y5U0w5cHNPVWdpVW5FUVpMR0toa2p1dTFWMGE3UCtadWhqSTgy?=
 =?utf-8?B?YllXNkYwYUVTMXZqZ0x5TVlRektpUktSR1JqN0tiM3pZQkpMRjZHaWxTdXJN?=
 =?utf-8?B?bUkrMnh4ZXZ1dEpKeUFOQXRtc0ROVHlWRWoyK05rSUFqNDlIbVBjY1FKKy9w?=
 =?utf-8?B?MWhabFArM3pSQktnOHZDOVEvamp0T3Q1YjlPV3I4MkF0YmVUeE5vM2h1L3lY?=
 =?utf-8?B?aUxSbnJRbXdROUhLRWlEVlBWMUFYcFJoelpNQllKeXVUdGxXY0NHd1JWVzl2?=
 =?utf-8?B?cFRaTkM4RjR0WXU0TEdxM3hlaThRWkhJeTE2VVdHa3BTckZWTTU2OEE0RlB6?=
 =?utf-8?B?Qk5pYUxZZXdnRWZGc1Nod2NwaWhERXVrVnp3MWorVUdPU1paR0JlaFNGNlJl?=
 =?utf-8?B?Nzc0TEVxUFhYQ3daWEVkcXNjQ1VDZnJkRVBVWXVxNXYxVnp2bWNqU3FWWjVt?=
 =?utf-8?B?elc0ckVLMStJRkhiZWt1N2RBM2dBcFBiUUFCSS9JNzVpY0R2d1pUeTJZM1JM?=
 =?utf-8?B?aHFhbDFCU0ZQZUFsVXc1dThqSjJTY3pNZHlvcnltRWtJQmtYM01IWnA2eTNU?=
 =?utf-8?B?Z1ZSRDQ0dXF3a3lDL0NyeHRzMTdWUVhRMU5hbFFFdmlORHlZMFZRdlMvN0Jy?=
 =?utf-8?B?a3hJOTBoa29wak5Fb3dBK0NLZ0hYUWJXV0VIdUdGN3ZLZkNISS8vYnUwVXdS?=
 =?utf-8?B?Wlg0R0hTaTkyeHBtZnZuWEp4WHZIK1JBcGJIM1BmU3Y0TmdESU9aeVExOXlU?=
 =?utf-8?B?Y3VrK2JOWDFIa3hUOWY5LzFKUmFDcEpFTnlxdDNUWEJNS2dramx2U1ZwNmsx?=
 =?utf-8?B?K2VGaXJDd2NGMkRBZjFRKzZpcmZuRmQ1ZWNGU1lCSm1yVE54VS9Jekp2MU5u?=
 =?utf-8?B?QVc1NnRGV3h3dzRGRi9GR2dZV0xncWFBMUxyaElPMXdLbFp3amZ2SXNIZklR?=
 =?utf-8?B?dTluKzZDc1pOVWQ4ZkUxVzRjOW9oRFV0MEZBZlpES0ptcmc2STgzRExjMDRK?=
 =?utf-8?B?M09Id3l6c3R4d1dBUE1KV0xITVJkVmRPeEVCUlp6S2lxTlZaRmRFYk81M0c4?=
 =?utf-8?B?Q2I0UEdpV1p1elpmK0pvSG8wNVVlOENIZkZXb0crblJPUEtKdGlzZFE3V1JN?=
 =?utf-8?B?WW5qalhlVG5OZkhUYjdGNmlHbm1hZndzQWN0OThFb1N5YlVGNlVzNTN2dGI2?=
 =?utf-8?B?djZVZmcvZHVvdkNmWlhKUHorMHdVWXNxU1NNaXE1dW1KS0ozNFdTdXdPcktI?=
 =?utf-8?B?cURNTFhjNDlxTUt5Z3Y3OStQVEM3V0h1RE5vZ1FEalVMQk9lNGZBT1hveG5F?=
 =?utf-8?B?S1BtUVFLYkMrN0lyOHZQN2FiUThaT1BmTzBBc1ArZVh2ZndpSytoN1RxNk9X?=
 =?utf-8?B?ZDFXS1JCM3RHWW5zYW1GYVN2SG82b0NFa1pYaWlyRkNPYzFIS2xRN3MwOVN2?=
 =?utf-8?B?MVVSZHhCTit4d0IzNnVjWXJPYnRlVWh2NlRXbmt1bEVXaEk3V0RRRlFFald1?=
 =?utf-8?B?S0N4SzczaTY4bWZGRTBZQjV2ZHE0MWN4MW9idFMrUm5TK2J6L0h4SlpzWWc2?=
 =?utf-8?B?RFgyWUhtS095M1RlRjhnQ2R3UmhOSmxlOUphZkIrM1BNTmhRRkNtTDFYSVdE?=
 =?utf-8?B?M0hidWdJSUdJb1dNelJtdHdsZjc1a2x3bG1GLy9ibUEreWdUSWVEWjUzZkdR?=
 =?utf-8?B?N2Q2amovS1B2UEd4UmpmV2FES3BnM0xjeUpNWEhCVFViZG45RmJVMThsNnVM?=
 =?utf-8?Q?8SppTiIEuV/wcSan6tv/AmWfZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f48f3e3-df5b-45d1-5c09-08dc4dae7201
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 16:04:41.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxnnEy6oLSaV8XiMI0gtm5DUIpMi5cJ1BQ7DcB6eVowhFRSB5vgd2f6qWJ3sqzqaPPyOie9BBULWNBd3hw6/XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: amd-gfx@lists.freedesktop.org

On 3/26/24 10:47, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The -Woverride-init warn about code that may be intentional or not,
> but the inintentional ones tend to be real bugs, so there is a bit of
> disagreement on whether this warning option should be enabled by default
> and we have multiple settings in scripts/Makefile.extrawarn as well as
> individual subsystems.
> 
> Older versions of clang only supported -Wno-initializer-overrides with
> the same meaning as gcc's -Woverride-init, though all supported versions
> now work with both. Because of this difference, an earlier cleanup of
> mine accidentally turned the clang warning off for W=1 builds and only
> left it on for W=2, while it's still enabled for gcc with W=1.
> 
> There is also one driver that only turns the warning off for newer
> versions of gcc but not other compilers, and some but not all the
> Makefiles still use a cc-disable-warning conditional that is no
> longer needed with supported compilers here.
> 
> Address all of the above by removing the special cases for clang
> and always turning the warning off unconditionally where it got
> in the way, using the syntax that is supported by both compilers.
> 
> Fixes: 2cd3271b7a31 ("kbuild: avoid duplicate warning options")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

For the amdgpu changes.

> ---
>   drivers/gpu/drm/amd/display/dc/dce110/Makefile |  2 +-
>   drivers/gpu/drm/amd/display/dc/dce112/Makefile |  2 +-
>   drivers/gpu/drm/amd/display/dc/dce120/Makefile |  2 +-
>   drivers/gpu/drm/amd/display/dc/dce60/Makefile  |  2 +-
>   drivers/gpu/drm/amd/display/dc/dce80/Makefile  |  2 +-
>   drivers/gpu/drm/i915/Makefile                  |  6 +++---
>   drivers/gpu/drm/xe/Makefile                    |  4 ++--
>   drivers/net/ethernet/renesas/sh_eth.c          |  2 +-
>   drivers/pinctrl/aspeed/Makefile                |  2 +-
>   fs/proc/Makefile                               |  2 +-
>   kernel/bpf/Makefile                            |  2 +-
>   mm/Makefile                                    |  3 +--
>   scripts/Makefile.extrawarn                     | 10 +++-------
>   13 files changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/Makefile b/drivers/gpu/drm/amd/display/dc/dce110/Makefile
> index f0777d61c2cb..c307f040e48f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/Makefile
> @@ -23,7 +23,7 @@
>   # Makefile for the 'controller' sub-component of DAL.
>   # It provides the control and status of HW CRTC block.
>   
> -CFLAGS_$(AMDDALPATH)/dc/dce110/dce110_resource.o = $(call cc-disable-warning, override-init)
> +CFLAGS_$(AMDDALPATH)/dc/dce110/dce110_resource.o = -Wno-override-init
>   
>   DCE110 = dce110_timing_generator.o \
>   dce110_compressor.o dce110_opp_regamma_v.o \
> diff --git a/drivers/gpu/drm/amd/display/dc/dce112/Makefile b/drivers/gpu/drm/amd/display/dc/dce112/Makefile
> index 7e92effec894..683866797709 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce112/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dce112/Makefile
> @@ -23,7 +23,7 @@
>   # Makefile for the 'controller' sub-component of DAL.
>   # It provides the control and status of HW CRTC block.
>   
> -CFLAGS_$(AMDDALPATH)/dc/dce112/dce112_resource.o = $(call cc-disable-warning, override-init)
> +CFLAGS_$(AMDDALPATH)/dc/dce112/dce112_resource.o = -Wno-override-init
>   
>   DCE112 = dce112_compressor.o
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dce120/Makefile b/drivers/gpu/drm/amd/display/dc/dce120/Makefile
> index 1e3ef68a452a..8f508e662748 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce120/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dce120/Makefile
> @@ -24,7 +24,7 @@
>   # It provides the control and status of HW CRTC block.
>   
>   
> -CFLAGS_$(AMDDALPATH)/dc/dce120/dce120_resource.o = $(call cc-disable-warning, override-init)
> +CFLAGS_$(AMDDALPATH)/dc/dce120/dce120_resource.o = -Wno-override-init
>   
>   DCE120 = dce120_timing_generator.o
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/dce60/Makefile b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
> index fee331accc0e..eede83ad91fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce60/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dce60/Makefile
> @@ -23,7 +23,7 @@
>   # Makefile for the 'controller' sub-component of DAL.
>   # It provides the control and status of HW CRTC block.
>   
> -CFLAGS_$(AMDDALPATH)/dc/dce60/dce60_resource.o = $(call cc-disable-warning, override-init)
> +CFLAGS_$(AMDDALPATH)/dc/dce60/dce60_resource.o = -Wno-override-init
>   
>   DCE60 = dce60_timing_generator.o dce60_hw_sequencer.o \
>   	dce60_resource.o
> diff --git a/drivers/gpu/drm/amd/display/dc/dce80/Makefile b/drivers/gpu/drm/amd/display/dc/dce80/Makefile
> index 7eefffbdc925..fba189d26652 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce80/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dce80/Makefile
> @@ -23,7 +23,7 @@
>   # Makefile for the 'controller' sub-component of DAL.
>   # It provides the control and status of HW CRTC block.
>   
> -CFLAGS_$(AMDDALPATH)/dc/dce80/dce80_resource.o = $(call cc-disable-warning, override-init)
> +CFLAGS_$(AMDDALPATH)/dc/dce80/dce80_resource.o = -Wno-override-init
>   
>   DCE80 = dce80_timing_generator.o
>   
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 3ef6ed41e62b..4c2f85632391 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -33,9 +33,9 @@ endif
>   subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>   
>   # Fine grained warnings disable
> -CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
> -CFLAGS_display/intel_display_device.o = $(call cc-disable-warning, override-init)
> -CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> +CFLAGS_i915_pci.o = -Wno-override-init
> +CFLAGS_display/intel_display_device.o = -Wno-override-init
> +CFLAGS_display/intel_fbdev.o = -Wno-override-init
>   
>   # Support compiling the display code separately for both i915 and xe
>   # drivers. Define I915 when building i915.
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5a428ca00f10..c29a850859ad 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -172,8 +172,8 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>   	-Ddrm_i915_gem_object=xe_bo \
>   	-Ddrm_i915_private=xe_device
>   
> -CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> -CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
> +CFLAGS_i915-display/intel_fbdev.o = -Wno-override-init
> +CFLAGS_i915-display/intel_display_device.o = -Wno-override-init
>   
>   # Rule to build SOC code shared with i915
>   $(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 475e1e8c1d35..0786eb0da391 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -50,7 +50,7 @@
>    * the macros available to do this only define GCC 8.
>    */
>   __diag_push();
> -__diag_ignore(GCC, 8, "-Woverride-init",
> +__diag_ignore_all("-Woverride-init",
>   	      "logic to initialize all and then override some is OK");
>   static const u16 sh_eth_offset_gigabit[SH_ETH_MAX_REGISTER_OFFSET] = {
>   	SH_ETH_OFFSET_DEFAULTS,
> diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
> index 489ea1778353..db2a7600ae2b 100644
> --- a/drivers/pinctrl/aspeed/Makefile
> +++ b/drivers/pinctrl/aspeed/Makefile
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   # Aspeed pinctrl support
>   
> -ccflags-y += $(call cc-option,-Woverride-init)
> +ccflags-y += -Woverride-init
>   obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o pinmux-aspeed.o
>   obj-$(CONFIG_PINCTRL_ASPEED_G4)	+= pinctrl-aspeed-g4.o
>   obj-$(CONFIG_PINCTRL_ASPEED_G5)	+= pinctrl-aspeed-g5.o
> diff --git a/fs/proc/Makefile b/fs/proc/Makefile
> index bd08616ed8ba..7b4db9c56e6a 100644
> --- a/fs/proc/Makefile
> +++ b/fs/proc/Makefile
> @@ -5,7 +5,7 @@
>   
>   obj-y   += proc.o
>   
> -CFLAGS_task_mmu.o	+= $(call cc-option,-Wno-override-init,)
> +CFLAGS_task_mmu.o	+= -Wno-override-init
>   proc-y			:= nommu.o task_nommu.o
>   proc-$(CONFIG_MMU)	:= task_mmu.o
>   
> diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
> index 368c5d86b5b7..e497011261b8 100644
> --- a/kernel/bpf/Makefile
> +++ b/kernel/bpf/Makefile
> @@ -4,7 +4,7 @@ ifneq ($(CONFIG_BPF_JIT_ALWAYS_ON),y)
>   # ___bpf_prog_run() needs GCSE disabled on x86; see 3193c0836f203 for details
>   cflags-nogcse-$(CONFIG_X86)$(CONFIG_CC_IS_GCC) := -fno-gcse
>   endif
> -CFLAGS_core.o += $(call cc-disable-warning, override-init) $(cflags-nogcse-yy)
> +CFLAGS_core.o += -Wno-override-init $(cflags-nogcse-yy)
>   
>   obj-$(CONFIG_BPF_SYSCALL) += syscall.o verifier.o inode.o helpers.o tnum.o log.o token.o
>   obj-$(CONFIG_BPF_SYSCALL) += bpf_iter.o map_iter.o task_iter.o prog_iter.o link_iter.o
> diff --git a/mm/Makefile b/mm/Makefile
> index e4b5b75aaec9..4abb40b911ec 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -29,8 +29,7 @@ KCOV_INSTRUMENT_mmzone.o := n
>   KCOV_INSTRUMENT_vmstat.o := n
>   KCOV_INSTRUMENT_failslab.o := n
>   
> -CFLAGS_init-mm.o += $(call cc-disable-warning, override-init)
> -CFLAGS_init-mm.o += $(call cc-disable-warning, initializer-overrides)
> +CFLAGS_init-mm.o += -Wno-override-init
>   
>   mmu-y			:= nommu.o
>   mmu-$(CONFIG_MMU)	:= highmem.o memory.o mincore.o \
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 3ce5d503a6da..c5af566e911a 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -114,6 +114,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow)
>   KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation)
>   KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
>   
> +KBUILD_CFLAGS += -Wno-override-init # alias for -Wno-initializer-overrides in clang
> +
>   ifdef CONFIG_CC_IS_CLANG
>   # Clang before clang-16 would warn on default argument promotions.
>   ifneq ($(call clang-min-version, 160000),y)
> @@ -151,10 +153,6 @@ KBUILD_CFLAGS += -Wtype-limits
>   KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
>   KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
>   
> -ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CFLAGS += -Winitializer-overrides
> -endif
> -
>   KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN2
>   
>   else
> @@ -164,9 +162,7 @@ KBUILD_CFLAGS += -Wno-missing-field-initializers
>   KBUILD_CFLAGS += -Wno-type-limits
>   KBUILD_CFLAGS += -Wno-shift-negative-value
>   
> -ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CFLAGS += -Wno-initializer-overrides
> -else
> +ifdef CONFIG_CC_IS_GCC
>   KBUILD_CFLAGS += -Wno-maybe-uninitialized
>   endif
>   
-- 
Hamza

