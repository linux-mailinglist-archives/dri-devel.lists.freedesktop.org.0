Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6571A6A356
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6B10E5C8;
	Thu, 20 Mar 2025 10:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kI9XUNOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC5410E5C7;
 Thu, 20 Mar 2025 10:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miLx8pa3Skmbo1+xk4Ebat/6j2jVYbNN5Zy+bSVIhK6kse5ZI4/CcWxgBGQDOdRtWgrOyFRcVIys2Jane5MMgpoyTb6LulrqcJfimaV2Xr1tKU4lh4L/Lz5X0HK7IQgbe17H/RSBy/uC4GVQPG+RH1fYtd1Z6pbWEPeIuwREI3z0VJy2A9pIhTVJiLexYTDo5whn7XSiOihjomu42hF/peHoh0xrlCUsxX9nQaAfElI5xnUjd4k6FpWPsnOvBvd+3ZQTmwvR+ctH/ULUX9K36HXNG0C2AESbXStpyHYYscXDqf2SFaHmpl5Bm71tDx1EW9QQZ9MELa6RQcPL1GyR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEOCy5Ny0DEC5VD+q9aoBPtN/YQe+9n0apNW+kbOi3c=;
 b=KXAunL8yaHywajONDXRtfnnpML0S6fu//+fi6gjE7TdZD1KyNwkYn0o2uYfv6IOVe4/tCWqaoahswECecC59ReoAg7ZaUZoz3p1U38GHMIYji5yFJQRo7G7DxUtISGyKy3CDxN8pKPefH9aYGwlAR7P111j8qdfuqgyNJAqogyVnhnDsGAf0kcC+bDknmX8ieMa97HnzfHZu69USZLXbSfNqqVhMcf/ZhsT5dFJyuPbTHRSs3/zCo/FWWjBuaolmOkS2GpwKSllpdz2ECfsIpQj811wHNN53oSIjgLxunsx3Mx5SgaqLtKmOMa/+ZiKHhCsOZiCyiJ9TcwR/vfuxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEOCy5Ny0DEC5VD+q9aoBPtN/YQe+9n0apNW+kbOi3c=;
 b=kI9XUNOdpDhBxrP/KynY8cZ2XSJlwoiEGaxXa0j1iRj3A7CSjpXSncwLb4s5UnfwOQXoupsxUM+VBx5PqkWelJh23ShWz36eaCVb/knJRHmTDuFYXbBXKuYfRDRIBV8cYDfgcPRAvqWVO5nvNdVXoD/r9KKj9m0bb0L4ZoJJT30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 10:10:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 20 Mar 2025
 10:10:07 +0000
