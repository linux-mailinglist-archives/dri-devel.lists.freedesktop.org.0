Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7424DB7EC14
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9432810E3FC;
	Wed, 17 Sep 2025 02:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E3YbWFgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6791210E0D4;
 Wed, 17 Sep 2025 02:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzRgBJjHKS9OAMEx8a/V0fHhR7DGTSA5SOhWpVgP6U/HLvnDXCTIb88g2MRT3oxq5kFlIndeBOh5GLuEOzE8eACCM2XJwasvs0w+VC5aBpigV+goD+OmYMZIeLb37qzbRwcnrIDJkl1wRWYidVhWYZkXlnc9Irbp1cwe9nzrSnhOOS5RcETsnjcmkSBMo1M4sfX2lV2KQ9WUBR0mqT8tVLzYXmvMPv5uVWH9LO0/3ZvZoLIqvbysU27mGQv7Av18cppn5XLIkG1EyLYwC2wMt+uvZsMECw+7C7JIev3j35yl0LCSXFzcKzKV+soFXjKw9YLHVdpkby93j0kvw8xw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68G0+t0KwvD+y+G6qSc5G+VzM4M6bkg1TVkgCgQXYn4=;
 b=U3Y8EcY61yFsYcKLO2vXKsBZZ8A+m0HdV/iYXP3MnZLVMz754aftG7u8C2MI9D1PWxCdx4+5oD4o5YV6b/LDdwBBVarKSnQ5Ea2WDBmaf+tsAAyLgt5Wvc5mbkVUzNeMVujS6G6Yo3MiVsZbEYwyS9MeNgeBxoUOLADCBZgKMY+LCYsRYP84xfV0X2ltQ8JkZbtj7Fi0hUcjCrOcVLtkkcDXaMkWDgK8DpfO8tCqZRk+YE7zhohxxXd0tFE19pkvbK293gaGte5AhOVXsHjAaJK0QXJP37w8TVuU0dDmqObC/fKfuvRrDwlcpAgdKnhuEd1vUPI0QglI0WA4FXa4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68G0+t0KwvD+y+G6qSc5G+VzM4M6bkg1TVkgCgQXYn4=;
 b=E3YbWFgMou+EnMzKQBkSNUhJRqFoLt/It7EGAq1txNGirzmjcYF7HkLLDJ4VeWBAex5pRKUo2EOSFMRW5ZQ5SGTCq3OB33WT3YqVljVexVVm9Yk1srjyM02lWI7xA/YoQQsXt8AEwGwAWVx1t3e4KcPKya/U7k5E0l7q249TstQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 02:23:04 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 02:23:04 +0000
