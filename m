Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EBC90D396
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0010E68A;
	Tue, 18 Jun 2024 14:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yg/D+mfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6422A10E699;
 Tue, 18 Jun 2024 14:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez3t3Lp4a699lwZBnaRUzCnauhbvRAsn4M0j0Bzq3X056CkVJZo9Wgs5R+r6jHnk15mT3MiyEOyB4wAcFbZKQi7P2NX938qZNuKo0QUZB0W7ly3GwaIRmKO03qFa2zIQX/Q+JqVcmgE+yZ5P5HvWEbrbOMeRht7+EY8WxrsBdi5K+8mOeyKia5b8DqZXgTLG/o/sifc+XPCXt+7T5mLeJwayKZ8mdf9Kp0K4GUcALv1q7p8xm+NhiINSFuLbOICwO0JbUUaM6Zx38aO8AY19sujQQf5CbXQxldDvfl83PdDSg6UIPYNHaKtnJals8ksnDrQGcV7hFNGTGkhv/ewB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O24RGwbG2nA8T3APyP2V8XPYCrVLrczVJWyV+N4qRLg=;
 b=n1Ze7DrTuvFvBQ+u2QNawNzeQmMeDX6mXgncbO20dt20gPV12qDhwXplgZoDFqrSMO3ceES/6g1vKXOBB1DkfbZIlFM+73hiQpTVn+Q4bmB+W6xoyVAHJ56+r/INE41AjMnTRnD0TytgqyvhgNdTAZykNMCMoOqd384K+gcA47OOpxFzLpzHu7ledbrLc5ATzf7q7DEkDN8zYfw/I6Cr93ZISHuGEqkDPyXdXHZw1jbAnFXVJZYtOx5ctJOjpRMC28lkBi9k8j2imiIH/wtngpZ0ZFHUd2xMCWne/owV2cIlxuRdfmkaXLj7iBG8ICHj/TOJIUG7mwNIere3/2Vp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O24RGwbG2nA8T3APyP2V8XPYCrVLrczVJWyV+N4qRLg=;
 b=yg/D+mfvtcM4tOW0SZe2Xp1RamtqB+u0xWlInm+BtyJo4LTjX2j/HuVOg6LKEo2VUWn9RHYs6k11APn+mm0Iuhw3v4i1unaUChf9Iw17Sn+00o4rq5oWuNgpnuPoSmfk2kKx/S1lch98TYp0ly//lGze8PLmEVd6qD7XN2DUGRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 14:08:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 14:08:26 +0000
Message-ID: <58253c2e-25a2-48c6-bcd4-5bc3bbe03296@amd.com>
Date: Tue, 18 Jun 2024 10:08:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Disable CONFIG_DRM_AMD_DC_FP for RISC-V
 with clang
