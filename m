Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C75C7A930
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4128D10E2BD;
	Fri, 21 Nov 2025 15:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BdeVwb84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582A310E161;
 Fri, 21 Nov 2025 15:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtJeXuogYqVIuPRbK3LuHKWZYW2zDOQlrXRNN8xS6kfTEkmjzDSkTxFBMhPZznGtNsU4t6uuqQhbDPt3AVAHywxs4q7EsPRrIHS5FfygyxXRoWOwU1WVBx+Pss0dTojkBE1K7v176HnZF0K8Yj+XcxcwQCdGE9v6Haxor8enja748FkutORtBtseMQI0DDyrnVr2BV4BqNLRaJbc36eZwQwS/RXWv1Crpx3BcbcNdi/hpK1+biv26S/wBm5SUNhLBqhFTtrkcQFdqUNzBkNt7ugAgR6G/UuIHvDuC/6O3aXotYIdGyCz57ea/D3J6HklLx38cgzejY+k6qEy7hzwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/1g+4wlFlwlmvP4UZJnhE0u9Fb676MKO7GAz3LjoQY=;
 b=d4j3eyY4YKEiAkguzgNuiKSoDKbvzTrbFqNCfJpNhj3MWE4p8zf+bNghjDjHeixMVWAPBAzj9lykkOepoAr2OvPCdmo0kLM8a1tYEmi+47209mPSRPc24EykRENeL/XCpGCkVFhJu9Z+Mwz9fMoVdT7PwFnv9BZZVVRIm8UB2RaABIyOhEPffVj3zS96LvC68TaMkQ8SiBFEem1ljfOtWbw3sYMLS5XktuiLSubuVG4cKgV6rNx4/VhQ1sDaz3rap3WfXsUvCz8NFeOfKeboaNv0SaXqD467MF+a7XG+r2IcKhlPOCtv7SJ3rMO2MBRyG8SyzycnSiO28zN6ifiDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/1g+4wlFlwlmvP4UZJnhE0u9Fb676MKO7GAz3LjoQY=;
 b=BdeVwb84MnYe1oB8QdBllUJooc3Ar80MYNN+sBh5HeJf9OVp0WdAXYvqe4y5eOSu7h/4ZYgvGU0Ki1HAgL6VdOpGi1kBosucprvX4PgK71Sp/7ejY+OqPOfDsDhXo5/WSQED8rZkueCxIq9BvreMAMfIxacifyOIdTkIi5Io5fI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:34:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:34:44 +0000