Message-ID: <1337aa18-550e-4584-9a58-88b480e65f37@amd.com>
Date: Tue, 16 Sep 2025 20:23:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 11/47] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-12-alex.hung@amd.com>
 <14dc410514608487a8f44c2060ee7aab3339e64f.camel@collabora.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <14dc410514608487a8f44c2060ee7aab3339e64f.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:303:dc::17) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH2PR12MB4135:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dcc3f82-56c9-4342-642d-08ddf59121c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXdSR2NkdlRIRm1VYURrZDdiYmxEK2IxdVlvcjZhekJRdmxjdE9tWHpTeGlG?=
 =?utf-8?B?cU9jSnN6cWlOZTdSR1JxNVFEY2FwY000VThtc1NCV0g0dFBTaDRsdlYxdHhv?=
 =?utf-8?B?NUZHRm5lbUhzVnQxZmVGa3lNZDYxRkhqWk80ZmthV2hyaDM0WGsxa0IzUHJ6?=
 =?utf-8?B?TU5GV2VEWUxMZ1VyY1JtbUFkVXJUcW5ZMmtNZUdFckNNYzVxZ3k3WitsVEJG?=
 =?utf-8?B?WVFQODE3RXNZT2xoNHNRMXVPQ3M1MWZucVU3dy80S29rc1doSkNhZmQyZW9T?=
 =?utf-8?B?UFpGTWppVG1LQmdic2lUTmQwM21wTWRLMmJQT1QvcE0rb2xOWjY5d3B2YkZU?=
 =?utf-8?B?SFRla2Y2eUJsblJEekJrSUIzVVpZekVjNU5kUXBtUm1aenQvUEZlUXBkcUZz?=
 =?utf-8?B?QXlpeWd1SFNkaGFPekpvaFBxaHp0K29yZENDMHhwdGh3MUZqMmtWSTNuQWlY?=
 =?utf-8?B?VmxkZldtcW5TcUxDN3YzNmxZeWRvWFpKcC9KU1o1MHllYjNva2NJU2VlNGc3?=
 =?utf-8?B?MlRQMzNtb0p0T2dhdzNJRmFKb1RSemVWclZPcG5INUwwUEdyenZBTlpzUDNO?=
 =?utf-8?B?aXl4b1JoaFRLVW52ck1iN0hSbERtb1Nwbjh6RFlKUy9pNUdLWmg5bGVEdmZS?=
 =?utf-8?B?WTZONThLTXBCbVRUWXQ2M1pQbGpkUjllQ1U0VEFiYThIUWFHRWVySDdZYXNq?=
 =?utf-8?B?UFNBYzhSU0p4NXBsN0d1ZDFKTXBtK0FDYVVVUG4zNXBGVWt2bEJrUk45NklY?=
 =?utf-8?B?V0txS2NZSlNLaVYybFlKdzQyQTM2dXNENVpIK3lGbTlvemVHRFF3SDZQUWJm?=
 =?utf-8?B?WklKeUdva2ZGbTUzMCt2Q3JCTzBmSUYwalFkdzFzSUEvbm5xL1Mycmg4cnl2?=
 =?utf-8?B?MWZIL2g4N3MrYVd5RzFDRVVVdE0rbGhuV3FOSk5KbklVaFM1MFFBS3Vra1Vr?=
 =?utf-8?B?TEJkNitPNTJPYmFBNXFnNWxGWlBLVy9TVXJKakk2Y3JWekRTcVhHUm1uRlJJ?=
 =?utf-8?B?Z3poV0pNYkNvRkRZVnpFdUd4Qm9FSzd2TEw2S3V1MWpobm4waHlFTTVvbUhl?=
 =?utf-8?B?VlE0bFBHcXBHeHFqTXZsNXFxMCswSittVFBUSXZBRHlSREpFT3RIMXd4enpV?=
 =?utf-8?B?RWNLSkl4YStkbFFCenBGZ21TemZaSEgybmZOWlRqNVRPN040S0ZNWnFPTSt4?=
 =?utf-8?B?QjJVdEpwUjlxbzNSOXVadEZISUFBVUZKUUVYRzBSZzA1RloyVzJ0SUtQU1dj?=
 =?utf-8?B?djQwUk55Y245WW9jRUUwWEVZdTNCaHpMRlFPZ1VIcDJBcW41aDQ1SDhSdWdC?=
 =?utf-8?B?dGlyL1hPaTJ0NE0xR2pMclRIdG9aRTExdGkwTm5OOWtyUEw4TnlyaHVZdDBK?=
 =?utf-8?B?b242R0h6QjJxckwweklXRm50ek5lVUdXWjA5WlJKdG51MWkwRnVCakg5ckNT?=
 =?utf-8?B?UHM4RHMwL09Jd3VxcWc3TXdBTm9DMWk5SUxxUWJuQTdqcWJtS0ZMdGZESDRF?=
 =?utf-8?B?RURLKzdIUHo0dDhTTVRTNGMzbVMyVWlrMXpEVjM3VS9HWVVzdkp6S1lMTHVF?=
 =?utf-8?B?dzVNN01pT0oxeVhPYkNwcTZnRTF4VFlEOWJJVnlTNEN2OUtVYmMvcnJwUERW?=
 =?utf-8?B?SEtJY1MwZkhmN1RtYWF6L04xL2hBZG5qTGRjMThzLzM2RHV2UlVscXVzSmVN?=
 =?utf-8?B?WlpJRlNobmE4Rm5UMXRkWU9wUGlPOTVGek1SYWxsKzByakZwbWo5Tit1QTJW?=
 =?utf-8?B?S3hOcGN0Tzk1emVZRXc0VlQvalpTRmpQWEo3RG1sVTJKODM5Y0dId0k0Vjgr?=
 =?utf-8?Q?uY158qbb2hTFoReyHQdtdTqkaequyvaESwFIM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHZyNldnOElZMGJ1TzF4djcramRZMnUrTyswVDhORlI4NzhDMjB0ajUraFkx?=
 =?utf-8?B?VGlhV0V5a3dSaUs3cjNnNlVCbEU4ZXlmT21IbjlhZldCcHBSRGFSLzVSajd1?=
 =?utf-8?B?QUcvcGpIN0xjSmJTSWNMT2dKZEF4S3pSZGp2d01XUWlPSFBXRDcwSm8xYUVL?=
 =?utf-8?B?Z0d2UENERjhqTDRKQjA1NkZoRGFHdHN0MVgxblA0L2U1aXcxZEI1eUFrbnJB?=
 =?utf-8?B?YWt0dEhRakFTNVJrYStwRFFabTdmeEIxUUc5a25vbVo3eVVTMzdHMTZLbWla?=
 =?utf-8?B?eWdVR1RoUUFuRGtUQkJkSDcvb2QwWnQxOE5jdjNZd1dKcGVsMURGTklPQ1Bh?=
 =?utf-8?B?SWFxL0VWeUM4b3NjOWN2YTgvTGY0ekw3RmpGM3VoMzdidUJVTUtKcUhYcjln?=
 =?utf-8?B?dkhxbElhOHpJSlgvYUpUQzNKZG1ORnMxNklqeG9xWk42WDRzTzFJUVZMVVBj?=
 =?utf-8?B?VGpoMEl4d0g0Q1ZGSzNzclBxVTM2K3hwVTE3TXlDUWl1ZncxOHcrNVJuaytj?=
 =?utf-8?B?UnpHMW1vOU5qcDlqZzNaMGt5b2FPSEpqTFRjdFN4cTdQcGZuZkpYWndvQVdz?=
 =?utf-8?B?WmlqSGJwQmFtdG1wQjFxcWFINnpDZnl3Z1NaVHcrbElpZS9pVXJZQ0I2UExY?=
 =?utf-8?B?YlFOSzZrRTh5V1dyUzdwa2lMYWErVjMrbDFCbVVPV2VoSGxJNDQ2aDBwaFM1?=
 =?utf-8?B?ZDJ2b0dHSG9NWEI5OTdiT1VJdjdxL2J1bzNSLytmYy9PSUt5cTl4MHhkL3RP?=
 =?utf-8?B?dUw0dmoxQXJKa2xXbmREZm9JeFFmaVpTNGUxcDUyb2c3WHA3Q3RKVFcwaG1r?=
 =?utf-8?B?V0R6dVJ0UkszRFJjRVNRNm02Q0JoSmU2TVk4c0FHZkgxNWJBc3NYODIzcjBu?=
 =?utf-8?B?S0QxdUlYQUFWQ3kvZlE5cHJ1OVJyWVYzeGN4UEFLcmw5cHdPaGY0VVZTKzBL?=
 =?utf-8?B?dWVsMFltZEtCaThUWjRFTEFkMjRoMy95RXlxc3VNWElqcE14ZHg1QjZ0Q0FH?=
 =?utf-8?B?RjMwZmh3ODJIbFg5QTlvbFM3NXU3a1JPdUswYm5XUUNhZ2hTRW1maitEL1Bv?=
 =?utf-8?B?MExac2JuekNkVkJpRlVubzNESU8vN3pTL0p5aEtyWTF5Wk95YllhMzNuRmlM?=
 =?utf-8?B?VjVNaUg3Q0Z2N0VaWHRoL0ZyMnBRLzVWYzBJVVFlU0VxbFJrYnRKbkZPNzhj?=
 =?utf-8?B?OE5PdXhDZkVRTDlnYlZOVE4yRkNZc0QrMlU4N1lpcnpyQzRLdjRQT09oZG1k?=
 =?utf-8?B?cGN3M2E4ZVRFS2k1eUpJdU5MSWZxNTNGaThBQTVDaUJTYmVqakZ1V1pVVjBG?=
 =?utf-8?B?NjJ6TG44UDlTSnNQL2tMZkhaaTBxYnVlUXpmUHpUODF0YUlwOTVuOTJIL3Vh?=
 =?utf-8?B?U1JCRTloR2pzV1hmUXo5ZWQzdnJQMmFsQXAxUWcxZHJxdUErZTdyMERMcU90?=
 =?utf-8?B?L1diM3lsUSt4eFJiWUdKaE9tT2hMejRLcGZmcmVpbDFrSjhyZjc2TWpmWFNZ?=
 =?utf-8?B?T24rTlRnTzNTQWtZYkRLR1FBelVyRlU2a0ExOUg0OTR2LzFCYVo0M1lQNHdX?=
 =?utf-8?B?QXBHcXI3L1hDWU1BUTBUK0tFcUJtbXdHWVZIZlBOMUM4Mkk5QWQxaVd3VzF2?=
 =?utf-8?B?TTZwMGY5ZmltQmZZT21MNVk1UU91eU9aQkxKcTZwN1Rzc3gwNTZBdlgvZHRn?=
 =?utf-8?B?SmNOZUJhVFo1anJ6ZGtCQ1pVa252OEN3ZG9rSVlGOTRyT1J3K2JGazVseE5z?=
 =?utf-8?B?ZnpKMzVibkRYS0tFNXVyWVJQMGhLVDFyNWIxbVhhYW84bEx2WVdWdmZFcDdh?=
 =?utf-8?B?YlN1RVhlWG1kNUZWVHJHQlBQVnBpYk1qNVo5M0pMY0ltcGNaazh4dzhKNFFR?=
 =?utf-8?B?cFU2UzdabUpuZWNqdlQwMlR0ekdEczR5RStVVDR6OTNGaGg2SUJiU1pzRWxo?=
 =?utf-8?B?WTBmbmZYc1Z2S0JwU1RpNTA0NW9CRWtuWGlFSmhqNXF6TkNIUFlUNmJVRExI?=
 =?utf-8?B?NTR0MXBqU1M0RUVNbEU2SkdOVVAyMFhPWkxuVVhCRDJFTENjRG5MdzFHbEY5?=
 =?utf-8?B?UERnbE83dGhqWTgyVHJiU1ozS2VMU2R4L1ZITjdDam52c3BYSW11NHNIVXZQ?=
 =?utf-8?Q?0uUnArapj3/XQ5gEaPRUZqC1w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcc3f82-56c9-4342-642d-08ddf59121c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 02:23:04.3716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pwq8D5k8ZUZPfopg73xl2e1qej52DtKLeTnH5EXg0MVT2HtuANJgnUskxdwfZK/5LnsjBB9BCan6SLB4fmnT3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135
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



