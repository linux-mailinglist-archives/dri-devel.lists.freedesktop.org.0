Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EA8958B9D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C6A10E29E;
	Tue, 20 Aug 2024 15:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="umIqdzcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7106210E29E;
 Tue, 20 Aug 2024 15:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQbQ9KkM4SJM1J50A5BpSRlE0lfwWuCrbNAcvERhEC3ddw3lkAavn3Pirses+sH1bcY6pd+whazhUcsNI9lLC7H8KOSluZwOkYpHk7VYTPiYZMnzj52hxgnKFz8X1F7hFAVV5yOQm913zaAWkWcJblK7rW9KicevOwg0oWVK7M4XofGFUKjk1Mc8xOacyc1QzNGhvUbprew/tvQEOkrygNszufQEYwLj2xKG7a2kzWsyzCgTuwaEvjFp7dAXgtyY0oOeoxFrJoZJdtWdt6wUAtXILo4GNxB4XkbZoi53VDdjJw1rp4W0LxSL1+Ki9gj0kvK7+V1cAyvj1WAdJ5Cmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Eo5HbmZ4h+KxBPkHz1ub5m5D+Cm0pCxc7vgkl6IQaU=;
 b=ZV1fiKk4XyxX99KiQxz+np7ELQN42pL9y043icVaQ2euYu2Tgx1Xv6j8PyjDBXQtwcrXf03VIAKNRXjiQN/+dlI/hNMJUie8Nvih2Mp8KDa0NpA1IPcaY3wzpVt02w1gwwPQ4IAUGxgqupWj0RhCrNlk9vaTdb/PQEdjLTOraw0mM0lGLAfUUxVW8X+rFEPEfoc6T67m5/hW242VzWLOhNHhaZlrLhpT3iDGHeBZwr2hG7RkF/S2HRMq08yv7JtTnkxLxvBln33n5FLk6DY83XNoqmCzZIIuAYWtZE+IOk7DGvWufjJYAK7ZRjLQBjU4F01y3/L8lMMkmwwm6W0sLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Eo5HbmZ4h+KxBPkHz1ub5m5D+Cm0pCxc7vgkl6IQaU=;
 b=umIqdzcDHkZDP1WY5Nei4vF/1BeksejrRHV4WUiv86/xb6RlYEcjrx02ZhoDe/PEPwqDAY4LSOGv4Urca/YviwWx6LYzRdo+62CqRbraZnwV1Gt0j0mI39jSZlGfeIOfIQCkWN6gaEeN5B7FUid5XFlvmwi8nvpdtCKm1IUEuZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 15:47:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 15:47:32 +0000
