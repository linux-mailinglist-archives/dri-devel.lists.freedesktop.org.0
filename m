Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1638ACEC01
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0210110E7E8;
	Thu,  5 Jun 2025 08:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xqyPfPyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A910E7E8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 08:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wor3qFdjYBGp1FkR/AGLHAlTw0wu+V1DnTrKcKb1X9NQMzKDdVVpvOqOUy/vJYpey8uiZQujNYS1Bih3jisk5fEhjlJfMtIgAVEDUSImFOh/V9buhNiU23o3jl2cgkaLG+cl3r4k+owZfQ/4L786di7DTcfdS67VREcK9OFO83UlqRqKYpWL0C46DHFvAcl0S/8lx3DQNYSNkWlWzXF4tU8Pan5AN559EZC2UvyrLSsAnZjghs/wK5At6ATb6S/mkCeziUBbtnkZgnF1qiqVDuMsVZu4ZEa9KTLYyLjJ/bR6civMO0jr01X9I6sZnCCyj88lACLkmAKxGkDe7dCHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdO+YR4XsFpOfM4P5aqZBA1qgHJ2lR0HLivGOT7biAg=;
 b=N6hGDmLZyItb0irVqbugzvhH0h/bgaFKg4LUcjyglzk7VgMy+1i/IN5pc1U8F9iGP9V0MhkBhqZ64iVsdwfh1LP22UePXfB8dbiA0H+CA5EeCY4dA3IMer+BMldutA9C/1FlKqXu9zNulQ+OFcmq0hhbERpluANuAprRQVorDWkf3EnCeYBHjJuZHsUUTFZCP79jNOnxhDulxkAgN0FaT77fglw5xG3FA1MWrMM/7mdU9R2cjkZJ0wGLD2WIhbfEHgvpgVUJrU/Wxw+XBjxSjRhCxF0IhveWLeLFWEfTarJnbYUENDSkNoxqHASB0gweGbo3Rdj1Mtea6x8iUXCPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdO+YR4XsFpOfM4P5aqZBA1qgHJ2lR0HLivGOT7biAg=;
 b=xqyPfPyP7vk9Mmijt+kX21eYK8E/fBvpyidQ5nLAwL3BTxkZjF0Qc7gcXt7dbQyWUFAHJDuG09wZnmA1ig3vuJWGbEQprjwyyWUdFEWX/mpRQX6xis86Y7X5r2/IPbn/qbtH4w2C+c5UcQLRrLltDj/SWpcs4Cp8JDjsIqAwUPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Thu, 5 Jun
 2025 08:34:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 5 Jun 2025
 08:34:17 +0000
