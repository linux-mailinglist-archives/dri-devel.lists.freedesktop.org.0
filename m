Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48BA59435
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779E010E410;
	Mon, 10 Mar 2025 12:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FtbMLGFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA9A10E410
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+vdYLozWzMLbUqUHe6gMODoqOJ6WaScm2lxNjW2EXxBf8vCwt+HNAR/dRfQVyTRZQj6WUbnRQPHvFMc4Jr9wm/JYA32qS7FCuz/GbiC4Xu7ygP/UFfMnm0u/+tDu48Tms7z1frH42RKns2TYiiZlJheZpPmgXA2/tyV1NdJ+6U+p+pmtBOk6pzeBbGAF+pK3VMSW5VhAp4ZPFpV5GfqALt/0h+jdVDRz4BZFJ9pAK0NAlWDbJ0kG+lKwGfKfYTyVCprXQ2ehuM0LlrL/fxBMF2s93nzDFEjUdNIWe2BCiN6hKcTQq0YfHkjKIkUu8i3jii1HaR7cenf3MET1hQ7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5ZPDxdQDSsoAB2qL2NMFx40uzJKBlaqrm3h7psIjSA=;
 b=SRZBZImZ/Tfrccg1T6QUlT68Vid62Bb8CtW7CnFdewqfC+o1KYPWHg4hLqCGxW+S78UVAy7DN0+nSZoH5c/7B5FgjUwB2aKrW41i/zKboMtimU18WhonYzapQT3nRH+2Z7MxeXcQy948jw3VZj97TqcmtvUnYn0LV9L0Qw1h3A+HLwZeNAPiCmgsdDd2rg0ymPsb37bsBqLyN0cyBjnSumSPcdIsX2T96KietHewsNuzpdjM7Qaj82Xg77NJDh5NWofnRwi6vJAp5NKkgOmLcKv+vSDkr3JzP5aSX5U2GFMeAt7JiZcuBVzKtv4I+YEL/DG/Mg/WyEOw60f9S2ft+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5ZPDxdQDSsoAB2qL2NMFx40uzJKBlaqrm3h7psIjSA=;
 b=FtbMLGFMR4tfyBMtlF9b7rO3NZ6ouCNyWJYrfE1DpZY3vO7aRWUQVtoIGdQiNTGLolzobpMfK+Gng0mdTO3u76/RY+Ik9Fpp/jfWb6dW7APFCGATofKgPhapon9BlSvnz5rvJkOIiod4dPZsWJaZ4bSshh2SvOvl4uWjUBOPxVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:25:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:25:14 +0000
