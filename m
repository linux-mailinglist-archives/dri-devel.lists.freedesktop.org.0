Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6C9238F6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D3310E57F;
	Tue,  2 Jul 2024 08:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bx2IWkkm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD4410E578;
 Tue,  2 Jul 2024 08:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bky2KX5b3Fvvv7meaO8+1svkWfxS16OsK4hnDz/ct+cCAREDUyTbysJ1DT+nsYjoCuBk06dDZ+U2uREoRDbDz/AcxTrr8k9KmaMF38PUBR7jbKKf2YORxOQUYah3hdLo2qExeuZ20ZpWyXORpUvqlJ1rY6g9kGoNan74ZssIRGs47eoI+DMb9r6KbcT6U9swSPBU4LalHWbgaW+N+ykOoSlIAOGedY/37a1RsZB91A5nVZEdnGt7De4hWA+6+NNQdzg/HkulqyN1Fp1LveS2JDBY2iVGOMo2WPKetchD0T4yFjQ8UcvSDxOptluapBgH300IBUBuH/V/FR6rKkinbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGC3fXhvd6DEJzb5b1nUb4oS5uUkXcPScuxYttxWRRo=;
 b=MacSxjLkHrqMFLJQBSwXjLK4ROr5VspYZa2TvbKHaL0VFO8pzwjt+eMwetgbBFbcSOwk3jJdqtDwf/+QgD8cE9kaeIt3yGTZX7kTPm6erpvnYjGLVCpUEMULb/kVpSTXEDJ2+iPIkqYHKZHYb106qKge2Z0O8K1B5NTGLvJDuRQ/GM24ewnCFCStivArcemJYqk6In6W1fw94zG9znk8xOd1TeehjZcYXJxMMUVq6A7SbklgGHqjig1V4IBGhe/ziJTQQ3/RdzoHFdomFy7VfjIJH1ZCPRl9H6QN4yitCVP4c/XIlCAtkSMztKJ8OY0ZgytUKjGdM65/uSmmDQSSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGC3fXhvd6DEJzb5b1nUb4oS5uUkXcPScuxYttxWRRo=;
 b=bx2IWkkm6rtYgyG/gHY9ah0P3i8mavgrZPNpt8DPF0bgQkP+9ZUYP2tyvS7v8f5gJBW/psA1wnmTh9DljMOl/oQikhJbcdDHFqDyJPszgoMN/7GrKoyXMEugc2QQx+ZQDDsAmvkWsrtw4csZ3OJIeLG5Pl7lpjphf4b3rGWtof0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Tue, 2 Jul
 2024 08:56:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 08:56:10 +0000
