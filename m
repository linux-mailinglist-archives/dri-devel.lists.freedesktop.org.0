Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF3D93C736
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 18:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FA010E2FA;
	Thu, 25 Jul 2024 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qev/8q8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973CF10E05F;
 Thu, 25 Jul 2024 16:35:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7r+IT12Uwi72zCZTwmgP2w9ivlj83fjAA5FIdVAQ+uQ+xZjiMFySRfF3e7JAj6GsqW+br+qu3KnNNPTtJRs34J/G1qLKIqi7IWekWB/exqozERhUohZWJoH1Z4FYVYk34ewYvnXjCoiVMP9xFcX4hxkEsHpXHnKD4ul9TVjiFWPSifBfLcNr4I6ta9qYM6ufRlVBMTBjzy7qyJIfrEPFBjVvpdoGs34ukXiUCrZ1JohPxWfElpNVnL5xYQKbqTYfZxO7Ri/YNorf/gbDW5hjC93KytCtnBnl88xsbvBfpjtXP4ZGJT61MN+5uyTNH1vq/b+XlmH+9+UBRYeJ8TIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCA0uy/vzA2yG/Lf3qfe8CWMc5Q6xCx7NWq0tLDeWlQ=;
 b=oK60Y9TNDmBdHfcCghREInX1jbM4Q+ydyHppQJ0zhnHx3vD1EbxYEFeAMlWGP7HN9YrYWTZS4JP/hEj9f1npFhiYO81WGKG4MxQordHIezAGGKTL1MAJZ9HI/3jn6915/gC/LdzvhoOApFbe67+QBXevVnAAwC2vdR76Llc3bgJwYPLBms6ItTwdx16yEefceOmie0fFqL4fhfYF6b6aysHOixbh5e+tdlVpgt+g5HthsxOj8mPIAz403yjJ1he5rIvtsFxjK1M9Rt70HsLtduTuHqZZrnf+2EJ9Qxl6Vrr4asMeebjDxfStKE+eIaDYqbukWPWd2cT/NFOBa5588Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCA0uy/vzA2yG/Lf3qfe8CWMc5Q6xCx7NWq0tLDeWlQ=;
 b=qev/8q8XdTkbSZPIQStkiGtnpCsCvDI4i86MK+Bc5RlZbXK/xNbiTvwKrqGyF8r2vaaV7x16BnEpcZMQfIy9bwb4Koq4SDibyXMb4OtcOBrOht7WTow9wUu+ey/FaVht6Hz4VJ4zq/hiTFFDU9bQyOHLYJerrNZ+HCo4uEctjEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 16:35:15 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 16:35:15 +0000