Message-ID: <4269639b-56e0-4f44-8485-6120eeaf28e5@amd.com>
Date: Mon, 10 Mar 2025 13:25:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct false
 doc"
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, matthew.brost@intel.com,
 dakr@kernel.org, tvrtko.ursulin@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250310074414.2129157-1-christian.koenig@amd.com>
 <564be70f7d64c04c1ad77499522d99c64ea4d4d3.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <564be70f7d64c04c1ad77499522d99c64ea4d4d3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 908fb318-82ff-4518-9f5c-08dd5fce9c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am9iMkx1Rjk4YjQ4MlJieFJUa2s2SCtLQkZrcTVZM3FTZGF4eWM1dUp5SDdn?=
 =?utf-8?B?WHdkU0piYXhocFhOcE4zd1ZRdEh4TzB6V3hsNnNiSGtPclZpdFJYR2VzZVgr?=
 =?utf-8?B?NjRIOWtiWWJKSE1HTUpHSEM0R3pIb3pvN3FReUJBZkt3VVVETmkxN3QxQ2Js?=
 =?utf-8?B?WUxtQ1huWUIwTFhkYzNONDVIS0JXYVFkL0hyUklxblBML0g1dE8rcmMvNmtS?=
 =?utf-8?B?aWlxcXZnNmxacFA0ODBwbzFrMHRHVE5ockFBbjlHbmlrYXpNM2lKWFZtWWRP?=
 =?utf-8?B?ZFJQM2JDZ3pFQlh1S0xjZjF2M3NIL0hkVEJIUWQwZVJLaVl0aStVeHpyVGxH?=
 =?utf-8?B?SE94Mm5wanNOT1k4QkM2TWZTSEhzdlUrdTFOV0trNktvcEtvVXlsWHZBcW14?=
 =?utf-8?B?cUlVdUJHVTJzdkI3L2RBdUIrTlJZR0tYaVNXZWpYKzRyVVBBMlJ1VnpwT0g3?=
 =?utf-8?B?MHFmNTBvaGdkbGN5enFhLys5WTVLODZaRnJCTk9VL2M2VjAydWkrelpFOXY5?=
 =?utf-8?B?ZlhrUUdpeHRqNE9Na3RZS2pYajllU0pUNU5YcFY2Z2xFUnJXM3hkUEFIa2NU?=
 =?utf-8?B?MjI3c3Y2N21hNGh2UkI1Zkl3Z2JITGh3b0pnYzBya21VeDg3NEpGNmlpZzRN?=
 =?utf-8?B?SUkrT3I1M3U1RXVwVWhReFk1OTVPNU0xeFJHMjNXbzdMSXphNjdCMVdKb05D?=
 =?utf-8?B?RVFuNGdUaTFWSXFmR1pRcHRqc2hTakhlWkRha09ra1dMdzM1QmpsS1FtaGNu?=
 =?utf-8?B?NHZvL3lTQ09SdWlvYXVGSXhoUU1FNjVoRUozaTlzZ2tDSkxySWdKRVJ4MGZx?=
 =?utf-8?B?cUdLbUhmaDU1Z3c1QUxjcHFLQW5MamJGTHRFdDM5dHo5em5DSlBSei9lUW4r?=
 =?utf-8?B?VnZXZTNXUnQ3ckt4MkU3dkowZGdvZzJJRllHTUxWU2hSV2VVT0F4d2ZwTFl2?=
 =?utf-8?B?czI5c0tRa3ZUWW56ODQ1c0o3Q2RyK0VBQXJFa0h0NnByZ20wODEwR3JGR214?=
 =?utf-8?B?VXhLem5RYVV4V3NhZWFERnZMeFlndEZoYWgyZG54ZUYvWXppanBUaW5weVVL?=
 =?utf-8?B?ZXVLMjhVU3pTTnR5QXJ4Q0kxU0lkclJmaG9UYUlJb1RURzlQUCtoR3kvd2VW?=
 =?utf-8?B?UG81YVhSZyt0SnFmRU5vTzNvSU5sZ3Y5MUptSE1UKzZkVm05L2dMVC9Ganp2?=
 =?utf-8?B?OS8zOVc0Mm5WZFhSSWNVTVlJL2swUHp1MllZMlFreWVrY0d5WEhsMFZYSjUv?=
 =?utf-8?B?TmpaSCtDaXNkeUI4cWFNM0JsYkhUakxGTVRId0cvWGlEUjViUWh5aVAxam9H?=
 =?utf-8?B?N2ZvWGhJeGVoN2xDV3ZabzM0bHRxdlpBdndscE1LYzBRVlowM29JUVEyS01q?=
 =?utf-8?B?UlZCMXFCU1ZPLzRwbXdYR1k5TENsem5MSU9NUlhtcjdBRGR3OXJDQVlUZjND?=
 =?utf-8?B?SmphQ2pqQjdWd09iaVVlTDZYK0VGV1BCazNub1NIbkVWTXpjMG1KcGZKY1JY?=
 =?utf-8?B?cThUYkFpVC9uVzJ4WmR0UmtPVjBkZ1NBTUNUd3QxY1dSYWVpMyswdkl3SGNE?=
 =?utf-8?B?ZmdVRVZQWXNKZ1FVUWZ6eE1xbDExeDNnMVpzYmFOZ2kyTUg4R01EOEpBL2pt?=
 =?utf-8?B?REtzTjVjRDRoL0dNOHY0Rml2am9iSlBYSHRrWkIrRWpOSzdoSzR0UVB5SVNP?=
 =?utf-8?B?RlN0UVBEMFRFTVRlVE84SFVEK2VSNXltM0hNV3F4cTNISnJKWUgveWttSmhi?=
 =?utf-8?B?WVQvUTc3bTN3Y0RnUEhvd3FUYnQvUGllQXBOT1JGeVJYT3d4RWIycHczVVpt?=
 =?utf-8?B?QjdvdkUwOC8rVmdlSkF5eElsWk5LVUtvMkR2bFdRODJNenliZ1RxakxmQytX?=
 =?utf-8?Q?19NW5s5nKMLJv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW8rUkVIdldCWWoveWZ4Qk1YSTdWWC9MZXQ0TkNmQTVXVUgvR2hpOXYvVlpX?=
 =?utf-8?B?clZVWEFaUUMyRkw3OWF1RHFoR1R2VHRJdUhTWm1wRXFtTnpwbGJ1bk9wU3N3?=
 =?utf-8?B?RTdzYU42WGw1cTRrUzEyZmNUc0Y0UzBhTVFXMzJZNDNiV0FvRjFGdjh2czB5?=
 =?utf-8?B?dXg4MHYvZVlxMVpSdFR0VjVsTTEra0FJa3lNVlpacWw1NjJYVk9VMXZOdVhp?=
 =?utf-8?B?S0VFcVgxRllsdFBzdkJRUjV4ZW9kaUpRVGlkTTEvNGYwR3lndjdUZDFHeEpX?=
 =?utf-8?B?c3FwQ2pZck5WSWc3NnI2VlRoOTVvaXVPWG55RldjYXVFd1FWYmg0N29qc2l0?=
 =?utf-8?B?VzBTc0lTektBc0tPdStWck5WMkEyWHNMVFZPRXMyZVNDKzZPQjJYV21Rb0Qy?=
 =?utf-8?B?SFdxV282TmNQc2t4VGhVS01adHBnWFhNWHRoWDhRaEhadCthOXJ4WEdLaHd5?=
 =?utf-8?B?Q2NTMUxiSGZTQURqOGJ5YTVKTTlwMmJUOVovUGlCTEsyeXVRUHVQa1VvNkxF?=
 =?utf-8?B?N0Z3SDBEaytGbEQwRWdMU1dyc0xhdWkwbE9ZOXQwdXJKeW9tTUIzZUwxSXFl?=
 =?utf-8?B?V0hjVmZ1cUtIMVozNCt3VjlYVXB2WFlGYkRpaE9nc2laNlJWQXdDcGNBT2dq?=
 =?utf-8?B?OVJNUlhwb09rVGhLQlNSZzhJVFdVRit2Y3B5L1dXaithdHQ1S1lJNjN1ZW9t?=
 =?utf-8?B?dU1peDNxK2lzZytGTlZPbHoyMm5NRWNEZElDN3dZcHRmWFA3QjkrV1ZQb0Nz?=
 =?utf-8?B?NmhISEY2WThZTU5Jb0JSclNqd3pMbVFMU1U5cnZjQm4yMUh1RlNiWjVwZWhH?=
 =?utf-8?B?MUE1S20zTHk1M2Rzcms5TXpTdVFLUzFhb3k3WSs0ZktQV0hEY0JSU3hxTGxY?=
 =?utf-8?B?NmhOMjdIeDg1c1NLQ1BRaFl0eDkxZEpGZHlJOEVMZjFBWi9WVWlWZEcrcFBH?=
 =?utf-8?B?UWVlWVQrYmFNNjdXUUV4ZnRjRnZscVpERFRLdFVnbERQTFJUYVpEY2hXSmFY?=
 =?utf-8?B?Y2dvL1g2MlF4SFZBUUtYQVUyYzdENmVWNnR6b255a0h3a1kvN29TVFBvdXhG?=
 =?utf-8?B?dlpnWWhBY3dlL2tQTk9tN1g0aS9qdlQ1ZGZOODZTVkx0bFdTV1hNOGtkcURr?=
 =?utf-8?B?RVBleTN0LzE3cklZb1JXKytENThoMnJDd0ZzZkdOL3BaVlJ3YXZ4Ky9sU3hH?=
 =?utf-8?B?UU9YcEV6Nmp5a0lCbmI3alNDekVCVmpyTWE2RzNFTjUyemdaUEpKQm5EN3dH?=
 =?utf-8?B?MTlMeStGbHR3OWp3Rkd1Nm9CeFRyMVJacjNUbllJeDduQnVZOUNVSGk0c3NM?=
 =?utf-8?B?VitiSDVEbFdhbTkrekZaamsyTllmeFhpKzlybUxtWmFGSzZNMVlUdks2d1Bu?=
 =?utf-8?B?SEp5VldadHlXQ2N3cVB5U09GMnFDeTZkTnNVVXpHdDkyci9sYkpGR0ZuRGpy?=
 =?utf-8?B?dUpheGlScEZ1TVQ4enIzcUhvaG5LUzRkMUpBUGZFV094WE5XWEdVaFRTczIw?=
 =?utf-8?B?QjIrZTdpTWtweHY3MzJXQThzTXV5cWFZY2pNSWpCSm85c3gzU1B4QzBuYXJy?=
 =?utf-8?B?dGFTZlJtdmthTE56WkRySEhHOVFEbG53L2hGZUcxSW4ydEl3Zy81WitwYno4?=
 =?utf-8?B?eVFFWVZkZTRsRWhaeFpJTDIwczNVMytBR3dXSTU5aCtyNTFYcnN3YVA4M0Nv?=
 =?utf-8?B?ejhYMll6NUtIUUNBbmVFaTZGaFlDRjdtQUlOK1BWRFdnU2FxNngxTE1pTjl4?=
 =?utf-8?B?TG43c0g2czRmQmt0OTVJdEJyN1VjWjZ3amI5VURnSnd4K1VUcUtDU1NRYk9t?=
 =?utf-8?B?NVQ4WklSRWdYcUlwS1REdGRMVVNvbmVkMENoMEt5MkhTYVdjOEgraW9mU00x?=
 =?utf-8?B?TzBrdEx3UWxBeitaSEt0OURNOWc2bnZycCs4QTBtYThyMUQxVFA4Q2xNT0Zz?=
 =?utf-8?B?QVhyT3dvSWJNQytBQUQ1SHFCN044TVZxTHlncVU4VUR3YXhTWVc5VVhwT1Nl?=
 =?utf-8?B?Z3FwL2t6aW9WeWVvY0hhaHZ2WnlsUkN1U25tRUU0NWErdWhpajRZTVorRC9m?=
 =?utf-8?B?Vk53MG4rVFA4ZzdWcUpsSUVrUEd5VHFTNGMvREhzUjEwN1JTdTZROVNPN2FH?=
 =?utf-8?Q?01aeSXWR9sSfmvn2Mk07D17ja?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908fb318-82ff-4518-9f5c-08dd5fce9c57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:25:14.8948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFIgsczKVDzJFMpuby1DahTgvPrkdbg/zadAr1xRNmqddA/HfydseyGDyWNv2Hfz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226
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