Message-ID: <e49d4b75-8054-42c0-a8e0-f0d8bafdeec9@amd.com>
Date: Fri, 21 Nov 2025 16:34:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/28] drm/amdgpu: allocate multiple clear entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-21-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-21-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: b679423b-5b39-4f0d-06d2-08de29137e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODAzQ25ZUGRlblE2Y0U2V20xZm9EREo0WTlQOGJiRGQyMWN2OHl1TVl1d1kx?=
 =?utf-8?B?bjdVQk5ZUUpUQ0QzVGRsSnQxakJQT0ZzamlnSU1MZnhsaWFWWERObkZoSFlh?=
 =?utf-8?B?M1BJbXZLdlIvbXRiVWpmamt5aVc1ZTRqQ2dXN29JNjJ6ZEI5MGpwVHl5bkJ1?=
 =?utf-8?B?OVRVYzI2VElJU2VmSExKTUl3TFRlVVp1SkdZcTNGcHYzd1ZZeUY5SmhyZnZT?=
 =?utf-8?B?WGtpeS9BZmpZQjVMZ21QdWdZYXRnSU9yTjZTV1F1dGl4UnJMeGRybW1qNS9Y?=
 =?utf-8?B?SHJEaGVzYnVzVE9ZcStJK3dNS1JYeDRjV1Y5YUNsUkxYK2JGcHRmSVJQYlNv?=
 =?utf-8?B?YkFnMXR5a2hCcEFyYUFremdSU1JiZ2dmT2lHekRBcUxEcWl5bUJ2YUdvWHJz?=
 =?utf-8?B?Ykw1VDFqWlR6Q0xBZDZmSjdydWpIYTc1SUpiVEJHSytZaVRNZ2dnWEtRVHNk?=
 =?utf-8?B?RUtGNWVQN0VXV1ZyN3ZvTkw1OTJod3RIU291TW40bzRhZHhJWkM4ZnpLY243?=
 =?utf-8?B?SVB3cWI5NTU3WXhKK3ZrRG16cHQ3QkYwWVMxREc3NjJtVUpXZ2pnZ1h0MmNK?=
 =?utf-8?B?MnRFN1Jid25aaTNZcld4ckdldGF3cklXZEorcUoxcE9HYXNmTDJ2NGVsYTBQ?=
 =?utf-8?B?NzN3VDhuY3FNSExBTjE3dVlIdjZoM0FJVHc3SnoxMVlKcFZIQjdRTXpOV2p5?=
 =?utf-8?B?eUs3ZG5Ub3RCUmk5MVJxQWpIZ0Jva1dEOWE5Qm9tcWh1Tmx0YmtYR21IVE4r?=
 =?utf-8?B?S3R3ak9qU2ZhU3pNQ05hNGJnMEs2aG1ZMmlMcS9pV2I3N244RDRXZ0ZIaVN0?=
 =?utf-8?B?YWZqd0ZiN25UTlBGSDdqS25PQjVBMGR5aURuREZBTnl4NVpXQVpXM3dCY1RQ?=
 =?utf-8?B?ZUZaMnVzZURCd0pkNVJTbGFnWW1mdS9IRjYwU3diWXFpKzVadUR3V0tmVTIv?=
 =?utf-8?B?TG11OVc3NkdveUlpd05PS3d6QzROTEMxcjRGd3I2NjRpQzNlQnV0K3JTaE4r?=
 =?utf-8?B?SlR1YlhTYUxiQ2RWdnh2Y2IxZnR3T0Vva0ppT0FXdU9iVjdUNlQ0aHh0TDFx?=
 =?utf-8?B?THJnWEl2WndqRjhnSnJlRzViQmVlQjZmKzRJUDJ1K2tiQWZXLzZUZC9RY0sy?=
 =?utf-8?B?aHorVG9FZC8xRy9GVHlHU3ZmeFRSSG8wazJrSjlGaW4vUGxQdlVlYmJRbGVv?=
 =?utf-8?B?d2ZHWThPbWVPQ0tqYjd5Y2hoektzZjh5MHo0WHRLaTFxWm9TS3R6V2xZdGFy?=
 =?utf-8?B?VGFaaDVwSG84dnF0OXM2TXpUdlBTcnJvekkyWEJ1VFFZdnQvckRVVTRYM3Vh?=
 =?utf-8?B?ZnQ1SFZLMWpoL2hucGhxZEpjNUN6WUJZZkc0aVhKeGt0UjlxemRWOEN6SEl2?=
 =?utf-8?B?dHlQTS95b1RsbHgyQXRmaUpDcGRsS1czUkZFS0VLdUltNG4wMk9leS92UGdq?=
 =?utf-8?B?cDRCTU1PUEJ5VEsrZ054RHdZVUtVNU5RSXR2MkRXZnFaSUoveTVXSlVtU3dy?=
 =?utf-8?B?cTdsakxlNzlLRis5dHhjT25vVHp3NEVmdWdjREtzWGRwOUp2QXlaZDZhYk5F?=
 =?utf-8?B?RExpclpMSGRtaXNMWGFxQWhTa1JmcVpVYlB5L1RUMis3WW9ybFVFQ25IM2Ri?=
 =?utf-8?B?NmNvZnRxUDUrUFR6T1JzcEVzUWVkYlJBQ2U4WlA3WlNSaFZkdzhPcThqU2Zz?=
 =?utf-8?B?UVFPcExvK080N0pNTUxPaC9halNOU0tySXdrRlRYNGl1eWpTaXozYTExODhw?=
 =?utf-8?B?aDNuTTZ3WHhteTF0bTRhTW0zamtLUGl5aGczZ2tKOStiS3R1c2IzZGFqRTNm?=
 =?utf-8?B?dFdSOXR2aE1SWkxWVCszeHM0eWlnTXdKeFV1SWwzWWtQenRVK2h0MGVjemNM?=
 =?utf-8?B?bVZWZzlvTDF3RGtPa1ZsRHc0Y1RoaFFINFI3L0hMdzVnTnQzQ1M5S1JGUEFH?=
 =?utf-8?Q?bVpVj/K6yTfn/4c3NwwY4xCKTF6hp/wY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExLKys5NjlsOFp2OTFqZGlrdjdhMTYxYWxPUXhBeWZXeE5RZjhUeWpJZC82?=
 =?utf-8?B?dlhGR2V6eW9uSXkrWU50SHhhRVQ2RzFYaEZidGFwREZUWHp2Y3ZrdStiMjd6?=
 =?utf-8?B?ZkpSRW55OGRpK3k3Q2U5Z2RrYStyRlpLSjdOVG9obFhpTXBTOU5pMEgvbStT?=
 =?utf-8?B?RjdEMDdXT2hlYlIrTjNPQjhsSjNKYXdHeDlUaWJPTnBtdndIby9BTHdsZjMw?=
 =?utf-8?B?alRBRlp4a2ZkQnpYNGNaYTVaSjFpSnpnZElyczhVaFVrWXozYWhQNVhlR0U3?=
 =?utf-8?B?QkI4dEpJK2tvWW51Zkw1anlUU3lOZHpFaXhCVGdwZWJ3UXBHa3p4S2RkR2RN?=
 =?utf-8?B?YnJocThzclZZY1lxSUtNSDI4UHVyTGphWTVGS2x5QU95UG9ORjVkNzFLRkR2?=
 =?utf-8?B?NEsyQk9oUlJySkxXczVkMEU5OW82ckhib0tETEd5T2VPblZKekxUdGlDSDMy?=
 =?utf-8?B?SVVvN2hTNmdvbWpJRXZVMmxyOTNtelFrUCtHNFMvSGp1MmpGT0NYeEdCNHQ4?=
 =?utf-8?B?UHhjT3BZNHpjZWJqbnBQdmpOc1J3YmR1Y1lBZzQxR0pjK3lmTERrM2tpUEhI?=
 =?utf-8?B?bm1JVlMvZVVQdXB1NzlFVmphbEhjZnZhVlU1aEU3Zm5Qd056dHdHekQ5eEJv?=
 =?utf-8?B?blRJZXBjNGFad1V4MktRRjB5ZnZvUDlyVzA2TFpaUWk5cGF4cy84MnYrUVJT?=
 =?utf-8?B?MkVtMGVPenVDY1E3TjBJMDFSZ2crTmw5TktEOFErK0E1Yy9DMU9PYmNXbDFa?=
 =?utf-8?B?QnZXSUFkNzQrN203ZTQxV05lVEI2RVB6cHZNcFZOT2tPaytMOUdOQU1lSmxX?=
 =?utf-8?B?ZHNWaHo1QklXb09WZ3BBVUFmamEza0pJdExZbFR2YS9kNm42aldTZDJDeWo2?=
 =?utf-8?B?ZVlVQ1ZtSFZrY1dtR3BNdXgrWnYxMmJnSXhXbkcxOG1FaytONStwY3Mxa2oy?=
 =?utf-8?B?N3JObTd2RFJsd0s3d1pZbG9XalNvd1VBMmtPSDVaT3BHb2FGUDBkRjB2ZXJK?=
 =?utf-8?B?UXVoVWFoUWtJZFRmbklLQzF1MkV3TjhsQ0lMTzl0bW5SRkdIS1NxcmNoOTN3?=
 =?utf-8?B?L0N4TmtaOFBpTU0rcW9MMnR6ZTBCS2pBR2JDV3l6V3lWbm9sbFJiTUptcEFt?=
 =?utf-8?B?N1V0S0dBUUxXRGxITDRRZnhKSG40c0IvOVJlamhnK1NYaFNwemJPVWlkeWFP?=
 =?utf-8?B?bzE3VGtPSTRHaUxaZTAwUUlyZHhndkN3eS92MC8zYjdQempxUUxhcm5CcjNO?=
 =?utf-8?B?RVA4RzhsUTlDdEs1Q0I2SzF1WDZVTXZuMkVoY3ZYRUJjTVY5VFhjVXd0L3R5?=
 =?utf-8?B?aXUxNlFjNGZRUGZ5b3R6ZG5SUTliWFJIVW1kL1A0S3F4N2UwQ0lhaE5NYmRS?=
 =?utf-8?B?OUtqN0VKUk1vQ1BwbHFsWnAwLzBlTjA0M3k1SUVhVTVEaXZ1bGdMS1dBVGU4?=
 =?utf-8?B?YUxpNlg2KzZQdEYwWHhsd3ZXb3F6dGswQ20yOHl3dnFyWkQ3eWFTM3hqUU1Q?=
 =?utf-8?B?WDVZaFRqNXlOTVlBV0ptWEZOeXhlSTVsTkp0VmZNY0thK2VzVGJSVGwzNUJR?=
 =?utf-8?B?cFFNRVcxUU52b1RsOGp1Uzk3WlVCZFZPODZxMy8yNDBvbjZkcVN3OWlNYTc2?=
 =?utf-8?B?bnNpYzNzM2RPaUlFUW5DZGU5SWhGRjBjV1ZRTHo0SC9UcVBaR3E0OHNjTyt6?=
 =?utf-8?B?WnRQZ3JCQnpwdldVdmFnSERHWXdwQWNUVXhvaUJHUlQ0ZVA1QjcrMWJpUnZm?=
 =?utf-8?B?c2F1OEVJbVQwQXp2ZkRpS2lVSEdZMFBPMjFQR1ErQ3BKdTdlbXJ5MGRVRld6?=
 =?utf-8?B?OGFKYjNKY2VBY0RVY3BwT2dmSjVmRW5XNnZhM2FaOGprREd2RTZUUE80L1Zh?=
 =?utf-8?B?YVVITlY2ZE93NDgyRDVQU2ROcHBSdCswRWhLOWdpb2FXeGZoZ0tlRkhyWTZZ?=
 =?utf-8?B?azhFM1VPemtSVlVyUXF2Zk1ub0pOS0hVdVFGNFFwTzFUc1d5MGtMZ0s0czFX?=
 =?utf-8?B?R0V1d1h0NC9UR1ZBZWR3U1ZEbWRWUjhXYkxqTGVKL3JBWC9DVUtHSGVQbmRz?=
 =?utf-8?B?czVwcVR1cDJ2T1lNZ0ZTbXl6bmhVY1NzcjNRenc0VzNId2ZKcmU1dmVNc3l2?=
 =?utf-8?Q?5oCmJ8sfNsqvHbZesuhMwW4CJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b679423b-5b39-4f0d-06d2-08de29137e7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:34:43.9880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CE0UVOtwUkfOemlbhCldwuq73IrKO9JnRCNwWk1wok8KeM0GMoqMbjT6VWX7Jbyx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408
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