Message-ID: <b94e2ea6-569d-47bc-8e01-199b543b2018@amd.com>
Date: Tue, 20 Aug 2024 17:47:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
 <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
 <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: aeab0e07-df7e-4104-1420-08dcc12f679b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmRZN3dEVUpZWm84TzFEMUtvSnFWRWkxYkVXakpncWhDYzRFN0xzdzIrcC9E?=
 =?utf-8?B?MGd2UEp5czc3UGtNZUN2K0VFa1FiRHJaZjBvR2pKRzJFZWtRb09TNXdqL29j?=
 =?utf-8?B?S2NobGw3LzUrdTg5Y2VLRnBQVGlqcnh0K3FURDlyZ05GdnVwQ0dTTlV6R3ll?=
 =?utf-8?B?cUJjREYzZzlpQ09lN0wxc3pnbnhhMEVVRlU1V0FnZ1FoakplRERJYjZnV3ZH?=
 =?utf-8?B?T3hxSWNCQW9OSzgvUlF5WXB0S2tiaUVyMWFKeWpFK2ZlQWlqcEJ5WlNTem93?=
 =?utf-8?B?dk5UbzhpNTMwQitSTDdXcEpvWGFwWjgxTmJuY2M1OEI0NStKbEdtMGxndHhv?=
 =?utf-8?B?Y3dhY0tnQjFSVjN0UEMrQ2d3QlljYXZ5dmxSbFhsMlJncDB1aUhqTGtndThH?=
 =?utf-8?B?NUxxRVphWGlJRnFZYnh6RTI3VS9IQUdVKzk1ZHltbkltUkgzMWhDdDQ5cmc4?=
 =?utf-8?B?c0xUWU95bU9pNmRyb3psTHBjWUxFWkh3allxOVRaS2JwaGNWdTBrckk4K2ln?=
 =?utf-8?B?YjduZWcrMXZ4VnNoeHNCRGFXMlBBU0ZaT3dPY3BhWDhna2QzdXFpeDBHcVA2?=
 =?utf-8?B?K0gwSTh2eXUrZktpd3FaMlRUT2dzZWt4c0FWZFBmaFA4VXdPeGhPc3JHb0pJ?=
 =?utf-8?B?alRBVU1OVkNLQWJNUmVJVzRCTE81KzFEdDdyTHdRRUFJSUExc3o3S3JzOUtL?=
 =?utf-8?B?TDArYTk0NVFMYWZGNnVVZm1ybndIcTlNR2l0NmNwK09jUi9peGFaNWlnejdM?=
 =?utf-8?B?dTJBNDh4SkFuMVpJUFlvN2hYT05PSnE4NE43YWRnSzFpdUpOY25jTFljTHEx?=
 =?utf-8?B?bUU3ZE8ycmMydG16WnhxcWhlaGVFUTdNTjkwNkVFRE5ZaW9lM0tqTGZEK3NO?=
 =?utf-8?B?aDFOSWJDcEZLRUF2T2tpNUtTS05tZm16bng5MVRON3hOTGxwZjZCY2lDVFpH?=
 =?utf-8?B?QXphOTdGNEJSYWFzaTVmNjNaQkVJb2g2NU0wMEJmOUdsUytpemhJb0hsTGdt?=
 =?utf-8?B?dUdtckVMUkpSRlpESFlXN3VQT1N3VVJndU9USlJzdklJaHg5UHVaVXllQlJa?=
 =?utf-8?B?TG5QOC92K2VIbWpFS2t0QzlGSkE1ODd3TWZqWGkzeXJSRmpaTWRiTiswZ29M?=
 =?utf-8?B?YXV2aWlYQ2gxRHFJQzFpdXNFODVSaStJRlZURGhZZU8wdTNCdVRkNElNZTdU?=
 =?utf-8?B?MDVBUyswNzRTNDJzMW5NVlIrTXpjV3VLeDA1NkMyYWllOWt4VXMwTmkzWW9n?=
 =?utf-8?B?VkptazkvbERSOGZETFhJeGprcXNYUWlFQnIvK3F3U0tjdFV3dWpiTFRSTzBv?=
 =?utf-8?B?d3VRQ2pjdk1BM1FsMXJpV1h3aHp2ejYxZ3dUUklIa3Z3SmxEdXN2OEg4Y096?=
 =?utf-8?B?MmNoWnkva3NXQzhPZCtEbldiNi9sYkM0bGxCUmRIN1FNTzRjYTlvYUpXTm8v?=
 =?utf-8?B?eVcvTVEwK0JrTm5YS3VtOWVEcjE5QlVPM1BucVZweXJheGR5RTdwaVhjRDll?=
 =?utf-8?B?SzU3VVBrTE0wNDI2RDJUUG8zeVc1eCtFT3BiQ1dEMi9lTnFKRHltZkkvUk05?=
 =?utf-8?B?NDlRTVlWSUFMNTlOUENISzA4NXhmY1B5MkROSEsyQ2dVWERmZElxUWdPWDcz?=
 =?utf-8?B?NGhaa1BXeEE3dDRueEZXU0NPQlBQcXVuMHBzMW5NZEpETmZ2cy95TnJ2em5v?=
 =?utf-8?B?UDBFMkZXMmNBR1NaeFlFZ0hsSkFrNmhLbkRGMWRjNFF3bTI0Y0s3Q2k0VHpv?=
 =?utf-8?B?OFc3MUMvaVRCa29XcUVzRzAwQnNsQUZVTXFYMjRQV0sweHduWUFiNjBzOFlE?=
 =?utf-8?B?eVc5eEZXYzNCZjAvSUFmQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1JrOEtkdUt2aHpPbWJKZ0lKaGgxZkw2TjY3UEU4UzREQjZHNE5tNmgxK1ZU?=
 =?utf-8?B?WlNDQ28xTHdNQ1l5WkkvWlZWbFFYQjY3TU53T0pZOGJoSkN4K2FLWXI5V1hD?=
 =?utf-8?B?ZFlNS0dUQ00yZzJFUDVXK3M3UmJTTUVjOUlXa2ZVclp5U25TSklzWlUwZkQx?=
 =?utf-8?B?bXdsNWFMTnNQR1NuN3RVVTVZaDhYRHdQZ3h5UUZGN2VPL1J3MGZLSUlzV3VK?=
 =?utf-8?B?dlNOYjVDcXNqNmhqdkhPUUVJcHduOGY4czA3VVI5eWhMYWhGRFU1ZVBhQ0Fw?=
 =?utf-8?B?bWVlQmUxKzhSUFk4V21SemVtdkFqSmJtbnZXTFlyUGZOK1lROEIydnk5M1Rp?=
 =?utf-8?B?aTBMZWpIR1psdnJQTW9IU3lvd3NYVUFyTFN4N2VpNUQxK1BUOFhRYUwvZHBF?=
 =?utf-8?B?MHNRQTVCZ005dnRzdGVmbjVqc01hcGxUY2ZzS1FrcTcyQ3I0MVdNR3FoRUlp?=
 =?utf-8?B?THRaTjJVczJTMmRHVkNMMitwN3hSUW5kajNBQWpONzJxRGF5VFdHeXNMeWda?=
 =?utf-8?B?ODZYeHhFcDVrYm9qa3hCM0VERk5hZ2FzNnRaMFBod29rRGVEcEZFNUk2ZjBw?=
 =?utf-8?B?OTU3akJQQy84MjgvdC85STAzWEh2UW4rcHVtV2ZiaHBxWmZFYVNCcjlpSS9L?=
 =?utf-8?B?cVFNRlhxditwV1lvbjlwa09VcXNCRXM3S0JwUTBpVEtGbzcyQy9ma3diTkJj?=
 =?utf-8?B?NGVDQTZjaWh2Z05ISGU0T3RBbk9RbmhzUk1IWkp5eStrRVlKeGFwK3Nyd1FR?=
 =?utf-8?B?QlhNZ2lRKzUwckkxUnFQRTJwZkdya2NaMUdKQW8xRHAveXZrV2syMGxwa0Uy?=
 =?utf-8?B?YUZvZlRtOVpNZUJ5TTdtWlMzbHllMDV4NWMxVFREWWEvcVYvWWFQOEs4dXJX?=
 =?utf-8?B?NnlSQmtYd1JZTGtSeTgzdWcyZnZlc0lRYmdPWEVXdkg1M1Y4U2dHcmFtN1Jk?=
 =?utf-8?B?eldGcVRwYlZ2WXVOQ21VU2daR2diTzZaa1NXUHdhdVJTbWpLQnZKck9tN01j?=
 =?utf-8?B?VXZVMFlYL1VRRlJLWlg4K3dhYWN0YzhUUUw5c3oxQ1hEcDF4RkZrS25jSXVM?=
 =?utf-8?B?SmRYanFQQ2FQc2IyWERpV0RQWFVQaGVVUW9RLzF4Qkg5eVY4bjdWS1hDTGwx?=
 =?utf-8?B?TkxMaEYvRzVQdmdJUGlDeCsyTG5uK3l0QnpsNDBFWU5Qb1pTM09NNkQrK2k1?=
 =?utf-8?B?VEZldVhERkd1TWt0TGJHWk9IMStaWGRGbUhycFJBWkpLR2tKQ0s5VEpWT2dX?=
 =?utf-8?B?dWZ0ZVl5R1VQZXAweEszdDcvUEI0dVJ3djd5bnhrTXgyMnEybDVYejRmT0xn?=
 =?utf-8?B?VWNQWXhNRnZEQXJBdGRFUjBrM0M1czl6SUlHRHVZdmhTTW1PaXRGYmc5M0Vu?=
 =?utf-8?B?MTBOU1FxTmk5V0VKMjRKMFBhYmFKOFhxaEpwTFNEU2hxVFN4OFZnL0l6NTVF?=
 =?utf-8?B?UnJVRWY2YjRrdTJQYXRxWmpxRHFHUkFqaVYyQm56U2hsYkZEYkpiZlZEY2Uw?=
 =?utf-8?B?VDFiUjl4dndTaVBWbFI1T3I3L2IzNFR6cHc5cHZuMzVHVEdxSktEOUFlNlB0?=
 =?utf-8?B?NFF0NmRpckhzWEJiUEl0ZWw3b3hTTUhiSE11d3VxM3V2NGFsc2FSbVcxSUpn?=
 =?utf-8?B?K1J5M2dSNlFTR0lPQ1BVUVo3SlJZZFhFc0hLYVJSckJYS0lLaitQVDIxNk85?=
 =?utf-8?B?RjdVbUczakN0QzQwUXZFUERDWWZ3L2VsL1h2RmV5WkFINWJ0Wm9WVXF2RHhQ?=
 =?utf-8?B?SmN6Y2I2TktGWDcvTmxBNkxjNXc0MUJnUENUQi9MOG1INklEbkJPSmJtenJ6?=
 =?utf-8?B?NnlWRERMbThNN091SmZXNGRTMHZWS0lRV3Y1K3g4WUJza0VPd0ZqT3p6cFIw?=
 =?utf-8?B?bU9LOThQYW0weWNpTVU0YVJqSzZkSmkva0JTcnpwZWNadCs3aHdEOVdVUHNn?=
 =?utf-8?B?VVpKOGRJMk5lNzBrcHgvZmkrNlJxekRZdjlYUFhLcW5ab1dUL3VseWZOeE4w?=
 =?utf-8?B?a3dCMXNSK2kvb2VhYlZZYWorbmo1cStRaFdGMEpzOTl1ZEx6YWFtRDdGR2pG?=
 =?utf-8?B?WVQ0ODduQVRLd2NVSmptRHlSYXhsUkMxU2JjU2xVaUZQOVlmTS9Zd21TOWMz?=
 =?utf-8?Q?eT7k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeab0e07-df7e-4104-1420-08dcc12f679b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 15:47:32.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBjVLKpNCGF2Ty7m4mTX45ZIfFA+aPg2PJWaQJpqHgyUYlv6BlX8LshaT4TlE60/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
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

