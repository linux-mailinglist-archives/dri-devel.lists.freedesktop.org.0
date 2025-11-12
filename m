Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CECC53245
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5164610E759;
	Wed, 12 Nov 2025 15:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KSP+dOE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011035.outbound.protection.outlook.com
 [40.93.194.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E8A10E759;
 Wed, 12 Nov 2025 15:46:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBtd0X+si8WLtwPuOUkGzKpPK7JgtkAQ9+1CRNMQtyXw2bdZZt/noreCkHVq7/l4Up5G5ppq8ROncsqZYpis0QbZqMO2vwiR60VPLZjr0h40HufZnL+ct8a3w66gVBZ22uYKOB76ZMj6OohbNeGivdzO3vwj9H4otKGVBG/qnhLa4Ta88sSHOEAsE19ac9n4QI13GypMoOJOnfOdQ8YAFYBIYn1n5oWDnySaVji1TWTAr0ylewZ+jV8wQKOM8Xaqlg85xt6/KxDXE4am2MKmf7zvmfCuBwcIGCWdBJAEVNBP4hh4GxVGRVQtrhopH2CTxsPZp1XMqMVQtO/jyMHdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcAsgVNlHplKOW0fZUbPPUxAYPTu4Ii5ZAvhs6ZvE28=;
 b=KxT6MsGGkzu9AGGDzuod0WnrAatBOFPNO7YSVkGFLAVS9PMkd5wVaDUvH+DQoJIOEXyLrJkWzFwpUh0io0Gshm3bfORFTxCEGRpyW26+Gwt/K6Di4rApIe7KSRou0kg3aRDft+okbnX198v4uQ7dO70I+rUdgIK48ka8c7oANlqwQtVxZg3k/3A8DQAgoeK+nf2tkqfZ8VeEbaSB1Xpj23sKXT+owrQ2d6mGAcTS3DV9YB3kw/TIaPMyXIx2b9Ey/pHr5aJx5/e2Wu4mjxBi8d10DoaVZtz0bjsV3RDkED7wnNVa+8bpEiWzm2UHf3lclppUAiGtAEH/IIcPaiohYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcAsgVNlHplKOW0fZUbPPUxAYPTu4Ii5ZAvhs6ZvE28=;
 b=KSP+dOE1wDM2V81UIgmR6et6hmDQ6eA3go0JDRNnxBNCIAXwwxTug1P/ez10BIeO5fP/v6QcIGSeA5qhyL8CQvXn5Hy3UWz7JruuEsZ58Bvo7/QptbI+TA35KsqZZRqqW77EbJyZtzji9pl/t2e+7QPiqQm7ml+aHGCs4EcRLyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 15:46:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.010; Wed, 12 Nov 2025
 15:46:32 +0000
Message-ID: <ef070b8e-602a-4d6d-8cfe-0fa74fe38563@amd.com>
Date: Wed, 12 Nov 2025 09:46:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/15] drm/amd/display: use drm_edid helper to set
 analog EDID caps
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 airlied@gmail.com, alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20251106165536.161662-1-mwen@igalia.com>
 <20251106165536.161662-5-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251106165536.161662-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:806:d3::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: de2619dc-22fb-4aab-2b88-08de2202a71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1NmMjkxWWQ2YWQ4YWJ2SHVxYURtdzEyZEFrWmtiZWdIa0picThYcFdSb3pV?=
 =?utf-8?B?Y0swVXhFeE5rRlczcnlsZmtsZzh6TzF5bVIyNmJITmJQVTlGNGJ4eW1LRXlC?=
 =?utf-8?B?cEhha0tiQkp0cjB1b0RxQ1pCdlZ2c3FwRVlTTGZteWxRSGlUcml2WWJtc0Nh?=
 =?utf-8?B?UUh1blBRUER4OHBoUHAvZ2t4V2s2NnhOMmpmN3g4RlN3Qkl4MytLK0xyTWJs?=
 =?utf-8?B?WGV2MzMzRFQ5eUhyM1E2ejZSNzQ1ekJFdnF1azBEL1ZuNng3dnZJQldIY0ht?=
 =?utf-8?B?R05Rd2g3L29wbFBUMDM0cE9LR2o0TTdpb0QrMzBmVVlOOXkwV3Rockg0Rzha?=
 =?utf-8?B?aEdIU2dCdzkvRHlxaW1ndmxnV2U5ZGh5QXNvSUt2R2ZJZFhNYjVVeUpaelR0?=
 =?utf-8?B?cTVOVFNZNW5xWUVxWkdkTis4QmorMnkrTGJ1ZmVTTXFuRWtQOUVSZWRRQkJI?=
 =?utf-8?B?UWxrNndOVzYrbmY2MzhqT01RN2R5TlNBUGRlbVFVcFB6cjdaaUdLdnZoZDhG?=
 =?utf-8?B?SzNoRUxZelZ5bHU2OEVSNTJIN2FHd0dVbG9BZjdISkk5TXgzMktBNEZIdG9T?=
 =?utf-8?B?UFpBVTlCeXJpWHN6MkdzNmFBbVUvMTV3OExpVDJYZ3JsN2wvenZyVWRKVE9D?=
 =?utf-8?B?UlpIR1R0MWt4dG8rRVQxNXp4OW9DM0FJRDlrdGZBMzg0RHE0NGRGajZRMWpS?=
 =?utf-8?B?bUZCY3lnYTB4d0hzRnJvZUkwZGcrTGxHNFdQSFlvR0ZuazFka1FCbTJ0MzBU?=
 =?utf-8?B?bkRnQUc1a2tQVGFwUkZmZGlwUDVyUVRPb3JPY2F5ZGtJdU12NTROTk1UZXFz?=
 =?utf-8?B?b0JMY3BnZ0VJcENKT2tFUjJWZVZlTWpWODdoMEYxSzhPS1ljaHRoeXdSTEVY?=
 =?utf-8?B?MXV4akVMRFZ3bUZ3OHpuN1dXcGdzMU1XTktEMUZ5bVdKYUhBTVRJTmxHVzVa?=
 =?utf-8?B?THZocUNwUHdQZ0U5aWYwNmhWWXdpZzhVVU9PUjU4dXdaaFJDdzRQZFhvUGFT?=
 =?utf-8?B?azY4VmoxSjdvbmlLcEsrZWtvVFRpRm5kQ09uSnpWWjFLZDIvZElZWXJjREk4?=
 =?utf-8?B?QjFFb1N6U1dLQ0R2RjhHbGFtbUEzeG1hODZBaHU3Zk13NldURmlpZXo1V09X?=
 =?utf-8?B?N1BSTEtsNS9MVWhyd2ZTRldQeVUwMzV1cTJEOXV4RTV5TGpCZGpRVXFHNGpE?=
 =?utf-8?B?d0FKSTFibmR6bXI0bkFYcmFhVUlCT25LRG1QMlRKTVR5aUduNCtjN1ZtRVJB?=
 =?utf-8?B?VSs3ZVZLdjVvcTNhRXNCNGZRSlJSdjNVbTVHaEh3OVkyZXpuZlpnSzZaT2Vx?=
 =?utf-8?B?TnBJT2h6dTVsci94dDJaZGtRSVl3RkFXR01yRzAyT2hZME90NW1FMUZKQ0Rl?=
 =?utf-8?B?NS84a0dhSjlSWlBINTdidUluQUlNcTlsL0FrMjJoeFMrV01mMi9mK3dMcVM1?=
 =?utf-8?B?ZWtnQkRrTTBKTjhkdUVTK00yR2dZRTltZi9QMFhtVEQrY1ZVSGUxU1ZQY05E?=
 =?utf-8?B?ZnVCTjlncFIzclM0aE4vQ1cvSklQZFVtWHBTMW5aa3F3WGY3SU1SeU1lQmhK?=
 =?utf-8?B?UVNKODg1YSs0QlJuZjJBbUVHaUYwMkExdjJ6L1N3ZkhUVVhHRi9VR1o0OXlD?=
 =?utf-8?B?MzRuTTNjS3hRV1dOSTJkMUdkVG5Nbm1KQlZWSS92UVZDbUZJbmNzU0gzclUr?=
 =?utf-8?B?QWRLTEVQWDltT1FiZTkzTHphTExWZHliTGdHOWZielQ0anpyUTVFNXJyM09l?=
 =?utf-8?B?ZkZwMUs1S1VKblBKZmVhTEI3L0dtd25sY0JuZDlzd3d1MmY1U2cxTFpkQTgx?=
 =?utf-8?B?SmZHR3BZZ2tPd3VwMEp2RGlRbXUzczRMSFhUVFhmVzdNYnE0bkRCTkFPNWxP?=
 =?utf-8?B?SGloeThKOUViZ09kNzZ1RGUzWkdEY0prcElnSEl2NVdMdmc4RHErQnJqdWJu?=
 =?utf-8?B?MUUyeFgrTEJyQzN6T1NzcFdvT0VxNDhwTmJzWEJTMURjRU5CdldqbHgvb3Vk?=
 =?utf-8?Q?6myp3YOVACBhJI2D1sjEQ1Bu2vzUwk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDIwM29MelFuVEZJdE5vU1pSYmsyZk1XRlRPbE9lV0pEb2tVaWladGJkYnBq?=
 =?utf-8?B?bXZSbFhkcHhOVkFvYllubGhHeGlxUGxZNDZDZWpBWlZ5a2Q2aXJSNGoxSzJE?=
 =?utf-8?B?Z0wrUHFVSHhaOE12NlhVcWNzbnU2RnZGTWpSTTk1YW5rQ1k2WGoyNC9kaVZi?=
 =?utf-8?B?d2RPUGo4MmtlQ2tNc09KR05DbmlCb3Q4Yzd5MWU1ZTdZc0xkcVljY3BSanQv?=
 =?utf-8?B?ZDBsL2xiSUNWTzFpMC9ycW9raFRPQTVIY1lSUFJYR0RCK2FOdnhLZWwxTDdR?=
 =?utf-8?B?TGFvN0xGQmg1ZXo5OUtZN2xIZjArbnBIL0NMd0Z5LzJlRHd6c045dCtVTWpB?=
 =?utf-8?B?d3V1L2xxRkN2OEk0TnlGMFVwclZHMW5oVHJ5Y2IwMVo3eUxyZklzOVlzKzRl?=
 =?utf-8?B?Q0NQeHJpQzFzNzQ0Um13bDRheUpheVkvd3lIQW9VeFFEb0NsUkVjOTAzMDVU?=
 =?utf-8?B?UUVlR3Fvd2o3WERXTFV0cFZHMEM4cy9vZ1cxd2ExWkllNythbmk0SCs5UEZw?=
 =?utf-8?B?dDNuYkk4alh6UTN4dHVIL0U5N0g2SG02TDdFTm5ZSjFOSFBBaW1CdjY3R05y?=
 =?utf-8?B?RU8xL3hleGF6NGRRaDd3dWNCbFdsSXJVOU1jSENwU2R4b3kxMEhkb09XYmoz?=
 =?utf-8?B?emtFOWQvSnhIbklQYjI5MVRyTXZoODhHcVExQ3N2RmtMOHBtNWxsU1JtZkpN?=
 =?utf-8?B?R1I2N1BiN0xhQTlhVngrcW1XUVU0SHlNWElrbUU5TnYwM1ZuNVIwM040emp4?=
 =?utf-8?B?dFp0TmNYTHVTYlhsc01tWTJoSnVVNmkrVld1TGtuOEcyZFR4YW1DaU9nSzVS?=
 =?utf-8?B?V09HejlNdVhoVE5FRktsUWpVV2ZWR21FSitHaXpYZnFVZlhnTTZBTktCTlFO?=
 =?utf-8?B?R1pZQnA2aXFrOSszWE1MZFVJVUZSWWJEWFd4SkpLRHVkRVc4LzFHRTFxcmp0?=
 =?utf-8?B?K1d2MzQvdy94WUpHWjFOdlMxY1ViZG9YYzNpQ1pTMmQ4ZGVZb3AxZ3pkYzlj?=
 =?utf-8?B?azJQWkRtZFg1VExaeEliNWYra1NIQ2VTQ213cU53aXJ1WEFBOVBDN2hHVDVh?=
 =?utf-8?B?bzdnd1BQbzgxVnJPaGtQLzdUYmZ2Vy9Na2lIZUZIZUNnWUUrYkhCN0VOL2Vn?=
 =?utf-8?B?WG5zWHBYQzQxaWtCc2tEVU50RHlGWmVwRWNhMUFRS3p5K0I4bUdna3h6QWJM?=
 =?utf-8?B?YkEvVnBjU1MvQmh4VUxiTGxFeWtZdHZPajlXUjNGbjFjSng4M1NsR2c5Y0tP?=
 =?utf-8?B?N0FQWjE3L1poQUNnSXppR2E2OHIwajFtZnlUZFFtTWcxUWEwQ3o4bFJoRk0v?=
 =?utf-8?B?dzdWdnk0eHppM3l3RWhub3VmdjhSM01uZ1kxUjU4bWp3aGJQMG5aVnNTczY0?=
 =?utf-8?B?UFcvdnRWQ2RmcEkvdTBHcW9xRmQxclJVM2I3MjdJNkdsZHZlOVR2NVVUUnhR?=
 =?utf-8?B?enAxbmdFM01rR3ozekNFUUNldy9PWjI5T1MyamdmUUFvTkMzcFZJcjhWMmhO?=
 =?utf-8?B?S01CQk92NDdHQ2JoU1BqOXpQMDN4bE50c1JUazBQUHEzVnNyQVcrbW12dnAz?=
 =?utf-8?B?cVFkb2cwNG9VRWtNSys1RkRDeVhTRG5vM2ZHcGEyVXFvNGpJTXlsOS9HbzJk?=
 =?utf-8?B?d1pwTUdPaG1NQUtWdE9tTE1hVTFWbm1LRTEzSU9RYS96MUkwQ3VBUUxtQnY1?=
 =?utf-8?B?S0Rmd1JiQk5IT2lxTDBJVTA4bVlrQ3J0c215SWJZSENYaU4xMjRxOGxiam4w?=
 =?utf-8?B?V0hUeC9rSmpLQkVpUnZ2ancwSTVVQ1pSUFcwaVptZURORkRidlpKZ2N6M2FX?=
 =?utf-8?B?T2FKOG1PNm11dzVDczVXSVN1QTVRckg5bFhyTGNSNGlvc1VZVGJmc1g2dW94?=
 =?utf-8?B?K2dEeXhTQ0k1WGdsQ0hYeHpWMGFCN21CSGNiMXZSQkUzY2JVZStaWGpReVV4?=
 =?utf-8?B?U05MTzlzQkNmZFhhclFNMm5xZ0tva0JTQVl0SHBCVkw5RHF1SEdQcXBXRllQ?=
 =?utf-8?B?RXFvYlo0MnVkOXdMZVFHamhkQ2c1Z1VtK0xWb1U1aW5hVFkvalZCdzQ2L1ZX?=
 =?utf-8?B?dFpvRTFwWEZHcXpaTGlKVFZhZ0RxdSt1N25lVGk0UktkZnVoSlhjVCtUYSsx?=
 =?utf-8?Q?X8aXOmmHh4WDSVRHqBaNrjbP9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2619dc-22fb-4aab-2b88-08de2202a71c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:46:32.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dVGGjCjhxNBswO1kUE1tCX/cB6K5/4Td7tdBUQTw8LYZbikVlWe+dhwQ5rRyk8PXFo2pT/haGOqLkrfPrCWMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987
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

On 11/6/25 10:49 AM, Melissa Wen wrote:
> Use drm_edid_is_digital helper instead of open-coded mask.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 7d05cff08233..05e5f51b0a90 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -135,7 +135,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
>   	edid_caps->manufacture_week = product_id.week_of_manufacture;
>   	edid_caps->manufacture_year = product_id.year_of_manufacture;
> -	edid_caps->analog = !(edid_buf->input & DRM_EDID_INPUT_DIGITAL);
> +	edid_caps->analog = !drm_edid_is_digital(drm_edid);
>   
>   	drm_edid_get_monitor_name(edid_buf,
>   				  edid_caps->display_name,

