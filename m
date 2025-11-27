Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E6C90219
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 21:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB16710E87B;
	Thu, 27 Nov 2025 20:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F/+r/G8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0EB10E843;
 Thu, 27 Nov 2025 20:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKhp/N2ISTlo2CqW6/b2+fYyUBkzRkho4REFSwGP7EDDAIXmrAsjzHW2ub3lfmTXy1U3aeMUkai1+W++217JrhFO4fEY6+qWheMPdsyjLGmQjBBILjlY1vaMpmNux6J/xzoGSqNSbXryvDvXrB0ZWWfECgagPW6hZGEiVqEF2FyBgSj4lgPSXxiYM7xA5ugkSdQFrSdFZ0ydx08BHIRS0WuWt9fDrib2ZpKQR9oTPBQQH5QO93ytfD2t+zL8UdtMcMPdoVTdUT7W0QO7xHzzZHu7ucBh6yqySyZb0X6E1YGlHApTsXMs+rQnSJ1QBMwyv+IYNUzBXdipbsy8RF+gjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RceAqitR7wdDgutO6izU2dohMJiEpAlxU9EkMhm7FsQ=;
 b=Xno+bFK3vbxQk1W8Hie5oLQ5ANjRbwRbcxwxK2ifXkcODv1YdTDvFiAh+Al1JRednfiMriNFUiV0H2QC6K9RUxe0LnPHGz3ki+AB+l5byei84jjhYOkC9I89FBqGhRjhUXGpzdXXAw2dLllrJNBtCaLy9OoOXDQN+ww7wYLB+4lRHXFW176TroPsBKD7yQ2VdDWTLSSopdEWLhONs8LqSk51+UPPwix9oLjDlGn/Cd+ezdIpA+xFyroV7Nqt1gOTc9EPVf5yrr4MX1xyyYF0Oi2tl/S35wjVD0DxQ9uNtMsmwPU5Hr6qtgIlHnXlqgxy5DnH7BHE3Eq39Z3PpWJ+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RceAqitR7wdDgutO6izU2dohMJiEpAlxU9EkMhm7FsQ=;
 b=F/+r/G8TkvnDdRRp/eX1i0nYopEaHJ9JtOQGHru+ecWH3iLW0VjXoIJfugEuG2e/49Q58w1S9JcKcq7ADD6dEcBjtDQneUzX1LqvE5FGZ18oo9CMQCNl9nRLiQvKHVJfdlKQqwQuxC7eCyVMWnomBlrH89Gz9Kct9gHV14JgvVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA5PPFDC35F96D4.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 20:40:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 20:40:00 +0000
