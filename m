Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D691BBED55
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 19:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A1810E116;
	Mon,  6 Oct 2025 17:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ieJzNkYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B37210E0FB;
 Mon,  6 Oct 2025 17:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVcKs1AfQKl8x0Ws7SPhd/SznJSM6EdhltvsZEyRUvJr938If1RJGE6drIy3+j4Bh6Y61ozl9atPr58KUBCbrcHe7IKiDTn7kFqdToLPpI7E0bttHagunNLVAIRL1lKmgtb4+pG7Bp0OzNWo0F0jjcQeBKtSWvmktc0ZuWV3T5VYYTyrqP+mmlEvAkRRxoJV+1zkjRy9aYA9VaAjd5Bat4R3+DuQ7V4zAFnbL2I/PoEN6B3ATHh90MJOfI1dUr8XzZcm0l2LViY3tPWw7YD2g1AhJIRbLBtgT4avsIxVErj25sIDzYS4paPwG94/nCywHS5PaYYLgTV88nuUueylUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQKk3+RhI16uDm1fxcKCp7YQg/1j+Z3a1egQaOsifoQ=;
 b=azHfrEfQrMnGZYL484EkgUGOBXmdo8CPVH0dDkuiTCWiwt08FHcb6kfvgrVUZWS9N7Tw3eyroBWJX6jygbDBzSP5WgjAvNFLe0nsF7EperQJe5e6Di+Nj+E132gKwKczghNHXnfx0FOJBRT7aOK6g789YBfndsY4U38/rXEi3954h55CDNwNCrHlWUjICx7aBvS51Uaaxbr50APu79SEkDGFgHNb4YqJoQhXE3HNdPVX+JfXyiKCcZ2ZeVGOGE9Olz+cScvmXKh+IOiwPQ6LzguOqq6UK1SuzzbJ52gqHdUliP1UzX1n6uivqYujQd0wE9KHGyekzeqIjG9fvNPZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQKk3+RhI16uDm1fxcKCp7YQg/1j+Z3a1egQaOsifoQ=;
 b=ieJzNkYtMhuaKXDEyns+ViH0hMWpsafMv4beX+FRPvZTeZG1Yc8ePg6OnyJkkvRyZZVRhCIHAi3AcKH7z2u7btfcvNXRK9cElKgVspo5f5wQBbxdg1+RysHLBZHXsuyvuvRC2cGv3M5/0nmtKOgebgarnfBFw41noMMgFcq0QS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6759.namprd12.prod.outlook.com (2603:10b6:a03:44b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 17:42:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 17:42:47 +0000
Message-ID: <5824c012-dcb2-4312-9b16-810656290831@amd.com>
Date: Mon, 6 Oct 2025 19:42:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com, broonie@kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Austin Zheng <austin.zheng@amd.com>,
 Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251002210044.1726731-2-ardb+git@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251002210044.1726731-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0701.namprd03.prod.outlook.com
 (2603:10b6:408:ef::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5af9e5-2e65-4d29-46b4-08de04ffc362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWJ4YU1tbkRBWml3R2hSY3pLYk1yaVRCN25oVnZUMWRQQ2dGVlBRSmt1ZGZ3?=
 =?utf-8?B?Z3Q2ekk2SHM1NGZOd1k4Y3V6RERGRGd1RkM1SUFOQkdlUEZKUFZhNlQ3SmJX?=
 =?utf-8?B?YitzRGhFMWhaZUMxeGNIMEszQzhEN1VaZHpSS0xwMkhZR0ZjWS9HQ3NpYWFw?=
 =?utf-8?B?Rzk2WUExSXJHelFvcldqeXBKbVcwUjRZV2tLKzJONGYzcjVZSzZYaE5xb2JK?=
 =?utf-8?B?U1dORE1XSy9rb2t0UUFMcEVWMmZyd3JFcjZCZHQ5bTVDTVZPTG1DaXNxcjNV?=
 =?utf-8?B?QjNIU2lsVFZSbVVveWxWeU5acHd3NldJZmFWR1YzSnc4YVZESlR3R0Z2czdw?=
 =?utf-8?B?YWZSMjF1UjF4Z3FHMWV2dmlFWndlb1MvOTlCZDBTbmJBQmo2QkcyNGx1eUVa?=
 =?utf-8?B?VC9YRlo1K0Q2bnExejhFU2hNNksxNmhyd3JpUmxhcjhyNnNlNWl0Z0c4V2wz?=
 =?utf-8?B?MVRrb1Ywc2VCb3NqSHpLZnloN2lGR3NhLzBlb0taQlJGOHM3cjBFMGhRZ203?=
 =?utf-8?B?d1lDVTZ6VFJFb20rK1ZTa1cwcGZDUlF4NWdnbmo5cXREZFROSXN3Y3BNMWVy?=
 =?utf-8?B?MUNmdFJnbitiTjFYeExkWUFHQXBpUUZJMHBwNEd2a1BFb0hLdnJaZ25mNjhn?=
 =?utf-8?B?ek5Xa3FhMHA5UFpuYjAyMnQxamw2cGh5TjZJbjVST3RCT1ZyWG5YNVZheXdz?=
 =?utf-8?B?bTdvMEVYZG5XbmJnK1Fya041Um4rcGpacTZLd01EcEJWSmRrVzdhZEJPWUt6?=
 =?utf-8?B?dXlxM202bHcxODNIZEh0QkpTSUZtcnFwTGRCVGRwQzEwTjMyUEl2TFFPL243?=
 =?utf-8?B?aHVEcS9HTU5uYzhhZHNZM1QyMzFhZWpEdkdBZ1RoTGluSVpHOFNiMnRjV0Q5?=
 =?utf-8?B?WTJ2TmVoOStaRHNJbU4zUkw4RW43eUE2UGtJWFRZK2JLbWNSeForM3VJR2t4?=
 =?utf-8?B?bWN6TFRocDZpRngwSExhY0MyVEJBZ1VDdWJZem91Tm1xL2drL3hSVzhOUEtu?=
 =?utf-8?B?TUVxeWw3U242Ny8rMHZOSVB3ZHJQZGFHQVMyK09oMVNrK2tLRldNNmRaR3dp?=
 =?utf-8?B?blJZT3dyNXpQMnFPVmR2QXZGQiszYmY0cWt6WGNWK1NtSE1yaEZpUGlDd2xO?=
 =?utf-8?B?cE5SWGxzUmVEcGRhOVlVTmMxN2VVcjJkTnlSazBmNldjaEhGWmVYcm1sbDE3?=
 =?utf-8?B?S2VXTW9ZSHpmNXIzN0xkV2poQjNKcXlTdlZ4V1BCZnlBb2dCbndmeWJta3Q1?=
 =?utf-8?B?OUFpY3lKSjhoV2YzS2ZaUm9tejZzQ3ZDRVU5VXBJWEFhRDIrVmNrTGF2cHJS?=
 =?utf-8?B?WURNaTdaWUM1dnRpOUVXL1J1cXVYOTd2THdJWTd0U0hhZ1FiS1p5UHRybnVs?=
 =?utf-8?B?MGxERWdvQlpzbTRuYWZLYy91cnFBQWZxUkhVbEtwNGtTV2hVN1lTaEYvS3l5?=
 =?utf-8?B?SHlVa0hPSXJNTldXZU9yRm9UVG1ZYVA1c1hRb1VIbW11NmVBSFJ4a014dWcr?=
 =?utf-8?B?T0RwRitXeFlQTURvcWJLSUdsd3p5Y0FkUFdCSGliT3dBQWs1RTZqRjNJWk9M?=
 =?utf-8?B?bThyVG9lTzl3N3BRMW1CbEUzUjR3aUxlOGJBRUNFVmtRSnBIZStLVVpuUDdr?=
 =?utf-8?B?bTB2V29NcG0vaDRyQXVncldkMElUYzUyZUpxWlBYUFladlE3MFB0OGQrRGNN?=
 =?utf-8?B?Mll1ck1oOWtqMzN6UHBkaUNMSUpXdGdPb2YrN2dPcUpRMXdRSjhMM2JYWUQ3?=
 =?utf-8?B?MGVsNmlWeUo2dVBuZlE5dUpEajdNZkdsdm5UWlNoWVVjUGRhODJwdSswQlk3?=
 =?utf-8?B?ZTJ2RXovK0hVRk5PNVVtNHpFTE9jb3ZsM1llY0JPa0FoTFRaZlNSRHZvb2RH?=
 =?utf-8?B?cm9RVGtTVVE4U1Rob1ZsRHZDR2ZwNTdrSEJDekxHTFY0cmhBd0dLdHpPeDJr?=
 =?utf-8?Q?KD3albMZezpEt03uUyK6wtU06/HlwAzA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBMblNFNXdPZ2gzck9ZVjBxNnJwcmFZVnVHem9reVFUM3RrTDF0NWdVQzV2?=
 =?utf-8?B?RFZxODgwUFdFdDdWaWluRGduYVBkYnFCZFJpV3J4M1ZRbmNhdjg3NmhQQ2JP?=
 =?utf-8?B?UjlrTWQxNUt6Y1pTallFWUtRZ0pnRDhKL2xiM29SQWFDTHA3djBxRDVReVZW?=
 =?utf-8?B?aTRFakErZWJIbHJzZnJMZW9LeWVJcVlvR3BYL25UclJOTnVZcTREeTIyUjRQ?=
 =?utf-8?B?UUR6S0FtSkJlbDBaNW5PSUQ3Y3JBMWFFZHJ0S0NoRFFhc3NhMk1sdFExQmVy?=
 =?utf-8?B?dThaOHBKcXFMY3lFMmxpUFRNZzd6d1JIUWFlbkNaUTZJZzRnV01xVUZVOGov?=
 =?utf-8?B?aDF2a0h1bStPaStDd0NrdjhwdUhkUmFDWGZIS0I4ZXVQM3BnK0xRSERXVkFB?=
 =?utf-8?B?Z1lYN3FxcHUwS0FJRW4rOUJRRFJOY0xURmg3VUMzSnFYSmE5RllUWFRvRENB?=
 =?utf-8?B?dElOcksrcVM1NXdjcW45T1ZDQzlSajl4QTk1MDNQc2syMkY0NXdaYU1Mb3ZC?=
 =?utf-8?B?YkFnQ1Y5QTBodHpjMjlNcERsMEdWdmthaHlTSlZSWmV6T1dSdklod2lWYUZH?=
 =?utf-8?B?c0Z2bmE2THIvT3NMbFF2d3NxWFgrem9Zb0Yvb25QMzNuREJMNngzU3UrOG9s?=
 =?utf-8?B?dWZ2ZmQrT0hGTjVRa2NlNmlZZUN1WFpSSllWbU5lell5OXltR2MwVkxndUdH?=
 =?utf-8?B?eGNNSzQzUEZlRlRzZ1NLTUVRdGp4bzhPNStPVHFFdlFGL1ByVEZBMjZkdjBZ?=
 =?utf-8?B?N3prMnk5bnNGazJRN0MveTFBOHBHMEtKRWF1OUQ3MlhKNlpUN2tKNCtpamEx?=
 =?utf-8?B?OVFrb3k5SnlHejI4QkFlYlpaenhWVzVCQzBpN3hSdDdlMENpR2hFL3QyYWxE?=
 =?utf-8?B?T1ZodldDVzN0bjBHR1pXMUdCakpqK1VRWmxPYjhVRWIvM2FQenlTUnFkRVVB?=
 =?utf-8?B?eC9pSWs5UUh5MzJTUUtDc1JCa0lWZ1VEdWJMM0luaGJ1cVZZZzRVeENYZnpJ?=
 =?utf-8?B?MFp3eDcwckdCcU9haVlLTUgrUEdISW8vZGFJUS9leGxHWnZTM3lENWZIZUNV?=
 =?utf-8?B?Z1UvV2QrR1k3L3hrZTRlNXdlZG1kY1FMZWtDeUxGZm53Vm43aktJWTFuUXZk?=
 =?utf-8?B?ZTNjWC8vajBobGdXQ1EweExPbkZpR3RidVd6L1dDVE9PSjQ1a29kdzN5V0NG?=
 =?utf-8?B?SytMTE5XUlV3UFMzb0pBT2hsckVDcWVsZTBBbkM1L1ZQMEpTblZheWpNcjFP?=
 =?utf-8?B?VWMrZnBsdzc0VGltMHpyYW5nK21Oa1l5bVFyTjh6ZmJXYnJwMjIzRDJTbXdY?=
 =?utf-8?B?RkUxVHBZenp1RjhPak5wRUI3dGJvNjcyc0ZNTWVZdldOTjNuNzBTbFVvRmJn?=
 =?utf-8?B?TE00Yks5cXRycEJvOWRHZ3M1c2hhZWUyQWprYWcralQxTlYrdEJmWGRvTkMx?=
 =?utf-8?B?UXhSaUtoRlNjU01xQWJjeGp4MDUvTEpGaHc0RVJXVS9wNU9nVXh3MlhmMG9t?=
 =?utf-8?B?b1l4dnR0dkoycjZKbWw1Tk44OUV2MWxPU2ZGYjAyR0lUa0lvNjlvajJueUlF?=
 =?utf-8?B?bzR3UVA0OXc3RkM4cmMzbTVHSExIL21wb2VyVy85SEhXSWpYM3BRU2Frdm9X?=
 =?utf-8?B?dW14TG1RRllXVk1pVWhnN2M1L2pPNXZoQ2pJSk5CRkNHVysvcWxEaGFGLzZv?=
 =?utf-8?B?Rzk0Mkt3TFF5YThGMjVyUm1aOFJQTVpQd0ZOWXNiaEM1N2dFRjZPYjBaNG1q?=
 =?utf-8?B?MFlERXIyZ3ViMGJURjVqTjl5SnJlVSt4bS9PSDBmbDhWRE0vbHNRZlEreTBx?=
 =?utf-8?B?RGZTQXp1K0xmWmpaYUdIc2xMcUd5ZkhwdG4zcFd6R1YrVVZYTDNIaEJScUQ5?=
 =?utf-8?B?Q1JsY0Z6TEhQUU04eWszV2k3SFBlSDBNTVI1MUZyMUVabEV4SkEvVU9SdmZs?=
 =?utf-8?B?NW5UaDVmOGdHSks3Q09FOE4yeWdBdXowTTFzZU9XTkdGRHBFdE0vUnVUa05W?=
 =?utf-8?B?cjhSNjJoQWthZlJnZFFYWjU1NEEwbWJuMVY4b3lqUXBHZyswQVZENlE5TEw1?=
 =?utf-8?B?RFg1RmwzRnBsdzIrSVJ1UHhJRjN3RFZXRzVrK25rTDlWL0dmVG9iK3FZSmVK?=
 =?utf-8?Q?ey7hvfRZxGLLBW68qremFSi2r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5af9e5-2e65-4d29-46b4-08de04ffc362
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 17:42:47.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z9UdfMsRycclGzcr+nAk/cwB5jHHze3OE+L5ibtdZ8t4kC3jLabxvDPHcAAJbsr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6759
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

On 02.10.25 23:00, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The point of isolating code that uses kernel mode FPU in separate
> compilation units is to ensure that even implicit uses of, e.g., SIMD
> registers for spilling occur only in a context where this is permitted,
> i.e., from inside a kernel_fpu_begin/end block.
> 
> This is important on arm64, which uses -mgeneral-regs-only to build all
> kernel code, with the exception of such compilation units where FP or
> SIMD registers are expected to be used. Given that the compiler may
> invent uses of FP/SIMD anywhere in such a unit, none of its code may be
> accessible from outside a kernel_fpu_begin/end block.
> 
> This means that all callers into such compilation units must use the
> DC_FP start/end macros, which must not occur there themselves. For
> robustness, all functions with external linkage that reside there should
> call dc_assert_fp_enabled() to assert that the FPU context was set up
> correctly.

Thanks a lot for that, I've pointed out this restriction before as well.

Since we had that issue multiple times now would it be somehow possible to automate rejecting new code getting this wrong?

E.g. adding something to the DC_FP_START()/DC_FP_END() or kernel_fpu_begin/end macros to make sure that they fail to compile on compolation units where FP use is enabled?

Regards,
Christian.

> 
> Fix this for the DCN35, DCN351 and DCN36 implementations.
> 
> Cc: Austin Zheng <austin.zheng@amd.com>
> Cc: Jun Lei <jun.lei@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c    |  4 ++++
>  .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c    |  6 ++++--
>  .../drm/amd/display/dc/dml/dcn351/dcn351_fpu.c  |  4 ++--
>  .../display/dc/resource/dcn35/dcn35_resource.c  | 16 +++++++++++++++-
>  .../dc/resource/dcn351/dcn351_resource.c        | 17 ++++++++++++++++-
>  .../display/dc/resource/dcn36/dcn36_resource.c  | 16 +++++++++++++++-
>  6 files changed, 56 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> index 17a21bcbde17..1a28061bb9ff 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> @@ -808,6 +808,8 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
>  
>  int dcn_get_max_non_odm_pix_rate_100hz(struct _vcs_dpi_soc_bounding_box_st *soc)
>  {
> +	dc_assert_fp_enabled();
> +
>  	return soc->clock_limits[0].dispclk_mhz * 10000.0 / (1.0 + soc->dcn_downspread_percent / 100.0);
>  }
>  
> @@ -815,6 +817,8 @@ int dcn_get_approx_det_segs_required_for_pstate(
>  		struct _vcs_dpi_soc_bounding_box_st *soc,
>  		int pix_clk_100hz, int bpp, int seg_size_kb)
>  {
> +	dc_assert_fp_enabled();
> +
>  	/* Roughly calculate required crb to hide latency. In practice there is slightly
>  	 * more buffer available for latency hiding
>  	 */
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> index 5d73efa2f0c9..15a1d77dfe36 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> @@ -445,6 +445,8 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc *dc,
>  	bool upscaled = false;
>  	const unsigned int max_allowed_vblank_nom = 1023;
>  
> +	dc_assert_fp_enabled();
> +
>  	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
>  					      validate_mode);
>  
> @@ -498,9 +500,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc *dc,
>  
>  		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
>  
> -		DC_FP_START();
>  		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> -		DC_FP_END();
>  
>  		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
>  		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
> @@ -581,6 +581,8 @@ void dcn35_decide_zstate_support(struct dc *dc, struct dc_state *context)
>  	unsigned int i, plane_count = 0;
>  	DC_LOGGER_INIT(dc->ctx->logger);
>  
> +	dc_assert_fp_enabled();
> +
>  	for (i = 0; i < dc->res_pool->pipe_count; i++) {
>  		if (context->res_ctx.pipe_ctx[i].plane_state)
>  			plane_count++;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> index 6f516af82956..e5cfe73f640a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
> @@ -478,6 +478,8 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
>  	bool upscaled = false;
>  	const unsigned int max_allowed_vblank_nom = 1023;
>  
> +	dc_assert_fp_enabled();
> +
>  	dcn31_populate_dml_pipes_from_context(dc, context, pipes,
>  					      validate_mode);
>  
> @@ -531,9 +533,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
>  
>  		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
>  
> -		DC_FP_START();
>  		dcn31_zero_pipe_dcc_fraction(pipes, pipe_cnt);
> -		DC_FP_END();
>  
>  		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
>  		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> index 8475c6eec547..32678b66c410 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> @@ -1760,6 +1760,20 @@ enum dc_status dcn35_patch_unknown_plane_state(struct dc_plane_state *plane_stat
>  }
>  
>  
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +					       struct dc_state *context,
> +					       display_e2e_pipe_params_st *pipes,
> +					       enum dc_validate_mode validate_mode)
> +{
> +	int ret;
> +
> +	DC_FP_START();
> +	ret = dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
> +	DC_FP_END();
> +
> +	return ret;
> +}
> +
>  static struct resource_funcs dcn35_res_pool_funcs = {
>  	.destroy = dcn35_destroy_resource_pool,
>  	.link_enc_create = dcn35_link_encoder_create,
> @@ -1770,7 +1784,7 @@ static struct resource_funcs dcn35_res_pool_funcs = {
>  	.validate_bandwidth = dcn35_validate_bandwidth,
>  	.calculate_wm_and_dlg = NULL,
>  	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
> -	.populate_dml_pipes = dcn35_populate_dml_pipes_from_context_fpu,
> +	.populate_dml_pipes = populate_dml_pipes_from_context_fpu,
>  	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
>  	.release_pipe = dcn20_release_pipe,
>  	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> index 0971c0f74186..677cee27589c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> @@ -1732,6 +1732,21 @@ static enum dc_status dcn351_validate_bandwidth(struct dc *dc,
>  	return out ? DC_OK : DC_FAIL_BANDWIDTH_VALIDATE;
>  }
>  
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +					       struct dc_state *context,
> +					       display_e2e_pipe_params_st *pipes,
> +					       enum dc_validate_mode validate_mode)
> +{
> +	int ret;
> +
> +	DC_FP_START();
> +	ret = dcn351_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
> +	DC_FP_END();
> +
> +	return ret;
> +
> +}
> +
>  static struct resource_funcs dcn351_res_pool_funcs = {
>  	.destroy = dcn351_destroy_resource_pool,
>  	.link_enc_create = dcn35_link_encoder_create,
> @@ -1742,7 +1757,7 @@ static struct resource_funcs dcn351_res_pool_funcs = {
>  	.validate_bandwidth = dcn351_validate_bandwidth,
>  	.calculate_wm_and_dlg = NULL,
>  	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
> -	.populate_dml_pipes = dcn351_populate_dml_pipes_from_context_fpu,
> +	.populate_dml_pipes = populate_dml_pipes_from_context_fpu,
>  	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
>  	.release_pipe = dcn20_release_pipe,
>  	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> index 8bae7fcedc22..d81540515e5c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> @@ -1734,6 +1734,20 @@ static enum dc_status dcn35_validate_bandwidth(struct dc *dc,
>  }
>  
>  
> +static int populate_dml_pipes_from_context_fpu(struct dc *dc,
> +					       struct dc_state *context,
> +					       display_e2e_pipe_params_st *pipes,
> +					       enum dc_validate_mode validate_mode)
> +{
> +	int ret;
> +
> +	DC_FP_START();
> +	ret = dcn35_populate_dml_pipes_from_context_fpu(dc, context, pipes, validate_mode);
> +	DC_FP_END();
> +
> +	return ret;
> +}
> +
>  static struct resource_funcs dcn36_res_pool_funcs = {
>  	.destroy = dcn36_destroy_resource_pool,
>  	.link_enc_create = dcn35_link_encoder_create,
> @@ -1744,7 +1758,7 @@ static struct resource_funcs dcn36_res_pool_funcs = {
>  	.validate_bandwidth = dcn35_validate_bandwidth,
>  	.calculate_wm_and_dlg = NULL,
>  	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
> -	.populate_dml_pipes = dcn35_populate_dml_pipes_from_context_fpu,
> +	.populate_dml_pipes = populate_dml_pipes_from_context_fpu,
>  	.acquire_free_pipe_as_secondary_dpp_pipe = dcn20_acquire_free_pipe_for_layer,
>  	.release_pipe = dcn20_release_pipe,
>  	.add_stream_to_ctx = dcn30_add_stream_to_ctx,