Message-ID: <b23bb5ea-3e19-4e70-89c2-0bee658cac72@amd.com>
Date: Thu, 20 Mar 2025 11:09:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/10] drm: get rid of drm_sched_job::id
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tvrtko Ursulin <tursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <20250320095818.40622-10-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250320095818.40622-10-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 0daae657-c47b-4726-0fa0-08dd679763bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE83YVZPN3ZKR3pObVY2clU1UDU1WHkvamg1d3kveklXZWZqT2l0RHdHZHRY?=
 =?utf-8?B?K084T0twc01XakVwOXNNc0tobklnZTFWS0xkL3V4M3F2WkU3MzBZK0RRblFm?=
 =?utf-8?B?T244U2FCU2xCSTQvNzJiQTRHU2Q1M1Q0eTduemwvUVQ5bWpNTHVRMitOemVN?=
 =?utf-8?B?V0NLc2tOSEVYNDJQdk80dkZrK3U3TjBjV2xmQ21KbXJpVlV4ZEdqejlpbm5h?=
 =?utf-8?B?Zjd0amJnTjBxSFlON2Y2OHpEZ3Y2Y1cyY25CMGk1Q3hHRysxSmRuUHN1d3U5?=
 =?utf-8?B?SGw0dGZiamtMK0c2d0JVMWxEWWNpVHlDc1hZQlRsM1A5L3ZIK1pLZ1YxSHh0?=
 =?utf-8?B?Z3VRTmN1SStDNG9TQXhRUnR1eXpVOHB2TlkvdDlsQ210bS9aTGpyek1UclhZ?=
 =?utf-8?B?WW1oTGtRZTVjaGFweTcwaVduQ1daM1dQQjZCeWZPVCtJbjh6VWlwS01la1dO?=
 =?utf-8?B?Y0haTHZKS29yb1FYeXpNOGpJVXo5U2NjNnpMN1F2aE9wMlFJcEpBeEZEZEwv?=
 =?utf-8?B?eDU2a0NDZEdxSDlHVHEraUhiam8wekgwcGVkZUtMVTgwZXpyRE5nQWZZZUs1?=
 =?utf-8?B?VFdtK085Znh5MndqZ3dSTTBuM0l5bTdVdVRhUE1CbUF3RHQ0NnZNeWV6OGdD?=
 =?utf-8?B?WFQ5S3pjeHVUVFJET3VFeDZYcWh5UjU0VHFKNXI0TUhsSTkvQ2s3MHZjQjM0?=
 =?utf-8?B?M3FRTk1zbnpnZ2VhSjd6eHRqVEN6UHZoeHBYdzFFRDFkUVkxaTltb0dpem4y?=
 =?utf-8?B?Q3k0SEZ5OE9DQ2JFNnhrcnNNOU1jNm10VDhyUzZTdmY3NVFJYVNQTFdneFIx?=
 =?utf-8?B?djNFbWRNdE1KTjN5VWhpN0FvZEFoNFhDc2FVdVl6eVVzdUFYekRFTy9UaEt5?=
 =?utf-8?B?enNSMVVCa2RJTXlwQ05UOTFqa2Q5NWdPRWNkMlZoT1hPZlpCSkE2SVlTR1JQ?=
 =?utf-8?B?SHExaTJTYk5rbXBzTWlNSTZtNVE1OEh6MVdvNUs0NGt6ZWlmMVNpeEJUclVI?=
 =?utf-8?B?NGxBWEI1WDZTTnl5NkMxbUhjb1N2S0xYbWVCYitNUVVXYUI3NE1vWGk4WG1B?=
 =?utf-8?B?QXdVZHVzVDVWd2cxc3JYR1VKTVFaeVM3OGtiQXhBYjNYczRLdkxhNGlLeHVZ?=
 =?utf-8?B?VHR2K3QrcWVNbnFubWxBdDJtaWhzeWxKdGgzOTMzWnBNNEcwVCs1TUp0Yy9r?=
 =?utf-8?B?OE5scVB5UmZ4Q3FpMkxiYklCN05SbC91U3pJSG92amxqNGFQVUpIb0R2QkI5?=
 =?utf-8?B?N0h4d09XSXRIRkpTYmI5OGxleGp1aElSb1V0dnFSbExKN0loeWlybVBRVnI4?=
 =?utf-8?B?TVNVTm0rZ2dRcWpROXVsUGRVRzR1Rm1FT1ZaRVp6Mmhla0lYMVhaYm9zSDJU?=
 =?utf-8?B?VmRnSlcwY0NTanUzOHdxMnFzL3BjYkE2TFlmcHZJeTQrWndLa1A1QkhoMncx?=
 =?utf-8?B?QzkwRzhwNWUrUlV6NGtFRHR0S0ZWdTRkaU1MYm1BVlVxSWpkdmZYR1NwbWdz?=
 =?utf-8?B?VDNqZnNEOURKa09rUE9lRW5jTVhlZ0xBN1pMRGRwMDhCZDlkNGFXQktoNkxH?=
 =?utf-8?B?TDdjajR2endKV0R1eFNsYzJFRTY2Nksvc01ZWXp6SVBmV0ZYQm5WYjZDck9Y?=
 =?utf-8?B?M3MwWEhHaGRrMGpQZitFM2NWK3RvcHVMdHFYUzFNTTdNTkg3SkNvZCtZOEw0?=
 =?utf-8?B?M3ZPbzVvRXppeG5mVWtqZEZpVG9jNDF0WDV4VG9sWmFhWDNiUDBWRmw1R3BG?=
 =?utf-8?B?cGRIdlY1bVFQaEJuMFVTQkI5bmtFZ291SE1Za3lza3ErZEkzWVNQRVFlaVBP?=
 =?utf-8?B?NzFoeHIwUVhqTzF1WWVWbHRnbHZ1dTVnVEo3OVFtdkVGaUk0Tyt0TTBLY0Ns?=
 =?utf-8?B?dnI5TlhjNFU0alREc0xOTHMxclVuTnpzN3lvQVpzekpBemZhMzB6MGduZmZN?=
 =?utf-8?Q?LuHkkndr93U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVHVElIQzB5bEc2SWZPdS9HWVZxWDlzL2VqYk5kazhRbDFNSmVKYy85Y3cv?=
 =?utf-8?B?ZVgzWE1WcFVuVFhQaHBRS3c0VUgxZkdHTG8vVnJFN2lXZ3hTSmhKM2c5a3Vm?=
 =?utf-8?B?ZzJBUzVvSE9ZVFZXR2xxeTl3VVpqVUFsTWNxMyt2S0hBRHF3eUZYN3gzbHND?=
 =?utf-8?B?SUVQd3lFZmxqNlZGMnhZa3dLajA3ZElmOHpNT1I1QW1QZlNDQWxtUzJUdWZU?=
 =?utf-8?B?MGczdkU1VUc5bzhWcEgxK1dSc0J4Nm1RS21kVG9pbnArZ1U5dFRBRW93L0c2?=
 =?utf-8?B?S2pOTUM5bkk2NjdkS3ZuQXVNVjdST1BaTHVLVFlxN2N6TGluanZvc0JZSWZS?=
 =?utf-8?B?UUkxU2pBd1ZYaytIelFMdzdOTDhwdmw3c0RyN0k1eWhuSk1veGVla0J0U2E2?=
 =?utf-8?B?a1dPak0xbnA2ejl6L1NDWWkxNHRzcjFwZ2FKY2xiVHluV0FFMGlHbFFuWWx3?=
 =?utf-8?B?RmFETjY2MUZHdmxLdnFJOENZUjJJb2pQbyttVEkzVVM3TWhpMG0yd0M1bDNN?=
 =?utf-8?B?aEJvV0JqVDVlb2FXVFUyZHpEV3Nkb0E3bldoMEhRNmFEamFMcFBQdkFQdFNM?=
 =?utf-8?B?VWtsNGNNenlUeEZJL0FIT3dnYkdkdi9OSi9ZNGVQQ2NsSUl4V3JERVJ1RWI3?=
 =?utf-8?B?em01bUZhUk1LckZySmVqUThDcVdtZEhqcjRBT2hHRjM1TEd2YkJOQW9kOEgw?=
 =?utf-8?B?ekt2aCtkOHV4c3BwZlZLRHVsanp3SkpkU0dpM1pVVHpBY054MVVNcVBZRTJY?=
 =?utf-8?B?MmxqTFZpK2NKWlVBU3FIMVozZWREeVkvQjBNNHFMSmRPemhscW00NHVlMERM?=
 =?utf-8?B?WWdqVzZJckE3UnhrR01ZamlEVmtreEdmTzloekUyNERhbDlsY0gzS08yazZJ?=
 =?utf-8?B?Qk5Md2N2WUhNLzVJamNSTVVZNTV2cWlYNVFaNTJRNSsvc2kvd2NKN0FvbERX?=
 =?utf-8?B?OXh6S3VVc3FYN1pYeTQ4TWFZeXBweWpROFVkREM2b1lMMGN2SSt3VDVUOWMx?=
 =?utf-8?B?M1VRWnVOTUhMMHRRUVdHMTBBVHUvODRoU3BxdmFsL09FQm9PY1dEV3JCZ0hy?=
 =?utf-8?B?eFhqY2VIVTZmRzV2ZGlnWldod1F2RkpISzBBb0xiL2VkWkNpODF6OExGWXFR?=
 =?utf-8?B?T3BERGR5Sk9hY1VLQk1BOU9lSEVHcHRRU0FRaTU1WXJvNEd3ZDMrYjF6Qk5D?=
 =?utf-8?B?d2VTdjlucm5jb2c3b0Znc0FzZWw2UURMUWErSlBTWjcxdFhwTTlDaDJ2MjJ0?=
 =?utf-8?B?LzZYWTZGTzVkNGV2TzdJYmtDZ0dKMlZIUWdIdFN0all4d01XSzVZS2VNOWhE?=
 =?utf-8?B?Q1djbUpVRWlCSW9QQVpuekwyaGZkUkpsMnpMVDBheFluMnora2FmSWc1alVs?=
 =?utf-8?B?STNQWS9kQ2NhT2RwZ0J1Ym9pNmpGdlhZN1ZwdEdhY0pvZDczYWE4aEJOdEdJ?=
 =?utf-8?B?bmpTM21meDRablNQZVc5RERjZ1loTWtIUlNpWlZDczdSRE1vMTl2TWhGeEhE?=
 =?utf-8?B?UU43T1owR1FSWHQvOEJhYlpQZHNxZmk5bVMwUzdZdVdKNlUrZ1VTU2VqTENO?=
 =?utf-8?B?Q3h3c20vejJ3OVE0YWhXMHZPWXBqcHlxaTBON29PeWUyeEtMTHNLRDZpUG9W?=
 =?utf-8?B?WUROSk1wRFkxWlNjN1FzdTBuZWdKTWFNTHg1RCtaN091dEVGSUx4blBsT0Fs?=
 =?utf-8?B?WE8zYW8zQ0NBcnVBenRKZHlYZ2kxeGJpMmt5WFVONFIwL1BWeXRXeWtBMXNo?=
 =?utf-8?B?dmNlUTVRRkIwdlJ4cURNb0pqRFVqRVJ5WEE2TWhibmtlaUZoa1M4czNSUSt3?=
 =?utf-8?B?U1A4Y2xvZDJvSEJ3Kzl1d0hiQjRyVEtTeHl3Sm94c1BkV2wzdUhrSkZaVVp5?=
 =?utf-8?B?djJNRVNDT3V4bGthK1F0elZWYUE2VWVnenlaWmVmMmNxcDVwSFhYU2Vtb2VN?=
 =?utf-8?B?WHRERDdNN0F3WmtGclZDaUIwaXZLbFNDRjhralp6V2VBck83Z1NMYTg5SFNW?=
 =?utf-8?B?bTU5K3BXcnFHZGdWTzB5eTZGSHBkQ1FSMWt5K3RCTHp1Q0kvWXJ1cG9raTFk?=
 =?utf-8?B?QzZwVStzdWt5TFZSRGs4RXBJV0RLNG8rV2psR25QL2J2aC8vVG1QTjU3LzdL?=
 =?utf-8?Q?eqQallXnIWlHsfqeRT36EW4SG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0daae657-c47b-4726-0fa0-08dd679763bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:10:06.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KELFI64TQ/5VeACPHj37GUAeuRSpZgdNXt35oozd7+xyrGb7pCMGvOi2o0JC3lc8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484
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

