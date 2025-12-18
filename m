Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A44CCB1BA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 10:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D427910E951;
	Thu, 18 Dec 2025 09:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O4UyR/y9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9889710E941;
 Thu, 18 Dec 2025 09:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALNXSpOvuBsAqbxJ8xDbymZY84nRQa+rav+A4vcgznO2O00+qbqaBOYKDsCxFbQyFHg0rWURrK9fpMvrUVJZQ8NSXTqU8Y2JKjpwDExZC4VdvCkPHsFa0WvarbVzZCcJnlBcIuLfBxNSrhKqqypL/lZtlQwMHOxZLAP8FovTsZxNSQ6+W2udGUFkGtkNSssoPHDRsiOvIwVCOx9aDR4TC7n2zyHPnxaOv/iQWcPAYMZ2XEP667u1D0WjupNLckZlUkLDJLWikS0bgf1G7y342z+dQl1IFBYQi1SSM7xPqxN3q0hMqsJBpM79rwhhY8ghM2EzEaCcmCjCNfIpzS15Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypmtpPeN9/eG0fshwzWp4x4/25PofFh5gVRQjwm1O60=;
 b=gnAwS/uxxTspTITgVISB9WSW49cW2AWJhY/2XnDkwj6niKW//lbg4ZIibzWqjOMnp58MkBqmlX26bX4hJ5CfLl4dXdv/zoliDMYEosUpnuryZ4D8LJ6I9W/1DYaQ8CjMnxe+Kacv1jCIcJGFMCaEB2eL0fmqnJVEtlt9Jmr3gkHdtofcbNU+Mx8qU+AiCYJXuDu76m6gcNGw264lrgMJKVeWwsIr5tGsCXaogQsof1EgFDpqAgXN6BIEo7RYnkNTsYjUBFsewee54Ii7r5e3jUXg+PY5IIvcrW4/ewK9I7GTDgtwU67qcUsEE8vKn7rxAuAGZjAQ8JqrzKKtBRPZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypmtpPeN9/eG0fshwzWp4x4/25PofFh5gVRQjwm1O60=;
 b=O4UyR/y9ASeNW8V4o7JWiQaOtQ8+b9UA083BD1CDcgWW2iwTj51yc4KiFKTaLEkrFQpmllVoU0uxm1Mk0uSpquQGEVTlcYBM4NuNKdLdGSJr9aSKM+sMWZOdIlcNKDrsTrBn3ZNTh03FsIIMQVa1EaE0SUUQQWRMhAwuSLvy85M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8817.namprd12.prod.outlook.com (2603:10b6:806:347::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 09:15:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 09:15:04 +0000
Message-ID: <b767cb12-3023-44cf-9d4f-2fbb40c1431e@amd.com>
Date: Thu, 18 Dec 2025 10:14:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: suryasaimadhu <suryasaimadhu369@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0914.namprd03.prod.outlook.com
 (2603:10b6:408:107::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: c481568d-8de7-4143-7967-08de3e15eda9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzlRbFJOaWJ6ZVZ6enJ0UzhlTGRKbE9POFc5V2tsellxaDhTZlpTU2l4VHN5?=
 =?utf-8?B?U013dGhEUS9RWTIvUUdEbkJhZjNvWEczaDFHM2FTYjVrVzRJWXE1K05zYTdq?=
 =?utf-8?B?V2ptNXFRN2o0djVIWmVKZ2p6bnFoam1MSCtwaDgvOXBoS0poaENJQWUrTzZL?=
 =?utf-8?B?L1ExVWY1YkJRN0F0T3RDSHNlNlZhTDRkb0E2R2VVM3hxTnZxcmNEV3RNVUVI?=
 =?utf-8?B?SDR4dTNKb0FsNVJoOFYrNnpZemo0dzV1bC9ETE1vV1BmVTZZbUU4VDRoMGs2?=
 =?utf-8?B?YzZXRk9zZWtPYnNIL2xhQ25FSnI3SjhUL3JWeGV5bDdLOERmWktmMVVtOUlz?=
 =?utf-8?B?SWRzdk41SkVYMzV5NFUwNHFFTWJlZzZ3K0tibndxVlhFaStsdjdXWEJOVFVy?=
 =?utf-8?B?aGdBMXVOQ25sWWg3YlBkZllvcEg4cnZid0hIN2hyV0o1SjlrTkx5Q0kvbEpo?=
 =?utf-8?B?NDhHTUxIcnlNTGJaQlhvei80OVNwV0wvemxEMm5mOFRGaG5Db0JXUGMvWXEz?=
 =?utf-8?B?cWY0OXRqUTh1ejR1SFhyRkY2WDcxZFhoYnBWR1ViZDJlSzJ6Tk5TZXEzakxK?=
 =?utf-8?B?eWhkeG1tWG9UMGhXYzB6S3RMU2o2aEpCSjM3TTRsSHk5dlUwSFMrOGJmNVda?=
 =?utf-8?B?TFJMTk9NRFozci9NaVlHUlU3dFAyQUQxNUgyZW5wQmtMVlhVM2lXQVFIcDJh?=
 =?utf-8?B?Vi82akFIbHJycSttTk1zNzVxVW52YmRDc3RRdm1Gak1JODNiNW9sOWU2R0xj?=
 =?utf-8?B?Q2FSNG5iNWRzK2hPKy8ySmNSOEljcmtSdmtkTTVBSnpRRVk2c0xqMTJVN0dL?=
 =?utf-8?B?V3lnQ0c5SVN5TCtWUVhzdFAwVWFCaEtKaDgxRXZVeUxpNm9kZDhhc09LZzZa?=
 =?utf-8?B?cngycUp5Tnowd0VqeWlzT0VMR05VMm4yekh4SFhjamdQNXhzeHpWT1VDOTQ1?=
 =?utf-8?B?aEQyaEl0UFQzREdBN0E5aDYzWGQ4b3BFNFg2dTMwQndtdlJaUzZxOFJGNi9p?=
 =?utf-8?B?M25YWVR5NWFFb0YrUXJnTVZ4N2ZHM08rczNOQ1MwaVQxOWxJQko2cytFdm5X?=
 =?utf-8?B?T0s1ay9jejBmODZhNDdjY3duU2VMOEFWOEM1V05uNWJ2dUtuTzhGTFdzclR6?=
 =?utf-8?B?RG94eXRBVE96QnBCNmsrcHVpcytaQ0pqdWlsRlZWRXRvU1FQazBBdTlyM3VG?=
 =?utf-8?B?S0NwTTlLemFnYnhZZ3ROOXhaWXFLVUQzWEdRU25tUjlWMVB6QkFwdnBxSXN5?=
 =?utf-8?B?UlRVVnRweGdGNk51d3ZhcWw5aXVGNFdYc3Bla2lhWE4zYWEyZlhLUXBZeVlO?=
 =?utf-8?B?a3h5RDVDbE54UW1ibTV0VlF2YjZsMDJMaGtEaGVOekliTUdVMlpOVU41dWlS?=
 =?utf-8?B?N0V1blRIQmc5RkxLMC90b1paOWV5R0k0NkdJaTRpWUdKajdFakhCZEhCeDlo?=
 =?utf-8?B?RXYvUGhIU1hSb2NWOUVlRXhRTkhxUjIrUWdGK2VCSDZIVzlGRjl0NC9GenNZ?=
 =?utf-8?B?M1M0ejU4alBnSStjVHBFdHFOeDdUcHllcnlSTVVZK0dCVVNqWmZpSEFsZXhZ?=
 =?utf-8?B?Yk4zdE5iWEkwTnhrMWI0V2h6QW5YSUh6dy9iNjZoTmVCQTF2Z3lmWUpmeDM1?=
 =?utf-8?B?YzlFM28xaHlDeU9lNmFpMXd1ams1V3g1ZWdLcS9Ka2JRZ21jRWxGS0VPdkRO?=
 =?utf-8?B?dC9tVkdhU1MrNXYxcjlkMnNHNmpDSDJuRVBRY2lLT0J2eFh2YkZkNGRha1pS?=
 =?utf-8?B?K2JTSWZBVUg0YVZ5cGJmeGNUS2NZem5RYitiU1AzNENvc1BxbVhZRUZPTnBM?=
 =?utf-8?B?M3o4ZXZ4N0I1S3Faa1ZRUUxIYmFPZ1dZb2dOQlJYTEdWUWFOL3JvblBvRlU0?=
 =?utf-8?B?T0V5TzQrdmNuWElGYmNDY0x4OTJWMU50SjFtQlBEWk9KWC9CVGIybFpnOEFz?=
 =?utf-8?Q?8Urrgsz101CECwe1jollKrUHyelVZ9xB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm5OQkNudWx6RTBMdG5aT0YvRUxmY2JLam9Sd2VEOEIxZ1BZZ2tsYjk0L2lm?=
 =?utf-8?B?NlJMUTgrTmZBUnhFYVlPUnY5dy8waGYrRUErdm4rbkMrOXovQUJuQmdUK3J2?=
 =?utf-8?B?aHlGdjgyMVJSTm1sUEdnL0hsSjBrWW9DSjNYTVpKMUJ0anpIcWVkdTREdkhl?=
 =?utf-8?B?S3lKRWIxM1FzK2FLZVlaSTE2SHgzQjhCQ1R1cmpnazVGdE1TMXJuOUJJQ0FU?=
 =?utf-8?B?U01HWG5TQmpvd2RYUXpoSlp4UnR6cmp5VHUxbFNXMnFpWUJVSVZEc1JxOVZ1?=
 =?utf-8?B?R1EvK2ZuSitsdENOckJjMHRsbmY3M1pWY21tRzluTVBMb3hmZWFOS2t3eUNI?=
 =?utf-8?B?d0FSUlhTVkxjTDFiMUV1c1NlbU92Q2MzemVOcFBHVUpxRENwVGk5eG9laTVJ?=
 =?utf-8?B?M3NNM1M5MkI1c1dkOFd6TWRHcmRhSFVaVE1rMXlpb0pLOVVHYWlMcTdsVDAr?=
 =?utf-8?B?d0R5RWEzMU9IL0x2c296Vmw3VFNFWUV0WjJtMnRCS2NXK2dMcXJOTUdWZFFC?=
 =?utf-8?B?dmRjK2RFZmRaL0JXOVhReTBrUlh6cmxCODhtOVlxaCsvUTYvcXhSaVpveWFU?=
 =?utf-8?B?OW9SU29FV2NwdDlHSjNmd3RTOHhMcStmUVdQRFllUnhaaDU5ZjVWOGNIa0V1?=
 =?utf-8?B?WTcrd2JLWnVTRW9oZUorQUlTSmovcVZaSDdYWHNhMVlGMXF4aGgzc0QxMXln?=
 =?utf-8?B?MjdIcEI0eVh1SURzMStuV3Zjd3dYWGFTQlVGRWxBNW9Qd0FvRURqZzMxdnNB?=
 =?utf-8?B?ZUN5c0xGMXRLbFlEbmdaMnh0d1dmOHFwMEFhMEpPRmR0eE9ldE5aV0E4TjRU?=
 =?utf-8?B?cnJOMDY0Z3hnc3k1eHI2OFIzSzQyK3pzY2NaQmdHaWptL0JsWUlJSHEzblNz?=
 =?utf-8?B?Q0t2N3IvaVR4bTRIOWVVaDJBQVVJVFBtNm1ycjNiQ3p5dE5KMVE3QitzRzcw?=
 =?utf-8?B?QjNjRUF3Z0d6c05LdW5qYUlaeTd5ZTlJaHJxUjZ6Y0RFM1BpQ0dmZmhzZkRv?=
 =?utf-8?B?YS9OZVBCUTVrbGRxOEdKcnQ3ZllTTS9FVlZLS0tUT1hxTDBRdGZpSG5QLzNY?=
 =?utf-8?B?TmxrT2JpenJTODRKbGRpK1FOVGw5ajZwQlR5QlVwWGE1MTJnQisxNjNYaE1m?=
 =?utf-8?B?NFNVQm9KNm1JczR3eHhPNGlEVjJZcC8rcTE0RHJ1a0dQbjF2ZFdGZ0F3bGNv?=
 =?utf-8?B?N21jeVphTXIydVdqTGFFSk9Xc0ZZTi95K2JHZmhFa2RpVG1LbE1maTFpamVi?=
 =?utf-8?B?aG1CNk1icWFIU09xeU9MVHQxMFcyR3N4eGVGL0hqOHlsNXpTYk1GYkpITDYw?=
 =?utf-8?B?c3hwd01INzBIcG5kYWNQWlkrQjhNYTZYTlpxMnU2eHFqS0dtN3U4cGxXd1Zp?=
 =?utf-8?B?OVNHRGVVcExsWnFtbWJjZlk4eFh6a1FZZXEzYmdqOVozZ2M0bnlVQWczbFFj?=
 =?utf-8?B?aHM3bmxZak9EK1QzK3oxamszZUVmd2VFRFYxbkZSRE9TNWtiU1lsckl4enVB?=
 =?utf-8?B?cytKQklGS3AvdnNXR1Q4OTRFVFNxREJDMU00bUJicWRxcVlIRnRVd0tNTHNY?=
 =?utf-8?B?V1NvWm05UmtBOFB1QzJheW8zb0tXalBreXNBQThTZmlrOUxuWmk5a1dyVk4v?=
 =?utf-8?B?cFFCN214cWJsQS9wSi9JbHZrand6VEQ0a2F4cnZmY2prK1hUbUNjMjNpRHZG?=
 =?utf-8?B?TkE2RXFKakcyTG1KMDZoa2syME0xbFRRWTdFMVRNaU93OHB5d1JuL2N0Y210?=
 =?utf-8?B?TlZzUFBXRUpic0FodDNXcHcvMmk4QUxiUmNoelQwNTc0dXdwV3h2WjUxZElP?=
 =?utf-8?B?N1BNRFNrcXNaNGZReFc1Q0svOURpYzNMQURUOFNocTFVZytQZkozNU05Mzhk?=
 =?utf-8?B?Y3doUUg4Tk81aVA0TUNvSkdnNlJrdWoySGtCVXUzUmtRbVRhM0xJR21TMTJO?=
 =?utf-8?B?aGpIaVZ2VVRYRlJWV0hxSEtSOXRMOVdrU011b2lFSTU5c2MyT0RIVUdBVHE0?=
 =?utf-8?B?NHJDbkhMWHkxYVFGNXpUWHRqRWhNcVZEaVJVUU9nc1VpaFlaN3VxU2EyOXNR?=
 =?utf-8?B?dVJOd3p0dzFocTFVMEZONldrZit2Ym5HYklYNkwvbndRUW41VGpVVXJEcTRh?=
 =?utf-8?Q?Pd0AEHuPYgKUnAgmAr/les3SQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c481568d-8de7-4143-7967-08de3e15eda9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 09:15:03.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oz/QxjEW6nNMyg+QtVSLOQ7+QpkUEqCYAH29LO7a80PnWlUeu+vqrb/iCrFhgqC6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8817
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



On 12/17/25 18:01, suryasaimadhu wrote:
> Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
> 
> The drm_* logging helpers take a struct drm_device * as their first
> argument, allowing the DRM core to prefix log messages with the
> specific device name and instance. This is required to correctly
> differentiate log messages when multiple AMD GPUs are present.
> 
> This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
> logging macros to the device-scoped drm_* helpers while keeping
> debug logging unchanged.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> 
> diff --git a/Makefile b/Makefile
> index 2f545ec1690f..e404e4767944 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  VERSION = 6
> -PATCHLEVEL = 18
> +PATCHLEVEL = 19
>  SUBLEVEL = 0
> -EXTRAVERSION =
> +EXTRAVERSION = -rc1
>  NAME = Baby Opossum Posse
>  
>  # *DOCUMENTATION*
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> index 0a2a3f233a0e..4401059ff907 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> @@ -238,22 +238,22 @@ static void unregister_all_irq_handlers(struct amdgpu_device *adev)
>  }
>  
>  static bool
> -validate_irq_registration_params(struct dc_interrupt_params *int_params,
> +validate_irq_registration_params(struct drm_device *dev, struct dc_interrupt_params *int_params,

Please give adev here instead of the drm_device.

>  				 void (*ih)(void *))
>  {
>  	if (NULL == int_params || NULL == ih) {
> -		DRM_ERROR("DM_IRQ: invalid input!\n");
> +		drm_err(dev, "DM_IRQ: invalid input!\n");
>  		return false;
>  	}
>  
>  	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
> -		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
> +		drm_err(dev, "DM_IRQ: invalid context: %d!\n",
>  				int_params->int_context);
>  		return false;
>  	}
>  
>  	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
> +		drm_err(dev, "DM_IRQ: invalid irq_source: %d!\n",
>  				int_params->irq_source);
>  		return false;
>  	}
> @@ -261,16 +261,18 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
>  	return true;
>  }
>  
> -static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
> -					       irq_handler_idx handler_idx)
> +static bool validate_irq_unregistration_params(
> +	struct drm_device *dev,
> +	enum dc_irq_source irq_source,
> +	irq_handler_idx handler_idx)
>  {
>  	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
> -		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
> +		drm_err(dev, "DM_IRQ: invalid handler_idx==NULL!\n");
>  		return false;
>  	}
>  
>  	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
> +		drm_err(dev, "DM_IRQ: invalid irq_source:%d!\n", irq_source);
>  		return false;
>  	}
>  
> @@ -310,12 +312,12 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
>  	unsigned long irq_table_flags;
>  	enum dc_irq_source irq_source;
>  
> -	if (false == validate_irq_registration_params(int_params, ih))
> +	if (false == validate_irq_registration_params(&adev->ddev, int_params, ih))
>  		return DAL_INVALID_IRQ_HANDLER_IDX;
>  
>  	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
>  	if (!handler_data) {
> -		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +		drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq handler!\n");
>  		return DAL_INVALID_IRQ_HANDLER_IDX;
>  	}
>  
> @@ -375,7 +377,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>  	struct dc_interrupt_params int_params;
>  	int i;
>  
> -	if (false == validate_irq_unregistration_params(irq_source, ih))
> +	if (false == validate_irq_unregistration_params(&adev->ddev, irq_source, ih))
>  		return;
>  
>  	memset(&int_params, 0, sizeof(int_params));
> @@ -396,7 +398,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>  		/* If we got here, it means we searched all irq contexts
>  		 * for this irq source, but the handler was not found.
>  		 */
> -		DRM_ERROR(
> +		drm_err(&adev->ddev,
>  		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
>  			ih, irq_source);
>  	}
> @@ -596,7 +598,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>  		/*allocate a new amdgpu_dm_irq_handler_data*/
>  		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
>  		if (!handler_data_add) {
> -			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +			drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq handler!\n");
>  			return;
>  		}
>  
> @@ -611,11 +613,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>  		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
>  
>  		if (queue_work(system_highpri_wq, &handler_data_add->work))
> -			DRM_DEBUG("Queued work for handling interrupt from "
> +			drm_dbg(&adev->ddev, "Queued work for handling interrupt from "
>  				  "display for IRQ source %d\n",
>  				  irq_source);
>  		else
> -			DRM_ERROR("Failed to queue work for handling interrupt "
> +			drm_err(&adev->ddev, "Failed to queue work for handling interrupt "
>  				  "from display for IRQ source %d\n",
>  				  irq_source);
>  	}
> @@ -720,7 +722,7 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
>  	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
>  
>  	if (!acrtc) {
> -		DRM_ERROR(
> +		drm_err(&adev->ddev,
>  			"%s: crtc is NULL at id :%d\n",
>  			func,
>  			crtc_id);

While at it could you double check if that print can't be written a bit more compact. Looks like somebody just spread all parameters on individual lines.

Apart from those nit picks looks good to me.

Regards,
Christian.