Message-ID: <d1cce2ee-f12b-4d37-8729-5ff22cb64550@amd.com>
Date: Thu, 25 Jul 2024 10:35:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-3-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240706034004.801329-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e426d3-5d82-4613-0898-08dcacc7c2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXdIMVFRWUdRVkVha1IrZU92VXBtTTdEazB0WmtLTDROTGtyRXJWRFpHVUY2?=
 =?utf-8?B?cHNack92REJkSGV4MUVOc3d0TXFZQ0RlcGk5blBzOTQ3UXFvUWZaSnFVdDUr?=
 =?utf-8?B?dnR4NGowL2NjMlVDL0c1dldmT05ZK3NEb0EyaCtveS8xczRBWjhObHhQWEFx?=
 =?utf-8?B?cGdxTkpNellCZ2UxOVMwUy9ZR3k1c091aUdRRnM4OTI3ZjhXb3NoVFJoZ004?=
 =?utf-8?B?S0VjZGwxUGVqM1JsTWNOZzBEUGFwK214WHFHSmhRdUJlSWFkYlUvL01Kak51?=
 =?utf-8?B?SElsdjluMHJ4MWNQczNVRkc4OEthNVgzZmRsQVZXeExFOGtnNkJoOTlZaWJS?=
 =?utf-8?B?VE9sUEZrVTU4U1VGaUlXajQ0ZUZUdnY0enFwZGNib3Yra0E4em9DTUova2RW?=
 =?utf-8?B?REdRZ3E4a0N2bGRBVHlNQkFYOTA3dFg5TDFuUWxXSy81d3VRL2lpVDMxaVRH?=
 =?utf-8?B?ck5LT1RyMUIwd1FrMzlQVlFwZnBUNzhsVVVXMzNhOWtzaEs4L09JRTFDa28w?=
 =?utf-8?B?YW5SbXhBdEtHeXpQdEJobG9EMTk4ZVpORGYxb0N4aEdhOW0xTWRRZXBUeU1x?=
 =?utf-8?B?NGNpTUc2dCsvaXNIODNZMHZPcVA3eDhKRndtT0g4Tm92OE52aEF6S0hPQVRa?=
 =?utf-8?B?Q1RNTy9tT2sxSnE2WWk5TjhqU0VFRWFYcmd3Y3RVOUVMWlZOc2x2WlJtUWZU?=
 =?utf-8?B?Z0F5a2RRTjIwR01SaFdRa29hbkcrZ1RmUnczQ0VGNWNLMUlteGFieUg1VGpm?=
 =?utf-8?B?WFJNWm1ZRHhzcVBBU1RHNE41QzM2WVAreXJnSndiYzROTGxNNmlBWkFUWVVZ?=
 =?utf-8?B?TkVTY3hOMDdPRXJiRHJBYzBqcllaQzlqQXdkRjdkWjhZTHZRZVZPWGphRjJ0?=
 =?utf-8?B?VW0rOVdhRWtodVJsZkUrN1hURHB3VGRUMDFjeXBHdHhuSkhNYkFHM1BRVGFY?=
 =?utf-8?B?MmMxMTZhaTloalkxaVdoM3pLdHc5SUpjK1ltc01MVmxPNW80NkN2UER1YXo0?=
 =?utf-8?B?Y0hpZHJsSm5ueTltZkhXSzIzS3psS2lGeCtwQ3NONjl1ZjVxYnczeTlGK051?=
 =?utf-8?B?Mjd3cS9QU2g2dUMwbVRjUFJGV1l5cWxqQWcxQkhMbFRWU3VsNlFrWnJjN3FQ?=
 =?utf-8?B?Zy9IQmlVVTN0V2YzcGJXa3hIa3dlK25vZEdCdU1sa2ZPL2dEQ3gwVlFCeXly?=
 =?utf-8?B?MnJ1RHZlcVRGMmdVYVQ1Y1VSVWNIbTRxR3BxQUNZMU5rUXdjWmNHSWY1bG1r?=
 =?utf-8?B?SU9xY0xjM1oza2huMk81WVk2VGd2dmJPYXJRYTNGMU9MenNRNXlIZUVsTXJC?=
 =?utf-8?B?alNuUmltVi80cFVXbi9sczZKRUEwVU1oVVJVL3RuaEc0dHAwOW5haDdxTE9G?=
 =?utf-8?B?SWttNkVEam5JemU0UUdCeDA4VlI2c3ZHV1FTYTZEVDdOUUY2KzlOWjdhNTBm?=
 =?utf-8?B?c3lnV052b0FOaVZMWFBza2EwZjBEWmVDeWtXbGtrVWc2MGhHcFVySTk2QkVw?=
 =?utf-8?B?cUwxWTdDdHU2dEhFWStlR1U0SHlGWmwvS2k2YVd5WEVHcmZTMlJBZ201dVNy?=
 =?utf-8?B?Yi85eXlKSTYrKzd6azNCNzIzUzBIUkVUdkw1eHAzdE1PanFLQll6TUNkaGd1?=
 =?utf-8?B?T2xOZlFrdUQ2S0dLV2tTSGFYMzkxSU5kUktvRkQzTUxTZVFGUFNhZlNyWUd1?=
 =?utf-8?B?M0laZk9KR2t5VGtpRHRrUVhDaVUraGxYVmNPSUNQQ09CdG9GMEF4WTdoOGcr?=
 =?utf-8?B?M0l6WDBWZk9LTTQzblVCNjczT2wzK1JZMERKbTVRZktOU1hXYm1PYnZzWi9K?=
 =?utf-8?B?dlFOTlA0MDlZU215d0V6UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFzTS9OVFBWVFJYcTBkS0MzNmIwWmowR0FtMlNaRUIrRDdydzNFSE9sNFFo?=
 =?utf-8?B?M2VEME10Z2ZlS2VsSjVjd2JhNWE5d0VhZUFPUXphbkFaNWRCYnIvMC9WalVl?=
 =?utf-8?B?ZzhsMFlXSjFxU3F4emorY3RNb0dpck9kLzVKOVBzVXozYmkraCszNkFuVlhW?=
 =?utf-8?B?NjZIclpnK2t3dzByN2VBWU1jQU9EMTBUYmFyYUlyczE0RytYQk04SEdFMkpl?=
 =?utf-8?B?NjZzRlNYQllqSU1nNUREVzUxSjJ5RzVRTnZSNDd4NFVoSVFNcDVEWDl1d0Vi?=
 =?utf-8?B?ZHhlTTkwUkJ3YVhjenJpUVRweFRKVzNzcXRNUTJmVTlRWGtxQkUxRjdDdW5S?=
 =?utf-8?B?SnJEQnAzV0tsZ09JRUxabmtXR2U1UGE0c0R3MXlWTGdnNkZZMzdOcVJkREpx?=
 =?utf-8?B?RWJGcmNSZlZlL0Fnb212MlpXZkt2T09OQkx3SnZ5dXRGSmlPRzZTZ0pVQkdM?=
 =?utf-8?B?dHEva1RKalFsc1FaZTVnTFhwY0pUTkJHcTRocUdldGVxZzlwcFJscFQ5WG90?=
 =?utf-8?B?MEt5M24zeFFNc3Q5KzBBUk5oTlJlcDRkcW9FQzRxcnhvZzFuM0xXbTk1dm1L?=
 =?utf-8?B?RHh2Um1iR1FhbXVZbnF2SjlnWDU2cXNncS9WblpDdzJ4WElXV0g0bjcxbTFx?=
 =?utf-8?B?Z212Z2RJMTJuRGVyTE1ERS85WlIvZkcxSGMrRVhLMS8wWXY1YmVGakN6ejJR?=
 =?utf-8?B?em9KM3crWnlIc0kvbGU3ZkJUbUEwZTQyTndGbTJXMjh0MkJSK2xvVTlwL0hp?=
 =?utf-8?B?TlpqVXJnN3p6c1BLT2J4UG9yTFNxUEZadzRLZlFvTlN5dXl3bXpISWlXakE3?=
 =?utf-8?B?RUtZVUNMTGZxd1FLWnRsT21VNHhuWVlCa1FVOGNIQm5EWXRXV0QyaG82dEF1?=
 =?utf-8?B?eGZ5ZUJYTm5sL3l0cjV4RDU3RmErenUvWUt4UUtLUVVkanp3TzdkM25PR0tF?=
 =?utf-8?B?dmtLdXdvWEtEYmxhM1hxY3ZTaktieTM2NDM0TmdYMHNycjA1cm5vcmI2WGlj?=
 =?utf-8?B?U3NCYVlBejJURXBlMEljVlMwUm1wRko2MjZZWkxKSGJBeW53R2hkWUhhWVpK?=
 =?utf-8?B?b09ZZ21aT05zb2JRM3ZGOUZSclpzdXBHT0EyMHpUbzMrbXI4R2ZlNHNLcndz?=
 =?utf-8?B?TGViWHJjYm9xN0dWc1l0RVBOOG1YRFdhcGxCNk9zbWhUeVhPUGMrQ1JGaWFF?=
 =?utf-8?B?NUk4aldzNG53UlRrdjF0Y0h3NlhxZ1RXbEZPYU4rM3hOUXJJbE83MnU2YlNU?=
 =?utf-8?B?ZnpoQ256N0piUVhjS2lWcUtpck5tM2JpR3owSEhML0hkb0tOdWVEVE1lTnBE?=
 =?utf-8?B?YmhFSzIzWWRlR0VXa3Z2SlUyRkh5ZEd2K3l0dDREenB3SEFZL1FVSkcySDBF?=
 =?utf-8?B?MENaQVdxTHhPMi9rdGZKcE9FOFBJWFgwdGgrNU91dHlwbHdIR3VhMzVQa2Fr?=
 =?utf-8?B?Z3AxYy90dVg2aEdiV0wwc2IzWXlTRG9WQTAzSVlFclVkVVhnamNVb1N4VE5k?=
 =?utf-8?B?Zzdub3VINDNQOFl0M3FNaHdUZndiVTJGUzNaVzJpb3FKSUdaSnRwaWU0a3JS?=
 =?utf-8?B?Z2tsTWJJempSbC9uekdQcnVHZURhRnlRb0RmSnZnWFpVY1FNWDAvT1JVdlpO?=
 =?utf-8?B?L0dQTEZJRVVYeEMxRkJjRXVkd2FxT242N2NZNXNubVFDS2xsb1Q0akhBQlZE?=
 =?utf-8?B?OFRkckFocGUxaVlEQjRlaEV2bU4weGh2ejRicW85WGV2UkN2ZTRwVFpaYkhn?=
 =?utf-8?B?Tkx2Mm1BMTY2SjBnQXRRRGpROUNYMXczTXVVQTY0NlJQNkU5YW1OaHJZWC9Q?=
 =?utf-8?B?R1NWSDQvZXpTbVo5Y1ppU2hHNG1LMmgvT3RHZ0pEbGRPZzV1S1c5TlJ5bldK?=
 =?utf-8?B?aWNsbnYwQTJOam9xVFpRMzRXUFJqd1JURk9hbjY5ejdHcFNsR3FMZGlzYVlK?=
 =?utf-8?B?NEs3OGhDaVA4aDM1bDIweWxWRGxPeG00bHpWQUU3VkpvR2Y0b1M0anNQVVVU?=
 =?utf-8?B?cW41QThDZ0NZY1puOEx6dFUySlpGN3RHS2ppZ05abEVBZjNNTUM1YVZPM214?=
 =?utf-8?B?UUZaSWZ3KzNKZlBWa3hvdnlIQ3dGaUVCUmxiUld0aGQ4R2FGVTVFWnFnK1du?=
 =?utf-8?Q?2DzmMrKQo8McyR7yOlXuX9HDc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e426d3-5d82-4613-0898-08dcacc7c2e5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:35:14.9158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLBrhuR7NEkkKa2MfN5R3XNzMpHbCskoWW1U7cJUqRerJD4Zclkewa9mOxeTrVsmgOShdYTfB21CAshG5JingA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
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

