Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0689F9C8DC4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839AE10E1C4;
	Thu, 14 Nov 2024 15:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DpETuFhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353BF10E7F5;
 Thu, 14 Nov 2024 15:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLpBkr10pSu6Xwiw+m3K9jX8PAnRYR3R612p9yuSh0DMYrBYbOAiM+zpvueCE4zPMdOSTQ1YGii8YryeTzGy9EulkqTfOKMeX3ncPmgLuUFeNBbBhFq9X6BKMmFwiIuNXF988IEZCseQFSKVOUYgPn3jjVzJLcZJlV9wYKQxdZHNI6J+IodGrCiwozwmVyJ/qbk12GFmI6aqvmEXl+dgwuhtnWY8kHohPtuHPtfpSzOHyCKB++K1/Ytrx9hvlsWSS5yjP0sg9YR2AhgTXNUXljtLUmiccqQcOKlBPBZWEe+JyL6L8maxXfYbQ7wz9rrEnFVWts+swoSCFZZYon3pxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NzKxGax6xy04Cd1bamgyqIaRD9vZkBSZBa3tIomVVI=;
 b=SvhpHRIhHJJIFqH1yqKa3rXHMkrNusx6F8ssHA68ZZeEOYVHmVhkpASPW1c+IK/PjkS3MAcSjO2/FhHMDjQZFcc1SpseDdggdVp0PEcMICyU2iKj/kXoISAmaKd+7vS0C0g4vB0nFuFxZYArbJ1v0sByV0+CeBzWkH3NZ1hpBp7M9LFSrgGspVlx6nU+6S7m6affRLj8XcVoVWdbCE30vyaNroHP2R1HL2TyvRtgUwNzSq6Bh+7HHy27Uj5DzYXoBnkeM5R8Q5rcm3RQL2NWM7uKcq4WZuFOuVt21PnegVOZB2a6+fhwxWPrZQW4rcnER/rT3Sn0+I0BRpspgHIqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NzKxGax6xy04Cd1bamgyqIaRD9vZkBSZBa3tIomVVI=;
 b=DpETuFhzEAUHx3tNh27en1PUBFqaXws2cggPl4t402+1NYzQm2Xazva6TyiW6eDtt38caVH7q+JKaVeVE4phMo+euoZnPkaMCFF7Ygb35mMgsMZkb9Q1ZLMmSOZYp7rn8vH5sb0MNjyDdfSJPHdS4Gflov8HQs/UwrbzdIZUCBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 15:21:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 15:21:23 +0000
Message-ID: <511539bb-bc1d-459e-bfd1-10ad8e9d1435@amd.com>
Date: Thu, 14 Nov 2024 16:21:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/amd/display: remove redundant is_dsc_possible
 check
