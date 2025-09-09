Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F6EB50079
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757010E74D;
	Tue,  9 Sep 2025 15:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bJDPtxwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5013810E74D;
 Tue,  9 Sep 2025 15:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bur2y7t8mstzCs4IkjcfZF4BsdpgPRTkbYizSVx2UxOsW2NiCxm4bHRGEAVkyAIJ2nSgH2khczWBdzd4m6V3ylwwgcFLfXctbI/Y54Uv9SYf7dec2KsNzIV6JsN1TiyKyoBLhyoKwgRKynBNouU8s80igRvwwd+1TcBLxfaFvfVoRajC/BezCB5j2lJro3zr74bh75OFceIxXwfuofs22dNsGkhTGWsswA4BpgvZdF+V95jfPv4wyo9DhxNkxcBnpTO915Kt5N6YT0lLLZDymH80aFiPekxuM7om8KUR954ihzbu9jWMSoMFTaR8hxKgnHmLhOUlRN86bnAkWyOdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K59APmL/gFmCabTVCLFIsLIri24ISOQXSEE+Q1arEos=;
 b=GDfb8SibEn/NVGYd6bMptJmvfJtNs+6W+uUnzwOrxxY/xlAuimHL5d3AVtUWANq55tX8wUuHFdghG1RwuBxIP0Yq2zE6QBudDgAL+kfH4rkMfS/0nIPpMIlf/89+GvAuWckTq3wetN5BKPeSzsRjrFkW9SZjPWaWy91a696w4rcBs3aQ+3JBaezPltnoXGxltegGvHfG6p5B+cfS0DOZSC9rYr0oArvSY5FHDNURtwZRzkjJU0vWLe1x/aKq2+fqon1cmlI8RllmU0PWCi5CThmC3x370lFaoKI4hky7JOo4nDNOVT/9EgN12k5Ii/t/70Zf0iTnCWbPTk+/SCdKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K59APmL/gFmCabTVCLFIsLIri24ISOQXSEE+Q1arEos=;
 b=bJDPtxweagEB5LH3FTbvP6CmASpPxA5G6myRCIKwf4jnBLsDTxmj6N40PvJ27IU7dzB3Q4wwVEpfLdfZRItHe6TnRk2prOLwgUjLpDHUFLX2InJwFzW9y0NFNoN/OHw1UfV0IKNGPDWlk69cheXrZD2hUJxSjKCXOanlAUZ3veI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Tue, 9 Sep
 2025 15:00:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9073.026; Tue, 9 Sep 2025
 15:00:34 +0000