Message-ID: <af4cb3c8-6d7c-464b-b22e-377b1d0a7aed@amd.com>
Date: Tue, 2 Jul 2024 10:56:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/scheduler: implement hardware time accounting
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
References: <20240701171447.3823888-1-l.stach@pengutronix.de>
 <cf3beee0-14a2-4ad8-8c3d-7ba8a09c6608@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cf3beee0-14a2-4ad8-8c3d-7ba8a09c6608@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0343.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f2351f-ee4d-4aa4-41f6-08dc9a74d163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTluajZ2N0hZRnZCZGlYc2hNV2JnTEJrRG5DY2pScEprcWl2Um1mYUNsWXpi?=
 =?utf-8?B?UGt1WjlCTWxkQWx2N1UxWlZMUFpBQ1hpMm03RC9MV3ZQTzl0ZTBLbmRROXZp?=
 =?utf-8?B?VUR1RXVwREVlWlptcStmdnFPV2F0K0NNa0Q2K0RjVHB6RTZuN0E5ajIwMFUx?=
 =?utf-8?B?YjBwQ0F6cnpsZVp6bVErZWkzcTRFVDNJaEt1cVJTQWtlWXgzZXBwZnFudTdJ?=
 =?utf-8?B?MmR5T2kwbkRSamNmdGYzOFpONlFiKzU1S2lrTS9QOW1WdE5jSDZXOVc4Q0tH?=
 =?utf-8?B?QUo1dmc4dkVSYnlIRkZCVzlVWHg5RVFhY04yVDFCZW01QnQzbU9tbXZKQ1lL?=
 =?utf-8?B?dnhuRUM2TVhiZlhBV21qNEpscUk4OFlwemoyNDk5NUp5QVA5bFlHd3E3NGRI?=
 =?utf-8?B?bVFTeC8wRTE5eEh4Y1BkWlBzRkluemNseVRPY1pSUW5wYmlaYXlOMHh0bHg4?=
 =?utf-8?B?VFF3bGJ0Rkluc1FtNi9kbHNPV0c0QWNNNDNQb1E4NEtFcGt2dGlDUW0yMWtX?=
 =?utf-8?B?QXdTRHArMEtRS3ZyaEUwMitoTldoVGNvWTBqcWZEV1lRYUUrTlFoZlVtR0tD?=
 =?utf-8?B?MXFEVFJXb0lZSlVZdmk1ZXVnQy9hVDR3Y1M3alJEc3dmTHIzaC9oaXVCaGhs?=
 =?utf-8?B?SWNFcEJEeFpyeXJ1b1JsZmpSdDlGSmkvcm1JRzZVTmhadmN0dFY3bk5KZEo3?=
 =?utf-8?B?L0tYOXk0M1pLdnQxTEFUVzBGZHQzMUNBQnd2RUkvcjBqNk5hWDRUOS9FRzhk?=
 =?utf-8?B?SytrNVVlejhwdnZqT0NWWGQwWkY4TGFBZ3p2aDdRbWRoazRLdFk4V2ErMHlW?=
 =?utf-8?B?WnpvZWpCZUVSWkZ1VGIvMTNlWXk4TVNuV0NBVitoN0c3UHg2cjlaeStkS295?=
 =?utf-8?B?eENLZE1Ock8zc2sxbVRDZTVSaUs1TlRSVXlqYVQwOXRtQS9kTHh1Yk04MUpr?=
 =?utf-8?B?MTJKSmhzMXBkcFBGL0hJKzJZVitSMElMUnRqT3g2UWdlRFcydGpTRll3RmRD?=
 =?utf-8?B?WEY4Nkk3SG16SlJCUldxNzBUTHdkU0ZGMDBLajRPYWRLRTZnM0VsY3lVWTFC?=
 =?utf-8?B?MUF3V0I1WVNjdUcwNlNpQThWeDRTc3VKQnc1TEErcGxlL0kzb2hhN2xrc0Q1?=
 =?utf-8?B?cW01blQ0djRHaWlBRkFDR0JXS0dsUXc5NEhRMHcwUnVtbGVXOEwzMXdFYVZw?=
 =?utf-8?B?UGFIUzVjcWdSS0RQMXZSTXQraUg0Z2phYTkwVDN6aHFPQUMwdW05Um1RSncw?=
 =?utf-8?B?eHYvcVBsVUprQ0FEMUl3aC8zUnp4MHJTYUhrRkN1MVZPcGJOblNIU2VmelN2?=
 =?utf-8?B?NDRuZVFzNlExdEtHVmVuVTA1eHVDS1hkbElXaGtFN0ZDc0FDazdwUEc5YVFR?=
 =?utf-8?B?eXM5K1hoU3haV1IwRGxyYWZoR3dlREsrQktVdkk3djhsWVVFQ2dzVWhORXVx?=
 =?utf-8?B?Ym1iKzJyb1RUaFlGT3JMZW55V3MxNXlCV2dBNVpHVTcwamdSSXlrSzUwV0I4?=
 =?utf-8?B?SlpmeWpQYnl1a2tLR1V0WTM4Wm1VZFZuYkRGR2QwbitCY09ibGloaWJCQ09s?=
 =?utf-8?B?TWE5cDROcVg1YThjQTVPQUIwdzFQYmNTZGhNRzluR0UweXhsL2NWei9WWTI1?=
 =?utf-8?B?elhFcFZqZWVPRms5RXVKeDlxQlVSek5wbDhBMDcxVWtZbkRHS3pxbDkrNHZV?=
 =?utf-8?B?QVY5ekVJQ25jZ1pFeGpkTmpmbXBTNGx1bFA5U0Y4eE5MVkgwTE1tNVBOWjk1?=
 =?utf-8?B?NGs3ZXVJM1lsTmplNklwT0ZDRlZ5NmdPQnVpby9zdXNJU3hJUHVrVnBRdGhE?=
 =?utf-8?B?eC9pQU5nZGdsYjVWWCtZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEJGRWU0SlB2WjhCNkZMVnNSeHNNNlFaWXA2dkcrcFdNdSs4UmZmSnhYYkJR?=
 =?utf-8?B?cHVJdS9yQ004STlpRy9jeGZTMWZLQ3grQU9WbUdpYjdnVU9HYjJBa1VUT1dw?=
 =?utf-8?B?cHlabkNUMTBMQ3FPUXFBanU2eDdCSUpCaUw1bndGSjcwSVJ4azJOa2tINmNj?=
 =?utf-8?B?M1VLSjNDdUF0S0FXNVc4WGUwbldqYm02bFNuWWNlc0NVZi96aklrOWpKQUJq?=
 =?utf-8?B?R1FzZ2czMGRQQ3NGcktiMzFETGVSa2xLRE96dTdmbWtPUmpYZVBvM0l5dTFX?=
 =?utf-8?B?RjhmL1E4RHdYSk1kRnRVZ2dqRmJZUXd1N3JzdTM1TU9vUGdiNUNXNGsyZExH?=
 =?utf-8?B?TXplVnpsd3pxNDRybHdBcE5ubnl1ejdWWUV1ZDJJUGtrNWdwdFVvb01COE5L?=
 =?utf-8?B?WmEvcFpGcFpwb3VGNHJVYU1TT3VVbmJQWTJIZDErZmw3Z3U0dmZlSkFkWXJn?=
 =?utf-8?B?OUw3S0R5ak5DWHdLSzBMTExHbm5zd0FvOHBJa1lQalNHR1c1UitOQTVnKzVx?=
 =?utf-8?B?Y2g5RUhBQTNsUU5iQ3g3VjN0TTk1ODdJaGp1eDk1YU4wNnVQM2NRbUZJMmxt?=
 =?utf-8?B?QWVnbSt4NmVZN08rNHFVcnBnRnRQUEo3ME5Rc2haOHZmUEZYcit2WHMzR0Jl?=
 =?utf-8?B?cWU0bHQ0QXVPTzRQMHprRVdqYXJuN0RoM0VubmhNLzVJYWZVbCtBc3VWQzBH?=
 =?utf-8?B?aW52Z0pjcTB3U1lLejlKQmt1SDZaeUFRSm5DdzZtTnAxOVJiNm9xVjdYZERo?=
 =?utf-8?B?czJUaUwxeGx2eVR4RUZMSU5BUkdwU2pzOE9odjFvR0gzL2xYOHNlb3k3RUN0?=
 =?utf-8?B?NUg1bUFRaHBDaVgxSFNuOVlhMkNoSmQyK2JJUzIrZXYzL2lPcTl1YUV4SzdZ?=
 =?utf-8?B?bWc2dlVKS3FLZFZHVFROdktYVFJmMWo3VUtNZy9sMHdMZXUzTXo5VnEwRnlk?=
 =?utf-8?B?WUQwMFpLNndWbFJ1M3hXbEY1c3RFMVZrNmZoWW5sTmxJUCtUYXN5S1pqbVF6?=
 =?utf-8?B?ZzlTZkNZUFZCSThpNXA3VFN3bEQyelV1MzhXYUhUNEVLRVlUcEpiTUtIYlpu?=
 =?utf-8?B?M1hLcUVFNkMvMFppbHE0QS9VazJ1ZTNHOUdwamtDcVhRRElDckFOTlNoRU9N?=
 =?utf-8?B?VEt2UWdwQ21UeExwczRjMS9QbXU0anUrSjRINDlJbUl0Qi9LL2JNV09wYkx1?=
 =?utf-8?B?K3hWeE5aL29wVEwvdURFNE5MQWJKTGFtcFRGdUZGVitCQW1ONXVmd0J6V2Fo?=
 =?utf-8?B?Z3BTZHFWUTEwUjBJLzdtL1JiRzRPdzYzZ05Yb1RrM3Byekt0dEJIWFNaeFM5?=
 =?utf-8?B?UHp6aHc4cXUyV25oRmRvTTlnM3FSVDgxSFZvV29TK3N0RjdHYkFMSjcwcVhG?=
 =?utf-8?B?aVNWNXo4WDlIcTRZY0Z6OHFxNTgzV1RQYkNQM1FZZmZmL3pUc3pDUjN1ZEZ0?=
 =?utf-8?B?dlVjQUs0ODcrZ0RDa2JzMkVsK0I1N0l5QXErbUNBQ3djNVRKS2VRTTlFVkRI?=
 =?utf-8?B?Y2FOeXdxdzlMVVpGTnFLcncrTFlMWHRSRVgzYSt0RXdONGs2MG5wR3l4Q1Jq?=
 =?utf-8?B?YmFiMXpSZG9nY1M0TUdjOFA3UHpQOVRLSUxHNzd4UGltRSs4RkZ5eU5XaEIx?=
 =?utf-8?B?OThCdVQySDQra0tpOHZRR0psSjVEK0xmNis4cHBKRVMreWFaSEFJLzBnTEdm?=
 =?utf-8?B?V2pQOE5DcjRqWW1Pb0RFR1k2V3dndGJnVVc4cWVTNDdadS9QWVBCTkNHVVRa?=
 =?utf-8?B?NjA5TFhqRmNzSkw1cVY4TFFmOThUT3BRbjFKZ0tyVjNySWw3bjcyY3lFa3ZN?=
 =?utf-8?B?TlcrSWduYzBPa1ZMck9BTGZjVE50Ykp2MmRGWnNJSjJvMFBBakJzWVdFeDJQ?=
 =?utf-8?B?SjNGRUJZekJ1V05ISjZHalpMVmZrelNMcW1CYUNZQ2tEQXQ5K0U5M2xoVkgx?=
 =?utf-8?B?TGNNOHlsQkNwS1RKcFBKSkpJUDhXK0NvYlA0Ri9DYnNVQnVOK1RGeHdvYU5t?=
 =?utf-8?B?THlIMmhJNmx2TWlkWjJxelFKY0c3TGpDMHR3N1BQNHQwUHAzL3ExMXF6TW5J?=
 =?utf-8?B?RUF6TzhlNzdDUVFGN3B5YTAwYXZudlBMTWd1RXIvdm1RbzRJaGJzM1RFZmFx?=
 =?utf-8?Q?CDYNRFA5UQk0lAl7kiFwWfzqB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f2351f-ee4d-4aa4-41f6-08dc9a74d163
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:56:10.0579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ER4Fo1daAUTerLzDzoL+4VRgiwB9bTMtL+tgcQmhDahkbSJPp+bURstDd7IjIUp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949
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

