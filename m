Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB7B9294A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB08110E4DA;
	Mon, 22 Sep 2025 18:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q4v7E9xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FDD10E4D7;
 Mon, 22 Sep 2025 18:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKICusBhtTF8oM3zqGSSZScg0xPwLIJKS1mjkBN59hbLBT34ZJAQ7Jg4tjqHG5i2TaRxwsX/AXQ1/Qmvjn8ZulM+JKDaFuH9gMXwdCVAXd6ltkRivDE1JYeVCItjpNrgbYelx6eq6zMLM6/apvci8GQ82hr4mQRL3P4T2z8oTGueVKOilY+oZaIe9XSLFtigETGSBg2/kmeyEcoqccuuvBkqKDFDDA/aMhSX6VI5ddsnM6Y+Rdn0/xEoq8+oNbEquYu/X+OyjoM/8k7Dcha0ZU3ztE/6YxMtIZVfuKwboLTg1oMkBg0FX3G58nsBAeQ+cxgTzI9P+kGxLgZGDXQ7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIyQf74Gcip2cfl53Of+VuPc6ncQR0NJOz18lmbkYXU=;
 b=nEcW+94oi7Klnbt9JI5fZ4l3xZvst0bjpf4o8CP6nflbf38gGL9p1tNRC1FhE5ZLXud5vjqfxt0CTGf4WBGk+kpRBacdJ2L4qRCPuWtJ7tb+YaGkIVwem+4CfSuvqQnep5tP4k4Xoyhx2/TWTLVl5+TE5jIb9wV47i+rKSAZWE4he8hN3VSer4LzdXSVd8SZKBIbz5A7SKV4f/YUvcaGbz+RbZq4yYO5UXBazhF4SNqe0CIP+MbYDCYY3YCq+9hYsE37p9/pXf8vcXGP/PkhOvZfX7jL2Q61aUzLI2OiAJInh6eUftzqy/Emg6CujC2WaVGgu6mpc0IN+06lAoajLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIyQf74Gcip2cfl53Of+VuPc6ncQR0NJOz18lmbkYXU=;
 b=q4v7E9xuIT4EP144QBd5urmoPgwJJIN0tKfQM1Y3lm9ks8Roc0Pl17KYAwDUiUq1foqPFD7MoYRCOB3WsK7mWTcDRDAhrek3YrIYYqXMiKzhwpsTriHt8QvFZLzEBOZtSru+xFanz0Os804k+cqKdbGaSniL9B03lysOpLzs23w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6231.namprd12.prod.outlook.com (2603:10b6:8:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 18:14:43 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 18:14:43 +0000
Message-ID: <818e06b3-c4cc-4045-be70-5732389439d1@amd.com>
Date: Mon, 22 Sep 2025 12:14:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: remove output_tf_change flag
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Dillon.Varone@amd.com, jdhillon@amd.com,
 Alvin.Lee2@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250901215241.14667-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250901215241.14667-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 8576a46c-6e88-4b04-3e1b-08ddfa03e77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDJNVGlFaHlKcWtmUDc2ZXNScVFzNFRyTGtGWW1kZGgxMkdCMk02d3c4Q1Zh?=
 =?utf-8?B?UWJTTG0xVzkvRFJYY3cvSWpQRG1aamxoeWdlMWNzZ0xWOU9Ed3NOVGVodmti?=
 =?utf-8?B?NEJaOU5ucm5EUEJNU21mY2k0WVFtclFpTmZsUjJhdHBTeDU3ZzZhMW9la0Y4?=
 =?utf-8?B?eUdCZ09lcy9TZCtzdVNDSTBrRk1PcTdjeFhMNVBLLzQvM05ZQjRiZXpZSlQ2?=
 =?utf-8?B?QTRSeWZKbnRBdkJPOG5tSFFSeUNjdXZGRThmUjJiOFNvS296d2xrL0JXc2pL?=
 =?utf-8?B?akFGdTRwRWJ6d1lBRTFwZ3czMFdycWlMaDM2Zk5EVlY5SEI5L1E2VmFCS0Jo?=
 =?utf-8?B?YllzN2lhaGMyY2dVL3RXY1NzOU5Fb3JQZGQvQzNOM3VOTm9vSmViZFk4VVBF?=
 =?utf-8?B?bVgrSUJHQmpaNFIzRnVta1lncFlIYlBVaks2eGg4RG9SSDFSeU5IcWY2NXVR?=
 =?utf-8?B?YURkdzZtSEs5dm5HSHI3NlZvMHUvMS9sakpPL2VzeWJiUUVqTEpyMGZKbXFt?=
 =?utf-8?B?anF5NkgzaHA3b09aNjl0NXU3WW9vYTBXRHRCclc0endYZXN3akI1Y0hqeEIw?=
 =?utf-8?B?czdORXhtYzcvaXNWMDJtU0VpU2VMd0FlSXlSeWNXU0JaZ1U4YkVKQ3Z4V1gx?=
 =?utf-8?B?SUI2bHV0TmJvRWRHa1hzMVphcUt2ck54NFkxVkN3N1ZJcGxYVzJ4Z1ZaUDZW?=
 =?utf-8?B?NzBtVjNHTVhFRnQrOVh1bE8vOWFrMFdiT0hRTyszNFlMc3h5ZXRlYWtPaExJ?=
 =?utf-8?B?MkhiTXZDT1BHbXFuVjVSTWw2cEFiR3RPL3J3SGpGZHU4Y0h6dWRBYVhYalpp?=
 =?utf-8?B?bTVRV1NUZHNBWHRhdkVWT3NJczRBby9qQjFFVGJRdXFma29YUjBGd0M5NjBO?=
 =?utf-8?B?blExVXFIUENrNjR4UDBlcEVNLytUdDgvaXA0R2RVTHA1ajhTS0V1TW8vSitY?=
 =?utf-8?B?bm1WbXdybVJDZ05wdzVSYlZpRWNNK0cxSk5YSWpCSm1JemFUZFAyZ3VoUGJE?=
 =?utf-8?B?K2dFYlNDRytKdno4bnpOeTYvZDdpRWRoVS91L2lvS21QaDR0ZURvMVJnTUpv?=
 =?utf-8?B?OUt0Sy9EcWlTMUdSOXQ5blJWTC9KWW5SdVlycWlidVpKUGxRRXpEbmM3ZjZj?=
 =?utf-8?B?L3Z5cTd5OWY4cmFTNkVhQUlWVGNOVVp5SEV0Y0tPbWZtSEFWUjVXQXd0WVJ1?=
 =?utf-8?B?VjFiYTRsM3ZDSTc3WHFiZDVxc3VsQkgwelFQNENSdlVkM29wRWRkRjNxbENo?=
 =?utf-8?B?QXdlVnd3M2RvMGNpYWdUeTZjbm54VldSKzJsc3cwK2h2SjBBdmd6Qy9pMUNX?=
 =?utf-8?B?U2JQa3JnWTViUU5DNG5hL3pMVm9OeTY5eW9mSHZTZFhrRWNwR2h4bk5lbk9O?=
 =?utf-8?B?Y1BqN0VrTjUrc1kyMlJVTkZtdWpCdk83Q2VtbXMrT2Vaekc4UzJDV3NhMkgy?=
 =?utf-8?B?YnprNWpJZjFrVitqY2ExZjVQNFczMmJQN3Npb1d4b2hHcVBUak1qdEp1VXRV?=
 =?utf-8?B?OU5zNHpETGxXUEYzeFlSOVF3M1dFYncwYmVYei9tYlRrNHhxbFlEMThMbkFH?=
 =?utf-8?B?MEhMRmRUWU5ma3hna3ViZEZQK01UYXYvUGdQaGtXTDFyYVF5bUp4dWM0cnhk?=
 =?utf-8?B?UE5yek5tT3ROSVl2VXFqQ3lkdkNLcHo0aFRzOWFwa0RLMmkxZkgrbzZkMjRW?=
 =?utf-8?B?MGNEV3RvNXppbmNCdWM3Vm9pRTltZDhXMXBBV3lvNitiK3EzWmQxOTd1QS83?=
 =?utf-8?B?WXVBVVV1ZW9jSjZhZGVaelBOS2w5U1gvZFdtbHhvVU9qVUxaZ2p4RjFETS9I?=
 =?utf-8?B?U3p3Z1dQdGJzakduTnFqbVNFMHhSck56cTNJS1dhdHlpcFZ6Z3hSRFVhdmoy?=
 =?utf-8?B?QmUxS3BDS3EybVFqYnJDbDFlbU05UldvMWVSbVhSb0V6NVFQbnkzWjhBZ2hs?=
 =?utf-8?B?Tno2TUVZcWtISGFEM284OU50OWxTdFlRckZUVW02NEl0dS9taHdMaTFXeUJY?=
 =?utf-8?B?MUVGZVBkeWtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dVbEpMWXJiQ1pQTHdPR1o5NXJZUkdqbjNGN2ZEcVF1eXZydFNhVjZmYkNX?=
 =?utf-8?B?dzV2SElWYk5VbDdCMXlmVk1JQ044UEVVMUxaNWNKVlAwbG1wT0VLY2E2VWFM?=
 =?utf-8?B?MTlsOENGSWZWdkFCbVJvOXBQVkU1elJLOVBPQnl2MXVtOUNBb3ZtWUN5L0ts?=
 =?utf-8?B?Mm4vRmxuelVhNEo3aEVTSXJYVzdGb0NUZnFBK1pNcTJEci9GdHlSNTdxMTFp?=
 =?utf-8?B?Y09LeGQ0ci8xY2RkRDlpNzBOU1pHU2VFQVJ0NngrRFVDbHIxNnVvSWFpVG56?=
 =?utf-8?B?Qk01RlFBY25xNGRtSmlnMDhLb0JNSzNEWHA4dkppZ0RuNlMxT3NhY0JqRytL?=
 =?utf-8?B?ZU1ocElvR0ZkeFRPS1UwOTA1VVhOMFpkZ3J3SktheDMzZEl2eGt1eFZFakx5?=
 =?utf-8?B?YmFkOThYMnhzNEU3Q0hyZlg3OUxVZTlaS29tMTNPdnVFdGY2eDRLWStDcHNV?=
 =?utf-8?B?TnVPakdvcnpteTFmSWlEREl5U2pJMGxVOXl4clJxbmZKMzFucHZPYURCZ3Ns?=
 =?utf-8?B?N29qdWk3MEVYeXVtN1JjUG9sMk1qeUlEcktqYlU0NzJlV25LWGJqYUlTT0I5?=
 =?utf-8?B?a0VPU3ZNd3pSWHlNUUpjRHh3NHlObFUvdVNsNjBoS25pNnZ4SXZNR0I0OW5F?=
 =?utf-8?B?VGNNdTZQZzNVand4c3dWbkFnYSt0TDV0NDJicE9ic2YzTnRpQ0NvYzFOZVlT?=
 =?utf-8?B?LzRJeXZOWGViQ2VSTGVKaktiSXliN2M3U21wdXJNN002TGtJa0pSUnN1aWNB?=
 =?utf-8?B?OWY0cUY5SzY0QiszdmpkbEJDN1Vra2FJRm9iME5vOC9JUUMva1orZ3hhWDdL?=
 =?utf-8?B?eUZiVGZFT3BDTDdkTStrU0xtNk5UNGVFaWJRMVpYRlFqRTVNTUlWNUJLZTF6?=
 =?utf-8?B?UktZWDlHUVVwL3FRcEpQbTZzL3pzL1lUaytWUFY0QjB5UWEwZEQxczJGeWY1?=
 =?utf-8?B?emJ0RWZ6U1VKS01pcURNWkpmYTdKWHVIM3VEeEE3UUxtaUtBWG1yVGpLRHZU?=
 =?utf-8?B?WSs2UDZaU0VON2xkbDMvTXFYSG9PbElrQXd4R2hRSURYSnhEbTlDNEJHUThD?=
 =?utf-8?B?bVVOaEdCT0R5RmZocFJTeGlLZnhWdTNWUkpBQy9JSTV3OCtnWTB2T3JQQlJQ?=
 =?utf-8?B?QXF0THZOOHhMTzlCeUFZR21aSmVkRVlqTU9HKzMrVFVKZWlobEdHWU5nVVpQ?=
 =?utf-8?B?eDZUaUxxdnBLTkJUbG92UG1IaDVLUS9YdFNSNkdMc1B2Smt5QnAyWHFUY3pL?=
 =?utf-8?B?bjZ3STJlT3l3WUwyV3oxUkN0cmRpaDNsNVlGU3pNU2RjWTdkdE5kZlNrM2F6?=
 =?utf-8?B?WUdBWmJvdzNBN2J2V1Bod3pNM3I5MHZwd1N0KzJJUzFCbkdSNE5xakFKZ3ZC?=
 =?utf-8?B?RC83bXVFT3BVMld5YWxLU0NDc3JGWnZjUWdYKysxcFJEOEN2L3VFc0V0azdR?=
 =?utf-8?B?MVZVemhUb3A3b0JsSlBzMTZCelYwamVQRjI2MUR1SFVCTE41ajllZHdpUisv?=
 =?utf-8?B?L3RzckYzV29iK25Ya1JYQVFmVFNHWFhnNHVWMkhqUzlKd3paeVdMT3lwQzRE?=
 =?utf-8?B?emxGektVL3dSWEd4Q3pMNHJkVUNBVEo3UGFnMjlzc2pHTkRwbkxna1NWUDZC?=
 =?utf-8?B?WGVHSG1GWFdTMTBsZy9jRjlwWE5TU2h5K3FMUEprZ0lwVmRXSWtudFMxSXpK?=
 =?utf-8?B?R0REOW9WTE91MmNpUnRWRFVDczhGeFVjTDF5VzlCam9oRVhPWlF6SXEraUVY?=
 =?utf-8?B?T3VyM004akF4d3hCT3BXaHFtblcyOHROWTN2bXF2RVNXNVBuSmlJMkdGQ0hh?=
 =?utf-8?B?K2pEVVAyb0c2LzRQcmNwMFNQQk4vaUNscmsyMkJWemlrTHpLS2daUWtRZ2hJ?=
 =?utf-8?B?eUNkbTlpUG9ndG44c0NQNU1EdnAzOEZ5ekcvbW9nOE1rcXBzR0krWGRQWEk0?=
 =?utf-8?B?NU1kZUNLYlNsWVpaeExHVU5EaTdtb1pMM25xaGVoUUlsVnZTbjFHUFFHSnU1?=
 =?utf-8?B?TGsyNHlWY0txQmRUWEc1MldTRGhQZVVsaDlYRXRRcDVzQzVOYXlzSDh1Y1Vj?=
 =?utf-8?B?VU1Nbzh3V1NYVTVSMGxiQTVySHdJRkUrZlJ6NjZ1RnhiSUIycFpGcW5SRm92?=
 =?utf-8?Q?m/TLeX6zMFzKDFmfjyd4ubpvG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8576a46c-6e88-4b04-3e1b-08ddfa03e77b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 18:14:43.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU+jmXmTVKKbZipsazSo4fLw87WSv+XwXHkFeqkntqhDrjK7gpmLBXVmMVv8F8pSs+gsagiXrDRGdtgLq5qX4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6231
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 9/1/25 15:51, Melissa Wen wrote:
> Remove this flag as the driver stopped managing it individually since
> commit a4056c2a6344 ("drm/amd/display: use HW hdr mult for brightness
> boost"). After some back and forth it was reintroduced as a condition to
> `set_output_transfer_func()` in [1]. Without direct management, this
> flag only changes value when all surface update flags are set true on
> UPDATE_TYPE_FULL with no output TF status meaning.
> 
> Fixes: bb622e0c0044 ("drm/amd/display: program output tf when required") [1]
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dc.h                       | 1 -
>   drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 6 ++----
>   drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 6 ++----
>   3 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index b41e66c31e6a..95d803b40dd0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -1390,7 +1390,6 @@ union surface_update_flags {
>   		uint32_t in_transfer_func_change:1;
>   		uint32_t input_csc_change:1;
>   		uint32_t coeff_reduction_change:1;
> -		uint32_t output_tf_change:1;
>   		uint32_t pixel_format_change:1;
>   		uint32_t plane_size_change:1;
>   		uint32_t gamut_remap_change:1;
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> index 7d24fa1517bf..bd3d614aa71c 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
> @@ -1982,10 +1982,8 @@ static void dcn20_program_pipe(
>   	 * updating on slave planes
>   	 */
>   	if (pipe_ctx->update_flags.bits.enable ||
> -		pipe_ctx->update_flags.bits.plane_changed ||
> -		pipe_ctx->stream->update_flags.bits.out_tf ||
> -		(pipe_ctx->plane_state &&
> -			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
> +	    pipe_ctx->update_flags.bits.plane_changed ||
> +	    pipe_ctx->stream->update_flags.bits.out_tf)
>   		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
>   
>   	/* If the pipe has been enabled or has a different opp, we
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> index d5b5e2ce6ff6..65e45c624530 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
> @@ -2029,10 +2029,8 @@ void dcn401_program_pipe(
>   	 * updating on slave planes
>   	 */
>   	if (pipe_ctx->update_flags.bits.enable ||
> -		pipe_ctx->update_flags.bits.plane_changed ||
> -		pipe_ctx->stream->update_flags.bits.out_tf ||
> -		(pipe_ctx->plane_state &&
> -			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
> +	    pipe_ctx->update_flags.bits.plane_changed ||
> +	    pipe_ctx->stream->update_flags.bits.out_tf)
>   		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
>   
>   	/* If the pipe has been enabled or has a different opp, we