Message-ID: <d3bc5c52-345a-420a-bf92-dc4b56c5cc97@amd.com>
Date: Tue, 9 Sep 2025 11:00:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amd/display: change dc stream color settings
 only in atomic commit
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Xaver Hugl <xaver.hugl@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Christopher Snowhill <kode54@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250901214413.12675-1-mwen@igalia.com>
 <20250901214413.12675-3-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250901214413.12675-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0080.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: c10317ac-5086-4ea0-8566-08ddefb1a08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmRsTWhmbXNtVFFiVGhxVWpkb1cwMURsMlhNdG53M0RhRUM1YzN1ZWJVYkdK?=
 =?utf-8?B?d3Zwdm54RVFpUjhGZlhXck0vRDZCanc0U0kvc09wNjB2aTlmUkk1RGxCVS9a?=
 =?utf-8?B?SDFXVHViYjhBMmIzNnhreUtnOW9GVDQrZU5PeXhkVkxPc1hPSE1yWG83bUhv?=
 =?utf-8?B?b2QvZkxGL1JYZ1RHUnFsQTZaTlVqSkMxT0JTRnQ5OE9kVFJGTHB5RFJzeHZJ?=
 =?utf-8?B?SjhCVkt6Y2RreUdFTmpiRE9XMzY4SE43M1lQRENlbUg3NE1ST0pWQktQOWR6?=
 =?utf-8?B?YnhWL3l0WE9KcmhqNE9YU2FRMWtldnpKU09pcUN3YXVYc3M2anBoQVZJbmFS?=
 =?utf-8?B?dm9idlR3cXlxMHlnUjZGVjNRTk9KV21yTXJsSjRxc3g0ejVjMFZ3TFk5WUlK?=
 =?utf-8?B?eTZXanlDcVRkRW83QVZKa2ZscDQrZHVkZjNuZWtvenBsMit5d3RVOFBzcm55?=
 =?utf-8?B?aEJsakZVekF0T2J4YUszT3VnU3VOS2xRU3hFVm9YbEMyV2RQTDYrNXNPanhG?=
 =?utf-8?B?R1VXQWFUZTlRK3B0TjVFZXBZQWNDSi8zbnFpVVdWeWdkTUhVSmdKRHM1NWNn?=
 =?utf-8?B?VVE4T2VEVC9tMldqSUlkN0tLaDVwWGo3Y1A0UzZkanhlWFR3OFNpbjE2V3R4?=
 =?utf-8?B?Q2hiWVBJdHU5TVA2K091ZEVMRkZTYW1nczF0SWdrR09vVXpQVDZhc3o2cWh6?=
 =?utf-8?B?NnBNTEJXVHhMM3VjOFJQOE4vUUVKRk9VT0tINHBBMEpkaElLSmlvQ1RNVyt5?=
 =?utf-8?B?elo4Z3k4ZC9uQjc1WkFHdGF6SkNWTzFDbFRNWC9CUlpuSVlJOHAwd0pCUnpF?=
 =?utf-8?B?TVBGUUwrWVFsbWhKb3Z5Y1U0N2NGN0J5ZEFpa01TVzQ5a1IzZHUzdk9lOVRL?=
 =?utf-8?B?ZUtRa2QyNDdtbEo0NWQ5M1I0bDlXdVdYeHZVSVV4UHdpRHRwRmIrWjQrOFUz?=
 =?utf-8?B?REhMODFhMVRyUEozU3ZXKzRLdU9Bc21MU09QbksyZm5WaUJNWlJoUzBqZE9G?=
 =?utf-8?B?dldYc2JUbFJ4UnpUNjJaTXlnV3JOQndzQWJtVDRtMU5FaXptbVQvYVQ4ZkJu?=
 =?utf-8?B?bGNmZE16T0MrUzk4cVRQd1JpL2lYZFl5bDJHZXdkbmF3WHo0bklYTjYwNWJw?=
 =?utf-8?B?Mkk5K3BZd3FUNW8wUmJoenZIMUNZakRTays0eVBWQjFlUHptNzl5U0RoSGVv?=
 =?utf-8?B?dTl0ZjlYMm05cjdUc1EzU0ZaZEFFWElVTXdLK2hRVWd3bER4Qi8waTd1RzdP?=
 =?utf-8?B?eDhvdlFUOS9JK1dtRlpmU25PRWpOL2ZWYnJVb091SXptQTFxbGd0ZS9DTHkz?=
 =?utf-8?B?S1hkaUMzUzZGQUEwUmh2d3R3L0d3UHQ4RzdRdlZKRlFUQVB5UDN6OWJEdnZN?=
 =?utf-8?B?alUxZGoxbHA2YUVINE1JNWw0N2ZXeFp3T2c5VWxKWmZaV2tKbXRwdElNc3pQ?=
 =?utf-8?B?OW5tbTVTYmM1dFNNSGV4K2xzQmxpOE51bUdPSWNSSVZienkrYmpPWHJRSWRS?=
 =?utf-8?B?TER0WDV3Nmx2dG9zZENJaEF1Y1hnL2Z1TnRzdVZ1cjBIeUVLaFlFK1FoMlZQ?=
 =?utf-8?B?T0dNdVBkTDF4dUk3V1RyVWtMbGxhNzJTTE9OaVlPMXBrUVJUSFBkc0V3aTh4?=
 =?utf-8?B?RnNlcVRibUxJUit6K2YvTU1nd0lFd0MvZEg4cjBVMGJyZTBZN0d1a3NKbXc4?=
 =?utf-8?B?clVqMVVHY2thbmZLOXUxeVNkUzRIalJYclU1SHViRHdPNWNhR3h5YmoxMDdx?=
 =?utf-8?B?ZlJJN1dVQ1FBWkxWU2Vwalh3SXZzRjdmbUx3MyttWE9FN2IxNlhVRWtPRXFu?=
 =?utf-8?Q?0yS7NfSd9XRTMhTkKYTGNeLdrJUP8I6/4ktTc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhHTnJxdzN6WmhDUHp1OFNsU29sdi9aVnBKT01qWVZUTTZpZW5vaHlsQmNT?=
 =?utf-8?B?czduWEVKR25aV3p5WEliZmZPQnI3RVk5MU5lMnFnNlBuMXYzMnBabzFDV3Y2?=
 =?utf-8?B?aUF5ZTZ0N1N2TnAxd0s5Z3R0YTJBZmJoYThJaWEzWG5XYnFCNHlWbFR3Qlhx?=
 =?utf-8?B?clAwUWtvVnUvZmZsQUFIN3VKYWdEV28rWmV0MGMvT2FkdWZQSU1jb3RHajNw?=
 =?utf-8?B?MnBoK2ZkNGJMODBMVU9HOWVkRGNNM1dUWGlzWkN0SlhHcHpOUlRGNStFd25K?=
 =?utf-8?B?N0xLcW41OWRYMGc4OWNjbjhvT0pBSEtzWm5xMzBlQlpQdWg3dzJNaVZ5eHlY?=
 =?utf-8?B?NDhDWEprVDZYamVYU2xETnljNjUwbmtwWXpzTnloV2xlS2hOM2NCb0N0cENw?=
 =?utf-8?B?Vmt0Sk5wQ0xJWFhsci8rdkR1Y2FnYkE5WmhRS0xKY0JERHBrTUNmU0R6TG1Z?=
 =?utf-8?B?ajZ6WE1RdFl6eXdBdzNXWklNbXl0V3IyT1ZxRzhlZWdkV0s5MThHZjZlU0Qx?=
 =?utf-8?B?UkowbG1VYWhMeHNNQ0U5UUdDVHVEZ0g1bmxoSktoVGNKdGhQR0xxMEZaQ0Fh?=
 =?utf-8?B?VDFZMGRTMnZxT015dVN6bEJKbWRzYk5QZjVUZ1hSeVpXSS9ZTFNjZ0p1amt0?=
 =?utf-8?B?TnphdlpsUFBwM3IvLzBWVVpkSjdNT3ZjZ293UXR3N0pjNjFQQ1RubjVHWnBk?=
 =?utf-8?B?WnVCYUFDdkw3bExRbm5ZNVM3TUkzVVAyN0ljRTRyeWplMzJtQk1rZ25qTDQv?=
 =?utf-8?B?NW1jblRVbHQyZ0dZUmJLQ0NjZTR6WFFXNzdQU0hueXl0Y2F1TDJtSWsySzQ5?=
 =?utf-8?B?c2dRL2t0WDdUVFd4WDVkVVUxREFneHFDVzVGRUdOdXVaeTl6ZTh0OFA0WG5z?=
 =?utf-8?B?ZWhpRktvSFhlOEFRMXRZZlFjSnFDcWwzazFhbFVacURYb0FZcXY5SGd0QlBY?=
 =?utf-8?B?RkFEU3k0YjFNMXNKQUVrUk9KbEtqeVgxV3E3NVVKdFhXcFNoZi9hUTdDSTNW?=
 =?utf-8?B?eTVGZzIvNGZCN1RwY0VQQml5NDcvekp3c2s4SGZDSlVyQ01ucmhOQ2FhN0R1?=
 =?utf-8?B?eXZML3JsVlhHSmhwYVlLeUtzTHFJZm9HV1NjeWN3emRuQ0lUM2JXaTM0L0x0?=
 =?utf-8?B?UVlQOFcxU01UcHlLWXF1RXNWVTF3TUxWT0c4QjNqV1Z5ZnBPd0l6bG53RG1J?=
 =?utf-8?B?U3U5NHU5Q1lrMjVwOCtTMk5VcHE3b3JXZytiVHcrc01mUjU0ZEFwMThocjRu?=
 =?utf-8?B?dVZGK2pXdGt3dWdCeTJSMVZrQ1l6ZFA0WGNnemhvaCszOWxCYlNybWptdXU0?=
 =?utf-8?B?RHloM04xaFp3N1cyenFNYlNNa05mTDNjNmovWVlvWW1DK3dXcGIyaDh6TUJ2?=
 =?utf-8?B?UjJuWEQwbXRieE1aTHNNVVkzR0UxNnFBbkFJRGFRVnV0dWlaZVZBUlIvRWwz?=
 =?utf-8?B?U0pXN0ZmN0t5bC94Z3RaK2tKS1ZTU0J5WnVTN29DQUlqU0R1NU9tWWJHemxI?=
 =?utf-8?B?S2ROV3FBNytHSWZpU0lWNTZJLzArdnRQTXA5YzdSbnVvbFBBR1k5VW1zcVhR?=
 =?utf-8?B?Q29yQ3dQY3U0bW1xbkFkMi8xSyt4dFlSY1VYUmtxRm9XV0R3WUtqQ2w1ZW81?=
 =?utf-8?B?SndMamM1NlZDNmhoREpoNVJocFZXSHhFK1hZdHV2cVNrWjBCSFc1MVRjcjhh?=
 =?utf-8?B?L1QvUzRPMzc0RDlLelZRNVJZTkxxaGwwcklTenBwdmFZbEx0aVNxcFR5Zklr?=
 =?utf-8?B?VDliMFlpTU9IeEk4UERjYml5c2Z6cjE3OUFqWVE1dm9hbTBROEdJNkxWYnBz?=
 =?utf-8?B?cWhvcGU5ZVp5cTA1OTlGRFRaNno1dzdtV1JnN1FxWEh4akhyUDFmV1YzTGth?=
 =?utf-8?B?S3I3aU1GYmlnMEo2QXV3YTBwUDVneCsrdXVrREhNZGo2bktvKzcwT20wZEpp?=
 =?utf-8?B?ZjdRckw1aEpUVXhDUXppby9DRTBTUEo1NWdXZzNzRGY0dGo5T1JyYWJqOUhR?=
 =?utf-8?B?aU5odHVTbm9aelJ1QVR0WXVtaG9GN0ZSck1CZ1U0N1o2RWw5WGsrRkxEU3Rq?=
 =?utf-8?B?WTM1M2RnNEJHZlpHTXJHTFJ5bldZOEEvbDh0SDl3Mmh2S2ZMdWtRZTlwOGI3?=
 =?utf-8?Q?6IRjbsIF45OusT44s+tQkGuKw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10317ac-5086-4ea0-8566-08ddefb1a08b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 15:00:34.0804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hFT1NstvJC6/kgpXbTjI26LDcNXnuDeORxuBP5JndTllDJ/55NfBNNhO3kHAJWBkPWlGRFrUS2Pv8D08oCVCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
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