To: Nathan Chancellor <nathan@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
References: <20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-v1-1-a6d40617dc9b@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-v1-1-a6d40617dc9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::35) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN2PR12MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: ef973d11-36c0-4ac6-609b-08dc8fa01eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNsdDRsY2kybEFrSEFoM2RtZ0F3K1pDYzlHaDRiL3A4N2UzdXdnNlJ5YXBj?=
 =?utf-8?B?UzQrOXVzTzNES3FWUWRGQmJYNWdIZ1d5Si9VbmpobGp4ZkYwZzltVzE3dS9V?=
 =?utf-8?B?QzNqMlFBVit0VUJBVnJVdUZuZ2VvbTgvNzVIL3NEazhwRkpDcElvbjFRYjdG?=
 =?utf-8?B?SURhYTFqTkJNTmVnektTbHBnUHpEcjBRTFd1L2ZpRXFzTHVqYnpoZHFIbXpv?=
 =?utf-8?B?ZDF0NG9acmlBVi9qdmhFZGJOSnlPYU41eElBakU2d015MHNoTVJsbEVhNkVx?=
 =?utf-8?B?eWpJcUE5a1Ivd3ExZWswaEFEeXpublJzQ282WXRFQ0Q0UDgzMkZmWWFScHpM?=
 =?utf-8?B?MmpBV0FsUkZNYTVkWkQ1TUpBSTZaekNYR3FNQWNXTmpJNXk3b2lHNUVCNzla?=
 =?utf-8?B?eTJPNkNoaHh5UE9lTUl3ZHdWcGRPdEk4elRycnV4VElZWE1hQmgrWmRoOVR5?=
 =?utf-8?B?WFo2a2EwZ21WSHVrNE9ESk9RazFHc2tkaGpWU0lUZ3B3ZEV2NnBvNXFjdVM5?=
 =?utf-8?B?YjNweEduTU83TTJRYXpsVDhsbjJPTHRqK0tObk9VcERuaDNGOG9vQklibU5m?=
 =?utf-8?B?dHRBcS84RStyTHVrcVhkZmhnYTZMa2R6UlhLR3dxaDhHK3dxekFFUldiNTZz?=
 =?utf-8?B?aUNQQlVrOUNERzNKWE9NQXFtR0dCdkdYMFRQSTRoZURRQjgzVllSTlBJVE55?=
 =?utf-8?B?RlFBK2pWSlk3cVU4QlhGR0NyQjJXMnR4dUtkOVVUTkpJUlJ2WUk0Wm9VTkpI?=
 =?utf-8?B?MStEYUZOVXRrZnM3VW1GcVJxRGw3V0hpT3ZidU5zSnJXUjZHalpsV2Y2TnVC?=
 =?utf-8?B?dW5zNUFDQ1B5ekEzR0s1dnVXK1k4THlyUCtsS1p5WWZnMy9Wa0lXdFRSQXFS?=
 =?utf-8?B?dEVQTy9uN1g5R0hwV3ViNU9UOWNMdDl0Nng1ZFRLQWpFTW9GZ2xzdncyRnZM?=
 =?utf-8?B?NFRwaGFrMHhKMGc5dU4yTlRvNmYrZmlTTDdhbHhWZUErVHpoSDVOeXJNRjdJ?=
 =?utf-8?B?ZEV3RmpYREFNdGNXdFJwTkFZUWlrZ1VjdERTRnU3SDdpZlFxQTRETWtJcG44?=
 =?utf-8?B?VHN5QXZRKzh2RzA3OVN5TEQ5bklHYmtJL05ocDNydjdSRjJyWGM3ZEFMRHlF?=
 =?utf-8?B?WUhJR25BS0dmeHF4K0lCYkdDdm9sRTZoVkNJKzJmOTVaZVF3YlhlTFZpNkMv?=
 =?utf-8?B?ekVvNWZRSzAyR2s1TDF0R0dydDV2eTZLMXF2M29HY0l3K0x0cE1yc01XQlRL?=
 =?utf-8?B?dXJIakp3YmFGOUFRZ0Y1azlFVTF1by9GMElRVys2SlhGR2I3VTBUN2pUNGJk?=
 =?utf-8?B?azlGWWNTR2FiOTVnT3FRaGdXak9EZ3Z1NFdSSkl4WHVacytoRGxXY1orV0Fk?=
 =?utf-8?B?cm1zMWMxMWt6Zkpqb08wOFZZaGliTXN4TFpBMUhEcHB3c2U1Yk16SnY0TUk1?=
 =?utf-8?B?aWpOSTFzL05zbjNpT01DUzJIVU9XNDJGRnUxWXFZd3ZrSUJla2VFcjRiOTlD?=
 =?utf-8?B?eklLd241MTM1Z3RlejdlQmp4K0cyOVJoS0pzTEJrMFI4aGsrelpRSzVhQjFz?=
 =?utf-8?B?aGQvUU1qdmtkSlMxK3lVNkp5Y1FJZExJZTY1Y2U2V3F6RlZyZ0ZzdnphSzV4?=
 =?utf-8?B?bGlLU3M1ZEdFeWRtL3ovay84dElHYUhlb3RYLy9EMEF6d1lodDFEVzJ0M1VQ?=
 =?utf-8?B?OGxQVlpKVVdHUjhra05XUTlUa0FWckVXUTczQmdlVWNQYjRBZUNNc2d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(7416011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajBZYmpBYUxPRWJJVXFxWlFaTnBPR0RKeWRLTDF6Skh6clFzTkJmd2lrMC9y?=
 =?utf-8?B?M2RDMm9SK0pVTlh1T0dDK2xTV0t6YTdYTTl5SzRjNUdRaEJsTWEzd0tPUVNw?=
 =?utf-8?B?MVAxVmVWVkdCaHRjWnc0OXp5SUxwemxPYXhvNlp5TFJpRnhudEFnVEdMbXd6?=
 =?utf-8?B?V0QrclQybzRRN2ltUnFnVFZSNGQxaVVUZTNZTlgzVnlocHo5Qnk4NjBUL1JT?=
 =?utf-8?B?MGxDRk9Md3E1VkZaV0tGOFJoZnU4SkU1M3Q4ZzlPNXdGSjNRTmdyOEpTUm9Y?=
 =?utf-8?B?VDYxV3ZOa1RPQVphWlZrMjVQWmFlODhGZG9XTzgvWEo3UU5kaGo3TUxNSVMy?=
 =?utf-8?B?ODJyTkRPNlZBTzRqaXg2dFJiSm41aTFSeVV0QWlBYktEOEpCdm5Ga2lrODVJ?=
 =?utf-8?B?Rk00SWYxM2FzWWFFbHdNMmtiN2FDQzlDZ3hvR0lCRkFXdnN1NXRWMlF2aHU4?=
 =?utf-8?B?MkFlWmRNNDYxNEdJMThxS2xIU0daWUZ2ekN6d2tJVzYyNURyOW1IWURXSW9K?=
 =?utf-8?B?UzZTU1BtYUY5S2hjc1BYZndaR0g5NDI1YXA4WjVZcGduN1ZQek03QWJWTjBZ?=
 =?utf-8?B?aE5BNm85U2hzUlh4a0lCYkNjM1N6RnI1bW9NNEY1WkhZTTIyWTdPTHhnMTVV?=
 =?utf-8?B?ZENxY0haL21QUC9qY1RiMHNMaHJrYjkrL0VFdDVjUFlmK3RSZkh5WWgvb25F?=
 =?utf-8?B?RXovalV1cWtsdWp6eWNWbWR1OGFrNEszRmtSWXZXRXlCa09qdUErK2pNV1FB?=
 =?utf-8?B?cytRSEZ4NCtteVBVdXFaRU16a2I2MDJ0RUNWa0lTQzE3N1JUNzZWVFpDVWhD?=
 =?utf-8?B?T1NXcDhQbWxTeUNQajY2WEx6d0ZSQy9DRXRzMTJiT3BrKzl3YmRvMFg1TW13?=
 =?utf-8?B?cXJyTm1jN1NRbnRlc2dtVU1wcWdTODhMSFdSSFgwRGRsRHpHMFRPV1BmS0R5?=
 =?utf-8?B?ZXIzVnVVWHptSlllUnVOdFFWODRjYXArWkhUUXM3TFdxNWJmM3hCbU9aR3dN?=
 =?utf-8?B?emZQMWp1ZzNEbGc1K1E3SUdzRUU4WGNoYStJVUhvQjdIblhhbHZOQzBrb2FG?=
 =?utf-8?B?UDVXVEVYQTA2YjNjTktjL0VMbzl2eTRqcEM2cTk3bk1reHFQTWNrQ20vaitv?=
 =?utf-8?B?UHNjd2dxWGFzaG9ENElBNndNeE1Gd3ZMOHkxMXVsT0xJdy9ibVU1eGxta1ph?=
 =?utf-8?B?V1h5aVBxVVNTWW1sQlF6WER6R2VVNEpZd0d2bXQwR1JtM01oV0tMV0MxRytq?=
 =?utf-8?B?d0xSZ2c1RS9SNjVBblZLalJLZmQ2Nkt0T1ZmRjg0QVpESGQ0SHlxa25Fa2ZD?=
 =?utf-8?B?N2xUWVIreGNWckFyVzhYQnZzdEJYelhFUUJsRytwSSthditCQ0dsVGVzSEpD?=
 =?utf-8?B?ekxuczVnTTRNU2p0cFFObVJPRGVzSUNGQ0Z0elQzMlAxTkVRZUFhZHBKb3JO?=
 =?utf-8?B?TEZhNDVSRFBtdnRDN3hjdzhNa2FuWnNoMnplN2JGWnc2N0lWV3JxMUtzdjdi?=
 =?utf-8?B?ejIvSUxEbGpYcHZvaUxEN25mU0RBQ0U0cllpaTVTNkRJZ0FYTGpsVDZKWUFN?=
 =?utf-8?B?c3VJRTVmSWJOZCtLbitnWEROdWM3RUQ3c2dEWTl5Q1UxQ21JRmlJd1V4SGlP?=
 =?utf-8?B?bTVKRkZqZlQxNWFueXdWcklGanRaM3dtbW1DMXg1SjlYTFlyT1FLSGJGbFov?=
 =?utf-8?B?bGJUeFdDdkVVSnRsSXZqcHVrdjA0ZTZlanpJcEFoMk0vYjg2b09tQnFxenA4?=
 =?utf-8?B?Q0NZL3Z2QlVrSElsWWNYcWRTOHZGYitEYzhKY0h2SlJlazhCQWt1bVFVNTZi?=
 =?utf-8?B?elZMazY5ZFVzTnBlaDNSWEFvVEl3OXRwTjZsU1BtQjJuVjB1MVBUeXVwTnBN?=
 =?utf-8?B?V096c2FXZFBBN3phb2RoellCcXZlZWx5WWJCUUxubEJwOHdtQklwb1Bxbk91?=
 =?utf-8?B?STZUMk92U3NjMFo4OGw3ZzZNVjlST3NySzBRSktZUzJ4UjUzdS9Lb2lsQUZ2?=
 =?utf-8?B?MXVyWDN1RGFXMEh3QWVEU1ZnMGVSVm4zZE5EOWNUM1dPSnZBbTdpNTY4SWNG?=
 =?utf-8?B?RDA1UXpmKzlrd0xjWVZjc1JrbFgyL0JWSGQ1b243emlDalFMeGdYeFhJWEcr?=
 =?utf-8?Q?21wlaZFmGCd1hQ8cainj9Whp6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef973d11-36c0-4ac6-609b-08dc8fa01eec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 14:08:25.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfMyWaFDJYmPKDOEE906ixE2MFQWHunaM8k8PSB7IVsdMh17p7umOY7A2tBRf1dJ45Xr0eH7J1bs7DXnwSW0sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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



On 2024-06-14 15:54, Nathan Chancellor wrote:
> Commit 77acc6b55ae4 ("riscv: add support for kernel-mode FPU") and
> commit a28e4b672f04 ("drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT")
> enabled support for CONFIG_DRM_AMD_DC_FP with RISC-V. Unfortunately,
> this exposed -Wframe-larger-than warnings (which become fatal with
> CONFIG_WERROR=y) when building ARCH=riscv allmodconfig with clang:
> 
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2448) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
>      58 | static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
>         |             ^
>   1 error generated.
> 
> Many functions in this file use a large number of parameters, which must
> be passed on the stack at a certain pointer due to register exhaustion,
> which can cause high stack usage when inlining and issues with stack
> slot analysis get involved. While the compiler can and should do better
> (as GCC uses less than half the amount of stack space for the same
> function), it is not as simple as a fix as adjusting the functions not
> to take a large number of parameters.
> 
> Unfortunately, modifying these files to avoid the problem is a difficult
> to justify approach because any revisions to the files in the kernel
> tree never make it back to the original source (so copies of the code
> for newer hardware revisions just reintroduce the issue) and the files
> are hard to read/modify due to being "gcc-parsable HW gospel, coming
> straight from HW engineers".
> 
> Avoid building the problematic code for RISC-V by modifying the existing
> condition for arm64 that exists for the same reason. Factor out the
> logical not to make the condition a little more readable naturally.
> 
> Fixes: a28e4b672f04 ("drm/amd/display: use ARCH_HAS_KERNEL_FPU_SUPPORT")
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Closes: https://lore.kernel.org/20240530145741.7506-2-palmer@rivosinc.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 5fcd4f778dc3..47b8b49da8a7 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -8,7 +8,7 @@ config DRM_AMD_DC
>  	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
>  	select SND_HDA_COMPONENT if SND_HDA_CORE
>  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
> -	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
> +	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CLANG && (ARM64 || RISCV))

Thanks for also making the logic easier to parse.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>  	help
>  	  Choose this option if you want to use the new display engine
>  	  support for AMDGPU. This adds required support for Vega and
> 
> ---
> base-commit: c6c4dd54012551cce5cde408b35468f2c62b0cce
> change-id: 20240614-amdgpu-disable-drm-amd-dc-fp-riscv-clang-31c84f6b990d
> 
> Best regards,