Am 02.07.24 um 10:42 schrieb Tvrtko Ursulin:
>
> Hi,
>
> I few questions below.
>
> On 01/07/2024 18:14, Lucas Stach wrote:
>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>
>> Multiple drivers came up with the requirement to measure how
>> much runtime each entity accumulated on the HW.
>>
>> A previous attempt of accounting this had to be reverted because
>> HW submissions can have a lifetime exceeding that of the entity
>> originally issuing them.
>>
>> Amdgpu on the other hand solves this task by keeping track of
>> all the submissions and calculating how much time they have used
>> on demand.
>>
>> Move this approach over into the scheduler to provide an easy to
>> use interface for all drivers.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> ---
>> v2:
>> - rebase to v6.10-rc1
>> - fix for non-power-of-two number of HW submission
>> - add comment explaining the logic behind the fence tracking array
>> - rename some function and fix documentation
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 82 +++++++++++++++++++++++-
>>   drivers/gpu/drm/scheduler/sched_fence.c  | 19 ++++++
>>   include/drm/gpu_scheduler.h              | 31 +++++++++
>>   3 files changed, 131 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 58c8161289fe..d678d0b9b29e 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -62,7 +62,9 @@ int drm_sched_entity_init(struct drm_sched_entity 
>> *entity,
>>                 unsigned int num_sched_list,
>>                 atomic_t *guilty)
>>   {
>> -    if (!(entity && sched_list && (num_sched_list == 0 || 
>> sched_list[0])))
>> +    unsigned int i, num_submissions = 0;
>> +
>> +    if (!entity || !sched_list)
>>           return -EINVAL;
>>         memset(entity, 0, sizeof(struct drm_sched_entity));
>> @@ -98,6 +100,11 @@ int drm_sched_entity_init(struct drm_sched_entity 
>> *entity,
>>                            (s32) DRM_SCHED_PRIORITY_KERNEL);
>>           }
>>           entity->rq = sched_list[0]->sched_rq[entity->priority];
>> +
>> +        for (i = 0; i < num_sched_list; ++i) {
>> +            num_submissions = max(num_submissions,
>> +                          sched_list[i]->credit_limit);
>> +        }
>
> Does this work (in concept and naming) for all drivers if introduction 
> of credits broke the 1:1 between jobs and hw "ring" capacity?
>
> How big is the array for different drivers?