Am 20.08.24 um 17:45 schrieb Thomas Hellström:
> On Tue, 2024-08-20 at 17:30 +0200, Christian König wrote:
>> Am 20.08.24 um 15:33 schrieb Thomas Hellström:
>>> Hi, Nirmoy, Christian
>>>
>>> On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
>>>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>>>> releasing backing stores if they want to skip clear-on-free.
>>>>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> What happens if two devices share the same global TTM pool
>>>    type and one that does its own clearing. Wouldn't there be a
>>> pretty
>>> high chance that the the device that doesn't clear its own pages
>>> allocate non-cleared memory from the pool?
>> That's completely unproblematic. The flag indicates that the released
>> pages are already cleared, if that isn't the case then the flag
>> shouldn't be set on the TT object.
> Yeah, this patch is OK, but the way the follow-up xe patch uses it is
> problematic since, AFAICT, xe dma clears on alloc, meaning the pool
> pages are not cleared after use.

Yeah that is clearly invalid behavior.

Regards,
Christian.

>
> /Thomas
>
>> If one device clear it's pages and another device doesn't clear it's
>> pages then we would just clear the pages of the device which doesn't
>> do
>> it with a hardware DMA.
>>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>>>    include/drm/ttm/ttm_tt.h       |  6 +++++-
>>>>    2 files changed, 16 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index 8504dbe19c1a..935ab3cfd046 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
>>>> *pool, dma_addr_t dma_addr,
>>>>    }
>>>>    
>>>>    /* Give pages into a specific pool_type */
>>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
>>>> page
>>>> *p)
>>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
>>>> page
>>>> *p,
>>>> +			       bool cleared)
>>>>    {
>>>>    	unsigned int i, num_pages = 1 << pt->order;
>>>>    
>>>> -	for (i = 0; i < num_pages; ++i) {
>>>> -		if (PageHighMem(p))
>>>> -			clear_highpage(p + i);
>>>> -		else
>>>> -			clear_page(page_address(p + i));
>>>> +	if (!cleared) {
>>>> +		for (i = 0; i < num_pages; ++i) {
>>>> +			if (PageHighMem(p))
>>>> +				clear_highpage(p + i);
>>>> +			else
>>>> +				clear_page(page_address(p + i));
>>>> +		}
>>>>    	}
>>>>    
>>>>    	spin_lock(&pt->lock);
>>>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct
>>>> ttm_pool
>>>> *pool, struct ttm_tt *tt,
>>>>    				pgoff_t start_page, pgoff_t
>>>> end_page)
>>>>    {
>>>>    	struct page **pages = &tt->pages[start_page];
>>>> +	bool cleared = tt->page_flags &
>>>> TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>    	unsigned int order;
>>>>    	pgoff_t i, nr;
>>>>    
>>>> @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct
>>>> ttm_pool
>>>> *pool, struct ttm_tt *tt,
>>>>    
>>>>    		pt = ttm_pool_select_type(pool, caching, order);
>>>>    		if (pt)
>>>> -			ttm_pool_type_give(pt, *pages);
>>>> +			ttm_pool_type_give(pt, *pages, cleared);
>>>>    		else
>>>>    			ttm_pool_free_page(pool, caching, order,
>>>> *pages);
>>>>    	}
>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>> index 2b9d856ff388..cfaf49de2419 100644
>>>> --- a/include/drm/ttm/ttm_tt.h
>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>>>    	 * fault handling abuses the DMA api a bit and
>>>> dma_map_attrs
>>>> can't be
>>>>    	 * used to assure pgprot always matches.
>>>>    	 *
>>>> +	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
>>>> handles
>>>> +	 * clearing backing store
>>>> +	 *
>>>>    	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>>>> USE. This is
>>>>    	 * set by TTM after ttm_tt_populate() has successfully
>>>> returned, and is
>>>>    	 * then unset when TTM calls ttm_tt_unpopulate().
>>>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>>>    #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>>>>    #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>>>>    #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>>>> +#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
>>>>    
>>>> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
>>>> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>>>>    	uint32_t page_flags;
>>>>    	/** @num_pages: Number of pages in the page array. */
>>>>    	uint32_t num_pages;