On 2025-09-01 17:33, Melissa Wen wrote:
> Don't update DC stream color components during atomic check. The driver
> will continue validating the new CRTC color state but will not change DC
> stream color components. The DC stream color state will only be
> programmed at commit time in the `atomic_setup_commit` stage.
> 
> It fixes gamma LUT loss reported by KDE users when changing brightness
> quickly or changing Display settings (such as overscan) with nightlight
> on and HDR. As KWin can do a test commit with color settings different
> from those that should be applied in a non-test-only commit, if the
> driver changes DC stream color state in atomic check, this state can be
> eventually HW programmed in commit tail, instead of the respective state
> set by the non-blocking commit.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
> Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 105 +++++++++++++++++-
>  3 files changed, 104 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9bd82e04fe5c..ba40346eaf95 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -11125,7 +11125,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>  	if (dm_new_crtc_state->base.color_mgmt_changed ||
>  	    dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
>  	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> -		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
> +		ret = amdgpu_dm_check_crtc_color_mgmt(dm_new_crtc_state);
>  		if (ret)
>  			goto fail;
>  	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index ce74125c713e..1cc3d83e377a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -1041,6 +1041,7 @@ void amdgpu_dm_init_color_mod(void);
>  int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
>  int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc);
>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct drm_plane_state *plane_state,
>  				      struct dc_plane_state *dc_plane_state);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index c7387af725d6..a7cfcdba1fc9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -566,12 +566,11 @@ static int __set_output_tf(struct dc_transfer_func *func,
>  	return res ? 0 : -ENOMEM;
>  }
>  
> -static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
> +static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
>  					const struct drm_color_lut *regamma_lut,
>  					uint32_t regamma_size, bool has_rom,
>  					enum dc_transfer_func_predefined tf)
>  {
> -	struct dc_transfer_func *out_tf = &stream->out_transfer_func;
>  	int ret = 0;
>  
>  	if (regamma_size || tf != TRANSFER_FUNCTION_LINEAR) {
> @@ -969,7 +968,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  			return r;
>  	} else {
>  		regamma_size = has_regamma ? regamma_size : 0;
> -		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
> +		r = amdgpu_dm_set_atomic_regamma(&stream->out_transfer_func, regamma_lut,
>  						 regamma_size, has_rom, tf);
>  		if (r)
>  			return r;
> @@ -1008,6 +1007,106 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  	return 0;
>  }
>  
> +/**
> + * amdgpu_dm_check_crtc_color_mgmt: Check if DRM color props are programmable by DC.
> + * @crtc: amdgpu_dm crtc state
> + *
> + * This function just verifies CRTC LUT sizes, if there is enough space for
> + * output transfer function and if its parameters can be calculated by AMD
> + * color module. It also adjusts some settings for programming CRTC degamma at
> + * plane stage, using plane DGM block.
> + *
> + * The RGM block is typically more fully featured and accurate across
> + * all ASICs - DCE can't support a custom non-linear CRTC DGM.
> + *
> + * For supporting both plane level color management and CRTC level color
> + * management at once we have to either restrict the usage of some CRTC
> + * properties or blend adjustments together.
> + *
> + * Returns:
> + * 0 on success. Error code if validation fails.
> + */
> +
> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc)