Message-ID: <2a918940-700d-4b24-90ae-4d9d4f9b457d@amd.com>
Date: Thu, 27 Nov 2025 15:39:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: use DCN10 CM helper for plane shaper
 func translation in DCN32
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20251126005608.37513-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251126005608.37513-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA5PPFDC35F96D4:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c3cdd8-8b49-4947-f7f1-08de2df52211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVdhTnp3WjBsMmVZM21kRnpqa1N3Nk5Ia290bnR6Wm5wZGd1RGJ4amZ2T3pt?=
 =?utf-8?B?THhHb2M0M2ZWMVFpdk1McGFTbE9OM0oySzU1a1J1Szc5SlJKaXlwM24vTmlG?=
 =?utf-8?B?Q3VuS2VPSGh6R3RoWUNPdzhzWkF1bVdsd0tkNjVRRnZOZ2lTTmx3c0NmU3RU?=
 =?utf-8?B?TmtOeXBjMGJxT2pFWjlVdmp0RVRKbURFejg2UWlDbjNSVTA0TVBrWmpKM0lr?=
 =?utf-8?B?Z1hmalI4bHR3dS9lYklmdWU4UXBpeE9CQWtHL3lPRG1kc0Y4S0NOVUpwRVJI?=
 =?utf-8?B?Tm53YmRYR3o1dmhxL1Q0aFM4YTh5NlZjQk5JTFRWY0tNMUhSYnZxRzF3aWY3?=
 =?utf-8?B?SHgreTFWMU9NR216VWdoM09HanBKbGNxRmRwZ1ZZNUZpMURlQXh1RmhjSXYr?=
 =?utf-8?B?cnNOS2FIckRrd09yL1FXbFdqdU9taFlwVDFYcE1WcFFBTW1VM242NzEwRURv?=
 =?utf-8?B?UlJoVFlFSXlvejI5cHc5enQrOGR1R2hWR2lnWEsyK2JGN3E1WmZiNjlobjE5?=
 =?utf-8?B?SHBSbjIrNDEzdEoyZ0pYYW9nYVpZdWhiNGNld0pDK3BVM0xTcUJRRmh0Ykpl?=
 =?utf-8?B?eG9MUWRNRDdXWVVXQlNuUTlFS2RxaFZIZXh6bWRDYng2Y2p1Sy8rY3lhZ3dO?=
 =?utf-8?B?OVNlYWc5R0dZVVh0UktRNm95L1Q0TkkwSkFWTEZaYVFhajh3cHlkWmpNQXlD?=
 =?utf-8?B?WlI4aDJzazNVUm5JdnpoR1pRVFdNVW9NVGc5SzEyQmVUbGg2YUt1dzJQMjdq?=
 =?utf-8?B?SUpMV2tYT21sbTU2WEpDcUhFekZFa0RmeUN2U3FxdXNyNFBTbVh4MmVyNmh4?=
 =?utf-8?B?Z1B4cnFKbHpWdzZuelkreWlyVVh0NXh4TkR6OC9nUkF6NE1KU2xkUjltZWcw?=
 =?utf-8?B?SUMwaEpySFpra08yNTJKRWg5b3l4WmFJaUZrdXpTM3dLaE5CNXFaREJya2VC?=
 =?utf-8?B?NDRoRTBaUXRjTjFsb1Q5WEwxUHg1aTMwRVdvZ2tKalR6U0UyV2hYK2E3MmNL?=
 =?utf-8?B?cXdTZkZBbVFwQm9rK1JsWnlrazlVZGpoenU2c3BuZjZwanRKOWYvcjZYb3BG?=
 =?utf-8?B?YlF0Y2Q2ZDVJemlTQUk2MisybUdjTjVLR2tuUUJHbmNFSndwZGxmTDdZL1Vu?=
 =?utf-8?B?VTg5UzhYdUZMZHZKTUlBbE1hUXYzT3ZQODRrWEZqSURQMm9sRTY2a1ViTEVq?=
 =?utf-8?B?azExT2FHMzFYZDJPdVEvdW9tVndJQVphVzQ4VUxqcHY4SUx2dy9JZXRHb0Nk?=
 =?utf-8?B?ZHBZNzN5YmswNjhXWm1ZZ2NDQnRqeDl1YTJGK3pNYU11OXU5VjM1ZDBuelYz?=
 =?utf-8?B?NjRqdnZKTmVma0tONkZDY25aR1pBdjNLMlk5dVVxSTY3c0RDdWhjZmNsbjJl?=
 =?utf-8?B?SWsrNzA3UnpiNnJpUzhqOElvWDBTZTJzTnlFaVpZZGd0a3RoMUtacHQ0Z0Fq?=
 =?utf-8?B?bjlpN0hjbEZMVXNQK3YzVUdqRWtQRFFCU0gzQjdQNG5sRWhFK1FnSHd3NjUw?=
 =?utf-8?B?cUNRNHgzd1drc1lPT1pPR1JkOGl1WnNrVUFUYmZablpuMnFrVTA1N1RHVENY?=
 =?utf-8?B?Mkp6K3BPdG9MeVJzaTZtakhYQmMyLzZkSGorLzdGSnEwZlFDc3ZEd3JBQVhO?=
 =?utf-8?B?bENlem9NL2pOZDRJZENlZ1VQT2MrQlBLQjVDbXVHTi9sekZiR054T2NPZTY1?=
 =?utf-8?B?SFBzeWI4YnJSRVhHamdTMGdDc0haSVU3ZTZDN09wdm0zL0pndEw2bUJMN3F2?=
 =?utf-8?B?WkxCMmRXNzcyRUJvbmdYV1RPbUtGNG0zdzVNZmpodXJJZEtkQlMvTW5paC9T?=
 =?utf-8?B?Y2s0R0RMV3ZxbEZsbWFTVHNnR0Q3Nit6OXRSbGQ5alBscEx4RnNSK3JjRUJM?=
 =?utf-8?B?ckpzcjd2QTZFZ2h6YXk3REFFeWNMMm1aejJNK1Y1NmVmMTJTN0RxZUlYcXlP?=
 =?utf-8?Q?/5dgm3cUIPsOfuQ4iUCWmFyF2061zgts?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDllSFE3bExhazVqNDY4TGhIRVBGaHRPb2FQNUs0RDhGN0FHSVppV3I3cGlI?=
 =?utf-8?B?S1BDTGFIOEVpUlhrSWxkQXhpOUxxZHVoejQ3RWg4STRETFNtRFJSY041a3NU?=
 =?utf-8?B?ZkZ2MThXYzRLYWt3T3lOOVYyeEZqRTFxSXhQWCtRT2p5ME5uYnVNcHlIem9V?=
 =?utf-8?B?TytEZWYzVWZwY3hudW1EQlVWd1dML0ZubTBnMmdPNlNqVWVuTXp3d293bXVp?=
 =?utf-8?B?cVAycHJkTGV1aTRyMmdMQWJwcUVNbGhNdGpaRzFDblk5OTVYL25uaGhEbDdi?=
 =?utf-8?B?aXNjRlFic3NmN1h5blgyelM0YlVUa2Q1dVdwZFo5TDBDd3FXaTlPZCtGNGpM?=
 =?utf-8?B?QjQ1eEpEamFlSmxUTmJIYlYrekFQZDRad3MzWXVaSkJEdEJ4WDdPbEs3Z053?=
 =?utf-8?B?K2hrVFdHNU5xTTBhc3pDc0U4TDBXRFNkWiszMlpVeHM0WGlHU1BFbkZrU1J4?=
 =?utf-8?B?dnIyRUs3aCtNL1JMR0FIYkd0amJqNktwQ2ZOeEZsTkluRnFqT3YzWS9mTU80?=
 =?utf-8?B?eFJGakpuMCt6bUJMeVkzTEFJa0xmRTlFMGVCdFJJMVNpNmttYndaZ0pVOWRm?=
 =?utf-8?B?UncxcW5EMjdyblFETWZuUnBGYi9OTDl1NEpYZUFVUkhYeHc1L2hIaEdEL0RF?=
 =?utf-8?B?VlNZSVpyZm16a2I4di9uSW9vMjlWYTBPbkFSMzVZMXVZUlE0SG5JRTZJMXpv?=
 =?utf-8?B?Wk5XbkdBamdGNGxYLzBoWGZYbGd0eXF1aE5vOUVQTnQ0Zm9YNjQza3I0YndB?=
 =?utf-8?B?NUNCbUpOQXZ3V0c1ZG83dXFXbENweWRQOHRmazBVNmN4b1h6S1ZOdXMxQ0pa?=
 =?utf-8?B?ekN0c0ZjTmlpMXMrcnlDNE5JbkI5b0QxOTFLZWlicDRGaEFHZmhjQzVTaFp3?=
 =?utf-8?B?Q3ZSYlYyVlRYMWFRbjhXSlo1SnppbVJ1TFNobnVHTTIxWTR0WE5LY3EwRXZn?=
 =?utf-8?B?dHRET2FDUE9FRmpnSko5RlIxb2h1R0tWaitHamRpRkZkbktLT09rMU1aVUpz?=
 =?utf-8?B?cERSSFZNYWZrSVFqQUxLRXpxQ3F6bDdWam1GNU1PMGpiM3ErUFZINm1hTlZ2?=
 =?utf-8?B?QURaa2ZBTTI0dk1XNjNESy84MEJIR1FCV2JZNlU5Vm9icktvd2V1OTVRMnk2?=
 =?utf-8?B?aEdoc3ZJaTNDK3FvNjk3cVZJdzl6aVVkb09oQmE0ODRTTHRvdmpIbWhOeVZ2?=
 =?utf-8?B?Y002Mld0L1o4UENsQkZXQXNRK2ZnNWFxT0NJb1ZUUjdHemNxWnhSdVovK3Jv?=
 =?utf-8?B?NHRxTDFFa1krMVdDVHFzMUw5dGpaKy9PZHRrQUozV1NUb1NxaFdtNjd1ZHV5?=
 =?utf-8?B?OVl4Q1NGSjJ6b3V6OWhPZTV2K2VFVDZDU3A1TEJuVzJsMkV2N0hpSWtrNTl1?=
 =?utf-8?B?V3Z6SVpnU1daMFlEeEo4a2o4ZWJUdzJpT29NbEpIalU5ZitOK3NoOXZneGpX?=
 =?utf-8?B?Nkl3N3lKY09XdWhzWC9SUytMbjBxNWVyUzFDQ3pRbUphSjJHZmdpd2RYLzVq?=
 =?utf-8?B?TS9jS1dSTlJEZ05jbEMvKzg2MlRBR0JTTDI1NjJhNEhHYUh0bGRMM2NLZWw3?=
 =?utf-8?B?K0x2cTQ5OUZGb3JOdFljRzM5QldVK2pVY1ZaTnpXSUw1dkNWK3lHRHF2eWZH?=
 =?utf-8?B?OWdWYUNBMS95cEN6aktlWkJQdlVjVU9tRk9yVG5BaW9TV3B3TUZobGxZTHQ5?=
 =?utf-8?B?cEFuL0tZUVp2RXUzbytjZlpwVGQ5VUNEVVdEVXFFOHpubU1EZmRJcEhNckZJ?=
 =?utf-8?B?VHBIZE1DN04zbllIeCt5NGZ3aWJ5TDc2KzhLQVFOSHV5WStndmhjU2xlSlRw?=
 =?utf-8?B?R01WUVZVSDd5SDFQMktDU0x1aGs1K3BiWHpib0tzV0ZVRkpDN3FURDA5NHJh?=
 =?utf-8?B?L3YydmxQd1hKK0JYVmZyYUZ5Wko5YklVZkljUlRQZElzdlhvejBIL3J5MExZ?=
 =?utf-8?B?RDB6SndRZHovcXd1aDI5TkRGcE9xVTM5N0dpZVZEaUhjcFpwMHAvUTd3ajlh?=
 =?utf-8?B?a1FqMTd6aWdCMU1QWDBPU243MWhxdW9LVjhhZ2FTYWhTbUlYVzhQS2pmYWVQ?=
 =?utf-8?B?Z1dxbDVldXBhMVk5YWFHMmJoZy95VHpwemYwUlR4ZEdML2QxY2dKUElLdEJQ?=
 =?utf-8?Q?V351I3hR9FOpK8Av11Ri92q/j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c3cdd8-8b49-4947-f7f1-08de2df52211
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 20:39:59.7575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUnoHEb8TQ+NgDmYfB9ahLmj8KCzyA9BcrfhyRc4wfszj3PxEEeaZi7Aw7N67C53zkTCHCOY6+7VH8oihM83DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFDC35F96D4
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



