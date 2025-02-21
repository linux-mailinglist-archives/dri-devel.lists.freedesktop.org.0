Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDAEA401AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 22:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172EF10E096;
	Fri, 21 Feb 2025 21:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OCJSRJX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F2310E096;
 Fri, 21 Feb 2025 21:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRcGuxjDjN8TiZzyFYzmiot1v7OWDDMMzrQo+aPRMkWzGp7TSe7/KqTNC6mY/74jwYc0XrTDUiQUOvFMpt9d3JenZE3qOGY3/wusq04CTF2NWjU3wi132r+ejkG5s9xotWz1pGFAquFgJhsqi0WvBewlcBXWn1aM4EUL2IagaIearD7WQ3d4+SJdqlFMWMyOW6czmDKOHo3tenu8HtqI806FB4YbIBYntbi8d/SpfvrOe5kSfupWIinRGwQuU5v5R/Bu4hO5unJ1f7OPLjdJGVkaJYrDw7jcMnOKHWKVActUnL3gEqxaFXjqoEkmBW1rf9HekjSIAWgx31iNs3gB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyQlaPS92sw8NhLbX83Ztm967fPKmhp28wev/f3JCJw=;
 b=Qo4c0zG8QjlHF73LiITmr/H/Mg8IcvKyHk4dqmGNVj1sxK9vEFULwbz4Zv3ex0n0pt063T1QrFzWP+4AR35f1Sz4tr3kAgIHBxgYS0/sn9NcE9ohme3HQIPYTssQxXIw+6cUll+N0wt0llbFgj9qYNrlFsx33U/zjqXTRxPROXkpIPNgtFbC7uuuX/1tN1lpetRiuZVB/BUFHmnTH+9EHMPSD4vjJd5wdLC3lPldEe2Iv3kut31ojmSsIUUCWnCYDfQMbsGlcOAt0XfcHAahvYe0mwlWSV363IsumGcKeoa3OAQ8R79f6EsqNYZLFUIO3SNdyeAcyREXUR1eYxfoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyQlaPS92sw8NhLbX83Ztm967fPKmhp28wev/f3JCJw=;
 b=OCJSRJX8e7l/cf7AI+iJVswphtaEuFAU1/kJdb7uiSKm32Gyh/poufPau8AS+NwYdcipQTvHqA+e08xAPoTOitNwRKK7iLIOJ6I5pX961Y5LQIUGC1lAuU1AUSPlbShlukno7StNBchboRQaqnI/pA8rqtHBfAoKaZZO9V5md1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 21:05:19 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 21:05:19 +0000