Am 10.03.25 um 13:11 schrieb Philipp Stanner:
> On Mon, 2025-03-10 at 08:44 +0100, Christian König wrote:
>> This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.
> OK, your arguments with fence ordering are strong. Please update the
> commit message according to our discussion:
>
>> Sorry for the delayed response, I only stumbled over this now while
>> going
>> over old mails and then re-thinking my reviewed by for this change.
> Your RB hadn't even been applied (I merged before you gave it), so you
> can remove this first paragraph from the commit message
>
>> The function drm_sched_job_arm() is indeed the point of no return.
>> The
>> background is that it is nearly impossible for the driver to
>> correctly
>> retract the fence and signal it in the order enforced by the
>> dma_fence
>> framework.
>>
>> The code in drm_sched_job_cleanup() is for the purpose to cleanup
>> after
>> the job was armed through drm_sched_job_arm() *and* processed by the
>> scheduler.
>>
>> The correct approach for error handling in this situation is to set
>> the
>> error on the fences and then push to the entity anyway. We can
>> certainly
>> improve the documentation, but removing the warning is clearly not a
>> good
>> idea.
> This last paragraph, as per our discussion, seems invalid. We shouldn't
> have that in the commit log, so that it won't give later hackers
> browsing it wrong ideas and we end up with someone actually mengling
> with those fences.