On 2025-11-25 19:45, Melissa Wen wrote:
> The usage of DCN30 CM helper creates some unexpected shimmer points on
> PQ shaper TF in the steamOS HDR color pipeline. Fix it by using the same
> DCN10 color mgmt helper of previous hw versions to translate plane
> shaper func to hw format in DCN32 hw family.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> Hi,
> 
> Commit a953cd8cac6b ("drm/amd/display: Fix MPCC 1DLUT programming")
> mentions some visible artifacts when using DCN10 CM helper on DCN32
> shaper and blend LUTs. On the other hand, using DCN30 CM helper creates
> some shimmer points on steamOS HDR pipeline. We didn't noticed any
> visible artifacts so far, but I'd like to know more about what kind of
> artifacts were visible at the time this helper for shaper func was
> switched in the afore-mentioned commit for further investigation.
> 

Thanks for the debug.

Do you have more info on the unexpected shimmer points with SteamOS?
Ideally a video and a description on what to look for and why it's
wrong, or a comparison to a GFX-transformed example that shows the
correct visuals?

Obviously we don't want to simply switch back to DCN10 helpers
without understand why, and potentially regressing other use-cases.
At least we should look at what the differences are between the
two versions of that function, and which part of the curve programming
causes the undesirable results.

The original bug that was solved by that commit was a regression that
sent bright values in an HDR video to black or red, so basically
something really messed up bright PQ values. At least I suspect
it was a PQ HDR video. The ticket doesn't state that.

When looking at the diff between the two functions I notice that
the cm3_ version is missing the dc_fixpt_clamp_u0d10 for the
delta_<color>_reg assignments, toward the bottom of the function.
I remember I had to add that to the cm_ version since it caused
issues with SteamOS HDR. Can we try that on the cm3_ function?

Cheers,
Harry

> Thanks in advance,
> 
> Melissa
> 
> 
>  drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> index bf19ba65d09a..a28560caa1c0 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
> @@ -501,9 +501,9 @@ bool dcn32_set_mcm_luts(
>  		lut_params = &plane_state->in_shaper_func.pwl;
>  	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>  		// TODO: dpp_base replace
> -		ASSERT(false);
> -		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
> -				&dpp_base->shaper_params, true);
> +		cm_helper_translate_curve_to_hw_format(plane_state->ctx,
> +						       &plane_state->in_shaper_func,
> +						       &dpp_base->shaper_params, true);
>  		lut_params = &dpp_base->shaper_params;
>  	}
>  