Am 20.03.25 um 10:58 schrieb Pierre-Eric Pelloux-Prayer:
> Its only purpose was for trace events, but jobs can already be
> uniquely identified using their fence.
>
> The downside of using the fence is that it's only available
> after 'drm_sched_job_arm' was called which is true for all trace
> events that used job.id so they can safely switch to using it.
>
> Suggested-by: Tvrtko Ursulin <tursulin@igalia.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 18 ++++++------------
>  .../gpu/drm/scheduler/gpu_scheduler_trace.h    | 18 ++++++------------
>  drivers/gpu/drm/scheduler/sched_main.c         |  1 -
>  include/drm/gpu_scheduler.h                    |  3 ---
>  4 files changed, 12 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 383fce40d4dd..a4f394d827bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -167,7 +167,6 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>  	    TP_PROTO(struct amdgpu_job *job),
>  	    TP_ARGS(job),
>  	    TP_STRUCT__entry(
> -			     __field(uint64_t, sched_job_id)
>  			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
>  			     __field(unsigned int, context)
>  			     __field(unsigned int, seqno)
> @@ -177,15 +176,14 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>  			     ),
>  
>  	    TP_fast_assign(
> -			   __entry->sched_job_id = job->base.id;
>  			   __assign_str(timeline);
>  			   __entry->context = job->base.s_fence->finished.context;
>  			   __entry->seqno = job->base.s_fence->finished.seqno;
>  			   __assign_str(ring);
>  			   __entry->num_ibs = job->num_ibs;
>  			   ),
> -	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> -		      __entry->sched_job_id, __get_str(timeline), __entry->context,
> +	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +		      __get_str(timeline), __entry->context,
>  		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>  );
>  
> @@ -193,7 +191,6 @@ TRACE_EVENT(amdgpu_sched_run_job,
>  	    TP_PROTO(struct amdgpu_job *job),
>  	    TP_ARGS(job),
>  	    TP_STRUCT__entry(
> -			     __field(uint64_t, sched_job_id)
>  			     __string(timeline, AMDGPU_JOB_GET_TIMELINE_NAME(job))
>  			     __field(unsigned int, context)
>  			     __field(unsigned int, seqno)
> @@ -202,15 +199,14 @@ TRACE_EVENT(amdgpu_sched_run_job,
>  			     ),
>  
>  	    TP_fast_assign(
> -			   __entry->sched_job_id = job->base.id;
>  			   __assign_str(timeline);
>  			   __entry->context = job->base.s_fence->finished.context;
>  			   __entry->seqno = job->base.s_fence->finished.seqno;
>  			   __assign_str(ring);
>  			   __entry->num_ibs = job->num_ibs;
>  			   ),
> -	    TP_printk("sched_job=%llu, timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> -		      __entry->sched_job_id, __get_str(timeline), __entry->context,
> +	    TP_printk("timeline=%s, context=%u, seqno=%u, ring_name=%s, num_ibs=%u",
> +		      __get_str(timeline), __entry->context,
>  		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>  );
>  
> @@ -519,7 +515,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>  	    TP_ARGS(sched_job, fence),
>  	    TP_STRUCT__entry(
>  			     __string(ring, sched_job->base.sched->name)
> -			     __field(uint64_t, id)
>  			     __field(struct dma_fence *, fence)
>  			     __field(uint64_t, ctx)
>  			     __field(unsigned, seqno)
> @@ -527,13 +522,12 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>  
>  	    TP_fast_assign(
>  			   __assign_str(ring);
> -			   __entry->id = sched_job->base.id;
>  			   __entry->fence = fence;
>  			   __entry->ctx = fence->context;
>  			   __entry->seqno = fence->seqno;
>  			   ),
> -	    TP_printk("job ring=%s, id=%llu, need pipe sync to fence=%p, context=%llu, seq=%u",
> -		      __get_str(ring), __entry->id,
> +	    TP_printk("job ring=%s need pipe sync to fence=%p, context=%llu, seq=%u",
> +		      __get_str(ring),
>  		      __entry->fence, __entry->ctx,
>  		      __entry->seqno)
>  );
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 3c7f6a39cf91..ad03240b2f03 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -58,7 +58,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>  	    TP_ARGS(sched_job, entity),
>  	    TP_STRUCT__entry(
> -			     __field(uint64_t, id)
>  			     __string(name, sched_job->sched->name)
>  			     __field(u32, job_count)
>  			     __field(int, hw_job_count)
> @@ -69,7 +68,6 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			     ),
>  
>  	    TP_fast_assign(
> -			   __entry->id = sched_job->id;
>  			   __assign_str(name);
>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>  			   __entry->hw_job_count = atomic_read(
> @@ -79,8 +77,8 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
>  			   __entry->client_id = sched_job->s_fence->drm_client_id;
>  			   ),
> -	    TP_printk("dev=%s, id=%llu, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
> -		      __get_str(dev), __entry->id,
> +	    TP_printk("dev=%s, fence=%llu:%llu, ring=%s, job count:%u, hw job count:%d, client_id:%llu",
> +		      __get_str(dev),
>  		      __entry->fence_context, __entry->fence_seqno, __get_str(name),
>  		      __entry->job_count, __entry->hw_job_count, __entry->client_id)
>  );
> @@ -117,7 +115,6 @@ TRACE_EVENT(drm_sched_job_add_dep,
>  	TP_STRUCT__entry(
>  		    __field(u64, fence_context)
>  		    __field(u64, fence_seqno)
> -		    __field(u64, id)
>  		    __field(u64, ctx)
>  		    __field(u64, seqno)
>  		    ),
> @@ -125,12 +122,11 @@ TRACE_EVENT(drm_sched_job_add_dep,
>  	TP_fast_assign(
>  		    __entry->fence_context = sched_job->s_fence->finished.context;
>  		    __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -		    __entry->id = sched_job->id;
>  		    __entry->ctx = fence->context;
>  		    __entry->seqno = fence->seqno;
>  		    ),
> -	TP_printk("fence=%llu:%llu, id=%llu depends on fence=%llu:%llu",
> -		  __entry->fence_context, __entry->fence_seqno, __entry->id,
> +	TP_printk("fence=%llu:%llu depends on fence=%llu:%llu",
> +		  __entry->fence_context, __entry->fence_seqno,
>  		  __entry->ctx, __entry->seqno)
>  );
>  
> @@ -140,7 +136,6 @@ TRACE_EVENT(drm_sched_job_unschedulable,
>  	    TP_STRUCT__entry(
>  			     __field(u64, fence_context)
>  			     __field(u64, fence_seqno)
> -			     __field(uint64_t, id)
>  			     __field(u64, ctx)
>  			     __field(u64, seqno)
>  			     ),
> @@ -148,12 +143,11 @@ TRACE_EVENT(drm_sched_job_unschedulable,
>  	    TP_fast_assign(
>  			   __entry->fence_context = sched_job->s_fence->finished.context;
>  			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> -			   __entry->id = sched_job->id;
>  			   __entry->ctx = fence->context;
>  			   __entry->seqno = fence->seqno;
>  			   ),
> -	    TP_printk("fence=%llu:%llu, id=%llu depends on unsignalled fence=%llu:%llu",
> -		      __entry->fence_context, __entry->fence_seqno, __entry->id,
> +	    TP_printk("fence=%llu:%llu depends on unsignalled fence=%llu:%llu",
> +		      __entry->fence_context, __entry->fence_seqno,
>  		      __entry->ctx, __entry->seqno)
>  );
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 85c2111e5500..85e0ba850746 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -848,7 +848,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  
>  	job->sched = sched;
>  	job->s_priority = entity->priority;
> -	job->id = atomic64_inc_return(&sched->job_id_count);
>  
>  	drm_sched_fence_init(job->s_fence, job->entity);
>  }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 032214a49138..ddc24512c281 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -326,7 +326,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   * @finish_cb: the callback for the finished fence.
>   * @credits: the number of credits this job contributes to the scheduler
>   * @work: Helper to reschedule job kill to different context.
> - * @id: a unique id assigned to each job scheduled on the scheduler.
>   * @karma: increment on every hang caused by this job. If this exceeds the hang
>   *         limit of the scheduler then the job is marked guilty and will not
>   *         be scheduled further.
> @@ -339,8 +338,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   * to schedule the job.
>   */
>  struct drm_sched_job {
> -	u64				id;
> -
>  	/**
>  	 * @submit_ts:
>  	 *