On 9/15/25 12:43, Nícolas F. R. A. Prado wrote:
> On Thu, 2025-08-14 at 21:50 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> With the introduction of the pre-blending color pipeline we
>> can no longer have color operations that don't have a clear
>> position in the color pipeline. We deprecate all existing
>> plane properties. For upstream drivers those are:
>>   - COLOR_ENCODING
>>   - COLOR_RANGE
>>
>> Drivers are expected to ignore these properties when
>> programming the HW. DRM clients that register with
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE will not be allowed to
>> set the COLOR_ENCODING and COLOR_RANGE properties.
>>
>> Setting of the COLOR_PIPELINE plane property or drm_colorop
>> properties is only allowed for userspace that sets this
>> client cap.
>>
>> Reviewed-by: Simon Ser <contact@emersion.fr>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> ---
>> v11
>>   - Skip color_encoding/range_property in
>> drm_mode_object_get_properties
>>     when plane_color_pipeline is present (Harry Wentland)
>>
>> V9:
>>   - Fix typo in commit description (Shengyu Qu)
>>
>> v8:
>>   - Disallow setting of COLOR_RANGE and COLOR_ENCODING when
>>     DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set
>>
>> v5:
>>   - Fix kernel docs
>>
>> v4:
>>   - Don't block setting of COLOR_RANGE and COLOR_ENCODING
>>     when client cap is set
>>
>>   drivers/gpu/drm/drm_connector.c     |  1 +
>>   drivers/gpu/drm/drm_crtc_internal.h |  1 +
>>   drivers/gpu/drm/drm_ioctl.c         |  7 +++++++
>>   drivers/gpu/drm/drm_mode_object.c   | 18 ++++++++++++++++++
>>   include/drm/drm_file.h              |  7 +++++++
>>   include/uapi/drm/drm.h              | 15 +++++++++++++++
>>   6 files changed, 49 insertions(+)
> [..]
> 
>> @@ -399,6 +401,21 @@ int drm_mode_object_get_properties(struct
>> drm_mode_object *obj, bool atomic,
>>   		if ((prop->flags & DRM_MODE_PROP_ATOMIC) && !atomic)
>>   			continue;
>>   
>> +		if (plane_color_pipeline && obj->type ==
>> DRM_MODE_OBJECT_PLANE) {
>> +			struct drm_plane *plane = obj_to_plane(obj);
>> +
>> +			if (prop == plane->color_encoding_property
>> ||
>> +			    prop == plane->color_range_property)
>> +				continue;
>> +		}
> 
> A feedback that came up when discussing post-blend colorops [1] which
> is also applicable here, is that there should be a driver cap in
> addition to the client cap, and that the client cap should only be
> possible to set if the driver cap is set. Without that, if the driver
> doesn't support color pipelines, the client will effectively and
> unintentionally disable color operations without any replacement when
> setting the client cap.
> 
> Another suggestion was to keep the deprecated properties (in this case
> COLOR_RANGE and COLOR_ENCODING) available but read-only so that
> drm_info can display them and so that graceful handover from colorop-
> unaware to colorop-aware clients can happen.
> 
> [1]
> https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com/T/#m830e2f87ca82b1f8da7377d0c55c557fb070c2dd


Thanks for this. Let me go through the thread and come back.

> 
> 
>> +
>> +		if (!plane_color_pipeline && obj->type ==
>> DRM_MODE_OBJECT_PLANE) {
>> +			struct drm_plane *plane = obj_to_plane(obj);
>> +
>> +			if (prop == plane->color_pipeline_property)
>> +				continue;
>> +		}
>> +
>>   		if (*arg_count_props > count) {
>>   			ret = __drm_object_property_get_value(obj,
>> prop, &val);
>>   			if (ret)
>>
> [..]
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 3cd5cf15e3c9..27cc159c1d27 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -906,6 +906,21 @@ struct drm_get_cap {
>>    */
>>   #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>>   
>> +/**
>> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>> + *
>> + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
>> + * property on a &drm_plane, as well as drm_colorop properties.
>> + *
>> + * Setting of these plane properties will be rejected when this
>> client
>> + * cap is set:
>> + * - COLOR_ENCODING
>> + * - COLOR_RANGE
>> + *
>> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
>> + */
>> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
>> +
>>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>>   struct drm_set_client_cap {
>>   	__u64 capability;
> 
> One other thing pointed out was that these deprecated properties are
> not actually rejected, but simply unlisted in the current
> implementation, contrary to the documentation above. But if we do make
> them read-only we'll need to revert back to the implementation on the
> previous version, and then the documentation can stay as is.
> 