This function is almost a duplicate of amdgpu_dm_update_crtc_color_mgmt,
without the part that sets the stream->out_transfer_func and without
the "Setup CRTC CTM" bits. I wonder whether it would make sense to
combine them in a way where the "update" function would look like:

int amdgpu_dm_update_crtc_color_mgmt(...)
{
    amdgpu_dm_check_crtc_color_mgmt(...);

    update stream->out_transfer_func based on out_tf computed in check

    do the "Setup CRTC CTM bits
}

Either way, great find, and really good change. The series is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> +{
> +	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> +	bool has_rom = adev->asic_type <= CHIP_RAVEN;
> +	const struct drm_color_lut *degamma_lut, *regamma_lut;
> +	uint32_t degamma_size, regamma_size;
> +	bool has_regamma, has_degamma;
> +	struct dc_transfer_func *out_tf;
> +	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_LINEAR;
> +	bool is_legacy;
> +	int r;
> +
> +	tf = amdgpu_tf_to_dc_tf(crtc->regamma_tf);
> +
> +	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
> +	if (r)
> +		return r;
> +
> +	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
> +	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
> +
> +	has_degamma =
> +		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
> +
> +	has_regamma =
> +		regamma_lut && !__is_lut_linear(regamma_lut, regamma_size);
> +
> +	is_legacy = regamma_size == MAX_COLOR_LEGACY_LUT_ENTRIES;
> +
> +	/* Reset all adjustments. */
> +	crtc->cm_has_degamma = false;
> +	crtc->cm_is_degamma_srgb = false;
> +
> +	out_tf = kzalloc(sizeof(*out_tf), GFP_KERNEL);
> +	if (!out_tf)
> +		return -ENOMEM;
> +
> +	/* Setup regamma and degamma. */
> +	if (is_legacy) {
> +		/*
> +		 * Legacy regamma forces us to use the sRGB RGM as a base.
> +		 * This also means we can't use linear DGM since DGM needs
> +		 * to use sRGB as a base as well, resulting in incorrect CRTC
> +		 * DGM and CRTC CTM.
> +		 *
> +		 * TODO: Just map this to the standard regamma interface
> +		 * instead since this isn't really right. One of the cases
> +		 * where this setup currently fails is trying to do an
> +		 * inverse color ramp in legacy userspace.
> +		 */
> +		crtc->cm_is_degamma_srgb = true;
> +		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +		out_tf->tf = TRANSFER_FUNCTION_SRGB;
> +		/*
> +		 * Note: although we pass has_rom as parameter here, we never
> +		 * actually use ROM because the color module only takes the ROM
> +		 * path if transfer_func->type == PREDEFINED.
> +		 *
> +		 * See more in mod_color_calculate_regamma_params()
> +		 */
> +		r = __set_legacy_tf(out_tf, regamma_lut,
> +				    regamma_size, has_rom);
> +	} else {
> +		regamma_size = has_regamma ? regamma_size : 0;
> +		r = amdgpu_dm_set_atomic_regamma(out_tf, regamma_lut,
> +						 regamma_size, has_rom, tf);
> +	}
> +
> +	/*
> +	 * CRTC DGM goes into DGM LUT. It would be nice to place it
> +	 * into the RGM since it's a more featured block but we'd
> +	 * have to place the CTM in the OCSC in that case.
> +	 */
> +	crtc->cm_has_degamma = has_degamma;
> +	dc_transfer_func_release(out_tf);
> +
> +	return r;
> +}
> +
> +
>  static int
>  map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  			     struct dc_plane_state *dc_plane_state,