Message-ID: <21456cb2-760e-473b-99eb-5cb33864a3a3@amd.com>
Date: Fri, 21 Feb 2025 16:05:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 42/45] drm/amd/display: add 3D LUT colorop
To: Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-43-alex.hung@amd.com>
 <44edbdfb-5e23-4c19-8c80-e7acb8b4930f@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <44edbdfb-5e23-4c19-8c80-e7acb8b4930f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0197.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ae7d22-2ef2-4584-2d8e-08dd52bb72e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkZYaDZQUythYUhROW9NcVV4cDFRM3JzWjlrTkFpMVRINWswTFh3NnZUeXky?=
 =?utf-8?B?NGg4S3dZWkkwb21sV0FydlZNRVR2NjRHVjRKWEZQaWtSMTk1ci8yVDUxci8y?=
 =?utf-8?B?c3hYMDBWRnk4UDFmTnNCUFYwWEs4QmJNblVLaGkvNk1zWUoyYjcxeFJCYktX?=
 =?utf-8?B?OXBXY2NnWlVaU2NCcm5NZnZUTnZPdThoc3ZFdCtFSGs2Q3BrTlo1RGtLRUJW?=
 =?utf-8?B?RHhORE1pbVExZHl6aGRiTlhnbU9iT21FcnJpanJKU1lsWjRub3NDTnZJZktq?=
 =?utf-8?B?SHNjV3haWWcrQnZUR1hQNG5uOXE4VG5ZLzIvMmVoUXVwaklwR3RDT3F4Mk10?=
 =?utf-8?B?ci9RbnVZN0ptS1RHQ0xHMC9Gb29mbFY4K20veDlyOXZXQ1FkalNPd0M4aER0?=
 =?utf-8?B?Ymo2YzV6VndQb1Y3Wk1mNnlFcWloYUU5Nld4bDR2M3R1VlcwWUQ4MDJJRExG?=
 =?utf-8?B?T3VaWDV2NXNnLzQrQ0J6SVpGc0VBQUhzZkNZWm9VZUNKU0xTM3VpMCtadTdn?=
 =?utf-8?B?U3JKNHZhSVF2aDFIUTdtbVkyTzRXKzk0cTdLSUNIb0dMWE5qd0s2YXpNZTNB?=
 =?utf-8?B?OFhqM1dIQ3hPdWlaWWdnSVF3WFZOVHQxRlBIaDFQUjRJYnZpTGVaVlFtUU45?=
 =?utf-8?B?ZUFnQzlNWFJDYUxzSlpxTU8wNXRaaWVnRmMwRTFldjErNCtzL28vMzBzRVU4?=
 =?utf-8?B?bHdQb1BEUm1sWXdEYjhZYkVIOVBHVUVuell4Y3hsK1Y1WjlQYXA4UkhYOE1t?=
 =?utf-8?B?SjNBZ2xJaHhjV21FajAveVIwcU95VFdaVmxDOEJyNlBRcDhUMXpCamNSMGxn?=
 =?utf-8?B?Q21oc1JLbUZYL24vTDdRSXdCWHc2ZFNXdjB2NDArV0NzOU9pZFJ1Z01PdFZh?=
 =?utf-8?B?dFZrdVphd3Z4ekttWmJCNFhmeSt3eUZoS21CelkrN2VneVNzMERwVEQxbERm?=
 =?utf-8?B?RS9ISjVjWml0MldHeXEvKzFHUVY0WDNsb2RESE1uS0cvNjhqK3dlZUhvODJF?=
 =?utf-8?B?cGVYWnpMZXVFVWJUYnliMjlMenFyNGUzK3M2THVZWGZXdTlyYnlDQmJhUGUr?=
 =?utf-8?B?NFQxaERwekxsbktZV2VRalJNQVN1WHpTSjkyaU1yalhwRVBKT0xSdmRiZG1F?=
 =?utf-8?B?RnkxWVFSczI3OU1yRGM1WDA0WXY3Mzd5ak92bTlYN0QyOFR3RFAwL1ZIT1J2?=
 =?utf-8?B?UjZyQmQ2TnBkSTB4WXZ5SkVqQ1F0VnpnSDlTMVJUUG1MOENPcFk0RFBkNjFH?=
 =?utf-8?B?akxJQms0ZVZPbE01a2xrcEdBd3Y3dWo5KzByVHhMWEZCWUxZUm1lMi9HeDZW?=
 =?utf-8?B?Zk04eWw3WmsrVXI1Z01pQVpqc3VjblVVek1pcFdIcEdQK3pPV0lPek5RQ3Zp?=
 =?utf-8?B?SS9mdmNUaTBXR3RheSs4cXhzdTJzeVo1QWpSc2hPb3RWTHIyZnFJeXhhL1lG?=
 =?utf-8?B?VHNnZEhqbEV3VmsyVXRyejBSTDEwV1VpKzZGR0tNZE9kd1d4S0ZhY2pDWkpP?=
 =?utf-8?B?NHJ0bmpqUE1MeS9YM0VqQU1ZbWRWUHQybm1Lckl4djJLSUlvSm5UZlZZdk50?=
 =?utf-8?B?MDcwV3dlSCs1NzQwd1lHc2RBM0xreXNnMDFHZHJxUThDUGsrc1htOXh0eWE2?=
 =?utf-8?B?VnJQQ3J0N1lRbEh1eUpaZW1hTCsySWszK1F3NEhJMk04eVNDaThsdWdUTkxl?=
 =?utf-8?B?QW9lNE01NkJiWlM5a21EUTFGM3ZBbitKaXRmTk1oKzVpNWdwZlc3bzVXZHZW?=
 =?utf-8?B?cy9SRjVvN2FickRNLzJEaEtqaVY0ZkloMXZYSW9VaFpJQm9oZlAvb2tNV29q?=
 =?utf-8?B?WktBcldDVVBBRk1IRkNtMzk2MFdyT1Ava0lsVU5kemRDRFdFc3hTbUhJSkdY?=
 =?utf-8?Q?4RROrkRS5r4b2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFRReTBoamRUZ2hzSENuZ0pFSm9memJjZk55MCswZzBMQmlSY0grNkVHcWQw?=
 =?utf-8?B?NUJzTlU4MWRDWCtJSkVHYkZQY2l4V1hNY0hLNWU3aGQ0KzVObEg1RXdCeFpZ?=
 =?utf-8?B?QlRhbXU3aEtmam9RMUVKY2x2R1d6VmZmdy9QZDJPdExGcEhUMGVNdC9PU1c0?=
 =?utf-8?B?Ukt5YWZiZnVTL1BjektwWGlGMlRxQ0tJUW0zTnlDK0MzU2xFdzh0dnJTM0VY?=
 =?utf-8?B?UDZWZXZVendIYjIvTkxJWTVKYjlFdUlTdThrZTd2L3Y4ZzBYcEhoZVpZLzdu?=
 =?utf-8?B?ZTN0Y1JuRFBhaDA1VlV0VXoyVmdvWG5ZNkcrdHZna1R2SkZrUWh6T2VyWWxU?=
 =?utf-8?B?dVdKSjJZY0h4Ni9MVDJldms2ZU11Nnl0VytpS3BhZFhEWGRLN1pHNCtENVJk?=
 =?utf-8?B?c0NRWEphem5VVm40MmpZcmpTRjA2dldEU0NsMWdrcUZOaUFWQnhwd1FWZWxm?=
 =?utf-8?B?Vk5IcTBEMldhMXN3MXY1OXhoaWpOZXp2ZjJMUWZKWkVWZFdnYll2RHVQdDg0?=
 =?utf-8?B?T1JJTHllZ3NZV0VFWEJDMnR1bHBXMDljcUxSb1BNSG5RaHN4d2RUWTVJcEhG?=
 =?utf-8?B?UVNFWWlzY2NVZk1qTy9XSHl2MitibzJ4bmpEdmh2UmNndVFrdkhVZEg4VGJH?=
 =?utf-8?B?SnpPdjJwWVVtQ0FZUGIyQ2FoWTNHZm9DOE9FTXM4OXVFU3JtMVdlZG1jTDd3?=
 =?utf-8?B?dU56Y1JLWjFnZXJFT1Z1TU01SFJXdjl4dlR0ekV0OGd4S0RZd1RmcXFQcE5s?=
 =?utf-8?B?YUMxbDRMRkcrTElOR0UyYVoxRlh0MDRwVU9RRldNS2NndnQxSE4yVUtLN1RM?=
 =?utf-8?B?S0ptd2FscEtUbks1eUp2UDV4NjBlSnFQZzVKK3NNVlV3MStsZmt0aHd6RGZM?=
 =?utf-8?B?TlA4endlMFR5RjJYQThTeFpFUWxhVzNoT21UOStNcmNCSEswUld5MWpYd2tG?=
 =?utf-8?B?OHVjMm5sZTg2NmxvOXdYOWd2M1diUEV0UFB0Slc3U0RGeXlmZHQvUzR6WnJW?=
 =?utf-8?B?UHgwMWxOQTIxdFNzQTNUaFRvN01Zc2diZGQwNnd6R0F2ZU8vdkxCSGQ3MkVC?=
 =?utf-8?B?K2RKaldBSkQ0VTdvWHpidytKNWlibWhKOThnaE1JZThqMWNLUGFSY3c1SldX?=
 =?utf-8?B?T2hmLzJNNCs4SjMzQjd4Tjl5VUEzeGdrYU1CUnpodkZadVdSMFNvNDk0Ty9D?=
 =?utf-8?B?aVp5L0ZOa05FRWFGVHh5UDExTVZTa1daV01jK3lXTiszNzEzSGN6eVp5K2lv?=
 =?utf-8?B?S2ozaE0wL2NTWStFLzVTVUJ3V1dlREl4ZXhPUU5kYjkyU3BkdGIycExzMVhO?=
 =?utf-8?B?RmJGdVhhY1FJYjk5dUFVVXArMVZNMVB3THhxZ1VDMHpCNW44amZlUkllZ3pn?=
 =?utf-8?B?clU3MStRWXhBenNTL20wTU1QOUFraGd5aWVyYzgyMDlnNnpDODRyNkJrV0ov?=
 =?utf-8?B?UDR5RkxuS2s2Vk52UEJEQUJOUW40OHl1YWpQWVZibSthSEIxekdaVklFVkI0?=
 =?utf-8?B?NmdHNzgxU2wrQk5EZ2Q5UnowOFhsUkZzbGpGWXk0U3lqUnJZRnl2NUhablZx?=
 =?utf-8?B?RjN5QkJQd2g3cVN1YkpmSWg0R3M0UTJnQjBMSUI2RWJKVklrNmhzMnEwTGNt?=
 =?utf-8?B?OGVNMU5mY00xb0VSS1dmV1RGY0p5cVhBcGdhdXhZWFpBMkg0OUVYTWVzOUJm?=
 =?utf-8?B?bVlXZ3JHeVZ1UHlKUWhvV1d0QkFzakpjOE9KTHc2VWxWeEJLQWJCamFrZWY5?=
 =?utf-8?B?Zk5DYzRrYnp2NHI4ZmI2ditSbzltS2ZuREN5a0g1UCs4emtxdVVtQ3RwSThv?=
 =?utf-8?B?VlpacTE1L1NLSW5WR1FFRGpqSWluVk5zSFhsZm83SmxPUVlwQ0ZzUERYbXZI?=
 =?utf-8?B?ZFEwUEl2TkNlaGM0QlNFSmRwTHRibmZ5T3lVRkU0RWpsWFhmZG5ZeS91NmtL?=
 =?utf-8?B?WjNMd0VFdUY3ZlJFUGcydlFpNy95MG9oanpuSFYvcTRuaWFZaWwxU3k3YTZq?=
 =?utf-8?B?aFJuL2NMaGRFczFJbTBsR0p5aWFvR052WGxaSGVmdU5SVTRTUFdjM3ZmV3c1?=
 =?utf-8?B?VWdHeERJQ044dGpjUTIraCtRekZTTjJDMStlb3NtY2pORUJHRzNmc2dKcGRW?=
 =?utf-8?Q?cQJcbH3gNlA7wFN5SHfa2rbo1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ae7d22-2ef2-4584-2d8e-08dd52bb72e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 21:05:19.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/cB53xt8VUA0O+AMMaRe2qQN+FXnPurmIjdxvO6D6vj4hn8CR9aQ9ABSfwSh/wBufOibfUBdmgEwyHivSoYgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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