Sure, going to make those updates. I just wanted to give people a possible direction to look into when they really run into a situation where they need to abort some submission very late.

Should I also clarify the comment in drm_sched_job_cleanup()?

Regards,
Christian.

>
> Thx
> P.
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 53e6aec37b46..4d4219fbe49d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1015,13 +1015,11 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>   * Cleans up the resources allocated with drm_sched_job_init().
>>   *
>>   * Drivers should call this from their error unwind code if @job is
>> aborted
>> - * before it was submitted to an entity with
>> drm_sched_entity_push_job().
>> + * before drm_sched_job_arm() is called.
>>   *
>> - * Since calling drm_sched_job_arm() causes the job's fences to be
>> initialized,
>> - * it is up to the driver to ensure that fences that were exposed to
>> external
>> - * parties get signaled. drm_sched_job_cleanup() does not ensure
>> this.
>> - *
>> - * This function must also be called in &struct
>> drm_sched_backend_ops.free_job
>> + * After that point of no return @job is committed to be executed by
>> the
>> + * scheduler, and this function should be called from the
>> + * &drm_sched_backend_ops.free_job callback.
>>   */
>>  void drm_sched_job_cleanup(struct drm_sched_job *job)
>>  {
>> @@ -1032,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job
>> *job)
>>  		/* drm_sched_job_arm() has been called */
>>  		dma_fence_put(&job->s_fence->finished);
>>  	} else {
>> -		/* aborted job before arming */
>> +		/* aborted job before committing to run it */
>>  		drm_sched_fence_free(job->s_fence);
>>  	}
>>  