On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> No functional change for now, as we always use entity 0.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 51 ++++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 +-
>  3 files changed, 35 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 2ee48f76483d..56663e82efef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1323,7 +1323,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  		goto out;
>  
>  	r = amdgpu_fill_buffer(adev,
> -			       &adev->mman.clear_entity, abo, 0, &bo->base._resv,
> +			       &adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
>  			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 9024dde0c5a7..d7f041e43eca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2224,10 +2224,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>  	u32 used_windows, reserved_windows;
> +	u32 num_clear_entities;
>  	uint64_t size;
> -	int r;
> +	int r, i, j;
>  
> -	reserved_windows = 3;
> +	num_clear_entities = adev->sdma.num_instances;

Actually each SDMA instance has two ring buffers.

Additional to that using adev->sdma_num_instances is a not good idea here. That should probably rather come from the copy buffer funcs.

Regards,
Christian.

> +	reserved_windows = 2 + num_clear_entities;
>  
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
> @@ -2250,21 +2252,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  					  1, NULL);
>  		if (r) {
>  			dev_err(adev->dev,
> -				"Failed setting up TTM BO move entity (%d)\n",
> +				"Failed setting up TTM BO eviction entity (%d)\n",
>  				r);
>  			return 0;
>  		}
>  
> -		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> -					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					  1, NULL);
> -		if (r) {
> -			dev_err(adev->dev,
> -				"Failed setting up TTM BO clear entity (%d)\n",
> -				r);
> -			goto error_free_entity;
> -		}
> -
>  		r = drm_sched_entity_init(&adev->mman.move_entity.base,
>  					  DRM_SCHED_PRIORITY_NORMAL, &sched,
>  					  1, NULL);
> @@ -2272,26 +2264,48 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n",
>  				r);
> -			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
>  
> +		adev->mman.num_clear_entities = num_clear_entities;
> +		adev->mman.clear_entities = kcalloc(num_clear_entities,
> +						    sizeof(struct amdgpu_ttm_buffer_entity),
> +						    GFP_KERNEL);
> +		if (!adev->mman.clear_entities)
> +			goto error_free_entity;
> +
> +		for (i = 0; i < num_clear_entities; i++) {
> +			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
> +						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> +						  1, NULL);
> +			if (r) {
> +				for (j = 0; j < i; j++)
> +					drm_sched_entity_destroy(
> +						&adev->mman.clear_entities[j].base);
> +				kfree(adev->mman.clear_entities);
> +				goto error_free_entity;
> +			}
> +		}
> +
>  		/* Statically assign GART windows to each entity. */
>  		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
>  							     0, false, false);
>  		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
>  							     used_windows, true, true);
> -		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> -							     used_windows, false, true);
> +		for (i = 0; i < num_clear_entities; i++)
> +			used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entities[i],
> +								     used_windows, false, true);
>  		WARN_ON(used_windows != reserved_windows);
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
> -		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.move_entity.base);
> +		for (i = 0; i < num_clear_entities; i++)
> +			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
>  		/* Drop all the old fences since re-creating the scheduler entities
>  		 * will allocate new contexts.
>  		 */
>  		ttm_resource_manager_cleanup(man);
> +		kfree(adev->mman.clear_entities);
>  	}
>  
>  	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
> @@ -2456,8 +2470,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>  
>  	if (!fence)
>  		return -EINVAL;
> -
> -	entity = &adev->mman.clear_entity;
> +	entity = &adev->mman.clear_entities[0];
>  	*fence = dma_fence_get_stub();
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 0b3b03f43bab..250ef54a5550 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -72,8 +72,9 @@ struct amdgpu_mman {
>  	struct mutex				gtt_window_lock;
>  
>  	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
> -	struct amdgpu_ttm_buffer_entity clear_entity;
>  	struct amdgpu_ttm_buffer_entity move_entity;
> +	struct amdgpu_ttm_buffer_entity *clear_entities;
> +	u32 num_clear_entities;
>  
>  	struct amdgpu_vram_mgr vram_mgr;
>  	struct amdgpu_gtt_mgr gtt_mgr;