On 2025-02-13 13:21, Leo Li wrote:
> 
> 
> 
> On 2024-12-19 23:33, Alex Hung wrote:
>> This adds support for a 3D LUT.
>>
>> The color pipeline now consists of the following colorops:
>> 1. 1D curve colorop
>> 2. Multiplier
>> 3. 3x4 CTM
>> 4. 1D curve colorop
>> 5. 1D LUT
>> 6. 3D LUT
>> 7. 1D curve colorop
>> 8. 1D LUT
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>> v7:
>>   - Simplify 3D LUT according to drm_colorop changes (Simon Ser)
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 100 +++++++++++++++++-
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  19 ++++
>>   2 files changed, 116 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index 54ec12c1352f..5e8c5c0657c4 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -1282,7 +1282,8 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
>>   static int
>>   __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>                     struct dc_plane_state *dc_plane_state,
>> -                  struct drm_colorop *colorop)
>> +                  struct drm_colorop *colorop,
>> +                  bool *enabled)
>>   {
>>       struct drm_colorop *old_colorop;
>>       struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>> @@ -1310,6 +1311,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>           tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>>           tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>>           __set_output_tf(tf, 0, 0, false);
>> +        *enabled = true;
>>       }
>>         /* 1D LUT - SHAPER LUT */
>> @@ -1337,8 +1339,88 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>>           shaper_size = shaper_lut != NULL ? shaper_size : 0;
>>             /* Custom LUT size must be the same as supported size */
>> -        if (shaper_size == colorop->lut_size)
>> +        if (shaper_size == colorop->lut_size) {
>>               __set_output_tf(tf, shaper_lut, shaper_size, false);
>> +            *enabled = true;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
>> + * @drm_lut3d: user 3D LUT
>> + * @drm_lut3d_size: size of 3D LUT
>> + * @lut3d: DC 3D LUT
>> + *
>> + * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
>> + * on DCN accordingly.
>> + */
>> +static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
>> +                uint32_t drm_lut3d_size,
>> +                struct dc_3dlut *lut)
>> +{
>> +    if (!drm_lut3d_size)
>> +        return;
>> +
>> +    lut->state.bits.initialized = 0;
>> +

Shouldn't we clear this bit if !drm_lut3d_size? I.e.,

if (!drm_lut3d_size) {
	lut->state.bits.initialized = 0;
	return;
}

>> +    /* Only supports 17x17x17 3D LUT (12-bit) now */
>> +    lut->lut_3d.use_12bits = true;
>> +    lut->lut_3d.use_tetrahedral_9 = false;
>> +
>> +    lut->state.bits.initialized = 1;
>> +    __drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
>> +                lut->lut_3d.use_tetrahedral_9, 12);
>> +
>> +}
>> +
>> +static int
>> +__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
>> +                 struct dc_plane_state *dc_plane_state,
>> +                 struct drm_colorop *colorop,
>> +                 bool shaper_enabled)
>> +{
>> +    struct drm_colorop *old_colorop;
>> +    struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
>> +    struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
>> +    struct drm_atomic_state *state = plane_state->state;
>> +    const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
>> +    const struct drm_device *dev = colorop->dev;
>> +    const struct drm_color_lut *lut3d;
>> +    uint32_t lut3d_size;
>> +    int i = 0;
>> +
>> +    /* 3D LUT */
>> +    old_colorop = colorop;
>> +    for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
>> +        if (new_colorop_state->colorop == old_colorop &&
>> +            new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
>> +            colorop_state = new_colorop_state;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
>> +        if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
>> +            drm_dbg(dev, "3D LUT is not supported by hardware\n");
>> +            return 0;
> 
> Should an error be returned instead?
> -Leo
> 
>> +        }
>> +
>> +        drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
>> +        lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
>> +        lut3d_size = lut3d != NULL ? lut3d_size : 0;
>> +        __set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
>> +
>> +        /* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
>> +         * with TRANSFER_FUNCTION_LINEAR
>> +         */
>> +        if (!shaper_enabled) {
>> +            tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> +            tf->tf = TRANSFER_FUNCTION_LINEAR;
>> +            tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>> +            __set_output_tf(tf, NULL, 0, false);
>> +        }
> 
> Is it possible for an atomic state to have a 3DLUT colorop_state, but not any
> shaper colorop_states? For example, say a previous commit enabled the shaper,
> and the current commit enables the 3DLUT without any shaper updates?
> 
> If so, `shaper_enabled` may not get set to 'true' by
> `__set_dm_plane_colorop_shaper` for the current commit, and the previously
> programmed shaper would get overwritten by this logic here.
> 
> If this is actually an issue, inspect the current shaper state -- if a new one
> isn't there -- should work.
> 

Instead of passing the shaper_enabled bool from __set_dm_plane_colorop_shaper
to __set_dm_plane_colorop_3dlut we should look at
dc_plane_state->in_shaper_func->type and program the linear
shaper if type is TF_TYPE_BYPASS.

But that won't work correctly now either since __set_dm_plane_color_shaper
currently doesn't set the shaper to TF_TYPE_BYPASS when the colorop is in bypass.

I think __set_dm_plane_colorop_shaper needs this bit before the final
return statement:

if (!(*enabled))
	tf->type = TF_TYPE_BYPASS;

Harry

> - Leo
> 
>>       }
>>         return 0;
>> @@ -1467,6 +1549,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>   {
>>       struct drm_colorop *colorop = plane_state->color_pipeline;
>>       struct drm_device *dev = plane_state->plane->dev;
>> +    bool shaper_enabled = false;
>>       int ret;
>>         /* 1D Curve - DEGAM TF */
>> @@ -1506,7 +1589,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>           return -EINVAL;
>>       }
>>   -    ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
>> +    ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop, &shaper_enabled);
>>       if (ret)
>>           return ret;
>>   @@ -1515,6 +1598,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>>       if (!colorop)
>>           return -EINVAL;
>>   +    /* 3D LUT */
>> +    colorop = colorop->next;
>> +    if (!colorop) {
>> +        drm_dbg(dev, "no 3D LUT colorop found\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop, shaper_enabled);
>> +    if (ret)
>> +        return ret;
>> +
>>       /* 1D Curve & LUT - BLND TF & LUT */
>>       colorop = colorop->next;
>>       if (!colorop) {
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> index ec94ff887886..e03e6044f937 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>> @@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
>>     #define MAX_COLOR_PIPELINE_OPS 10
>>   +#define LUT3D_SIZE        17
>> +
>>   int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>>   {
>>       struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>> @@ -145,6 +147,23 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>>         i++;
>>   +    /* 3D LUT */
>> +    ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        DRM_ERROR("KMS: Failed to allocate colorop\n");
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
>> +                     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, true);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i-1], ops[i]);
>> +
>> +    i++;
>> +
>>       /* 1D curve - BLND TF */
>>       ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>>       if (!ops[i]) {
> 