To: Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 alexander.deucher@amd.com, alex.hung@amd.com
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Chris Park <chris.park@amd.com>,
 Roman Li <roman.li@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Ryan Seto <ryanseto@amd.com>, Jose Fernandez <josef@netflix.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
 <20241114151150.19576-2-bhavin.sharma@siliconsignals.io>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241114151150.19576-2-bhavin.sharma@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0316.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 46dae4c7-5210-4e7e-8062-08dd04bfff85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azFNbDJKK1pxS2s2ZDZQTEFFNzJCRlRVbytQck02YlFWa29icmYrYzVMemo2?=
 =?utf-8?B?SS9oY044Y0kxOG9zb1ZIZ1k5eW9BSWI1TmFYTkltY0R5Ylo5eFliUUQ0R1ZT?=
 =?utf-8?B?anQycC8wbnd4QzhJK3d6Wk5CbmVwNUxqSWVmUWJwS3ZxVCtObUNVNEhnRG9F?=
 =?utf-8?B?WlBlQVJYQ1VQOFZtZnBpeTJoR09GTVc5T0xFM1VDRTBxVnd5T2tEVFRmcHFp?=
 =?utf-8?B?bTVHd0R4dFhjS2hENy9aaFE5OEU2RERqU0FPVWh3MklrTkp3eVJ5UE12RDVl?=
 =?utf-8?B?NHBHWVE3MWdLSVFXZ3U2TTltcE03NWM4VHJocTFRT3Zpd1NPRXBqMUx6bkJ3?=
 =?utf-8?B?c25oMWNTRlJhNElEMHp2bTRZNnh4S2t1dEt0NUtvcXNobVdqNGJpVXRuZis4?=
 =?utf-8?B?T2h3V1o3ZEtuWGk3WGZhRUVpemNIZzFZclhabktoVGNaZHpnSHp3cTZKaU1U?=
 =?utf-8?B?VFJMZkd2UDk0bGNPZzR3cm9ZSFhSQmx4OUJ4aEhhTEJlcXRIRmpLWEwxWjJ1?=
 =?utf-8?B?RDBadDBQMEp3akJqUEQ3TmdQY3hqTmZiQ0Z5c2F2WDhXa2tyeVdBNnhuUGxL?=
 =?utf-8?B?NkVEWjJGb1Fsb1JrWXgzNDcveHhSSkZlVFh4THE1MHI0T09wMCtGR1Y3UTRm?=
 =?utf-8?B?ektNYmNUdW8wZUxULzlpdWNzTzhjWjdLd0JXUUxlZU9mZ2xsdHVTME5jeUhE?=
 =?utf-8?B?RHdTckZKNlV2T1lrQk5lRlRDWUtjUFFZQ3ZlZFdWUzJuRElXNEx4bFJTd2xp?=
 =?utf-8?B?NGZ5clRRUXgvMmNvd3ZWRjQ5b2U1d0N6dGdOS2cvalNUZnZxZm1LZUdHUktk?=
 =?utf-8?B?cktaN1JLTWptY1R3cjlRcHlmeXVVa1RKNFpHTzJ2QnVQNDdKUnpHRjZuWWYr?=
 =?utf-8?B?c3pUODk3WHE4RGpMWDFQYTZUSnhDT25jNlkrSzhaWmtEWmNQNDNEUzJxalFp?=
 =?utf-8?B?ZVZjb0k0dE9YY2NsUmxFNGtzTktTTjkyMnFlbFhhWXdxREFwU1hGRDZUMXN2?=
 =?utf-8?B?VnRTaUpMTDVmdjh3L3VNdVhPbHNUUS81TklMb3dwWEdBcExLWnYwNVVaNXJC?=
 =?utf-8?B?SXZjc0Y4cFBNbnFZSXV5T0lRK0N1SUpaQkozd1p3alk1SkYwdEJNZm5CdVpY?=
 =?utf-8?B?RXhqN0hCUnBoTkVkMFhoWFIvVkJEV0xUckZxZ2xrU1BiT0tmeW1PZi9UcEQz?=
 =?utf-8?B?REpvWjhXWGRDL1JIbGhLT0hwbnVpckdXRzRwK1hGdFhSSzdzdElzZG1ySG1L?=
 =?utf-8?B?OFd4V2x0eHVGMml1TGErbzhDMGFOSnVuaEcxcytURUwvNkRydU5MUjBzbnlG?=
 =?utf-8?B?Z3NpSGZKUEFSWURLMEZiZXBzcGNEaGlhclRSdEhGZ05mcEhRMlpseE1kVkJk?=
 =?utf-8?B?RDI3MTUrVElvZ1ZHeWUvZjVza0oyam5BMG05TTYvbWhQRDdHNWcwcnpiU3JO?=
 =?utf-8?B?K29lVnRTa1lBQW1NRHh3bnVBZWdnRHFSUjY1N2FORDFBaFBCQTh5SW9RdStR?=
 =?utf-8?B?cVl3V0NuYktHUkdwT3V1eUZld3d2K3hMU2lGNVpkSHJHVytDVHRSRXhUTExw?=
 =?utf-8?B?SktrbFFpM2FnOStKbFhyWmgzdWlyWjVGOVM0SHgvcnFzRnQrNVhXNXh5cmM1?=
 =?utf-8?B?Vmk1OFhqNEozT08reDRGR1F1REpDV3MvQUpGcHZlaGYrN29YdFQ4NU9lczRz?=
 =?utf-8?B?UStHZU9sOUF1bnNNOExDMmpCSnFVYjl0SFZkVkhFNGZNRlRwbllaTlc0aGl2?=
 =?utf-8?Q?Y7QjvoPRx85rAMbBG9ewryC/I3pq4K5gzaq6lt/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFVWGM5UDhSdkw4TkFHaUhjTWwxY2ZtQ0Z1aVI3TTJ4ZFJhYlZkQXE1cVZ2?=
 =?utf-8?B?SEFCMkE4TzE5dDdBc3d3SDZBNUZJOHhBZWFkeGMxZ2lUN2RyM3BZWDBsbm1B?=
 =?utf-8?B?WTcrak4reGd2RTFHckh5Rnl2dkE4aGc1em5yc3JyNk5WNVVFK2l3dmw0N2VB?=
 =?utf-8?B?V3ZjVkw1MHdIWTZKNE9kUVppSlBWR1pqWE0zRUZQZDZoRGF2eEFFN0pldm53?=
 =?utf-8?B?V3k0dEhuTVh6UzR2SDF6ZnZ5M2VHcFVyODcxWnloZmtvcTVwSUhPTE05Wm85?=
 =?utf-8?B?T2JmL0hqaFJoSU9tVE1VejVOVFhGYVV3cWVacE5IUExJQkVIZ0VQcGxYOHRO?=
 =?utf-8?B?emVDbUY5Z3RpbDEwSjJLcHdkdEZCS0E1TW5sVktDVDZoTEtENDFNUmdGVlA4?=
 =?utf-8?B?T2pid1lzM3hYVkFCc1YzbDVsdUM3azRtbldKNFZvVUZ4NXBtQjBGclZQVWFD?=
 =?utf-8?B?TDRQK0ZpQjBkdXM4bVRYMm84aS9ZTDJOcmZldlZtR3B6ODVzaXBjSDVHY21n?=
 =?utf-8?B?N0JxRC9IVi9qQ3orZkNRWVlsNHpZUHdxalBqamZOekFBK2tVZWx6UGtmTUtJ?=
 =?utf-8?B?UjZYNG1vMko0NFV0M1drcUpsQ2JQdkNjcnFDY2VVMkVJdmVvWUI0SVRGaWZT?=
 =?utf-8?B?K3I1bWFjejZueHpCSWFXZ3VQbHZQdnhNQnNmWHhXVnBtK0JLNXBsa1NtYVBy?=
 =?utf-8?B?TnkyUDlWdEdaUGpDMmswMkgyNXlKM0FZc1NVTS9QY0laSE8xZll4QUwyMGVD?=
 =?utf-8?B?d0lad1BuRUM5cUZ6RGo4Qithcm93WnJJVUFqcm45TSthNTlKSFRyU1NzVWxj?=
 =?utf-8?B?cjRJZ2wwMk1wNjZMSVhseXlBNlcxTTBXMUY2TEcxNVdyeHBQbEpPSFJ1RXRh?=
 =?utf-8?B?SmlOcldHbzkwV1FxZWtsaExRTG9UWXhNQkNZRHNKekQvanltMkM5VmJNZ1Vx?=
 =?utf-8?B?dEhLMWc2Q24wT2prbzNvajB5UGo2QlRITXZ0T21MSFBiK2ZhNzREczFEWHMz?=
 =?utf-8?B?SHpCcXU4SXAxN1ZxbDJIclNNcEtoUEpwUjZ0SzFxK1dSZjhCSGV1R2Rtc3lL?=
 =?utf-8?B?VGNIcjR6MkVOdnQ5aEpoZmtJdnpLbFZrTW1LTldsR2NtVm9mTzRtYWxUKzMx?=
 =?utf-8?B?OU5YTUJSZWk3Wk1rREhiWUFXaSthUDBXVlVqZlRiWWRRMlNrR3NRKy8zeGxp?=
 =?utf-8?B?QnFGMkg3YkdKd0RaWlBlRW5jNlV3NGNQOE44cnU2WHBDREMwQjREVjJhQW1n?=
 =?utf-8?B?ZGJKNW1WVEZDN2w1RzdTc1l3ZlFPYUQ4eThxa0NIeG44WnpjRTZGVndFUnRF?=
 =?utf-8?B?ZndmSWxKQ3RFSWZ4U0xmYTlzMmplbkNJMzZ5QzBqRG15ZEJScjcxRUVra25S?=
 =?utf-8?B?enZhWlg5TVY0b3FLSHlBVGJaMkZTQnBnL0tHVDRZMndmcDFXVzdyUjF6WEp0?=
 =?utf-8?B?Q1J6T3pGRnVCczlpK1FKMWs4dWxLSlpaSm1BNkt1dnFudVRPeUgwYW5GMGpT?=
 =?utf-8?B?a1NuMFJMeEVZTStKREFGazJIK0U0dnBDdktSemRhUWJETUt0MW1JOFJlVXhr?=
 =?utf-8?B?V2g4M1pLT2FlNENwanNOdVJaMzFkd05KTVRiVE1XZGVMTk5ocW5XZTk1R2k5?=
 =?utf-8?B?MUNzczJ0a2h4ZmM3OHNzTGVkNGZibjJ0Qk5MeFVoQUNvdUdIdU01SVY5WlBZ?=
 =?utf-8?B?VjRlMUlCU1RCeGtFYzNMK0o5MWI5c2pNYzcxcVdtNWN0bEU0c1YwR2NXM3B2?=
 =?utf-8?B?NGlRQzM1NGg5K3RQVStDRmZWVEVMQkRmaWhVMVpiREt4TC9Id0JUVXhTRTFu?=
 =?utf-8?B?cWJ4QXQzUUJLanFnY240RGFYOHlIZm5FcUFUSFJ6M056STkrV2tETEU5YytD?=
 =?utf-8?B?UWRsT0VjaDliYjRLdDhZSThkTzZzazhLOXlHM1FHaXlVZlorcldXOXlHUURL?=
 =?utf-8?B?TUNOQVZ5dzQrL1l5dzBab04rSnJGNXpuUy9kMCthaGlJUEh4MzBrRGVNU1lx?=
 =?utf-8?B?bFNZTFNHeDFRallhS2JrWTQ4bzd2NnI4Y3pqajFZWndhSFhGQyt6b2Qwd3lv?=
 =?utf-8?B?M3N5UTdWQm1CNHd5dUM5R3RzT0tPY1lNL3NUNGRsaDVpSzFMalB4TzZGQXRM?=
 =?utf-8?Q?H6ik=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dae4c7-5210-4e7e-8062-08dd04bfff85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 15:21:23.0937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/jyUUcgIgR1EHCnJD0+nYYN8fT3yor0As6u93RrWL+DIxNN8zLJHUS7/X/IB/zc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
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