Message-ID: <c5b05a8a-10b3-46e1-9841-d335f853320d@amd.com>
Date: Thu, 5 Jun 2025 10:34:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/ttm: port ttm pools to NUMA aware lru_list
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20250605061951.1234583-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250605061951.1234583-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0015.prod.exchangelabs.com (2603:10b6:208:71::28)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 155ca071-b185-4764-3960-08dda40bc289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmdWWU92MWdaVi8yT3gxWVBSc3NKK1AxZ3J1WndkRzJ6Uktsa1dOclc1eTdw?=
 =?utf-8?B?cWtlV1F2Zm1ETi9Va0J5R0tQK0p4MGNPeFZuaWp2QndnL2hRdkNWMm0vQkJs?=
 =?utf-8?B?Q2tlVE5DbUNjRHJncElIMFcybUJDNTFvY3NLa0tYTkFQU2NjR053ays3cVB5?=
 =?utf-8?B?SjFlbXUxS0VoU0F0eUJESUVGd1hiUnJHVTRHN1Exc2lrZ2NtWEZ4MG1XemFK?=
 =?utf-8?B?Z00yMkNRZWFUazBBbkdNbFNzS0hEcGVScHpWZWdWVThkS0hhOE5LYkZmcHpF?=
 =?utf-8?B?di9HWmRvaFdkWEg1L0tWb2cvWXh2VzY0OC9UOHQwczEyTFFHQnJqb0VkeHRn?=
 =?utf-8?B?NjVMVUF0TnJaOTJWYy9lODZTZlQ4YVpLWjRLdjFFdStSRGFWZXZXMEo0aUlw?=
 =?utf-8?B?OEdsRkFIUGFHSjF0a2NGa0prUTBvaEliZllFSHhNcjI0dWEyQkg0Zmh2TUpz?=
 =?utf-8?B?ZDA5L0tJOVFSWUViZzhQQnNkV3hNbEkzaysweStBM0dNQlJQa2ZSS1RpZmdY?=
 =?utf-8?B?KzVXMlprV2tDTVNrc2ppRWhNSnNXeEpBMHNNZWlJbHlMT0d1RlZDaVBDdmx6?=
 =?utf-8?B?SG1qL3NkZEp1V09Xa3FZU0RETzlqcUhhM0tvTUs0WHBSUndoR3RzODFESEpv?=
 =?utf-8?B?TDJQMVJTTGlBWWYvakxyZGJJVHBBRWNXeHoxYjBtY3V6NDI5UDAvbmdZWURE?=
 =?utf-8?B?amo0Q2NnNEN3SzVEQTdRTDQwWWMrWDVPY2FGZlFNM0JBWXlQWE81NTNDamtW?=
 =?utf-8?B?M2twd1lBQ2xKR0pEUElZVnZQUU9taDY2L0JjL3dmbEVZQUNUSUM0amd5SkM5?=
 =?utf-8?B?NmJXeXQ5WmlLTmRVRGl3QUtheXNTeWdMMjR2dXIzVzk5ZDloTGRYN1cxdkhE?=
 =?utf-8?B?ZENwdzU1bWxpTWZ0MG4wbWlBVThHUGZHQ3lWWHlaSnduWFlaZW9XRGU4dmhE?=
 =?utf-8?B?aCtPc0RsdysvcDFZU0Z1bzZYdjkrRUdoZmJGOWFTcmV2SlY4c012NWkzTm4v?=
 =?utf-8?B?c1JCdVk4cklNMXNFeTNIdlVOOVp4bzh6UENnckFRdzBjN0U4SUxNMEpYekZP?=
 =?utf-8?B?bDJ0bDBVaFM4UnpqOHlzeFRBU3Z2YldCcVRybUVJRVFsTWNuRXkzRVZzTmts?=
 =?utf-8?B?bmxNcm5RN2pNbXJ5TkZpZk5UVUIwa0M5WlJFQlNveXRocWVrSUNibWgrK1c3?=
 =?utf-8?B?RW5oOWdVM3UzdkNVYi9yM3pOc1E1SWxWKzFFVWtua00vSktkZkVpTWdjZnFM?=
 =?utf-8?B?KyswcGpndTNxTmpjT3BYT1R5T0JnNlFuc1RYNmk2Y3FtTlZCd1RUWTN0YnVS?=
 =?utf-8?B?NEdIdXBXQTg4NGluSHlTWWdsaWFVTnMyaHBIb1Q3a05VeGVKZlhNWlhlVlZM?=
 =?utf-8?B?azFPQUNGM3l0eitjMVQ0MTUzRTMxNEdBTklrV2FUQmlJbzlwMHBCaW5majVT?=
 =?utf-8?B?d0lwQlJFWUJFaXIwRDFvSUFXcEd2R2xGUllHNUpsVy9yUVNuMjRtSmx1Yksw?=
 =?utf-8?B?NmVqNi9XQmJvb01Hc3B3eEdBMGs5YjJ5MnlWQzFJaDRoTTFBUXRSdzZ1b3ZZ?=
 =?utf-8?B?MzlpMWZDQVJlNlNLc0JkdWduaEpDa3paYU9YLzRVYXl4TzUrdE0vKzJyTUFI?=
 =?utf-8?B?UzBpazhiUFEwLzlOYkxDdVpGWWZFZnMyTWtnMy9oTlhLNzdpeVlmWlV5T3Z2?=
 =?utf-8?B?MjQzQ3dYcnBrWkFHMDk1MGV4WndLR0pHYmJ6cnJYdkRQc1dwaFVqOFlJd3ZB?=
 =?utf-8?B?WnU4eHRpMTFKZjljNEpBUStMM1lncS9maVFsSWtHZDBDZStjSmFia1pvWVh0?=
 =?utf-8?B?Q2VxVGRnWXgweUFVOHdKNXRYZzNYMHFJRUEyZjNPTGlZamVYRkxvT3VYeTAy?=
 =?utf-8?B?Zmpuak44UEtMUTlzdkNwRjlwck0ycTNUZHJpUGlySFB0VlJSR1g2VVZYT0dB?=
 =?utf-8?Q?sUj1IgioG2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUxOaDAzM1BneEtmVEJCa2VrZ3FEaXY4MHFRc3Z2UjIxS0FOUjZOOEtqZGdq?=
 =?utf-8?B?VnJyTnEvUGNaZmx2T3VlZCtLYW8vTVdIS3BBSVZVZ1hCdlMvcTdUTzlDWkZK?=
 =?utf-8?B?MjRxL29yU281OUdYRXBSNGIyT2lYSUVTazNOTU1tUU00NGhCYmVmY3Q4T0JI?=
 =?utf-8?B?YVNxbmQwRjE5ZzdaODQ3VUZoWnJUdFV0TmkwRHNEVWV1N0JLZng1b05SOG5F?=
 =?utf-8?B?Z3lQcGVyT3pMUHovVlFwbkdGcmlFV2dVMFVZUDRSM3AvOVUyVEJkRDBOMlF1?=
 =?utf-8?B?bnVIbXZmZysvZ1BDSXlIQ0loVG1HYWZ1a0ZmM3lwV092ZVlvM2dzbTRvYjA0?=
 =?utf-8?B?L29vRzlldi9Fb1NOWVRINW9Xc0Z3VmNpM2xyUHNnczhkN2JiRlRSY3AyQUhZ?=
 =?utf-8?B?VGdyZmRML0pNbDRxR3RiYjAyZ0tTMkhUdHU2YTZQdTJ2T2dISW01YmtNZ3Ay?=
 =?utf-8?B?T3Y4QzhEVHorL1ZNUjZPTzJLbGErRUNPd3Ewb2VoYzhYUklka2lEQ0xpNW01?=
 =?utf-8?B?VFR1ZnAvK2pyL2N5Q3BlRktJUVY4cjJzenk0UjhWeFlSNWlIOGRHS2lkK094?=
 =?utf-8?B?NTJXWWUzV2Q1eDhPU3k4RmpwcW5iQnhVMGQ2NkV4TEpJajZqZzRSNnY4R3pE?=
 =?utf-8?B?Y2xQZkFlWDVnbElmTDRPRzhIcXFzd09NMlByL2tFL0M5bDFjVkwrd0xDZWhN?=
 =?utf-8?B?R0tOUGZiVk5LT3E0dWlqenpVSHpDY0gvYWRDOExtQ3ZFK3o4dXNtSTNZZnpL?=
 =?utf-8?B?UXJoK0x3SVduNlhGcDFsRTcrV3p0aVdOQTIwdWQzdURqVzNUVFRKOFpIa3dz?=
 =?utf-8?B?M1RvSkJ6bGtrOTJIaFJuYlVPQ1kzY0l0QmV0YmVUTlc0UnJEdWlZTnJPZXRt?=
 =?utf-8?B?VjNJTEQ1MTRGMGk4cDZ0RXdwMlNGTjltcEs2NmJja1k5Yk1OaVUyQzdRS3VC?=
 =?utf-8?B?M1FTQndBN1FUd1VxN29VUXRnOG9qUjRqbG0zZ0dpVi9DckpXSTZzUmlaQ3Az?=
 =?utf-8?B?TW5UNEp4ZUhNNVFNZUZudFdrMG5idFZjcE1aMnVwdnRycXpmaG5aNHBzRjQ4?=
 =?utf-8?B?a1RYUG5ZREp2OHY3WjA3MndEbHNOUkJ4OWZwVTR1bFpwbDhEWE85N1NHbUhR?=
 =?utf-8?B?UE5GbUgxZ2hmbFRUS1NhS1Z2Tml5M0tMYWR2R25KTFIrZzVRM3dPN0xVaTdj?=
 =?utf-8?B?cmwyeHFsOFJiaVlhajROZ1BnVmkybUZpOEJibDVTNitHZVliSGZpTzR6Tmly?=
 =?utf-8?B?M0F1MWtDc3FhejhWc0xoeGhHMXlFazBiVUloZXhZQWRJTjBTZ0dHS1V1TjJI?=
 =?utf-8?B?TlByZUpPamdSUkdRRm1ERHcvMXBveTZUZFVIMkc3ZTM2aklER1lYWERHUkIr?=
 =?utf-8?B?b2dpN205WjF0WXQ2eEp0bUFHdDcrUGI4MTlwSUZUWnVPd2NNa2w4UHVsbXlm?=
 =?utf-8?B?aFBTaUpvaWRwT05JMllERlpjandaVXF2djJickxPaXRtcC9TbDNpVi93bkZs?=
 =?utf-8?B?WFdtZ3lxVVg2WUszZkEvSWFFVDBEOHp6UmZyN1pKc1V2ODdvRU85bTI2ME83?=
 =?utf-8?B?a2lFSDdBaVd2Mm5RcXJ6RXNWRjFjcG9pS3V5ME1iVHBxMi8wR0gwdy9MdlIw?=
 =?utf-8?B?aTBGN0FaNW01WWFmMXdKNUg3bTlVUlMxNTZOZUk4a2JqRnRqOEpkakZxdVFm?=
 =?utf-8?B?b0lrVUtUQ1pMRm9QdnM5VVBkdWU3Z2h5SEE4OUtnQ3Z6UHU5anFBMkIwRHd2?=
 =?utf-8?B?Y094WU9GaVQrQTAybis2N3RJMWdOczlCNFlrbG05dmMyRkQzcmZBT3IzV0dR?=
 =?utf-8?B?UklzeTVXMDlIMElramtJZzB4QXcvWUFTRlJhc1N5ODdtUG8xVHozcmkxcGpl?=
 =?utf-8?B?WlF1aHNMS2hyaWFKSGFEbjRNbVB6RGNOVHlOYmxjdU1TNW9nL1FCK2s0RW5J?=
 =?utf-8?B?UlR2eHhOYnZLV04wZSt2YWFrOGhXa0ROVDQ1c3cyNm5LSmlneXIvK3I1Y3l0?=
 =?utf-8?B?T1Z0WTI4VkpPSVQ3MXBuREIxdjJxZnVtRm1HR01qUjhySG9qNG9Pdlk3a09v?=
 =?utf-8?B?TUxVTXpqU2xRcGJpeHJrWk1BU2FyUUFicGNtV1RnM2dTU3E1S2hiUHFGNlRJ?=
 =?utf-8?Q?hcLb/VjQztyPodwkV2VAPQto1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155ca071-b185-4764-3960-08dda40bc289
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:34:17.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vBpjKDXdArz8d6japAAH7LEoLK6KmCPFczfN1eKZRmYEq33WtpkNNad/GGB1Fta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
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

On 6/5/25 08:19, Dave Airlie wrote:
> (RH email ate this the first time).
> 
> This is a bit of a tangent before continuing the tangent that is memcg aware pools.
> 
> The pools code is already NUMA aware, but it rolls it's own numa awareness, and
> in order to move towards memcg awareness, I think a first step is porting the pool
> code to lru_list and making the current shrinker NUMA aware. Once this is done
> then the next step should be to make the pools/shrinker memcg aware.
> 
> I've done light testing of this on a single node rx7900xt and a 4 node MI300A,
> and it seems to operate the way I'd expect, but just wanted to get some feedback on
> the idea and if anyone can spot any big problems with the strategy.

Since the list_lru_add requires the RCU look I think we can also nuke the spinlock protection since the LRU is self protected, isn't it?

Except for that and a few style nit picks it looks absolutely sane to me.

Regards,
Christian.

> 
> Thanks,
> Dave.
> 