Oh, good point. I don't really know the answer.

>
>>       }
>>         init_completion(&entity->entity_idle);
>> @@ -110,11 +117,52 @@ int drm_sched_entity_init(struct 
>> drm_sched_entity *entity,
>>         atomic_set(&entity->fence_seq, 0);
>>       entity->fence_context = dma_fence_context_alloc(2);
>> +    spin_lock_init(&entity->accounting_lock);
>> +
>> +    if (!num_submissions)
>> +        return 0;
>> +
>> +    entity->max_hw_submissions = num_submissions;
>> +    entity->hw_submissions = kcalloc(num_submissions, sizeof(void *),
>> +                     GFP_KERNEL);
>> +    if (!entity->hw_submissions)
>> +        return -ENOMEM;
>>         return 0;
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_init);
>>   +/**
>> + * drm_sched_entity_time_spent - Accumulated HW runtime used by this 
>> entity
>> + * @entity: scheduler entity to check
>> + *
>> + * Get the current accumulated HW runtime used by all submissions 
>> made through
>> + * this entity.
>> + */
>> +ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity)
>> +{
>> +    ktime_t result;
>> +    unsigned int i;
>> +
>> +    if (!entity->max_hw_submissions)
>> +        return ns_to_ktime(0);
>> +
>> +    spin_lock(&entity->accounting_lock);
>> +    result = entity->hw_time_used;
>> +    for (i = 0; i < entity->max_hw_submissions; ++i) {
>> +        struct drm_sched_fence *fence = entity->hw_submissions[i];
>> +
>> +        if (!fence)
>> +            continue;
>> +
>> +        result = ktime_add(result, drm_sched_fence_get_runtime(fence));
>
> Does this end up counting from when jobs have been submitted to the hw 
> backend and may not be actually executing?
>
> Say if a driver configures a backend N deep and is filled with N jobs, 
> while in actuality they are executed sequentially one at a time, the 
> time as reported here would over-account by some series such as 
> (job[0].finish - job[0].submit) + ... + (job[N].finish - job[N].submit)?
>
> Or in other words if one submits N jobs to a ring serving an 1-wide hw 
> backend, will we see "N*100%" utilisation instead of "100%" if 
> sampling while first job is still executing, the rest queued behind it?

Oh, good question. Yeah that can happen I think.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +    }
>> +    spin_unlock(&entity->accounting_lock);
>> +
>> +    return result;
>> +}
>> +EXPORT_SYMBOL(drm_sched_entity_time_spent);
>> +
>>   /**
>>    * drm_sched_entity_modify_sched - Modify sched of an entity
>>    * @entity: scheduler entity to init
>> @@ -326,6 +374,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
>>    */
>>   void drm_sched_entity_fini(struct drm_sched_entity *entity)
>>   {
>> +    unsigned int i;
>> +
>>       /*
>>        * If consumption of existing IBs wasn't completed. Forcefully 
>> remove
>>        * them here. Also makes sure that the scheduler won't touch 
>> this entity
>> @@ -341,6 +391,9 @@ void drm_sched_entity_fini(struct 
>> drm_sched_entity *entity)
>> dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>>       RCU_INIT_POINTER(entity->last_scheduled, NULL);
>> +    for (i = 0; i < entity->max_hw_submissions; ++i)
>> + dma_fence_put(&entity->hw_submissions[i]->scheduled);
>> +    kfree(entity->hw_submissions);
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_fini);
>>   @@ -522,6 +575,33 @@ struct drm_sched_job 
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>        */
>>       sched_job->entity = NULL;
>>   +    if (entity->max_hw_submissions) {
>> +        struct drm_sched_fence *fence = sched_job->s_fence;
>> +        unsigned int idx = fence->scheduled.seqno;
>> +
>> +        dma_fence_get(&fence->scheduled);
>> +        idx %= entity->max_hw_submissions;
>> +
>> +        spin_lock(&entity->accounting_lock);
>> +        /*
>> +         * The fence seqno is dense and monotonically increasing. By
>> +         * cycling through a array sized to match the maximum number of
>> +         * submissions queued in the HW we can be sure that once we 
>> need
>> +         * to reuse a slot the fence stored in this slot refers to a
>> +         * retired submission and we can safely sum up the accumulated
>> +         * runtime and dispose the fence.
>> +         */
>> +        swap(fence, entity->hw_submissions[idx]);
>> +        if (fence) {
>> +            ktime_t runtime = drm_sched_fence_get_runtime(fence);
>> +
>> +            entity->hw_time_used = ktime_add(entity->hw_time_used,
>> +                             runtime);
>> +            dma_fence_put(&fence->scheduled);
>> +        }
>> +        spin_unlock(&entity->accounting_lock);
>> +    }
>> +
>>       return sched_job;
>>   }
>>   diff --git a/drivers/gpu/drm/scheduler/sched_fence.c 
>> b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 0f35f009b9d3..55981ada1829 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -82,6 +82,25 @@ void drm_sched_fence_finished(struct 
>> drm_sched_fence *fence, int result)
>>       dma_fence_signal(&fence->finished);
>>   }
>>   +/**
>> + * drm_sched_fence_get_runtime - accumulated runtime on HW
>> + * @fence: fence
>> + *
>> + * Calculate how much runtime this fence has accumulated on the HW.
>> + */
>> +ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence)
>> +{
>> +    /* When the fence is not scheduled, it can't have accumulated 
>> runtime */
>> +    if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, 
>> &fence->scheduled.flags))
>> +        return ns_to_ktime(0);
>> +
>> +    /* When it is still running, calculate runtime until now */
>> +    if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, 
>> &fence->finished.flags))
>> +        return ktime_sub(ktime_get(), fence->scheduled.timestamp);
>> +
>> +    return ktime_sub(fence->finished.timestamp, 
>> fence->scheduled.timestamp);
>> +}
>> +
>>   static const char *drm_sched_fence_get_driver_name(struct dma_fence 
>> *fence)
>>   {
>>       return "drm_sched";
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 5acc64954a88..52bcff324a92 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -238,6 +238,35 @@ struct drm_sched_entity {
>>        */
>>       struct rb_node            rb_tree_node;
>>   +    /**
>> +     * @accounting_lock:
>> +     *
>> +     * Protects the array of fences tracking the in-flight HW 
>> submissions
>> +     * and the accumulator counter.
>> +     */
>> +    spinlock_t            accounting_lock;
>> +
>> +    /**
>> +     * @hw_time_used:
>> +     *
>> +     * How much HW runtime has been accumulated by retired submissions
>> +     * from this entity.
>> +     */
>> +    ktime_t                hw_time_used;
>> +
>> +    /**
>> +     * @max_hw_submissions:
>> +     *
>> +     * Maximum number of submissions queued in the HW.
>> +     */
>> +    unsigned int            max_hw_submissions;
>> +
>> +    /**
>> +     * @hw_submissions:
>> +     *
>> +     * Scheduler fences of the HW submissions in flight.
>> +     */
>> +    struct drm_sched_fence        **hw_submissions;
>>   };
>>     /**
>> @@ -600,6 +629,7 @@ int drm_sched_entity_init(struct drm_sched_entity 
>> *entity,
>>                 struct drm_gpu_scheduler **sched_list,
>>                 unsigned int num_sched_list,
>>                 atomic_t *guilty);
>> +ktime_t drm_sched_entity_time_spent(struct drm_sched_entity *entity);
>>   long drm_sched_entity_flush(struct drm_sched_entity *entity, long 
>> timeout);
>>   void drm_sched_entity_fini(struct drm_sched_entity *entity);
>>   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>> @@ -620,6 +650,7 @@ void drm_sched_fence_free(struct drm_sched_fence 
>> *fence);
>>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
>>                      struct dma_fence *parent);
>>   void drm_sched_fence_finished(struct drm_sched_fence *fence, int 
>> result);
>> +ktime_t drm_sched_fence_get_runtime(struct drm_sched_fence *fence);
>>     unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>> *sched);
>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>
>> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