Am 14.11.24 um 16:11 schrieb Bhavin Sharma:
> Since is_dsc_possible is already checked just above, there's no need to
> check it again before filling out the DSC settings.
>
> Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
> ---
>   drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> index ebd5df1a36e8..85f6f8e43947 100644
> --- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
> @@ -1093,14 +1093,11 @@ static bool setup_dsc_config(
>   	if (!is_dsc_possible)
>   		goto done;
>   
> -	// Final decission: can we do DSC or not?
> -	if (is_dsc_possible) {
> -		// Fill out the rest of DSC settings
> -		dsc_cfg->block_pred_enable = dsc_common_caps.is_block_pred_supported;
> -		dsc_cfg->linebuf_depth = dsc_common_caps.lb_bit_depth;
> -		dsc_cfg->version_minor = (dsc_common_caps.dsc_version & 0xf0) >> 4;
> -		dsc_cfg->is_dp = dsc_sink_caps->is_dp;
> -	}
> +	// Fill out the rest of DSC settings

While at it you should probably replace the // style comment with /* */.

Apart from that looks good to me.

Christian.

> +	dsc_cfg->block_pred_enable = dsc_common_caps.is_block_pred_supported;
> +	dsc_cfg->linebuf_depth = dsc_common_caps.lb_bit_depth;
> +	dsc_cfg->version_minor = (dsc_common_caps.dsc_version & 0xf0) >> 4;
> +	dsc_cfg->is_dp = dsc_sink_caps->is_dp;
>   
>   done:
>   	if (!is_dsc_possible)