Please see inline comments.

On 2024-07-05 21:35, Melissa Wen wrote:
> Replace raw edid handling (struct edid) with the opaque EDID type
> (struct drm_edid) on amdgpu_dm_connector for consistency. It may also
> prevent mismatch of approaches in different parts of the driver code.
> Working in progress. It was only exercised with IGT tests.
> 
> v2: use const to fix warnings (Alex Hung)
> v3: fix general protection fault on mst
> v4: rename edid to drm_edid in amdgpu_connector (Jani)
>      call drm_edid_connector_update to clear edid in case of NULL (Jani)
>      keep setting NULL instead of free drm_edid (Jani)
>      check drm_edid not NULL, instead of valid (Jani)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 106 +++++++++---------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  13 ++-
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  32 +++---
>   4 files changed, 79 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1dfa7ec9af35..49b8c5b00728 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3408,7 +3408,7 @@ void amdgpu_dm_update_connector_after_detect(
>   			aconnector->dc_sink = sink;
>   			dc_sink_retain(aconnector->dc_sink);
>   			amdgpu_dm_update_freesync_caps(connector,
> -					aconnector->edid);
> +					aconnector->drm_edid);
>   		} else {
>   			amdgpu_dm_update_freesync_caps(connector, NULL);
>   			if (!aconnector->dc_sink) {
> @@ -3467,18 +3467,20 @@ void amdgpu_dm_update_connector_after_detect(
>   		aconnector->dc_sink = sink;
>   		dc_sink_retain(aconnector->dc_sink);
>   		if (sink->dc_edid.length == 0) {
> -			aconnector->edid = NULL;
> +			aconnector->drm_edid = NULL;
>   			if (aconnector->dc_link->aux_mode) {
>   				drm_dp_cec_unset_edid(
>   					&aconnector->dm_dp_aux.aux);
>   			}
>   		} else {
> -			aconnector->edid =
> -				(struct edid *)sink->dc_edid.raw_edid;
> +			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> +			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
> +			drm_edid_connector_update(connector, aconnector->drm_edid);
>   
> +			/* FIXME: Get rid of drm_edid_raw() */
>   			if (aconnector->dc_link->aux_mode)
>   				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> -						    aconnector->edid);
Why not pass edid but drm_edid_raw(aconnector->drm_edid)?

> +						    drm_edid_raw(aconnector->drm_edid));
>   		}
>   
>   		if (!aconnector->timing_requested) {
> @@ -3489,17 +3491,18 @@ void amdgpu_dm_update_connector_after_detect(
>   					"failed to create aconnector->requested_timing\n");
>   		}
>   
> -		drm_connector_update_edid_property(connector, aconnector->edid);
> -		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
> +		drm_edid_connector_update(connector, aconnector->drm_edid);
> +		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
>   		update_connector_ext_caps(aconnector);
>   	} else {
>   		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
>   		amdgpu_dm_update_freesync_caps(connector, NULL);
> -		drm_connector_update_edid_property(connector, NULL);
> +		drm_edid_connector_update(connector, NULL);
>   		aconnector->num_modes = 0;
>   		dc_sink_release(aconnector->dc_sink);
>   		aconnector->dc_sink = NULL;
> -		aconnector->edid = NULL;
> +		drm_edid_free(aconnector->drm_edid);
> +		aconnector->drm_edid = NULL;
>   		kfree(aconnector->timing_requested);
>   		aconnector->timing_requested = NULL;
>   		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again on hotplug */
> @@ -7002,13 +7005,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>   	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
> -	struct edid *edid;
> -	struct i2c_adapter *ddc;
> -
> -	if (dc_link && dc_link->aux_mode)
> -		ddc = &aconnector->dm_dp_aux.aux.ddc;
> -	else
> -		ddc = &aconnector->i2c->base;
> +	const struct drm_edid *drm_edid;
>   
>   	/*
>   	 * Note: drm_get_edid gets edid in the following order:
> @@ -7016,18 +7013,20 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   	 * 2) firmware EDID if set via edid_firmware module parameter
>   	 * 3) regular DDC read.
>   	 */
> -	edid = drm_get_edid(connector, ddc);
drm_get_edid() is removed here, and thhe above comments should be 
removed as well.

> -	if (!edid) {
> +	drm_edid = drm_edid_read(connector);
> +	drm_edid_connector_update(connector, drm_edid);
> +	if (!drm_edid) {
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>   		return;
>   	}
>   
> -	aconnector->edid = edid;
> -
> +	aconnector->drm_edid = drm_edid;
>   	/* Update emulated (virtual) sink's EDID */
>   	if (dc_em_sink && dc_link) {
> +		const struct edid *edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> +
>   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> -		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
> +		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);

is casting to (uint8 *) necessary?

>   		dm_helpers_parse_edid_caps(
>   			dc_link,
>   			&dc_em_sink->dc_edid,
> @@ -7057,18 +7056,12 @@ static int get_modes(struct drm_connector *connector)
>   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   {
>   	struct drm_connector *connector = &aconnector->base;
> -	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink_init_data init_params = {
>   			.link = aconnector->dc_link,
>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>   	};
> -	struct edid *edid;
> -	struct i2c_adapter *ddc;
> -
> -	if (dc_link->aux_mode)
> -		ddc = &aconnector->dm_dp_aux.aux.ddc;
> -	else
> -		ddc = &aconnector->i2c->base;
> +	const struct drm_edid *drm_edid;
> +	const struct edid *edid;
>   
>   	/*
>   	 * Note: drm_get_edid gets edid in the following order:
> @@ -7076,17 +7069,19 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   	 * 2) firmware EDID if set via edid_firmware module parameter
>   	 * 3) regular DDC read.
>   	 */
> -	edid = drm_get_edid(connector, ddc);

drm_get_edid() is removed here, and thhe above comments should be 
removed as well.

> -	if (!edid) {
> +	drm_edid = drm_edid_read(connector);
> +	drm_edid_connector_update(connector, drm_edid);
> +	if (!drm_edid) {
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>   		return;
>   	}
>   
> -	if (drm_detect_hdmi_monitor(edid))
> +	if (connector->display_info.is_hdmi)
>   		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
>   
> -	aconnector->edid = edid;
> +	aconnector->drm_edid = drm_edid;
>   
> +	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>   	aconnector->dc_em_sink = dc_link_add_remote_sink(
>   		aconnector->dc_link,
>   		(uint8_t *)edid,
> @@ -7770,16 +7765,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
>   }
>   
>   static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
> -					      struct edid *edid)
> +					      const struct drm_edid *drm_edid)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   			to_amdgpu_dm_connector(connector);
>   
> -	if (edid) {
> +	if (drm_edid) {
>   		/* empty probed_modes */
>   		INIT_LIST_HEAD(&connector->probed_modes);
>   		amdgpu_dm_connector->num_modes =
> -				drm_add_edid_modes(connector, edid);
> +				drm_edid_connector_add_modes(connector);
>   
>   		/* sorting the probed modes before calling function
>   		 * amdgpu_dm_get_native_mode() since EDID can have
> @@ -7793,10 +7788,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
>   		amdgpu_dm_get_native_mode(connector);
>   
>   		/* Freesync capabilities are reset by calling
> -		 * drm_add_edid_modes() and need to be
> +		 * drm_edid_connector_add_modes() and need to be
>   		 * restored here.
>   		 */
> -		amdgpu_dm_update_freesync_caps(connector, edid);
> +		amdgpu_dm_update_freesync_caps(connector, drm_edid);
>   	} else {
>   		amdgpu_dm_connector->num_modes = 0;
>   	}
> @@ -7892,12 +7887,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
>   }
>   
>   static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
> -						   struct edid *edid)
> +						   const struct drm_edid *drm_edid)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   		to_amdgpu_dm_connector(connector);
>   
> -	if (!(amdgpu_freesync_vid_mode && edid))
> +	if (!(amdgpu_freesync_vid_mode && drm_edid))
>   		return;
>   
>   	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> @@ -7910,24 +7905,24 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   			to_amdgpu_dm_connector(connector);
>   	struct drm_encoder *encoder;
> -	struct edid *edid = amdgpu_dm_connector->edid;
> +	const struct drm_edid *drm_edid = amdgpu_dm_connector->drm_edid;
>   	struct dc_link_settings *verified_link_cap =
>   			&amdgpu_dm_connector->dc_link->verified_link_cap;
>   	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
>   
>   	encoder = amdgpu_dm_connector_to_encoder(connector);
>   
> -	if (!drm_edid_is_valid(edid)) {
> +	if (!drm_edid) {
>   		amdgpu_dm_connector->num_modes =
>   				drm_add_modes_noedid(connector, 640, 480);
>   		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
>   			amdgpu_dm_connector->num_modes +=
>   				drm_add_modes_noedid(connector, 1920, 1080);
>   	} else {
> -		amdgpu_dm_connector_ddc_get_modes(connector, edid);
> +		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
>   		if (encoder)
>   			amdgpu_dm_connector_add_common_modes(encoder, connector);
> -		amdgpu_dm_connector_add_freesync_modes(connector, edid);
> +		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
>   	}
>   	amdgpu_dm_fbc_init(connector);
>   
> @@ -11867,7 +11862,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
>   }
>   
>   static void parse_edid_displayid_vrr(struct drm_connector *connector,
> -		struct edid *edid)
> +				     const struct edid *edid)
>   {
>   	u8 *edid_ext = NULL;
>   	int i;
> @@ -11910,7 +11905,7 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
>   }
>   
>   static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
>   {
>   	u8 *edid_ext = NULL;
>   	int i;
> @@ -11945,7 +11940,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>   }
>   
>   static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +			       const struct edid *edid,
> +			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
>   {
>   	u8 *edid_ext = NULL;
>   	int i;
> @@ -11987,19 +11983,19 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>    * FreeSync parameters.
>    */
>   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -				    struct edid *edid)
> +				    const struct drm_edid *drm_edid)
>   {
>   	int i = 0;
> -	struct detailed_timing *timing;
> -	struct detailed_non_pixel *data;
> -	struct detailed_data_monitor_range *range;
> +	const struct detailed_timing *timing;
> +	const struct detailed_non_pixel *data;
> +	const struct detailed_data_monitor_range *range;
>   	struct amdgpu_dm_connector *amdgpu_dm_connector =
>   			to_amdgpu_dm_connector(connector);
>   	struct dm_connector_state *dm_con_state = NULL;
>   	struct dc_sink *sink;
> -
>   	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>   	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
> +	const struct edid *edid;
>   	bool freesync_capable = false;
>   	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
>   
> @@ -12012,7 +12008,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   		amdgpu_dm_connector->dc_sink :
>   		amdgpu_dm_connector->dc_em_sink;
>   
> -	if (!edid || !sink) {
> +	if (!drm_edid || !sink) {
>   		dm_con_state = to_dm_connector_state(connector->state);
>   
>   		amdgpu_dm_connector->min_vfreq = 0;
> @@ -12029,6 +12025,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   	if (!adev->dm.freesync_module)
>   		goto update;
>   
> +	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> +
>   	/* Some eDP panels only have the refresh rate range info in DisplayID */
>   	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
>   	     connector->display_info.monitor_range.max_vfreq == 0))
> @@ -12105,7 +12103,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>   			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
>   		}
>   
> -	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> +	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>   		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>   		if (i >= 0 && vsdb_info.freesync_supported) {
>   			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 5fd1b6b44577..2aff4c4b76de 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -658,7 +658,7 @@ struct amdgpu_dm_connector {
>   
>   	/* we need to mind the EDID between detect
>   	   and get modes due to analog/digital/tvencoder */
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>   
>   	/* shared with amdgpu */
>   	struct amdgpu_hpd hpd;
> @@ -936,7 +936,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
>   				    struct drm_connector *connector);
>   
>   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -					struct edid *edid);
> +				    const struct drm_edid *drm_edid);
>   
>   void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index b490ae67b6be..be72f14f5429 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -897,7 +897,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   	struct i2c_adapter *ddc;
>   	int retry = 3;
>   	enum dc_edid_status edid_status;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
> +	const struct edid *edid;
>   
>   	if (link->aux_mode)
>   		ddc = &aconnector->dm_dp_aux.aux.ddc;
> @@ -909,25 +910,27 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   	 */
>   	do {
>   
> -		edid = drm_get_edid(&aconnector->base, ddc);
> +		drm_edid = drm_edid_read_ddc(connector, ddc);
> +		drm_edid_connector_update(connector, drm_edid);
>   
>   		/* DP Compliance Test 4.2.2.6 */
>   		if (link->aux_mode && connector->edid_corrupt)
>   			drm_dp_send_real_edid_checksum(&aconnector->dm_dp_aux.aux, connector->real_edid_checksum);
>   
> -		if (!edid && connector->edid_corrupt) {
> +		if (!drm_edid && connector->edid_corrupt) {
>   			connector->edid_corrupt = false;
>   			return EDID_BAD_CHECKSUM;
>   		}
>   
> -		if (!edid)
> +		if (!drm_edid)
>   			return EDID_NO_RESPONSE;
>   
> +		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>   		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
>   		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
>   
>   		/* We don't need the original edid anymore */
> -		kfree(edid);
> +		drm_edid_free(drm_edid);
>   
>   		edid_status = dm_helpers_parse_edid_caps(
>   						link,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 5442da90f508..b0d307e5dd72 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -129,7 +129,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
>   		dc_sink_release(aconnector->dc_sink);
>   	}
>   
> -	kfree(aconnector->edid);
> +	drm_edid_free(aconnector->drm_edid);
>   
>   	drm_connector_cleanup(connector);
>   	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
> @@ -182,7 +182,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
>   
>   		dc_sink_release(dc_sink);
>   		aconnector->dc_sink = NULL;
> -		aconnector->edid = NULL;
> +		aconnector->drm_edid = NULL;
>   		aconnector->dsc_aux = NULL;
>   		port->passthrough_aux = NULL;
>   	}
> @@ -302,16 +302,16 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   	if (!aconnector)
>   		return drm_add_edid_modes(connector, NULL);
>   
> -	if (!aconnector->edid) {
> -		struct edid *edid;
> +	if (!aconnector->drm_edid) {
> +		const struct drm_edid *drm_edid;
>   
> -		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
> +		drm_edid = drm_dp_mst_edid_read(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
>   
> -		if (!edid) {
> +		if (!drm_edid) {
>   			amdgpu_dm_set_mst_status(&aconnector->mst_status,
>   			MST_REMOTE_EDID, false);
>   
> -			drm_connector_update_edid_property(
> +			drm_edid_connector_update(
>   				&aconnector->base,
>   				NULL);
>   
> @@ -345,7 +345,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   			return ret;
>   		}
>   
> -		aconnector->edid = edid;
> +		aconnector->drm_edid = drm_edid;
>   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>   			MST_REMOTE_EDID, true);
>   	}
> @@ -360,10 +360,13 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   		struct dc_sink_init_data init_params = {
>   				.link = aconnector->dc_link,
>   				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> +		const struct edid *edid;
> +
> +		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
>   		dc_sink = dc_link_add_remote_sink(
>   			aconnector->dc_link,
> -			(uint8_t *)aconnector->edid,
> -			(aconnector->edid->extensions + 1) * EDID_LENGTH,
> +			(uint8_t *)edid,
> +			(edid->extensions + 1) * EDID_LENGTH,
>   			&init_params);
>   
>   		if (!dc_sink) {
> @@ -405,7 +408,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   
>   		if (aconnector->dc_sink) {
>   			amdgpu_dm_update_freesync_caps(
> -					connector, aconnector->edid);
> +					connector, aconnector->drm_edid);
>   
>   #if defined(CONFIG_DRM_AMD_DC_FP)
>   			if (!validate_dsc_caps_on_connector(aconnector))
> @@ -419,10 +422,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   		}
>   	}
>   
> -	drm_connector_update_edid_property(
> -					&aconnector->base, aconnector->edid);
> +	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
>   
> -	ret = drm_add_edid_modes(connector, aconnector->edid);
> +	ret = drm_edid_connector_add_modes(connector);
>   
>   	return ret;
>   }
> @@ -500,7 +502,7 @@ dm_dp_mst_detect(struct drm_connector *connector,
>   
>   		dc_sink_release(aconnector->dc_sink);
>   		aconnector->dc_sink = NULL;
> -		aconnector->edid = NULL;
> +		aconnector->drm_edid = NULL;
>   		aconnector->dsc_aux = NULL;
>   		port->passthrough_aux = NULL;
>   
